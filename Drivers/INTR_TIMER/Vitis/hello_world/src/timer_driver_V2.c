#include "xparameters.h"
#include "xscutimer.h"
#include "xinterrupt_wrap.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define TIMER_LOAD_VALUE 0xFFFFFFFF

int volatile while_status = 1;

static void TimerIntrHandler_2_sec(void *CallBackRef);

int timer_interrupt_setup(XScuTimer *TimerInstancePtr, UINTPTR BaseAddress)
{
    int status;
    XScuTimer_Config *ConfigPtr;

    ConfigPtr = XScuTimer_LookupConfig(BaseAddress);

    status = XScuTimer_CfgInitialize(TimerInstancePtr, ConfigPtr, ConfigPtr->BaseAddr);
    
    if (status != XST_SUCCESS) {
        printf("CfgInitialize failed");
        return XST_FAILURE;
    }

    status = XScuTimer_SelfTest(TimerInstancePtr);
    if (status != XST_SUCCESS) {
        printf("SelfTest failed");
        return XST_FAILURE;
    }

    status = XSetupInterruptSystem(TimerInstancePtr, TimerIntrHandler_2_sec, TimerInstancePtr->Config.IntrId, TimerInstancePtr->Config.IntrParent, XINTERRUPT_DEFAULT_PRIORITY);
    if (status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    XScuTimer_EnableInterrupt(TimerInstancePtr);
    XScuTimer_EnableAutoReload(TimerInstancePtr);

    return XST_SUCCESS;
}

static void enable_interrupt(XScuTimer *TimerInstancePtr)
{
    XScuTimer_LoadTimer(TimerInstancePtr, TIMER_LOAD_VALUE);
    XScuTimer_Start(TimerInstancePtr);
}

static void disable_interrupt(XScuTimer *TimerInstancePtr)
{
    XScuTimer_Stop(TimerInstancePtr);
    XDisconnectInterruptCntrl(TimerInstancePtr->Config.IntrId, TimerInstancePtr->Config.IntrParent);
    XScuTimer_Stop(TimerInstancePtr);    
}

static void TimerIntrHandler_2_sec(void *CallBackRef)
{
    XScuTimer *TimerInstancePtr = (XScuTimer *)CallBackRef;
    if (XScuTimer_IsExpired(TimerInstancePtr)) {
        XScuTimer_ClearInterruptStatus(TimerInstancePtr);
        while_status = 0;
    }
}


/*-----------------TEST CODE -----------------*/
// #define TIMER_BASEADDR XPAR_SCUTIMER_BASEADDR

// XScuTimer TimerInstance;
// int status;

// int main() {
//     printf("Starting program\n\r");
//     status = timer_interrupt_setup(&TimerInstance, TIMER_BASEADDR);
//     enable_interrupt(&TimerInstance);
//     while (while_status == 1) {
//         printf("in while\n\r");
//         sleep(1);
//     }
//     disable_interrupt(&TimerInstance);
//     printf("Out of while test complete\n\r");

//     return 0;
// }