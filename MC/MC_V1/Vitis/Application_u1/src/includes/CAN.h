#include <stdio.h>
#include "xparameters.h"
#include <xcanps.h>
#include "xinterrupt_wrap.h"
#include <stdint.h>
#include <stdbool.h>
#include "xil_exception.h"
#include "interrupts.h"
#include <xil_printf.h>
#include <xil_types.h>
#include <stdlib.h>  // For malloc and free
#include <string.h>  // For memset (optional)


/*

* Make data-field filling logic of CAN_Transmitted_Message.DataField_x more concise (CAN_Transmitted_Message.DataField_x[i] = (DataPtr[i] << (byte_offset * 8)))  
* Make parsing of transmitted and received code dependant on the DLC, and not just a "max number of data bytes"
* use acceptance filters for filtering for messages that are only relevant to MC. 
* Add errorHandler code
* add EventHandler code
* add transmission request
* Change CAN_Send_Data_Frame functionality, so that the user can select which specific bytes contain what data? 
* Make a watermark interrupt for CAN Receive to avoid interrupt overhead
* immediate interrupts for high priority CAN messages
* Add functionality for XCanPs_SendHighPriority_Data_Frame
* Add functionality for CAN_Request_Remote_Frame(XCanPs *InstancePtr, u32 ID, u8 requestedDataLength);
* Add functionality for XCanPs_SendHighPriority_Remote_Frame

* CAN Receive:
    * Add functionality to handle data fields less than 8 bytes --> make it so that the empty fields aren't parsed as "0".
*/







// // JONAS AND SEBASTIAN'S CALCULATIONS:---------------------------------------------------------------------------------
// // CAN Clock, as set in Vivado, is 23.8 (24) MHz.

//  // CAN_controller_clock / (Prescaler + 1) = quantum clock (from XCanPs_SetBaudRatePrescaler documentation). 
// #define BRPR_BAUD_PRESCALER 2 // f_TQ = 23.8 MHz / (BRPR_BAUD_PRESCALER + 1) = 7.99 MHz --> time quantum, t_TQ = 1 / 7.f_TQ = 0.126 us 

// // These timing parameters are set to give  a 1 Mbps baud rate with a CAN_controller_clock of 23.8 MHz. 77.77% sampling point.
// #define BTR_SYNCJUMPWIDTH        3 // Bit Timing Register (BTR) 
// #define BTR_FIRST_TIMESEGMENT    3
// #define BTR_SECOND_TIMESEGMENT   2
// // BIT_RATE = f_tq / (BTR_SYNCJUMPWIDTH + BTR_FIRST_TIMESEGMENT + BTR_SECOND_TIMESEGMENT) = 7.99 MHz * (3 + 3 + 2) = 0.99875 Mbit/s
// // :--------------------------------------------------------------------------------------------------------------



/*
 * The Baud Rate Prescaler Register (BRPR) and Bit Timing Register (BTR)
 * are setup such that CAN baud rate equals 40Kbps, assuming that the
 * the CAN clock is 24MHz. The user needs to modify these values based on
 * the desired baud rate and the CAN clock frequency. For more information
 * see the CAN 2.0A, CAN 2.0B, ISO 11898-1 specifications.

 * Timing parameters to be set in the Bit Timing Register (BTR).
 * These values are for a 40 Kbps baudrate assuming the CAN input clock
 * frequency is 24 MHz.
 */
#define BTR_SYNCJUMPWIDTH       3
#define BTR_SECOND_TIMESEGMENT  2
#define BTR_FIRST_TIMESEGMENT   15

/*
 * The Baud rate Prescalar value in the Baud Rate Prescaler Register
 * needs to be set based on the input clock  frequency to the CAN core and
 * the desired CAN baud rate.
 * This value is for a 40 Kbps baudrate assuming the CAN input clock frequency
 * is 24 MHz.
 */
#define BRPR_BAUD_PRESCALAR 29



// ------------------------ CAN frame's individual field lengths ------------------------  
#define FIELD_IDENT_SIZE_IN_WORDS      1
#define FIELD_CTRL_SIZE_IN_WORDS       1
#define FIELD_DATA1_SIZE_IN_WORDS      1
#define FIELD_DATA2_SIZE_IN_WORDS      1

