/* Debug variables */
#include <xinterrupt_wrap.h>
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
#include "includes/data_processing.h"

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
static void Sensor_measurment_task(void *pvParameters);
/*-----------------------------------------------------------*/

/* Variables for FreeRTOS */
static TaskHandle_t main_state_machine_handle;
static TaskHandle_t PS_allive;
static TaskHandle_t LVS_Current;
static TaskHandle_t Sensor_measurment;
static QueueHandle_t xQueue = NULL;
char HWstring[15] = "Hello World";
long RxtaskCntr = 0;

/* Timer for sensor testing */
TimerHandle_t xTimer;
float elapsedTime = 0;
void vTimerCallback(TimerHandle_t xTimer) {
    elapsedTime= elapsedTime + 0.5;
    printf("Elapsed time: %.1f seconds\n", elapsedTime);
}



/* Other variables */
int state = ST_INIT; // Initial state

float LVS_current_value; 
float LVS_voltage_value;
float SW_measurment;
float SW_angle;
float BP0_measurment; 
float BP1_measurment;
float TP0_measurment; 
float TP1_measurment;


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

    xTaskCreate( 	Sensor_measurment_task, 				    /* The function that implements the task. */
                            ( const char * ) "LVS_Current", 	       /* Text name for the task, provided to assist debugging only. */
                            configMINIMAL_STACK_SIZE, 	              /* The stack allocated to the task. */
                            NULL, 						              /* The task parameter is not used, so set to NULL. */
                        tskIDLE_PRIORITY,			                    /* The task runs at the idle priority. */
                            &Sensor_measurment);


/* For sensor test */

    xTimer = xTimerCreate("Timer", pdMS_TO_TICKS(500), pdTRUE, (void *)0, vTimerCallback);
        
        if (xTimer != NULL) {
            // Start the timer with a block time of 0 ticks
            if (xTimerStart(xTimer, 0) != pdPASS) {
                // The timer could not be set into the Active state
                printf("Timer start failed\n");
            }
        } else {
            // The timer could not be created
            printf("Timer creation failed\n");
        }


/* ----- */


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
        vTaskDelay(pdMS_TO_TICKS(500 * timer_multiplier)); // 200 ms delay
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

/*---------------- Sensor measurment task -------------------*/
static void Sensor_measurment_task(void *pvParameters) // This task can be extended to contain all data readings (Current (DashAMSCurrnet etc.)) 
{
    for( ;; )
    {
        print("sensor task");
        SW_measurment = xadc_get_aux(3);
        printf("SW sensor value: %.3f.\n\r", SW_measurment);
        SW_measurment = xADC_get_converted_voltage(3);
        SW_measurment = xADC_reverse_voltage_division(5, SW_measurment);
        printf("SW voltage: %.3f V.\n\r", SW_measurment);
        SW_measurment = xadc_get_aux(3);
        SW_angle = get_SW_angle(SW_measurment);
        printf("SW angle: %.3f V.\n\r", SW_angle);
        
        BP0_measurment = xadc_get_aux(8);
        printf("BP0 sensor value: %.3f.\n\r", BP0_measurment);
        BP0_measurment = xADC_get_converted_voltage(8);
        BP0_measurment = xADC_reverse_voltage_division(5, BP0_measurment);
        printf("BP0 voltage: %.3f V.\n\r", BP0_measurment);
        BP0_measurment = xadc_get_aux(8);
        BP0_measurment = BP0_percentage(BP0_measurment);
        printf("BP0 percentage: %.3f V.\n\r", BP0_measurment);


        BP1_measurment = xadc_get_aux(0);
        printf("BP1 sensor value: %.3f.\n\r", BP1_measurment);
        BP1_measurment = xADC_get_converted_voltage(0);
        BP1_measurment = xADC_reverse_voltage_division(5, BP1_measurment);
        printf("BP1 voltage: %.3f V.\n\r", BP1_measurment);
        BP1_measurment = xadc_get_aux(0);
        BP1_measurment = BP1_percentage(BP1_measurment);
        printf("BP1 percentage: %.3f V.\n\r", BP1_measurment);

        TP0_measurment = xadc_get_aux(1);
        printf("TP0 sensor value: %.3f.\n\r", TP0_measurment);
        TP0_measurment = xADC_get_converted_voltage(1);
        TP0_measurment = xADC_reverse_voltage_division(5, TP0_measurment);
        printf("TP0 voltage: %.3f V.\n\r", TP0_measurment);
        TP0_measurment = xadc_get_aux(1);
        TP0_measurment = TP0_percentage(TP0_measurment);
        printf("TP0 percentage: %.3f V.\n\r", TP0_measurment);

        TP1_measurment = xadc_get_aux(9);
        printf("TP1 sensor value: %.3f.\n\r", TP1_measurment);
        TP1_measurment = xADC_get_converted_voltage(9);
        TP1_measurment = xADC_reverse_voltage_division(5, TP1_measurment);
        printf("TP1 voltage: %.3f V.\n\r", TP1_measurment);
        TP1_measurment = xadc_get_aux(1);
        TP1_measurment = TP0_percentage(TP1_measurment);
        printf("TP0 percentage: %.3f V.\n\r", TP1_measurment);
        
        if (!TorqueSensorsOutOfRange(TP0_measurment, TP1_measurment)) 
        {
            print("TPs out of range");
            state = ST_ERROR;
        }
        else 
        {
            print("TPs within 5 percent");
        }

        // vTaskDelay(pdMS_TO_TICKS(400 * timer_multiplier)); // 400 ms delay
        vTaskDelay(pdMS_TO_TICKS(400)); // 400 ms delay
    }
}
/*-----------------------------------------------------------*/
