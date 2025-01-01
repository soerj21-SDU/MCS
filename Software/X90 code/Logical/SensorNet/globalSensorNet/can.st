
ACTION can: 

	CASE communicationState OF
		S_INIT:	// Init
			(* PLC is not simulated. It is run on an actual PLC *)
			IF NOT gIsSimulation THEN
				
				(* Configure CAN port *)
				ArCanSetBaudrate_0.DeviceName	:= deviceName;	

				ArCanSetBaudrate_0.Execute 	:= TRUE;
				IF ArCanSetBaudrate_0.Done THEN
					communicationState 	:= S_INIT_TX;
				END_IF;
				
				IF ArCanSetBaudrate_0.Error THEN
					communicationState 	:= S_ERROR;
				END_IF;
				
				
			ELSE
				(* PLC is simulated. It is run in the simulator and no hardware is connnected *)
				communicationState 		:= S_IDLE;
			END_IF;
			
		S_INIT_TX:	// Init Transmit
			(* Configure send function block *)
			ArCanSend_0.Enable 			:= TRUE;
			ArCanSend_0.DeviceName 		:= deviceName;
			
			
			IF ArCanSend_0.Active THEN
				communicationState 		:= S_INIT_RX;
			END_IF;
			
			IF ArCanSend_0.Error THEN
				communicationState 		:= S_ERROR;
			END_IF;
			
			
		S_INIT_RX:	// Init Receive
			(* Configure receive function block *)
			ArCanReceive_0.Enable 			:= TRUE;
			ArCanReceive_0.DeviceName 		:= deviceName;
			
			IF ArCanReceive_0.Active THEN
				(* CAN port successfully enabled *)
				communicationState 		:= S_RUNNING;
			END_IF;
			
			IF ArCanReceive_0.Error THEN
				communicationState 		:= S_ERROR;
			END_IF

			
		S_RUNNING:	// Running
			Send_Bus;		// Handle transmit 
			Receive_Bus;	// Handle receive
		
		S_ERROR: // Error
			IF ArCanSend_0.Error THEN
				ArCanSend_0(Enable := FALSE);
				ArCanSend_0(Enable := TRUE);
			END_IF;
	
			IF ArCanReceive_0.Error THEN
				ArCanReceive_0(Enable := FALSE);
				ArCanReceive_0(Enable := TRUE);
			END_IF;
			
			IF ArCanReceive_0.Error = FALSE AND ArCanSend_0.Error = FALSE AND ArCanSetBaudrate_0.Error = FALSE THEN
				communicationState 		:= S_INIT;
			END_IF;
		S_IDLE: // Do nothing
	END_CASE
	
	
	IF NOT gIsSimulation THEN
		ArCanSetBaudrate_0();
		ArCanSend_0();
		ArCanReceive_0();
	END_IF;
	
	
	
END_ACTION
