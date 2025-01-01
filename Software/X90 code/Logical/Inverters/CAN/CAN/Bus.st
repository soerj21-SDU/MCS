
ACTION Bus: 
	
	CASE bus[i].communicationState OF
		S_INIT: 	
			(* PLC is not simulated. It is run on an actual PLC *)
			IF NOT gIsSimulation THEN
				
				(* Configure CAN port *)
				bus[i].ArCanSetBaudrate_0.DeviceName	:= bus[i].deviceName;	
				
				bus[i].ArCanSetBaudrate_0.Execute 	:= TRUE;
				IF bus[i].ArCanSetBaudrate_0.Done THEN
					bus[i].communicationState := S_INIT_TX;
				END_IF;
				
				IF bus[i].ArCanSetBaudrate_0.Error THEN
					bus[i].communicationState := S_ERROR;
				END_IF;
				
				
			ELSE
				(* PLC is simulated. It is run in the simulator and no hardware is connnected *)
				bus[i].communicationState := S_IDLE;
			END_IF;
		S_INIT_TX:
			(* Configure send function block *)
			bus[i].ArCanSend_0.Enable 		:= TRUE;
			bus[i].ArCanSend_0.DeviceName 	:= bus[i].deviceName;
			
			IF bus[i].ArCanSend_0.Active THEN
				bus[i].communicationState := S_INIT_RX;
			END_IF;
			
			IF bus[i].ArCanSend_0.Error THEN
				bus[i].communicationState := S_ERROR;
			END_IF;
			
			
		S_INIT_RX:
			(* Configure receive function block *)
			bus[i].ArCanReceive_0.Enable 		:= TRUE;
			bus[i].ArCanReceive_0.DeviceName 	:= bus[i].deviceName;
			
			IF bus[i].ArCanReceive_0.Active THEN
				(* CAN port successfully enabled *)
				bus[i].communicationState := S_RUNNING;
			END_IF;
			
			IF bus[i].ArCanReceive_0.Error THEN
				bus[i].communicationState := S_ERROR;
			END_IF

			
		S_RUNNING:
			(* Send messages *)
			Send_Bus;
			
			(* Receive messages *)
			Receive_Bus;
			
		S_ERROR: // Error
			IF bus[i].ArCanSend_0.Error THEN
				bus[i].ArCanSend_0(Enable := FALSE);
				bus[i].ArCanSend_0(Enable := TRUE);
			END_IF;
	
			IF bus[i].ArCanReceive_0.Error THEN
				bus[i].ArCanReceive_0(Enable := FALSE);
				bus[i].ArCanReceive_0(Enable := TRUE);
			END_IF;
			
			IF bus[i].ArCanReceive_0.Error = FALSE AND bus[i].ArCanSend_0.Error = FALSE AND bus[i].ArCanSetBaudrate_0.Error = FALSE THEN
				bus[i].communicationState 	:= S_INIT;
			END_IF;
		S_IDLE: // Do nothing
	END_CASE


	IF NOT gIsSimulation THEN
		bus[i].ArCanSetBaudrate_0();
		bus[i].ArCanReceive_0();
		bus[i].ArCanSend_0();
	END_IF;
	
	// Service disconnection timers
	serviceDisconnectionDetection;

	
END_ACTION
