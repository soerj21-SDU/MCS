#include "interrupts.h"

/******************************************************************************
* @param	instancePtr Pointer to an XGpio instance to be worked on.
* @param	BaseAddress Base Address of the instance. 
* @param	IntrMask channel
*
* @return	XST_SUCCESS.
*
* @note		
*****************************************************************************/
int setupInterrupts (  XGpio *InstancePtr,   UINTPTR BaseAddress,   u16 IntrMask   )
{
    XGpio_Config *ConfigPtr;                        
    ConfigPtr = XGpio_LookupConfig(BaseAddress);  
    GlobalIntrMask = IntrMask;

    int Status;

    Status = XSetupInterruptSystem(InstancePtr,     &GpioHandler,    ConfigPtr->IntrId,     ConfigPtr->IntrParent,    XINTERRUPT_DEFAULT_PRIORITY);
        if (Status != XST_SUCCESS) 
        {
            print("Failed to setup interrupt");
            return XST_FAILURE;
        }

    XGpio_InterruptEnable(InstancePtr, IntrMask);
    XGpio_InterruptGlobalEnable(InstancePtr);

	// XDisconnectInterruptCntrl(ConfigPtr->IntrId, ConfigPtr->IntrParent);

    return Status; 
}

void GpioHandler(void *CallbackRef)
{
	XGpio *GpioPtr = (XGpio *)CallbackRef;

    int DELAY = 100000000;
    for(int i = 0; i < DELAY; i++) {};
    print("\n I HAVE BEEN INTERRUPTED"); 
    for(int i = 0; i < DELAY; i++) {};

	XGpio_InterruptClear(GpioPtr,  GlobalIntrMask);
}

