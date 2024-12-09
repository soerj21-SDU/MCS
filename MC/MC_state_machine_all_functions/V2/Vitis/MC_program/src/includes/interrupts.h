#include "xparameters.h"
#include "xcanps.h"
#include "xil_exception.h"
#include "xinterrupt_wrap.h"

#define BUTTON_INTERRUPT XGPIO_IR_CH1_MASK  /* Channel 1 Interrupt Mask */
extern u16 GlobalIntrMask; /* GPIO channel mask that is needed by the Interrupt Handler */

typedef void     (*ISR_CallBack) (void *CallbackRef);   
// int setup_GPIO_Interrupt(XGpio *InstancePtr, UINTPTR BaseAddress, u16 IntrMask, ISR_CallBack ISR); // ISR == Intr_Handler

// int setup_CAN_Interrupt(XCanPs *InstancePtr, UINTPTR BaseAddress, u16 IntrMask, ISR_CallBack ISR); // ISR == Intr_Handler
int setup_CAN_Interrupt(XCanPs *InstancePtr, UINTPTR BaseAddress, u16 IntrMask); 

// int setup_ADC_Interrupt(XGpio *InstancePtr, UINTPTR BaseAddress, u16 IntrMask, ISR_CallBack ISR);
