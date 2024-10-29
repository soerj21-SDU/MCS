#include <stdio.h>
#include "xparameters.h"
#include "xgpio.h"

int setup_AXI_GPIO (UINTPTR AXI_GPIO_BaseAddress,   XGpio *instancePtr, u8 channel, u8 direction );

// int  setup_PS_GPIO  (u32 BaseAddr,   XGpioPs *GPIO_inst,   u8 pin,  u8 direction,   XGpioPs_Config *GPIO_ConfigPtr);
// int setup_PS_GPIO(u32 BaseAddr,   XGpioPs *GPIO_inst,   u8 pin,    u8 direction,    XGpioPs_Config *GPIO_ConfigPtr )
// {
//     int Status; 
    
//     GPIO_ConfigPtr = XGpioPs_LookupConfig(BaseAddr);         
//     Status = XGpioPs_CfgInitialize(GPIO_inst, GPIO_ConfigPtr, GPIO_ConfigPtr ->BaseAddr);
//         if (Status != XST_SUCCESS) 
//         {
//             return XST_FAILURE;
//         }
//     XGpioPs_SetDirectionPin(GPIO_inst, pin, direction);
//         if (direction == 1)
//         {
//                 XGpioPs_SetOutputEnablePin(GPIO_inst, LED_PIN, 1);
//         }

//     return XST_SUCCESS;
// }


