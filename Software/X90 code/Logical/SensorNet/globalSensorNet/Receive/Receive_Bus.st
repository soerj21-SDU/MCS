
ACTION Receive_Bus: 
	// Timer used for disconnection detection of Sensor Network
	TON_disconnectTimer.PT   := T#200ms;	// Set timeout period
	TON_disconnectTimer.IN 	 := TRUE;		// Enable timer
	
	
	FOR i := 0 TO UDINT_TO_USINT(LIMIT(0,ArCanReceive_0.QueueSize,255)) DO
		ArCanReceive_0(); // Run function block => Get next data frame
		
		(* If a new message has been received *)
		IF ArCanReceive_0.NewDataValid THEN
			(* Find which message is was and decode it *)
			
			frameIdOffset := ArCanReceive_0.ReceivedFrame.ID - RX_CAN_ID_BASE;
			// Look up message decoding
			CASE frameIdOffset OF
//				16#050: msg_0x050;	Setup messages
//				16#051: msg_0x051;	Setup messages
//				16#052: msg_0x052;	Setup messages
				ELSE
				(* Message not registered in system *)
			END_CASE
			
			(* Enable timer to check if Sensor Network is disconnected *)
			TON_disconnectTimer.IN := FALSE;
		ELSE
			EXIT;
		END_IF
	END_FOR;
	
	
	
	TON_disconnectTimer();
	
	(* If 200 ms is passed without message, set dashboard disconnect status flag *)
	IF TON_disconnectTimer.Q = TRUE THEN
		gDashboard.status.DashboardDisconnected := TRUE;
	END_IF
	
END_ACTION
