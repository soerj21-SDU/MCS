
ACTION AMS_Send: 
	
	(* Set timer *)
	TON_sendTimer.PT := T#50ms;
	
	(* If timer runs out *)
	IF TON_sendTimer.Q THEN
		IF ArCanSend_0.NumberOfFreeBuffers > 1010 THEN
			// msg_x05; // Should be used with the old AMS
			FOR i:=0 TO 2-1 DO // Number of messages minus 1
				messageCounterSent := messageCounterSent + 1;
				CASE i OF
					0:
						msg_orion_tx20; 
					1:
						msg_orion_tx21;
				END_CASE;
			END_FOR;
		END_IF;

		(* Reset timer *)
		TON_sendTimer(IN:=FALSE);
	END_IF
	
	(* Start timer *)
	TON_sendTimer(IN:=TRUE);
	

	
END_ACTION
