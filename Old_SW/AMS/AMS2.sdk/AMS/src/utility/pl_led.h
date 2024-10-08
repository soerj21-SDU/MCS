/*
 * pl_led.h
 *
 *  Created on: 6. maj 2019
 *      Author: matt
 */

#ifndef PL_LED_H_
#define PL_LED_H_

#include "stdint.h"
#include "stdbool.h"

void pl_led_init();

void pl_leds_set(uint8_t leds);

void pl_led1(bool led1);
void pl_led2(bool led2);
void pl_led3(bool led3);

#endif
