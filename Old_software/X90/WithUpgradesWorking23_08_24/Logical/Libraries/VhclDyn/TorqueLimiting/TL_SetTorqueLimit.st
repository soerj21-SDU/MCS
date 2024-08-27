
(* TODO: Add your comment here *)
FUNCTION_BLOCK TL_SetTorqueLimit
	output := LIMIT(0,torqueLimit/100.00,1);
END_FUNCTION_BLOCK
