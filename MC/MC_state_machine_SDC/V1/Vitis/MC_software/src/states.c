#include "states.h"
#include "xparameters.h"
#include "xgpiops.h"
#include <stdio.h>
#include <sys/_intsup.h>
#include <xil_printf.h>
#include <xil_types.h>
#include "sleep.h"


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

int state_init()
{
    //
    printf("init state\n\r");
    init_SDC();
    // Actuator pins
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtCool_FET_Out, Cool_FET_Out_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtBrake_SSR_Out, Brake_SSR_Out_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtRTDS_SSR_Out, RTDS_SSR_Out_channel, 1); // 1 in direction = output
    toggle_MIO_GPIO(&IPrtCool_FET_Out, Cool_FET_Out_channel, 1);
    toggle_MIO_GPIO(&IPrtBrake_SSR_Out, Brake_SSR_Out_channel,1);
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

    
    /* ------------------------- Debug code ------------------------- */
    
    print("going to drive state" );
    return ST_DRIVE;


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
        print("Communication error");
        error_code = communication_lost_error;
        return ST_ERROR;
    }

    if (error_internal == TRUE) {
        // Send stop to AMS via CAN!
        print("internal error");
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
    //
    printf("tractive state\n\r");
    SDC_connected = is_SDC_Completed();    
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
    //
    printf("drive state\n\r");
    /* RTDS */
    if (RTDS_sound_on == TRUE)
    {
        print("Beginning of switch\n\r");
        toggle_MIO_GPIO(&IPrtRTDS_SSR_Out, RTDS_SSR_Out_channel, 1);
        print("Before delay\n\r");
        sleep(2);
        print("After delay\n\r");
        toggle_MIO_GPIO(&IPrtRTDS_SSR_Out, RTDS_SSR_Out_channel, 0);
        print("RTDS of\n\r");
    }



    /* Error handling */
    SDC_connected = is_SDC_Completed();    
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

