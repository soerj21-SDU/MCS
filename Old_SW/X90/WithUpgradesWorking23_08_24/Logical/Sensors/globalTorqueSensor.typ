
TYPE
	gTorqueSensor_cmd_typ : 	STRUCT 
		torque1 : INT;
		torque2 : INT;
		disablePlausibilityCheck : BOOL;
	END_STRUCT;
	gTorqueSensor_typ : 	STRUCT 
		status : gTorqueSensor_status_typ;
		inputs : gTorqueSensor_inputs_typ;
		outputs : gTorqueSensor_outputs_typ;
		data : gTorqueSensor_data_typ;
		cmd : gTorqueSensor_cmd_typ;
	END_STRUCT;
	gTorqueSensor_status_typ : 	STRUCT 
		ok : BOOL;
		errorOutOfRangeSensor1 : BOOL;
		errorOutOfRangeSensor2 : BOOL;
		plausibilityError : BOOL;
		torqueEnabled : BOOL;
		torquePercentage : REAL;
		criticalError : BOOL;
		maxTorquePercent : USINT;
	END_STRUCT;
	gTorqueSensor_data_typ : 	STRUCT 
		torque1Percent : REAL;
		torque2Percent : REAL;
	END_STRUCT;
	gTorqueSensor_inputs_typ : 	STRUCT 
		torque1 : INT;
		torque2 : INT;
	END_STRUCT;
	gTorqueSensor_outputs_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
END_TYPE
