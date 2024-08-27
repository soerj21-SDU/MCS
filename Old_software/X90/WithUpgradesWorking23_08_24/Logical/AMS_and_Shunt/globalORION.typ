
TYPE
	gORION_state_ENUM : 
		(
		INIT := 0,
		IDLE := 10,
		ENABLING_SC := 20,
		SC_ENABLED := 30,
		PRECHARGING := 40,
		PRECHARGING_DONE := 50,
		DRIVE_PRECHARGE_ACTIVE := 60,
		DRIVE := 70,
		ABORT := 80,
		ERROR := 90
		);
	gORION_relays_typ : 	STRUCT 
		sdcEnable : BOOL;
		precharge : BOOL;
		airMinus : BOOL;
		airPlus : BOOL;
	END_STRUCT;
	gORION_typ : 	STRUCT 
		state : gORION_state_ENUM;
		cmd : gORION_cmd_typ;
		status : gORION_status_typ;
		relays : gORION_relays_typ;
		data : gORION_data_typ;
	END_STRUCT;
	gORION_cmd_typ : 	STRUCT 
		placeholder : USINT;
	END_STRUCT;
	gORION_status_typ : 	STRUCT 
		sdcEnabled : BOOL;
		commTimeout : BOOL;
	END_STRUCT;
	gORION_data_typ : 	STRUCT 
		packVoltage : REAL;
		prechargeLevel : REAL;
		carVoltage : REAL;
		maxPrechargeCurrent : REAL;
		chargeCurrent : REAL;
		outputCurrent : REAL;
		TON_counter : TON;
		CCL_KW : REAL;
		CCL : INT;
		DCL_KW : REAL;
		DCL : INT;
		rollingCounterOld : USINT;
		rollingCounter : USINT;
		packPower : REAL;
	END_STRUCT;
END_TYPE
