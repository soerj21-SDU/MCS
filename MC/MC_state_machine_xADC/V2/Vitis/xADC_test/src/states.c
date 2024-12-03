#include "includes/states.h"
#include "xparameters.h"
#include <stdio.h>
#include <stdbool.h>
#include <sys/_intsup.h>
#include <xil_printf.h>
#include <xil_types.h>
#include <xstatus.h>
#include "includes/mc_xadc.h"


/* FreeRTOS */
#include "FreeRTOS.h"
#include "timers.h"


/* errors () */
bool SDC_connected = FALSE;
bool communication_lost = FALSE;
bool error_internal = FALSE;
bool timeout = FALSE;
bool precharge_timeout = FALSE;

/* Error codes */
int error_code; 

#define no_error 0
#define unknown_error 1
#define SDC_error 2
#define communication_lost_error 3
#define internal_error 4
#define timeout_error 5
#define precharge_timeout_error 6

float ts_measurement = 0;

bool RTDS_sound_on = TRUE;
bool RTDS_timer_alarm = FALSE;
bool RTDS_timer_started = FALSE;

bool brake_pressed = TRUE;

TimerHandle_t xTimer_2_sec;
TimerHandle_t xTimer_10_sec; // used for debug


int status;
float sw_value;
float BP0_measurment; // Used in states.c
float BP1_measurment; // Used in states.c
float TP0_measurment; // Used in states.c
float TP1_measurment; // Used in states.c

void vTimerCallback_2_sec(TimerHandle_t xTimer_2_sec) {
    RTDS_timer_started = FALSE;
    RTDS_sound_on = FALSE;
    /* Debug */
    xTimerStart(xTimer_10_sec, 0); // Used to go to tractive state.
}

/* Debug  */
void vTimerCallback_10_sec(TimerHandle_t xTimer_10_sec) {
    printf("Going to tractive state.\n\r");
    state = ST_TRACTIVE;
}

int state_init()
{
    //
    printf("init state\n\r");

    status = xadc_init(XPAR_XXADCPS_0_BASEADDR);
    if (status != XST_SUCCESS) {
        printf("Error in xadc");
        return XST_FAILURE;
    }

    /* FreeRTOS */
    xTimer_2_sec = xTimerCreate("Timer", pdMS_TO_TICKS(2000), pdFALSE, (void *)0, vTimerCallback_2_sec);
        if (xTimer_2_sec == NULL) {
            // Handle error
            printf("Timer creation failed\n");
        }
    /* ------------------------- Debug code ------------------------- */
    xTimer_10_sec = xTimerCreate("Timer", pdMS_TO_TICKS(10000), pdFALSE, (void *)0, vTimerCallback_10_sec);
        if (xTimer_2_sec == NULL) {
            // Handle error
            printf("Timer creation failed\n");
        }
    
    print("going to drive state\r\n" );
    return ST_DRIVE;


    /* ---------------------- Debug code end ------------------------ */

    return ST_IDLE; 
}

int state_idle()
{
    //
    printf("Idle state\n\r");

    /* Error checking */  
    SDC_connected = TRUE; // DEBUG
    if (SDC_connected != TRUE) {
        // Send stop to AMS via CAN!
        print("SDC not complete\n\r");
        error_code = SDC_error;        
        return ST_ERROR;
    }

    if (communication_lost == TRUE) {
        // Send stop to AMS via CAN!
        print("Communication error\r\n");
        error_code = communication_lost_error;
        return ST_ERROR;
    }

    if (error_internal == TRUE) {
        // Send stop to AMS via CAN!
        print("internal error\r\n");
        error_code = internal_error;
        return ST_ERROR;
    }
    

    // Function to check if LV button has been pressed
    if (LV_button == 1) 
    {
        // Function to enable SDC until AMS
       
        return ST_LV_SYSTEMS_ACTIVE; 
    }
    return ST_IDLE;
}

int state_lv_systems_active()
{
    //
    printf("LV systems active state\n\r");
    
    /* Error checking */  
    SDC_connected = TRUE; // DEBUG
    if (SDC_connected != TRUE) {
        // Send stop to AMS via CAN!
        print("SDC not complete\n\r");
        error_code = SDC_error;        
        return ST_ERROR;
    }

    if (communication_lost == TRUE) {
        // Send stop to AMS via CAN!
        print("Communication error\n\r");
        error_code = communication_lost_error;
        return ST_ERROR;
    }

    if (error_internal == TRUE) {
        // Send stop to AMS via CAN!
        print("internal error\n\r");
        error_code = internal_error;
        return ST_ERROR;
    }

    if (timeout == TRUE) {
        // Send stop to AMS via CAN!
        print("timeout error\n\r");
        error_code = timeout_error;
        return ST_ERROR;
    }

    // Function to check if Precharge button has been pressed
    if (Precharge_button == 1) 
    {
        return ST_PRECHARGING;
    }
    return ST_LV_SYSTEMS_ACTIVE;
}

