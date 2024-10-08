/*
 * cell_Com_Task.c
 *
 *  Created on: Apr 8, 2020
 *      Author: soeren
 */


#include "cell_Com_Task.h"

static struct LTC6813_status devices[10];

OS_ERR cellCom_CreateTask()
{
	OS_ERR error;

    OSTaskCreate(&g_cell_com_TCP,                      //  - RX Task.
                 "CAN RX Task",
				 CellCom_Task,
				 0,          				//argument for task. None for the moment
				 CELL_COM_TASK_PRIO,
				 &cell_com_task_stk[0],
				 CELL_COM_TASK_STK_SIZE/10,
				 CELL_COM_TASK_STK_SIZE,
				 CELL_COM_TASK_MSGQ_SIZE,
				 0,
				 DEF_NULL,
				 (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR), //stack checking and stack clearing options
				 &error);

    return error;
}

void set_disc_active_pins(bool discharge_pins[MAX_NUMBER_OF_BANKS][NUMBER_OF_CELLS_PR_BANK])
{
	for (uint8_t i = 0; i < g_number_of_banks; i++)
	{
		for (uint8_t j = 0; j < 14; j++)
		{
				devices[2*i  ].disc_active[j] = discharge_pins[i][j];
				devices[2*i+1].disc_active[j] = discharge_pins[i][j+14];
		}
	}
}

