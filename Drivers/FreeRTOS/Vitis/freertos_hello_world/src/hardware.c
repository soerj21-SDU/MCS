#include "hardware.h"
#include <xil_printf.h>
#include <xstatus.h>
#include "xgpio.h"

void forloop_delay(){
    for (int delay = 222333333; delay > 0; delay--) {
    }
}

int initialize_LEDs(XGpio *CallbackRef, UINTPTR Baseaddr)
{
    int status;
    print("In initialize_GPIO\r\n");
    
    status = XGpio_Initialize(CallbackRef, Baseaddr);
    if (status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    XGpio_SetDataDirection(CallbackRef, 1, 0x00000000); // Datadirection set to output 

    XGpio_DiscreteWrite(CallbackRef, 1, 0b1000);
    forloop_delay();
    XGpio_DiscreteWrite(CallbackRef, 1, 0b1100);
    forloop_delay();
    XGpio_DiscreteWrite(CallbackRef, 1, 0b1110);
    forloop_delay();
    XGpio_DiscreteWrite(CallbackRef, 1, 0b1111);
    forloop_delay();
    XGpio_DiscreteWrite(CallbackRef, 1, 0b0000);
    print("LEDs initialized\r\n");

    return 1;
}

void toggle_LED(void *CallbackRef){
    int carrier;

    carrier = XGpio_DiscreteRead(CallbackRef, 1);
    XGpio_DiscreteWrite(CallbackRef, 1, ~carrier);
}
