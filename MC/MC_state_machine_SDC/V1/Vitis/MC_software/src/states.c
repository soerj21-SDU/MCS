#include "states.h"
#include "xparameters.h"



int state_init(){
    //
    printf("Init state");
    init_SDC();
    // Actuator pins
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtCool_FET_In, Cool_FET_In_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtBrake_SSR_In, Brake_SSR_In_channel, 1); // 1 in direction = output
    setup_MIO_GPIO(MIO_GPIO_BaseAddress, GPIOConfigPtr, &IPrtRTDS_SSR_In, RTDS_SSR_In_channel, 1); // 1 in direction = output
    XGpioPs_WritePin(&IPrtCool_FET_In, Cool_FET_In_channel, 0x1); // 1= high
    XGpioPs_WritePin(&IPrtBrake_SSR_In, Brake_SSR_In_channel, 0x1); // 1= high
    XGpioPs_WritePin(&IPrtRTDS_SSR_In, RTDS_SSR_In_channel, 0x1); // 1= high
    
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
    XGpioPs_WritePin(&IPrtDash_FET_In, Dash_FET_In_channel, 0x1); // 1= high
    XGpioPs_WritePin(&IPrtAMS_FET_In, AMS_FET_In_channel, 0x1); // 1= high
    XGpioPs_WritePin(&IPrtDASH_AMS_SEL, DASH_AMS_SEL_channel, 0x1); // 1= high   
    XGpioPs_WritePin(&IPrtTSC_INV12_SEL, TSC_INV12_SEL_channel, 0x1); // 1= high
    XGpioPs_WritePin(&IPrtTSC_FET_In, TSC_FET_In_channel, 0x1); // 1= high  
    XGpioPs_WritePin(&IPrtINV12_FET_In, INV12_FET_In_channel, 0x1); // 1= high
    XGpioPs_WritePin(&IPrtSNET_FET_In, SNET_FET_In_channel, 0x1); // 1= high
    XGpioPs_WritePin(&IPrtINV34_FET_In, INV34_FET_In_channel, 0x1); // 1= high
    XGpioPs_WritePin(&IPrtSNET_INV34_SEL, SNET_INV34_SEL_channel, 0x1); // 1= high

    printf("Initializing done");
    return ST_IDLE; 
}

int state_idle(){
    //
    printf("Idle state");
    // Function to check if LV button has been pressed
    if (LV_button == 1) 
    {
        // Function to enable SDC until AMS
       
        return ST_LV_SYSTEMS_ACTIVE; 
    }
    return ST_IDLE;
}

int state_lv_systems_active(){
    //
    printf("Lv systems active state");
    if (Precharge_button == 1) 
    {
        return ST_PRECHARGING;
    }
    return ST_LV_SYSTEMS_ACTIVE;
}

void state_precharging(){
    //
    printf("Precharging state");

}

void state_tractive(){
    //
    printf("Tractive state");

}

void state_drive(){
    //
    printf("Drive state");

}

void state_shutdown(){
    //
    printf("Shutdown state");
}

void state_error(){
    //
    printf("Error state");

}

