#include "hardware.h"
#include <xil_printf.h>
#include <xstatus.h>
#include "xgpio.h"

void forloop_delay(){
    for (int delay = 100000000; delay > 0; delay--) {
    }
}

int initialize_LEDs(XGpio *CallbackRef, UINTPTR Baseaddr)
{
    int status;
    print("In initialize_LEDs\r\n");
    
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

int initialize_SWS(XGpio *CallbackRef, UINTPTR Baseaddr)
{
    int status;
    int carrier;
    print("In initialize SWS\r\n");
    
    status = XGpio_Initialize(CallbackRef, Baseaddr);
    if (status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    XGpio_SetDataDirection(CallbackRef, 1, 0xFFFFFFFF); // Datadirection set to output 

    carrier = XGpio_DiscreteRead(CallbackRef, 1);

    xil_printf("SWS initialized, SWS value %d\n\r", carrier);

    return 1;
}

void read_SWS(XGpio *CallbackRef)
{
    int carrier;
    carrier = XGpio_DiscreteRead(CallbackRef, 1);
    xil_printf("SWS value %d\n\r", carrier);
}

int get_SWS_value(XGpio *CallbackRef)
{
    int carrier;
    carrier = XGpio_DiscreteRead(CallbackRef, 1);
    return carrier;
}

