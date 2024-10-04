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
#include "sleep.h"
#include "xgpio.h"


#define GPIO_0_BASEADRESS XPAR_AXI_GPIO_0_BASEADDR
#define BUTTON_CHANNEL 1

int Status_BTN;
int Button_value;

XGpio BUTTON_1;

int main()
{
    init_platform();

    print("Starting application\n\r");
    Status_BTN = XGpio_Initialize(&BUTTON_1, GPIO_0_BASEADRESS);
    print("Debug 1\n\r");                        // 0x0 = output
    XGpio_SetDataDirection(&BUTTON_1, BUTTON_CHANNEL, 0xf);      
    while(1){
        print("In while\n\r");
        Button_value = XGpio_DiscreteRead(&BUTTON_1, BUTTON_CHANNEL);
        if (Button_value == 1 ) {
            print("Button pressed\n\r");
        }
        sleep(1);
    }

    cleanup_platform();
    return 0;
}