void CellCom_Task(void *arg)
{
	OS_ERR os_err;
	UCOS_Printf("Cell control task started \r\n");

	// Initialize the data structure
	LTC6813_init(10, devices);

	// TODO Make bank_count check!
	wakeup_sleep(g_number_of_banks*2);

	// The main loop interfacing with the LTC6813s
	bool balance_enable;
	bool bal_enable[5][28];
	while (1)
	{
		// TODO Make bank_count check!
		uint8_t device_count = g_number_of_banks*2;

		/*
		balance_enable = false;
		for (uint8_t i = 0; i < g_number_of_banks; i++)
		{
			for (uint8_t j = 0; j < 14; j++)
			{
				balance_enable = false;
				if (balance_enable)
					devices[2*i  ].disc_active[j] = bal_enable[i][j];
				else
					devices[2*i  ].disc_active[j] = false;

				balance_enable = false;
				if (balance_enable)
					devices[2*i+1].disc_active[j] = bal_enable[i][j+14];
				else
					devices[2*i+1].disc_active[j] = false;
			}
		}
		*/


		// activate discharge pins:
		for(uint8_t bank = 0; bank<g_number_of_banks; bank++)
		{
			for(uint8_t k=0; k<DEVICES_PR_BANK;k++)
			{
				for(uint8_t cell=0; cell<14; cell++)
				{
					devices[bank*DEVICES_PR_BANK+k].disc_active[cell]=g_enable_discharge_pins[bank][14*k+cell];
					//devices[bank*DEVICES_PR_BANK+k].disc_active[cell] = true;

				}
			}
		}


		/*
		devices[0*DEVICES_PR_BANK+0].disc_active[0] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[1] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[2] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[3] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[4] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[5] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[6] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[7] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[8] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[9] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[10] = true;

		devices[0*DEVICES_PR_BANK+0].disc_active[11] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[12] = true;
		devices[0*DEVICES_PR_BANK+0].disc_active[13] = true;

		*/


		// 12 dOES NOT WOKR ON DEVICE 0

		// 23, 25 Device 1

		/*

		devices[0*DEVICES_PR_BANK+1].disc_active[0] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[1] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[2] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[3] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[4] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[5] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[6] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[7] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[8] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[9] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[10] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[11] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[12] = true;
		devices[0*DEVICES_PR_BANK+1].disc_active[13] = true;

		*/

		for (uint8_t i = 0; i < device_count; i++)
		{
			devices[i].disc_pin++;
			devices[i].disc_pin %= 7;
		}

		// Clear PEC errors for each device
		devices[0*DEVICES_PR_BANK+0].PEC_error = false;
		devices[0*DEVICES_PR_BANK+1].PEC_error = false;

		uint8_t clear_check_ok = true;

#if LTC6813_CLEAR_CHECK == 1
		wakeup_idle(device_count);

		// Clear cell voltage, auxiliary and status registers
		LTC6813_CLRCELL(device_count, devices);
		LTC6813_CLRAUX(device_count, devices);
		LTC6813_CLRSTAT(device_count, devices);

		// Read the registers
		LTC6813_RDSTATA(device_count, devices);
		LTC6813_RDCVA(device_count, devices);
		LTC6813_RDAUXA(device_count, devices);

		// Check the registers are empty
		for (uint8_t i = 0; i < device_count; i++)
		{
			if (devices[i].CVRGA[0] != 0xFF)
			{
				// Failed to clear cell voltage registers for device i
				clear_check_ok = false;
			}

			if (devices[i].AURAG[0] != 0xFF)
			{
				// Failed to clear auxiliary registers for device i
				clear_check_ok = false;
			}

			if (devices[i].STATA[0] != 0xFF)
			{
				// Failed to clear status registers for device i
				clear_check_ok = false;
			}
		}

		if (clear_check_ok)
		{
			g_clear_check_success_count++;
		}
		else
		{
			g_clear_check_fail_count++;
		}
#endif

		// if (clear_check_ok) {...} can be used to only do the rest if clear check succeeds

		wakeup_idle(device_count);

		// Enable/disable discharge circuits
		LTC6813_WRCFGA(device_count, devices);
		LTC6813_WRCFGB(device_count, devices);

		// Set up and perform I2C communication with MUX
		LTC6813_WRCOMM(device_count, devices);
		LTC6813_STCOMM(device_count, devices);

		// Perform ADC conversion on cell voltages including measuring a sum of cells
		LTC6813_ADCVSC(ADC_MODE_NORMAL);
		OS_TICK sample_time_voltage = OSTimeGet(&os_err);

		// Waiting for conversion to finish
		usleep(7000);

		// The LTC6813 goes into idle state with above delay
		wakeup_idle(device_count);

		// Perform ADC conversion on the GPIO voltages
		LTC6813_ADAX(ADC_MODE_NORMAL, ALL_GPIOS);
		OS_TICK temp_ts = OSTimeGet(&os_err);

		// Waiting for conversion to finish
		usleep(7000);

		// The LTC6813 goes into idle state with above delay
		wakeup_idle(device_count);

		// Read sum of cells
		LTC6813_RDSTATA(device_count, devices);

		// Read cell voltages
		LTC6813_RDCVA(device_count, devices);
		LTC6813_RDCVB(device_count, devices);
		LTC6813_RDCVC(device_count, devices);
		LTC6813_RDCVD(device_count, devices);
		LTC6813_RDCVE(device_count, devices);

		// Read cell temperatures and active discharge resistor temperature
		LTC6813_RDAUXA(device_count, devices);
		LTC6813_RDAUXB(device_count, devices);
		LTC6813_RDAUXC(device_count, devices);


		// Insert values into global variables

		OSMutexPend(&g_mutex_cell_voltages,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		if(os_err != OS_ERR_NONE)
			{
				UCOS_Printf("Error Cell com: Cell voltage MUTEX error = %d", os_err);
			}
		OSMutexPend(&g_mutex_cell_temps,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		if(os_err != OS_ERR_NONE)
			{
				UCOS_Printf("Error Cell com: Cell Temp MUTEX error = %d", os_err);
			}

		//Set voltage to global variable.
		//UCOS_Printf("\E[H\E[J");
		for(uint8_t i=0; i<g_number_of_banks;i++)
		{
			for(uint8_t k=0; k<DEVICES_PR_BANK;k++)
			{

				g_slaveboard_L6813_PEC_error[i][k] =devices[i*DEVICES_PR_BANK+k].PEC_error;

			//	UCOS_Printf("***Cell Voltages *** \r\n ");
				for(uint8_t  j=0; j<CELLS_PER_DEVICE; j++)
				{
					g_cell_voltages[i][j+k*CELLS_PER_DEVICE] = (devices[i*DEVICES_PR_BANK+k].cell_volt[j]*1000)/100; // TODO Change the LTC6813 lib so it does not make it to mV, or change the output to mV.

					g_sample_time_cell_voltages[i][j+k*CELLS_PER_DEVICE] = sample_time_voltage;
					// PRINT VALUE
					//uint16_t temp_volt =g_cell_voltages[i][j+k*CELLS_PER_DEVICE];
					//UCOS_Printf(" CellCOM Volt Bank : %d Cell %d :  %d \r\n",i,(j+k*CELLS_PER_DEVICE),temp_volt);


					/*
					// DEBUG
					//UCOS_Printf("Global input overview \r\n");
					//uint8_t temp = (j+k*CELLS_PER_DEVICE);
					//uint8_t temp1 = (i*DEVICES_PR_BANK+k);
					uint16_t temp_value = g_cell_voltages[i][j+k*CELLS_PER_DEVICE];
				//	uint16_t temp_value = 43;
					UCOS_Printf("Bank: %d  Cell: %d   value:%d",i,j+k*CELLS_PER_DEVICE,temp_value);
					UCOS_Printf("\r\n");

					*/
					//xil_printf("\E[H\E[J"); // Reset terminal
				}

				//UCOS_Printf("***Cell temperatures*** \r\n ");
				for(uint8_t  j=0; j<CELL_TEMP_PER_DEVICE; j++)
				{
					g_cell_temps[i][j+k*CELL_TEMP_PER_DEVICE] = devices[i*DEVICES_PR_BANK+k].cell_temp[j];
					g_sample_time_cell_temps[i][j+k*CELL_TEMP_PER_DEVICE]=sample_time_voltage;

					/*
					// DEBUG
					//UCOS_Printf("Global input overview \r\n");
					//uint8_t temp = (j+k*CELL_TEMP_PER_DEVICE);
					//uint8_t temp1 = (i*DEVICES_PR_BANK+k);
					uint16_t temp_value = g_cell_temps[i][j+k*CELL_TEMP_PER_DEVICE];
				//	uint16_t temp_value = 43;
					UCOS_Printf("Bank: %d  device: %d   value:%d C",i,j+k*CELL_TEMP_PER_DEVICE,temp_value);
					UCOS_Printf("\r\n");

					*/

				}

				//UCOS_Printf("***Discharge temperatures***  \r\n ");
				for(uint8_t j =0; j<  DISCHARGE_TEMP_PER_DEVICE ; j++)
				{
					g_cell_discharge_temps[i][j+k*DISCHARGE_TEMP_PER_DEVICE] = devices[i*DEVICES_PR_BANK+k].disc_temp[j];
					g_sample_time_cell_discharge_temps[i][j+k*DISCHARGE_TEMP_PER_DEVICE] =sample_time_voltage;


					/*
					// DEBUG
								//UCOS_Printf("Global input overview \r\n");
								//uint8_t temp = (j+k*DISCHARGE_TEMP_PER_DEVICE);
								//uint8_t temp1 = (i*DEVICES_PR_BANK+k);
								uint16_t temp_value = g_cell_discharge_temps[i][j+k*DISCHARGE_TEMP_PER_DEVICE];
							//	uint16_t temp_value = 43;
								UCOS_Printf("Bank: %d  device: %d   value:%d C",i,j+k*DISCHARGE_TEMP_PER_DEVICE,temp_value);
								UCOS_Printf("\r\n");

								*/
					//uint16_t temp_discharge =g_cell_discharge_temps[i][j+k*DISCHARGE_TEMP_PER_DEVICE];
					/*
					//g_cell_discharge_temps[i][j+k*DISCHARGE_TEMP_PER_DEVICE]=100;
					//UCOS_Printf("Test \r\n");
					//UCOS_Printf("CellCOM DISCHARGE Bank : %d Cell %d : device select : %d  \r\n",i,(j+k*DISCHARGE_TEMP_PER_DEVICE),i*DEVICES_PR_BANK+k);
					*/

				}
			}
		}

		//OSTaskResume(&g_cell_com_TCP,&os_err);

			//uint16_t current = ( g_debug_byte_7 << 2) | 3;


		OSMutexPost(&g_mutex_cell_voltages,OS_OPT_POST_NONE,&os_err);
		OSMutexPost(&g_mutex_cell_temps,OS_OPT_POST_NONE,&os_err);

		OSTimeDlyHMSM(0,0,0,50,OS_OPT_TIME_PERIODIC,&os_err); // delay 50 sec

		/*

		// Update the shared data
		sum_of_all_cells = 0;
		for (uint8_t i = 0; i < g_number_of_banks; i++)
		{

			OSMutexPend(&Voltage_Mutex,
					  0,
					  OS_OPT_PEND_BLOCKING,
					  0,
					  &os_err);
			if(os_err != OS_ERR_NONE)
			{
				xil_printf("os_err = %d\r\n", os_err);
				xil_printf("BatteryTask take voltage mutex error\r\n");
			}

			for (uint8_t j = 0; j < CELLS_PER_DEVICE; j++)
			{
				cell_volt[i][j] = devices[i*2].cell_volt[j];
				if (cell_volt[i][j] > VOLT_MIN && cell_volt[i][j] < VOLT_MAX && !devices[2*i].PEC_error)
					cell_volt_ts[i][j] = volt_ts;

				cell_volt[i][j+14] = devices[i*2+1].cell_volt[j];
				if (cell_volt[i][j+14] > VOLT_MIN && cell_volt[i][j+14] < VOLT_MAX && !devices[2*i+1].PEC_error)
					cell_volt_ts[i][j+14] = volt_ts;
			}

			OSMutexPost(&Voltage_Mutex,
					  OS_OPT_PEND_BLOCKING,
					  &os_err);
			if(os_err != OS_ERR_NONE)
				xil_printf("BatteryTask give voltage mutex error\r\n");

			OSMutexPend(&Temperature_Mutex,
					  0,
					  OS_OPT_PEND_BLOCKING,
					  0,
					  &os_err);
			if(os_err != OS_ERR_NONE)
				xil_printf("BatteryTask take temperature mutex Error\r\n");

			for (uint8_t j = 0; j < CELL_TEMP_PER_DEVICE; j++)
			{
				cell_temp[i][j] = devices[i*2].cell_temp[j];
				if (cell_temp[i][j] > TEMP_MIN && cell_temp[i][j] < TEMP_MAX && !devices[2*i].PEC_error)
					cell_temp_ts[i][j] = temp_ts;
				if (cell_temp[i][j] > TEMP_MIN && cell_temp[i][j] < TEMP_CHARGE_MAX && !devices[2*i].PEC_error)
					cell_charge_temp_ts[i][j] = temp_ts;

				cell_temp[i][j+5] = devices[i*2+1].cell_temp[j];
				if (cell_temp[i][j+5] > TEMP_MIN && cell_temp[i][j+5] < TEMP_MAX && !devices[2*i+1].PEC_error)
					cell_temp_ts[i][j+5] = temp_ts;
				if (cell_temp[i][j+5] > TEMP_MIN && cell_temp[i][j+5] < TEMP_CHARGE_MAX && !devices[2*i+1].PEC_error)
					cell_charge_temp_ts[i][j+5] = temp_ts;
			}

			for (uint8_t j = 0; j < DISCHARGE_TEMP_PER_DEVICE; j++)
			{
				bal_temp[i][j  ] = devices[i*2  ].disc_temp[j];
				bal_temp[i][j+7] = devices[i*2+1].disc_temp[j];
			}

			cell_bank_volt[i] = devices[i*2].sum_of_cells+devices[i*2+1].sum_of_cells;
			sum_of_all_cells += cell_bank_volt[i];

			OSMutexPost(&Temperature_Mutex,
					  OS_OPT_PEND_BLOCKING,
					  &os_err);
			if(os_err != OS_ERR_NONE)
				xil_printf("BatteryTask give temperature mutex error\r\n");
		}

		OSMutexPend(&Controlvariable_Mutex,
				  0,
				  OS_OPT_PEND_BLOCKING,
				  0,
				  &os_err);
		if(os_err != OS_ERR_NONE)
			xil_printf("BatteryTask take controlvariable mutex Error\r\n");

		any_LTC6813_error = false;

		for (uint8_t i = 0; i < device_count; i++)
		{
			LTC6813_error[i] = devices[i].PEC_error;
			any_LTC6813_error |= devices[i].PEC_error;
			devices[i].PEC_error = false;
		}

		OSMutexPost(&Controlvariable_Mutex,
				  OS_OPT_PEND_BLOCKING,
				  &os_err);
		if(os_err != OS_ERR_NONE)
			xil_printf("BatteryTask give controlvariable mutex error\r\n");

		*/

		OSTimeDly(BATTERYTASK_LOOP_TIME_TICKS,
				  OS_OPT_TIME_PERIODIC,
				  &os_err);
		if(os_err != OS_ERR_NONE)
			xil_printf("BatteryTask delay error\r\n");
	}
}
