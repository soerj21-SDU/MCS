/*
 * LTC6813.c
 *
 *  Created on: 20. mar. 2019
 *      Author: matt
 */

#include "LTC6813.h"
#include "spi.h"
#include "pec15.h"
//#include "thermistor.h"

#include "stdint.h"

#include "xparameters.h"	/* XPAR parameters */
#include "xil_printf.h"
#include "sleep.h"

//  Wake isoSPI up from idle state
void wakeup_idle(uint8_t device_count)
{
	for (uint8_t i = 0; i < device_count; i++)
	{
		uint8_t dummy[1] = {0x55};

		spi_transfer(1, dummy, dummy);
		//usleep(10);
	}
}

//Generic wakeup commannd to wake the LTC681x from sleep
void wakeup_sleep(uint8_t device_count)
{
	for (uint8_t i = 0; i < device_count; i++)
	{
		spi_ss_low();
		usleep(300); // Guarantees the LTC681x will be in standby
		spi_ss_high();
		usleep(10);
	}
}

void printnbytes(uint8_t data_len, uint8_t *data)
{
	for (int i = 0; i < data_len; i++)
	{
		char string[11] = "[00000000]";

		for (int j = 0; j < 8; j++)
		{
			if (data[i]&(1<<(7-j)))
				string[j+1] = '1';
			else
				string[j+1] = '0';
		}

		xil_printf(string);
	}

	xil_printf("\r\n");
}

void PEC_error(char *str, uint8_t bank)
{
	//xil_printf("PEC error for %s for LTC6813 #%d\r\n", str, bank);
	//xil_printf("%d\r\n", bank); // To avoid delays
}

void poll_cmd(uint8_t cmd_bytes[2])
{
	uint16_t cmd_pec = pec15(cmd_bytes, 2);

	uint8_t send_bytes[4];

	send_bytes[0] = cmd_bytes[0];
	send_bytes[1] = cmd_bytes[1];
	send_bytes[2] = (cmd_pec>>8);
	send_bytes[3] = (cmd_pec & 0xff);

	//printnbytes(4, send_bytes);

	uint8_t dummy[4];
	spi_transfer(4, send_bytes, dummy);
}

void write_cmd(uint8_t cmd_bytes[2], uint8_t data_len, uint8_t *data)
{
	uint16_t cmd_pec = pec15(cmd_bytes, 2);

	uint8_t send_bytes[4+data_len];

	send_bytes[0] = cmd_bytes[0];
	send_bytes[1] = cmd_bytes[1];
	send_bytes[2] = (cmd_pec>>8);
	send_bytes[3] = (cmd_pec & 0xff);

	// Devices are written to with bytes in reverse order
	// This implementation will only work if in all cases, 8 bytes are written to per device
	for (uint8_t i = 0; i < data_len/8; i++)
	{
		memcpy(send_bytes+i*8+4, data+data_len-8-i*8, 8);
	}

	uint8_t dummy[data_len+4];
	spi_transfer(4+data_len, send_bytes, dummy);
}

void read_cmd(uint8_t cmd_bytes[2], uint8_t data_len, uint8_t *data)
{
	uint16_t cmd_pec = pec15(cmd_bytes, 2);

	uint8_t send_bytes[4+data_len];

	memset(send_bytes, 0, 4+data_len);

	send_bytes[0] = cmd_bytes[0];
	send_bytes[1] = cmd_bytes[1];
	send_bytes[2] = (cmd_pec>>8);
	send_bytes[3] = (cmd_pec & 0xff);

	uint8_t read_bytes[4+data_len];

	spi_transfer(4+data_len, send_bytes, read_bytes);

	memcpy(data, read_bytes+4, data_len);
}

