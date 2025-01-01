
PROGRAM _INIT
	(* Device *)
	deviceName 						:= 'IF6.ST1.IF1';
	(* Bus *)
	ArCanSetBaudrate_0.Baudrate 	:= 1000000;
	(* Tramsit *)
	ArCanSend_0.Frame.Format 		:= arCAN_11BIT;
	(* Receive *)
	ArCanReceive_0.Format 			:= arCAN_11BIT;
	ArCanReceive_0.QueueSize		:= 100;
	ArCanReceive_0.IDMask			:= arCAN_RECEIVE_ALL;
	
	communicationState 				:= S_INIT;
	
	scLedState 						:= OFF;
	ledLVState 						:= 0;
	
	
	RX_CAN_ID_BASE 					:= 16#580;
	TX_CAN_ID_BASE 					:= 16#580;
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	(* Determine of the Dashboard has an error or is working properly*)
	gDashboard.status.ok := NOT gDashboard.status.DashboardDisconnected AND gDashboard.status.errorCode = 0;
	
	(* LED Control *)
	ledAMS;
	ledDV;
	ledEBS;
	ledIMD;
	ledLV;
	ledREADY;
	ledSC;
	ledTS_OFF;
	ErrorDashboard;
	
	(* Send and receive messages *)
	can;
	
	(* Error *)
	errors;
	
	
	// Log button presses
	IF EDGEPOS(gDashboard.inputs.di_button1) THEN
		gEventLog.newEventString := 'Button 1 pressed';
		logEvent;
	END_IF;
	IF EDGEPOS(gDashboard.inputs.di_button2) THEN
		gEventLog.newEventString := 'Button 2 pressed';
		logEvent;
	END_IF;
	IF EDGEPOS(gDashboard.inputs.di_button3) THEN
		gEventLog.newEventString := 'Button 3 pressed';
		logEvent;
	END_IF;
	IF EDGEPOS(gDashboard.inputs.di_button4) THEN
		gEventLog.newEventString := 'Button 4 pressed';
		logEvent;
	END_IF;
	IF EDGEPOS(gDashboard.inputs.di_buttonSafety) THEN
		gEventLog.newEventString := 'Button Safety pressed';
		logEvent;
	END_IF;
	IF EDGEPOS(gDashboard.inputs.di_buttonTractive) THEN
		gEventLog.newEventString := 'Button Tractive pressed';
		logEvent;
	END_IF;
	IF EDGEPOS(gDashboard.inputs.di_buttonDrive) THEN
		gEventLog.newEventString := 'Button Drive pressed';
		logEvent;
	END_IF;
	
	
	
END_PROGRAM

PROGRAM _EXIT

	
END_PROGRAM

