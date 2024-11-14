#include "GPIO.h"
#include <xgpio.h>
#include <xgpiops.h>
#include <xstatus.h>
#include "states.h"




/****************************************************************************/
/**
* @param	AXI_GPIO_BaseAddress Base Address of the AXI GPIO instance. 
* @param	instancePtr Pointer to an XGpio instance to be worked on.
* @param	channel Contains the channel of the GPIO (1 or 2) to operate on.  
* @param	direction Bitmask specifying which discretes are input and output. Bits set to 0 = output, 1 = input.
*
* @return	XST_SUCCESS.
*
* @note		
*****************************************************************************/
int setup_AXI_GPIO (UINTPTR AXI_GPIO_BaseAddress,   XGpio *instancePtr, u8 channel, u8 direction )
{
    int status = XGpio_Initialize(instancePtr, AXI_GPIO_BaseAddress);
        if (status != XST_SUCCESS) 
        {
            printf("setup_AXI_GPIO failed\r\n");
            return XST_FAILURE;
        }
    XGpio_SetDataDirection(instancePtr, channel, direction);

    return XST_SUCCESS;
}
int setup_MIO_GPIO(UINTPTR MIO_GPIO_BaseAdrr, XGpioPs_Config* ConfigPtr ,XGpioPs* instancePtr, u8 channel, u8 direction){
    ConfigPtr = XGpioPs_LookupConfig(MIO_GPIO_BaseAdrr);
    int status = XGpioPs_CfgInitialize(instancePtr, ConfigPtr, MIO_GPIO_BaseAdrr);
        if (status != XST_SUCCESS) 
    {
        printf("setup_MIO_GPIO failed\r\n");
        return XST_FAILURE;
    }
    XGpioPs_SetDirectionPin(instancePtr, channel, direction);
    XGpioPs_SetOutputEnablePin(instancePtr, channel, 1);
    return XST_SUCCESS;
    }

// write 
// set
// clear





