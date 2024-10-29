#include <stdio.h>
#include "xparameters.h"
#include "xcanps.h"
#include "xinterrupt_wrap.h"
#include <stdint.h>
#include <stdbool.h>

#include "interrupts.h"

// CAN Clock, as set in Vivado, is 23.8 (24) MHz
// Baud Rate Prescaler reduces the clock used for time quantums in CAN. 
// The Baud rate Prescalar value in the Baud Rate Prescaler Register needs to be set based on the input clock frequency to the CAN core and the desired CAN baud rate.
// The recommended minimum value of the prescaler is 2.
// This value is for a 1 Mbps baudrate assuming the CAN input clock frequency is 23.8 (24) MHz.

#define BRPR_BAUD_PRESCALER 2
// Resulting frequency is f_TQ = 23.8 MHz / (2 + 1) = 7.933 MHz.
// The time quantum is this t_TQ = 1 / 7.933 MHz = 0.126 µs
// These timing parameters are for a 1 Mbps baud rate assuming the CAN input clock frequency is 23.8 MHz.
// 77.77% sampling point.
#define BTR_SYNCJUMPWIDTH		3
#define BTR_FIRST_TIMESEGMENT	3
#define BTR_SECOND_TIMESEGMENT	2
// Resulting bit rate is BIT_RATE = 23.8 MHz / ((2 + 1) * (3 + 3 + 2)) = 0.99 Mbit/s

#define FRAME_DATA_LENGTH	8 /* Frame Data field length */
#define TEST_MESSAGE_ID		2000// Message Id Constant.
#define XCANPS_MAX_FRAME_SIZE_IN_WORDS (XCANPS_MAX_FRAME_SIZE / sizeof(u32))
#define CAN0_base_address   XPAR_XCANPS_0_BASEADDR
#define CAN1_base_address   XPAR_XCANPS_1_BASEADDR
#define TEST_MESSAGE_ID_CONST 2000

extern XCanPs  CAN0_PS_inst;
extern XCanPs  CAN1_PS_inst;

extern XCanPs_Config *CAN_CFG_ptr;

// Buffers to hold frames. Global to not be on stack. Must be 32-bit aligned.
extern u32 TxFrame0[XCANPS_MAX_FRAME_SIZE_IN_WORDS];
extern u32 RxFrame0[XCANPS_MAX_FRAME_SIZE_IN_WORDS];

extern u32 TxFrame1[XCANPS_MAX_FRAME_SIZE_IN_WORDS];
extern u32 RxFrame1[XCANPS_MAX_FRAME_SIZE_IN_WORDS];


int CAN_init(XCanPs *CanInstPtr, UINTPTR BaseAddress); // Initializes the CAN hardware to 1 Mbit/s and runs checks as needed
void CAN_Config(XCanPs *InstancePtr);                       
int CAN_send(XCanPs *InstancePtr, u32 *frameptr);      // Sends the data stored within the transmit buffer
int CAN_receive(XCanPs *InstancePtr, u32 *frameptr);   // Puts received data into the receive buffer
void CAN_enter_normal_mode(XCanPs *InstancePtr) ;     
void CAN_enter_loopback_mode(XCanPs *InstancePtr);     // Zynq talks with itself. 
void CAN_enter_sleep_mode(XCanPs *InstancePtr);        // low-power mode. 
void CAN_enter_snoop_mode(XCanPs *InstancePtr);        // can sniff/snoop on CAN bus, but not interact. 
bool CAN_is_TX_ready(XCanPs *InstancePtr);             // Checks whether TX FIFO is ready or full
bool CAN_is_RX_ready(XCanPs *InstancePtr);             // Checks whether RX FIFO is ready or empty

