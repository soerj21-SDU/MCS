#include "states.h"
#include "xparameters.h"
#include "xgpiops.h"

/* MIO declerations */
#define MIO_GPIO_BaseAddress XPAR_XGPIOPS_0_BASEADDR

// Actuator pins MIO
#define Cool_FET_In_channel 0
#define Brake_SSR_In_channel 42
#define RTDS_SSR_In_channel 44
XGpioPs IPrtCool_FET_In;
XGpioPs IPrtBrake_SSR_In;
XGpioPs IPrtRTDS_SSR_In;

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

int state_init(){
    //
    printf("init state");
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


    return ST_IDLE; 
}

void state_idle(){
    //
    printf("idle state");

}

void state_lv_systems_active(){
    //
    printf("lv systems active state");

}

void state_precharging(){
    //
    printf("precharging state");

}

void state_tractive(){
    //
    printf("tractive state");

}

void state_drive(){
    //
    printf("drive state");

}

void state_shutdown(){
    //
    printf("shutdown state");
}

void state_error(){
    //
    printf("error state");

}

