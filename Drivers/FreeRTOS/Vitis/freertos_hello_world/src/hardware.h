#include "xparameters.h"
#include "xgpio.h"


void forloop_delay();

int initialize_LEDs(XGpio *CallbackRef, UINTPTR Baseaddr);

void toggle_LED(void *CallbackRef);