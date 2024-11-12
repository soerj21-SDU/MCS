/*
    Copyright (C) 2017 Amazon.com, Inc. or its affiliates.  All Rights Reserved.
    Copyright (c) 2012 - 2022 Xilinx, Inc. All Rights Reserved.
	SPDX-License-Identifier: MIT


    http://www.FreeRTOS.org
    http://aws.amazon.com/freertos


    1 tab == 4 spaces!
*/

/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
/* Xilinx includes. */
#include "xil_printf.h"
#include "xparameters.h"
#include <FreeRTOSConfig.h>
#include <projdefs.h>
#include <xgpio.h>

/* Soeren includes */
#include "hardware.h"
#include "mc_xadc.h"
#include <stdio.h>

/* Defines baseadresses */
#define Baseaddr_BTNS XPAR_AXI_GPIO_0_BASEADDR
#define Baseaddr_SWS XPAR_AXI_GPIO_2_BASEADDR
#define Baseaddr_LED XPAR_AXI_GPIO_1_BASEADDR
#define Baseaddr_xADC XPAR_XXADCPS_0_BASEADDR

/* Other defines  */
#define xADC_channel 14
#define time_multiplier 2

/*   Tasks   */
/*-----------------------------------------------------------*/

static void task_LED(void *pvParameters );
static void task_SWS(void *pvParameters);
static void task_xADC(void *pvParameters);
/*-----------------------------------------------------------*/

/* The queue used by the Tx and Rx tasks, as described at the top of this
file. */
static TaskHandle_t TaskHandle_LED;
static TaskHandle_t TaskHandle_SWS;
static TaskHandle_t TaskHandle_xADC;
static QueueHandle_t xQueue = NULL;
char HWstring[15] = "Hello World";

// Hardware defines
XGpio GPIO_LED;
XGpio GPIO_SWS;
int LED_status;
int SWS_status;
int xADC_status;

int sws_value; 
u16 xADC_raw_value; 
float xADC_converted_value;


int main( void )
{
    LED_status = initialize_LEDs(&GPIO_LED, Baseaddr_LED);    
    SWS_status = initialize_SWS(&GPIO_SWS, Baseaddr_SWS);
    xADC_status = xadc_init(Baseaddr_xADC);
    if (xADC_status == XST_FAILURE) 
    {
        xil_printf("\r\nXADC Initialization error.\r\n");
    } 
    else 
    {
        xil_printf("\r\nInitialization completed successfully.\r\n");
        xADC_raw_value = xadc_get_aux(xADC_channel);
        xADC_converted_value = xADC_get_converted_voltage(xADC_channel);
        xil_printf("xADC channel %d.\r\n",xADC_channel);
        printf("Reading %f V.\r\n", xADC_converted_value); // Floats are not supportet in "xil_printf.h"
    }


	xil_printf( "Hello from FreeRTOS example main\r\n" );
	
    xTaskCreate(task_LED,
                (const char *) "LED task", 	/* The function that implements the task. */
			configMINIMAL_STACK_SIZE,				/* Text name for the task, provided to assist debugging only. */
                NULL,								/* The stack allocated to the task. */
			tskIDLE_PRIORITY,					/* The task runs at the idle priority. */
                &TaskHandle_LED);

    xTaskCreate(task_SWS,
                (const char *) "SWS task", 	/* The function that implements the task. */
			configMINIMAL_STACK_SIZE,				/* Text name for the task, provided to assist debugging only. */
                NULL,								/* The stack allocated to the task. */
			tskIDLE_PRIORITY,					/* The task priority. */
                &TaskHandle_SWS);

                
    xTaskCreate(task_xADC,
            (const char *) "xADC task", 	/* The function that implements the task. */
        configMINIMAL_STACK_SIZE,				/* Text name for the task, provided to assist debugging only. */
            NULL,								/* The stack allocated to the task. */
        tskIDLE_PRIORITY,					/* The task priority. */
            &TaskHandle_xADC);

	/* Create the queue used by the tasks.  The Rx task has a higher priority
	than the Tx task, so will preempt the Tx task and remove values from the
	queue as soon as the Tx task writes to the queue - therefore the queue can
	never have more than one item in it. */
	xQueue = xQueueCreate( 	1,						/* There is only one space in the queue. */
							sizeof( HWstring ) );	/* Each space in the queue is large enough to hold a uint32_t. */

	/* Check the queue was created. */
	configASSERT( xQueue );

	/* Start the tasks and timer running. */
	vTaskStartScheduler();

	/* If all is well, the scheduler will now be running, and the following line
	will never be reached.  If the following line does execute, then there was
	insufficient FreeRTOS heap memory available for the idle and/or timer tasks
	to be created.  See the memory management section on the FreeRTOS web site
	for more details. */
	for( ;; );
}

/*-----------------------------------------------------------*/
static void task_LED(void *pvParameters)
{
    for (;;)
    {
        switch (sws_value)
        {
        case 1:
            xil_printf("In LED task case 1\r\n");
            toggle_LED(&GPIO_LED);
            vTaskDelay(pdMS_TO_TICKS(500*time_multiplier)); // 500 ms delay
            break;

        case 2:
            xil_printf("In LED task case 2\r\n");
            toggle_LED(&GPIO_LED);
            vTaskDelay(pdMS_TO_TICKS(250*time_multiplier)); // 250 ms delay
            break;

        default:
            xil_printf("In LED task deafult task\r\n");
            toggle_LED(&GPIO_LED);
            vTaskDelay(pdMS_TO_TICKS(1000*time_multiplier)); // 1000 ms delay
            break;
        }
    }
}

static void task_SWS(void *pvParameters)
{
    for( ;; ){

    // print("In SWS task\r\n");
    read_SWS(&GPIO_SWS);
	sws_value = get_SWS_value(&GPIO_SWS);
    vTaskDelay(pdMS_TO_TICKS(500*time_multiplier)); // 500 ms (.5 sec) delay
    }
}

static void task_xADC(void *pvParameters)
{
    for( ;; ){
        xADC_raw_value = xadc_get_aux(xADC_channel);
        xADC_converted_value = xADC_get_converted_voltage(xADC_channel);
        xil_printf("xADC channel %d.\r\n",xADC_channel);
        xil_printf("xADC raw %d.\r\n",xADC_raw_value);
        printf("xADC voltage %.3f V.\r\n", xADC_converted_value);
        vTaskDelay(pdMS_TO_TICKS(1000*time_multiplier)); // 1000 ms (1 sec) delay 
    }
}