// ------------------------ CAN Frame's max values ------------------------
#define MAX_FRAME_SIZE_IN_WORDS               FIELD_IDENT_SIZE_IN_WORDS + FIELD_CTRL_SIZE_IN_WORDS + FIELD_DATA1_SIZE_IN_WORDS + FIELD_DATA2_SIZE_IN_WORDS    // 1 word = 32 bits = 4 bytes
#define MAX_STD_ID_VALUE                      2048-1     // 2^11 bits & -1 for 0-indexing
#define MAX_EXT_ID_VALUE                      524288-1   // 2^19 bits & -1 for 0-indexing
#define MAX_DATA_FIELD_LENGTH                 8 // includes both data word 1 & 2.
#define MAX_BYTES_IN_FIELD_INDEX              MAX_FRAME_SIZE_IN_WORDS - 1 // -1 for 0-indexing     
// ------------------------ hardware addresses for PS' CAN peripherals instantiated in PS-block in Vivado ------------------------
#define CAN0_base_address                     XPAR_XCANPS_0_BASEADDR
#define CAN1_base_address                     XPAR_XCANPS_1_BASEADDR

// ------------------------ Masks for concatenated identifiers ------------------------
#define MASK_STD_ID                          0x7FF      // 0000 0000 0000 0000 0000 0111 1111 1111
#define MASK_EXT_ID                          0x3FFFF800 // 0011 1111 1111 1111 1111 1000 0000 0000
#define BITS_IDENT_EXT_NO_OFFSET             0x3FFFF    // 0000 0000 0000 0011 1111 1111 1111 1111

// ------------------------ Masks & offsets for specific bit locations in the CAN frame (fields) ------------------------
//Identifier field bit locations
#define BITS_FIELD_IDENT_STD_ID              0xFFE00000  // 0b1111 1111 1110 0000 0000 0000 0000 0000
#define BIT_FIELD_IDENT_STD_RTR              0x00100000  // 0b0000 0000 0001 0000 0000 0000 0000 0000
#define BIT_FIELD_IDENT_EXT_IDE              0x00080000  // 0b0000 0000 0000 1000 0000 0000 0000 0000
#define BITS_FIELD_IDENT_EXT_ID              0x0007FFFE  // 0b0000 0000 0000 0111 1111 1111 1111 1110 
#define BIT_FIELD_IDENT_EXT_RTR              0x00000001  // 0b0000 0000 0000 0000 0000 0000 0000 0001 
//Control field bit locations
#define BITS_FIELD_CTRL_DLC                  0xF0000000  // 0b1111 0000 0000 0000 0000 0000 0000 0000
#define BITS_FIELD_CTRL_TIMESTAMP            0x0000FFFF  // 0b0000 0000 0000 0000 1111 1111 1111 1111
//Data field byte locations
#define BITS_WORD_DATA_DB0                   0xFF000000  // 0b1111 1111 0000 0000 0000 0000 0000 0000
#define BITS_WORD_DATA_DB1                   0x00FF0000  // 0b0000 0000 1111 1111 0000 0000 0000 0000
#define BITS_WORD_DATA_DB2                   0x0000FF00  // 0b0000 0000 0000 0000 1111 1111 0000 0000
#define BITS_WORD_DATA_DB3                   0x000000FF  // 0b0000 0000 0000 0000 0000 0000 1111 1111

//Offsets: see page 570 (18.2.2 "Message Format" of Zynq Technical Reference Manual)
#define OFFSET_BITS_STD_ID                   21
#define OFFSET_BITS_EXT_ID                    1
#define OFFSET_DLC                           28
#define OFFSET_DATA_WORD_DB0                 24
#define OFFSET_DATA_WORD_DB1                 16
#define OFFSET_DATA_WORD_DB2                  8
#define OFFSET_DATA_WORD_DB3                  0

// ------------------------ Field indexes ------------------------
#define IDX_FIELD_IDENT                       0
#define IDX_FIELD_CTLR                        1
#define IDX_FIELD_DATA_1                      2
#define IDX_FIELD_DATA_2                      3

