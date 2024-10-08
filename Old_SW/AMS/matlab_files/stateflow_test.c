/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: stateflow_test.c
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

#include "stateflow_test.h"

/* Named constants for Chart: '<Root>/Chart' */
#define IN_Idle                        ((uint8_T)1U)
#define IN_Relay_ON                    ((uint8_T)2U)

/* Block signals and states (default storage) */
DW DW_l;

/* External inputs (root inport signals with default storage) */
ExtU U;

/* External outputs (root outports fed by signals with default storage) */
ExtY Y;

/* Real-time model */
RT_MODEL M_;
RT_MODEL *const M = &M_;

/* Model step function */
void Chart_step(void)
{
  /* Chart: '<Root>/Chart' incorporates:
   *  Inport: '<Root>/cmd_flags'
   */
  if (DW_l.is_active_c3_Chart == 0U) {
    DW_l.is_active_c3_Chart = 1U;
    DW_l.is_c3_Chart = IN_Idle;
  } else if (DW_l.is_c3_Chart == IN_Idle) {
    if (U.cmd_flags == 1) {
      DW_l.is_c3_Chart = IN_Relay_ON;
    } else {
      /* Outport: '<Root>/SC_enable' */
      Y.SC_enable = false;

      /* Outport: '<Root>/AIR_out' */
      Y.AIR_out = false;
    }
  } else {
    /* case IN_Relay_ON: */
    if (U.cmd_flags == 2) {
      DW_l.is_c3_Chart = IN_Idle;
    } else {
      /* Outport: '<Root>/SC_enable' */
      Y.SC_enable = true;

      /* Outport: '<Root>/AIR_out' */
      Y.AIR_out = true;
    }
  }

  /* End of Chart: '<Root>/Chart' */
}

/* Model initialize function */
void Chart_initialize(void)
{
  /* (no initialization code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
