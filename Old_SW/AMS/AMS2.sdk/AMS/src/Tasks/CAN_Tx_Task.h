/*
 * CAN_Tx_Task.h
 *
 *  Created on: Apr 1, 2020
 *      Author: soeren
 */

#ifndef SRC_TASKS_CAN_TX_TASK_H_
#define SRC_TASKS_CAN_TX_TASK_H_

#include  <can_frm.h>
#include  <can_bus.h>
#include "../global_def.h"
#include <Source/os.h>
#include <stdlib.h>
#include <app_cfg.h>
#include <can_bsp.h>
#include "can_sig.h"
#include "can_msg.h"
#include "can_err.h"
#include "drv_can.h"
//#include "cpu.h"
//#include "AMSControl.h"
#include  <can_frm.h>
#include  <can_bus.h>

#include "../config/can_cfg.h"

#include "../utility/relay.h"
#include "../utility/shutdown.h"
#include "../utility/pl_led.h"
#include "../global_variables.h"
#include "../utility/LTC6813.h"


#define  CAN_TX_TASK_PRIO                         5u
#define  CAN_TX_TASK_STK_SIZE                     512u
#define  CAN_TX_TASK_MSGQ_SIZE					   32u

enum {
	CAN_MSG_STATUS_ID =0,
	CAN_MSG_CHARGE_STATUS = 0x01,
	CAN_MSG_CELL_VOLTAGE_ID =0x11, // 0x01
	CAN_MSG_CELL_TEMP_ID = 0x12, // 0x02
	CAN_MSG_DISCHARGE_TEMP_ID = 0x13, // 0x03
	CAN_MSG_ERROR_ID = 0x14 // 0x04
};
extern  const CANBUS_PARA  CanCfg0;
extern const  CANMSG_PARA  CanMsg[CANMSG_N];

OS_TCB CAN_TX_TCB;
CPU_STK  CAN_TxTaskStk[CAN_TX_TASK_STK_SIZE];


OS_ERR create_CAN_TX_Task();
void CAN_TX_Task(void *arg);
void CAN_Init();


#endif /* SRC_TASKS_CAN_TX_TASK_H_ */
