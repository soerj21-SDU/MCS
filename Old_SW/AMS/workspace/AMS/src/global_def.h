/*
 * gloal_def.h
 *
 *  Created on: Mar 25, 2020
 *      Author: soeren
 *
 *  Describtion:
 *  This module(h and c file) holds all the global variables for the system.
 */

#ifndef SRC_GLOBAL_DEF_H_
#define SRC_GLOBAL_DEF_H_

#include "os.h"
#include "ucos_bsp.h"
#include "stdint.h"
#include "stdbool.h"



// Defines :

#define DEBUG 0  // Enable for debug.
#define UNIT_TESTS 0 // Run UNIT TESTS
#define CELL_SIMULATION DEF_DISABLED // CELL simulation instead of cell com // DEF_ENABLED
#define LTC6813_CLEAR_CHECK 0 // Enable to clear LTC6813s before every read/write cycle to ensure new data

/// Physical values
#define MIN_CELL_VOLTAGE 30000 //Unit 100uv
#define MAX_CELL_VOLTAGE 41700 // 100uv
#define VOLT_MAX 41700 // 100uv
#define VOLT_CHARGE_LIMIT 41000 // 100uv
#define VOLT_CHARGE_GOAL 40500 // 100uv
#define VOLT_NOMINAL 37000 // 100uv
#define VOLT_MIN 30300 // 100uv
#define BATTERYTASK_LOOP_TIME_TICKS 50 //ms


#define MAX_CELL_TEMP 500 // 0.1c
#define MIN_CELL_TEMP -10 // 0.1c

#define MAX_DISCHARGE_TEMP 700 // 0.1c
#define MIN_DISCHARGE_TEMP -10 // 0.1c


#define MAX_MONITOR_VOLTAGE_TIME 500u //ms
#define MAX_MONITOR_DISCHARGE_TEMP_TIME 1000u //ms
#define MAX_MONITOR_TEMP_TIME 1000u //ms

#define CHARGE_VOLTAGE_SAFETY_MARGIN  100// mV


#define MAX_NUMBER_OF_BANKS 5
#define NUMBER_OF_CELLS_PR_BANK 28
// The number of devices per bank.
#define DEVICES_PR_BANK 2
#define NUMBER_OF_CELL_TEMPS_PR_BANK 10
#define NUMBER_OF_DISCHARGE_TEMPS_PR_BANK 14
#define NUMBER_OF_TEMPS_PER_DEVICE 5

// Communication
#define LOOP_TIME_CAN_TX 50 // ms

// CAN INTERFACE
#define CAN_BASEADDR 0x300 // 0x400



// NOT YET PUT IN A CATEGORY
#define DEFAULT_BANK_COUNT 1



#endif /* SRC_GLOBAL_DEF_H_ */
