/*
 * LTC6813.h
 *
 *  Created on: 20. mar. 2019
 *      Author: Mathias Ebbensgaard Jensen
 *
 *  Note:
 *  	This interface is written for the context of the SDU Viking X. Many things
 *  	are implemented for general use, but there is no guarantee or support for
 *  	that.
 */

#ifndef LTC6813_H_
#define LTC6813_H_

#include "stdint.h"
#include "stdbool.h"

// The DCP bit for a some commands (should be constant I think)
#define DCP_BIT 0


// The amount of battery cells each daisy chained LTC6813 is connected to
#define CELLS_PER_DEVICE 14

// The amount of battery cell temperature sensors each daisy chained LTC6813 is connected to
#define CELL_TEMP_PER_DEVICE 5 // Lookup amount !!

// The amount of discharge thermomisters per daisy chained LTC6813
#define DISCHARGE_TEMP_PER_DEVICE 7 // Lookup amount !!




// The amount of discharge circuits per daisy chained LTC6813
//#define DISCHARGE_CIRCUITS_PER_DEVICE 14 // Lookup amount !!

// S pin control bits (there are 9 values from 0000 to 1xxx, but not currently handled)
/*
enum S_PIN_BITS
{
	S_PIN_HIGH = 0b000,
	S_PIN_LOW = 0b1111
};
*/

// The data structure describing a single device's status and measurements
// Anything not used for this project will not be included in this structure!
struct LTC6813_status
{
	////// Registers. These should not be read from or written to directly, per design at least
	// Configuration Register Group A and B
	uint8_t WRCFGA[6];
	uint8_t RDCFGA[6];
	uint8_t WRCFGB[6];
	uint8_t RDCFGB[6];

	uint16_t VOV; //Overvoltage
	uint16_t VUV; //Undervoltage

	// Cell Voltage Register Groups
	uint8_t CVRGA[6];
	uint8_t CVRGB[6];
	uint8_t CVRGC[6];
	uint8_t CVRGD[6];
	uint8_t CVRGE[6];
	uint8_t CVRGF[6];

	// Auxiliary register groups
	uint8_t AURGA[6];
	uint8_t AURGB[6];
	uint8_t AURGC[6];
	uint8_t AURGD[6];

	// Status register groups
	uint8_t STATA[6];
	uint8_t STATB[6];

	// COMM register group
	uint8_t COMMRG[6];

	// COMM settings
	uint8_t ICOM[3]; //(4-bit values)
	uint8_t FCOM[3]; //(4-bit values);

	// GPIO measurements
	uint16_t GPIO[9];

	//2nd reference, for debugging
	uint16_t REF2;

	////// User data. These should be read from or written to, per design at least
	// Battery cell voltages, updated by ADCV and RDCV(A-F)
	uint16_t cell_volt[CELLS_PER_DEVICE];

	// Sum of cells as read by status register A
	uint16_t sum_of_cells;

	// Battery cell temperatures, updated by ADAX and RDAUX(A-D)
	int16_t cell_temp[CELL_TEMP_PER_DEVICE];

	// Discharge resistor temperatures, updated by WRCOMM, ADAX (GPIO-3) and RDAUXA
	uint16_t disc_temp[DISCHARGE_TEMP_PER_DEVICE];

	// Which discharge temperature sensor to select (value 0-7)
	uint8_t disc_pin;

	// Discharge circuits S pin control bits
	//enum S_PIN_BITS disc_pins[CELLS_PER_DEVICE];

	// Discharge circuits active, update on the AMS Slave PCB by writing to these and ***
	bool disc_active[CELLS_PER_DEVICE];

	// Device revision code (only read this, meant for debugging)
	uint8_t REV;

	// PEC error. Gets set upon PEC error, cleared by BatteryTask
	bool PEC_error;
};

// The ADC mode for which a conversion command will use (MD bits)
enum ADC_MODE
{
	ADC_MODE_422Hz = 0b00,
	ADC_MODE_FAST = 0b01,
	ADC_MODE_NORMAL = 0b10,
	ADC_MODE_FILTERED = 0b11
};

// The cell selection bits the ADCV command will use (CH bits)
enum CELL_SELECT
{
	ALL_CELLS = 0b000,
	CELLS_1_7_13 = 0b001,
	CELLS_2_8_14 = 0b010,
	CELLS_3_9_15 = 0b011,
	CELLS_4_10_16 = 0b100,
	CELLS_5_11_17 = 0b101,
	CELLS_6_12_18 = 0b110,
	CELLS_7_13_19 = 0b111
};

// The GPIO selection bits the ADAX command will use (CHG bits)
enum GPIO_SELECT
{
	ALL_GPIOS = 0b000,
	GPIO_1_6 = 0b001,
	GPIO_2_7 = 0b010,
	GPIO_3_8 = 0b011,
	GPIO_4_9 = 0b100,
	GPIO_5 = 0b101,
	GPIO_2ND = 0b110
};

enum OW_MODE
{
	OW_PULLDOWN = 0b0,
	OW_PULLUP = 0b1
};

//Helper debugging function
void printnbytes(uint8_t data_len, uint8_t *data);

void wakeup_sleep(uint8_t device_count);
void wakeup_idle(uint8_t device_count);

// Initializes some aspects for the specific use-case of SDU-Vikings Viking X
void LTC6813_init(uint8_t device_count, struct LTC6813_status *devices);

// LTC6813 commands. Some write command initialize their data themselves.
void LTC6813_WRCFGA(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_WRCFGB(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDCFGA(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDCFGB(uint8_t device_count, struct LTC6813_status *devices);

void LTC6813_RDCVA(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDCVB(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDCVC(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDCVD(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDCVE(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDCVF(uint8_t device_count, struct LTC6813_status *devices);

void LTC6813_RDAUXA(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDAUXB(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDAUXC(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDAUXD(uint8_t device_count, struct LTC6813_status *devices);

void LTC6813_RDSTATA(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDSTATB(uint8_t device_count, struct LTC6813_status *devices);

void LTC6813_WRSCTRL(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_WRPSB(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDSCTRL(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_STSCTRL(uint8_t device_count, struct LTC6813_status *devices);

void LTC6813_ADCV(enum ADC_MODE MD, enum CELL_SELECT CH);
void LTC6813_ADAX(enum ADC_MODE MD, enum GPIO_SELECT CHG);
void LTC6813_ADCVSC(enum ADC_MODE MD);

void LTC6813_CLRCELL(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_CLRAUX(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_CLRSTAT(uint8_t device_count, struct LTC6813_status *devices);

void LTC6813_WRCOMM(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_RDCOMM(uint8_t device_count, struct LTC6813_status *devices);
void LTC6813_STCOMM();

#endif /* LTC6813_H_ */
