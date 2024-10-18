#include "xparameters.h"
#include "xgpio.h"
#include "xil_exception.h"
#include "xinterrupt_wrap.h"

#define BUTTON_INTERRUPT XGPIO_IR_CH1_MASK  /* Channel 1 Interrupt Mask */
static u16 GlobalIntrMask; /* GPIO channel mask that is needed by the Interrupt Handler */


void GpioHandler(void *CallBackRef);

int setupInterrupts (  XGpio *InstancePtr,   UINTPTR BaseAddress,   u16 IntrMask   );
