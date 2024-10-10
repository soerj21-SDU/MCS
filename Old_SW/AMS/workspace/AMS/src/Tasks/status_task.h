/*
 * status_task.h
 *
 *  Created on: Mar 18, 2020
 *      Author: soeren
 */

#ifndef SRC_TASKS_STATUS_TASK_H_
#define SRC_TASKS_STATUS_TASK_H_
#include "../global_def.h"
#include "../global_variables.h"


// Status task
#define STATUS_TASK_PRIO       8u
#define STATUS_TASK_STK_SIZE  512u
#define STATUS_TASK_MSGQ_SIZE  32u

OS_TCB STATUS_TCB;
CPU_STK STATUS_TaskStk[STATUS_TASK_STK_SIZE];



OS_ERR Status_CreateTask();
void Status_Task(void *arg);

#endif /* SRC_TASKS_STATUS_TASK_H_ */
