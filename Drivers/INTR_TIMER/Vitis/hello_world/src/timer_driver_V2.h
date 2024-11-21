#include "timer_driver.c"



/* Funcitons */
int timer_interrupt_setup(XScuTimer *TimerInstancePtr, UINTPTR BaseAddress);
static void enable_interrupt(XScuTimer *TimerInstancePtr);
static void disable_interrupt(XScuTimer *TimerInstancePtr);
static void TimerIntrHandler_2_sec(void *CallBackRef);