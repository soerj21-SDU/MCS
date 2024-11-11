#include "mc_xadc.h"

XAdcPs          XADC_PS_inst;
XAdcPs_Config   *XADC_CFG_ptr;

int xadc_init(u32 BaseAddress) 
{

	int status = XST_SUCCESS;

	XADC_CFG_ptr = XAdcPs_LookupConfig(BaseAddress);
        if (XADC_CFG_ptr == NULL) 
        {
            return XST_FAILURE;
        }

	// Initialize hardware configuration
	status = XAdcPs_CfgInitialize(&XADC_PS_inst, XADC_CFG_ptr, XADC_CFG_ptr->BaseAddress);
        if (status != XST_SUCCESS) 
        {
            return XST_FAILURE;
        }

	// Check that hardware is correctly built
	status = XAdcPs_SelfTest(&XADC_PS_inst);
        if (status != XST_SUCCESS) 
        {
            return XST_FAILURE;
        }


	return status;
}

// -------------------------------------------------
u16 xadc_get_aux(u16 channel) 
{
	return (XAdcPs_GetAdcData(&XADC_PS_inst, XADC_AUX[channel]) >> 4);
}

float xADC_get_converted_voltage(u16 channel)
{
    u16 raw_data;
    float voltage;

    raw_data = xadc_get_aux(channel);
    voltage = ( (float)raw_data * 1.0  )    /    ( (float) 4095.0 ) ;

    return voltage;
}
float xADC_convert_voltage(u16 raw_data)
{
    float voltage;
    voltage = ( (float)raw_data * 1.0  )    /    ( (float) 4095.0 ) ;

    return voltage;
}