#include <stdio.h>
#include <xinterrupt_wrap.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xparameters_ps.h"
#include "sleep.h"
#include "xgpio.h"


#define GPIO_0_BASEADRESS XPAR_AXI_GPIO_0_BASEADDR
#define BUTTON_CHANNEL 1
#define GPIO_0_INTERRUPT_ID XPAR_AXI_GPIO_0_INTERRUPTS
#define GPIO_INTERRUPT_MASK 0x1

int Status_BTN_0;
int Button_value;

XGpio BUTTON_0;

void INTR_BUTTON_0(){
    // Handle interrupt on button 0
    XGpio_InterruptClear(&BUTTON_0, GPIO_INTERRUPT_MASK);
    print("Intr BTN 0\n\r");
}

int main()
{
    print("Starting application\n\r");
    Status_BTN_0 = XGpio_Initialize(&BUTTON_0, GPIO_0_BASEADRESS);
    if (Status_BTN_0 != XST_SUCCESS) {
        print("Fail 1");
        return XST_FAILURE;
    }
    print("Debug 1\n\r");                        

    // Initialize GPIO
    XGpio_SetDataDirection(&BUTTON_0, BUTTON_CHANNEL, 0xf); // 0x0 = output, 0xf 0 input    

    // Initialize interrupt
    // BUTTON 0
    Status_BTN_0 = XSetupInterruptSystem(&BUTTON_0, INTR_BUTTON_0, GPIO_0_INTERRUPT_ID, XPAR_SCUGIC_SINGLE_DEVICE_ID, XINTERRUPT_DEFAULT_PRIORITY);    
    if (Status_BTN_0 != XST_SUCCESS) {
        print("Fail 2");
        return XST_FAILURE;
    }

    // Enable GPIO interrupts
    XGpio_InterruptEnable(&BUTTON_0, GPIO_INTERRUPT_MASK);
    XGpio_InterruptGlobalEnable(&BUTTON_0);

    while(1){
        print("In while\n\r");
        sleep(1);
    }
    return 0;
}
