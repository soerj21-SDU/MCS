/******************************************************************************
* Copyright (C) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "mc_xadc.h"
#include "xparameters.h"

#define Baseaddr XPAR_XXADCPS_0_BASEADDR


int status; 
u16 xadc_raw;
float xadc_voltage;


int main()
{
    init_platform();

    print("Hello World\n\r");
    print("Successfully ran Hello World application\n\r");

    status = xadc_init(Baseaddr);
    
    if (status == XST_FAILURE) 
        {
            xil_printf("\r\nXADC Initialization error.\r\n");
        } 
    else 
        {
            xil_printf("\r\n xADC Initialization completed successfully.\r\n");
        }

    print("In while loop.\n\r");
    while (1) {
        
        xadc_raw = xadc_get_aux(14);
        
        xadc_voltage = xADC_get_converted_voltage(14);

        xil_printf("\r\nRaw data AUX14: %d.\r\n",  xadc_raw);
        printf("\n Voltage AUX14: %.3f.", xadc_voltage);

        for (int delay = 1000000; delay > 1; delay--) {}

    }


    cleanup_platform();
    return 0;
}
