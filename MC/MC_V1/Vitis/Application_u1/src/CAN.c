#include "includes/CAN.h"
#include <xil_types.h>
#include <xstatus.h>

XCanPs  CAN0_PS_inst;
XCanPs  CAN1_PS_inst;
XCanPs_Config *CAN_CFG_ptr;

// Buffers to hold frames. Global to not be on stack. Must be 32-bit aligned.
u32 TxFrame[XCANPS_MAX_FRAME_SIZE_IN_WORDS] = {0};
u32 RxFrame[4]  ={0};

// Shared variables used to test the callback mode
static volatile int LoopbackError;	/* Asynchronous error occurred */
static volatile int RecvDone;		/* Received a frame */
static volatile int SendDone;		/* Frame was sent successfully */

static void SendHandler(void *CallBackRef); 
static void RecvHandler(void *CallBackRef);
static void ErrorHandler(void *CallBackRef, u32 ErrorMask);
static void EventHandler(void *CallBackRef, u32 IntrMask);

int CAN_init(XCanPs *CanInstPtr, UINTPTR BaseAddress)
{
	int status;

	CAN_CFG_ptr = XCanPs_LookupConfig(BaseAddress); 	// Find hardware configuration from Vivado's generated file xparameters.h
        if (CAN_CFG_ptr == NULL) 
        { 
            return XST_FAILURE;
        }

    status = XCanPs_CfgInitialize(CanInstPtr, CAN_CFG_ptr, CAN_CFG_ptr->BaseAddr); 	// Initialize hardware configuration
        if (status != XST_SUCCESS) 
        {
            printf("\nxst_state = %d \n \n \n \n", status );
            return XST_FAILURE;
        }
        
	status = XCanPs_SelfTest(CanInstPtr);	// Check that hardware is correctly built
        if (status != XST_SUCCESS) 
        {
            printf("\nxst_state of selfetest = %d \n \n \n \n", status );
            return XST_FAILURE;
        }

    CAN_Config(CanInstPtr);

    // Set Interrupt-handlers / ISRs
	XCanPs_SetHandler(CanInstPtr,   XCANPS_HANDLER_SEND,    (void *)SendHandler,    (void *)CanInstPtr);
	XCanPs_SetHandler(CanInstPtr,   XCANPS_HANDLER_RECV,    (void *)RecvHandler,    (void *)CanInstPtr);
	XCanPs_SetHandler(CanInstPtr,   XCANPS_HANDLER_ERROR,   (void *)ErrorHandler,   (void *)CanInstPtr);
	XCanPs_SetHandler(CanInstPtr,   XCANPS_HANDLER_EVENT,   (void *)EventHandler,   (void *)CanInstPtr);

    /* Initialize the flags.*/
	SendDone = FALSE;
	RecvDone = FALSE;
	LoopbackError = FALSE;

    status = setup_CAN_Interrupt(CanInstPtr,  BaseAddress, 1);
        if (status != XST_SUCCESS) 
        {
            return XST_FAILURE;
        }






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


int CAN_Config(XCanPs *InstancePtr)
{
    int status; 

	XCanPs_EnterMode(InstancePtr, XCANPS_MODE_CONFIG);
    	while (XCanPs_GetMode(InstancePtr) != XCANPS_MODE_CONFIG);
    
    /* Setup Baud Rate Prescaler Register (BRPR) and Bit Timing Register (BTR). */
    XCanPs_SetBaudRatePrescaler(InstancePtr, BRPR_BAUD_PRESCALAR);	// Set Baud Rate Prescaler
    if (status != XST_SUCCESS)  {  return XST_FAILURE;  }

    XCanPs_SetBitTiming(InstancePtr,    BTR_SYNCJUMPWIDTH,    BTR_SECOND_TIMESEGMENT,    BTR_FIRST_TIMESEGMENT);
    if (status != XST_SUCCESS)  {  return XST_FAILURE;  }
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


bool CAN_is_RX_ready(XCanPs *InstancePtr) 
{
    return XCanPs_IsRxEmpty(InstancePtr);
}


int CAN_Send_TestFrame(XCanPs *InstancePtr)
{
	u8 *FramePtr;
	int Index;
	int Status;

    // Create value for identifier field
	TxFrame[0] = (u32)XCanPs_CreateIdValue(  (u32)TEST_MESSAGE_ID,   DISABLED_SRR,   DISABLED_IDE,   NO_EXTENDED_ID,   DISABLED_RTR);	

    // Create value for Data Length Code Register. (how many data bytes in frame)
	TxFrame[1] = (u32)XCanPs_CreateDlcValue(  (u32)FRAME_DATA_LENGTH  ); 
	// TxFrame[1] = (u32)XCanPs_CreateDlcValue(  (u32)1  ); 

	// Fill in the data-field with known values so we can verify them on receive. 
	FramePtr = (u8 *)(&TxFrame[2]);
    for (Index = 0; Index < FRAME_DATA_LENGTH; Index++) 
    {
		// *FramePtr++ = 0; //(u8)Index;
        *FramePtr++ = (u8)Index;

	}

	// Wait until the TX_FIFO is not full and send the frame. 
	while (XCanPs_IsTxFifoFull(InstancePtr) == TRUE);

	Status = XCanPs_Send(InstancePtr, TxFrame);
        if (Status != XST_SUCCESS) 
        {
            LoopbackError = TRUE;
            SendDone = TRUE; 
            RecvDone = TRUE;

            print("Failed CAN Send (function call)");
        }


    // DELETE RecvDone PART WHEN NOT USING LOOPBACK.
    while ((SendDone != TRUE) || (RecvDone != TRUE));	// Wait here until both send interrupt and receive interrupt have been triggered.
    // print("\nSuccessfully sent test CAN Frame");

    if (LoopbackError == true)
    {
        print ("\nloopback error");
        return XST_FAILURE;
    }
    else print("\nNo loopback error");

    return XST_SUCCESS;
}


/** Callback function (called from interrupt handler) to handle confirmation of transmit events when in interrupt mode.
* @param	CallBackRef is the callback reference passed from the interrupt handler, which in our case is a pointer to the driver instance.
* @return	None.
* @note		This function is called by the driver within interrupt context.
*/
static void SendHandler(void *CallBackRef)
{
	(void)CallBackRef;
	SendDone = TRUE;	/* The frame was sent successfully. Notify the task context. */
}


/** Callback function (called from interrupt handler) to handle frames received in interrupt mode.  
* This function is called once per frame received. The driver's receive function is called to read the frame from RX FIFO.
* @param	CallBackRef is the callback reference passed from the interrupt handler, which in our case is a pointer to the device instance.
* @return	None.
* @note		This function is called by the driver within interrupt context.
*/
static void RecvHandler(void *CallBackRef)
{
    // print("\n \n A Receive interrupt has been made! ");    

	XCanPs *CanPtr = (XCanPs *)CallBackRef;    //set CanPtr to our driver instance
	int Status;
	int Index;
	u8 *FramePtr;

    Status = XCanPs_Recv(CanPtr, RxFrame);
        if (Status != XST_SUCCESS) 
        {
            LoopbackError = TRUE;
            RecvDone = TRUE;
            xil_printf("\nLoopback error CAN Receive (xCanPs_Recv functional call).");
            return;
        }

    // print ("\nVeriyfying identifier");
	if (RxFrame[0] != (u32)XCanPs_CreateIdValue((u32)TEST_MESSAGE_ID, 0, 0, 0, 0)) 	//Verify Identifier is the same as the calculated sent one. Loopback
    {
		LoopbackError = TRUE;
		RecvDone = TRUE;
        xil_printf("\nLoopback error CAN Receive (verify identifier).");
		return;
	}

    // print ("\nVeriyfying DLC");
	// Verify Data Length Code.
	if ((RxFrame[1] & ~XCANPS_DLCR_TIMESTAMP_MASK) != TxFrame[1]) 
    {
		LoopbackError = TRUE;
		RecvDone = TRUE;
        xil_printf("\nLoopback error CAN Receive (verify DLC).");
		return;
	}
 
    // print ("\nVeriyfying data");
	/* Verify the Data field contents.*/
	FramePtr = (u8 *)(&RxFrame[2]);
	for (Index = 0; Index < FRAME_DATA_LENGTH; Index++) 
    {
		if (*FramePtr++ != (u8)Index) 
        {
			LoopbackError = TRUE;
            xil_printf("\nLoopback error CAN Receive (Data error).");
			break;
		}
	}

	RecvDone = TRUE;
    // print("\nSuccessfully received the data");
}


/** Callback function (called from interrupt handler) to handle error interrupt. Error code read from Error Status register is passed into this function.
* @param	CallBackRef is the callback reference passed from the interrupt handler, which in our case is a pointer to the driver instance.
* @param	ErrorMask is a bit mask indicating the cause of the error. Its value equals 'OR'ing one or more XCANPS_ESR_* defined in xcanps_hw.h.
* @return	None.
* @note		This function is called by the driver within interrupt context.
*/
static void ErrorHandler(void *CallBackRef, u32 ErrorMask)
{
	(void)CallBackRef;

	if (ErrorMask & XCANPS_ESR_ACKER_MASK) 
    {
		/* ACK Error handling code should be put here.*/
	}

	if (ErrorMask & XCANPS_ESR_BERR_MASK) 
    {
		/* Bit Error handling code should be put here */
	}

	if (ErrorMask & XCANPS_ESR_STER_MASK) 
    {
		/* Stuff Error handling code should be put here. */
	}

	if (ErrorMask & XCANPS_ESR_FMER_MASK) 
    {
		/* Form Error handling code should be put here. */
	}

	if (ErrorMask & XCANPS_ESR_CRCER_MASK) 
    {
		/* CRC Error handling code should be put here. */
	}

	LoopbackError = TRUE;
	RecvDone = TRUE;
	SendDone = TRUE;
}


static void EventHandler(void *CallBackRef, u32 IntrMask)
{
	XCanPs *CanPtr = (XCanPs *)CallBackRef;

	if (IntrMask & XCANPS_IXR_BSOFF_MASK) 
    {
        // Entering Bus off status interrupt requires the CAN device be reset and reconfigured.

		XCanPs_Reset(CanPtr);
        CAN_Config(CanPtr);

		return;
	}

	if (IntrMask & XCANPS_IXR_RXOFLW_MASK) 
    {
		/* Code to handle RX FIFO Overflow Interrupt should be put here. */
	}

	if (IntrMask & XCANPS_IXR_RXUFLW_MASK) 
    {
		/* Code to handle RX FIFO Underflow Interrupt should be put here. */
	}

	if (IntrMask & XCANPS_IXR_TXBFLL_MASK) 
    {
		/* Code to handle TX High Priority Buffer Full Interrupt should be put here. */
	}

	if (IntrMask & XCANPS_IXR_TXFLL_MASK) 
    {
		/* Code to handle TX FIFO Full Interrupt should be put here. */
	}

	if (IntrMask & XCANPS_IXR_WKUP_MASK) 
    {
		/* Code to handle Wake up from sleep mode Interrupt should be put here. */
	}

	if (IntrMask & XCANPS_IXR_SLP_MASK) 
    {
		/* Code to handle Enter sleep mode Interrupt should be put here. */
	}

	if (IntrMask & XCANPS_IXR_ARBLST_MASK) 
    {
		/* Code to handle Lost bus arbitration Interrupt should be put here. */
	}
}