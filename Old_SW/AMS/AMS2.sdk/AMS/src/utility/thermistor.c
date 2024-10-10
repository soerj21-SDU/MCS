#include "stdint.h"

/**
* The NTC table has 257 interpolation points.
* Unit:0.1 °C
*
*/
int16_t NTC_table[257] = {
  -937, -864, -791, -745, -711, -683, -659,
  -639, -621, -605, -590, -576, -563, -552,
  -540, -530, -520, -510, -501, -493, -484,
  -476, -469, -461, -454, -447, -440, -433,
  -427, -421, -415, -409, -403, -397, -391,
  -386, -380, -375, -370, -365, -360, -355,
  -350, -345, -340, -336, -331, -327, -322,
  -318, -313, -309, -305, -301, -296, -292,
  -288, -284, -280, -276, -272, -268, -264,
  -260, -257, -253, -249, -245, -241, -238,
  -234, -230, -227, -223, -220, -216, -212,
  -209, -205, -202, -198, -195, -191, -188,
  -184, -181, -178, -174, -171, -167, -164,
  -161, -157, -154, -150, -147, -144, -140,
  -137, -134, -130, -127, -124, -120, -117,
  -114, -111, -107, -104, -101, -97, -94, -91,
  -87, -84, -81, -77, -74, -71, -67, -64, -61,
  -57, -54, -51, -47, -44, -40, -37, -34, -30,
  -27, -23, -20, -17, -13, -10, -6, -3, 1,
  4, 8, 12, 15, 19, 22, 26, 30, 33, 37, 41,
  44, 48, 52, 56, 59, 63, 67, 71, 75, 79, 83,
  87, 91, 95, 99, 103, 107, 111, 116, 120,
  124, 128, 133, 137, 142, 146, 151, 155, 160,
  165, 169, 174, 179, 184, 189, 194, 199, 204,
  209, 214, 220, 225, 231, 236, 242, 248, 253,
  259, 265, 272, 278, 284, 291, 297, 304, 311,
  318, 325, 332, 339, 347, 355, 363, 371, 379,
  388, 396, 405, 415, 424, 434, 444, 455, 465,
  477, 488, 500, 512, 525, 539, 553, 568, 583,
  599, 616, 634, 653, 673, 695, 718, 743, 769,
  798, 830, 865, 905, 949, 999, 1058, 1128,
  1214, 1324, 1476, 1711, 2189, 2667
};

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
*           caused by the usage of a table is 0.139°C
*
* \param    adc_value  The converted ADC result
* \return              The temperature in 0.1 °C
*
*/
int16_t NTC_ADC2Temperature(uint16_t adc_value)
{
	adc_value *= 1.3653; // 2^12/3000
	int16_t p1,p2;
	/* Estimate the interpolating point before and after the ADC value. */
	p1 = NTC_table[ (adc_value >> 4)  ];
	p2 = NTC_table[ (adc_value >> 4)+1];

	/* Interpolate between both points. */
	return p1 + ( (p2-p1) * (adc_value & 0x000F) ) / 16;
};
