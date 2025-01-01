#include "includes/CAN.h"

XCanPs  CAN0_PS_inst;
XCanPs  CAN1_PS_inst;
XCanPs_Config *CAN_CFG_ptr;

CAN_Frame CAN_Transmitted_Message; 
CAN_Frame CAN_Received_Message;

// Buffers to hold frames. Global to not be on stack. Must be 32-bit aligned.
u32 TxFrame[MAX_FRAME_SIZE_IN_WORDS] = {0};    
u32 RxFrame[MAX_FRAME_SIZE_IN_WORDS]  ={0};  

// Shared variables used to test the callback mode
static volatile int LoopbackError;  /* Asynchronous error occurred */
static volatile int RecvDone;       /* Received a frame */
static volatile int SendDone;       /* Frame was sent successfully */

// CAN ISRs: 
static void SendHandler(void *CallBackRef); 
static void RecvHandler(void *CallBackRef);
static void ErrorHandler(void *CallBackRef, u32 ErrorMask);
static void EventHandler(void *CallBackRef, u32 IntrMask);

const CAN_Frame Default_CAN_Frame = 
{
    .ID = 0,
    .DLC = 0,
    .RTR_flag = FALSE,
    .DataField_1 = {0},
    .DataField_2 = {0}
};

int CAN_init(XCanPs *CanInstPtr, UINTPTR BaseAddress)
{
    int status;

    CAN_CFG_ptr = XCanPs_LookupConfig(BaseAddress);     // Find hardware configuration from Vivado's generated file xparameters.h
        if (CAN_CFG_ptr == NULL) 
        { 
            print("\nCouldn't find CAN hardware configuration");
            return XST_FAILURE;
        }

    status = XCanPs_CfgInitialize(CanInstPtr, CAN_CFG_ptr, CAN_CFG_ptr->BaseAddr);  // Initialize hardware configuration
        if (status != XST_SUCCESS) 
        {
            print("\nFailed to configure CAN hardware");
            return XST_FAILURE;
        }
        
    status = XCanPs_SelfTest(CanInstPtr);   // Check that hardware is correctly built
        if (status != XST_SUCCESS) 
        {
            print("\nFailed CAN self-test.");
            return XST_FAILURE;
        }

    status = CAN_Config(CanInstPtr);
        if (status != XST_SUCCESS) 
        {
            print("\nFailed configure CAN.");
            return XST_FAILURE;
        }

    // Set Interrupt-handlers / ISRs
    status = XCanPs_SetHandler(CanInstPtr,   XCANPS_HANDLER_SEND,    (void *)SendHandler,    (void *)CanInstPtr);
    status = XCanPs_SetHandler(CanInstPtr,   XCANPS_HANDLER_RECV,    (void *)RecvHandler,    (void *)CanInstPtr);
    status = XCanPs_SetHandler(CanInstPtr,   XCANPS_HANDLER_ERROR,   (void *)ErrorHandler,   (void *)CanInstPtr);
    status = XCanPs_SetHandler(CanInstPtr,   XCANPS_HANDLER_EVENT,   (void *)EventHandler,   (void *)CanInstPtr);
        if (status != XST_SUCCESS) 
        {
            print("\nFailed to set CAN ISRs.");
            return XST_FAILURE;
        }

    status = setup_CAN_Interrupt(CanInstPtr,  BaseAddress, 1);
        if (status != XST_SUCCESS) 
        {
            print("\n Failed setup of CAN interrupts");
            return XST_FAILURE;
        }
    
    /* Initialize the flags.*/
    SendDone = FALSE;
    RecvDone = FALSE;
    LoopbackError = FALSE;


    return XST_SUCCESS;
}

