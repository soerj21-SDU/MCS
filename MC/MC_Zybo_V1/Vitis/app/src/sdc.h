
#include <stdio.h>
#include "xparameters.h"
#include "xgpio.h"
#include <stdint.h>
#include <stdbool.h>

#include "GPIO.h"
#include "interrupts.h"

#define DIR_INPUT 1 
#define DIR_OUTPUT 0

#define SDC_AXI_Address XPAR_AXI_GPIO_0_BASEADDR

#define GPIO_CHANNEL_1 1 
#define GPIO_CHANNEL_2 2

#define NO_OF_SDC_NODES 16
#define SDC_BROKEN_NODE 0

#define Cockpit_emergency_index  0
#define  BOTS_index              1
#define  inertia_index           2
#define  L_emergency_btn_index   3
#define  R_emergency_btn_index   4
#define  FR_wheel_index          5
#define  FL_wheel_index          6
#define  RR_wheel_index          7
#define  RL_wheel_index          8
#define  HV_CONNECTOR_TSAC_index 9
#define  IMD_TSAC_Index          10
#define  AMS_TSAC_index          11
#define  BSPD_index              12
#define  HVD_index               13
#define  TSMP_index              14
#define  TSMS_index              15


// uint16_t SDC_input; 
extern XGpio SDC_axi_gpio_inst;


int init_SDC();
uint32_t  SDC_read_as_register (uint32_t *SDC_register);
void SDC_read_as_array (uint32_t bit_array[ NO_OF_SDC_NODES ] );
bool is_SDC_Completed();
const char* get_first_broken_node();  
// SDC Enable()

bool get_SDC_Cockpit_Emergency_Btn_Status();
bool get_SDC_BOTS_Status();
bool get_SDC_inertia_Status();
bool get_SDC_L_emergency_Btn_Status();
bool get_SDC_R_emergency_Btn_Status();
bool get_SDC_FR_Wheel_Status();
bool get_SDC_FL_Wheel_Status();
bool get_SDC_RR_Wheel_Status();
bool get_SDC_RL_Wheel_Status();
    bool get_SDC_HV_Connector_TSAC_Status();
    bool get_SDC_IMD_TSAC_Status();
    bool get_SDC_AMS_TSAC_Status();
bool get_SDC_BSPD_Status();
bool get_SDC_HVD_Status();
bool get_SDC_TSMP_Status();
bool get_SDC_TSMS_Status();
