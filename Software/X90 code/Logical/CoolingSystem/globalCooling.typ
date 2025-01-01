
TYPE
	gCooling_typ : 	STRUCT 
		outputs : gCooling_outputs_typ;
		inputs : gCooling_inputs_typ;
		data : gCooling_data_typ;
		cmd : gCooling_cmd_typ;
		status : gCooling_status_typ;
	END_STRUCT;
	gCooling_outputs_typ : 	STRUCT 
		do_fan : ARRAY[0..NUMBER_OF_FANS]OF BOOL;
		do_pump : ARRAY[0..NUMBER_OF_PUMPS]OF BOOL;
	END_STRUCT;
	gCooling_inputs_typ : 	STRUCT 
		ai_coolingTemp : ARRAY[0..NUMBER_OF_COOLING_SENSORS]OF INT;
		im_pumpCurrent : ARRAY[0..NUMBER_OF_PUMPS]OF INT;
	END_STRUCT;
	gCooling_cmd_typ : 	STRUCT 
		manualMode : BOOL;
		inverterMaxTemp : REAL;
		motorMaxTemp : REAL;
		motorTempStartPump : REAL;
		inverterTempStartPump : REAL;
	END_STRUCT;
	gCooling_status_typ : 	STRUCT 
		ok : BOOL;
		error : BOOL;
		pumpError : ARRAY[0..1]OF BOOL;
		pumpState : ARRAY[0..1]OF PUMP_STATES;
		warningHighTemperature : BOOL;
		warningInverterHighTemp : BOOL;
		warningMotorHighTemp : BOOL;
	END_STRUCT;
	gCooling_data_typ : 	STRUCT 
		coolingSysTemp : ARRAY[0..NUMBER_OF_COOLING_SENSORS]OF REAL;
	END_STRUCT;
	PUMP_STATES : 
		(
		PUMP_STATE_OK,
		PUMP_STATE_NO_WATER,
		PUMP_STATE_NOT_CONNECTED
		);
END_TYPE