int CAN_Config(XCanPs *InstancePtr)
{
    int status; 

    CAN_enter_config_mode(InstancePtr);
    
    status = XCanPs_SetBaudRatePrescaler(InstancePtr, BRPR);  
        if (status != XST_SUCCESS)  
        {  
            print("\nfailed to set CAN Baud Rate prescalar");
            return XST_FAILURE;  
        }
    status = XCanPs_SetBitTiming(InstancePtr,    BTR_SJW,    BTR_SECOND_SEG,    BTR_FIRST_SEG);
        if (status != XST_SUCCESS)  
        {  
            print("\nfailed to set CAN bit timing");
            return XST_FAILURE;  
        }

    return XST_SUCCESS;
}

void CAN_enter_config_mode(XCanPs *InstancePtr)
{
    XCanPs_EnterMode(InstancePtr, XCANPS_MODE_CONFIG);
        while (XCanPs_GetMode(InstancePtr) != XCANPS_MODE_CONFIG);
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

u32 CAN_CreateStandardIdentifier(u16 standard_ID, bool RTR)
{
    return (u32)XCanPs_CreateIdValue((u32)standard_ID,   DISABLED_SRR,   DISABLED_IDE,   NO_EXT_ID,   RTR);
}

u32 CAN_CreateExtendedIdentifier(u16 standard_ID, u32 extended_ID, bool RTR)
{
    return (u32)XCanPs_CreateIdValue((u32)standard_ID,   SET_SRR,   SET_IDE,   extended_ID,   RTR);
}


int CAN_Send_Data_Frame(XCanPs *InstancePtr, u32 ID, u8 *DataPtr, u32 DataLength_No_Of_Bytes )
{
    int Status;

    if (XCanPs_IsTxFifoFull(InstancePtr)) 
    {
        print("\nERROR: TxFIFO is full.");
        return XST_FAILURE;
    }

    // ------------------------ Create Identifier Field: ------------------------ 
    u32 Extended_ID = NO_EXT_ID, Standard_ID = NO_STD_ID ;

    if ( ID <= MAX_STD_ID_VALUE ) //is the identifier a standard ID or does it have extended bits too. 
    {
        TxFrame[IDX_FIELD_IDENT] = CAN_CreateStandardIdentifier(ID, DISABLED_RTR);
        Standard_ID = ID & MASK_STD_ID;                 

    }
    else if ( ID <= MAX_EXT_ID_VALUE)
    {
        Standard_ID = ID & MASK_STD_ID;   
        Extended_ID = (ID & MASK_EXT_ID) >> LENGTH_STD_ID; //move the bits down to isolate the extended ID from the standard ID


        TxFrame[IDX_FIELD_IDENT] = CAN_CreateExtendedIdentifier(Standard_ID, Extended_ID, DISABLED_RTR);
    }
    else
    {
        print("\nERROR: CAN ID is invalid");
        return XST_FAILURE;
    }

    CAN_Transmitted_Message.ID = ID;


    printf("\nCAN Transmitted Standard ID: %u", Standard_ID);
    printf("\nCAN Transmitted Extended ID: %u", Extended_ID);
    printf("\nCAN Transmitted ID: %u", ID);
    printf("\n\n");


    // ------------------------ Create Control Field (DLC) ------------------------
    if ( (DataLength_No_Of_Bytes <= MAX_DATA_FIELD_LENGTH) && (DataLength_No_Of_Bytes >= 0) ) 
    {
        TxFrame[IDX_FIELD_CTLR] = (u32)XCanPs_CreateDlcValue( DataLength_No_Of_Bytes ); 
    }
    else 
    {
        print("\nERROR: CAN DataLength invalid.");
        return XST_FAILURE;
    }

    CAN_Transmitted_Message.DLC = DataLength_No_Of_Bytes;

    // ------------------------ Fill up the CAN Data fields from one end to the other byte-by-byte. ------------------------
    for (u8 i = 0; i < DataLength_No_Of_Bytes; i++) 
    {
        const int datafield_2_index_reset = 4; 

        u8 DataFieldIndex_Offset = 1 + (i / 4); 
        u8 byte_offset = i % 4;        

        if (DataFieldIndex_Offset == 1) 
        {
            TxFrame[IDX_FIELD_CTLR + DataFieldIndex_Offset] |= (DataPtr[i] << (byte_offset * NO_OF_BITS_IN_A_BYTE));  
            CAN_Transmitted_Message.DataField_1[i] = DataPtr[i];
        }

        if (DataFieldIndex_Offset == 2)
        {
            TxFrame[IDX_FIELD_CTLR + DataFieldIndex_Offset] |= (DataPtr[i] << (byte_offset * NO_OF_BITS_IN_A_BYTE));  
            CAN_Transmitted_Message.DataField_2[i - datafield_2_index_reset] = DataPtr[i]; // datafield_2_index_reset ==> start from byte 0 again and not continue with byte 5.
        }
    }



    printf("\n \n");
    printf("\n\nCAN_Tx_DW1_DB0 = %u", CAN_Transmitted_Message.DataField_1[0]);
    printf("\n\nCAN_Tx_DW1_DB1 = %u", CAN_Transmitted_Message.DataField_1[1]);
    printf("\n\nCAN_Tx_DW1_DB2 = %u", CAN_Transmitted_Message.DataField_1[2]);
    printf("\n\nCAN_Tx_DW1_DB3 = %u", CAN_Transmitted_Message.DataField_1[3]);

    printf("\n \n");
    printf("\n\nCAN_Tx_DW2_DB0 = %u", CAN_Transmitted_Message.DataField_2[0]);
    printf("\n\nCAN_Tx_DW2_DB1 = %u", CAN_Transmitted_Message.DataField_2[1]);
    printf("\n\nCAN_Tx_DW2_DB2 = %u", CAN_Transmitted_Message.DataField_2[2]);
    printf("\n\nCAN_Tx_DW2_DB3 = %u", CAN_Transmitted_Message.DataField_2[3]);
    printf("\n \n");

    // ---------------- Send the CAN frame ----------------
    Status = XCanPs_Send(InstancePtr, TxFrame);
    if (Status != XST_SUCCESS) 
    {
        SendDone = TRUE; 

        print("\nERROR: Failed to send data frame.");
        return XST_FAILURE;
    }
    
    print("\n Succesfully sent");


    return XST_SUCCESS;
}


/** Callback function (called from interrupt handler) to handle confirmation of transmit events when in interrupt mode.
* @param    CallBackRef is the callback reference passed from the interrupt handler, which in our case is a pointer to the driver instance.
* @return   None.
* @note     This function is called by the driver within interrupt context.
*/
static void SendHandler(void *CallBackRef)
{
    (void)CallBackRef;
    SendDone = TRUE;    /* The frame was sent successfully. Notify the task context. */
    print("\n Succesfully transmitted");
}


/** Callback function (called from interrupt handler) to handle frames received in interrupt mode.  
* This function is called once per CAN frame received. The driver's receive function is called to read the frame from RX FIFO.
* @param    CallBackRef is the callback reference passed from the interrupt handler, which in our case is a pointer to the device instance.
* @return   None.
* @note     This function is called by the driver within interrupt context.
*/
static void RecvHandler(void *CallBackRef)
{


    CAN_Received_Message = Default_CAN_Frame;

    XCanPs *CanPtr = (XCanPs *)CallBackRef;    //set CanPtr to driver instance

                XCanPs_IntrDisable(CanPtr, XCANPS_IXR_ERROR_MASK);

    int Status;

    Status = XCanPs_Recv(CanPtr, RxFrame);
        if (Status != XST_SUCCESS) 
        {
            LoopbackError = TRUE;
            RecvDone = TRUE;
            xil_printf("\nError CAN Receive (xCanPs_Recv functional call).");
            return;
        }

    // --------------------------- parse the full CAN ID (whether it's standard or extended) ---------------------------
    u32 CAN_Extended_ID = NO_EXT_ID;
    u32 CAN_Standard_ID = (RxFrame[IDX_FIELD_IDENT] & BITS_FIELD_IDENT_STD_ID) >> OFFSET_BITS_STD_ID;

    if (RxFrame[IDX_FIELD_IDENT] & BIT_FIELD_IDENT_EXT_IDE) //if the "IDE-bit" is set in the received message...
    {
        // CAN_Extended_ID = (RxFrame[IDX_FIELD_IDENT] & BITS_FIELD_IDENT_EXT_ID) << LENGTH_STD_ID;

        CAN_Extended_ID = (RxFrame[IDX_FIELD_IDENT] & BITS_FIELD_IDENT_EXT_ID) >> OFFSET_BITS_EXT_ID;
    }

    CAN_Received_Message.ID = CAN_Standard_ID | (CAN_Extended_ID << LENGTH_STD_ID); 

    printf("\nRECEIVED CAN STANDARD ID: %u", CAN_Standard_ID);
    printf("\nRECEIVED CAN EXTENDED ID: %u", CAN_Extended_ID);
    // printf("\nRECEIVED CAN MESSAGE  ID: %u", CAN_Received_Message.ID);
    // printf("\nRECEIVED CAN MESSAGE  ID: %u", CAN_Received_Message.ID);


    // --------------------------- Check if it's a transmission request ---------------------------
    if (RxFrame[IDX_FIELD_IDENT] & BIT_FIELD_IDENT_EXT_IDE) 
    {
        if(RxFrame[IDX_FIELD_IDENT] & BIT_FIELD_IDENT_EXT_RTR)
            {
                CAN_Received_Message.RTR_flag = TRUE;
            }
    }
    else if (RxFrame[IDX_FIELD_IDENT] & BIT_FIELD_IDENT_STD_RTR)
    {
        CAN_Received_Message.RTR_flag = TRUE;
    }
    else        
    {
        CAN_Received_Message.RTR_flag = FALSE;
    }

    // --------------------------- find the Data Length ---------------------------
    CAN_Received_Message.DLC =   (u8)( (RxFrame[IDX_FIELD_CTLR] & BITS_FIELD_CTRL_DLC)  >> OFFSET_DLC); 

    // --------------------------- Get the data fields (1 & 2) ---------------------------
    u8 Word1_Received_DataBytes[4]; 
    u8 Word2_Received_DataBytes[4]; 

    for (int i = 0; i < MAX_BYTES_IN_A_DATA_WORD; i++)     // Split the two 32-bit data fields into 2*4 bytes...
    {
        Word1_Received_DataBytes[i] = ( RxFrame[IDX_FIELD_DATA_1] >> (NO_OF_BITS_IN_A_BYTE * (MAX_BYTES_IN_FIELD_INDEX - i)) )    & SINGLE_BYTE_MASK;
        Word2_Received_DataBytes[i] = ( RxFrame[IDX_FIELD_DATA_2] >> (NO_OF_BITS_IN_A_BYTE * (MAX_BYTES_IN_FIELD_INDEX - i)) )    & SINGLE_BYTE_MASK;
    }

    /* Since we have received the data as big endian, we will reverse the order. 
    *  from: DB0[31:24], DB1[23:16], DB2[15:8], DB3[7:0] 
    *  to:   DB3[31:24], DB2[23:16], DB1[15:8], DB0[7:0] 
    * (see page 570 (18.2.2 "Message Format" of Zynq Technical Reference Manual))  */

    for (int i = 0; i < MAX_BYTES_IN_A_DATA_WORD; i++)    // Reverse the order of bytes
    {
        CAN_Received_Message.DataField_1[i] = Word1_Received_DataBytes[MAX_BYTES_IN_FIELD_INDEX - i];
        CAN_Received_Message.DataField_2[i] = Word2_Received_DataBytes[MAX_BYTES_IN_FIELD_INDEX - i];
    }

    printf("\n \n");
    printf("\n CAN ID = %u", CAN_Received_Message.ID);
    printf("\n CAN DLC = %u", CAN_Received_Message.DLC);
    printf("\n CAN RTR Flag = %u", CAN_Received_Message.RTR_flag);
    printf("\n \n");

    // printf("\n \n");
    printf("\n\nCAN_Rx_DW1_DB0 = %u", CAN_Received_Message.DataField_1[0]);
    printf("\n\nCAN_Rx_DW1_DB1 = %u", CAN_Received_Message.DataField_1[1]);
    printf("\n\nCAN_Rx_DW1_DB2 = %u", CAN_Received_Message.DataField_1[2]);
    printf("\n\nCAN_Rx_DW1_DB3 = %u", CAN_Received_Message.DataField_1[3]);

    printf("\n\nCAN_Rx_DW2_DB0 = %u", CAN_Received_Message.DataField_2[0]);
    printf("\n\nCAN_Rx_DW2_DB1 = %u", CAN_Received_Message.DataField_2[1]);
    printf("\n\nCAN_Rx_DW2_DB2 = %u", CAN_Received_Message.DataField_2[2]);
    printf("\n\nCAN_Rx_DW2_DB3 = %u", CAN_Received_Message.DataField_2[3]);


    XCanPs_ClearTimestamp(CanPtr);
    RecvDone = TRUE;
}


/** Callback function (called from interrupt handler) to handle error interrupt. Error code read from Error Status register is passed into this function.
* @param    CallBackRef is the callback reference passed from the interrupt handler, which in our case is a pointer to the driver instance.
* @param    ErrorMask is a bit mask indicating the cause of the error. Its value equals 'OR'ing one or more XCANPS_ESR_* defined in xcanps_hw.h.
* @return   None.
* @note     This function is called by the driver within interrupt context.
*/
static void ErrorHandler(void *CallBackRef, u32 ErrorMask)
{
    // print ("\n Error Handler");

    (void)CallBackRef;

    // XCanPs_IntrDisable(CallBackRef, XCANPS_IXR_ERROR_MASK);



    if (ErrorMask & XCANPS_ESR_ACKER_MASK) //ACK ERROR: a transmitting node does not receive an acknowledgment (ACK) bit from any receiver on the network.
    {
        /* "ACK Error" handling code should be put here.*/
        // print("\n ACK error.");
    }

    if (ErrorMask & XCANPS_ESR_BERR_MASK) //BIT ERROR: a transmitting node sends a bit on the bus and reads back a different bit due to interference or faults on the bus.
    {
        /* "Bit Error" handling code should be put here. */
        // print("\n Bit error.");
    }

    if (ErrorMask & XCANPS_ESR_STER_MASK) //STUFF ERROR: the CAN controller detects more than 5 consecutive identical bits (either all 0s or all 1s) in a frame.
    {
        /* "Stuff Error" handling code should be put here. */

        print("\n Stuff error.");
    }

    if (ErrorMask & XCANPS_ESR_FMER_MASK) //FORM ERROR: when a fixed-form field in the frame (e.g., CRC delimiter, ACK delimiter, or EOF) contains an illegal value.
    {
        /* "Form Error" handling code should be put here. */
        // print("\n Form error.");
    }

    if (ErrorMask & XCANPS_ESR_CRCER_MASK)  //CRC ERROR: when the CRC value calculated by the receiver does not match the CRC field sent by the transmitter.
    {
        /* "CRC Error" handling code should be put here. */
        print("\n CRC error.");
    }

    LoopbackError = TRUE;
    RecvDone = TRUE;
    SendDone = TRUE;

    // XCanPs_IntrEnable(CallBackRef, XCANPS_IXR_ERROR_MASK);
}

static void EventHandler(void *CallBackRef, u32 IntrMask)
{
    XCanPs *CanPtr = (XCanPs *)CallBackRef;

    print ("\n EventHandler");

    if (IntrMask & XCANPS_IXR_BSOFF_MASK) 
    {
        // Entering Bus off status interrupt requires the CAN device be reset and reconfigured.
        print ("\n entering Bus off status ");
        XCanPs_Reset(CanPtr);
        CAN_Config(CanPtr);

        return;
    }

    if (IntrMask & XCANPS_IXR_RXOFLW_MASK) 
    {
        /* Code to handle RX FIFO Overflow Interrupt should be put here. */
        print("\n Rx FIFO overflow interrupt");
    }

    if (IntrMask & XCANPS_IXR_RXUFLW_MASK) 
    {
        /* Code to handle RX FIFO Underflow Interrupt should be put here. */
                print("\n Rx FIFO underflow interrupt");

    }

    if (IntrMask & XCANPS_IXR_TXBFLL_MASK) 
    {
        /* Code to handle TX High Priority Buffer Full Interrupt should be put here. */
                print("\n TxHP buffer full interrupt");

    }

    if (IntrMask & XCANPS_IXR_TXFLL_MASK) 
    {
        /* Code to handle TX FIFO Full Interrupt should be put here. */
                print("\n Tx FIFO Full interrupt");

    }

    if (IntrMask & XCANPS_IXR_WKUP_MASK) 
    {
        /* Code to handle Wake up from sleep mode Interrupt should be put here. */
                print("\n Wake up from sleep mode interrupt");

    }

    if (IntrMask & XCANPS_IXR_SLP_MASK) 
    {
        /* Code to handle Enter sleep mode Interrupt should be put here. */
                print("\n Enter sleep mode interrupt");
    }

    if (IntrMask & XCANPS_IXR_ARBLST_MASK) 
    {
        /* Code to handle Lost bus arbitration Interrupt should be put here. */
                print("\n Lost bus arbitration interrupt");
    }
}






// void Initialize_CAN_Frame(CAN_Frame *frameInstPTR, u8 DLC)
// {
//     frameInstPTR->DLC = DLC;

//     // // Allocate memory for each data field based on DLC
//     // frameInstPTR->DataField_1 = malloc(DLC / 2);
//     // frameInstPTR->DataField_2 = malloc(DLC / 2);

//     // Allocate memory for the data fields
//     if (DLC > 0)
//     {
//         frameInstPTR->DataField_1 = malloc(DLC); // Allocate total memory for both fields
//         if (frameInstPTR->DataField_1)
//         {
//             // DataField_2 starts from halfway (or as remainder)
//             frameInstPTR->DataField_2 = frameInstPTR->DataField_1 + (DLC / 2);
//         }
//         else
//         {
//             frameInstPTR->DataField_1 = NULL;
//             frameInstPTR->DataField_2 = NULL;
//         }
//     }
//     else
//     {
//         frameInstPTR->DataField_1 = NULL;
//         frameInstPTR->DataField_2 = NULL;
//     }


//     // Check for allocation failure
//     if (!frameInstPTR->DataField_1 || !frameInstPTR->DataField_2)
//     {
//         // Free already allocated memory and handle the error
//         free(frameInstPTR->DataField_1);
//         free(frameInstPTR->DataField_2);
//         frameInstPTR->DataField_1 = NULL;
//         frameInstPTR->DataField_2 = NULL;
//     }
// }

// void free_CAN_Frame(CAN_Frame *frame)
// {
//     // Free allocated memory for data fields
//     free(frame->DataField_1);
//     free(frame->DataField_2);
//     frame->DataField_1 = NULL;
//     frame->DataField_2 = NULL;
// }







// CAN_Frame create_default_CAN_Frame()
// {
//     CAN_Frame frame;

//     frame.ID = 0;
//     frame.DLC = 0;
//     frame.RTR_flag = FALSE;

//     // Allocate zero-length data fields since DLC = 0
//     frame.DataField_1 = malloc(1); // Allocate minimal memory to avoid NULL
//     frame.DataField_2 = malloc(1);

//     if (frame.DataField_1)
//         frame.DataField_1[0] = 0;

//     if (frame.DataField_2)
//         frame.DataField_2[0] = 0;

//     return frame;
// }