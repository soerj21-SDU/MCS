
TYPE
	accelerometer_constants_typ : 	STRUCT 
		VOLTAGE_MIN : UDINT;
		VOLTAGE_MAX : UDINT;
		MEASUREMENT_RES : UDINT;
		SENSOR_SUPPLY_VOLTAGE : UDINT;
		SENSITIVITY : REAL;
		ZERO_POINT : REAL;
	END_STRUCT;
	accelerometer_input_typ : 	STRUCT 
		x_direction : INT;
		y_direction : INT;
		z_direction : INT;
	END_STRUCT;
	accelerometer_status_typ : 	STRUCT 
		voltage_x : REAL;
		voltage_y : REAL;
		voltage_z : REAL;
		acceleration_x : REAL;
		acceleration_y : REAL;
		acceleration_z : REAL;
	END_STRUCT;
	accelerometer_typ : 	STRUCT 
		constants : accelerometer_constants_typ;
		input : accelerometer_input_typ;
		status : accelerometer_status_typ;
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
	braking_pedal_variables_typ : 	STRUCT 
		brakingPedalFrontMax : UINT;
		brakingPedalFrontMin : UINT;
		brakingPedalRearMax : UINT;
		brakingPedalRearMin : UINT;
		slope : REAL;
	END_STRUCT;
	lv_battery_constants_typ : 	STRUCT 
		HighLimit : REAL;
		LowLimit : REAL;
	END_STRUCT;
	lv_battery_variable_typ : 	STRUCT 
		TON_batteryEmpty : TON;
		TON_batteryFull : TON;
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
	suspension_const_typ : 	STRUCT 
		VOLTAGE_MIN : UDINT;
		VOLTAGE_MAX : UDINT;
		MEASUREMENT_RES : UDINT;
		SENSOR_SUPPLY_VOLTAGE : UDINT;
		TRAVEL_RES : UDINT;
	END_STRUCT;
	suspension_input_typ : 	STRUCT 
		linearPosSensor : ARRAY[0..3]OF INT;
	END_STRUCT;
	suspension_status_typ : 	STRUCT 
		travelRR : REAL;
		travelFR : REAL;
		travelRL : REAL;
		travelFL : REAL;
		voltageRR : REAL;
		voltageFR : REAL;
		voltageRL : REAL;
		voltageFL : REAL;
	END_STRUCT;
	suspension_typ : 	STRUCT 
		constants : suspension_const_typ;
		input : suspension_input_typ;
		status : suspension_status_typ;
	END_STRUCT;
	torque_pedal_constants_typ : 	STRUCT 
		lowLimit2 : UINT;
		highLimit2 : UINT;
		lowLimit1 : UINT;
		highLimit1 : UINT;
		torqueOffUpperHysteresis : REAL;
		torqueOffLowerHysteresis : REAL;
	END_STRUCT;
	torque_pedal_variables_typ : 	STRUCT 
		torquePedalMax2 : UINT;
		torquePedalMax1 : UINT;
		torquePedalMin2 : UINT;
		torquePedalMin1 : UINT;
		TON_torqueOff : TON;
		slope : REAL;
	END_STRUCT;
END_TYPE
