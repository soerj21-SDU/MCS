FUNCTION_BLOCK torqueVectoring 

	IF enable THEN
		
	ELSE
		// If TV is disabled. Parse torque pedal signal through
		FOR i := 0 TO 3 DO
			torque_output[i] := torque_input;
		END_FOR;
	END_IF;

END_FUNCTION_BLOCK