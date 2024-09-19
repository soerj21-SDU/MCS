
ACTION Receive_Bus: 

	TON_disconnectTimer.PT := T#200ms;
	TON_disconnectTimer.IN := TRUE;
	
	FOR i := 0 TO UDINT_TO_USINT(LIMIT(0,ArCanReceive_0.QueueSize,255)) DO
		ArCanReceive_0(); // Run function block => Get next data frame
		(* If a new message has been received *)
		IF ArCanReceive_0.NewDataValid THEN
			(* Find which message is was and decode it *)
			
			frameIdOffset := ArCanReceive_0.ReceivedFrame.ID - RX_CAN_ID_BASE;
			CASE frameIdOffset OF
				16#050: msg_0x050;	
				16#051: msg_0x051;	
				16#052: msg_0x052;	
				ELSE
				(* Message not registered in system *)
				gDashboard.status.unknownMessageReceived 	:= TRUE;
				gDashboard.status.unknownMessageID	 		:= ArCanReceive_0.ReceivedFrame.ID;
			END_CASE
			
			(* Enable timer to check if dashboard is disconnected *)
			TON_disconnectTimer.IN := FALSE;
			gDashboard.status.DashboardDisconnected := FALSE;
		ELSE
			EXIT;
		END_IF
	END_FOR;
	
	
	
	TON_disconnectTimer();
	
	(* If 200 ms is passed without message, set dashboard disconnect status flag *)
	IF TON_disconnectTimer.Q = TRUE THEN
		gDashboard.status.DashboardDisconnected := TRUE;
	END_IF
	

	gDashboard.status.canFramesLost := ArCanReceive_0.NumberOfLostFrames <> 0;
	
END_ACTION
