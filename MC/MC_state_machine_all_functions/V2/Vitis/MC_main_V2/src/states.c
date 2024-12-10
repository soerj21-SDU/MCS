#include "includes/states.h"
#include "includes/mc_xadc.h"
#include "includes/data_processing.h"
#include "xparameters.h"
#include "xgpiops.h"
#include <stdio.h>
#include <sys/_intsup.h>
#include <xil_printf.h>
#include <xil_types.h>

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

/* MIO declerations */
#define MIO_GPIO_BaseAddress XPAR_XGPIOPS_0_BASEADDR

// Actuator pins MIO
#define Cool_FET_Out_channel 0
#define Brake_SSR_Out_channel 42
#define RTDS_SSR_Out_channel 44
XGpioPs IPrtCool_FET_Out;
XGpioPs IPrtBrake_SSR_Out;
XGpioPs IPrtRTDS_SSR_Out;

// Power Distribution pins MIO
#define Dash_FET_In_channel 48
#define AMS_FET_In_channel 40
#define DASH_AMS_SEL_channel 45
#define TSC_INV12_SEL_channel 49
#define TSC_FET_In_channel 50
#define INV12_FET_In_channel 46
#define SNET_FET_In_channel 51
#define INV34_FET_In_channel 47
#define SNET_INV34_SEL_channel 43

XGpioPs IPrtDash_FET_In;
XGpioPs IPrtAMS_FET_In;
XGpioPs IPrtDASH_AMS_SEL;
XGpioPs IPrtTSC_INV12_SEL; 
XGpioPs IPrtTSC_FET_In;
XGpioPs IPrtINV12_FET_In;
XGpioPs IPrtSNET_FET_In;
XGpioPs IPrtINV34_FET_In;
XGpioPs IPrtSNET_INV34_SEL;

XGpioPs_Config *GPIOConfigPtr;

float ts_measurement = 0;

bool RTDS_sound_on = TRUE;
bool RTDS_timer_alarm = FALSE;
bool RTDS_timer_started = FALSE;

bool brake_pressed = TRUE;

/*  state_tractive()  */
int brake_pedal_status = 1;                 // temporary
int torque_pedal_status = 1;                // temporary
int drive_buton = 1;                        // temporary

/*  state_drive()  */
int torque_implausibility = 0;
int torque_disconnect = 0;
int tractive_stop = 0;
int stop_command = 0;                       // To be used to enter shutdown state?

TimerHandle_t xTimer_2_sec;
TimerHandle_t xTimer_10_sec; // used for debug
TimerHandle_t xTimer_15_sec; // used for debug


int status;

void vTimerCallback_2_sec(TimerHandle_t xTimer_2_sec) {
    toggle_MIO_GPIO(&IPrtRTDS_SSR_Out, RTDS_SSR_Out_channel, 0);
    RTDS_timer_started = FALSE;
    RTDS_sound_on = FALSE;
    /* Debug */
    xTimerStart(xTimer_10_sec, 0); // Used to go to tractive state.
}

/* Debug  */
void vTimerCallback_10_sec(TimerHandle_t xTimer_10_sec) {
    printf("Going to tractive state from 10 sec.\n\r");
    state = ST_TRACTIVE;
}

void vTimerCallback_15_sec(TimerHandle_t xTimer_15_sec) {
    printf("Going to tractive state from 15 sec.\n\r");
    state = ST_TRACTIVE;
}

int state_init()
{
    //
    printf("init state\n\r");
    init_SDC();
    // Actuator pins
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtCool_FET_Out, Cool_FET_Out_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtBrake_SSR_Out, Brake_SSR_Out_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtRTDS_SSR_Out, RTDS_SSR_Out_channel, 1); // 1 in direction = output
    toggle_MIO_GPIO(&IPrtCool_FET_Out, Cool_FET_Out_channel, 0);
    toggle_MIO_GPIO(&IPrtBrake_SSR_Out, Brake_SSR_Out_channel,0);
    toggle_MIO_GPIO(&IPrtRTDS_SSR_Out, RTDS_SSR_Out_channel,0);

    
    // Power Distribution pins
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtDash_FET_In, Dash_FET_In_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtAMS_FET_In, AMS_FET_In_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtDASH_AMS_SEL, DASH_AMS_SEL_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtTSC_INV12_SEL, TSC_INV12_SEL_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtTSC_FET_In, TSC_FET_In_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtINV12_FET_In, INV12_FET_In_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtSNET_FET_In, SNET_FET_In_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtINV34_FET_In, INV34_FET_In_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtSNET_INV34_SEL, SNET_INV34_SEL_channel, 1); // 1 in direction = output
    toggle_MIO_GPIO(&IPrtDash_FET_In, Dash_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtAMS_FET_In, AMS_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtDASH_AMS_SEL, DASH_AMS_SEL_channel,1);
    toggle_MIO_GPIO(&IPrtTSC_INV12_SEL, TSC_INV12_SEL_channel,1);
    toggle_MIO_GPIO(&IPrtTSC_FET_In, TSC_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtINV12_FET_In, INV12_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtSNET_FET_In, SNET_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtINV34_FET_In, INV34_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtSNET_INV34_SEL, SNET_INV34_SEL_channel,1);

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

    xTimer_15_sec = xTimerCreate("Timer", pdMS_TO_TICKS(10000), pdFALSE, (void *)0, vTimerCallback_15_sec);
        if (xTimer_2_sec == NULL) {
            // Handle error
            printf("Timer creation failed\n");
        }
    
    print("going to precharching state\r\n" );
    xTimerStart(xTimer_15_sec, 0); // Startiing timer to go ST_TRACTIVE.
    return ST_PRECHARGING;


    /* ---------------------- Debug code end ------------------------ */

    return ST_IDLE; 
}

