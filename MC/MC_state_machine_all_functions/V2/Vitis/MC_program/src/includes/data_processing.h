#include <stdbool.h>

float get_SW_angle(int ADC_value);
float TP0_percentage(int ADC_value);
float TP1_percentage(int ADC_value);
bool TorqueSensorsOutOfRange(float TP_0_percentage, float TP_1_percentage);
float BP0_percentage(int ADC_value);
float BP1_percentage(int ADC_value);