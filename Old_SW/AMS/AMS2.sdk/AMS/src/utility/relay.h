/*
 * relay.h
 *
 *  Created on: 6. maj 2019
 *      Author: matt
 */

#ifndef RELAY_H_
#define RELAY_H_

#include "stdbool.h"
#include "xil_printf.h"

void relay_init();

bool Precharge_AUX();
bool AIRP_AUX();
bool AIRM_AUX();
bool TS_Indicator();
bool TSAL_Acc_TS_On();
bool TSAL_Relay_Detection();
uint8_t get_relay_out();

void Precharge_Control(bool assert);
void AIRP_Control(bool assert);
void AIRM_Control(bool assert);

#endif /* RELAY_H_ */
