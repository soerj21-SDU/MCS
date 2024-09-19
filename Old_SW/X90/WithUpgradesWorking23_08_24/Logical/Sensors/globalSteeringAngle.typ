
TYPE
	gSteeringAngle_cmd_typ : 	STRUCT 
		angleSensor : INT;
	END_STRUCT;
	gSteeringAngle_typ : 	STRUCT 
		status : gSteeringAngle_status_typ;
		inputs : gSteeringAngle_inputs_typ;
		outputs : gSteeringAngle_outputs_typ;
		data : gSteeringAngle_data_typ;
		cmd : gSteeringAngle_cmd_typ;
	END_STRUCT;
	gSteeringAngle_status_typ : 	STRUCT 
		ok : BOOL;
		error : BOOL;
		errorOutOfRange : BOOL;
		disconnected : BOOL;
		steeringWheelSVG : STRING[1000];
		wheelSVG : STRING[300];
	END_STRUCT;
	gSteeringAngle_data_typ : 	STRUCT 
		angleDegrees : REAL;
		wheelAngle : REAL;
	END_STRUCT;
	gSteeringAngle_inputs_typ : 	STRUCT 
		angleSensor : INT;
	END_STRUCT;
	gSteeringAngle_outputs_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
END_TYPE