void LTC6813_init(uint8_t device_count, struct LTC6813_status *devices)
{
	//SPI setup
	spi_init();

	//Data structure initialization
	// giant memset?
	memset(devices, 0, device_count * sizeof (struct LTC6813_status));

	//I2C setup and other configuration
	for (uint8_t i = 0; i < device_count; i++)
	{
		devices[i].VOV = 2625; //voltage = VOV * 16 * 100uV
		devices[i].VUV = 1874; //voltage = (VUV + 1) * 16 * 100uV
		//devices[i].WRCFGA[0] = 0b11100100; // Disables pulldown for I2C comm pins
		//devices[i].WRCFGA[1] = devices[i].VUV & 0xf;
		//devices[i].WRCFGA[2] = ((devices[i].VOV & 0b1111) << 4) + ((devices[i].VUV >> 8) & 0b1111);
		//devices[i].WRCFGA[3] = (devices[i].VOV >> 4) & 0xf;
		//devices[i].WRCFGA[0] = 0xE4;
		//devices[i].WRCFGA[1] = 0x0D;
		//devices[i].WRCFGA[2] = 0x28;
		//devices[i].WRCFGA[3] = 0xA0;
		//devices[i].WRCFGA[4] = 0x55; //0x01 for DDC1
		//devices[i].WRCFGA[5] = 0x0a;

		//devices[i].WRCFGB[0] = 0x50;
		//devices[i].WRCFGB[1] = 0x07;
		//devices[i].WRCFGB[2] = 0x00;
		//devices[i].WRCFGB[3] = 0x00;
		//devices[i].WRCFGB[4] = 0x00;
		//devices[i].WRCFGB[5] = 0x00;

		// Message settings for I2C communication to MUX
		devices[i].ICOM[0] = 0b0110;
		devices[i].ICOM[1] = 0b0000;
		devices[i].ICOM[2] = 0b0111;

		devices[i].FCOM[0] = 0b0000;
		devices[i].FCOM[1] = 0b1001;
		devices[i].FCOM[2] = 0b1001;
	}
}

void LTC6813_WRCFGA(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0b0, 0b1};

	uint8_t data[device_count*8];

	for (uint8_t i = 0; i < device_count; i++)
	{
		devices[i].WRCFGA[0] = 0xF8;
		devices[i].WRCFGA[1] = 0x00; // VUV/VOV taken from Arduino, should be irrelevant
		devices[i].WRCFGA[2] = 0x00; // VUV/VOV taken from Arduino, should be irrelevant
		devices[i].WRCFGA[3] = 0x00; // VUV/VOV taken from Arduino, should be irrelevant

		devices[i].WRCFGA[4] = 0x00;
		for (uint8_t j = 0; j < 8; j++)
			devices[i].WRCFGA[4] += devices[i].disc_active[j]<<j;

		devices[i].WRCFGA[5] = 0x00;
		for (uint8_t j = 0; j < 4; j++)
			devices[i].WRCFGA[5] += devices[i].disc_active[j+8]<<j;

		memcpy(data+i*8, devices[i].WRCFGA, 6);

		uint16_t pec = pec15(devices[i].WRCFGA, 6);

		data[i*8+6] = pec>>8;
		data[i*8+7] = pec&0xff;
	}

	write_cmd(cmd_bytes, device_count*8, data);
}

void LTC6813_WRCFGB(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0b0, 0b100100};

	uint8_t data[device_count*8];

	for (uint8_t i = 0; i < device_count; i++)
	{
		devices[i].WRCFGB[0] = 0x07;
		for (uint8_t j = 0; j < 2; j++)
		{
			devices[i].WRCFGB[0] += devices[i].disc_active[j+12]<<(j+4);
		}
		devices[i].WRCFGB[1] = 0x00;
		devices[i].WRCFGB[2] = 0x00;
		devices[i].WRCFGB[3] = 0x00;
		devices[i].WRCFGB[4] = 0x00;
		devices[i].WRCFGB[5] = 0x00;

		memcpy(data+i*8, devices[i].WRCFGB, 6);

		uint16_t pec = pec15(devices[i].WRCFGB, 6);

		data[i*8+6] = pec>>8;
		data[i*8+7] = pec&0xff;
	}

	write_cmd(cmd_bytes, device_count*8, data);
}

