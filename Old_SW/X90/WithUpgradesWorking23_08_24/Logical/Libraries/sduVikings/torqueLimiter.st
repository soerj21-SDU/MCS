FUNCTION_BLOCK torqueLimiter 
	
	IF enable THEN
		FOR i := 0 TO 3 DO
			derating_output[i] := max_torque/100.00;
		END_FOR;
	ELSE
		FOR i := 0 TO 3 DO
			derating_output[i] := 1;
		END_FOR;
	END_IF;

END_FUNCTION_BLOCK