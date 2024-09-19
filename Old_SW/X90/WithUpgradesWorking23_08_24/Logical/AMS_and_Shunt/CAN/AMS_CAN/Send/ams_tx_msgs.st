
ACTION msg_x05: 
	
	// Command ID	
	ArCanSend_0.Frame.Data[0].0 := gAMS.cmd.commandId.0;
	ArCanSend_0.Frame.Data[0].1 := gAMS.cmd.commandId.1;
	ArCanSend_0.Frame.Data[0].2 := gAMS.cmd.commandId.2;
	ArCanSend_0.Frame.Data[0].3 := gAMS.cmd.commandId.3;
	
	
	// Bank count
	ArCanSend_0.Frame.Data[0].4 := gAMS.cmd.bankCount.0;
	ArCanSend_0.Frame.Data[0].5 := gAMS.cmd.bankCount.1;
	ArCanSend_0.Frame.Data[0].6 := gAMS.cmd.bankCount.2;
	ArCanSend_0.Frame.Data[0].7 := gAMS.cmd.bankCount.3;
	
	// Message counter
	memcpy(ADR(ArCanSend_0.Frame.Data[1]), ADR(messageCounter), 1);
	
	IF NOT gIsSimulation THEN
		(* Set ID *)
		ArCanSend_0.Frame.ID 			:= TX_CAN_ID_BASE + 16#005;
		
		(* Set DLC *)
		ArCanSend_0.Frame.DataLength 	:= 2;
		
		(* Send message *)
		ArCanSend_0(SendFrame := TRUE);
		ArCanSend_0(SendFrame := FALSE);
	END_IF;
	
	// Increment message counter
	messageCounter := messageCounter + 1;
END_ACTION
