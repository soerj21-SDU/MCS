#include "includes/interrupts.h"

u16 GlobalIntrMask;

/******************************************************************************
* @param	instancePtr Pointer to an XGpio instance to be worked on.
* @param	BaseAddress Base Address of the instance. 
* @param	IntrMask    Intterrupt mask 
* @param	ISR         Handler to be executed.  

* @return	XST_SUCCESS.
*
* @note		
*****************************************************************************/




/******************************************************************************
* @param	instancePtr Pointer to a CANps instance to be worked on.
* @param	BaseAddress Base Address of the instance. 
* @param	IntrMask    Intterrupt mask 
* @param	ISR         Handler to be executed.  

* @return	XST_SUCCESS.
*
* @note		
*****************************************************************************/
int setup_CAN_Interrupt(XCanPs *InstancePtr, UINTPTR BaseAddress, u16 IntrMask)
{
    int Status;
    XCanPs_Config *CAN_CFG_ptr;
    
	CAN_CFG_ptr = XCanPs_LookupConfig(BaseAddress); 	// Find hardware configuration from Vivado's generated file xparameters.h
        if (CAN_CFG_ptr == NULL) 
        { 
            return XST_FAILURE;
        }

    GlobalIntrMask = IntrMask;

    Status = XSetupInterruptSystem(InstancePtr, &XCanPs_IntrHandler, CAN_CFG_ptr->IntrId, CAN_CFG_ptr->IntrParent, XINTERRUPT_DEFAULT_PRIORITY);
        if (Status != XST_SUCCESS) 
        {
            print("Failed to setup CAN interrupt");
            return XST_FAILURE; 
        }

	XCanPs_IntrEnable(InstancePtr, XCANPS_IXR_ALL);	/* Enable all interrupts in CAN device.*/

	// XDisconnectInterruptCntrl(ConfigPtr->IntrId, ConfigPtr->IntrParent);

    return Status; 
}
