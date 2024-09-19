
(* TODO: Add your comment here *)
FUNCTION_BLOCK regenerativeBraking
	IF NOT enable OR vehicle_lon_velocity < 5 OR torque_pedal > 0 THEN
		// Regenerative braking should be disabled if:
		//	 - Function block is not enabled
		// 	 - The vehicle velocity is below 5km/h 	
		//   - The torque pedal is pressed 
		FOR i := 0 TO 3 DO
			negTrqLimSetpoint[i] := 0;
		END_FOR;
	ELSE
		// Regenerative braking is allowed
		IF brake_pressure = 0 THEN
			// Idle braking
			FOR i := 0 TO 3 DO
				negTrqLimSetpoint[i] := IDLE_MOTOR_TORQUE;
			END_FOR;
		ELSE
			// Control braking from brake pressure
			FOR i := 0 TO 3 DO
				// Calculate regen braking setpoint
				// Current algorithm is linear with the brake pressure offset by the idle motor torque
				// setpoint = idle_torque + gain * brake_pressure
				// The setpoint is then limited to within [0,1]
				negTrqLimSetpoint[i] := LIMIT(0, IDLE_MOTOR_TORQUE + REGEN_BRAKING_GAIN * brake_pressure, 1);
			END_FOR;
			// The setpoint can then be changed with the negative torque transfer from the TV algorithm
			// and limited to within [0,1]
			// Left, [0]&[2]
			negTrqLimSetpoint[0] := LIMIT(0, negTrqLimSetpoint[0] + negative_torque_transfer, 1);
			negTrqLimSetpoint[2] := LIMIT(0, negTrqLimSetpoint[2] + negative_torque_transfer, 1);
			// Right, [1]&[3]
			negTrqLimSetpoint[1] := LIMIT(0, negTrqLimSetpoint[1] - negative_torque_transfer, 1);
			negTrqLimSetpoint[3] := LIMIT(0, negTrqLimSetpoint[3] - negative_torque_transfer, 1);
		END_IF;
	END_IF;
	
	FOR i := 0 TO 3 DO
		negative_torque_limit[i] := 0;
		positive_torque_limit[i] := 1;
	END_FOR;
END_FUNCTION_BLOCK
