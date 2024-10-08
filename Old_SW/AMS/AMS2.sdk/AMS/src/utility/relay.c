/*
 * relay.c
 *
 *  Created on: 6. maj 2019
 *      Author: matt
 */

#include "relay.h"

#include "xparameters.h"
#include "xgpio.h"
#include "xil_printf.h"

XGpio relay_gpio;

uint8_t relay_output = 0; // Should be static ( SDL)
uint8_t relay_input = 0; // Sojuld be static(SDL)

void relay_init()
{
	int status = XGpio_Initialize(&relay_gpio, XPAR_RELAY_DEVICE_ID);

	XGpio_SetDataDirection(&relay_gpio, 1, 0);
	XGpio_SetDataDirection(&relay_gpio, 2, 1);

	if (status != XST_SUCCESS)
	{
		xil_printf("Failed to setup Relay GPIOs\r\n");
	}
}

void relay_write()
{
	XGpio_DiscreteWrite(&relay_gpio, 1, relay_output);
}

void relay_read()
{
	relay_input = XGpio_DiscreteRead(&relay_gpio, 2);
}

bool Precharge_AUX()
{
	relay_read();
	return relay_input & (1 << 0);
}

bool AIRP_AUX()
{
	relay_read();
	return relay_input & (1 << 1);
}

bool AIRM_AUX()
{
	relay_read();
	return relay_input & (1 << 2);
}

bool TS_Indicator()
{
	relay_read();
	return relay_input & (1 << 3);
}

bool TSAL_Acc_TS_On()
{
	relay_read();
	return relay_input & (1 << 4);
}

bool TSAL_Relay_Detection()
{
	relay_read();
	return relay_input & (1 << 5);
}
uint8_t get_relay_out()
{
	return relay_output;
}

void Precharge_Control(bool precharge)
{
	relay_output &= ~(1 << 0);
	relay_output += ((precharge != 0) << 0);
	relay_write();
}

void AIRP_Control(bool airp)
{
	relay_output &= ~(1 << 1);
	relay_output += ((airp != 0) << 1);
	relay_write();
}

void AIRM_Control(bool airm)
{
	relay_output &= ~(1 << 2);
	relay_output += ((airm != 0) << 2);
	relay_write();
}
