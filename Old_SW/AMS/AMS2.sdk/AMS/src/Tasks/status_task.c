/*
 * status_task.c
 *
 *  Created on: Mar 18, 2020
 *      Author: soeren
 */

#include "status_task.h"

#include <Source/os.h>
#include "os.h"
#include "xil_printf.h"
#include "xcanps.h"
#include "stdlib.h"

#include "../AMS_cfg.h"
#include "../utility/relay.h"

#include "../utility/shutdown.h"
#include "../global_def.h"

#include "../Unit_testing/unity.h"

#include "../utility/pl_led.h"



OS_ERR Status_CreateTask()
{
	OS_ERR error;
	OSTaskCreate(
			&STATUS_TCB,
			"Status DEBUG Task",
			Status_Task,
			NULL,
			STATUS_TASK_PRIO,
			&STATUS_TaskStk[0],
			STATUS_TASK_STK_SIZE / 10,
			STATUS_TASK_STK_SIZE,
			STATUS_TASK_MSGQ_SIZE,
			0,
			DEF_NULL,
			(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
			&error
			);

	return error;

}



void Status_Task(void *arg)
{

	OS_ERR err;
	uint8_t counter =0;

	UCOS_Print("Status Task started\r\n");
	OS_ERR os_err;

	bool led_blink = false;

	while(1)
	{

		OSMutexPend(&g_mutex_cell_voltages,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		UCOS_Printf("Voltage bank: 0 cell %d : Value %d \r\n",1,g_cell_voltages[0][1]);
		UCOS_Printf("Current counter: %d \r\n", g_TS_coulomb_count);
		OSMutexPost(&g_mutex_cell_voltages,OS_OPT_POST_NONE,&os_err);

		UCOS_Printf("Clear check (fails/successes/pct.): (%d/%d/%d)\r\n",
				g_clear_check_fail_count,
				g_clear_check_success_count,
				(100*g_clear_check_fail_count)/(g_clear_check_fail_count+g_clear_check_success_count)
				);

		//	OSMutexPend(&g_mutex_status_block,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		//	OSMutexPend(&g_mutex_TS_block,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		//	OSMutexPend(&g_mutex_cell_voltages,0,OS_OPT_PEND_BLOCKING,0,&os_err);

		//UCOS_Printf("AIRP: now: %d   contact time: %d   Time diff %d, airaux: %d ",now,contact_timer,(now-contact_timer),AIRP_AUX());


		/*

			counter++;
			//xil_printf("\E[H\E[J"); // Reset terminal
			UCOS_Printf("***Overview*** \r\n");
			UCOS_Printf("Counter = %d \r\n",counter);
			UCOS_Printf("TX alive  = %d \r\n",g_CAN_TX_Alive_Counter);
			UCOS_Printf("Charger present: %d \r\n",g_charger_connected);

			// TS
			UCOS_Printf("TS Overview \r\n");
			UCOS_Printf(" TS Current: %d mA     TS Voltage: %d mV   TS Power: %d W \r\n", g_TS_current,g_TS_voltage,g_TS_power);
			UCOS_Printf("BAT Voltage: %d mV \r\n ",g_BAT_voltage);

			/*
			UCOS_Printf("Voltage Overview \r\n");
			for(uint8_t i=0 ; i<10; i++)
			{
				UCOS_Printf("Voltage bank: 0 cell %d : Value %d \r\n",i,g_cell_voltages[0][i]);
			}
			*/

			/*
			UCOS_Printf("TEMP Overview \r\n");
			for(uint8_t i=0 ; i<10; i++)
			{
				UCOS_Printf("temp cell %d : %2d.%1dC \r\n",i,g_cell_temps[0][i]/10,abs(g_cell_temps[0][i])%10);
		//("[D#%2d: %2d.%1dC]", j*7+k+1, bal_temp[i][j*7+k]/10, abs(bal_temp[i][j*7+k])%10);
			}
			UCOS_Printf("Discharge Overview \r\n");
			for(uint8_t bank =0; bank< 5 ; bank++)
			{
				for(uint8_t i=0 ; i<14; i++)
				{
					UCOS_Printf("discharge temp, b: %d, c %d : %2d.%1dC \r\n",bank,i,g_cell_discharge_temps[bank][i]/10,abs(g_cell_temps[0][i])%10);
			//("[D#%2d: %2d.%1dC]", j*7+k+1, bal_temp[i][j*7+k]/10, abs(bal_temp[i][j*7+k])%10);
				}
			}
			*/

/*
			// For test print cell_temp[i][j*5+k]/10, abs(cell_temp[i][j*5+k])%10

			UCOS_Printf("Safety Curcit: \r\n");
			//xil_printf("IMD_SWITCH = %d\r\n",IMD_Status());
			UCOS_Printf("IMD_Switch = %d | IMD_Latched = %d | IMD_Data = %d | AMS_Latched = %d | SC_IN = %d | SC_HVDC_IL = %d | SC_IN_Again = %d | SC_END = %d\r\n",
						IMD_Status(), IMD_Latched(), IMD_Data(), AMS_Latched(), SC_IN(), SC_HVDC_IL(), SC_IN_Again(), SC_END());

			UCOS_Printf("---\r\n");
			UCOS_Printf("AUX Relays: \r\n");
			UCOS_Printf("Precharge = %d, AIR+ = %d, AIR- = %d \r\n",Precharge_AUX(),AIRP_AUX(),AIRM_AUX());


			uint8_t relay_out = get_relay_out();

			bool Precharge_out = relay_out & (1 << 0);
			bool AIRP_out = relay_out & (1 << 1);
			bool AIRM_out = relay_out & (1 << 2);

			UCOS_Printf("Relay out: \r\n");
			UCOS_Printf("Precharge = %d, AIR+ = %d, AIR- = %d \r\n",Precharge_out,AIRP_out,AIRM_out);


			// print chart state

			UCOS_Printf("Stateflow state: ");
			switch (Control_states) {
				case ControlState_T_Init_state:
					UCOS_Printf("Init");
					break;
				case ControlState_T_Idle:
					UCOS_Printf("Idle");
					break;
				case ControlState_T_SC_enable:
					UCOS_Printf("SC  enable");
					break;
				case ControlState_T_SC_enabled:
					UCOS_Printf("SC enabled");
					break;
				case ControlState_T_Close_AIR_m:
					UCOS_Printf("Close AIR-");
					break;
				case ControlState_T_Close_Pre:
					UCOS_Printf("Close Precharge");
					break;
				case ControlState_T_Precharnig:
					UCOS_Printf("Prexcharging");
					break;
				case ControlState_T_Open_Pre:
					UCOS_Printf("Open Precharge");
					break;
				case ControlState_T_Close_AIR_p:
					UCOS_Printf("Close AIR+");
					break;
				case ControlState_T_TS_active:
					UCOS_Printf("TS active");
					break;
				case ControlState_T_Error:
					UCOS_Printf("Error state");
					break;
				case ControlState_T_Drive:
					UCOS_Printf("Drive");
					break;
				case ControlState_T_None:
					UCOS_Printf("NONE");
					break;
				case ControlState_T_Init_charing: // Start her
					UCOS_Printf("Init charging");
					break;
				case ControlState_T_C_Close_AIR_m:
					UCOS_Printf("Charging: Close AIR-");
					break;
				case ControlState_T_Charger_Error:
					UCOS_Printf("Charging: Error");
					break;
				case ControlState_T_C_Close_Pre:
					UCOS_Printf("Charging: close precharge");
					break;
				case ControlState_T_C_Precharnig:
					UCOS_Printf("Charging: Precharging");
					break;
				case ControlState_T_C_Open_Pre:
					UCOS_Printf("Charging: Open Precharge");
					break;
				case ControlState_T_C_Close_AIR_p:
					UCOS_Printf("Charging: Close charge relays");
					break;
				case ControlState_T_Charge_Algortihm:
					UCOS_Printf("Charging: Charge algorithm");
					break;
				case ControlState_T_C_Open_AIR_p_and_m:
					UCOS_Printf("Charging Done: Open AIR+");
					break;
				default:
					UCOS_Printf("Unknown");
					break;
			}
			UCOS_Printf("\r\n");

			// Errors

			UCOS_Printf("Controller Errors: %d , SC_BROKN = %d \r\n",Control_Errors,Control_Errors & (1<<E_AMS_SC_BROKEN));


			if(Control_Errors & (1<<E_AMS_UNABLE_TO_CLOSE_AIR_M)) UCOS_Printf("Error: AIR - could not close\r\n");
			if(Control_Errors & (1<<E_AMS_UNABLE_TO_CLOSE_PRE)) UCOS_Printf("Error: Precharge could not close\r\n");
			if(Control_Errors & (1<<E_AMS_UNABLE_TO_CLOSE_AIR_P)) UCOS_Printf("Error: AIR+ could not close\r\n");
			if(Control_Errors & (1<<E_AMS_RELAY_FAIELD)) UCOS_Printf("Error: Relay failed during TS/Drive mode\r\n");
			if(Control_Errors & (1<<E_AMS_UNABLE_TO_OPEN_PRE)) UCOS_Printf("Error: Precharge could not open\r\n");
			if(Control_Errors & (1<<E_AMS_UNEXCEPTED_TS_CURRENT)) UCOS_Printf("Error: Unexcepted TS current\r\n");
			if(Control_Errors & (1<<E_AMS_PRE_TIMEOUT)) UCOS_Printf("Error: Precharge timeout\r\n");
			if(Control_Errors & (1<<E_AMS_UNABLE_TO_CLOSE_SC)) UCOS_Printf("Error: Could not close Safety chain \r\n");
			if(Control_Errors & (1<<E_AMS_SC_BROKEN)) UCOS_Printf("Error: Safety chain broken \r\n");
			if(Control_Errors & (1<<E_AMS_UNABLE_TO_OPEN_AIR_M)) UCOS_Printf("Error: Unable to open AIR-\r\n");
			if(Control_Errors & (1<<E_AMS_UNABLE_TO_OPEN_AIR_P)) UCOS_Printf("Error:Unable to open AIR+ \r\n");
			if(Control_Errors & (1<<E_AMS_UNFIT_CHARGE_VOLTAGE)) UCOS_Printf("Error: Unfit charge current  \r\n");
			//UCOS_Printf("Error Event: %d \r\n ",Error_SC_Event );

			led_blink = !led_blink;
			pl_led2(led_blink);

			// DEBUG CHARGING STATE

			UCOS_Printf("Charing state: ");
			switch (charging_state) {
				case IDLE:
					UCOS_Printf("Idle");
					break;
				case CHARGING_CC:
					UCOS_Printf("charing CC");
					break;
				case CHARGING_CV:
					UCOS_Printf("charing CV");
					break;
				case DISCHARGING:
					UCOS_Printf("Discharging");
					break;
				case WAIT_FOR_DISCHARGE_TEMP:
					UCOS_Printf("Waiting for discharge temp");
					break;
				case CLOSE_AIRP:
					UCOS_Printf("Close AIRP");
					break;
				default:
					UCOS_Printf("Unknown");
					break;
			}
			UCOS_Printf("\r\n");

			UCOS_Printf("Charing super state: %d \r\n",task_super_state);

			/*
			OSMutexPost(&g_mutex_TS_block,OS_OPT_POST_NONE,&os_err);
			OSMutexPost(&g_mutex_cell_voltages,OS_OPT_POST_NONE,&os_err);
			OSMutexPost(&g_mutex_status_block,OS_OPT_POST_NONE,&os_err);
			*/


			OSTimeDlyHMSM(0,0,1,0,OS_OPT_TIME_HMSM_STRICT,&err); // delay 1 sec

	}

}

