# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Git\\GitHub\\MCS\\Drivers\\FreeRTOS\\Vitis\\platform_Standalone\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\sleep.h"
  "C:\\Git\\GitHub\\MCS\\Drivers\\FreeRTOS\\Vitis\\platform_Standalone\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xiltimer.h"
  "C:\\Git\\GitHub\\MCS\\Drivers\\FreeRTOS\\Vitis\\platform_Standalone\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xtimer_config.h"
  "C:\\Git\\GitHub\\MCS\\Drivers\\FreeRTOS\\Vitis\\platform_Standalone\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
