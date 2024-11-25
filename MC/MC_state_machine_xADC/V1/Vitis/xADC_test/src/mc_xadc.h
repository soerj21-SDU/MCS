#include "xparameters.h"
#include "xadcps.h"

#define XADCPS_Base_Address      XPAR_XXADCPS_0_BASEADDR
#define XADC_DEVICE_ID 		    0

// XADCPS_CH_AUX_MIN
// XADCPS_CH_AUX_MAX

extern XAdcPs          XADC_PS_inst;
extern XAdcPs_Config   *XADC_CFG_ptr;

static const u8 XADC_AUX[] = {XADCPS_AUX00_OFFSET, XADCPS_AUX01_OFFSET, XADCPS_AUX02_OFFSET, XADCPS_AUX03_OFFSET,
							  XADCPS_AUX04_OFFSET, XADCPS_AUX05_OFFSET, XADCPS_AUX06_OFFSET, XADCPS_AUX07_OFFSET,
							  XADCPS_AUX08_OFFSET, XADCPS_AUX09_OFFSET, XADCPS_AUX10_OFFSET, XADCPS_AUX11_OFFSET,
							  XADCPS_AUX12_OFFSET, XADCPS_AUX13_OFFSET, XADCPS_AUX14_OFFSET, XADCPS_AUX15_OFFSET};

int xadc_init(u32 BaseAddress);

u16 xadc_get_aux(u16 channel);

float xADC_convert_voltage(u16 raw_data);

float xADC_get_converted_voltage(u16 channel);

float xADC_reverse_voltage_division(int voltage_in_use, float voltage);

