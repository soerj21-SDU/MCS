#include <stdio.h>
#include "platform.h"
#include "xgpiops.h"
#include "xparameters.h"

#define LED_DELAY 	20000000
#define LED_PIN 7 //MIO7
XGpioPs LED_inst;

int Status;
XGpioPs_Config *GPIOConfigPtr;
 
int Delay; 

int main()
{
    //GPIO Initilization
    GPIOConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);        // GPIOConfigPtr = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
    Status = XGpioPs_CfgInitialize(&LED_inst, GPIOConfigPtr, GPIOConfigPtr ->BaseAddr);
        if (Status != XST_SUCCESS) 
        {
            return XST_FAILURE;
        }

    XGpioPs_SetDirectionPin(&LED_inst, LED_PIN, 1);
    XGpioPs_SetOutputEnablePin(&LED_inst, LED_PIN, 1);

    while(1)
    {
        XGpioPs_WritePin(&LED_inst, LED_PIN, 0x1);
        for (Delay = 0; Delay < LED_DELAY; Delay++);
        XGpioPs_WritePin(&LED_inst, LED_PIN, 0x0);
        for (Delay = 0; Delay < LED_DELAY; Delay++);
    }
    // XGpioPs_ReadPin(&Gpio,INPUT_PIN) --> used for reading pin. 

    return 0;
}
