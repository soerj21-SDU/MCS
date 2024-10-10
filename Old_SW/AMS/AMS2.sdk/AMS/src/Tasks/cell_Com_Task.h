/*
 * cell_Com_Task.h
 *
 *  Created on: Apr 8, 2020
 *      Author: soeren
 */

#ifndef SRC_TASKS_CELL_COM_TASK_H_
#define SRC_TASKS_CELL_COM_TASK_H_



#include <Source/os.h>
#include <stdlib.h>

#include "../utility/LTC6813.h"
#include "../global_variables.h"
#include "../global_def.h"
#include "../utility/pl_led.h"
#include "monitor_Task.h"
#include "charging_Task.h"


#define  CELL_COM_TASK_PRIO                         2u
#define  CELL_COM_TASK_STK_SIZE                     512u
#define  CELL_COM_TASK_MSGQ_SIZE				   32u



OS_TCB g_cell_com_TCP;
CPU_STK  cell_com_task_stk[CELL_COM_TASK_STK_SIZE];


OS_ERR cellCom_CreateTask();
void CellCom_Task(void *arg);

#endif /* SRC_TASKS_CELL_COM_TASK_H_ */
