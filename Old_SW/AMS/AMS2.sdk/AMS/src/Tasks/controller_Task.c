/*
 * test_Task.c
 *
 *  Created on: Mar 18, 2020
 *      Author: soeren
 */

#include "controller_Task.h"

#include "../matlat_import/contoller/control_statemachine.h"
#include "os.h"
#include "../utility/relay.h"
#include "../utility/shutdown.h"

#include "../global_def.h"


OS_ERR create_controller_task()
{
	OS_ERR err;

    OSTaskCreate(&Controller_Task_TCB,
                 "State machine test Task",
				 controller_task,
				 0,          				//argument for task. None for the moment
				 TEST_TASK_PRIO,
				 &Test_TaskStk[0],
				 TEST_TASK_STK_SIZE/10,
				 TEST_TASK_STK_SIZE,
				 TEST_TASK_MSGQ_SIZE,
				 0,
				 DEF_NULL,
				 (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR), //stack checking and stack clearing options
				 &err);

    return err;

}

// DEBUG ONLY FUNCTION
bool controller_in_charnig_states()
{
	bool returnvalue = false;
	if(Control_states == ControlState_T_Charge_Algortihm ||
			Control_states == ControlState_T_Charging_CC ||
			Control_states == ControlState_T_Charging_CV ||
			Control_states == ControlState_T_Charging_Discharge||
			Control_states == ControlState_T_Charging_Wating_DIS ||
			Control_states == ControlState_T_Charging_closeing_AIR)
	{
		returnvalue = true;
	}
	return returnvalue;
}
void controller_task(void *arg){

	//UCOS_Printf("Test task started \r\n");

	// Local instance of Model
	RT_MODEL controller_instance;
	ExtU controller_input;
	ExtY controller_output;

	Controller_statemachine_initialize(&controller_instance);


	OS_ERR os_err;
	while(1)
	{
		OSTimeDlyHMSM(0,0,0,20,OS_OPT_TIME_HMSM_STRICT,&os_err); // delay 10ms


		// Mutexes
		OSMutexPend(&g_mutex_status_block,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		OSMutexPend(&g_mutex_TS_block,0,OS_OPT_PEND_BLOCKING,0,&os_err);

		// Prepare inputs
		controller_input.AIR_p_AUX = AIRP_AUX();
		controller_input.AIR_m_AUX= AIRM_AUX();
		controller_input.PRE_AUX=Precharge_AUX();
		controller_input.SC_END = SC_END();
		controller_input.V_BAT =  g_BAT_voltage; // g_BAT_voltage // TEST CONDETIONS = 400;
		controller_input.V_TS = g_TS_voltage; // g_TS_voltage
		controller_input.TS_Current = 0;
		controller_input.AMS_lached= AMS_Latched();
		
		//UCOS_Printf("Controller Task: BAT Voltage: %d mV    TS Voltage: %d mV \r\n",controller_input.V_BAT,controller_input.V_TS);

		uint16_t command_length;
		uint16_t *command = OSTaskQPend(0,OS_OPT_PEND_NON_BLOCKING,&command_length,NULL,&os_err); // NOT BLOCKING
		if(os_err == OS_ERR_NONE) // A message has been recived
		{
			controller_input.command = *command;
		}
		else
		{
			controller_input.command = NON;
		}


		//controller_input.command = command_signal;
		Controller_statemachine_step(&controller_instance,&controller_input,&controller_output);

		//Decode output:
		if(controller_in_charnig_states())
		{
			switch (charging_state) {
				case IDLE:
					Control_states = ControlState_T_Charge_Algortihm;
					break;
				case CHARGING_CC:
					Control_states = ControlState_T_Charging_CC;
					break;
				case CHARGING_CV:
					Control_states = ControlState_T_Charging_CV;
					break;
				case DISCHARGING:
					Control_states = ControlState_T_Charging_Discharge;
					break;
				case WAIT_FOR_DISCHARGE_TEMP:
					Control_states = ControlState_T_Charging_Wating_DIS;
					break;
				case CLOSE_AIRP:
					Control_states = ControlState_T_Charging_closeing_AIR;
					break;
				default:
					UCOS_Printf("Unknown");
					break;
			}
		}

		if(!controller_in_charnig_states())
		{
			AIRM_Control(controller_output.AIR_m_CTRL);
			AIRP_Control(controller_output.AIR_p_CTRL);
			Precharge_Control(controller_output.Pre_CTRL);
		}

		EN_SC(controller_output.SC_Enable);
		AMS_SC(controller_output.AMS_Error_CTRL);
		Control_Errors=controller_output.Error_code;
		g_charge_control = (uint8_t)controller_output.Charger_current; //  TODO wRONG NAMEING BY MATLAB

		if(Control_Errors !=0)
		{
			// Translate controller error code to normal numbers.
			uint8_t error_code = controllerTask_translate_errorCode(Control_Errors);
		OSTaskQPost(&CAN_TX_TCB,
				&error_code,
				sizeof(error_code),
				OS_OPT_POST_FIFO,
				&os_err);
		}



		OSMutexPost(&g_mutex_TS_block,OS_OPT_POST_NONE,&os_err);
		OSMutexPost(&g_mutex_status_block,OS_OPT_POST_NONE,&os_err);
		//controller_input.command



	}

}

uint8_t controllerTask_translate_errorCode(uint16_t control_error_code)
{
	uint8_t error_code=0;
    if(control_error_code & (1<<E_AMS_UNABLE_TO_CLOSE_AIR_M)) error_code=10;
    if(control_error_code & (1<<E_AMS_UNABLE_TO_CLOSE_PRE)) error_code=14;
    if(control_error_code & (1<<E_AMS_UNABLE_TO_CLOSE_AIR_P)) error_code=12;
    if(control_error_code & (1<<E_AMS_RELAY_FAIELD)) error_code=19;
    if(control_error_code & (1<<E_AMS_UNABLE_TO_OPEN_PRE)) error_code=13;
    if(control_error_code & (1<<E_AMS_UNEXCEPTED_TS_CURRENT)) error_code=18;
    if(control_error_code & (1<<E_AMS_PRE_TIMEOUT)) error_code=15;
    if(control_error_code & (1<<E_AMS_UNABLE_TO_CLOSE_SC)) error_code=7;
    if(control_error_code & (1<<E_AMS_SC_BROKEN)) error_code=20;
    if(control_error_code & (1<<E_AMS_UNABLE_TO_OPEN_AIR_M)) error_code=9;
    if(control_error_code & (1<<E_AMS_UNABLE_TO_OPEN_AIR_P)) error_code=11;
    if(control_error_code & (1<<E_AMS_UNFIT_CHARGE_VOLTAGE)) error_code=21;

    return error_code;
}




