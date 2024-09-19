ACTION Receive_Bus:
	
	
	bus[i].ArCanReceive_0(); // Run function block => Get next data frame
	FOR k := 0 TO 10 DO
		(* If a new message has been received *)
		IF bus[i].ArCanReceive_0.NewDataValid THEN
			// Update the number of messages received
			bus[i].receivedMessages := bus[i].receivedMessages + 1;
			
			(* Find which inverter the message came from *)
			IF    bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#083) OR bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#085) THEN
				inverterId := 0;
			ELSIF bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#084) OR bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#086) THEN
				inverterId := 1;
			ELSIF bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#087) OR bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#089) THEN
				inverterId := 2;
			ELSIF bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#088) OR bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#08A) THEN
				inverterId := 3;
			ELSE
				inverterId := 4;
			END_IF;
			
			// Decode the message
			IF  bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#083) OR bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#084) OR
				bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#087) OR bus[i].ArCanReceive_0.ReceivedFrame.ID = (RX_CAN_ID_BASE + 16#088) THEN
				
				Inv_ActualValue1;
			ELSE
				Inv_ActualValue2;
			END_IF;
			
			// Run disconnection detection routine
			updateDisconnectionDetection;
			
			// Get next data frame
			bus[i].ArCanReceive_0(); 
		ELSE
			EXIT;
		END_IF;
		
	END_FOR;
	
	gInverters.status.errorCanFramesLost[i] := bus[i].ArCanReceive_0.NumberOfLostFrames <> 0;
	
END_ACTION
