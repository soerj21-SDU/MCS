/* Project based on the platform_intr platform */


/* includes */

#include "xgpio.h"
#include "xinterrupt_wrap.h"
#include "sleep.h"
#include "xparameters.h"

/* defines */

#define GPIO_DEVICE_ID XPAR_AXI_GPIO_0_BASEADDR
#define GPIO_CHANNEL 1
// #define GPIO_INTERRUPT_ID XPAR_FABRIC_GPIO_0_VEC_ID /deafult
#define GPIO_INTERRUPT_ID XPAR_AXI_GPIO_0_INTERRUPTS
#define GPIO_INTERRUPT_MASK 0x1

XGpio Gpio;

void GpioIntrHandler(void *CallbackRef) {
    // Handle the interrupt
    XGpio_InterruptClear(&Gpio, GPIO_INTERRUPT_MASK);
    print("In interrupt\n\r");
}

int main() {
    int Status;

    // Initialize GPIO
    Status = XGpio_Initialize(&Gpio, GPIO_DEVICE_ID);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&Gpio, GPIO_CHANNEL, 0xFFFFFFFF); // Set all pins as input

    // Set up interrupt system
    Status = XSetupInterruptSystem(&Gpio, GpioIntrHandler, GPIO_INTERRUPT_ID, XPAR_SCUGIC_SINGLE_DEVICE_ID, XINTERRUPT_DEFAULT_PRIORITY);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    // Enable GPIO interrupts
    XGpio_InterruptEnable(&Gpio, GPIO_INTERRUPT_MASK);
    XGpio_InterruptGlobalEnable(&Gpio);

    while (1) {
        sleep(1);
        print("In while\n\r");
    }

    return 0;
}
