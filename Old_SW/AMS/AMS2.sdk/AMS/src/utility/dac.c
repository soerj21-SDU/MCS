/*
 * dac.c
 *
 *  Created on: 8. maj 2019
 *      Author: matt
 */

#include "dac.h"

#include "xparameters.h"
#include "xiicps.h"
#include "xil_printf.h"

XIicPs dac_iic;

void dac_config()
{
	uint8_t send_data[3];

	send_data[0] = 0x40;
	send_data[1] = 0x08;
	send_data[2] = 0x00;

	XIicPs_MasterSendPolled(&dac_iic, send_data, 3, 0x4C);
}

void dac_init()
{
	XIicPs_Config *IicConfig;
	IicConfig = XIicPs_LookupConfig(XPAR_XIICPS_0_DEVICE_ID);
	if (NULL == IicConfig) {
		xil_printf("Lookup I2C config failed for DAC\r\n");
	}

	int Status = XIicPs_CfgInitialize(&dac_iic, IicConfig,
			IicConfig->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialize I2C config failed for DAC\r\n");
	}

	Status = XIicPs_SelfTest(&dac_iic);
	if (Status != XST_SUCCESS) {
		xil_printf("I2C self test failed for DAC\r\n");
	}

	Status = XIicPs_SetOptions(&dac_iic, XIICPS_7_BIT_ADDR_OPTION
							         //| XIICPS_REP_START_OPTION
	);
		if (Status != XST_SUCCESS) {
			xil_printf("I2C set options failed for DAC\r\n");
		}

	XIicPs_SetSClk(&dac_iic, 100000);

	dac_config();
}


//Bits in data(15:10) are ignored (9:0) is used
void dac_write(uint16_t data)
{
	uint8_t send_data[3];

	send_data[0] = 0x30; // Command
	send_data[1] = (uint8_t) ((data >> 2) & 0xff); // Highbyte
	send_data[2] = (uint8_t) ((data & 0b11) << 6); // Low byte

	XIicPs_MasterSendPolled(&dac_iic, send_data, 3, 0x4C);
}
