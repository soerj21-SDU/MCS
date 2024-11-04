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
#include <sys/_intsup.h>
#include "platform.h"
#include "xil_printf.h"
#include "xadcps.h"
#include "xparameters.h"
// #include "sleep.h"

// #define xADC_port 14
// #define xADC_port XADCPS_CH_AUX_MIN

static XAdcPs XAdcInst;
int Xadc_Test_var;
int counter_A = 0;
int counter_B = 0;
int dummy;


int XAdc_read_test(u32 XAdc_base_addr);


int main()
{
    init_platform();

    print("Starting program\n\r");
    print("Running measurements from 0 to 32\n\r");
    do {
    
    #define xADC_port XADCPS_CH_AUX_MIN + counter_A
    
    printf("counter value: %d\n\r", counter_A);
    Xadc_Test_var = XAdc_read_test(XPAR_ADC_BASEADDR);

    counter_A++;
    if (counter_A == 7) {
        counter_A = 13;
    }

    }while (counter_A < 33);

    print("Program complete\n\r");
    cleanup_platform();
    return 0;
}

int XAdc_read_test(u32 XAdc_base_addr)
{
    int Status; 
    XAdcPs_Config *ConfigPtr;
	XAdcPs *XAdcInstPtr = &XAdcInst;
    u32 raw_data;
    float data;

    /*
	* Initialize the XAdc driver.
	*/

    ConfigPtr = XAdcPs_LookupConfig(XAdc_base_addr);
    if (ConfigPtr == NULL) {
        print("Lookup failed\n\r");
        return XST_FAILURE;
	}
    
    XAdcPs_CfgInitialize(XAdcInstPtr, ConfigPtr, ConfigPtr->BaseAddress);


    /*
    * SelfTest
    */
    Status = XAdcPs_SelfTest(XAdcInstPtr);
    if (Status != XST_SUCCESS) {
        print("Selftest failed\n\r");
        return XST_FAILURE;
	}

	/*
	 * Disable the Channel Sequencer before configuring the Sequence
	 * registers.
	 */
    XAdcPs_SetSequencerMode(XAdcInstPtr, XADCPS_SEQ_MODE_SAFE);

    /*
    * Reading data
    */
    int counter_B = 0;
    while (counter_B < 10) {
        print("Reading data\n\r");
        // raw_data = XAdcPs_GetAdcData(XAdcInstPtr, xADC_port);
        raw_data = XAdcPs_GetAdcData(XAdcInstPtr, xADC_port);
        data = XAdcPs_RawToVoltage(raw_data);
        printf("Value in voltage %0f [V]\r\n", data);
        for (int delay = 10000000; delay > 1; delay--) {
            dummy = delay;         
        }
        counter_B++;
    }

    return 0;
    }

