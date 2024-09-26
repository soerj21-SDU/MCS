/******************************************************************************
* Copyright (C) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xinterrupt_wrap.h"
#include "xparameters.h"

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
    ConfigPtr = XGpio_LookupConfig(XPAR_GPIO_0_DEVICE_ID);
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
        // Your main application code here
    }

    cleanup_platform();
    return 0;
}