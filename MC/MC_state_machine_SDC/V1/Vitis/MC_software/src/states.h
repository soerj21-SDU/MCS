#include <stdio.h>
#include "SDC.h"
#include "xparameters.h"
#include "xgpiops.h"

/* States */
/* State machine */
#define ST_INIT               1
#define ST_IDLE               2
#define ST_LV_SYSTEMS_ACTIVE  3  
#define ST_PRECHARGING        4
#define ST_TRACTIVE           5
#define ST_DRIVE              6
#define ST_SHUTDOWN           7 
#define ST_ERROR              0 

/* ----------------------------- state_init() ----------------------------- */
/* MIO declerations */
#define MIO_GPIO_BaseAddress XPAR_XGPIOPS_0_BASEADDR

// Actuator pins MIO
#define Cool_FET_In_channel 0
#define Brake_SSR_In_channel 42
#define RTDS_SSR_In_channel 44


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


/* ----------------------------- state_idle() ----------------------------- */

#define LV_button 0

/* ----------------------------- state_lv_systems_active() ----------------------------- */

#define Precharge_button 0

extern XGpioPs IPrtCool_FET_In;
extern XGpioPs IPrtBrake_SSR_In;
extern XGpioPs IPrtRTDS_SSR_In;

extern XGpioPs IPrtDash_FET_In;
extern XGpioPs IPrtAMS_FET_In;
extern XGpioPs IPrtDASH_AMS_SEL;
extern XGpioPs IPrtTSC_INV12_SEL; 
extern XGpioPs IPrtTSC_FET_In;
extern XGpioPs IPrtINV12_FET_In;
extern XGpioPs IPrtSNET_FET_In;
extern XGpioPs IPrtINV34_FET_In;
extern XGpioPs IPrtSNET_INV34_SEL;


extern XGpioPs_Config *GPIOConfigPtr;

/* State machine states */
int state_init();
int state_idle();
int state_lv_systems_active();
void state_precharging(void);
void state_tractive(void);
void state_drive(void);
void state_shutdown(void);
void state_error(void);