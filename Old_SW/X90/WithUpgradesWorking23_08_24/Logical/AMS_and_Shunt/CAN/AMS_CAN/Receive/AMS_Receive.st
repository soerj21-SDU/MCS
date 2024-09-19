
ACTION AMS_Receive: 
	// Timer used for disconnection detection of AMS
	TON_amsDisconnected.PT   := T#200ms;	// Set timeout period
	TON_amsDisconnected.IN 	 := TRUE;		// Enable timer
	
	// Timer used for disconnection detection of shunt
	TON_shuntDisconnected.PT := T#200ms; 	// Set timeout period 
	TON_shuntDisconnected.IN := TRUE;		// Enable timer

	FOR i := 0 TO 10 DO
		ArCanReceive_0(); // Run function block => Get next data frame
		
		(* If a new message has been received *)
		IF ArCanReceive_0.NewDataValid THEN
			messageCounterRec := messageCounterRec + 1;
			// Figure out if it is a shunt message
			IF ArCanReceive_0.ReceivedFrame.ID > SHUNT_ID_BASE AND ArCanReceive_0.ReceivedFrame.ID < (SHUNT_ID_BASE+16#30) THEN
				// Its a shunt message
				frameId := ArCanReceive_0.ReceivedFrame.ID - SHUNT_ID_BASE;
				// Look up message decoding
				CASE frameId OF
					16#021: msg_shunt_021;
					16#022: msg_shunt_022;
					16#023: msg_shunt_023;
//					16#025: msg_shunt_025;	
					16#026: msg_shunt_026;	
					16#027: msg_shunt_027;	
					16#028: msg_shunt_028;	
					ELSE (* Message not registered in system *)
				END_CASE
					
					
				(* Reset timer for disconnection detection *)
				TON_shuntDisconnected.IN := FALSE;
			
			// Figure out if the message is a ORION Message
			ELSIF ArCanReceive_0.ReceivedFrame.ID >= RX_ORION_ID_BASE AND ArCanReceive_0.ReceivedFrame.ID < (RX_ORION_ID_BASE+16#30) THEN
				// It is an ORION messagemm
				frameId := ArCanReceive_0.ReceivedFrame.ID - RX_ORION_ID_BASE;
				
				// Look up message decoding
				CASE frameId OF
					//16#000: msg_orion_000;
					16#001: msg_orion_001;
					16#002: msg_orion_002;
					16#003: msg_orion_003;
					16#004: msg_orion_004;
					16#010: msg_orion_010;
					16#011: msg_orion_011;
					
					ELSE // Not a message in the system
				END_CASE		
				
			ELSE
				// Its an AMS message
				frameId := UDINT_TO_UINT(ArCanReceive_0.ReceivedFrame.ID) - RX_CAN_ID_BASE;
		
				// Look up message decoding
				CASE frameId OF
					16#000: msg_ams_000;
					16#011: msg_ams_011;
					16#012: msg_ams_012;
					16#013: msg_ams_013;	
					16#014: msg_ams_014;
					ELSE (* Message not registered in system *)
				END_CASE

				TON_amsDisconnected.IN := FALSE; // Reset Timer
			END_IF;
		ELSE 
			EXIT;
		END_IF
	END_FOR;

	
	
	(* If timeout occurres on AMS timer set AMS disconnect status flag *)
	TON_amsDisconnected();
	gAMS.status.disconnected := TON_amsDisconnected.Q;
	
	(* If timeout occurres on shunt timer set shunt disconnect status flag *)
	TON_shuntDisconnected();
	gShunt.status.disconnected := TON_shuntDisconnected.Q;
	
	
END_ACTION
