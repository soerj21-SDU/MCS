/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: stateflow_test.h
 *
 * Code generated for Simulink model 'Chart'.
 *
 * Model version                  : 1.3
 * Simulink Coder version         : 9.2 (R2019b) 18-Jul-2019
 * C/C++ source code generated on : Thu Mar 19 20:20:25 2020
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives:
 *    1. Debugging
 *    2. MISRA C:2012 guidelines
 *    3. Execution efficiency
 * Validation result: Not run
 */

#ifndef RTW_HEADER_stateflow_test_h_
#define RTW_HEADER_stateflow_test_h_
#ifndef Chart_COMMON_INCLUDES_
# define Chart_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* Chart_COMMON_INCLUDES_ */

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* Forward declaration for rtModel */
typedef struct tag_RTM RT_MODEL;

/* Block signals and states (default storage) for system '<Root>' */
typedef struct {
  uint8_T is_active_c3_Chart;          /* '<Root>/Chart' */
  uint8_T is_c3_Chart;                 /* '<Root>/Chart' */
} DW;

/* External inputs (root inport signals with default storage) */
typedef struct {
  uint8_T cmd_flags;                   /* '<Root>/cmd_flags' */
} ExtU;

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  boolean_T AIR_out;                   /* '<Root>/AIR_out' */
  boolean_T SC_enable;                 /* '<Root>/SC_enable' */
} ExtY;

/* Real-time Model Data Structure */
struct tag_RTM {
  const char_T * volatile errorStatus;
};

/* Block signals and states (default storage) */
extern DW DW_l;

/* External inputs (root inport signals with default storage) */
extern ExtU U;

/* External outputs (root outports fed by signals with default storage) */
extern ExtY Y;

/* Model entry point functions */
extern void Chart_initialize(void);
extern void Chart_step(void);

/* Real-time Model object */
extern RT_MODEL *const M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Note that this particular code originates from a subsystem build,
 * and has its own system numbers different from the parent model.
 * Refer to the system hierarchy for this subsystem below, and use the
 * MATLAB hilite_system command to trace the generated code back
 * to the parent model.  For example,
 *
 * hilite_system('embedded_test2/Chart')    - opens subsystem embedded_test2/Chart
 * hilite_system('embedded_test2/Chart/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'embedded_test2'
 * '<S1>'   : 'embedded_test2/Chart'
 */
#endif                                 /* RTW_HEADER_stateflow_test_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
