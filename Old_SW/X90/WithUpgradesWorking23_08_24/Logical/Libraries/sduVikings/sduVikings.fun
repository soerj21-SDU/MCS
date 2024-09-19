
{REDUND_ERROR} FUNCTION_BLOCK calculateSensorNetOut (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		input : {REDUND_UNREPLICABLE} INT;
		polyCoeffs : {REDUND_UNREPLICABLE} ARRAY[0..8] OF REAL;
	END_VAR
	VAR_OUTPUT
		output : {REDUND_UNREPLICABLE} REAL;
	END_VAR
	VAR
		i : USINT;
		y : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK torqueVectoring
	VAR_INPUT
		enable : BOOL;
		torque_input : REAL;
		steering_angle : REAL;
		MAX_DERATING : REAL;
		MAX_STEERING_ANGLE : REAL;
	END_VAR
	VAR_OUTPUT
		torque_output : ARRAY[0..3] OF REAL;
	END_VAR
	VAR
		i : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK tractionControl
	VAR_INPUT
		enable : BOOL;
		longitudinal_wheel_slip : ARRAY[0..3] OF REAL;
		LON_SLIP_REF : REAL;
		P_GAIN : ARRAY[0..3] OF REAL;
		I_GAIN : ARRAY[0..3] OF REAL;
	END_VAR
	VAR_OUTPUT
		derating_output : ARRAY[0..3] OF REAL;
	END_VAR
	VAR
		i : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK powerLimiter
	VAR_INPUT
		enable : BOOL;
		act_power : REAL;
		lowest_cell_voltage : REAL;
		MAX_POWER : REAL;
		P_GAIN : ARRAY[0..3] OF REAL;
		I_GAIN : ARRAY[0..3] OF REAL;
	END_VAR
	VAR_OUTPUT
		derating_output : ARRAY[0..3] OF REAL;
	END_VAR
	VAR
		i : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK launchProfile
	VAR_INPUT
		enable : BOOL;
		act_lon_velocity : REAL;
	END_VAR
	VAR_OUTPUT
		derating_output : ARRAY[0..3] OF REAL;
	END_VAR
	VAR
		i : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK torqueLimiter
	VAR_INPUT
		enable : BOOL;
		max_torque : REAL;
	END_VAR
	VAR_OUTPUT
		derating_output : ARRAY[0..3] OF REAL;
	END_VAR
	VAR
		i : USINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK regenerativeBraking (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		enable : BOOL;
		vehicle_lon_velocity : REAL;
		negative_torque_transfer : REAL;
		torque_pedal : REAL;
		brake_pressure : REAL;
		REGEN_BRAKING_GAIN : REAL;
		IDLE_MOTOR_TORQUE : REAL;
	END_VAR
	VAR_OUTPUT
		negative_torque_limit : ARRAY[0..3] OF REAL;
		positive_torque_limit : ARRAY[0..3] OF REAL;
	END_VAR
	VAR
		negTrqLimSetpoint : ARRAY[0..3] OF REAL;
		i : USINT;
	END_VAR
END_FUNCTION_BLOCK
