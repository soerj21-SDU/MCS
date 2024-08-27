
TYPE
	gStateMachine_cmd_typ : 	STRUCT 
		forceIO : BOOL;
		changeMission : BOOL;
		loadMission : BOOL;
		saveMission : BOOL;
	END_STRUCT;
	gStateMachine_data_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
	gStateMachine_inputs_typ : 	STRUCT 
		dummy : INT;
	END_STRUCT;
	gStateMachine_outputs_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
	gStateMachine_status_typ : 	STRUCT 
		readyForStateDrive : BOOL;
		stateNameOld : STRING[80];
		stateName : STRING[80];
		stateChangeAllowed : BOOL;
		stateOld : states_typ;
		state : states_typ;
		instruction : STRING[80];
		instructionIndex : instructionIndex;
		mission : STRING[80];
		missionIndex : missionIndex_typ;
		stateChangeTimeout : BOOL;
	END_STRUCT;
	gStateMachine_typ : 	STRUCT 
		status : gStateMachine_status_typ;
		outputs : gStateMachine_outputs_typ;
		data : gStateMachine_data_typ;
		cmd : gStateMachine_cmd_typ;
		inputs : gStateMachine_inputs_typ;
	END_STRUCT;
	instructionIndex : 
		(
		INST_INITIALIZING,
		INST_PRESS_SAFETY_BUTTON,
		INST_SC_NOT_ENABLED,
		INST_PRESS_TRACTIVE_BUTTON,
		INST_AMS_NOT_READY,
		INST_PRESS_BRAKE,
		INST_TORQUE_PEDAL_FAULT,
		INST_PRE_CHARGING,
		INST_PRESS_DRIVE_BUTTON,
		INST_FIX_ERROR,
		INST_CLOSE_SAFETY_CHAIN,
		INST_IN_DRIVE
		);
	states_typ : 
		(
		STATE_INITIALIZE,
		STATE_IDLE,
		STATE_ENABLING_SC,
		STATE_SC_ENABLED,
		STATE_PRECHARGING,
		STATE_TRACTIVE,
		STATE_DRIVE,
		STATE_ERROR
		);
END_TYPE
