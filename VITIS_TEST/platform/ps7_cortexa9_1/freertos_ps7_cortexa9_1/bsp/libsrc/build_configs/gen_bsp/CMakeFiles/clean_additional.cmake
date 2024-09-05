# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Software\\GitHub\\Software_Zynq-Based_Master_Controller\\VITIS_TEST\\platform\\ps7_cortexa9_1\\freertos_ps7_cortexa9_1\\bsp\\include\\sleep.h"
  "C:\\Software\\GitHub\\Software_Zynq-Based_Master_Controller\\VITIS_TEST\\platform\\ps7_cortexa9_1\\freertos_ps7_cortexa9_1\\bsp\\include\\xiltimer.h"
  "C:\\Software\\GitHub\\Software_Zynq-Based_Master_Controller\\VITIS_TEST\\platform\\ps7_cortexa9_1\\freertos_ps7_cortexa9_1\\bsp\\include\\xtimer_config.h"
  "C:\\Software\\GitHub\\Software_Zynq-Based_Master_Controller\\VITIS_TEST\\platform\\ps7_cortexa9_1\\freertos_ps7_cortexa9_1\\bsp\\lib\\libxiltimer.a"
  )
endif()
