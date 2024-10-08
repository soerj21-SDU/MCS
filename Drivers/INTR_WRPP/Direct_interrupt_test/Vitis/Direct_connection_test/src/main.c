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
#include "xparameters.h"
#include "xparameters_ps.h"
#include "xgpiops.h"
#include "sleep.h"

#define BTN_PIN 54

XGpioPs BTN_handler;

int carrier;




int main()
{
    init_platform();

    print("Program starting\n\r");

    XGpioPs_SetDirection(&BTN_handler, BTN_PIN, 0);


    while (1) {
        carrier = XGpioPs_ReadPin(&BTN_handler, BTN_PIN); 

        if (carrier==1) {
            print("Button pressed");
        }

        sleep(1);
        print("In while");
    }    



    cleanup_platform();
    return 0;
}
