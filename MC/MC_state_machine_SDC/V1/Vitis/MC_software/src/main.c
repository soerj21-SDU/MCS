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
#include <portmacro.h>

#include <stdio.h>
#include "states.h"

#define TIMER_ID	1
#define DELAY_10_SECONDS	10000UL
#define DELAY_1_SECOND		1000UL
#define TIMER_CHECK_THRESHOLD	9

/*-----------------------------------------------------------*/

/* The Tx and Rx tasks as described at the top of this file. */
static void main_state_machine_task( void *pvParameters );
/*-----------------------------------------------------------*/

/* Variables for FreeRTOS */
static TaskHandle_t main_state_machine_handle;
static QueueHandle_t xQueue = NULL;
static TimerHandle_t xTimer = NULL;
char HWstring[15] = "Hello World";
long RxtaskCntr = 0;

/* Other variables */
int state = ST_INIT;





int main( void )
{
    xil_printf( "Master controller software initializing\r\n" );

	xTaskCreate( 	main_state_machine_task, 				    /* The function that implements the task. */
					( const char * ) "main_state_machine", 	       /* Text name for the task, provided to assist debugging only. */
					configMINIMAL_STACK_SIZE, 	              /* The stack allocated to the task. */
					NULL, 						              /* The task parameter is not used, so set to NULL. */
                tskIDLE_PRIORITY,			                    /* The task runs at the idle priority. */
					&main_state_machine_handle);

	xQueue = xQueueCreate( 	10,						                       /* There is only one space in the queue. */
							sizeof( HWstring ) );	                       /* Each space in the queue is large enough to hold a uint32_t. */

	/* Check the queue was created. */
	configASSERT( xQueue );

	configASSERT( xTimer );

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
                printf("Init state");
                break;                
            }
        }
        switch (state) {
            case ST_TRACTIVE:
            {
                printf("Init state");
                break;                
            }
        }
        switch (state) {
            case ST_DRIVE:
            {
                printf("Init state");
                break;                
            }
        }
        switch (state) {
            case ST_SHUTDOWN:
            {
                printf("Init state");
                break;                
            }
        }
        switch (state) {
            case ST_ERROR:
            {
                printf("Init state");
                break;                
            }
        }
        vTaskDelay(100); // 100 ms delay
	}
}



/*-----------------------------------------------------------*/
void vTimerCallback( TimerHandle_t pxTimer )
{
	long lTimerId;
	configASSERT( pxTimer );

	lTimerId = ( long ) pvTimerGetTimerID( pxTimer );

	if (lTimerId != TIMER_ID) {
		xil_printf("FreeRTOS Hello World Example FAILED");
	}

	/* If the RxtaskCntr is updated every time the Rx task is called. The
	 Rx task is called every time the Tx task sends a message. The Tx task
	 sends a message every 1 second.
	 The timer expires after 10 seconds. We expect the RxtaskCntr to at least
	 have a value of 9 (TIMER_CHECK_THRESHOLD) when the timer expires. */
	if (RxtaskCntr >= TIMER_CHECK_THRESHOLD) {
		xil_printf("Successfully ran FreeRTOS Hello World Example");
	} else {
		xil_printf("FreeRTOS Hello World Example FAILED");
	}

	vTaskDelete( main_state_machine_handle);
}