// ------------------------ Helpful definitions ------------------------ 
#define NO_OF_BITS_IN_A_BYTE                  8
#define SINGLE_BYTE_MASK                      0xFF
#define MAX_BYTES_IN_A_DATA_WORD              4


// ------------------------ Identifier field bits ------------------------
#define LENGTH_STD_ID                         11 
#define LENGTH_EXT_ID                         18
#define LENGTH_STD_PLUS_EXT_IDENTIFIER        CAN_LENGTH_STANDARD_IDENTIFIER + CAN_LENGTH_EXTENDED_IDENTIFIER

#define NO_STD_ID         0
// REMOTE_TRANSMISSION_REQUEST (RTR)-bit indicates in CAN if information is requested from another CAN node. 
#define SET_RTR           1 // REMOTE_TRANSMISSION_REQUEST
#define DISABLED_RTR      0 // DISABLE_REMOTE_TRANSMISSION_REQUEST

// For extended CAN: ID_EXTENSION_IDE (IDE)-bit indicates that more identifier bits follow if using extended CAN
#define SET_IDE           1 
#define DISABLED_IDE      0 
#define NO_EXT_ID         0 // If not using any extended ID,  "no ID"

// For extended CAN: SUBSTITUTE_REMOTE_TRANSMISSION_REQUEST (SRR)-bit replaces RTR bit in the standard message's location as a placeholder in the extended format.
#define SET_SRR           1 
#define DISABLED_SRR      0 

// ------------------------------------------------------------------------------------------------------------------------------------------------

typedef struct 
{
    u32 ID;                                    // 29-bit or 11-bit CAN ID
    u8 DLC;                                    // Data Length Code (0-8)
    u8 RTR_flag;                               // Remote transmission request
    u8 DataField_1[MAX_DATA_FIELD_LENGTH / 2]; // Data payload for data field 1
    u8 DataField_2[MAX_DATA_FIELD_LENGTH / 2]; // Data payload for data field 2
} CAN_Frame;


// To be used for dynamically sizing the data fields depending on the inputted DLC.
// typedef struct 
// {
//     u32 ID;          // 29-bit or 11-bit CAN ID
//     u8 DLC;          // Data Length Code (0-8)
//     u8 RTR_flag;     // Remote transmission request
//     u8 *DataField_1; // Pointer to data field 1
//     u8 *DataField_2; // Pointer to data field 2
// } CAN_Frame;



const CAN_Frame Default_CAN_Frame = 
{
    .ID = 0,
    .DLC = 0,
    .RTR_flag = FALSE,
    .DataField_1 = {0},
    .DataField_2 = {0}
};



extern XCanPs          CAN0_PS_inst;
extern XCanPs          CAN1_PS_inst;
extern XCanPs_Config   *CAN_CFG_ptr;

extern u32 TxFrame[MAX_FRAME_SIZE_IN_WORDS];
extern u32 RxFrame[MAX_FRAME_SIZE_IN_WORDS];

void CAN_enter_config_mode(XCanPs *InstancePtr);
void CAN_enter_normal_mode(XCanPs *InstancePtr) ;     
void CAN_enter_loopback_mode(XCanPs *InstancePtr);     // Zynq talks with itself. 
void CAN_enter_sleep_mode(XCanPs *InstancePtr);        // low-power mode. 
void CAN_enter_snoop_mode(XCanPs *InstancePtr);        // can sniff/snoop on CAN bus, but not interact. 

int CAN_init(XCanPs *CanInstPtr, UINTPTR BaseAddress); // Initializes the CAN hardware to 1 Mbit/s and runs checks as needed
int CAN_Config(XCanPs *InstancePtr);   

int CAN_Send_Data_Frame(XCanPs *InstancePtr, u32 ID, u8 *DataPtr, u32 DataLength_No_Of_Bytes );
// XCanPs_SendHighPriority_Data_Frame

// int CAN_Request_Remote_Frame(XCanPs *InstancePtr, u32 ID, u8 requestedDataLength);
// XCanPs_SendHighPriority_Remote_Frame

u32 CAN_CreateStandardIdentifier(u16 standard_ID, bool RTR);
u32 CAN_CreateExtendedIdentifier(u16 standard_ID, u32 extended_ID, bool RTR);


u8 CAN_ParseFrame(u8 DataLength);