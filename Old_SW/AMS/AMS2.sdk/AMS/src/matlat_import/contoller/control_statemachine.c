/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: control_statemachine.c
 *
 * Code generated for Simulink model 'Controller_statemachine'.
 *
 * Model version                  : 1.122
 * Simulink Coder version         : 9.3 (R2020a) 18-Nov-2019
 * C/C++ source code generated on : Thu Jun 11 09:09:30 2020
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

#include "control_statemachine.h"
//#include "rt_roundd.h"

/* Named constants for Chart: '<Root>/Control' */
#define IN_C_Close_AIR_m               ((uint8_T)1U)
#define IN_C_Close_AIR_p               ((uint8_T)2U)
#define IN_C_Close_Pre                 ((uint8_T)1U)
#define IN_C_Open_Pre                  ((uint8_T)3U)
#define IN_C_Precharnig                ((uint8_T)2U)
#define IN_Charge_Algortihm            ((uint8_T)4U)
#define IN_Charger_Error               ((uint8_T)1U)
#define IN_Charging                    ((uint8_T)2U)
#define IN_Close_AIR_m                 ((uint8_T)1U)
#define IN_Close_AIR_p                 ((uint8_T)1U)
#define IN_Close_Pre                   ((uint8_T)2U)
#define IN_Drive                       ((uint8_T)2U)
#define IN_End_Of_Charge               ((uint8_T)5U)
#define IN_Error                       ((uint8_T)3U)
#define IN_Idle                        ((uint8_T)4U)
#define IN_Init_charing                ((uint8_T)5U)
#define IN_Init_state                  ((uint8_T)6U)
#define IN_NO_ACTIVE_CHILD             ((uint8_T)0U)
#define IN_Open_Pre                    ((uint8_T)3U)
#define IN_Precharge                   ((uint8_T)4U)
#define IN_Precharge_m                 ((uint8_T)6U)
#define IN_Precharnig                  ((uint8_T)3U)
#define IN_Race                        ((uint8_T)7U)
#define IN_SC_enable                   ((uint8_T)8U)
#define IN_SC_enabled                  ((uint8_T)5U)
#define IN_TS_active                   ((uint8_T)6U)

/* Exported block signals */
//ControlState_T Control_states;         /* '<Root>/Out5' */

/* Forward declaration for local functions */
static uint8_T AUXStatus(boolean_T Pre, boolean_T plus, boolean_T minus);
static void SetError(uint16_T error, ExtY *Y);
static void Charging(ExtU *U, ExtY *Y, DW *DW_l);
static void Race(ExtU *U, ExtY *Y, DW *DW_l);

/* Function for Chart: '<Root>/Control' */
static uint8_T AUXStatus(boolean_T Pre, boolean_T plus, boolean_T minus)
{
  uint8_T status;
  boolean_T aVarTruthTableCondition_1;
  boolean_T aVarTruthTableCondition_2;
  boolean_T aVarTruthTableCondition_3;
  boolean_T tmp;
  boolean_T tmp_0;
  boolean_T tmp_1;
  boolean_T tmp_2;
  status = 0U;

  /*  AIR- on  */
  aVarTruthTableCondition_1 = !minus;

  /*  AIR+ on  */
  aVarTruthTableCondition_2 = !plus;

  /*  PreCharge on  */
  aVarTruthTableCondition_3 = !Pre;
  tmp = !aVarTruthTableCondition_2;
  tmp_0 = !aVarTruthTableCondition_3;
  tmp_1 = !aVarTruthTableCondition_1;
  tmp_2 = (tmp_1 && tmp);
  if ((!tmp_2) || (!tmp_0)) {
    tmp = (aVarTruthTableCondition_1 && tmp);
    if (tmp && tmp_0) {
      /*  'A2':Status = ONLY_m  */
      status = 1U;
    } else {
      tmp_1 = (tmp_1 && aVarTruthTableCondition_2);
      if (tmp_1 && tmp_0) {
        /*  'A3':Status= ONLY_p  */
        status = 2U;
      } else {
        aVarTruthTableCondition_1 = (aVarTruthTableCondition_1 &&
          aVarTruthTableCondition_2);
        if (aVarTruthTableCondition_1 && tmp_0) {
          /*  'A4':Status = RUN  */
          status = 3U;
        } else if (tmp_2 && aVarTruthTableCondition_3) {
          /*  'A5':Status = ONLY_P  */
          status = 4U;
        } else if (tmp && aVarTruthTableCondition_3) {
          /*  'A6':Status=Precharnig  */
          status = 5U;
        } else if (tmp_1 && aVarTruthTableCondition_3) {
          /*  'A7':Status=PRE_AND_P  */
          status = 6U;
        } else {
          if (aVarTruthTableCondition_1 && aVarTruthTableCondition_3) {
            /*  'A8':Status = ALL  */
            status = 7U;
          }
        }
      }
    }
  } else {
    /*  'A1':Status = off  */
  }

  return status;
}

