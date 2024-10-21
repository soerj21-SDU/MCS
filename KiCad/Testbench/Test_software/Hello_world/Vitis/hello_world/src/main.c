#include <stdio.h>
#include <xpseudo_asm_gcc.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpiops.h"
#include "sleep.h"

//defines
#define MIO_JF1 13
#define MIO_JF2 10
#define MIO_JF3 11
#define MIO_JF4 12
#define MIO_JF7 0
#define MIO_JF8 9
#define MIO_JF9 14
#define MIO_JF10 15

XGpioPs JF1;
XGpioPs JF2;
XGpioPs JF3;
XGpioPs JF4;
XGpioPs JF7;
XGpioPs JF8;
XGpioPs JF9;
XGpioPs JF10;

XGpioPs_Config *GPIOConfigPtr;

int status;

int main()
{
    init_platform();

    // GPIO Initilization
    GPIOConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
    status = XGpioPs_CfgInitialize(&JF1, GPIOConfigPtr, GPIOConfigPtr ->BaseAddr);
    if (status != XST_SUCCESS) 
    {
        return XST_FAILURE;
    }

    XGpioPs_SetDirectionPin(&JF1, MIO_JF1, 1);
    XGpioPs_SetOutputEnablePin(&JF1, MIO_JF1, 1);
    XGpioPs_WritePin(&JF1, MIO_JF1, 0x1);

    GPIOConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
    status = XGpioPs_CfgInitialize(&JF2, GPIOConfigPtr, GPIOConfigPtr ->BaseAddr);
    if (status != XST_SUCCESS) 
    {
        return XST_FAILURE;
    }    

    XGpioPs_SetDirectionPin(&JF2, MIO_JF2, 1);
    XGpioPs_SetOutputEnablePin(&JF2, MIO_JF2, 1);
    XGpioPs_WritePin(&JF2, MIO_JF2, 0x1);

    GPIOConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
    status = XGpioPs_CfgInitialize(&JF3, GPIOConfigPtr, GPIOConfigPtr ->BaseAddr);
    if (status != XST_SUCCESS) 
    {
        return XST_FAILURE;
    }

    XGpioPs_SetDirectionPin(&JF3, MIO_JF3, 1);
    XGpioPs_SetOutputEnablePin(&JF3, MIO_JF3, 1);
    XGpioPs_WritePin(&JF3, MIO_JF3, 0x1);

    GPIOConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
    status = XGpioPs_CfgInitialize(&JF4, GPIOConfigPtr, GPIOConfigPtr ->BaseAddr);
    if (status != XST_SUCCESS) 
    {
        return XST_FAILURE;
    }

    XGpioPs_SetDirectionPin(&JF4, MIO_JF4, 1);
    XGpioPs_SetOutputEnablePin(&JF4, MIO_JF4, 1);
    XGpioPs_WritePin(&JF4, MIO_JF4, 0x1);

    GPIOConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
    status = XGpioPs_CfgInitialize(&JF1, GPIOConfigPtr, GPIOConfigPtr ->BaseAddr);
    if (status != XST_SUCCESS) 
    {
        return XST_FAILURE;
    }

    XGpioPs_SetDirectionPin(&JF7, MIO_JF7, 1);
    XGpioPs_SetOutputEnablePin(&JF7, MIO_JF7, 1);
    XGpioPs_WritePin(&JF7, MIO_JF7, 0x1);

    GPIOConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
    status = XGpioPs_CfgInitialize(&JF1, GPIOConfigPtr, GPIOConfigPtr ->BaseAddr);
    if (status != XST_SUCCESS) 
    {
        return XST_FAILURE;
    }

    XGpioPs_SetDirectionPin(&JF8, MIO_JF8, 1);
    XGpioPs_SetOutputEnablePin(&JF8, MIO_JF8, 1);
    XGpioPs_WritePin(&JF8, MIO_JF8, 0x1);

    while (1) {
        sleep(10);
        print("In while\n\r");
    }
    
    cleanup_platform();
    return 0;
}
