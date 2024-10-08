/*
 * shutdown.h
 *
 *  Created on: 6. maj 2019
 *      Author: matt
 */

#ifndef SHUTDOWN_H_
#define SHUTDOWN_H_

#include "stdbool.h"

void shutdown_init();

bool IMD_Status();
bool IMD_Latched();
bool IMD_Data();
bool AMS_Latched();
bool SC_IN();
bool SC_HVDC_IL();
bool SC_IN_Again();
bool SC_END();
bool Latch_Reset();

void AMS_SC(bool ams_sc);
void EN_SC(bool en_sc);

#endif /* SHUTDOWN_H_ */
