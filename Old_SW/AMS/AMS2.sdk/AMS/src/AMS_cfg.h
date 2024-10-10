/*
 * AMS_cfg.h
 *
 *  Created on: 5. jul. 2019
 *      Author: matt
 *
 *  This file contains project-wide configurations of all kinds.
 *  The intention is that all configuration happens here.
 */

#ifndef AMS_CFG_H_
#define AMS_CFG_H_

#include "os_cfg.h"

// Toggle discharge test that cyclicly enables discharge circuits (comment in/out)
//#define DISCHARGE_TEST

// Toggle cell simulation test (comment in/out)
//#define SIMULATION_TEST

// Default bank count. Changed by controller. To be only changed by hardware, software is too dangerous.
#define DEFAULT_BANK_COUNT 1

// The amount of time before a relay is expected to switch state
#define RELAY_DELAY_MS 300 // The delay in ms, default 300
#define RELAY_DELAY_TICKS RELAY_DELAY_MS*OS_CFG_TICK_RATE_HZ/1000 // The delay in OS ticks

// The amount of time before precharge times out
#define PRECHARGE_TIMEOUT_MS 5000 // Default 5000 = 5s
#define PRECHARGE_TIMEOUT_TICKS PRECHARGE_TIMEOUT_MS*OS_CFG_TICK_RATE_HZ/1000 // In OS ticks

// The amount of time before a shunt disconnect AMS errors
#define SHUNT_SAFETY_INTERVAL 500 // Unit ms
#define SHUNT_SAFETY_INTERVAL_TICKS SHUNT_SAFETY_INTERVAL*OS_CFG_TICK_RATE_HZ/1000 // Unit ticks

/// Task periodic loop time delay
// BatteryTask
#define BATTERYTASK_LOOP_TIME_MS 50 // Default 50
#define BATTERYTASK_LOOP_TIME_TICKS BATTERYTASK_LOOP_TIME_MS*OS_CFG_TICK_RATE_HZ/1000

// ControlTask
#define CONTROLTASK_LOOP_TIME_MS 100 // Default 50
#define CONTROLTASK_LOOP_TIME_TICKS CONTROLTASK_LOOP_TIME_MS*OS_CFG_TICK_RATE_HZ/1000

// ChargingTask
#define CHARGINGTASK_LOOP_TIME_MS 100 // Default 100
#define CHARGINGTASK_LOOP_TIME_TICKS CHARGINGTASK_LOOP_TIME_MS*OS_CFG_TICK_RATE_HZ/1000

// PeripheralsTask
#define PERIPHERALSTASK_LOOP_TIME_MS 1000 // Default 1000
#define PERIPHERALSTASK_LOOP_TIME_TICKS PERIPHERALSTASK_LOOP_TIME_MS*OS_CFG_TICK_RATE_HZ/1000

/// Physical values
#define VOLT_MAX 4170 // Unit mV
#define VOLT_CHARGE_LIMIT 4100 // Unit mV
#define VOLT_CHARGE_GOAL 4050 // Unit mV
#define VOLT_NOMINAL 3700 // Unit mV
#define VOLT_MIN 3030 // Unit mV

// The difference between the lowest voltage value and
// the lowest value that should be discharged during balancing
#define DISCHARGE_INTERVAL_MARGIN 10 // Unit mV

#define VOLT_SAFETY_INTERVAL 500 // Unit ms
#define VOLT_SAFETY_INTERVAL_TICKS VOLT_SAFETY_INTERVAL*OS_CFG_TICK_RATE_HZ/1000 // Unit ticks

#define TEMP_MAX 570 // Unit 0.1C
#define TEMP_CHARGE_MAX 420 // Unit 0.1C
#define TEMP_MIN 60 // Unit 0.1C
#define TEMP_SAFETY_INTERVAL 1000 // Unit ms
#define TEMP_SAFETY_INTERVAL_TICKS TEMP_SAFETY_INTERVAL*OS_CFG_TICK_RATE_HZ/1000 // Unit ticks

#define DISCHARGE_RESISTOR_TEMP_MAX 550 // Unit 0.1C

#endif /* AMS_CFG_H_ */
