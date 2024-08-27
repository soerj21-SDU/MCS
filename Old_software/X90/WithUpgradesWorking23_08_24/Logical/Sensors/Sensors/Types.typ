
TYPE
	braking_pedal_variables_typ : 	STRUCT 
		brakingPedalFrontMax : UINT;
		brakingPedalFrontMin : UINT;
		brakingPedalRearMax : UINT;
		brakingPedalRearMin : UINT;
		slope : REAL;
	END_STRUCT;
	braking_pedal_constants_typ : 	STRUCT 
		frontWarningLimitMaxMax : UINT;
		frontWarningLimitMax : UINT;
		frontWarningLimitMin : UINT;
		frontWarningLimitMinMin : UINT;
		rearWarningLimitMaxMax : UINT;
		rearWarningLimitMax : UINT;
		rearWarningLimitMin : UINT;
		rearWarningLimitMinMin : UINT;
		softBrakingLimit : UINT;
		hardBrakingLimit : UINT;
	END_STRUCT;
	torque_pedal_variables_typ : 	STRUCT 
		torquePedalMax2 : UINT;
		torquePedalMax1 : UINT;
		torquePedalMin2 : UINT;
		torquePedalMin1 : UINT;
		TON_torqueOff : TON;
		slope : REAL;
	END_STRUCT;
	torque_pedal_constants_typ : 	STRUCT 
		lowLimit2 : UINT;
		highLimit2 : UINT;
		lowLimit1 : UINT;
		highLimit1 : UINT;
		torqueOffUpperHysteresis : REAL;
		torqueOffLowerHysteresis : REAL;
	END_STRUCT;
	steering_angle_constants_typ : 	STRUCT 
		highLimit : UINT;
		lowLimit : UINT;
		disconnectionLimit : UINT;
		MAX_ANGLE : REAL;
		MIN_ANGLE : REAL;
	END_STRUCT;
	steering_angle_variables_typ : 	STRUCT 
		steeringWheelAngleStr : STRING[80];
		wheelAngleStr : STRING[80];
		leftValue : UINT;
		rightValue : UINT;
	END_STRUCT;
	lv_battery_constants_typ : 	STRUCT 
		HighLimit : REAL;
		LowLimit : REAL;
	END_STRUCT;
	lv_battery_variable_typ : 	STRUCT 
		TON_batteryEmpty : TON;
		TON_batteryFull : TON;
	END_STRUCT;
END_TYPE
