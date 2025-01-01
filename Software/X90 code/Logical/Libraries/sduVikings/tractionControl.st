FUNCTION_BLOCK tractionControl
	IF enable THEN
		
	ELSE
		FOR i := 0 TO 3 DO
			derating_output[i] := 1;
		END_FOR;
	END_IF;

END_FUNCTION_BLOCK