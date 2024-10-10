/*
 * charging_Task.h
 *
 *  Created on: May 26, 2020
 *      Author: soeren
 */

#ifndef SRC_TASKS_CHARGING_TASK_H_
#define SRC_TASKS_CHARGING_TASK_H_

#include <Source/os.h>
#include <stdlib.h>

#include "../utility/LTC6813.h"
#include "../global_variables.h"
#include "../global_def.h"
#include "../utility/pl_led.h"
#include "../utility/relay.h"
#include "CAN_Tx_Task.h"
#include "controller_Task.h"
#include "../utility/dac.h"
//#include "monitor_Task.h"


#define  CHARGING_TASK_PRIO                         7u
#define  CHARGING_TASK_STK_SIZE                     512u
#define  CHARGING_TASK_MSGQ_SIZE				   32u

#define CHARGING_CURRENT_LIMIT 120 // UNIT = 0.1A;
#define CHARGING_CURRENT 1u // UNIT ??
#define CHARGING_CC_VOLTAGE_STOP_LIMIT 41600 // UNIT= 100uV
#define CHARGING_VOLTAGE_LOW_LIMIT 32000 // UNIT = 100uV
#define CHARGING_DISCHARGE_WINDOW 41200 //UNIT = 100uV
#define CHARGING_DISCHARGE_HIGH_TEMP_LIMIT 600 // 0.1C
#define CHARGING_DISCHARGE_LOW_TEMP_LIMIT 300 // 0.1C
#define CHARING_DISCHARGE_TEMP_TIMEOUT 600000 // UNIT 1 ms
#define CHARING_CONTACT_TIME 1000// UNIT 1ms
#define CHARGING_CC_COMPLETE_WINDOW 41400
#define CHARGE_CURRENT_LOW_LIMIT 100 // UNIT 1mA
#define CHARGING_MAX_DAC 1023
#define DEFAULT_CHARGE_CURRENT 11u //UNIT 0.1A

#define CHARGING_FORCE_DISCHARGE_TIME 60000u // UNIT 1ms

typedef enum{
	NONE_SIGNAL,
	CHARGE_COMPLETE,
	CHARGE_ERROR,
	CHARGE_ABORT

}CHARGING_CONTROLLER_SIGNAL;


OS_TCB g_charging_task_TCP;
CPU_STK  g_charging_task_stk[CHARGING_TASK_STK_SIZE];


OS_ERR chargingTask_CreateTask();
void chargingTask_Task(void *arg);
void set_charge_current(uint16_t charge_current);


#endif /* SRC_TASKS_CHARGING_TASK_H_ */
