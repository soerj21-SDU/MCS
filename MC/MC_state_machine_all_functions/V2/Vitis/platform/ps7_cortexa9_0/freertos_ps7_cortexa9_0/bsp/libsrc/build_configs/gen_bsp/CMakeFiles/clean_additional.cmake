# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Git\\GitHub\\MCS\\MC\\MC_state_machine_all_functions\\V2\\Vitis\\platform\\ps7_cortexa9_0\\freertos_ps7_cortexa9_0\\bsp\\include\\sleep.h"
  "C:\\Git\\GitHub\\MCS\\MC\\MC_state_machine_all_functions\\V2\\Vitis\\platform\\ps7_cortexa9_0\\freertos_ps7_cortexa9_0\\bsp\\include\\xiltimer.h"
  "C:\\Git\\GitHub\\MCS\\MC\\MC_state_machine_all_functions\\V2\\Vitis\\platform\\ps7_cortexa9_0\\freertos_ps7_cortexa9_0\\bsp\\include\\xtimer_config.h"
  "C:\\Git\\GitHub\\MCS\\MC\\MC_state_machine_all_functions\\V2\\Vitis\\platform\\ps7_cortexa9_0\\freertos_ps7_cortexa9_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
