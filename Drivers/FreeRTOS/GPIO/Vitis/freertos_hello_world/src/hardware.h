#include "xparameters.h"
#include "xgpio.h"


void forloop_delay();

int initialize_LEDs(XGpio *CallbackRef, UINTPTR Baseaddr);

void toggle_LED(void *CallbackRef);

int initialize_SWS(XGpio *CallbackRef, UINTPTR Baseaddr);

void read_SWS(XGpio *CallbackRef);

int get_SWS_value(XGpio *CallbackRef);