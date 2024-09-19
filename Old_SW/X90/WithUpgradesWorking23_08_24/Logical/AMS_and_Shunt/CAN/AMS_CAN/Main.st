
PROGRAM _INIT
	(* Device *)
	deviceName 						:= 'IF9';
	(* Bus *)
	ArCanSetBaudrate_0.Baudrate 	:= 500000;
	(* Transmit *)
	ArCanSend_0.Frame.Format 		:= arCAN_11BIT;
	(* Receive *)
	ArCanReceive_0.Format 			:= arCAN_11BIT;
	ArCanReceive_0.QueueSize		:= 100;
	ArCanReceive_0.IDMask			:= arCAN_RECEIVE_ALL;
	
	
	communicationState := S_INIT;
	
	
	RX_CAN_ID_BASE 		:= 16#300;
	TX_CAN_ID_BASE 		:= 16#300;
	RX_ORION_ID_BASE	:= 16#400;
	TX_ORION_ID_BASE	:= 16#400;
	SHUNT_ID_BASE  		:= 16#500;
	
	
	NO_OF_BANKS := 4;
//	gAMS.status.error.dataFrameLost := FALSE;
	
END_PROGRAM

PROGRAM _CYCLIC
	

	CASE communicationState OF
		S_INIT:
			(* PLC is not simulated. It is run on an actual PLC *)
			IF NOT gIsSimulation THEN
				
				(* Configure CAN port *)
				ArCanSetBaudrate_0.DeviceName	:= deviceName;	
				ArCanSetBaudrate_0.Execute 		:= TRUE;
				IF ArCanSetBaudrate_0.Done THEN
					communicationState 			:= S_INIT_TX;
				END_IF;
				IF ArCanSetBaudrate_0.Error THEN
					communicationState 			:= S_ERROR;
				END_IF;			
			ELSE
				(* PLC is simulated. It is run in the simulator and no hardware is connnected *)
				communicationState 				:= S_IDLE;
			END_IF;
			
		S_INIT_TX: // Init Tx
			(* Configure send function block *)
			ArCanSend_0.Enable 			:= TRUE;
			ArCanSend_0.DeviceName 		:= deviceName;
			
			IF ArCanSend_0.Active THEN
				communicationState 		:= S_INIT_RX;
			END_IF;
			
			IF ArCanSend_0.Error THEN
				communicationState 		:= S_ERROR;
			END_IF;
			
			
		S_INIT_RX:	// Init Rx
			(* Configure receive function block *)
			ArCanReceive_0.Enable 		:= TRUE;
			ArCanReceive_0.DeviceName 	:= deviceName;

			IF ArCanReceive_0.Active THEN
				communicationState 		:= S_RUNNING;
			END_IF;
			
			IF ArCanReceive_0.Error THEN
				communicationState 		:= S_ERROR;
			END_IF

			
		S_RUNNING: // Running
			AMS_Send;		// Handle transmit task
			AMS_Receive;	// Handle receive task
		
		S_ERROR: // Error
			IF ArCanSend_0.Error THEN
				ArCanSend_0(Enable := FALSE);
				ArCanSend_0(Enable := TRUE);
			END_IF;
	
			IF ArCanReceive_0.Error THEN
				ArCanReceive_0(Enable := FALSE);
				ArCanReceive_0(Enable := TRUE);
			END_IF;
			
			IF (ArCanReceive_0.Error = FALSE) AND (ArCanSend_0.Error = FALSE) AND (ArCanSetBaudrate_0.Error = FALSE) THEN
				communicationState 		:= S_INIT;
			END_IF;
		S_IDLE: // Do nothing
	END_CASE
	

	IF NOT gIsSimulation THEN
		ArCanSetBaudrate_0();
		ArCanReceive_0();
		ArCanSend_0();
	END_IF;
	
//	gAMS.status.error.dataFrameLost := ArCanReceive_0.NumberOfLostFrames <> 0;

END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

