/*
 * AMS.c
 *
 *  Created on: 6. maj 2019
 *      Author: matt
 *
 *  This is the main project file containing main().
 *  It creates the tasks and has the necessary data structures for them.
 */

#include <stdio.h>
#include "sleep.h"
#include <Source/os.h>
#include <ucos_bsp.h>
#include "xil_printf.h"
#include <stdlib.h>
#include <stdio.h>

#include "utility/pl_led.h"
#include "utility/relay.h"
#include "utility/shutdown.h"
#include "utility/dac.h"
#include "AMS_cfg.h"
#include "Tasks/CAN_Rx_Task.h"
#include "Tasks/status_task.h"
#include "Tasks/controller_Task.h"
#include "Unit_testing/unity.h"
#include "Tasks/cell_Com_Simulation_Task.h"
#include "Tasks/CAN_Tx_Task.h"
#include "Tasks/monitor_Task.h"
#include "Tasks/charging_Task.h"




extern void test_controller_should_ResetALLOUTPUTVALUES(void);

bool createMutexes();

void startup_Task(void *arg)
{
	OS_ERR err;
	// Pherifial initial setup
	dac_init();
	//tmp100_init();
	relay_init();
	shutdown_init();
	pl_led_init();

	CAN_Init();
	createMutexes();

#if  UNIT_TESTS
	 printf("... Unit Tests....\r\n"); // This line must be here! Do not remove. It does some magic with definig stdout.
	 Run_controller_unit_test();
//	 UnityBegin("State Machine unit test\n\r");
//	 RUN_TEST(test_controller_should_ResetALLOUTPUTVALUES); /* Run the test. */
//	 UNITY_END();
//	 xil_printf("To exit Unit tests, please compile the code again with the define UNIT_TESTS=0");
	 while(1);
#endif




	 // STATUS TASk
	 OS_ERR status_error = Status_CreateTask();
	if (status_error != OS_ERR_NONE) {
	        /* The task didn’t get created.  Lookup the value of the error code ... */
	        /* ... in os.h for the meaning of the error                             */
		UCOS_Print("Error: Can not create Status task...\n\r");
	  }


	err = CAN_RX_createTask();
	if (err != OS_ERR_NONE)
		{
		UCOS_Print("Error: Can not create CAN_RX_TASK task...\n\r");
	    }

	err = create_CAN_TX_Task();
	if (err != OS_ERR_NONE)
		{
		UCOS_Print("Error: Can not create CAN_TX_TASK task...\n\r");
	    }


	err = create_controller_task();
	if (err != OS_ERR_NONE)
		{
			UCOS_Print("Error: Can not create controller task...\n\r");
		}
#if CELL_SIMULATION
	err = cellComSim_CreateTask();
	if (err != OS_ERR_NONE)
		{
		UCOS_Print("Error: Can not create cellComSim task...\n\r");
	    }
#else
	err = cellCom_CreateTask();
	if (err != OS_ERR_NONE)
		{
		UCOS_Print("Error: Can not create cellCom task...\n\r");
	    }

#endif

	err = create_monitor_Task();
	if (err != OS_ERR_NONE)
		{
			UCOS_Print("Error: Can not create monitor task...\n\r");
		}



	err = chargingTask_CreateTask();
	if (err != OS_ERR_NONE)
		{
			UCOS_Print("Error: Can not create charing task...\n\r");
		}








}


int main()
{

	UCOSStartup(startup_Task);

	return 0;
}

bool createMutexes()
{
	OS_ERR err;
	OSMutexCreate(&g_mutex_status_block,"Status block MUTEX",&err);
	if(err != OS_ERR_NONE)
	{
		UCOS_Print("Error: Cannot create Status block MUTEX \n\r");
	}
	OSMutexCreate(&g_mutex_TS_block,"TS block MUTEX",&err);
	if(err != OS_ERR_NONE)
	{
		UCOS_Print("Error: Cannot create TS block MUTEX \n\r");
	}
	OSMutexCreate(&g_mutex_cell_voltages,"Cell Voltage MUTEX",&err);
	if(err != OS_ERR_NONE)
	{
		UCOS_Print("Error: Cannot create Cell Voltage MUTEX \n\r");
	}
	OSMutexCreate(&g_mutex_cell_temps,"Cell Temp MUTEX",&err);
	if(err != OS_ERR_NONE)
	{
		UCOS_Print("Error: Cannot create Cell Temp MUTEX \n\r");
	}
	OSMutexCreate(&g_mutex_SOC,"SOC MUTEX",&err);
	if(err != OS_ERR_NONE)
	{
		UCOS_Print("Error: Cannot create SOC MUTEX \n\r");
	}
	OSMutexCreate(&g_mutex_config_data,"Config MUTEX",&err);
	if(err != OS_ERR_NONE)
	{
		UCOS_Print("Error: Cannot create Config MUTEX \n\r");
	}
	OSMutexCreate(&g_mutex_charger_block,"Charger MUTEX",&err);
	if(err != OS_ERR_NONE)
	{
		UCOS_Print("Error: Cannot create Charger MUTEX \n\r");
	}

}
