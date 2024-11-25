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
#include "includes/states.h"
#include "includes/mc_xadc.h"

#define TIMER_ID	1
#define DELAY_10_SECONDS	10000UL
#define DELAY_1_SECOND		1000UL
#define TIMER_CHECK_THRESHOLD	9

/* PS ALlive */
#define PS_allive_LED 41
#define PS_allive_LED_Baseadress XPAR_XGPIOPS_0_BASEADDR

/* Pedals */ 

/*-----------------------------------------------------------*/

/* Tasks used in project. */
static void main_state_machine_task( void *pvParameters );
static void PS_allive_task(void *pvParameters);
static void LVS_measurement_task(void *pvParameters);
/*-----------------------------------------------------------*/

/* Variables for FreeRTOS */
static TaskHandle_t main_state_machine_handle;
static TaskHandle_t PS_allive;
static TaskHandle_t LVS_Current;
static QueueHandle_t xQueue = NULL;
char HWstring[15] = "Hello World";
long RxtaskCntr = 0;

/* Other variables */
int state = ST_INIT; // Initial state

float LVS_current_value; 
float LVS_voltage_value;



int main( void )
{
    xil_printf( "Master controller software initializing\r\n" );

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

    xTaskCreate( 	LVS_measurement_task, 				    /* The function that implements the task. */
                        ( const char * ) "LVS_Current", 	       /* Text name for the task, provided to assist debugging only. */
                        configMINIMAL_STACK_SIZE, 	              /* The stack allocated to the task. */
                        NULL, 						              /* The task parameter is not used, so set to NULL. */
                    tskIDLE_PRIORITY,			                    /* The task runs at the idle priority. */
                        &LVS_Current);

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
        vTaskDelay(pdMS_TO_TICKS(200 * timer_multiplier)); // 200 ms delay
    }
}
/*-----------------------------------------------------------*/

/*----------------- LVS measurement task --------------------*/

static void LVS_measurement_task(void *pvParameters) // This task can be extended to contain all data readings (Current (DashAMSCurrnet etc.)) 
{
    for( ;; )
    {
        printf("LVS_Current_task\n\r");
        LVS_current_value = xADC_get_LVS_Current(13);
        printf("LVS Current: %.3f A.\n\r", LVS_current_value);
        LVS_voltage_value = xADC_get_LVS_Current(5);
        printf("LVS Voltage: %.3f V.\n\r", LVS_voltage_value);
        vTaskDelay(pdMS_TO_TICKS(400 * timer_multiplier)); // 400 ms delay
    }
}
/*-----------------------------------------------------------*/