(* If the inverter is in the error state for too long report an error *)
ACTION errorTimeout: 
	(* Disable error timer if the inverter exists error state *)
	gInverters.inverter[i].data.TON_errorTimer.PT 	:= T#10s;													// Set error timeout duration
	gInverters.inverter[i].data.TON_errorTimer.IN 	:= gInverters.inverter[i].status.state = INV_STATE_ERROR; 	// enable timer if inverter is in STATE_ERROR
	gInverters.inverter[i].data.TON_errorTimer();																// Handle timer
	gInverters.inverter[i].status.errorTimeout 		:= gInverters.inverter[i].data.TON_errorTimer.Q;			// If timer runs out trigger errorTimeout
END_ACTION
