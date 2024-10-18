
#include <stdio.h>
#include "xparameters.h"
#include "xil_printf.h"

#include "xscugic.h"
#include "scugic_header.h"

#include "xdmaps.h"
#include "dmaps_header.h"

#include "xgpio.h"
#include "gpio_header.h"

#include "xscutimer.h"
#include "scutimer_header.h"

#include "xscuwdt.h"
#include "scuwdt_header.h"

#include "xttcps.h"
#include "ttcps_header.h"

#include "xuartps.h"
#include "uartps_header.h"
int main ()
{

    static XScuGic intc;
    static XDmaPs dmac_s;
    static XGpio axi_gpio_0;
    static XScuTimer scutimer;
    static XScuWdt scuwdt;
    static XTtcPs ttc0;

    print("---Entering main---\n\r");

    {
        int status;
        print("\r\nRunning ScuGicInterruptSetup for intc ... \r\n");
        status = ScuGicInterruptSetup(&intc, XPAR_INTC_BASEADDR);
        if (status == 0) {
            print("ScuGicInterruptSetup PASSED \r\n");
        } else {
            print("ScuGicInterruptSetup FAILED \r\n");
        }
    }

    {
        int status;
        print("\r\nRunning XDmaPs_Example_W_Intr for dmac_s ... \r\n");
        status = XDmaPs_Example_W_Intr(&dmac_s, XPAR_DMAC_S_BASEADDR);
        if (status == 0) {
            print("XDmaPs_Example_W_Intr PASSED \r\n");
        } else {
            print("XDmaPs_Example_W_Intr FAILED \r\n");
        }
    }

    {
        int status;
        print("\r\nRunning GpioOutputExample for axi_gpio_0 ... \r\n");
        status = GpioOutputExample(&axi_gpio_0, XPAR_AXI_GPIO_0_BASEADDR);
        if (status == 0) {
            print("GpioOutputExample PASSED \r\n");
        } else {
            print("GpioOutputExample FAILED \r\n");
        }
    }

    {
        int status;
        print("\r\nRunning ScuTimerPolledExample for scutimer ... \r\n");
        status = ScuTimerPolledExample(&scutimer, XPAR_SCUTIMER_BASEADDR);
        if (status == 0) {
            print("ScuTimerPolledExample PASSED \r\n");
        } else {
            print("ScuTimerPolledExample FAILED \r\n");
        }
    }

    {
        int status;
        print("\r\nRunning ScuTimerIntrExample for scutimer ... \r\n");
        status = ScuTimerIntrExample(&scutimer, XPAR_SCUTIMER_BASEADDR);
        if (status == 0) {
            print("ScuTimerIntrExample PASSED \r\n");
        } else {
            print("ScuTimerIntrExample FAILED \r\n");
        }
    }

    {
        int status;
        print("\r\nRunning ScuWdtIntrExample for scuwdt ... \r\n");
        status = ScuWdtIntrExample(&scuwdt, XPAR_SCUWDT_BASEADDR);
        if (status == 0) {
            print("ScuWdtIntrExample PASSED \r\n");
        } else {
            print("ScuWdtIntrExample FAILED \r\n");
        }
    }

    {
        int status;
        print("\r\nRunning ScuWdtPolledExample for scuwdt ... \r\n");
        status = ScuWdtPolledExample(&scuwdt, XPAR_SCUWDT_BASEADDR);
        if (status == 0) {
            print("ScuWdtPolledExample PASSED \r\n");
        } else {
            print("ScuWdtPolledExample FAILED \r\n");
        }
    }

    {
        int status;
        print("\r\nRunning TmrInterruptExample for ttc0 ... \r\n");
        status = TmrInterruptExample(&ttc0, XPAR_TTC0_BASEADDR);
        if (status == 0) {
            print("TmrInterruptExample PASSED \r\n");
        } else {
            print("TmrInterruptExample FAILED \r\n");
        }
    }

    print("---Exiting main---");
    return 0;
}
