
TYPE
	gBraking_cmd_typ : 	STRUCT 
		brakePressureFront : INT;
		brakePressureRear : INT;
	END_STRUCT;
	gBraking_typ : 	STRUCT 
		status : gBraking_status_typ;
		inputs : gBraking_inputs_typ;
		outputs : gBraking_outputs_typ;
		data : gBraking_data_typ;
		cmd : gBraking_cmd_typ;
	END_STRUCT;
	gBraking_status_typ : 	STRUCT 
		ok : BOOL;
		errorOutOfRangeFront : BOOL;
		errorOutOfRangeRear : BOOL;
		softBraking : BOOL;
		hardBraking : BOOL;
	END_STRUCT;
	gBraking_inputs_typ : 	STRUCT 
		ai_brakePressureFront : INT;
		ai_brakePressureRear : INT;
	END_STRUCT;
	gBraking_outputs_typ : 	STRUCT 
		do_brakeLight : BOOL;
	END_STRUCT;
	gBraking_data_typ : 	STRUCT 
		pressurePercentageFront : REAL;
		pressurePercentageRear : REAL;
		pressurePercentage : REAL;
		pressureBarRear : REAL;
		pressureBarFront : REAL;
	END_STRUCT;
END_TYPE