void LTC6813_RDCFGA(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b10};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (uint8_t i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].RDCFGA, data+i*8, 6);
		}
		else
		{
			PEC_error("RDCFGA", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDCFGB(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b100110};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (uint8_t i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].RDCFGB, data+i*8, 6);
		}
		else
		{
			PEC_error("RDCFGB", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDCVA(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b0100};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (uint8_t i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].CVRGA, data+i*8, 6);
			devices[i].cell_volt[0] = ((devices[i].CVRGA[1]<<8) + devices[i].CVRGA[0])*100/1000;
			devices[i].cell_volt[1] = ((devices[i].CVRGA[3]<<8) + devices[i].CVRGA[2])*100/1000;
			devices[i].cell_volt[2] = ((devices[i].CVRGA[5]<<8) + devices[i].CVRGA[4])*100/1000;
		}
		else
		{
			//printnbytes(8, data+i*8);
			PEC_error("RDCVA", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDCVB(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b0110};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (int i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].CVRGB, data+i*8, 6);
			devices[i].cell_volt[3] = ((devices[i].CVRGB[1]<<8) + devices[i].CVRGB[0])*100/1000;
			devices[i].cell_volt[4] = ((devices[i].CVRGB[3]<<8) + devices[i].CVRGB[2])*100/1000;
			devices[i].cell_volt[5] = ((devices[i].CVRGB[5]<<8) + devices[i].CVRGB[4])*100/1000;
		}
		else
		{
			PEC_error("RDCVB", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDCVC(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b1000};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (int i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].CVRGC, data+i*8, 6);
			devices[i].cell_volt[6] = ((devices[i].CVRGC[1]<<8) + devices[i].CVRGC[0])*100/1000;
			devices[i].cell_volt[7] = ((devices[i].CVRGC[3]<<8) + devices[i].CVRGC[2])*100/1000;
			devices[i].cell_volt[8] = ((devices[i].CVRGC[5]<<8) + devices[i].CVRGC[4])*100/1000;
		}
		else
		{
			PEC_error("RDCVC", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDCVD(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b1010};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (int i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].CVRGD, data+i*8, 6);
			devices[i].cell_volt[9] = ((devices[i].CVRGD[1]<<8) + devices[i].CVRGD[0])*100/1000;
			devices[i].cell_volt[10] = ((devices[i].CVRGD[3]<<8) + devices[i].CVRGD[2])*100/1000;
			devices[i].cell_volt[11] = ((devices[i].CVRGD[5]<<8) + devices[i].CVRGD[4])*100/1000;
		}
		else
		{
			PEC_error("RDCVD", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDCVE(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b1001};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (int i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].CVRGE, data+i*8, 6);
			devices[i].cell_volt[12] = ((devices[i].CVRGE[1]<<8) + devices[i].CVRGE[0])*100/1000;
			devices[i].cell_volt[13] = ((devices[i].CVRGE[3]<<8) + devices[i].CVRGE[2])*100/1000;
			//devices[i].cell_volt[14] = ((devices[i].CVRGE[5]<<8) + devices[i].CVRGE[4])*100/1000;
			// This is outcommented because there is only 14 cells for Viking X
		}
		else
		{
			PEC_error("RDCVE", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDCVF(uint8_t device_count, struct LTC6813_status *devices)
{
	xil_printf("Warning: RDCVF might out-of-range write to cell_volt registers since these are not used for Viking X.\r\n");
	uint8_t cmd_bytes[2] = {0, 0b1011};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (int i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].CVRGF, data+i*8, 6);
			devices[i].cell_volt[15] = ((devices[i].CVRGF[1]<<8) + devices[i].CVRGF[0])*100/1000;
			devices[i].cell_volt[16] = ((devices[i].CVRGF[3]<<8) + devices[i].CVRGF[2])*100/1000;
			devices[i].cell_volt[17] = ((devices[i].CVRGF[5]<<8) + devices[i].CVRGF[4])*100/1000;
		}
		else
		{
			PEC_error("RDCVF", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDAUXA(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b1100};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (int i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].AURGA, data+i*8, 6);
			devices[i].GPIO[0] = ((devices[i].AURGA[1]<<8) + devices[i].AURGA[0])*100/1000;
			devices[i].GPIO[1] = ((devices[i].AURGA[3]<<8) + devices[i].AURGA[2])*100/1000;
			devices[i].GPIO[2] = ((devices[i].AURGA[5]<<8) + devices[i].AURGA[4])*100/1000;

			devices[i].cell_temp[0] = NTC_ADC2Temperature(devices[i].GPIO[0]);
			devices[i].cell_temp[1] = NTC_ADC2Temperature(devices[i].GPIO[1]);
			devices[i].disc_temp[devices[i].disc_pin] = NTC_ADC2Temperature(devices[i].GPIO[2]);
		}
		else
		{
			PEC_error("RDAUXA", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDAUXB(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b1110};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (int i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].AURGB, data+i*8, 6);
			devices[i].GPIO[3] = ((devices[i].AURGB[1]<<8) + devices[i].AURGB[0])*100/1000;
			devices[i].GPIO[4] = ((devices[i].AURGB[3]<<8) + devices[i].AURGB[2])*100/1000;
			devices[i].REF2 =    ((devices[i].AURGB[5]<<8) + devices[i].AURGB[4])*100/1000;
		}
		else
		{
			PEC_error("RDAUXB", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDAUXC(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b1101};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (int i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].AURGC, data+i*8, 6);
			devices[i].GPIO[5] = ((devices[i].AURGC[1]<<8) + devices[i].AURGC[0])*100/1000;
			devices[i].GPIO[6] = ((devices[i].AURGC[3]<<8) + devices[i].AURGC[2])*100/1000;
			devices[i].GPIO[7] = ((devices[i].AURGC[5]<<8) + devices[i].AURGC[4])*100/1000;

			devices[i].cell_temp[2] = NTC_ADC2Temperature(devices[i].GPIO[5]);
			devices[i].cell_temp[3] = NTC_ADC2Temperature(devices[i].GPIO[6]);
			devices[i].cell_temp[4] = NTC_ADC2Temperature(devices[i].GPIO[7]);
		}
		else
		{
			PEC_error("RDAUXC", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDAUXD(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b1111};

	uint8_t data[device_count*8];

	read_cmd(cmd_bytes, device_count*8, data);

	for (int i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].AURGD, data+i*8, 6);
			devices[i].GPIO[8] = ((devices[i].AURGD[1]<<8) + devices[i].AURGD[0])*100/1000;
		}
		else
		{
			PEC_error("RDAUXD", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDSTATA(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b10000};

	uint8_t data[8*device_count];

	read_cmd(cmd_bytes, 8*device_count, data);

	for (uint8_t i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].STATA, data+8*i, 6);

			devices[i].sum_of_cells = ((devices[i].STATA[1]<<8) + devices[i].STATA[0])*30*100/1000;
		}
		else
		{
			PEC_error("RDSTATA", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_RDSTATB(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b10010};

	uint8_t data[8*device_count];

	read_cmd(cmd_bytes, 8*device_count, data);

	for (uint8_t i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			memcpy(devices[i].STATB, data+8*i, 6);

			devices[i].REV = devices[i].STATB[5]>>4;
		}
		else
		{
			PEC_error("RDSTATB", i);
			devices[i].PEC_error = true;
		}
	}
}
/*
void LTC6813_WRSCTRL(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b10100};

	uint8_t data[8*device_count];

	for (uint8_t i = 0; i < device_count; i++)
	{
		for (uint8_t s = 0; s < 6; s++)
		{
			data[i*8+s] = (devices[i].disc_pins[s*2+1]<<4) + devices[i].disc_pins[s*2];
		}

		uint16_t pec = pec15(data+i*8, 6);

		data[i*8+6] = pec>>8;
		data[i*8+7] = pec&0xff;

		//printnbytes(6, data+i*8);
	}

	write_cmd(cmd_bytes, device_count*8, data);
}
*/
/*
void LTC6813_WRPSB(uint8_t device_count, struct LTC6813_status *devices)
{
}
*/

void LTC6813_RDSCTRL(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b10110};

	uint8_t data[8*device_count];

	read_cmd(cmd_bytes, 8*device_count, data);

	for (uint8_t i = 0; i < device_count; i++)
	{
		printnbytes(6, data+i*8);
	}
}