int state_precharging()
{
    //    
    printf("precharging state\n\r");
    // Function to check if ts measurement has been pressed



    /* Error checking */
    SDC_connected = TRUE; // DEBUG
    if (SDC_connected != TRUE) {
        // Send stop to AMS via CAN!
        print("SDC not complete\n\r");
        error_code = SDC_error;        
        return ST_ERROR;
    }
    if (precharge_timeout == TRUE) {
        // Send stop to AMS via CAN!
        print("Precharge timeout\n\r");
        error_code = precharge_timeout_error;        
        return ST_ERROR;
    }
    // Add timeout function


    if (ts_measurement > 95) {
        printf("precharging complete\n\r");
        return ST_TRACTIVE;
    }
    return ST_PRECHARGING;
}

int state_tractive()
{
    //
    printf("tractive state\n\r");
    SDC_connected = TRUE; // DEBUG
    if (SDC_connected != TRUE) {
        // Send stop to AMS via CAN!
        print("SDC not complete\n\r");
        error_code = SDC_error;        
        return ST_ERROR;
    }

    RTDS_sound_on = TRUE;

    int brake_pedal_status = 1;                 // temporary
    int torque_pedal_status = 1;                // temporary
    int drive_buton = 1;                        // temporary
    if (brake_pedal_status && torque_pedal_status && drive_buton == 1) {  
        return ST_DRIVE;
    }
    return ST_TRACTIVE;
}

int state_drive()
{
    printf("drive state\n\r");
    /* RTDS */
    if (RTDS_sound_on == TRUE) {
        if (RTDS_timer_started == FALSE) {
            xTimerStart(xTimer_2_sec, 0);
            if (xTimerStart(xTimer_2_sec, 0) != pdPASS) {
                printf("RTDS Timer start failed\n");
            }
            RTDS_timer_started = TRUE;
        }   
    }   
    /* Brake Pedal */
    // When brake is pressed:



    if (BP0_measurment > 1) { // Include the code for all the brake sensor value (BP0 og BP1). They have to be compared.
        print("Brake light on\n\r"); // Remember to enable brake light, when PCB is fixed.
        brake_pressed = TRUE;
    }


    /* Error handling */   
    SDC_connected = TRUE; // DEBUG
    if (SDC_connected != TRUE) {
        // Send stop to AMS via CAN!
        print("SDC not complete\n\r");
        error_code = SDC_error;        
        return ST_ERROR;
    }

    int torque_implausibility = 0;
    int torque_disconnect = 0;
    int tractive_stop = 0;
    int stop_command = 0;                       // To be used to enter shutdown state.
    if (torque_implausibility || torque_disconnect || tractive_stop == 1) {
        return ST_TRACTIVE;
    }

    // READ BP0, BP1, TP0 & TP 1 and send values to relevant functions in state_drive()

    return ST_DRIVE;
}

int state_shutdown()
{
    // This function is to ensure all the data is saved corretly. 
    printf("shutdown state\n\r");
    printf("Entering infinite while loop\n\r");
    while (1) {}  
    return ST_SHUTDOWN; 
}

int state_error()
{
    /* Error handling SDC incomplete */
    printf("error state\n\r");
    if (error_code == SDC_error) {
        printf("SDC error\n\r");
        if (SDC_connected == TRUE) {
            error_code = no_error;
            return ST_IDLE;
        }
    }
    
    if (error_code == communication_lost_error) {
        printf("Communication lost\n\r");
        // Function to check if communication is established
        if (communication_lost == FALSE) {
            error_code = no_error;
            return ST_IDLE;
        }
    }

    if (error_code == internal_error) {
        printf("Internal error\n\r");
        // Function to check if enternal error is solved.
        if (internal_error == FALSE) {
            error_code = no_error;
            return ST_IDLE;
            }
        }

    if (error_code == timeout_error) {
        printf("Timeout error\n\r");
        // Function to check if enternal error is solved.
        if (timeout_error == FALSE) {
            error_code = no_error;
            return ST_IDLE;
            }
        }

    if (error_code == precharge_timeout_error) {
        print("Precharge timeout\n\r");
        // Function to check if enternal error is solved.
        if (timeout_error == FALSE) {
            error_code = no_error;
            return ST_IDLE;
            }
        }
    
    return ST_ERROR;
}

