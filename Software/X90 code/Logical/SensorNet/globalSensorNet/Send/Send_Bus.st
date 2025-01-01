
ACTION Send_Bus: 
	(* Set timer *)
	TON_sendTimer.PT := T#100ms;
	
	(* If timer runs out *)
	IF NOT gIsSimulation THEN		
		IF TON_sendTimer.Q THEN
			CASE msgIndex OF 
				//	0: msg_0x000; 	Make messages
				//	1: msg_0x001;	Make messages
				//	2: msg_0x002;	Make messages
				ELSE
				END_CASE;
			ArCanSend_0(SendFrame := TRUE);
			ArCanSend_0(SendFrame := FALSE);	
			
			
			msgIndex := msgIndex + 1;
			IF msgIndex > 2 THEN
				msgIndex := 0;
			END_IF;
		
			
			(* Reset timer *)
			TON_sendTimer(IN:=FALSE);
		END_IF;
		
	END_IF;
			
	(* Start timer *)
	TON_sendTimer(IN:=TRUE);
	
	ArCanSend_0();
END_ACTION
