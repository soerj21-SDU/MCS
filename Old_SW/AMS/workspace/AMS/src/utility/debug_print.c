/*
 * debug_print.c
 *
 *  Created on: Jun 16, 2020
 *      Author: soeren
 */



#include "debug_print.h"



void DebugPrint_CellVoltages(uint8_t number_of_banks)
{
	UCOS_Printf("**Cell voltages**");
	for (uint8_t bank = 0; bank < number_of_banks ; bank++)
	{
		for (uint8_t cell = 0; cell < NUMBER_OF_CELLS_PR_BANK; cell++)
		{
			UCOS_Printf("Bank: %d  Cell: %d   value:%d V \r\n",bank,cell,g_cell_voltages[bank][cell]);

		}
		UCOS_Printf("\r\n");
	}

}

void DebugPrint_CellTemps(uint8_t number_of_banks)
{
	UCOS_Printf("**Cell voltages**");
	for (uint8_t bank = 0; bank < number_of_banks ; bank++)
	{
		for (uint8_t device = 0; device < NUMBER_OF_CELL_TEMPS_PR_BANK; device++)
		{
			UCOS_Printf("Bank: %d  Device: %d   value:%d V \r\n",bank,device,g_cell_temps[bank][device]);

		}
		UCOS_Printf("\r\n");
	}

}
