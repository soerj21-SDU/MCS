
TYPE
	gInverters_typ : 	STRUCT 
		data : gInverters_data_typ;
		cmd : gInverters_cmd_typ;
		status : gInverters_status_typ;
		output : gInverters_output_typ;
		inverter : ARRAY[0..3]OF gInverters_inverter_typ;
	END_STRUCT;
	gInverters_data_typ : 	STRUCT 
		powerLimitKW : REAL;
		powerLimit : REAL;
		averageVelocityKmh : REAL;
		deratingStatic : REAL;
		acceleration_0to100kmh_inSecs : TIME;
		negativeTorqueLimGain : REAL;
		torqueSetpointGain : REAL;
		MaxSpeedRPM : REAL;
		powerLimitMargin : REAL;
		powerLimitKwInverter : ARRAY[0..3]OF REAL;
		powerBias : ARRAY[0..3]OF REAL;
		rearBias : REAL;
	END_STRUCT;
	gInverters_cmd_typ : 	STRUCT 
		enableRegenerativeBraking : BOOL;
		enableTractionControl : BOOL;
		enablePowerLimiter : BOOL;
		enableTorqueVectoring : BOOL;
		enableTorqueLimiter : BOOL;
		enableFrontRearDistribution : BOOL;
		enableMotorPairShutdown : BOOL;
		powerCycle : BOOL;
		exitDrive : BOOL;
		manualControl : BOOL;
		enableConfigurationDuringDrive : BOOL; (*True = All inverter control parameters are enabled to be changed during drive*)
		autoReset : BOOL;
		stopInverters : BOOL;
		activateInverters : BOOL;
		powerCyclePair12 : BOOL;
		powerCyclePair34 : BOOL;
	END_STRUCT;
	gInverters_output_typ : 	STRUCT 
		do_enableInv34 : BOOL; (*BA1*)
		do_enableInv12 : BOOL; (*BA1*)
		do_powerInv12 : BOOL;
		do_powerInv34 : BOOL;
	END_STRUCT;
	gInverters_status_typ : 	STRUCT 
		deratingStaticPercent : REAL;
		configurationEnabled : BOOL;
		errorCanFramesLost : ARRAY[0..1]OF BOOL;
		regenerativeBrakingAvailable : BOOL;
		torqueBasedThrottle : BOOL;
	END_STRUCT;
	gInverters_inverter_typ : 	STRUCT 
		status : gInverters_inverter_status_typ;
		outputs : gInverters_inverter_outputs_typ;
		data : gInverters_inverter_data_typ;
		inputs : gInverters_inverter_inputs_typ;
		cmd : gInverters_inverter_cmd_typ;
	END_STRUCT;
	gInverters_inverter_status_typ : 	STRUCT 
		ok : BOOL;
		substate : USINT;
		stateName : STRING[80];
		state : gInverterStates;
		returnState : gInverterStates; (*State to return back to if an error occurs here*)
		errorTimeout : BOOL;
		inverterEnabled : BOOL;
		unknownMessageReceived : BOOL;
		unknownMessageID : UDINT;
		inverterDisconnected : BOOL;
		locationName : STRING[80];
		location : INVERTER_LOCATIONS_TYP;
		deratingLaunchProfilePercent : REAL;
		deratingPowerLimiterPercent : REAL;
		deratingFrontRearDistribution : REAL;
		deratingTorqueVectoringPercent : REAL;
		deratingTotalPercent : REAL;
	END_STRUCT;
	gInverters_inverter_data_typ : 	STRUCT 
		torqueOutput : REAL;
		torqueOutputPercent : REAL;
		tempMotor : REAL;
		tempInverter : REAL;
		tempIGBT : REAL;
		actualVelocityKmh : REAL;
		actualVelocity : REAL;
		torqueCurrent : REAL;
		torqueMagnitizingCurrent : REAL;
		speedDerating : REAL;
		maxSpeed : REAL; (*Max speed recorded in last run, remember to implement in code*)
		TON_errorTimer : TON; (*Timer to monitor how long an inverter has been in the error state*)
		regenerativeBraking : REAL;
		regenerativeBrakingPercent : REAL;
	END_STRUCT;
	gInverters_inverter_inputs_typ : 	STRUCT 
		com_systemReady : BOOL;
		com_error : BOOL;
		com_warning : BOOL;
		com_quitDcOn : BOOL;
		com_dcOn : BOOL;
		com_quitInverterOn : BOOL;
		com_inverterOn : BOOL;
		com_derating : BOOL;
		com_actualVelocity : INT;
		com_torqueCurrent : INT;
		com_magnetizingCurrent : INT;
		com_tempMotor : INT;
		com_tempInverter : INT;
		com_tempIGBT : INT;
		com_errorDiagnostics : UDINT;
		di_deratingActive : BOOL;
	END_STRUCT;
	gInverters_inverter_cmd_typ : 	STRUCT 
		enableInverter : BOOL;
		stopInverter : BOOL;
		startInverter : BOOL;
		shutdownByPartner : BOOL;
		powerCycle : BOOL;
	END_STRUCT;
	gInverters_inverter_outputs_typ : 	STRUCT 
		torqueEnable : BOOL;
		do_torqueLimitActive : BOOL; (*BE2*)
		do_enable : BOOL; (*BE1*)
		com_errorReset : BOOL;
		com_enable : BOOL;
		com_dcOn : BOOL;
		com_interverOn : BOOL;
		com_targetVelocity : INT;
		com_targetTorque : INT;
		com_torqueLimitPos : INT;
		com_torqueLimitNeg : INT;
	END_STRUCT;
	missionIndex_typ : 
		(
		MISSION_NONE,
		MISSION_ACCELERATION,
		MISSION_SKIDPAD,
		MISSION_SPRINT,
		MISSION_ENDURANCE,
		MISSION_BRAKE_TEST,
		MISSION_TESTING
		);
	INVERTER_LOCATIONS_TYP : 
		(
		FL,
		FR,
		RL,
		RR
		);
	gInverterStates : 
		(
		INV_STATE_INIT,
		INV_STATE_IDLE,
		INV_STATE_SWITCH_ON,
		INV_STATE_DRIVE,
		INV_STATE_ERROR,
		INV_STATE_SWITCH_OFF,
		INV_STATE_POWER_CYCLE
		);
END_TYPE
