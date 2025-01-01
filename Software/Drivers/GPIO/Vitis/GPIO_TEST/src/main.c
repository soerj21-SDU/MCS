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
#include <xgpio_l.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xparameters.h"
#include "xparameters_ps.h"
#include "sleep.h"

/* Definitions */
#define GPIO_0_DEVICE_BASEADDRES XPAR_AXI_GPIO_0_BASEADDR                       // btns_4_bits
#define GPIO_1_DEVICE_BASEADDRES XPAR_AXI_GPIO_1_BASEADDR                       // leds_4_bits
#define LED_CHANNEL 1                                                           // This is not Gpio port ID from Vivado. It states if it is single or dual channel
#define BTN_CHANNEL 1                                                           // This is not Gpio port ID from Vivado. It states if it is single or dual channel


XGpio Gpio_LED;											                        /* GPIO Device driver instance -> LED*/
XGpio Gpio_BTN;											                        /* GPIO Device driver instance -> BTN*/

int Status_LED;
int Status_BTN;

int carrier;

int main()
{
    init_platform();

    print("Application running\n\r");
    
    Status_LED = XGpio_Initialize(&Gpio_LED, GPIO_1_DEVICE_BASEADDRES);
    Status_BTN = XGpio_Initialize(&Gpio_BTN, GPIO_0_DEVICE_BASEADDRES);

    print("Gpio_ports initalized");

    XGpio_SetDataDirection(&Gpio_LED, LED_CHANNEL, 0x0);                        // 0x0 = output
    XGpio_SetDataDirection(&Gpio_BTN, BTN_CHANNEL, 0xf);                        // 0xf = input

    print("Entering while-loop");    

    while (1) {
        carrier = XGpio_DiscreteRead(&Gpio_BTN, BTN_CHANNEL);
                
        XGpio_DiscreteWrite(&Gpio_LED, LED_CHANNEL, carrier); 
    }

    print("Shutting down\n\r");
    cleanup_platform();
    return 0;
}
