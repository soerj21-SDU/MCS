#include <stdint.h>
#include <stdio.h>
#include <xcanps.h>
#include <xgpio.h>
#include <xil_types.h>
#include <xstatus.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xparameters_ps.h"

#include "includes/SDC.h"
#include "includes/states.h"
#include "includes/GPIO.h"
#include "includes/interrupts.h"
#include "includes/CAN.h"

// #define FRAME_DATA_LENGTH	8 /* Frame Data field length */

// #define XCANPS_MAX_FRAME_SIZE_IN_WORDS (XCANPS_MAX_FRAME_SIZE / sizeof(u32))
// static u32 NEW_TxFrame[XCANPS_MAX_FRAME_SIZE_IN_WORDS];


int DELAY = 100000000;
int main()
{
    int status; 
    init_platform();


    while(1)
    {
        switch (state) 
        {
            case (ST_INIT) :
            {
                status = CAN_init(&CAN0_PS_inst, CAN0_base_address);
                    if (status != XST_SUCCESS) 
                    {
                        print("\nInitialization of CAN0 failed.");
                        return XST_FAILURE;
                    }

                CAN_enter_normal_mode(&CAN0_PS_inst);
                // CAN_enter_loopback_mode(&CAN0_PS_inst);

                // CAN_enter_snoop_mode(&CAN0_PS_inst);





                // print("\nIn Normal Mode");


                u32 CAN_ID = 0b00111;  // Example CAN ID
                // u32 CAN_ID = 0b11111111111;  // Example CAN ID
                // u32 CAN_ID = 1488;  // Example CAN ID

                u8 Data[] = {0};  // Example data to send
                // u8 Data = 0;  // Example data to send
                // // u8 Data = 0b1111;  // Example data to send
                // u32 DataLength = sizeof(Data);  // Data length in bytes
                u32 DataLength = 1;

                status = CAN_Send_Data_Frame(&CAN0_PS_inst, CAN_ID, Data, DataLength);

                // state = ST_IDLE;



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


                break;
            }

            case (ST_IDLE) :
            { 




                // if (XCanPs_IsRxEmpty(&CAN0_PS_inst))
                // {
                //     print("\n RxFIFO is empty");
                // }
                // else
                // {
                //     print("\n RxFIFO is NOT empty");
                // }


                // for(int i = 0; i < 100000000; i++)
                // {

                // } //1 sec delay





                // CAN_enter_loopback_mode(&CAN1_PS_inst);

                
                // TxFrame0[0] = (u32)XCanPs_CreateIdValue(  (u32)TEST_MESSAGE_ID, 0, 0, 0, 0  ); // Create message identifier value 
                // TxFrame0[1] = (u32)XCanPs_CreateDlcValue( (u32)FRAME_DATA_LENGTH   ); // Create data-length code value (how many data bytes in frame)

                // // Fill in known data to verify
                // u8 *FramePtr  = (u8 *)(&TxFrame0[2]);
                // for (int Index = 0; Index < FRAME_DATA_LENGTH; Index++) 
                // {
                //     *FramePtr++ = (u8)Index;
                // }

                // // --------------------------------------------------CAN0--------------------------------------------------
                // status = CAN_send(&CAN0_PS_inst, TxFrame0); // Send the frame. This function returns XST_FAILURE if TX FIFO is full.
                //     if (status != XST_SUCCESS) 
                //     {
                //         xil_printf("Sending from CAN0 failed.");
                //         while(1);
                //     }

                
                // do // Receive a frame and verify contents. This function returns XST_FAILURE if RX FIFO is empty.
                // {
                //     status = CAN_receive(&CAN0_PS_inst, RxFrame0);
                // }
                // while (status != XST_SUCCESS);


                // if (RxFrame0[0] != (u32)XCanPs_CreateIdValue((u32)TEST_MESSAGE_ID, 0, 0, 0, 0)) 
                // {
                //     xil_printf("Loopback error CAN0.");
                // }

                // if ((RxFrame0[1] & ~XCANPS_DLCR_TIMESTAMP_MASK) != TxFrame0[1]) 
                // {
                //     xil_printf("Loopback error CAN0.");
                // }

                // FramePtr = (u8 *)(&RxFrame0[2]);
                // for (int Index = 0; Index < FRAME_DATA_LENGTH; Index++) 
                // {
                //     if (*FramePtr++ != (u8)Index) {
                //         xil_printf("Loopback error CAN0.");
                //     }
                // }


                // --------------------------------------------------CAN1--------------------------------------------------
                // status = CAN_send(&CAN1_PS_inst, TxFrame1); // Send the frame. This function returns XST_FAILURE if TX FIFO is full.
                //     if (status != XST_SUCCESS) 
                //     {
                //         xil_printf("Sending from CAN0 failed.");
                //         while(1);
                //     }

                
                // do // Receive a frame and verify contents. This function returns XST_FAILURE if RX FIFO is empty.

                // {
                //     status = CAN_receive(&CAN1_PS_inst, RxFrame1);
                // }
                // while (status != XST_SUCCESS);

                // if (RxFrame1[0] != (u32)XCanPs_CreateIdValue((u32)TEST_MESSAGE_ID, 0, 0, 0, 0)) 
                // {
                //     xil_printf("Loopback error CAN1.");
                // }

                // if ((RxFrame1[1] & ~XCANPS_DLCR_TIMESTAMP_MASK) != TxFrame1[1]) 
                // {
                //     xil_printf("Loopback error CAN1.");
                // }

                // FramePtr = (u8 *)(&RxFrame1[2]);
                // for (int Index = 0; Index < FRAME_DATA_LENGTH; Index++) 
                // {
                //     if (*FramePtr++ != (u8)Index) {
                //         xil_printf("Loopback error CAN1.");
                //     }
                // }

                // xil_printf("Loopback finished correctly.");
                // xil_printf("Remember to confirm CAN data rate.");

                break; 
            }

            case (ST_LV_SYSTEMS_ACTIVE) : //----------------------------------------------------------------
            {
            //activate ProFETs
                break;
            }

            case (ST_PRECHARGING) : //----------------------------------------------------------------------
            {
            // enable SDC if able
            // close precharge contactor
                break; 
            }

            case (ST_TRACTIVE) : //-------------------------------------------------------------------------
            {
            

                break; 
            }

            case (ST_DRIVE) : //----------------------------------------------------------------------------
            {
                break; 
            }
            
            case (ST_ERROR) : //----------------------------------------------------------------------------
            {
                print ("I am in error");
                for(int i = 0; i < DELAY; i++) {};

                //Communication error
                //communication lost
                // timeouts
                // SDC opens
                break; 
            }
                // gStateMachine.status.stateName := 'Initialize';
                // stateInit;
                // stateChangeInit;

        print("Hello World\n\r");
        print("Successfully ran Hello World application");
        cleanup_platform();
        return 0;
        }
    } 
}