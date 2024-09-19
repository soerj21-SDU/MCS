
TYPE
	gLowVoltageBattery_typ : 	STRUCT 
		status : gLowVoltageBattery_status_typ;
		inputs : gLowVoltageBattery_inputs_typ;
		outputs : gLowVoltageBattery_outputs_typ;
		data : gLowVoltageBattery_data_typ;
	END_STRUCT;
	gLowVoltageBattery_status_typ : 	STRUCT 
		full : BOOL;
		empty : BOOL;
		percentageSoc : REAL;
	END_STRUCT;
	gLowVoltageBattery_data_typ : 	STRUCT 
		current : REAL;
		voltage : REAL;
	END_STRUCT;
	gLowVoltageBattery_inputs_typ : 	STRUCT 
		ai_current : INT;
		ai_voltage : INT;
	END_STRUCT;
	gLowVoltageBattery_outputs_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
END_TYPE
