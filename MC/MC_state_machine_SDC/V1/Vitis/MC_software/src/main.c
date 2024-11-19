/*
    Copyright (C) 2017 Amazon.com, Inc. or its affiliates.  All Rights Reserved.
    Copyright (c) 2012 - 2022 Xilinx, Inc. All Rights Reserved.
	SPDX-License-Identifier: MIT


    http://www.FreeRTOS.org
    http://aws.amazon.com/freertos


    1 tab == 4 spaces!
*/

/* Debug variables */
#define timer_multiplier 6 // To slow state machine down. NOT 0!


/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
/* Xilinx includes. */
#include "xil_printf.h"
#include "xparameters.h"
#include <portmacro.h>

#include <stdio.h>
#include <xgpiops.h>
#include "GPIO.h"
#include "states.h"
#include "SDC.h"

#define TIMER_ID	1
#define DELAY_10_SECONDS	10000UL
#define DELAY_1_SECOND		1000UL
#define TIMER_CHECK_THRESHOLD	9

/* PS ALlive */
#define PS_allive_LED 41
#define PS_allive_LED_Baseadress XPAR_XGPIOPS_0_BASEADDR

XGpioPs_Config *ConfigPtr_PS_allive;
XGpioPs Gpio_PS_allive;

/*-----------------------------------------------------------*/

/* The Tx and Rx tasks as described at the top of this file. */
static void PS_allive_task(void *pvParameters);
static void main_state_machine_task( void *pvParameters );
/*-----------------------------------------------------------*/

/* Variables for FreeRTOS */
static TaskHandle_t main_state_machine_handle;
static TaskHandle_t PS_allive;
static QueueHandle_t xQueue = NULL;
char HWstring[15] = "Hello World";
long RxtaskCntr = 0;

/* Other variables */
int state = ST_INIT;





int main( void )
{
    xil_printf( "Master controller software initializing\r\n" );

    /* PS_allive */

    ConfigPtr_PS_allive = XGpioPs_LookupConfig(PS_allive_LED_Baseadress);

    int status = XGpioPs_CfgInitialize(&Gpio_PS_allive, ConfigPtr_PS_allive, ConfigPtr_PS_allive -> BaseAddr);
    if (status != XST_SUCCESS) {
        print("Initialize fail XGpioPs_CfgInitialize PS_allive\n\r");
    }
    XGpioPs_SetDirectionPin(&Gpio_PS_allive, PS_allive_LED, 1);
    XGpioPs_SetOutputEnablePin(&Gpio_PS_allive, PS_allive_LED, 1);
    printf("EMIO pin: %d used. \n\r", PS_allive_LED);
    XGpioPs_WritePin(&Gpio_PS_allive, PS_allive_LED, 0x1);


    /* Free RTOS */

	xTaskCreate( 	main_state_machine_task, 				    /* The function that implements the task. */
					( const char * ) "main_state_machine", 	       /* Text name for the task, provided to assist debugging only. */
					configMINIMAL_STACK_SIZE, 	              /* The stack allocated to the task. */
					NULL, 						              /* The task parameter is not used, so set to NULL. */
                tskIDLE_PRIORITY + 1,			                    /* The task runs at the idle+1 priority. */
					&main_state_machine_handle);

    xTaskCreate( 	PS_allive_task, 				    /* The function that implements the task. */
					( const char * ) "PS_allive", 	       /* Text name for the task, provided to assist debugging only. */
					configMINIMAL_STACK_SIZE, 	              /* The stack allocated to the task. */
					NULL, 						              /* The task parameter is not used, so set to NULL. */
                tskIDLE_PRIORITY,			                    /* The task runs at the idle priority. */
					&PS_allive);

	xQueue = xQueueCreate( 	10,						                       /* There is only one space in the queue. */
							sizeof( HWstring ) );	                       /* Each space in the queue is large enough to hold a uint32_t. */

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
/*------------------ State machine task ---------------------*/
static void main_state_machine_task( void *pvParameters )
{

	for( ;; )
	{
        switch (state) {
            case ST_INIT:
            {
                state = state_init();
                break;                
            }
        }

        switch (state) {
            case ST_IDLE:
            {
                state = state_idle();
                break;                
            }
        }

        switch (state) {
            case ST_LV_SYSTEMS_ACTIVE:
            {
                state = state_lv_systems_active();
                break;                
            }
        }
                switch (state) {
            case ST_PRECHARGING:
            {
                state = state_precharging();
                break;                
            }
        }
        switch (state) {
            case ST_TRACTIVE:
            {
                state = state_tractive();
                break;                
            }
        }
        switch (state) {
            case ST_DRIVE:
            {
                state = state_drive();
                break;                
            }
        }
        switch (state) {
            case ST_SHUTDOWN:
            {
                state = state_shutdown();





                                
                print("Power can be shut off");
                break;                
            }
        }
        switch (state) {
            case ST_ERROR:
            {
                state = state_error();
                break;                
            }
        }
        vTaskDelay(pdMS_TO_TICKS(100 * timer_multiplier)); // 100 ms delay
	}
}

/*-----------------------------------------------------------*/
/*--------------------- PS allive task ----------------------*/

static void PS_allive_task(void *pvParameters)
{
    for( ;; )
    {
        printf("PS_allive_task \n\r");
        toggle_MIO_GPIO(&Gpio_PS_allive, PS_allive_LED, 2);
        vTaskDelay(pdMS_TO_TICKS(200 * timer_multiplier)); // 200 ms delay
    }
}
/*-----------------------------------------------------------*/

