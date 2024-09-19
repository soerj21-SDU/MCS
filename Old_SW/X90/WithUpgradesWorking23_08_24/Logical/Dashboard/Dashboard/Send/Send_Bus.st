
ACTION Send_Bus: 
	
	(* Set timer *)
	TON_sendTimer.PT := T#100ms;
//	TON_sendTimer.PT := T#25ms;
	
	(* If timer runs out *)
	IF NOT gIsSimulation THEN		
		IF TON_sendTimer.Q THEN
			(* Go through each message. Encode and send them *)
			//			FOR i := 0 TO 3 DO
				CASE msgIndex OF 
					0: msg_0x000;
					1: msg_0x001;
					2: msg_0x002;
					3: msg_0x003;
					4: msg_0x004;
					ELSE
				END_CASE;
			ArCanSend_0(SendFrame := TRUE);
			ArCanSend_0(SendFrame := FALSE);	
			
			msgIndex := msgIndex + 1;
			IF msgIndex > 4 THEN
				msgIndex := 0;
			END_IF;
			
//			END_FOR;
			(* Reset timer *)
			TON_sendTimer(IN:=FALSE);
		END_IF;
		
//		IF gDashboard.cmd.sendVehicleConfigMsg THEN
//			gDashboard.cmd.sendVehicleConfigMsg := FALSE;
//			msg_0x003;
//			ArCanSend_0(SendFrame := TRUE);
//			ArCanSend_0(SendFrame := FALSE);	
//		END_IF;
		
		
	END_IF;
			
	(* Start timer *)
	TON_sendTimer(IN:=TRUE);
	
	ArCanSend_0();
END_ACTION
