
TYPE
	gShunt_typ : 	STRUCT 
		data : gShunt_data_typ;
		status : gShunt_status_typ;
	END_STRUCT;
	gShunt_data_typ : 	STRUCT 
		currentThreshold : REAL;
		actCurrent : REAL;
		actVoltage : REAL;
		actVoltage2 : REAL;
		actPowerKW : REAL;
		actPowerW : REAL;
		actCurrentAS : REAL;
		actPowerKWH : REAL;
		actPowerWH : REAL;
		actTemp : REAL;
	END_STRUCT;
	gShunt_status_typ : 	STRUCT 
		ok : BOOL;
		disconnected : BOOL;
		currentRunning : BOOL;
	END_STRUCT;
END_TYPE