int state_idle()
{
    //
    printf("Idle state\n\r");

    /* Error checking */
    SDC_connected = is_SDC_Completed();    
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
    SDC_connected = is_SDC_Completed();    
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

    /* Theese LV actuators and power distrubution ports should be added here. 
    toggle_MIO_GPIO(&IPrtDash_FET_In, Dash_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtAMS_FET_In, AMS_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtDASH_AMS_SEL, DASH_AMS_SEL_channel,1);
    toggle_MIO_GPIO(&IPrtTSC_INV12_SEL, TSC_INV12_SEL_channel,1);
    toggle_MIO_GPIO(&IPrtTSC_FET_In, TSC_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtINV12_FET_In, INV12_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtSNET_FET_In, SNET_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtINV34_FET_In, INV34_FET_In_channel,1);
    toggle_MIO_GPIO(&IPrtSNET_INV34_SEL, SNET_INV34_SEL_channel,1); */

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
    toggle_MIO_GPIO(&IPrtCool_FET_Out, Cool_FET_Out_channel, 1);
    // Function to check if ts measurement has been pressed

    /* Error checking */
    SDC_connected = is_SDC_Completed();    
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
    /* use this sdc check instead:
        if (!is_SDC_Completed()) {
        printf("SDC not complete\n\r");
        error_code = SDC_error;
        return ST_ERROR;
    }
    */
    printf("tractive state\n\r");
    SDC_connected = is_SDC_Completed();    
    SDC_connected = TRUE; // DEBUG
    if (SDC_connected != TRUE) {
        // Send stop to AMS via CAN!
        print("SDC not complete\n\r");
        error_code = SDC_error;        
        return ST_ERROR;
    }
    
    brake_pedal_status = 0;                
    torque_pedal_status = 0;               
    drive_buton = 0; 

    BP0_measurment = xadc_get_aux(8);
    BP1_measurment = xadc_get_aux(0);
    TP0_measurment = xadc_get_aux(1);
    TP1_measurment = xadc_get_aux(9);
    // read drive button
    if (TorqueSensorsOutOfRange(TP0_measurment, TP1_measurment)) {
        torque_pedal_status = 1; 
    }

    if (BrakePedalSensorsOutOfRange(BP0_measurment, BP1_measurment)) {
        brake_pedal_status = 1; 
    }

    // function to detect if drive_buton has been pressed.

    RTDS_sound_on = TRUE;
    /* Debug */
    brake_pedal_status = 1;                
    torque_pedal_status = 1;                
    drive_buton = 1; 
    /* Debug end */                       
    if (brake_pedal_status && torque_pedal_status && drive_buton == 1) {  
        return ST_DRIVE;
    }
    return ST_TRACTIVE;
}

int state_drive()
{
    printf("drive state\n\r");
    /* use this sdc check instead:
        if (!is_SDC_Completed()) {
        printf("SDC not complete\n\r");
        error_code = SDC_error;
        return ST_ERROR;
    }
    */
    /* Error handling */
    SDC_connected = is_SDC_Completed();    
    SDC_connected = TRUE; // DEBUG
    if (SDC_connected != TRUE) {
        // Send stop to AMS via CAN!
        print("SDC not complete\n\r");
        error_code = SDC_error;        
        return ST_ERROR;
    }

    /* RTDS */
    if (RTDS_sound_on) {
        if (!RTDS_timer_started) {
            xTimerStart(xTimer_2_sec, 0);
            if (xTimerStart(xTimer_2_sec, 0) != pdPASS) {
                printf("RTDS Timer start failed\n");
            }
            toggle_MIO_GPIO(&IPrtRTDS_SSR_Out, RTDS_SSR_Out_channel, 1);
            RTDS_timer_started = TRUE;
        }   
    }   

    /* Brake Pedal */
    // When brake is pressed:
    BP0_measurment = xadc_get_aux(8);
    BP1_measurment = xadc_get_aux(0);
  
    if (BP0_measurment > 5 && BP1_measurment > 5) {
        toggle_MIO_GPIO(&IPrtBrake_SSR_Out, Brake_SSR_Out_channel,1); 
        brake_pressed = TRUE;
    }
    else {
        toggle_MIO_GPIO(&IPrtBrake_SSR_Out, Brake_SSR_Out_channel,0);
        brake_pressed = FALSE;
    }

    TP0_measurment = xadc_get_aux(1);
    TP1_measurment = xadc_get_aux(9);
    if (TorqueSensorsOutOfRange(TP0_measurment, TP1_measurment)) {
        torque_disconnect = 1; 
    } 
    
    if (brake_pressed && TP0_measurment > 5 && TP1_measurment > 5) {
        torque_implausibility = 1; 
    }
    // read drive button create function that returns 1
    tractive_stop = 0;
    
    /* Debug */
    torque_implausibility = 0;
    torque_disconnect = 0;
    tractive_stop = 0;
    stop_command = 0;                       // To be used to enter shutdown state?
    /* debug end */
    if (torque_implausibility || torque_disconnect || tractive_stop == 1) {
        return ST_TRACTIVE;
    }

    // Send TP0 & TP 1 values to relevant functions (signal to inverters)

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
        SDC_connected = is_SDC_Completed();
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

