#include "includes/CAN.h"
#include <xcanps.h>
// #include <xstatus.h>


XCanPs  CAN0_PS_inst;
XCanPs  CAN1_PS_inst;

XCanPs_Config *CAN_CFG_ptr;

// Buffers to hold frames. Global to not be on stack. Must be 32-bit aligned.
u32 TxFrame0[XCANPS_MAX_FRAME_SIZE_IN_WORDS];
u32 RxFrame0[XCANPS_MAX_FRAME_SIZE_IN_WORDS];

u32 TxFrame1[XCANPS_MAX_FRAME_SIZE_IN_WORDS];
u32 RxFrame1[XCANPS_MAX_FRAME_SIZE_IN_WORDS];

int CAN_init(XCanPs *CanInstPtr, UINTPTR BaseAddress)
{
	int status;

	CAN_CFG_ptr = XCanPs_LookupConfig(BaseAddress); 	// Find hardware configuration from Vivado's generated file xparameters.h
        if (CAN_CFG_ptr == NULL) 
        { 
            return XST_FAILURE;
        }

    XCanPs_CfgInitialize(CanInstPtr, CAN_CFG_ptr, CAN_CFG_ptr->BaseAddr); 	// Initialize hardware configuration

	status = XCanPs_SelfTest(CanInstPtr);	// Check that hardware is correctly built
        if (status != XST_SUCCESS) {
            return XST_FAILURE;
        }

    CAN_Config(CanInstPtr);

    // // Set interrupt handlers.
	// XCanPs_SetHandler(CanInstPtr, XCANPS_HANDLER_SEND,
	// 		  (void *)SendHandler, (void *)CanInstPtr);
	// XCanPs_SetHandler(CanInstPtr, XCANPS_HANDLER_RECV,
	// 		  (void *)RecvHandler, (void *)CanInstPtr);
	// XCanPs_SetHandler(CanInstPtr, XCANPS_HANDLER_ERROR,
	// 		  (void *)ErrorHandler, (void *)CanInstPtr);
	// XCanPs_SetHandler(CanInstPtr, XCANPS_HANDLER_EVENT,
	// 		  (void *)EventHandler, (void *)CanInstPtr);

    /* Initialize the flags.*/
	// SendDone = FALSE;
	// RecvDone = FALSE;
	// LoopbackError = FALSE;

	// Connect to the interrupt controller. 
	// status = XSetupInterruptSystem(CanInstPtr, &XCanPs_IntrHandler,   ConfigPtr->IntrId,   ConfigPtr->IntrParent,   XINTERRUPT_DEFAULT_PRIORITY);
    //     if (status != XST_SUCCESS) 
    //     {
    //         return XST_FAILURE;
    //     }

	/* Enable all interrupts in CAN device.*/
	// XCanPs_IntrEnable(CanInstPtr, XCANPS_IXR_ALL);


	// XCanPs_EnterMode(CanInstPtr, XCANPS_MODE_LOOPBACK);	// Enter Loop Back Mode.
	//     while (XCanPs_GetMode(CanInstPtr) != XCANPS_MODE_LOOPBACK);


	// /* Loop back a frame. The RecvHandler is expected to handle the frame reception. */
	// SendFrame(CanInstPtr); /* Send a frame */

	// while ((SendDone != TRUE) || (RecvDone != TRUE));	// Wait here until both sending and reception have been completed.


	// if (LoopbackError == TRUE) // Check for errors found in the callbacks. 
    // {
	// 	return XST_LOOPBACK_ERROR;
	// }


	return XST_SUCCESS;
}


void CAN_Config(XCanPs *InstancePtr)
{
    /* Enter Configuration Mode if the device is not currently in Configuration Mode. */
	XCanPs_EnterMode(InstancePtr, XCANPS_MODE_CONFIG);
    	while (XCanPs_GetMode(InstancePtr) != XCANPS_MODE_CONFIG);
    
    /* Setup Baud Rate Prescaler Register (BRPR) and Bit Timing Register (BTR). */
    XCanPs_SetBaudRatePrescaler(InstancePtr, BRPR_BAUD_PRESCALER);	// Set Baud Rate Prescaler
    XCanPs_SetBitTiming(InstancePtr,    BTR_SYNCJUMPWIDTH,    BTR_SECOND_TIMESEGMENT,    BTR_FIRST_TIMESEGMENT);
}


int CAN_send(XCanPs *InstancePtr, u32 *frameptr) 
{
	return XCanPs_Send(InstancePtr, frameptr);
}


int CAN_receive(XCanPs *InstancePtr, u32 *frameptr) 
{
	return XCanPs_Recv(InstancePtr, frameptr);
}


void CAN_enter_normal_mode(XCanPs *InstancePtr) 
{
	XCanPs_EnterMode(InstancePtr, XCANPS_MODE_NORMAL);
    	while (XCanPs_GetMode(InstancePtr) != XCANPS_MODE_NORMAL);
}


void CAN_enter_loopback_mode(XCanPs *InstancePtr) 
{
	XCanPs_EnterMode(InstancePtr, XCANPS_MODE_LOOPBACK);
    	while (XCanPs_GetMode(InstancePtr) != XCANPS_MODE_LOOPBACK);
}


void CAN_enter_sleep_mode(XCanPs *InstancePtr)
{
    XCanPs_EnterMode(InstancePtr, XCANPS_MODE_SLEEP);
        while (XCanPs_GetMode(InstancePtr) != XCANPS_MODE_SLEEP);
}


void CAN_enter_snoop_mode(XCanPs *InstancePtr)
{
    XCanPs_EnterMode(InstancePtr, XCANPS_MODE_SNOOP);
        while (XCanPs_GetMode(InstancePtr) != XCANPS_MODE_SNOOP);
}


bool CAN_is_TX_ready(XCanPs *InstancePtr) 
{
    return XCanPs_IsTxDone(InstancePtr);
}


bool CAN_is_TX_FIFO_Full(XCanPs *InstancePtr) 
{
    return XCanPs_IsTxFifoFull(InstancePtr);
}


bool CAN_is_RX_ready(XCanPs *InstancePtr) 
{
    return XCanPs_IsRxEmpty(InstancePtr);
}



// void SendFrame(XCanPs *InstancePtr)
// {
// 	u8 *FramePtr;
// 	int Index;
// 	int Status;

// 	// Create correct values for Identifier and Data Length Code Register. 
// 	TxFrame[0] = (u32)XCanPs_CreateIdValue((u32)TEST_MESSAGE_ID, 0, 0, 0, 0);
// 	TxFrame[1] = (u32)XCanPs_CreateDlcValue((u32)FRAME_DATA_LENGTH);

// 	// Now fill in the data field with known values so we can verify them on receive. 
// 	FramePtr = (u8 *)(&TxFrame[2]);
// 	for (Index = 0; Index < FRAME_DATA_LENGTH; Index++) 
//     {
// 		*FramePtr++ = (u8)Index;
// 	}

// 	// Now wait until the TX FIFO is not full and send the frame. 
// 	while (XCanPs_IsTxFifoFull(InstancePtr) == TRUE);

// 	Status = XCanPs_Send(InstancePtr, TxFrame);
//         if (Status != XST_SUCCESS) 
//         {
//             LoopbackError = TRUE;
//             SendDone = TRUE;
//             RecvDone = TRUE;
//         }
// }