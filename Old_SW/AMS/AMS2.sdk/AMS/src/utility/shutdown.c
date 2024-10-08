/*
 * shutdown.c
 *
 *  Created on: 8. maj 2019
 *      Author: matt
 */

#include "shutdown.h"

#include "xparameters.h"
#include "xgpio.h"
#include "xil_printf.h"

XGpio shutdown_gpio;

uint8_t shutdown_output = 0;
uint16_t shutdown_input = 0;

void shutdown_init()
{
	int status = XGpio_Initialize(&shutdown_gpio, XPAR_SHUTDOWN_DEVICE_ID);

	XGpio_SetDataDirection(&shutdown_gpio, 1, 0);
	XGpio_SetDataDirection(&shutdown_gpio, 2, 1);

	if (status != XST_SUCCESS)
	{
		xil_printf("Failed to setup Shutdown GPIOs\r\n");
	}
}

void shutdown_write()
{
	XGpio_DiscreteWrite(&shutdown_gpio, 1, shutdown_output);
}

void shutdown_read()
{
	shutdown_input = XGpio_DiscreteRead(&shutdown_gpio, 2);
}

bool IMD_Status()
{
	shutdown_read();
	return shutdown_input & (1 << 0);
}

bool IMD_Latched()
{
	shutdown_read();
	return shutdown_input & (1 << 1);
}

bool IMD_Data()
{
	shutdown_read();
	return shutdown_input & (1 << 2);
}

bool AMS_Latched()
{
	shutdown_read();
	return shutdown_input & (1 << 3);
}

bool SC_IN()
{
	shutdown_read();
	return shutdown_input & (1 << 4);
}

bool SC_HVDC_IL()
{
	shutdown_read();
	return shutdown_input & (1 << 5);
}

bool SC_IN_Again()
{
	shutdown_read();
	return shutdown_input & (1 << 6);
}

bool SC_END()
{
	shutdown_read();
	return shutdown_input & (1 << 7);
}

bool Latch_Reset()
{
	shutdown_read();
	return shutdown_input & (1 << 8);
}

void AMS_SC(bool ams_sc)
{
	shutdown_output &= ~(1 << 0);
	shutdown_output += ((ams_sc != 0) << 0);
	shutdown_write();
}
void EN_SC(bool en_sc)
{
	shutdown_output &= ~(1 << 1);
	shutdown_output += ((en_sc != 0) << 1);
	shutdown_write();
}
