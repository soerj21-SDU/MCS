/*
 * charging_Task.c
 *
 *  Created on: May 26, 2020
 *      Author: soeren
 */

#include "charging_Task.h"

OS_ERR chargingTask_CreateTask()
{
	OS_ERR error;

    OSTaskCreate(&g_charging_task_TCP,
                 "Charging Task",
				 chargingTask_Task,
				 0,          				//argument for task. None for the moment
				 CHARGING_TASK_PRIO,
				 &g_charging_task_stk[0],
				 CHARGING_TASK_STK_SIZE/10,
				 CHARGING_TASK_STK_SIZE,
				 CHARGING_TASK_MSGQ_SIZE,
				 0,
				 DEF_NULL,
				 (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR), //stack checking and stack clearing options
				 &error);

    return error;

}
void determine_higest_voltage( uint8_t number_of_banks, uint8_t cells_count_per_bank, uint16_t * higest_cell_voltage, uint8_t* bank_number_of_higest, uint8_t* cell_index_of_higest )
{
	*higest_cell_voltage =0;
	for(uint8_t bank = 0; bank<number_of_banks; bank++)
	{
		for(uint8_t cell=0; cell<cells_count_per_bank; cell++)
		{
			if(g_cell_voltages[bank][cell]>*higest_cell_voltage)
			{
				*higest_cell_voltage = g_cell_voltages[bank][cell];
				*bank_number_of_higest = bank;
				*cell_index_of_higest = cell;


			}



		}

	}
}

// input UINT 0.1A
// Charge current doent work yet. Please look into it.
void set_charge_current(uint16_t charge_current)
{

	if( charge_current > CHARGING_CURRENT_LIMIT)
	{
		charge_current = CHARGING_CURRENT_LIMIT;
	}


	uint16_t dac_value = (uint16_t)(((float)charge_current / (float) CHARGING_CURRENT_LIMIT)* (float) CHARGING_MAX_DAC);
	//UCOS_Printf("Sim: current: %d A dac value: %d, g_current: %d A \n\r",g_debug_byte_7,dac_value,g_charge_current);
	dac_write(dac_value);
}
void determine_discharge_cells( uint8_t number_of_banks,bool cells_to_discharge[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELLS_PR_BANK],uint16_t window_min_limit)
{
	if(number_of_banks>5)
	{
		UCOS_Printf("Func : Determine discharge_cells error: Bank count arg out of scope \n\r");
		return;
	}
	for(uint8_t bank = 0; bank<number_of_banks; bank++)
	{
		for(uint8_t cell=0; cell<NUMBER_OF_CELLS_PR_BANK; cell++)
		{

			if(g_cell_voltages[bank][cell] >= window_min_limit)
			{
				cells_to_discharge[bank][cell]=true;
				UCOS_Printf("Discharge cell: bank %d , cell %d \n\r",bank,cell );
			}
			else
			{
				g_cell_voltages[bank][cell] =false;
			}

		}
	}


}

void activate_discharge(uint8_t number_of_banks,bool cells_to_discharge[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELLS_PR_BANK])
{
	for(uint8_t bank = 0; bank<number_of_banks; bank++)
		{
			for(uint8_t cell=0; cell<NUMBER_OF_CELLS_PR_BANK; cell++)
			{
				if(cells_to_discharge[bank][cell])
				{
					g_enable_discharge_pins[bank][cell] = true;
				}
			}
		}

}

void disable_all_discharge()
{
	for(uint8_t bank = 0; bank<MAX_NUMBER_OF_BANKS; bank++)
	{
		for(uint8_t cell=0; cell<NUMBER_OF_CELLS_PR_BANK; cell++)
		{
			g_enable_discharge_pins[bank][cell] = false;
		}
	}
}
bool is_charge_done(uint16_t voltage_limit)
{
	bool charging_is_done= true;
	for(uint8_t bank = 0; bank<g_number_of_banks; bank++)
	{
		for(uint8_t cell=0; cell<NUMBER_OF_CELLS_PR_BANK; cell++)
		{
			if(g_cell_voltages[bank][cell] < voltage_limit )
			{
				charging_is_done = false;
			}
		}
	}
	return charging_is_done;

}


