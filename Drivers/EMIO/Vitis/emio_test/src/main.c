#include <stdio.h>
#include <xstatus.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xparameters_ps.h"
#include "sleep.h"
#include "xgpiops.h"

// Define the pin numbers for the Button and LED
#define Button 54
#define LED 55
#define BASEADRESS XPAR_XGPIOPS_0_BASEADDR

// Declare variables for status and carrier signal
int Status, Carrier;

// Declare GPIO instance and configuration pointer
XGpioPs Gpio;
XGpioPs_Config *ConfigPtr;

int main()
{
    // Initialize the platform
    init_platform();
    print("Starting program\n\r");

    // Lookup the GPIO configuration based on the base address
    ConfigPtr = XGpioPs_LookupConfig(BASEADRESS);
    // Initialize the GPIO driver
    Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddr);
    print("Initialize complete\n\r");

    if (Status != XST_SUCCESS) {
        print("Initialize fail\n\r");
        return XST_FAILURE;
    }

    print("Pin configuration\n\r");

    // Set the direction of the button pin to input
    XGpioPs_SetDirectionPin(&Gpio, Button, 0);


    // Set the direction of the LED pin to output
    XGpioPs_SetDirectionPin(&Gpio, LED, 1);
    XGpioPs_SetOutputEnablePin(&Gpio, LED, 1);

    print("Pin configuration complete\n\r");
    

    while (1) {
        Carrier = XGpioPs_ReadPin(&Gpio, Button);
        XGpioPs_WritePin(&Gpio, LED, Carrier);
    }

    cleanup_platform();
    return 0;
}
