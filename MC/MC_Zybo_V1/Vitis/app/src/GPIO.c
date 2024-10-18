  #include "GPIO.h"





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
            xil_printf("Gpio Initialization Failed\r\n");
            return XST_FAILURE;
        }
            XGpio_SetDataDirection(instancePtr, channel, direction);

    return XST_SUCCESS;
}