bool in_charnig_states()
{
	bool returnvalue = false;
	if(Control_states == ControlState_T_Charge_Algortihm ||
			Control_states == ControlState_T_Charging_CC ||
			Control_states == ControlState_T_Charging_CV ||
			Control_states == ControlState_T_Charging_Discharge||
			Control_states == ControlState_T_Charging_Wating_DIS ||
			Control_states == ControlState_T_Charging_closeing_AIR)
	{
		returnvalue = true;
	}
	return returnvalue;
}
void chargingTask_Task(void *arg)
{
	static bool cells_to_discharge[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELLS_PR_BANK]={false};
	OS_TICK discharge_temp_timer =0;
	OS_TICK contact_timer =0;
	OS_TICK discharge_started=0;
	OS_ERR os_err;

	while(1)
	{

	uint16_t higest_cell_voltage;
	uint8_t higest_cell_index;
	uint8_t higest_cell_bank;


	if(task_super_state == 0)
	{
		if( in_charnig_states())
		{
			charging_state = IDLE;
			task_super_state = 1;

		}
		disable_all_discharge(); // Always disable all discharge, no matter what! A big safety consern.
	}
	if(task_super_state == 1)
	{
	// if g_charger_status change from started to stop = abort
		if(!in_charnig_states())
		{

			charging_state = IDLE;
			task_super_state =0;
			set_charge_current(0);
			disable_all_discharge();
		}
	}


	if( task_super_state == 1)
	{

		if(charging_state == IDLE)
		{

			if(in_charnig_states())
			{
				g_charging_to_controller_signal =NONE_SIGNAL;
				charging_state = CHARGING_CC;
				set_charge_current(DEFAULT_CHARGE_CURRENT);
			}


		}
		if(charging_state == CHARGING_CC)
		{
			determine_higest_voltage(g_number_of_banks,28,&higest_cell_voltage,&higest_cell_bank,&higest_cell_index);

			// TODO ADD function/state that can make small charge current if voltage is very low, to protect the cells.


			if(is_charge_done(CHARGING_CC_COMPLETE_WINDOW))
			{
				charging_state = CHARGING_CV;

			}
			// If higher than charge limit, stop charging and determine if discharge is needed.
			else if(higest_cell_voltage>= CHARGING_CC_VOLTAGE_STOP_LIMIT)
			{
				set_charge_current(0);
				AIRP_Control(false);
				determine_discharge_cells(g_number_of_banks,cells_to_discharge,CHARGING_DISCHARGE_WINDOW);
				activate_discharge(g_number_of_banks,cells_to_discharge);
				charging_state = DISCHARGING;
				discharge_started = OSTimeGet(&os_err);
			}




		}
		if(charging_state == CHARGING_CV)
		{
			// Look at the current drawn

			if(g_TS_current < CHARGE_CURRENT_LOW_LIMIT)
			{
				// CHARGE COMPLETE
				//			// TODO set all SOC =100;
				g_charging_to_controller_signal = Charge_COMPLETE;
				OSTaskQPost(&Controller_Task_TCB,&g_charging_to_controller_signal,sizeof(g_charging_to_controller_signal),OS_OPT_POST_FIFO,&os_err);
				//charging_state = IDLE;
			}

		}
		if(charging_state == DISCHARGING)
		{

			OS_TICK now = OSTimeGet(&os_err);

			// Discharge until all discharging cells are = or below the window;
			bool keep_discharing = false;

			// Timer, always discharge for 1 min.

			if((now-discharge_started) < CHARGING_FORCE_DISCHARGE_TIME)
			{
				keep_discharing = true;
			}
			else
			{
				for(uint8_t bank = 0; bank<g_number_of_banks; bank++)
				{
					for(uint8_t cell=0; cell<NUMBER_OF_CELLS_PR_BANK; cell++)
					{

						if(cells_to_discharge[bank][cell] == true)
						{
							if(g_cell_voltages[bank][cell] > CHARGING_DISCHARGE_WINDOW)
							{
								keep_discharing = true;
							}
							else{ // if(g_cell_voltages[bank][cell] <= CHARGING_DISCHARGE_WINDOW)
								cells_to_discharge[bank][cell] =false;
							}

						}

					}
				}
			}

			if(g_highest_discharge_temp > CHARGING_DISCHARGE_HIGH_TEMP_LIMIT)
			{
				charging_state = WAIT_FOR_DISCHARGE_TEMP;
				discharge_temp_timer = OSTimeGet(&os_err);
				disable_all_discharge();

			}
			else if(!keep_discharing)
			{
				disable_all_discharge();
				charging_state = CLOSE_AIRP;
				contact_timer =OSTimeGet(&os_err);

			}
		}
		if(charging_state == WAIT_FOR_DISCHARGE_TEMP)
		{
			OS_TICK now = OSTimeGet(&os_err);
			if(g_highest_discharge_temp <= CHARGING_DISCHARGE_HIGH_TEMP_LIMIT)
			{
				determine_discharge_cells(g_number_of_banks,cells_to_discharge,CHARGING_DISCHARGE_WINDOW);
				activate_discharge(g_number_of_banks,cells_to_discharge);
				charging_state = DISCHARGING;
			}
			else if((now - discharge_temp_timer)>= CHARING_DISCHARGE_TEMP_TIMEOUT)
			{
				charging_state = IDLE;
				uint8_t g_monitor_error_code = 23; // DISCHARGE_TEMP_TIMEOUT
				OSTaskQPost(&CAN_TX_TCB,&g_monitor_error_code,sizeof(g_monitor_error_code),OS_OPT_POST_FIFO,&os_err);
				UCOS_Printf("Error: Discharge temp timeout");
				uint8_t command = Charge_STOP;
				OSTaskQPost(&Controller_Task_TCB,&command,sizeof(command),OS_OPT_POST_FIFO,&os_err);

			}

		}
		if(charging_state == CLOSE_AIRP)
		{
			OS_TICK now = OSTimeGet(&os_err);

			if((now-contact_timer) >=100)
			{
				AIRP_Control(true);
			}
			if((now-contact_timer)>= 1000)
			{

				if(AIRP_AUX()==0) // Open
				{
					charging_state = CHARGING_CC;
					set_charge_current(DEFAULT_CHARGE_CURRENT);
				}
				else
				{
					// Error
					UCOS_Print("Error");
					charging_state = IDLE;
					uint8_t erroid=controllerTask_translate_errorCode(E_AMS_UNABLE_TO_CLOSE_AIR_P);
					OSTaskQPost(&CAN_TX_TCB,&erroid,sizeof(erroid),OS_OPT_POST_FIFO,&os_err);
					uint8_t command = Charge_STOP;
					OSTaskQPost(&Controller_Task_TCB,&command,sizeof(command),OS_OPT_POST_FIFO,&os_err);
				}
			}
		}

	}

	OSTimeDlyHMSM(0,0,0,100,OS_OPT_TIME_HMSM_STRICT,&os_err); // delay 100 ms





	} // while




}


