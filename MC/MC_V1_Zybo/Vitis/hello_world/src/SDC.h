
#include <stdio.h>
#include "xparameters.h"
#include "xgpio.h"
#include <stdint.h>
#include <stdbool.h>

#define DIR_INPUT 1 
#define DIR_OUTPUT 0


#define SDC_AXI_Address XPAR_AXI_GPIO_0_BASEADDR

#define GPIO_CHANNEL_1 1 
#define GPIO_CHANNEL_2 2

#define NO_OF_SDC_NODES 15


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
XGpio SDC_axi_inst;

int init_SDC();