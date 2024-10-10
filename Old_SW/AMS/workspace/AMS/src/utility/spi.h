/*
 * spi.h
 *
 *  Created on: 2. apr. 2019
 *      Author: matt
 */

#ifndef SRC_SPI_H_
#define SRC_SPI_H_

#include "stdint.h"

void spi_init();

void spi_transfer(uint16_t data_len, uint8_t *send_data, uint8_t *read_data);

void spi_ss_toggle();
void spi_ss_low();
void spi_ss_high();

#endif /* SRC_SPI_H_ */
