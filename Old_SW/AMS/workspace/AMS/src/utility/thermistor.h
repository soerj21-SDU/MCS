#include "stdint.h"

/**
* \brief    Converts the ADC result into a temperature value.
*
*           P1 and p2 are the interpolating point just before and after the
*           ADC value. The function interpolates between these two points
*           The resulting code is very small and fast.
*           Only one integer multiplication is used.
*           The compiler can replace the division by a shift operation.
*
*           In the temperature range from -10°C to 70°C the error
*           caused by the usage of a table is 0.137°C
*
* \param    adc_value  The converted ADC result
* \return              The temperature in 0.1 °C
*
*/
int NTC_ADC2Temperature(unsigned int adc_value);
