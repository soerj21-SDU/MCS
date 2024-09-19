
ACTION msg_orion_tx20: 
	
	// Command for enabling and disabling MPE = Sdc_en
	gAMS.cmd.mpe.0 := gORION.relays.sdcEnable;
	memcpy(ADR(ArCanSend_0.Frame.Data[0]), ADR(gAMS.cmd.mpe), 1);
	
	// Message counter
	// memcpy(ADR(ArCanSend_0.Frame.Data[1]), ADR(messageCounter), 1);
	
	IF NOT gIsSimulation THEN
		(* Set ID *)
		ArCanSend_0.Frame.ID 			:= TX_ORION_ID_BASE + 16#020;
		
		(* Set DLC *)
		ArCanSend_0.Frame.DataLength 	:= 8;
		
		(* Send message *)
		ArCanSend_0(SendFrame := TRUE);
		ArCanSend_0(SendFrame := FALSE);
	END_IF;
	
	// Increment message counter
	messageCounter := messageCounter + 1;
END_ACTION


ACTION msg_orion_tx21: 
	
	// Command ID
	// MPO1 - Precharge relay state
	gAMS.cmd.mpo1.0 := gORION.relays.precharge;
	memcpy(ADR(ArCanSend_0.Frame.Data[0]), ADR(gAMS.cmd.mpo1), 1);
	// MPO2 - AIR+ relay state
	gAMS.cmd.mpo2.0 := gORION.relays.airPlus;
	memcpy(ADR(ArCanSend_0.Frame.Data[1]), ADR(gAMS.cmd.mpo2), 1);
	// MPO3 - AIR- relay state
	gAMS.cmd.mpo3.0 := gORION.relays.airMinus;
	memcpy(ADR(ArCanSend_0.Frame.Data[2]), ADR(gAMS.cmd.mpo3), 1);
	
	
	// Message counter
	// memcpy(ADR(ArCanSend_0.Frame.Data[1]), ADR(messageCounter), 1);
	
	IF NOT gIsSimulation THEN
		(* Set ID *)
		ArCanSend_0.Frame.ID 			:= TX_ORION_ID_BASE + 16#021;
		
		(* Set DLC *)
		ArCanSend_0.Frame.DataLength 	:= 8;
		
		(* Send message *)
		ArCanSend_0(SendFrame := TRUE);
		ArCanSend_0(SendFrame := FALSE);
	END_IF;
	
	// Increment message counter
	messageCounter := messageCounter + 1;
END_ACTION
