/*
 * monitor_Task.h
 *
 *  Created on: Apr 8, 2020
 *      Author: soeren
 *
 *
 *Describtion: This task only purpose is to monitor the cells voltage and temperature and give a warning if they proceed the limits given.
 * Because this job is a time sensitive matter, running through all cell voltage and tempratures will only be done once and perform mulitple steps on the way.
 *
 *
 */

#ifndef SRC_TASKS_MONITOR_TASK_H_
#define SRC_TASKS_MONITOR_TASK_H_

#include "../global_def.h"
#include "../global_variables.h"
#include <Source/os.h>
#include <stdlib.h>
#include "os.h"
#include "../utility/shutdown.h"
#include "CAN_Tx_Task.h"


#define  MONITOR_TASK_PRIO                         3u
#define  MONITOR_TASK_STK_SIZE                     512u
#define  MONITORTX_TASK_MSGQ_SIZE				   32u


#define CPU_TICK_TIME  ((1/OS_CFG_TICK_RATE_HZ)*1000) // Units ms OS_CFG_TICK_RATE_HZ= 1000Hz
#define MONITOR_LOOP_TIME  50u //50*CPU_TICK_TIME


OS_TCB g_monitor_TCP;
CPU_STK  monitor_task_stk[MONITOR_TASK_STK_SIZE];


OS_ERR create_monitor_Task();
void Monitor_Task(void *arg);


#endif /* SRC_TASKS_MONITOR_TASK_H_ */
