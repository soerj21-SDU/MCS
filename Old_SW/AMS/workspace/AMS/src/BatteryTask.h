/*
 * BatteryTask.h
 *
 *  Created on: 6. maj 2019
 *      Author: matt
 */

#ifndef BATTERYTASK_H_
#define BATTERYTASK_H_

#include <Source/os.h>
#include <ucos_bsp.h>
#include "os.h"
#include "xil_printf.h"
#include "sleep.h"

#include "utility/LTC6813.h"
#include "global_variables.h"
#include "global_def.h"
#include "utility/pl_led.h"

void BatteryTask(void *arg);

#endif /* BATTERYTASK_H_ */
