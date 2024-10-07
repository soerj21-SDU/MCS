#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "Xgpio.h"
 
 
#define LED 0x01   /* Assumes bit 0 of GPIO is connected to an LED  */
#define XGPIO_AXI_BASEADDRESS   XPAR_AXI_GPIO_0_BASEADDR
#define LED_DELAY     10000000
#define LED_CHANNEL 1
 
 
XGpio LED_inst;
 
int main(void)
{
    init_platform();
 
    print("Hello World\n\r");
 
    int Status;
    int Delay;
 
    Status = XGpio_Initialize(&LED_inst, XGPIO_AXI_BASEADDRESS);
        if (Status != XST_SUCCESS)
        {
            xil_printf("Gpio Initialization Failed\r\n");
            return XST_FAILURE;
        }
 
    XGpio_SetDataDirection(&LED_inst, LED_CHANNEL, LED);
 
    while (1)
    {
        XGpio_DiscreteWrite(&LED_inst, LED_CHANNEL, LED); /* Set the LED to High */
        for (Delay = 0; Delay < LED_DELAY; Delay++);
        XGpio_DiscreteClear(&LED_inst, LED_CHANNEL, LED); /* Clear the LED bit  */
        for (Delay = 0; Delay < LED_DELAY; Delay++);
    }
 
    cleanup_platform();
    return 0;
}
 