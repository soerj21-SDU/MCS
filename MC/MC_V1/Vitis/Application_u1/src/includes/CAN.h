#include <stdio.h>
#include "xparameters.h"
#include "xcanps.h"
#include "xinterrupt_wrap.h"
#include <stdint.h>
#include <stdbool.h>

#include "interrupts.h"

// CAN Clock, as set in Vivado, is 23.8 (24) MHz.

 // CAN_controller_clock / (Prescaler + 1) = quantum clock (from XCanPs_SetBaudRatePrescaler documentation). 
#define BRPR_BAUD_PRESCALER 2 // f_TQ = 23.8 MHz / (BRPR_BAUD_PRESCALER + 1) = 7.99 MHz --> time quantum, t_TQ = 1 / 7.f_TQ = 0.126 us 


// These timing parameters are set to give  a 1 Mbps baud rate with a CAN_controller_clock of 23.8 MHz. 77.77% sampling point.
#define BTR_SYNCJUMPWIDTH		3 // Bit Timing Register (BTR) 
#define BTR_FIRST_TIMESEGMENT	3
#define BTR_SECOND_TIMESEGMENT	2
// BIT_RATE = f_tq / (BTR_SYNCJUMPWIDTH + BTR_FIRST_TIMESEGMENT + BTR_SECOND_TIMESEGMENT) = 7.99 MHz * (3 + 3 + 2) = 0.99875 Mbit/s

#define XCANPS_MAX_FRAME_SIZE_IN_WORDS      (XCANPS_MAX_FRAME_SIZE / sizeof(u32))
#define FRAME_DATA_LENGTH	                8 /* Frame Data-field length */
#define TEST_MESSAGE_ID		                2000
#define CAN0_base_address                   XPAR_XCANPS_0_BASEADDR
#define CAN1_base_address                   XPAR_XCANPS_1_BASEADDR

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
bool CAN_is_TX_ready(XCanPs *InstancePtr);             // Checks whether TX  is ready 
bool CAN_is_TX_FIFO_Full(XCanPs *InstancePtr);        
bool CAN_is_RX_ready(XCanPs *InstancePtr);             // Checks whether RX FIFO is ready or empty



// void XCanPs_IntrEnable(XCanPs *InstancePtr, u32 Mask);
// void XCanPs_IntrDisable(XCanPs *InstancePtr, u32 Mask);
// u32 XCanPs_IntrGetEnabled(XCanPs *InstancePtr);
// u32 XCanPs_IntrGetStatus(XCanPs *InstancePtr);
// void XCanPs_IntrClear(XCanPs *InstancePtr, u32 Mask);
// void XCanPs_IntrHandler(void *InstancePtr);
// s32 XCanPs_SetHandler(XCanPs *InstancePtr, u32 HandlerType,
// 		      void *CallBackFunc, void *CallBackRef);

// u32 XCanPs_GetStatus(XCanPs *InstancePtr);

// XCanPs_IsTxDone