/*
 * spi.c
 *
 *  Created on: 2. apr. 2019
 *      Author: matt
 */

#include "spi.h"

#include "xparameters.h"
#include "xspips.h"
#include "xil_printf.h"

#include "LTC6813.h"

XSpiPs SPI;

void spi_init()
{
	XSpiPs_Config *SpiConfig;
	SpiConfig = XSpiPs_LookupConfig(XPAR_XSPIPS_0_DEVICE_ID);
	if (NULL == SpiConfig) {
		xil_printf("Lookup SPI config failed\r\n");
	}

	int Status = XSpiPs_CfgInitialize(&SPI, SpiConfig,
					SpiConfig->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialize SPI config failed\r\n");
	}

	Status = XSpiPs_SelfTest(&SPI);
	if (Status != XST_SUCCESS) {
		xil_printf("SPI self test failed\r\n");
	}

	XSpiPs_SetOptions(&SPI, XSPIPS_MANUAL_START_OPTION
			| XSPIPS_MASTER_OPTION
			//| XSPIPS_MANUAL_START_OPTION
			| XSPIPS_FORCE_SSELECT_OPTION
			//| XSPIPS_CLK_ACTIVE_LOW_OPTION
			//| XSPIPS_CLK_PHASE_1_OPTION
			);

	XSpiPs_SetClkPrescaler(&SPI, XSPIPS_CLK_PRESCALE_256);

	XSpiPs_SetSlaveSelect(&SPI, 1);
}

void spi_transfer(uint16_t data_len, uint8_t *send_data, uint8_t *read_data)
{
	//send_data[11] = 0x26;
	//send_data[19] = 0x26;
	//for (uint8_t i = 0; i < 12; i++)
	//	xil_printf("%02x ", send_data[i]);
	//xil_printf("\r\n");
	spi_ss_low();
	//spi_ss_high();
	XSpiPs_PolledTransfer(&SPI, send_data, read_data, data_len);
	//spi_ss_low();
	spi_ss_high();
}

void spi_ss_high()
{
	XSpiPs_SetSlaveSelect(&SPI, 1);
}

void spi_ss_low()
{
	XSpiPs_SetSlaveSelect(&SPI, 0);
}
