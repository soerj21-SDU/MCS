
(* TODO: Add your comment here *)
FUNCTION_BLOCK calculateSensorNetOut
//	y = a1 + a2*x^1 + a3*x^2 + a4*x^3 + ... + a8*x^7
	y := polyCoeffs[0];
	FOR i := 1 TO 8 DO
		// y = y + a^i
		y := y + polyCoeffs[i] * EXPT(INT_TO_REAL(input), i);
	END_FOR;
	output := y;
END_FUNCTION_BLOCK
