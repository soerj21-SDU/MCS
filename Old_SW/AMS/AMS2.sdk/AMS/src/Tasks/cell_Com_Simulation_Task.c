/*
 * cell_Com_Simulation_Task.c
 *
 *  Created on: Apr 8, 2020
 *      Author: soeren
 */

#include "cell_Com_Simulation_Task.h"

#include <stdlib.h>
#include <stdio.h>
#include "lib_math.h"


OS_ERR cellComSim_CreateTask()
{
	OS_ERR error;

    OSTaskCreate(&g_cell_com_simulation_TCP,                      //  - Cell com Simulation Task.
                 "Cell_COM Simulation Task",
				 CellComSim_Task,
				 0,          				//argument for task. None for the moment
				 CELL_COM_SIMULATION_TASK_PRIO,
				 &cell_com_simulation_task_stk[0],
				 CELL_COM_SIMULATION_TASK_STK_SIZE/10,
				 CELL_COM_SIMULATION_TASK_STK_SIZE,
				 CELL_COM_SIMULATION_TASK_MSGQ_SIZE,
				 0,
				 DEF_NULL,
				 (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR), //stack checking and stack clearing options
				 &error);

    return error;

}
void CellComSim_Task(void *arg)
{
	OS_ERR os_err;
	Math_Init();
	uint32_t tick_counter_50_ms = 0;
	pl_led3(false);
	bool pl_trigger = false;
	while(1)
	{

		g_CAN_TX_Alive_Counter++;
		tick_counter_50_ms++;

		uint16_t random_16;

		//extern uint16_t g_cell_voltages[5][28];

		/*
		uint8_t number_of_banks=5;
		uint8_t cell_pr_bank=28;
		for(uint8_t i = 0; i <number_of_banks ; i++)
		{
			for(uint8_t j = 0; j <cell_pr_bank ; j++)
			{
				random_16= ((uint16_t) Math_Rand() &65000);
			g_cell_voltages[i][j]=random_16;
			}
		}
		*/

		OSMutexPend(&g_mutex_cell_voltages,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		if(os_err != OS_ERR_NONE)
		{
			UCOS_Printf("Error Cell simulation Task : Cell voltage MUTEX error = %d", os_err);
		}
		OSMutexPend(&g_mutex_cell_temps,0,OS_OPT_PEND_BLOCKING,0,&os_err);
			if(os_err != OS_ERR_NONE)
			{
				UCOS_Printf("Error Cell simulation Task : Cell temp MUTEX error = %d", os_err);
			}

		// Fixed values
		OS_TICK sample_time_voltage = OSTimeGet(&os_err);
		OS_TICK sample_time_temp =  OSTimeGet(&os_err);
		OS_TICK sample_time_discharge = OSTimeGet(&os_err);
		for(uint8_t bank=0;bank <=4;bank++)
		{
			for(uint8_t cell=0; cell<28; cell++)
			{
				g_cell_voltages[bank][cell]=35000;
				g_sample_time_cell_voltages[bank][cell] = sample_time_voltage;
			}
		}


		if(g_debug_byte_8 == 1) // One cell reach
		{
			g_cell_voltages[0][2]= 40001;

		}
		if(g_debug_byte_8 == 2 )
		{
			g_cell_voltages[0][2] = 34500;
		}
		if(g_debug_byte_8 == 3)
		{
			for(uint8_t bank=0;bank <=4;bank++)
			{
				for(uint8_t cell=0; cell<28; cell++)
				{
					g_cell_voltages[bank][cell]=39500;
					g_sample_time_cell_voltages[bank][cell] = sample_time_voltage;
				}
			}
			g_TS_current = 110;
		}
		if(g_debug_byte_8 ==4)
		{
			g_TS_current = 90;
		}
		if(g_debug_byte_8 == 5)
		{
			uint16_t inside_discharge_window = 38500;
			g_cell_voltages[0][1] = inside_discharge_window;
			g_cell_voltages[0][3] = inside_discharge_window;
			g_cell_voltages[0][6] = inside_discharge_window;
			g_cell_voltages[0][27] = 40001;
		}



		if(g_debug_byte_7 >0)
		{
			//uint16_t current = ( g_debug_byte_7 << 2) | 3;

			double bit_resolution = 8.5;
			uint16_t dac_value = (uint16_t) (((double) g_debug_byte_7)*((double) bit_resolution));
			UCOS_Printf("Sim: current: %d A dac value: %d, g_current: %d A \n\r",g_debug_byte_7,dac_value,g_charge_current);
			dac_write(dac_value);

			//g_charge_current = 10;
		}

		if(g_debug_byte_8 == 10)
		{
			g_cell_voltages[0][1]= 42000;
		}


		// Fixed values end

		/*

		if(tick_counter_50_ms > 20*3 && tick_counter_50_ms <20*6)
		{
			g_cell_voltages[0][2]=2000;
			if(!pl_trigger)
			{
				pl_led3(true);
				pl_trigger = true;
			}

		}
		if(tick_counter_50_ms >20*6)
		{
			tick_counter_50_ms = 0;
			pl_trigger= false;
		}
		*/



		// Temp
		for(uint8_t bank=0;bank <=4;bank++)
		{
			for(uint8_t cell_temp=0; cell_temp<10; cell_temp++)
			{
				g_cell_temps[bank][cell_temp]=250;
				g_sample_time_cell_temps[bank][cell_temp] = sample_time_temp;
			}
		}
		/*
		if(tick_counter_50_ms > 20*5 && tick_counter_50_ms <45*5)
		{
			g_cell_temps[0][5] = 550;
			//g_sample_time_cell_temps[0][5] = sample_time_temp;
		}
		*/

		// DISCHARGE
		for(uint8_t bank=0;bank <=4;bank++)
		{
			for(uint8_t discharge_temp=0; discharge_temp<NUMBER_OF_DISCHARGE_TEMPS_PR_BANK; discharge_temp++)
			{
				g_cell_discharge_temps[bank][discharge_temp]=100;
				g_sample_time_cell_discharge_temps[bank][discharge_temp] = sample_time_discharge;
			}
		}

		if(g_debug_byte_5 > 0)
		{
			for(uint8_t bank=0;bank <=4;bank++)
			{
				for(uint8_t discharge_temp=0; discharge_temp<NUMBER_OF_DISCHARGE_TEMPS_PR_BANK; discharge_temp++)
				{
					g_cell_discharge_temps[bank][discharge_temp]=1000;
					g_sample_time_cell_discharge_temps[bank][discharge_temp] = sample_time_discharge;
				}
			}
		}

		if(g_debug_byte_8 == 6) //
		{
			g_cell_voltages[0][2]= 40001;
			g_cell_discharge_temps[0][2]=650;


		}
		/*
		if(tick_counter_50_ms > 20*5 && tick_counter_50_ms <45*5)
		{
			g_cell_discharge_temps[0][10] = 800;
			//g_sample_time_cell_temps[0][5] = sample_time_temp;
		}
		*/

		//g_higest_cell_temperature = (uint8_t) Math_Rand();
		//g_lowest_cell_voltage = ((uint16_t) Math_Rand() &511);
		g_SOC =(((uint8_t) Math_Rand())>>1);

		OSMutexPost(&g_mutex_cell_voltages,OS_OPT_POST_NONE,&os_err);
		OSMutexPost(&g_mutex_cell_temps,OS_OPT_POST_NONE,&os_err);

		OSTimeDlyHMSM(0,0,0,50,OS_OPT_TIME_HMSM_STRICT,&os_err); // delay 50ms

	}
}


