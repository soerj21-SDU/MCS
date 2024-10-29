#include "includes/interrupts.h"

/******************************************************************************
* @param	instancePtr Pointer to an XGpio instance to be worked on.
* @param	BaseAddress Base Address of the instance. 
* @param	IntrMask    Intterrupt mask 
* @param	ISR         Handler to be executed.  

* @return	XST_SUCCESS.
*
* @note		
*****************************************************************************/

u16 GlobalIntrMask;

int setupInterrupts(XGpio *InstancePtr, UINTPTR BaseAddress, u16 IntrMask, ISR_CallBack ISR)
{
    XGpio_Config *ConfigPtr;                        
    ConfigPtr = XGpio_LookupConfig(BaseAddress);  

    GlobalIntrMask = IntrMask;

    int Status;

    Status = XSetupInterruptSystem(InstancePtr, ISR, ConfigPtr->IntrId, ConfigPtr->IntrParent, XINTERRUPT_DEFAULT_PRIORITY);
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