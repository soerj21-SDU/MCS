
#include <stdio.h>
#include "xparameters.h"
#include "xgpio.h"
#include <stdint.h>
#include <stdbool.h>

#include "GPIO.h"
#include "interrupts.h"

#define SDC_AXI_Address XPAR_AXI_GPIO_0_BASEADDR

#define NO_OF_SDC_NODES 17
#define SDC_BROKEN_NODE_STATE 1

#define  Supply_index             0 
#define  Cockpit_emergency_index  1
#define  BOTS_index               2
#define  inertia_index            3
#define  L_emergency_btn_index    4
#define  R_emergency_btn_index    5
#define  FR_wheel_index           6
#define  FL_wheel_index           7
#define  RR_wheel_index           8
#define  RL_wheel_index           9
    #define  HV_CONNECTOR_TSAC_index  10
    #define  IMD_TSAC_Index           11
    #define  AMS_TSAC_index           12
    #define  BSPD_index               13
    #define  HVD_index                14
    #define  TSMP_index               15
#define  TSMS_index               16


extern u16 GlobalIntrMask;
// extern state; 

// void GpioHandler(void *CallbackRef);
void SDC_ISR(void *CallbackRef);


extern XGpio SDC_axi_gpio_inst;

int init_SDC();
void SDC_open_read_as_register(uint32_t* SDC_register);



void SDC_open_read_as_array (uint32_t SDC_array[ NO_OF_SDC_NODES ] );
bool is_SDC_Completed();
const char* get_first_broken_node();  
// SDC Enable()

bool get_SDC_Cockpit_Emergency_Btn_Open_Status();
bool get_SDC_BOTS_Open_Status();
bool get_SDC_inertia_Open_Status();
bool get_SDC_L_emergency_Btn_Open_Status();
bool get_SDC_R_emergency_Btn_Open_Status();
bool get_SDC_FR_Wheel_Open_Status();
bool get_SDC_FL_Wheel_Open_Status();
bool get_SDC_RR_Wheel_Open_Status();
bool get_SDC_RL_Wheel_Open_Status();
    bool get_SDC_HV_Connector_TSAC_Open_Status();
    bool get_SDC_IMD_TSAC_Open_Status();
    bool get_SDC_AMS_TSAC_Open_Status();
bool get_SDC_BSPD_Open_Status();
bool get_SDC_HVD_Open_Status();
bool get_SDC_TSMP_Open_Status();
bool get_SDC_TSMS_Open_Status();
