
TYPE
	gSensorNet_typ : 	STRUCT 
		status : gSensorNet_status_typ;
		inputs : gSensorNet_inputs_typ;
		outputs : gSensorNet_outputs_typ;
		cmd : gSensorNet_cmd_typ;
		data : gSensorNet_data_typ;
	END_STRUCT;
	gSensorNet_status_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
	gSensorNet_data_typ : 	STRUCT 
		coolingTemp1 : sensorNetVariable_typ;
	END_STRUCT;
	gSensorNet_inputs_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
	gSensorNet_cmd_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
	gSensorNet_outputs_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
	sensorNetVariable_typ : 	STRUCT 
		input : INT;
		polyCoeffs : ARRAY[0..SENSOR_NET_POLY_LEN]OF REAL;
		value : REAL;
	END_STRUCT;
END_TYPE
