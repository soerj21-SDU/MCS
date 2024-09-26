#include <sleep.h>
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xinterrupt_wrap.h"
#include "xparameters.h"
#include "sleep.h"

/****************************************************************************/ //SJJ
#define GPIO_0_DEVICE_BASEADDRES XPAR_AXI_GPIO_0_BASEADDR                       // swd_4_bits
#define GPIO_1_DEVICE_BASEADDRES XPAR_AXI_GPIO_1_BASEADDR                       // leds_4_bits

// Define the GPIO device instance
XGpio Gpio;

// Interrupt handler function
void GpioIntrHandler(void *CallbackRef) {
    // Clear the interrupt
    XGpio_InterruptClear((XGpio *)CallbackRef, 1);

    // Handle the interrupt (e.g., toggle an LED)
    xil_printf("Interrupt occurred!\n\r");
}

// Function to set up the interrupt system
int SetupInterruptSystem(XGpio *GpioInstancePtr) {
    int Status;
    XGpio_Config *ConfigPtr;

    // Initialize the GPIO driver
    ConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_0_BASEADDR);
    if (ConfigPtr == NULL) {
        return XST_FAILURE;
    }

    Status = XGpio_CfgInitialize(GpioInstancePtr, ConfigPtr, ConfigPtr->BaseAddress);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    // Set up the interrupt system
    Status = XSetupInterruptSystem(GpioInstancePtr, (void *)GpioIntrHandler, ConfigPtr->IntrId, ConfigPtr->IntrParent, XINTERRUPT_DEFAULT_PRIORITY);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    // Enable GPIO interrupts
    XGpio_InterruptEnable(GpioInstancePtr, 1);
    XGpio_InterruptGlobalEnable(GpioInstancePtr);

    return XST_SUCCESS;
}

int main() {
    int Status;

    init_platform();

    print("Hello World\n\r");

    // Set up the interrupt system
    Status = SetupInterruptSystem(&Gpio);
    if (Status != XST_SUCCESS) {
        xil_printf("Interrupt setup failed\n\r");
        cleanup_platform();
        return XST_FAILURE;
    }

    print("Successfully ran Hello World application\n\r");

    // Main loop
    while (1) {
        print("In while \n\r");
        sleep(10);
    }

    cleanup_platform();
    return 0;
}