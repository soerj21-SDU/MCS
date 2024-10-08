/*
 * global_variables.c
 *
 *  Created on: Apr 1, 2020
 *      Author: soeren
 */


#include "global_variables.h"


// MUTEXś
OS_MUTEX g_mutex_TS_block;
OS_MUTEX g_mutex_status_block;
OS_MUTEX g_mutex_charger_block;
OS_MUTEX g_mutex_cell_voltages;
OS_MUTEX g_mutex_cell_temps;
OS_MUTEX g_mutex_SOC;
OS_MUTEX g_mutex_config_data;

uint16_t g_cell_voltages[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELLS_PR_BANK]={ 0 }; // Unit 100uV MAX 6,5V = 65000
bool g_slaveboard_L6813_PEC_error[MAX_NUMBER_OF_BANKS][DEVICES_PR_BANK]={0}; // error if true
 OS_TICK g_sample_time_cell_voltages[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELLS_PR_BANK]={ 0 };
uint16_t g_lowest_cell_voltage=0;


uint8_t g_SOC=0;
uint8_t g_ams_status_heartbeat=0;
uint8_t g_ams_charger_status_hearbeat =0;

// Charger block protected by g_mutex_status_charger_block
bool g_charger_connected = false;
uint8_t g_charge_control =CHARGER_CMD_NONE;
uint8_t g_charger_status=CHARGER_STATUS_STOPPED;

// temprature block
int16_t g_cell_temps[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELL_TEMPS_PR_BANK]={ 0 }; // Unit 0.1 C
OS_TICK g_sample_time_cell_temps[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELL_TEMPS_PR_BANK]={ 0 };
int16_t g_cell_discharge_temps[MAX_NUMBER_OF_BANKS][NUMBER_OF_DISCHARGE_TEMPS_PR_BANK]={ 0 }; // Unit 0.1C
OS_TICK g_sample_time_cell_discharge_temps[MAX_NUMBER_OF_BANKS][NUMBER_OF_DISCHARGE_TEMPS_PR_BANK]={ 0 };
int16_t g_higest_cell_temperature=0;
int16_t g_highest_discharge_temp=10000;
int16_t g_lowest_discharge_temp = 0;

// Generel status block
uint16_t g_charge_current = 0; // UNIT 0.1 A


// TS block
int32_t  g_BAT_voltage=0; // UNIT 1mV
int32_t  g_TS_voltage=0;  // UNIT 1mV
int32_t  g_TS_current=0;  // UNIT 1mA
int32_t  g_TS_power=0;    // UNIT 1W
int32_t  g_TS_coulomb_count=0; // UNIT 1As


// CAN

int g_CAN_TX_Alive_Counter=0; // DEBUG ONLY


// NOT YET PUT IN A CATEGORY
uint8_t g_number_of_banks=DEFAULT_BANK_COUNT; // max 3 bits
uint8_t g_bank_count_set_by_Car =0;
bool g_warining_temprature=false;
bool g_warining_voltage_near_limit=false;
bool g_monitor_error_signal = false;
 uint16_t g_monitor_error_code=0;
bool g_enable_discharge_pins[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELLS_PR_BANK]={false};
uint8_t g_charging_to_controller_signal =0;
uint32_t g_clear_check_fail_count = 0;
uint32_t g_clear_check_success_count = 0;


// DEBUG BYTES
uint8_t g_debug_byte_1=0;
uint8_t g_debug_byte_2=0;
uint8_t g_debug_byte_3=0;
uint8_t g_debug_byte_4=0;
uint8_t g_debug_byte_5=0;
uint8_t g_debug_byte_6=0;
uint8_t g_debug_byte_7=0;
uint8_t g_debug_byte_8=0;

// CHARGING FOR DEBUG ONLY. SET IT BACK TO CHARNIG TASK
CHARGING_STATES charging_state = IDLE;
uint8_t task_super_state = 0;


// Controller Task!

// Current Controller state - This Task does not comply with the Viking naming. Deal with it.
ControlState_T Control_states;
uint8_t command_signal;
uint16_t Control_Errors; // TO DO: Make a single byte.
