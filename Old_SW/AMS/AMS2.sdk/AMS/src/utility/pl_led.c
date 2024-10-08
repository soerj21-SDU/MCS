/*
 * pl_led.c
 *
 *  Created on: 6. maj 2019
 *      Author: matt
 */

#include "pl_led.h"

#include "xparameters.h"
#include "xgpio.h"
#include "xil_printf.h"

XGpio gpio;

uint8_t pl_leds = 0;

void pl_led_write()
{
	XGpio_DiscreteWrite(&gpio, 1, pl_leds);
}

void pl_led_init()
{
	int status = XGpio_Initialize(&gpio, XPAR_PL_LEDS_DEVICE_ID);

	XGpio_SetDataDirection(&gpio, 1, 0);

	if (status != XST_SUCCESS)
	{
		xil_printf("Failed to setup PL pl_leds\r\n");
	}
}

void pl_leds_set(uint8_t leds)
{
	pl_leds = leds;
	pl_led_write();
}

void pl_led1(bool led1)
{
	pl_leds &= ~(1 << 0);
	pl_leds += ((led1 != 0) << 0);
	pl_led_write();
}

void pl_led2(bool led2)
{
	pl_leds &= ~(1 << 1);
	pl_leds += ((led2 != 0) << 1);
	pl_led_write();
}

void pl_led3(bool led3)
{
	pl_leds &= ~(1 << 2);
	pl_leds += ((led3 != 0) << 2);
	pl_led_write();
}

