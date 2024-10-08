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
#include "sleep.h"
#include "XGpioPs.h"

#define GPIO_INTERRUPT_ID XPAR_AXI_GPIO_0_INTERRUPTS
#define GPIO_INTERRUPT_MASK 0x1

XGpio buttons, LEDs;

int status; 
// XGpio_Config *ConfigPtr;
XGpioPs_Config *ConfigPtr;


int read_shit;

void myInterupt()
{
    // read_shit = XGpio_DiscreteRead(&buttons, 1);
    // print("Read value: %d\n\r", read_shit);
    XGpio_InterruptClear(&buttons, GPIO_INTERRUPT_MASK);
    XGpio_DiscreteWrite(&LEDs, 1, 0x00);
    print("In interrupt\n\r");
    sleep(2);
}

int main()
{
    init_platform();
    print("Starting program\n\r");

    // ConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_0_BASEADDR);

    status = XSetupInterruptSystem(&buttons, myInterupt, GPIO_INTERRUPT_ID, XPAR_SCUGIC_SINGLE_DEVICE_ID, XINTERRUPT_DEFAULT_PRIORITY);
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

    XGpio_InterruptEnable(&buttons, GPIO_INTERRUPT_MASK);
    XGpio_InterruptGlobalEnable(&buttons);
    // XEnableIntrId(ConfigPtr->IntrId, ConfigPtr->IntrParent); // Virker ikke

    // XGpioPs_IntrEnable(&buttons, GPIO_INTERRUPT_MASK); // Med PS i navn Virker ikke lige nu mangler bank og mask
    // XGpio_InterruptGlobalEnable(&buttons); 

    // XGpioPs_IntrEnablePin(&buttons, 0); // Virker ikke  
    
    while(1){
        XGpio_DiscreteWrite(&LEDs, 1, 0b0101);
        sleep(1);
        XGpio_DiscreteWrite(&LEDs, 1, 0b1010);
        sleep(1);
        print("In While\n\r");
    }

    cleanup_platform();
    return 0;
}
