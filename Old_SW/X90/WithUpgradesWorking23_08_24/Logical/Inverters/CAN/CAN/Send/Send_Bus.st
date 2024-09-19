
ACTION Send_Bus: 
	
	(* Set timer *)
	bus[i].TON_sendTimer.PT := T#30ms;
	
	(* If timer runs out *)
	IF bus[i].TON_sendTimer.Q THEN
		// Make sure there is free spots in the TX message buffer
		IF bus[i].ArCanSend_0.NumberOfFreeBuffers > 1010 THEN
			(* Go through each message. Encode and send them *)
			FOR j := 2*i TO (2*i)+1 DO
				(* Set ID of message *)
				bus[i].sendMessages := bus[i].sendMessages + 1;
				CASE j OF 
					0: bus[i].ArCanSend_0.Frame.ID := TX_CAN_ID_BASE + 16#084;
					1: bus[i].ArCanSend_0.Frame.ID := TX_CAN_ID_BASE + 16#085;
					2: bus[i].ArCanSend_0.Frame.ID := TX_CAN_ID_BASE + 16#088;
					3: bus[i].ArCanSend_0.Frame.ID := TX_CAN_ID_BASE + 16#089;
					ELSE
				END_CASE
				IF bus[i].ArCanSend_0.Frame.ID <> 0 THEN
					encodeAndSendMessage; // Encode and send message 
				END_IF;
			END_FOR;
		END_IF;
		
		(* Reset timer *)
		bus[i].TON_sendTimer(IN:=FALSE);
	END_IF
	
	(* Start timer *)
	bus[i].TON_sendTimer(IN:=TRUE);
	

END_ACTION
