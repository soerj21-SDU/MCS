/*
 * global_variables.h
 *
 *  Created on: Apr 1, 2020
 *      Author: soeren
 */

/*
 * This file contains all the global variable used. The variables are in order
 * of blocks according to the task diagram.
 *
 * Task diagram version: 1.0.1
 */
#ifndef SRC_GLOBAL_VARIABLES_H_
#define SRC_GLOBAL_VARIABLES_H_

#include "stdint.h"
#include "global_def.h"




// MUTEXES
extern OS_MUTEX g_mutex_TS_block;
extern OS_MUTEX g_mutex_status_block;
extern OS_MUTEX g_mutex_charger_block;
extern OS_MUTEX g_mutex_cell_voltages;
extern OS_MUTEX g_mutex_cell_temps;
extern OS_MUTEX g_mutex_SOC;
extern OS_MUTEX g_mutex_config_data;

// TS block
extern int32_t g_BAT_voltage;
extern int32_t g_TS_voltage;
extern int32_t g_TS_current;
extern int32_t  g_TS_power;
extern int32_t  g_TS_coulomb_count;

// General status block
extern uint16_t g_charge_current;

// Cell voltage block
extern uint16_t g_cell_voltages[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELLS_PR_BANK];
extern bool g_slaveboard_L6813_PEC_error[MAX_NUMBER_OF_BANKS][DEVICES_PR_BANK];
extern OS_TICK g_sample_time_cell_voltages[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELLS_PR_BANK];
extern uint16_t g_lowest_cell_voltage;


extern uint8_t g_SOC;
extern uint8_t g_ams_status_heartbeat;
extern uint8_t g_ams_charger_status_hearbeat;
extern bool g_charger_connected;
extern uint8_t g_charge_control;
extern uint8_t g_charger_status;

// temprature block
extern int16_t g_cell_temps[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELL_TEMPS_PR_BANK]; // Unit 0.1C
extern OS_TICK g_sample_time_cell_temps[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELL_TEMPS_PR_BANK];
extern int16_t g_cell_discharge_temps[MAX_NUMBER_OF_BANKS][NUMBER_OF_DISCHARGE_TEMPS_PR_BANK]; // Unit 0.1C
extern OS_TICK g_sample_time_cell_discharge_temps[MAX_NUMBER_OF_BANKS][NUMBER_OF_DISCHARGE_TEMPS_PR_BANK];
extern int16_t g_higest_cell_temperature;
extern int16_t g_highest_discharge_temp;
extern int16_t g_lowest_discharge_temp;


// CAN Variables
extern int g_CAN_TX_Alive_Counter; // ONLY USED FOR DEBUG.


// NOT YET PUT IN A CATEGORY
extern uint8_t g_number_of_banks; // max 3 bits
extern uint8_t g_bank_count_set_by_Car;
extern bool g_warining_temprature;
extern bool g_warining_voltage_near_limit;
extern bool g_monitor_error_signal;
extern uint16_t g_monitor_error_code;
extern bool g_enable_discharge_pins[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELLS_PR_BANK];
extern uint8_t g_charging_to_controller_signal;
extern uint32_t g_clear_check_fail_count;
extern uint32_t g_clear_check_success_count;

// DEBUG BYTES
extern uint8_t g_debug_byte_1;
extern uint8_t g_debug_byte_2;
extern uint8_t g_debug_byte_3;
extern uint8_t g_debug_byte_4;
extern uint8_t g_debug_byte_5;
extern uint8_t g_debug_byte_6;
extern uint8_t g_debug_byte_7;
extern uint8_t g_debug_byte_8;



// CHARGING FOR DEBUG ONLY. SET IT BACK TO CHARNIG TASK

typedef enum{
	IDLE,
	CHARGING_CC,
	CHARGING_CV,
	DISCHARGING,
	WAIT_FOR_DISCHARGE_TEMP,
	CLOSE_AIRP

}CHARGING_STATES;

extern CHARGING_STATES charging_state;
extern uint8_t task_super_state;




typedef enum {
	CHARGER_STATUS_STOPPED =0,
	CHARGER_STATUS_STARTED =1,


} e_charger_status;


// Controller Task - This Task does not comply with the Viking naming. Deal with it.
typedef enum {
	CHARGER_CMD_NONE =0,
	CHARGER_CMD_TURN_ON_CHARGER =1,
	CHARGER_CMD_ABORT =2,
	CHARGER_CMDCHARGING_COMPLETE = 3

} e_charger_commands;
#ifndef DEFINED_TYPEDEF_FOR_ControlState_T_
#define DEFINED_TYPEDEF_FOR_ControlState_T_

typedef enum {
  ControlState_T_None = 0,             /* Default value */
  ControlState_T_Init_state,
  ControlState_T_Idle,
  ControlState_T_SC_enable,
  ControlState_T_Error,
  ControlState_T_SC_enabled,
  ControlState_T_Close_AIR_m,
  ControlState_T_Close_Pre,
  ControlState_T_Precharnig,
  ControlState_T_Close_AIR_p,
  ControlState_T_Open_Pre,
  ControlState_T_TS_active,
  ControlState_T_Drive,
  ControlState_T_Init_charing,
  ControlState_T_C_Close_AIR_m,
  ControlState_T_Charger_Error,
  ControlState_T_C_Close_Pre,
  ControlState_T_C_Precharnig,
  ControlState_T_C_Close_AIR_p,
  ControlState_T_C_Open_Pre,
  ControlState_T_Charge_Algortihm,
  ControlState_T_C_Open_AIR_p_and_m,
  ControlState_T_Charging_CC,
  ControlState_T_Charging_CV,
  ControlState_T_Charging_Discharge,
  ControlState_T_Charging_closeing_AIR,
  ControlState_T_Charging_Wating_DIS,
} ControlState_T;

#endif

#ifndef DEFINED_TYPEDEF_FOR_e_command_signals_
#define DEFINED_TYPEDEF_FOR_e_command_signals_

typedef enum {
  NON = 0,                             /* Default value */
  ENABLE_SC,
  ACTIVATE_TS,
  DRIVE,
  Charge_Start,
  Charge_STOP,
  Charge_COMPLETE
} e_command_signals;

#endif

#ifndef DEFINED_TYPEDEF_FOR_e_control_errors_
#define DEFINED_TYPEDEF_FOR_e_control_errors_

typedef enum {
  E_AMS_UNABLE_TO_CLOSE_SC = 0,        /* Default value */
  E_AMS_SC_BROKEN,
  E_AMS_UNABLE_TO_CLOSE_AIR_M,
  E_AMS_UNABLE_TO_CLOSE_PRE,
  E_AMS_UNABLE_TO_CLOSE_AIR_P,
  E_AMS_UNABLE_TO_OPEN_AIR_M,
  E_AMS_UNABLE_TO_OPEN_AIR_P,
  E_AMS_UNABLE_TO_OPEN_PRE,
  E_AMS_PRE_TIMEOUT,
  E_AMS_UNEXCEPTED_TS_CURRENT,
  E_AMS_RELAY_FAIELD,
  E_AMS_UNFIT_CHARGE_VOLTAGE
} e_control_errors;

#endif


extern ControlState_T Control_states;
extern uint8_t command_signal; // Used to transfer command from COM to Control task
extern uint16_t Control_Errors;
#endif /* SRC_GLOBAL_VARIABLES_H_ */
