#include <stdint.h>
#include <stdio.h>
#include <xcanps.h>
#include <xil_types.h>
#include <xstatus.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xparameters_ps.h"
#include "interrupts.h"
#include "CAN.h"

// #define FRAME_DATA_LENGTH	8 /* Frame Data field length */

// #define XCANPS_MAX_FRAME_SIZE_IN_WORDS (XCANPS_MAX_FRAME_SIZE / sizeof(u32))
// static u32 NEW_TxFrame[XCANPS_MAX_FRAME_SIZE_IN_WORDS];


int DELAY = 100000000;
int main()
{

    int status; 
    init_platform();


    status = CAN_init(&CAN0_PS_inst, CAN0_base_address);
        if (status != XST_SUCCESS) 
        {
            print("\nInitialization of CAN0 failed.");
            return XST_FAILURE;
        }
        


    CAN_enter_normal_mode(&CAN0_PS_inst);
    // CAN_enter_loopback_mode(&CAN0_PS_inst);
    // CAN_enter_snoop_mode(&CAN0_PS_inst);
    while(1)
    {
        u32 CAN_ID = 0b00111;  // Example CAN ID
        // u32 CAN_ID = 0b11111111111;  // Example CAN ID
        // u32 CAN_ID = 1488;  // Example CAN ID

        u8 Data[] = {0b111};  // Example data to send
        // u8 Data = 0;  // Example data to send
        // u8 Data = 0b1111;  // Example data to send
        u32 DataLength = sizeof(Data);  // Data length in bytes
        // u32 DataLength = 1;

        status = CAN_Send_Data_Frame(&CAN0_PS_inst, CAN_ID, Data, DataLength);
        // status = CAN_Send_Data_Frame(&CAN1_PS_inst, CAN_ID, Data, DataLength);






        // u8 *FramePtr;
        // NEW_TxFrame[0] = (u32)XCanPs_CreateIdValue((u32)3, 0, 0, 0, 0);
        // NEW_TxFrame[1] = (u32)XCanPs_CreateDlcValue((u32)FRAME_DATA_LENGTH);

        // FramePtr = (u8 *)(&NEW_TxFrame[2]);

        // int Index;

        // for (Index = 0; Index < FRAME_DATA_LENGTH; Index++) 
        // {
        //     *FramePtr++ = (u8)Index;
        // }

        // while (XCanPs_IsTxFifoFull(&CAN0_PS_inst) == TRUE);

        // int Status = XCanPs_Send(&CAN0_PS_inst, NEW_TxFrame);
        //     if (Status != XST_SUCCESS) 
        //     {
        //         print("\nFailed to send");
        //     }




        for(int i = 0; i < 1000000000; i++)
        {
        } //1 sec delay 1000000000


        // if (XCanPs_IsRxEmpty(&CAN0_PS_inst))
        // {
        //     print("\n RxFIFO is empty");
        // }
        // else
        // {
        //     print("\n RxFIFO is NOT empty");
        // }


        // for(int i = 0; i < 200000000; i++)
        // {

        // } //2 sec delay
    }    


    cleanup_platform();
    return 0;
}