/*
 * Function for Chart: '<Root>/Control'
 * function SetError(error)
 * Matlab lanauge does not support << operator. In C this would be
 *  Error_code = ErrorCode | (1<<error)
 */
static void SetError(uint16_T error, ExtY *Y)
{
	 /* Outport: '<Root>/Error_code' */
		  Y->Error_code |= (1<<error);
}

/* Function for Chart: '<Root>/Control' */
static void Charging(ExtU *U, ExtY *Y, DW *DW_l)
{
  boolean_T guard1 = false;

  /* Inport: '<Root>/Input4' */
  if ((U->SC_END ? 1 : 0) == ((int32_T)OPEN)) {
    SetError((uint16_T)E_AMS_SC_BROKEN, Y);
    DW_l->is_Precharge_g = IN_NO_ACTIVE_CHILD;
    DW_l->is_Charging = IN_NO_ACTIVE_CHILD;
    DW_l->is_c3_Controller_statemachine = IN_Charger_Error;

    /* Outport: '<Root>/Out5' */
    Control_states = ControlState_T_Charger_Error;

    /* Outport: '<Root>/AMS_Error_CTRL' */
    Y->AMS_Error_CTRL = true;
  } else {
    guard1 = false;
    switch (DW_l->is_Charging) {
     case IN_C_Close_AIR_m:
      if (((int32_T)DW_l->temporalCounter_i1) >= 100) {
    	  UCOS_Printf("Controller: BAT Voltage: %d mV    TS Voltage: %d mV \r\n",U->V_BAT,U->V_TS); // DEBUG
        if (U->V_BAT > U->V_TS-CHARGE_VOLTAGE_SAFETY_MARGIN) {
          SetError((uint16_T)E_AMS_UNFIT_CHARGE_VOLTAGE, Y);
          guard1 = true;
        } else if (((int32_T)AUXStatus(U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) ==
                   ((int32_T)ONLY_M)) {
          DW_l->is_Charging = IN_Precharge_m;
          DW_l->is_Precharge_g = IN_C_Close_Pre;
          DW_l->temporalCounter_i1 = 0U;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_C_Close_Pre;

          /* Outport: '<Root>/Out3' */
          Y->Pre_CTRL = true;
        } else {
          SetError((uint16_T)E_AMS_UNABLE_TO_CLOSE_AIR_M, Y);
          guard1 = true;
        }
      }
      break;

     case IN_C_Close_AIR_p:
      if (((int32_T)DW_l->temporalCounter_i1) >= 100) {
        /* Inport: '<Root>/Input3' incorporates:
         *  Inport: '<Root>/Input1'
         *  Inport: '<Root>/Input2'
         */
        if (((int32_T)AUXStatus(U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) ==
            ((int32_T)ALL)) {
          DW_l->is_Charging = IN_C_Open_Pre;
          DW_l->temporalCounter_i1 = 0U;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_C_Open_Pre;

          /* Outport: '<Root>/Out3' */
          Y->Pre_CTRL = false;
        } else {
          SetError((uint16_T)E_AMS_UNABLE_TO_CLOSE_AIR_P, Y);
          DW_l->is_Charging = IN_NO_ACTIVE_CHILD;
          DW_l->is_c3_Controller_statemachine = IN_Charger_Error;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_Charger_Error;

          /* Outport: '<Root>/AMS_Error_CTRL' */
          Y->AMS_Error_CTRL = true;
        }
      }
      break;

     case IN_C_Open_Pre:
      if (((int32_T)DW_l->temporalCounter_i1) >= 100) {
        /* Inport: '<Root>/Input3' incorporates:
         *  Inport: '<Root>/Input1'
         *  Inport: '<Root>/Input2'
         */
        if (((int32_T)AUXStatus(U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) ==
            ((int32_T)RUN)) {
          DW_l->is_Charging = IN_Charge_Algortihm;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_Charge_Algortihm;
        } else {
          SetError((uint16_T)E_AMS_UNABLE_TO_OPEN_PRE, Y);
          DW_l->is_Charging = IN_NO_ACTIVE_CHILD;
          DW_l->is_c3_Controller_statemachine = IN_Charger_Error;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_Charger_Error;

          /* Outport: '<Root>/AMS_Error_CTRL' */
          Y->AMS_Error_CTRL = true;
        }
      }
      break;

     case IN_Charge_Algortihm:
      /* Inport: '<Root>/Input7' */
      if ((U->command == Charge_STOP) || (U->command == Charge_COMPLETE)) {
        DW_l->is_Charging = IN_End_Of_Charge;

        /*  Set SOC =100
           You could just take
           The SC */
        DW_l->temporalCounter_i1 = 0U;

        /* Outport: '<Root>/Out5' */
        Control_states = ControlState_T_C_Open_AIR_p_and_m;

        /* Outport: '<Root>/Out1' */
        Y->AIR_p_CTRL = false;

        /* Outport: '<Root>/Out2' */
        Y->AIR_m_CTRL = false;

        /* Outport: '<Root>/Charger_current' */
        Y->Charger_current = true;
      }

      /* End of Inport: '<Root>/Input7' */
      break;

     case IN_End_Of_Charge:
      if (((int32_T)DW_l->temporalCounter_i1) >= 100) {
        /* Inport: '<Root>/Input3' incorporates:
         *  Inport: '<Root>/Input1'
         *  Inport: '<Root>/Input2'
         */
        if (((int32_T)AUXStatus(U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) ==
            ((int32_T)OFF)) {
          DW_l->is_Charging = IN_NO_ACTIVE_CHILD;
          DW_l->is_c3_Controller_statemachine = IN_Idle;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_Idle;

          /* Outport: '<Root>/Error_code' */
          Y->Error_code = 0U;
        } else {
          SetError((uint16_T)E_AMS_UNABLE_TO_OPEN_AIR_P, Y);
          DW_l->is_Charging = IN_NO_ACTIVE_CHILD;
          DW_l->is_c3_Controller_statemachine = IN_Charger_Error;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_Charger_Error;

          /* Outport: '<Root>/AMS_Error_CTRL' */
          Y->AMS_Error_CTRL = true;
        }
      }
      break;

     default:
      /* case IN_Precharge: */
      if (((uint32_T)DW_l->is_Precharge_g) == IN_C_Close_Pre) {
        if (((uint32_T)DW_l->temporalCounter_i1) >= 100U) {
          /* Inport: '<Root>/Input3' incorporates:
           *  Inport: '<Root>/Input1'
           *  Inport: '<Root>/Input2'
           */
          if (((int32_T)AUXStatus(U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) ==
              ((int32_T)PRECHARGE)) {
            DW_l->is_Precharge_g = IN_C_Precharnig;
            DW_l->temporalCounter_i1 = 0U;

            /* Outport: '<Root>/Out5' */
            Control_states = ControlState_T_C_Precharnig;
          } else {
            SetError((uint16_T)E_AMS_UNABLE_TO_CLOSE_PRE, Y);
            DW_l->is_Precharge_g = IN_NO_ACTIVE_CHILD;
            DW_l->is_Charging = IN_NO_ACTIVE_CHILD;
            DW_l->is_c3_Controller_statemachine = IN_Charger_Error;

            /* Outport: '<Root>/Out5' */
            Control_states = ControlState_T_Charger_Error;

            /* Outport: '<Root>/AMS_Error_CTRL' */
            Y->AMS_Error_CTRL = true;
          }
        }
      } else {
        /* Inport: '<Root>/Input6' incorporates:
         *  Inport: '<Root>/Input5'
         */
        /* case IN_C_Precharnig: */
        if (U->V_TS > (0.95 * U->V_BAT)) {
          DW_l->is_Precharge_g = IN_NO_ACTIVE_CHILD;
          DW_l->is_Charging = IN_C_Close_AIR_p;
          DW_l->temporalCounter_i1 = 0U;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_C_Close_AIR_p;

          /* Outport: '<Root>/Out1' */
          Y->AIR_p_CTRL = true;
        } else {
          if (((uint32_T)DW_l->temporalCounter_i1) >= 500U) {
            SetError((uint16_T)E_AMS_PRE_TIMEOUT, Y);
            DW_l->is_Precharge_g = IN_NO_ACTIVE_CHILD;
            DW_l->is_Charging = IN_NO_ACTIVE_CHILD;
            DW_l->is_c3_Controller_statemachine = IN_Charger_Error;

            /* Outport: '<Root>/Out5' */
            Control_states = ControlState_T_Charger_Error;

            /* Outport: '<Root>/AMS_Error_CTRL' */
            Y->AMS_Error_CTRL = true;
          }
        }

        /* End of Inport: '<Root>/Input6' */
      }
      break;
    }

    if (guard1) {
      DW_l->is_Charging = IN_NO_ACTIVE_CHILD;
      DW_l->is_c3_Controller_statemachine = IN_Charger_Error;

      /* Outport: '<Root>/Out5' */
      Control_states = ControlState_T_Charger_Error;

      /* Outport: '<Root>/AMS_Error_CTRL' */
      Y->AMS_Error_CTRL = true;
    }
  }

  /* End of Inport: '<Root>/Input4' */
}

/* Function for Chart: '<Root>/Control' */
static void Race(ExtU *U, ExtY *Y, DW *DW_l)
{
  boolean_T guard1 = false;

  /* Inport: '<Root>/Input4' */
  if ((U->SC_END ? 1 : 0) == ((int32_T)OPEN)) {
    SetError((uint16_T)E_AMS_SC_BROKEN, Y);
    DW_l->is_Precharge = IN_NO_ACTIVE_CHILD;
    DW_l->is_Race = IN_NO_ACTIVE_CHILD;
    DW_l->is_c3_Controller_statemachine = IN_Error;

    /* Outport: '<Root>/Out5' */
    Control_states = ControlState_T_Error;

    /* Outport: '<Root>/AMS_Error_CTRL' */
    Y->AMS_Error_CTRL = true;
  } else {
    guard1 = false;
    switch (DW_l->is_Race) {
     case IN_Close_AIR_p:
      if (((int32_T)DW_l->temporalCounter_i1) >= 100) {
        /* Inport: '<Root>/Input3' incorporates:
         *  Inport: '<Root>/Input1'
         *  Inport: '<Root>/Input2'
         */
        if (((int32_T)AUXStatus(U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) ==
            ((int32_T)ALL)) {
          DW_l->is_Race = IN_Open_Pre;
          DW_l->temporalCounter_i1 = 0U;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_Open_Pre;

          /* Outport: '<Root>/Out3' */
          Y->Pre_CTRL = false;
        } else {
          SetError((uint16_T)E_AMS_UNABLE_TO_CLOSE_AIR_P, Y);
          DW_l->is_Race = IN_NO_ACTIVE_CHILD;
          DW_l->is_c3_Controller_statemachine = IN_Error;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_Error;

          /* Outport: '<Root>/AMS_Error_CTRL' */
          Y->AMS_Error_CTRL = true;
        }
      }
      break;

     case IN_Drive:
      /* Inport: '<Root>/Input3' incorporates:
       *  Inport: '<Root>/Input1'
       *  Inport: '<Root>/Input2'
       */
      if (((int32_T)AUXStatus(U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) !=
          ((int32_T)RUN)) {
        SetError((uint16_T)E_AMS_RELAY_FAIELD, Y);
        DW_l->is_Race = IN_NO_ACTIVE_CHILD;
        DW_l->is_c3_Controller_statemachine = IN_Error;

        /* Outport: '<Root>/Out5' */
        Control_states = ControlState_T_Error;

        /* Outport: '<Root>/AMS_Error_CTRL' */
        Y->AMS_Error_CTRL = true;
      }
      break;

     case IN_Open_Pre:
      if (((int32_T)DW_l->temporalCounter_i1) >= 100) {
        /* Inport: '<Root>/Input3' incorporates:
         *  Inport: '<Root>/Input1'
         *  Inport: '<Root>/Input2'
         */
        if (((int32_T)AUXStatus(U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) ==
            ((int32_T)RUN)) {
          DW_l->is_Race = IN_TS_active;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_TS_active;
        } else {
          SetError((uint16_T)E_AMS_UNABLE_TO_OPEN_PRE, Y);
          DW_l->is_Race = IN_NO_ACTIVE_CHILD;
          DW_l->is_c3_Controller_statemachine = IN_Error;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_Error;

          /* Outport: '<Root>/AMS_Error_CTRL' */
          Y->AMS_Error_CTRL = true;
        }
      }
      break;

     case IN_Precharge:
      switch (DW_l->is_Precharge) {
       case IN_Close_AIR_m:
        if (((int32_T)DW_l->temporalCounter_i1) >= 100) {
          /* Inport: '<Root>/Input3' incorporates:
           *  Inport: '<Root>/Input1'
           *  Inport: '<Root>/Input2'
           */
          if (((int32_T)AUXStatus(U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) ==
              ((int32_T)ONLY_M)) {
            DW_l->is_Precharge = IN_Close_Pre;
            DW_l->temporalCounter_i1 = 0U;

            /* Outport: '<Root>/Out5' */
            Control_states = ControlState_T_Close_Pre;

            /* Outport: '<Root>/Out3' */
            Y->Pre_CTRL = true;
          } else {
            SetError((uint16_T)E_AMS_UNABLE_TO_CLOSE_AIR_M, Y);
            DW_l->is_Precharge = IN_NO_ACTIVE_CHILD;
            DW_l->is_Race = IN_NO_ACTIVE_CHILD;
            DW_l->is_c3_Controller_statemachine = IN_Error;

            /* Outport: '<Root>/Out5' */
            Control_states = ControlState_T_Error;

            /* Outport: '<Root>/AMS_Error_CTRL' */
            Y->AMS_Error_CTRL = true;
          }
        }
        break;

       case IN_Close_Pre:
        if (((uint32_T)DW_l->temporalCounter_i1) >= 100U) {
          /* Inport: '<Root>/Input3' incorporates:
           *  Inport: '<Root>/Input1'
           *  Inport: '<Root>/Input2'
           */
          if (((int32_T)AUXStatus(U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) ==
              ((int32_T)PRECHARGE)) {
            DW_l->is_Precharge = IN_Precharnig;
            DW_l->temporalCounter_i1 = 0U;

            /* Outport: '<Root>/Out5' */
            Control_states = ControlState_T_Precharnig;
          } else {
            SetError((uint16_T)E_AMS_UNABLE_TO_CLOSE_PRE, Y);
            DW_l->is_Precharge = IN_NO_ACTIVE_CHILD;
            DW_l->is_Race = IN_NO_ACTIVE_CHILD;
            DW_l->is_c3_Controller_statemachine = IN_Error;

            /* Outport: '<Root>/Out5' */
            Control_states = ControlState_T_Error;

            /* Outport: '<Root>/AMS_Error_CTRL' */
            Y->AMS_Error_CTRL = true;
          }
        }
        break;

       default:
        /* Inport: '<Root>/Input6' incorporates:
         *  Inport: '<Root>/Input5'
         */
        /* case IN_Precharnig: */
        if (U->V_TS > (0.95 * U->V_BAT)) {
          DW_l->is_Precharge = IN_NO_ACTIVE_CHILD;
          DW_l->is_Race = IN_Close_AIR_p;
          DW_l->temporalCounter_i1 = 0U;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_Close_AIR_p;

          /* Outport: '<Root>/Out1' */
          Y->AIR_p_CTRL = true;
        } else {
          if (((uint32_T)DW_l->temporalCounter_i1) >= 500U) {
            SetError((uint16_T)E_AMS_PRE_TIMEOUT, Y);
            DW_l->is_Precharge = IN_NO_ACTIVE_CHILD;
            DW_l->is_Race = IN_NO_ACTIVE_CHILD;
            DW_l->is_c3_Controller_statemachine = IN_Error;

            /* Outport: '<Root>/Out5' */
            Control_states = ControlState_T_Error;

            /* Outport: '<Root>/AMS_Error_CTRL' */
            Y->AMS_Error_CTRL = true;
          }
        }

        /* End of Inport: '<Root>/Input6' */
        break;
      }
      break;

     case IN_SC_enabled:
      /* Inport: '<Root>/Input7' */
      if (U->command == ACTIVATE_TS) {
        DW_l->is_Race = IN_Precharge;
        DW_l->is_Precharge = IN_Close_AIR_m;
        DW_l->temporalCounter_i1 = 0U;

        /* Outport: '<Root>/Out5' */
        Control_states = ControlState_T_Close_AIR_m;

        /* Outport: '<Root>/Out2' */
        Y->AIR_m_CTRL = true;
      }
      break;

     default:
      /* case IN_TS_active: */
      if (((int32_T)AUXStatus(U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) !=
          ((int32_T)RUN)) {
        SetError((uint16_T)E_AMS_RELAY_FAIELD, Y);
        guard1 = true;
      } else if (U->TS_Current > 0.0) {
        SetError((uint16_T)E_AMS_UNEXCEPTED_TS_CURRENT, Y);
        guard1 = true;
      } else {
        /* Inport: '<Root>/Input7' */
        if (U->command == DRIVE) {
          DW_l->is_Race = IN_Drive;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_Drive;
        }
      }
      break;
    }

    if (guard1) {
      DW_l->is_Race = IN_NO_ACTIVE_CHILD;
      DW_l->is_c3_Controller_statemachine = IN_Error;

      /* Outport: '<Root>/Out5' */
      Control_states = ControlState_T_Error;

      /* Outport: '<Root>/AMS_Error_CTRL' */
      Y->AMS_Error_CTRL = true;
    }
  }

  /* End of Inport: '<Root>/Input4' */
}

/* Model step function */
void Controller_statemachine_step(RT_MODEL *const M, ExtU *U, ExtY *Y)
{
  DW *DW_l = ((DW *) M->dwork);
  uint32_T elapsedTicks;

  /* Chart: '<Root>/Control' incorporates:
   *  Inport: '<Root>/Input'
   *  Inport: '<Root>/Input1'
   *  Inport: '<Root>/Input2'
   *  Inport: '<Root>/Input3'
   *  Inport: '<Root>/Input4'
   *  Inport: '<Root>/Input7'
   */
  elapsedTicks = M->Timing.clockTick0 - DW_l->previousTicks;
  DW_l->previousTicks = M->Timing.clockTick0;
  if ((((uint32_T)DW_l->temporalCounter_i1) + elapsedTicks) <= 32767U) {
    DW_l->temporalCounter_i1 = (uint16_T)(((uint32_T)DW_l->temporalCounter_i1) +
      elapsedTicks);
  } else {
    DW_l->temporalCounter_i1 = 32767U;
  }

  switch (DW_l->is_c3_Controller_statemachine) {
   case IN_Charger_Error:
    if (!U->AMS_lached) {
      DW_l->is_c3_Controller_statemachine = IN_Idle;

      /* Outport: '<Root>/Out5' */
      Control_states = ControlState_T_Idle;

      /* Outport: '<Root>/Error_code' */
      Y->Error_code = 0U;
    } else {
      /* Outport: '<Root>/Out2' */
      Y->AIR_m_CTRL = false;

      /* Outport: '<Root>/Out3' */
      Y->Pre_CTRL = false;

      /* Outport: '<Root>/Out1' */
      Y->AIR_p_CTRL = false;

      /* Outport: '<Root>/Out4' */
      Y->SC_Enable = false;

      /* Outport: '<Root>/AMS_Error_CTRL' */
      Y->AMS_Error_CTRL = false;

      /* Outport: '<Root>/Charger_current' */
      Y->Charger_current = true;
    }
    break;

   case IN_Charging:
    Charging(U, Y, DW_l);
    break;

   case IN_Error:
    if (!U->AMS_lached) {
      DW_l->is_c3_Controller_statemachine = IN_Idle;

      /* Outport: '<Root>/Out5' */
      Control_states = ControlState_T_Idle;

      /* Outport: '<Root>/Error_code' */
      Y->Error_code = 0U;
    } else {
      /* Outport: '<Root>/Out2' */
      Y->AIR_m_CTRL = false;

      /* Outport: '<Root>/Out3' */
      Y->Pre_CTRL = false;

      /* Outport: '<Root>/Out1' */
      Y->AIR_p_CTRL = false;

      /* Outport: '<Root>/Out4' */
      Y->SC_Enable = false;

      /* Outport: '<Root>/AMS_Error_CTRL' */
      Y->AMS_Error_CTRL = false;
    }
    break;

   case IN_Idle:
    switch (U->command) {
     case ENABLE_SC:
      DW_l->is_c3_Controller_statemachine = IN_SC_enable;
      DW_l->temporalCounter_i1 = 0U;

      /* Outport: '<Root>/Out5' */
      Control_states = ControlState_T_SC_enable;

      /* Outport: '<Root>/Out4' */
      Y->SC_Enable = true;

      /* Outport: '<Root>/Charger_current' */
      Y->Charger_current = true;
      break;

     case Charge_Start:
      DW_l->is_c3_Controller_statemachine = IN_Init_charing;
      DW_l->temporalCounter_i1 = 0U;

      /* Outport: '<Root>/Out5' */
      Control_states = ControlState_T_Init_charing;

      /* Outport: '<Root>/Out4' */
      Y->SC_Enable = true;
      break;

     default:
      /* Outport: '<Root>/Out2' */
      Y->AIR_m_CTRL = false;

      /* Outport: '<Root>/Out3' */
      Y->Pre_CTRL = false;

      /* Outport: '<Root>/Out1' */
      Y->AIR_p_CTRL = false;

      /* Outport: '<Root>/Out4' */
      Y->SC_Enable = false;

      /* Outport: '<Root>/AMS_Error_CTRL' */
      Y->AMS_Error_CTRL = false;

      /* Outport: '<Root>/Charger_current' */
      Y->Charger_current = false;
      break;
    }
    break;

   case IN_Init_charing:
    if (((uint32_T)DW_l->temporalCounter_i1) >= 100U) {
      if ((U->SC_END ? 1 : 0) == ((int32_T)CLOSED)) {
        DW_l->is_c3_Controller_statemachine = IN_Charging;
        DW_l->is_Charging = IN_C_Close_AIR_m;
        DW_l->temporalCounter_i1 = 0U;

        /* Outport: '<Root>/Out5' */
        Control_states = ControlState_T_C_Close_AIR_m;

        /* Outport: '<Root>/Out2' */
        Y->AIR_m_CTRL = true;
      } else {
        if (((U->SC_END ? 1 : 0) == ((int32_T)OPEN)) || (((int32_T)AUXStatus
              (U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) != ((int32_T)OFF))) {
          SetError((uint16_T)E_AMS_UNABLE_TO_CLOSE_SC, Y);
          DW_l->is_c3_Controller_statemachine = IN_Charger_Error;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_Charger_Error;

          /* Outport: '<Root>/AMS_Error_CTRL' */
          Y->AMS_Error_CTRL = true;
        }
      }
    }
    break;

   case IN_Init_state:
    if (((uint32_T)DW_l->temporalCounter_i1) >= 100U) {
      DW_l->is_c3_Controller_statemachine = IN_Idle;

      /* Outport: '<Root>/Out5' */
      Control_states = ControlState_T_Idle;

      /* Outport: '<Root>/Error_code' */
      Y->Error_code = 0U;
    }
    break;

   case IN_Race:
    Race(U, Y, DW_l);
    break;

   default:
    /* case IN_SC_enable: */
    if (((uint32_T)DW_l->temporalCounter_i1) >= 100U) {
      if (((U->SC_END ? 1 : 0) == ((int32_T)OPEN)) || (((int32_T)AUXStatus
            (U->PRE_AUX, U->AIR_p_AUX, U->AIR_m_AUX)) != ((int32_T)OFF))) {
        SetError((uint16_T)E_AMS_UNABLE_TO_CLOSE_SC, Y);
        DW_l->is_c3_Controller_statemachine = IN_Error;

        /* Outport: '<Root>/Out5' */
        Control_states = ControlState_T_Error;

        /* Outport: '<Root>/AMS_Error_CTRL' */
        Y->AMS_Error_CTRL = true;
      } else {
        if ((U->SC_END ? 1 : 0) == ((int32_T)CLOSED)) {
          DW_l->is_c3_Controller_statemachine = IN_Race;
          DW_l->is_Race = IN_SC_enabled;

          /* Outport: '<Root>/Out5' */
          Control_states = ControlState_T_SC_enabled;
        }
      }
    }
    break;
  }

  /* End of Chart: '<Root>/Control' */

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The resolution of this integer timer is 0.01, which is the step size
   * of the task. Size of "clockTick0" ensures timer will not overflow during the
   * application lifespan selected.
   */
  M->Timing.clockTick0++;
}

/* Model initialize function */
void Controller_statemachine_initialize(RT_MODEL *const M)
{
  DW *DW_l = ((DW *) M->dwork);

  /* Chart: '<Root>/Control' */
  DW_l->is_c3_Controller_statemachine = IN_Init_state;

  /* Outport: '<Root>/Out5' incorporates:
   *  Chart: '<Root>/Control'
   * */
  Control_states = ControlState_T_Init_state;

  /* Enable for Chart: '<Root>/Control' */
  DW_l->previousTicks = M->Timing.clockTick0;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
