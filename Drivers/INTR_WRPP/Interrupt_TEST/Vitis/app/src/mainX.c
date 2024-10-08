#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xgpiops.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xplatform_info.h"
#include <xil_printf.h>
#include "xinterrupt_wrap.h"
#include "xgpio.h"




XGpio buttons, LEDs;

int status; 
// static XGpioPs Gpio;
// XGpio Gpio;
// XGpioPs_Config *ConfigPtr;


void myInterupt()
{
    // XGpio_DiscreteClear(&LEDs, 1, 0x00);
    // XGpio_InterruptDisable(XGpio *InstancePtr, u32 Mask)
    // XGpio_InterruptGlobalDisable(XGpio *InstancePtr)


    XGpio_DiscreteWrite(&LEDs, 1, 0x00);

}


int main()
{
    init_platform();
    XGpio_Config *ConfigPtr;

    ConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_0_BASEADDR);

    // status = XSetupInterruptSystem(&buttons, &XGpioHandler, ConfigPtr->IntrId, ConfigPtr->IntrParent, XINTERRUPT_DEFAULT_PRIORITY);
    status = XSetupInterruptSystem(&buttons, &myInterupt, ConfigPtr->IntrId, ConfigPtr->IntrParent, XINTERRUPT_DEFAULT_PRIORITY);
    // Status = XSetupInterruptSystem(&Gpio, &XGpioPs_IntrHandler, ConfigPtr->IntrId, ConfigPtr->IntrParent, XINTERRUPT_DEFAULT_PRIORITY);
    // /        XSetupInterruptSystem(&XGpio, &XGpioPs_IntrHandler, ConfigPtr->IntrId, ConfigPtr->IntrParent, XINTERRUPT_DEFAULT_PRIORITY);
    if(status != XST_SUCCESS) 
    {
        return XST_FAILURE;
    }

    status = XGpio_Initialize(&LEDs, XPAR_XGPIO_1_BASEADDR);
    if(status != XST_SUCCESS) 
    {
        return XST_FAILURE;
    }
    
    status = XGpio_Initialize(&buttons, XPAR_XGPIO_0_BASEADDR);
    if(status != XST_SUCCESS) 
    {
        return XST_FAILURE;
    }

    XGpio_SetDataDirection(&LEDs, 1, 0x00);
    XGpio_SetDataDirection(&buttons, 1, 0xFF);

    XEnableIntrId(ConfigPtr->IntrId, ConfigPtr->IntrParent);

    while(1)
        XGpio_DiscreteWrite(&LEDs, 1, 0xFF);
    return 0;

    cleanup_platform();
    return 0;
}

