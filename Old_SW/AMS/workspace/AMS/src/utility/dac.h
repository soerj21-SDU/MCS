/*
 * dac.h
 *
 *  Created on: 8. maj 2019
 *      Author: matt
 */

#ifndef DAC_H_
#define DAC_H_

#include "stdint.h"

void dac_config();

void dac_init();

void dac_write(uint16_t data);

#endif /* DAC_H_ */
