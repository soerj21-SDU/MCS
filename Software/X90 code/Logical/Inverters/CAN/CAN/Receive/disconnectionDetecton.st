ACTION serviceDisconnectionDetection: 

	(* Check timeouts for inverters *)
	FOR j := 0 TO 1 DO
		bus[i].TON_detectTimer[j]();
		(* If timeout has occurred*)
		IF bus[i].TON_detectTimer[j].Q THEN
			(* Report error*)
			gInverters.inverter[(i*2)+j].status.inverterDisconnected := TRUE;
		ELSE
			(* Reset error *)
			gInverters.inverter[(i*2)+j].status.inverterDisconnected := FALSE;
		END_IF
	END_FOR
END_ACTION

ACTION updateDisconnectionDetection: 
	
	IF inverterId = 0 OR inverterId = 2 THEN
		// Inverter 0 and 2 have index 0 in the detectTimer array
		j := 0;	
	ELSE
		// Inverter 1 and 3 have index 1 in the detectTimer array
		j := 1;
	END_IF;
	
	
	// Reset timer and update it 	
	bus[i].TON_detectTimer[j].IN := FALSE;
	bus[i].TON_detectTimer[j]();
	
END_ACTION