void LTC6813_STSCTRL(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0, 0b11001};

	poll_cmd(cmd_bytes);
}

void LTC6813_ADCV(enum ADC_MODE MD, enum CELL_SELECT CH)
{
	uint8_t cmd_bytes[2];

	cmd_bytes[0] = 0b010 + (MD>>1);
	cmd_bytes[1] = 0b01100000 + ((MD & 0b1) << 7) + (DCP_BIT << 4) + CH;

	poll_cmd(cmd_bytes);
}

void LTC6813_ADOW(enum ADC_MODE MD, enum CELL_SELECT CH, enum OW_MODE PUP)
{
	uint8_t cmd_bytes[2];

	cmd_bytes[0] = 0b010 + (MD>>1);
	cmd_bytes[1] = 0b00101000 + ((MD & 0b1) << 7) + (PUP << 6) + (DCP_BIT << 4) + CH;

	poll_cmd(cmd_bytes);
}

void LTC6813_ADAX(enum ADC_MODE MD, enum GPIO_SELECT CHG)
{
	uint8_t cmd_bytes[2];

	cmd_bytes[0] = 0b100 + (MD>>1);
	cmd_bytes[1] = 0b01100000 + ((MD & 0b1) << 7) + CHG;

	poll_cmd(cmd_bytes);
}

