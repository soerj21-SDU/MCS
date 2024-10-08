/*
 * BatteryTask.c
 *
 *  Created on: 6. maj 2019
 *      Author: matt
 */

#include "BatteryTask.h"

#include <stdint.h>



void BatteryTask(void *arg)
{
	OS_ERR os_err;

	struct LTC6813_status devices[10];

	// Initialize the data structure
	LTC6813_init(10, devices);

	wakeup_sleep(g_number_of_banks*2);

	// The main loop interfacing with the LTC6813s
	bool balance_enable;
	bool bal_enable[5][28];
	while (1)
	{
		uint8_t device_count = g_number_of_banks*2;

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

		for (uint8_t i = 0; i < device_count; i++)
		{
			devices[i].disc_pin++;
			devices[i].disc_pin %= 7;
		}

		wakeup_idle(device_count);

		// Enable/disable discharge circuits
		LTC6813_WRCFGA(device_count, devices);
		LTC6813_WRCFGB(device_count, devices);

		// Set up and perform I2C communication with MUX
		LTC6813_WRCOMM(device_count, devices);
		LTC6813_STCOMM(device_count, devices);

		// Perform ADC conversion on cell voltages including measuring a sum of cells
		LTC6813_ADCVSC(ADC_MODE_NORMAL);
		OS_TICK volt_ts = OSTimeGet(&os_err);

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
