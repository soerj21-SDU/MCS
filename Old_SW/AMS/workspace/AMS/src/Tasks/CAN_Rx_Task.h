/*
 * CAN_Rx_Task.h
 *
 *  Created on: Mar 18, 2020
 *      Author: soeren
 */

#ifndef SRC_TASKS_CAN_RX_TASK_H_
#define SRC_TASKS_CAN_RX_TASK_H_

#include <Source/os.h>
#include <stdlib.h>
#include <app_cfg.h>
#include <can_cfg.h>
#include <can_bsp.h>
#include "can_sig.h"
#include "can_msg.h"
#include "can_err.h"
#include "drv_can.h"
//#include "cpu.h"
//#include "AMSControl.h"
#include  <can_frm.h>
#include  <can_bus.h>
#include "../global_def.h"
#include "../utility/shunt.h"
#include "../global_variables.h"
#include "controller_Task.h"


#define  CAN_RX_TASK_PRIO                         6u
#define  CAN_RX_TASK_STK_SIZE                     512u
#define  CAN_RX_TASK_MSGQ_SIZE					   32u

typedef enum{
	CAN_MSG_COMMAND_ID = 0x03,
	CAN_MSG_CHARGER_COMMAND_ID = 0x00


}CAN_ID;

OS_TCB CAN_RX_TCB;
CPU_STK  CAN_RxTaskStk[CAN_RX_TASK_STK_SIZE];
OS_ERR CAN_RX_ERR;

OS_ERR CAN_RX_createTask();
void CAN_RX_Task(void *arg);


#endif /* SRC_TASKS_CAN_RX_TASK_H_ */
