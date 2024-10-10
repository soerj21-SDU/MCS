/*
 * test_task.h
 *
 *  Created on: Mar 18, 2020
 *      Author: soeren
 */

#ifndef SRC_TASKS_CONTROLLER_TASK_H_
#define SRC_TASKS_CONTROLLER_TASK_H_


#include <Source/os.h>
#include <stdlib.h>
#include "CAN_Tx_Task.h"


#define  TEST_TASK_PRIO                         7u
#define  TEST_TASK_STK_SIZE                     512u
#define  TEST_TASK_MSGQ_SIZE					   32u



OS_TCB Controller_Task_TCB;
CPU_STK  Test_TaskStk[TEST_TASK_STK_SIZE];
OS_ERR Test_Task_ERR;

OS_ERR create_controller_task();
void controller_task(void *arg);
uint8_t controllerTask_translate_errorCode(uint16_t control_error_code);

#endif /* SRC_TASKS_CONTROLLER_TASK_H_ */
