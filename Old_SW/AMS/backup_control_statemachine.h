/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: control_statemachine.h
 *
 * Code generated for Simulink model 'Controller_statemachine'.
 *
 * Model version                  : 1.116
 * Simulink Coder version         : 9.3 (R2020a) 18-Nov-2019
 * C/C++ source code generated on : Wed Apr  1 11:27:36 2020
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. RAM efficiency
 *    3. Debugging
 *    4. MISRA C:2012 guidelines
 * Validation result: Not run
 */

#ifndef RTW_HEADER_control_statemachine_h_
#define RTW_HEADER_control_statemachine_h_
#include "../rtwtypes.h"
#ifndef Controller_statemachine_COMMON_INCLUDES_
# define Controller_statemachine_COMMON_INCLUDES_
#include "../rtwtypes.h"
#endif                            /* Controller_statemachine_COMMON_INCLUDES_ */

#include "../../global_def.h"

/* Model Code Variants */

/* Macros for accessing real-time model data structure */

/* Forward declaration for rtModel */
typedef struct tag_RTM RT_MODEL;

#ifndef DEFINED_TYPEDEF_FOR_e_relayStates_
#define DEFINED_TYPEDEF_FOR_e_relayStates_

typedef enum {
  OPEN = 0,                            /* Default value */
  CLOSED
} e_relayStates;

#endif

#ifndef DEFINED_TYPEDEF_FOR_e_AUXStatus_
#define DEFINED_TYPEDEF_FOR_e_AUXStatus_

typedef enum {
  OFF = 0,                             /* Default value */
  ONLY_M,
  ONLY_P,
  RUN,
  ONLY_PRE,
  PRECHARGE,
  PRE_AND_P,
  ALL
} e_AUXStatus;

#endif





/* Block signals and states (default storage) for system '<Root>' */
typedef struct {
  uint32_T previousTicks;              /* '<Root>/Control' */
  uint16_T temporalCounter_i1;         /* '<Root>/Control' */
  uint8_T is_c3_Controller_statemachine;/* '<Root>/Control' */
  uint8_T is_Race;                     /* '<Root>/Control' */
  uint8_T is_Precharge;                /* '<Root>/Control' */
  uint8_T is_Charging;                 /* '<Root>/Control' */
  uint8_T is_Precharge_g;              /* '<Root>/Control' */
  uint8_T is_End_Of_Charge;            /* '<Root>/Control' */
} DW;

/* External inputs (root inport signals with default storage) */
typedef struct {
  boolean_T AIR_m_AUX;                 /* '<Root>/Input1' */
  boolean_T AIR_p_AUX;                 /* '<Root>/Input2' */
  boolean_T PRE_AUX;                   /* '<Root>/Input3' */
  boolean_T SC_END;                    /* '<Root>/Input4' */
  real_T V_BAT;                        /* '<Root>/Input5' */
  real_T V_TS;                         /* '<Root>/Input6' */
  e_command_signals command;           /* '<Root>/Input7' */
  real_T TS_Current;                   /* '<Root>/Input8' */
  boolean_T AMS_lached;                /* '<Root>/Input' */
} ExtU;

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  boolean_T AIR_p_CTRL;                /* '<Root>/Out1' */
  boolean_T AIR_m_CTRL;                /* '<Root>/Out2' */
  boolean_T Pre_CTRL;                  /* '<Root>/Out3' */
  boolean_T SC_Enable;                 /* '<Root>/Out4' */
  boolean_T AMS_Error_CTRL;            /* '<Root>/AMS_Error_CTRL' */
  boolean_T Charger_current;           /* '<Root>/Charger_current' */
  uint16_T Error_code;                 /* '<Root>/Error_code' */
} ExtY;

/* Real-time Model Data Structure */
struct tag_RTM {
  DW *dwork;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
  } Timing;
};

/*
 * Exported Global Signals
 *
 * Note: Exported global signals are block signals with an exported global
 * storage class designation.  Code generation will declare the memory for
 * these signals and export their symbols.
 *
 */
extern ControlState_T Control_states;  /* '<Root>/Out5' */

/* Model entry point functions */
extern void Controller_statemachine_initialize(RT_MODEL *const M);
extern void Controller_statemachine_step(RT_MODEL *const M, ExtU *U, ExtY *Y);

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'Controller_statemachine'
 * '<S1>'   : 'Controller_statemachine/Control'
 */

/*-
 * Requirements for '<Root>': Controller_statemachine
 */
#endif                                 /* RTW_HEADER_control_statemachine_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