void LTC6813_ADCVSC(enum ADC_MODE MD)
{
	uint8_t cmd_bytes[2];

	cmd_bytes[0] = 0b100 + (MD>>1);
	cmd_bytes[1] = 0b01100111 + ((MD & 0b1) << 7) + (DCP_BIT << 4);

	poll_cmd(cmd_bytes);
}

void LTC6813_CLRCELL(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0b111, 0b10001};

	poll_cmd(cmd_bytes);
}

void LTC6813_CLRAUX(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0b111, 0b10010};

	poll_cmd(cmd_bytes);
}

void LTC6813_CLRSTAT(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0b111, 0b10011};

	poll_cmd(cmd_bytes);
}

void LTC6813_WRCOMM(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0b111, 0b00100001};

	uint8_t data[8*device_count];

	for (uint8_t i = 0; i < device_count; i++)
	{
		uint8_t data_bytes[3];
		data_bytes[0] = 0b10011000;
		data_bytes[1] = 1 << devices[i].disc_pin;
		data_bytes[2] = 0xAA; //Not in use for Viking X

		devices[i].COMMRG[0] = (devices[i].ICOM[0]<<4)    + (data_bytes[0] >> 4);
		devices[i].COMMRG[1] = ((data_bytes[0]&0xf)<<4)   + (devices[i].FCOM[0] & 0xf);
		devices[i].COMMRG[2] = (devices[i].ICOM[1]<<4)    + (data_bytes[1] >> 4);
		devices[i].COMMRG[3] = ((data_bytes[1]&0xf)<<4)   + (devices[i].FCOM[1] & 0xf);
		devices[i].COMMRG[4] = (devices[i].ICOM[2]<<4)    + (data_bytes[2] >> 4);
		devices[i].COMMRG[5] = ((data_bytes[2]&0xf)<<4)   + (devices[i].FCOM[2] & 0xf);

		memcpy(data+i*8, devices[i].COMMRG, 6);

		uint16_t pec = pec15(data+i*8, 6);

		data[i*8+6] = pec>>8;
		data[i*8+7] = pec&0xff;
	}

	write_cmd(cmd_bytes, device_count*8, data);
}

void LTC6813_RDCOMM(uint8_t device_count, struct LTC6813_status *devices)
{
	uint8_t cmd_bytes[2] = {0b111, 0b00100010};

	uint8_t data[8*device_count];

	read_cmd(cmd_bytes, 8*device_count, data);

	for (int i = 0; i < device_count; i++)
	{
		if (pec_check(data+i*8))
		{
			//memcpy(devices[i].COMMRG, data+i*8, 6);

			printnbytes(6, devices[i].COMMRG);
		}
		else
		{
			PEC_error("RDCOMM", i);
			devices[i].PEC_error = true;
		}
	}
}

void LTC6813_STCOMM()
{
	uint8_t cmd_bytes[2] = {0b111, 0b00100011};

	//STCOMM needs to send extra clock pulses after the command bytes, so it cannot use poll_cmd

	//4 for command bytes and 24 more per data byte over i2c/spi
	uint8_t send_bytes[4+48];

	uint16_t pec = pec15(cmd_bytes, 2);

	send_bytes[0] = cmd_bytes[0];
	send_bytes[1] = cmd_bytes[1];
	send_bytes[2] = pec>>8;
	send_bytes[3] = pec&0xff;

	spi_transfer(4+48, send_bytes, NULL);
}
