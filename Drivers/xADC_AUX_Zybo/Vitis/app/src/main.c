#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "mc_xadc.h"


int main()
{
    init_platform();
	int status;
    int delay = 100000000;

    status = xadc_init(XADCPS_Base_Address); 
        if (status == XST_FAILURE) 
        {
            xil_printf("\r\nXADC Initialization error.\r\n");
        } 
        else 
        {
            xil_printf("\r\nInitialization completed successfully.\r\n");
        }

    // int xADC_AUX6_RAW = 0;
    // float xADC_AUX6_Voltage = 0; 

    // int xADC_AUX7_RAW = 0;
    // float xADC_AUX7_Voltage = 0; 

    int xADC_AUX14_RAW = 0;
    float xADC_AUX14_Voltage = 0; 

    // int xADC_AUX15_RAW = 0;
    // float xADC_AUX15_Voltage = 0; 


    while(1)
    {
        while(delay--);
        
        // AUX6:
        // xADC_AUX6_RAW = xadc_get_aux(6); 
        // xil_printf("\r\nRaw data AUX6: %d.\r\n",  xADC_AUX6_RAW);

        // xADC_AUX6_Voltage = xADC_get_converted_voltage(6);
        // printf("\n Voltage AUX6: %.3f.", xADC_AUX6_Voltage);


        // AUX7:
        // xADC_AUX7_RAW = xadc_get_aux(7); 
        // xil_printf("\r\nRaw data AUX7: %d.\r\n",  xADC_AUX7_RAW);

        // xADC_AUX7_Voltage = xADC_get_converted_voltage(7);
        // printf("\n Voltage AUX7: %.3f.", xADC_AUX7_Voltage);


        // AUX14:
        xADC_AUX14_RAW = xadc_get_aux(14); 
        xil_printf("\r\nRaw data AUX14: %d.\r\n",  xADC_AUX14_RAW);

        xADC_AUX14_Voltage = xADC_get_converted_voltage(14);
        printf("\n Voltage AUX14: %.3f.", xADC_AUX14_Voltage);


        // AUX15:
        // xADC_AUX15_RAW = xadc_get_aux(15); 
        // xil_printf("\r\nRaw data AUX15: %d.\r\n",  xADC_AUX15_RAW);

        // xADC_AUX15_Voltage = xADC_get_converted_voltage(15);
        // printf("\n Voltage AUX15: %.3f.", xADC_AUX15_Voltage);

		delay = 100000000;
    }

    cleanup_platform();
    return 0;
};