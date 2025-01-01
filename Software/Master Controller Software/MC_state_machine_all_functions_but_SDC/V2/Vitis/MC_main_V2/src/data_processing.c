#include "includes/data_processing.h"
#include <stdint.h>
#include <sys/types.h>
#include <xil_printf.h>
#include <xil_types.h>
#include <stdbool.h>
#include <math.h>  // For fabs

/*--------------------- SW variables ------------------------*/
int SW_adc_max = 3800;
int SW_adc_min = 1000;
u_int SW_angle_max = 100;
u_int SW_angle_min = -100;

bool Sterring_angle_error = FALSE;
/*-----------------------------------------------------------*/

/*--------------------- TP variables ------------------------*/
int TP0_adc_max = 2126;
int TP0_adc_min = 1205;
int TP1_adc_max = 2342;
int TP1_adc_min = 1344;

bool Tourqe_pedal_error = FALSE;
/*-----------------------------------------------------------*/

/*--------------------- BP variables ------------------------*/
int BP0_adc_max = 2000; // Find maximum pressure and translate it to adc value
int BP0_adc_min = 400;
int BP1_adc_max = 2000; // Find maximum pressure and translate it to adc value
int BP1_adc_min = 400;

bool Brake_pedal_error = FALSE;
/*-----------------------------------------------------------*/


float get_SW_angle(int ADC_value)
{
    float angle = 0; 
    if (!Sterring_angle_error) 
    {
        if (ADC_value < SW_adc_min) 
        {
            angle = SW_angle_min;
        } 
        else if (ADC_value > SW_adc_max) 
        {
            angle = SW_angle_max;
        } 
        else 
        {
            angle = ((float)ADC_value - SW_adc_min) / 
                (SW_adc_max - SW_adc_min) * 
                (SW_angle_max - SW_angle_min) + SW_angle_min;
        }
    } 
    else 
    {
        angle = 0;
    }
return angle;
}


float TP0_percentage(int ADC_value) 
{
    float percentage;
    percentage = ((float)(ADC_value - TP0_adc_min) / (TP0_adc_max - TP0_adc_min)) * 100;
    return percentage;
}

float TP1_percentage(int ADC_value) 
{
    float percentage;
    percentage = ((float)(ADC_value - TP1_adc_min) / (TP1_adc_max - TP1_adc_min)) * 100;
    return percentage;
}

bool TorqueSensorsOutOfRange(float TP_0_percentage, float TP_1_percentage) 
    {
        if (fabs(TP_0_percentage - TP_1_percentage) > 5) // Change margin of error here
        {
            // Insert error handeling. 
            return TRUE;
        }
        else 
        {
            return FALSE;
        }
    }

bool BrakePedalSensorsOutOfRange(float BP_0_percentage, float BP_1_percentage) 
{
    if (fabs(BP_0_percentage - BP_1_percentage) > 15) // Change margin of error here
    {
        // Insert error handling.
        return TRUE;
    }
    else 
    {
        return FALSE;
    }
}

float BP0_percentage(int ADC_value) 
{
    float percentage;
    percentage = ((float)(ADC_value - BP0_adc_min) / (BP0_adc_max - BP0_adc_min)) * 100;
    return percentage;
}

float BP1_percentage(int ADC_value) 
{
    float percentage;
    percentage = ((float)(ADC_value - BP1_adc_min) / (BP1_adc_max - BP1_adc_min)) * 100;
    return percentage;
}

