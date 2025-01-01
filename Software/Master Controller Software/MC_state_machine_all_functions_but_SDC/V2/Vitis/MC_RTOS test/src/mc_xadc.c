#include "includes/mc_xadc.h"
#include <stdio.h>

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

float xADC_reverse_voltage_division(int voltage_in_use, float voltage)
{
    float reverse_voltage;
    if (voltage_in_use == 5) // If pin headeres are set to 5 V
    {
        reverse_voltage = voltage*(1.0 + (4020.0 / 1000.0));
        return reverse_voltage;
    } 
    
    else if (voltage_in_use == 12) // If pin headeres are set to 12 V
    {
        reverse_voltage = voltage*(1.0 + (11000.0 / 1000.0));
        return reverse_voltage;
    }

    else if (voltage_in_use == 24) // If pin headeres are set to 12 V
    {
        reverse_voltage = voltage*(1.0 + (29100.0 / 1000.0));
        return reverse_voltage;
    }

    else {
        printf("Voltage eroor in xADC_reverse_voltage_division");
        return reverse_voltage = 0.0;
    }


}

float xADC_get_LVS_Current(u16 channel)
{
    float LVS_Current;
    LVS_Current = xadc_get_aux(channel);
    LVS_Current = xADC_get_converted_voltage(channel);
    LVS_Current = xADC_reverse_voltage_division(5, LVS_Current); 
    return LVS_Current;
}

float xADC_get_LVS_Voltage(u16 channel)
{
    float LVS_Voltage;
    LVS_Voltage = xADC_get_converted_voltage(channel);
    LVS_Voltage = xADC_reverse_voltage_division(24, LVS_Voltage);    
    return LVS_Voltage;
}