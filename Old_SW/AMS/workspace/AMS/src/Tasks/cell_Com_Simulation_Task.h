/*
 * cell_Com_Simulation_Task.h
 *
 *  Created on: Apr 8, 2020
 *      Author: soeren
 */

#ifndef SRC_TASKS_CELL_COM_SIMULATION_TASK_H_
#define SRC_TASKS_CELL_COM_SIMULATION_TASK_H_

#include "../global_def.h"
#include <Source/os.h>
#include <stdlib.h>
#include "../global_variables.h"
#include "../utility/dac.h" // TODO REMOVE, ITS ONLY FOR DEBUG


#define  CELL_COM_SIMULATION_TASK_PRIO                         2u
#define  CELL_COM_SIMULATION_TASK_STK_SIZE                     512u
#define  CELL_COM_SIMULATION_TASK_MSGQ_SIZE				   32u



OS_TCB g_cell_com_simulation_TCP;
CPU_STK  cell_com_simulation_task_stk[CELL_COM_SIMULATION_TASK_STK_SIZE];


OS_ERR cellComSim_CreateTask();
void CellComSim_Task(void *arg);


#endif /* SRC_TASKS_CELL_COM_SIMULATION_TASK_H_ */
