/*
 * monitor_Task.c
 *
 *  Created on: Apr 8, 2020
 *      Author: soeren
 */

#include "monitor_Task.h"

OS_TICK convert_to_OS_tick(uint32_t time_in_ms);

OS_ERR create_monitor_Task()
{
	OS_ERR error;

    OSTaskCreate(&g_monitor_TCP,                      //  - RX Task.
                 "CAN RX Task",
				 Monitor_Task,
				 0,          				//argument for task. None for the moment
				 MONITOR_TASK_PRIO,
				 &monitor_task_stk[0],
				 MONITOR_TASK_STK_SIZE/10,
				 MONITOR_TASK_STK_SIZE,
				 MONITORTX_TASK_MSGQ_SIZE,
				 0,
				 DEF_NULL,
				 (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR), //stack checking and stack clearing options
				 &error);

    return error;




}

void Monitor_Task(void *arg)
{
	OS_ERR os_err;
	OS_TICK last_time_ok_voltage[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELLS_PR_BANK]={0};
	OS_TICK last_time_ok_temp[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELL_TEMPS_PR_BANK]={0};
	OS_TICK last_time_ok_discharge[MAX_NUMBER_OF_BANKS][NUMBER_OF_DISCHARGE_TEMPS_PR_BANK] ={0};
	OS_TICK now;
	bool voltage_error =false;
	bool temp_error =false;
	bool discharge_temp_error = false;

	uint16_t lowest_cell_voltage;
	uint8_t lowest_cell_voltage_index=0;
	uint8_t lowest_cell_voltage_bank_index= 0;

	int16_t highest_cell_temp= 0;
	uint8_t higest_cell_temp_index=0;
	uint8_t higest_cell_temp_bank_index= 0;

	int16_t highest_discharge_temp= 0;
	uint8_t higest_discharge_temp_index=0;
	uint8_t higest_discharge_temp_bank_index= 0;

	int16_t lowest_discharge_temp= 10000;
	uint8_t lowest_discharge_temp_index=0;
	uint8_t lowest_discharge_temp_bank_index= 0;

	UCOS_Printf("Monitor task started \r\n");

	/* TEST: USED FOR TEST OF Responsivenesss under 500ms
	 uint32_t tick_counter_50_ms = 0;
	 pl_led3(false);
	 bool pl_trigger = false;
	 */

	while(1)
	{
		//tick_counter_50_ms++; // TEST:USED FOR TEST OF RESPNOCIESNESS
		 // Suspend untill signal flag is raised.

		// TODO BANK MISMATCH

		OSMutexPend(&g_mutex_cell_voltages,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		if(os_err != OS_ERR_NONE)
		{
			UCOS_Printf("Error Monitor Task : Cell voltage MUTEX error = %d", os_err);
		}
		OSMutexPend(&g_mutex_cell_temps,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		if(os_err != OS_ERR_NONE)
		{
			UCOS_Printf("Error Monitor Task : Cell voltage MUTEX error = %d", os_err);
		}

		now = OSTimeGet(&os_err);
		lowest_cell_voltage=65000;
		highest_cell_temp= 0;
		highest_discharge_temp= 0;



		for(uint8_t bank = 0; bank<g_number_of_banks; bank++)
		{
			for(uint8_t cell=0; cell<NUMBER_OF_CELLS_PR_BANK; cell++)
			{
				// Evaluate cell voltage
				uint16_t cell_voltage = g_cell_voltages[bank][cell];

				if(cell_voltage < lowest_cell_voltage)
				{
					lowest_cell_voltage = cell_voltage;
					lowest_cell_voltage_index = cell;
					lowest_cell_voltage_bank_index = bank;
				}

				uint8_t device_number_for_voltage;
				if(cell >=14)
				{
					device_number_for_voltage = 1;
				}
				else{
					device_number_for_voltage =0;
				}

				if( cell_voltage < MIN_CELL_VOLTAGE || cell_voltage > MAX_CELL_VOLTAGE  || g_slaveboard_L6813_PEC_error[bank][device_number_for_voltage]==true ) // && NO ERROR
				{
					//UCOS_Printf("Monitor WARN under/over limit or com error: bank: %d, cell %d, voltage: %d mV, PEC: %d, now: %d, last ok: %d \r\n",bank,cell,g_cell_voltages[bank][cell],g_slaveboard_L6813_PEC_error[bank][device_number_for_voltage],now, last_time_ok_voltage[bank][cell]);
				}
				else
				{
					last_time_ok_voltage[bank][cell] = g_sample_time_cell_voltages[bank][cell]; // Refresh time
				}
				// Error Sending/ Handling.
				if(((now+MONITOR_LOOP_TIME)-last_time_ok_voltage[bank][cell]) >= MAX_MONITOR_VOLTAGE_TIME)
				{
					if(g_slaveboard_L6813_PEC_error[bank][device_number_for_voltage]==true)
					{
						UCOS_Printf("No CELL COM : Bank %d, device %d \n\r",bank,device_number_for_voltage);
					}
					else{
					UCOS_Printf("Monitor CELL Voltage Error ! Bank :%d cell: %d value: %d mV,  now with loop: %d now: %d tick last time ok: %d tick  diff: %d time with looptime: %d ms   \n\r",bank,cell,g_cell_voltages[bank][cell],(now+MONITOR_LOOP_TIME),now,last_time_ok_voltage[bank][cell],(now-last_time_ok_voltage[bank][cell]),((now+MONITOR_LOOP_TIME)-last_time_ok_voltage[bank][cell]));
					}
					voltage_error=true;
				}

			}
			g_lowest_cell_voltage = lowest_cell_voltage;

			if(voltage_error)
			{
				AMS_SC(true);
				voltage_error=false;
				g_monitor_error_code= 22;
				OSTaskQPost(&CAN_TX_TCB,&g_monitor_error_code,sizeof(g_monitor_error_code),OS_OPT_POST_FIFO,&os_err);

			}

			// Cell temps
			for(uint8_t cell_temp_i=0; cell_temp_i<NUMBER_OF_CELL_TEMPS_PR_BANK; cell_temp_i++)
			{
				int16_t cell_temp = g_cell_temps[bank][cell_temp_i];

				if(cell_temp > highest_cell_temp)
				{
					highest_cell_temp = cell_temp;
					higest_cell_temp_index= cell_temp_i;
					higest_cell_temp_bank_index = bank;
				}

				uint8_t device_select =0;
				if(cell_temp_i>=10)
				{
					device_select =1;
				}
				if( cell_temp < MIN_CELL_TEMP || cell_temp > MAX_CELL_TEMP || g_slaveboard_L6813_PEC_error[bank][device_select]==true)
				{
					//  UCOS_Printf("Monitor  TEMP WARN under/over limit or com error: bank: %d, cell %d, temp : %d C now: %d, last ok: %d \r\n",bank,cell_temp_i,g_cell_temps[bank][cell_temp_i]/10,now, last_time_ok_temp[bank][cell_temp_i]);
				}
				else
				{
					last_time_ok_temp[bank][cell_temp_i] = g_sample_time_cell_temps[bank][cell_temp_i]; // Refresh time
				}

				if(((now+MONITOR_LOOP_TIME)-last_time_ok_temp[bank][cell_temp_i]) >= MAX_MONITOR_TEMP_TIME)
				{
					temp_error = true;
					if(g_slaveboard_L6813_PEC_error[bank][device_select]==true)
					{
						UCOS_Printf("No CELL COM : Bank %d, device %d \n\r",bank,device_select);
					}
					else{
					UCOS_Printf("Monitor TEMP error! Bank :%d cell: %d  now with loop: %d now: %d tick last time ok: %d tick  diff: %d time with looptime: %d ms  temp: %d   \n\r",bank,cell_temp_i,(now+MONITOR_LOOP_TIME),now,last_time_ok_temp[bank][cell_temp_i],(now-last_time_ok_temp[bank][cell_temp_i]),((now+MONITOR_LOOP_TIME)-last_time_ok_temp[bank][cell_temp_i]),g_cell_temps[bank][cell_temp_i]);
					}
				}

			}
			g_higest_cell_temperature = highest_cell_temp;
			if(temp_error)
			{
				temp_error=false;
				AMS_SC(true); // AMS ERROR
				g_monitor_error_code= 22;
				OSTaskQPost(&CAN_TX_TCB,
						&g_monitor_error_code,
						sizeof(g_monitor_error_code),
						OS_OPT_POST_FIFO,
						&os_err);


			}

			// DISCHARGE temps

			for(uint8_t i_discharge_temp=0;i_discharge_temp<NUMBER_OF_DISCHARGE_TEMPS_PR_BANK; i_discharge_temp++)
			{
				int16_t discharge_temp = g_cell_discharge_temps[bank][i_discharge_temp];

				if(discharge_temp > highest_discharge_temp)
				{
					highest_discharge_temp = discharge_temp;
					higest_discharge_temp_index= i_discharge_temp;
					higest_discharge_temp_bank_index = bank;
				}
				if(discharge_temp < lowest_discharge_temp)
				{
					lowest_discharge_temp = discharge_temp;
					lowest_discharge_temp_index = i_discharge_temp;
					lowest_discharge_temp_bank_index = bank;
				}
				uint8_t device_select =0;
				if(i_discharge_temp >= 7) // number of discharge_temp_per_device
				{
					device_select = 1;
				}

				if(discharge_temp < MIN_DISCHARGE_TEMP || discharge_temp > MAX_DISCHARGE_TEMP || g_slaveboard_L6813_PEC_error[bank][device_select]==true)
				{
					//UCOS_Printf("Monitor  DISCHARGE TEMP WARN under/over limit or com error: bank: %d, cell %d, temp : %d C now: %d, last ok: %d \r\n",bank,i_discharge_temp,g_cell_discharge_temps[bank][i_discharge_temp]/10,now, last_time_ok_discharge[bank][i_discharge_temp]);
				}
				else
				{
					last_time_ok_discharge[bank][i_discharge_temp] = g_sample_time_cell_discharge_temps[bank][i_discharge_temp]; // Refresh time
				}

				if(((now+MONITOR_LOOP_TIME)-last_time_ok_discharge[bank][i_discharge_temp]) >= MAX_MONITOR_DISCHARGE_TEMP_TIME)
				{
					discharge_temp_error = true;
					if(g_slaveboard_L6813_PEC_error[bank][device_select]==true)
					{
						UCOS_Printf("No CELL COM : Bank %d, device %d \n\r",bank,device_select);
					}
					else{
					UCOS_Printf("Monitor DISCHARGE TEMP error! Bank :%d cell: %d  now with loop: %d now: %d tick last time ok: %d tick  diff: %d time with looptime: %d ms  temp: %d   \n\r",bank,i_discharge_temp,(now+MONITOR_LOOP_TIME),now,last_time_ok_discharge[bank][i_discharge_temp],(now-last_time_ok_discharge[bank][i_discharge_temp]),((now+MONITOR_LOOP_TIME)-last_time_ok_discharge[bank][i_discharge_temp]),g_cell_temps[bank][i_discharge_temp]);
					}
				}
			}
			g_highest_discharge_temp = highest_discharge_temp;
			g_lowest_discharge_temp = lowest_discharge_temp;

			if(discharge_temp_error)
			{
				discharge_temp_error=false;
				AMS_SC(true);
				g_monitor_error_code= 22;
				OSTaskQPost(&CAN_TX_TCB,
						&g_monitor_error_code,
						sizeof(g_monitor_error_code),
						OS_OPT_POST_FIFO,
						&os_err);


			}


		}
		OSMutexPost(&g_mutex_cell_voltages,OS_OPT_POST_NONE,&os_err);
		OSMutexPost(&g_mutex_cell_temps,OS_OPT_POST_NONE,&os_err);

		OSTimeDlyHMSM(0,0,0,MONITOR_LOOP_TIME,OS_OPT_TIME_PERIODIC,&os_err);
	}

}

OS_TICK convert_to_OS_tick(uint32_t time_in_ms)
{
	uint32_t tick_time = (1/OS_CFG_TICK_RATE_HZ)*1000;

	return tick_time*time_in_ms;
}


/*******DEBUG CODE********/

/*
 *  TEST: USED TO TEST RESPONSIVENESS UNDER 500ms
if(tick_counter_50_ms > 20*3 && tick_counter_50_ms <20*6)
{
	g_cell_voltages[0][2]=2000;
	if(!pl_trigger)
	{
		pl_led3(true);
		pl_trigger = true;
		UCOS_Printf("error_on %d \n\r",now);
	}

}
if(tick_counter_50_ms >20*6)
{
	g_cell_voltages[0][2]=40000;
	tick_counter_50_ms = 0;
	pl_trigger= false;
}

// OTHER STUFF
 *
// UCOS_Printf("Monitor info: bank:%d  Cell: %d   now: %d tick last time ok: %d tick  diff: %d \n\r",bank,cell,now,last_time_ok_voltage[bank][cell],(now-last_time_ok_voltage[bank][cell]));
*/

