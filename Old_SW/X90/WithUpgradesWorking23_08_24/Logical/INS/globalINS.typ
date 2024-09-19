
TYPE
	gINS_status_typ : 	STRUCT 
		ok : BOOL;
	END_STRUCT;
	gINS_data_typ : 	STRUCT 
		actLonVelocity_ms : REAL;
		actLatVelocity_ms : REAL;
		actLonVelocity_kmh : REAL;
		actLatVelocity_kmh : REAL;
		actLonAcceleration : REAL;
		actLatAcceleration : REAL;
		actYawRate : REAL;
		actDistTraveledKm : REAL;
		actDistTraveledM : REAL;
		distEstimated : REAL;
	END_STRUCT;
	gINS_input_typ : 	STRUCT 
		gyroX : REAL;
		gyroY : REAL;
		gyroZ : REAL;
		accX : REAL;
		accY : REAL;
		accZ : REAL;
		velX : REAL;
		velY : REAL;
		velZ : REAL;
	END_STRUCT;
	gINS_typ : 	STRUCT 
		data : gINS_data_typ;
		status : gINS_status_typ;
		input : gINS_input_typ;
	END_STRUCT;
END_TYPE
