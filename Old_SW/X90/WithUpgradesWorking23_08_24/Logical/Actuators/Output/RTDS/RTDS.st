
ACTION RtdsInit: 
	rtdsConstants.RTDSCurrent := 55;
	rtdsVariables.TON_RTDS.PT := T#2s;
END_ACTION

ACTION Rtds: 
	// Check if RTDS is turned on.
	gRTDS.status.RTDS_On  := gRTDS.outputs.do_RTDS AND gRTDS.inputs.im_RTDS_Current > rtdsConstants.RTDSCurrent;
	gRTDS.status.RTDS_Off := NOT gRTDS.status.RTDS_On;
	
	(* Check if the RTDS should be on and compare it with the current, and set a status flag *)
	gRTDS.status.RTDS_Disconnected := gRTDS.outputs.do_RTDS AND gRTDS.inputs.im_RTDS_Current < rtdsConstants.RTDSCurrent;
	
	// If the car is switched into state DRIVE, start RTDS
	IF gStateMachine.status.state = STATE_DRIVE AND gStateMachine.status.stateOld <> STATE_DRIVE AND NOT gRTDS.cmd.en_RTDS THEN
		gRTDS.cmd.en_RTDS := TRUE;		(* Set command RTDS = true *)
	END_IF;
	
	// Check for command to turn on timer
	IF gRTDS.cmd.en_RTDS THEN
		rtdsVariables.TON_RTDS.IN 	:= TRUE; (* Enable timer *)
		gRTDS.outputs.do_RTDS 		:= TRUE; (* Set output high *)
	END_IF
	
	rtdsVariables.TON_RTDS();			(* Handle timer *)
	
	// If timer runs out
	IF rtdsVariables.TON_RTDS.Q THEN
		gRTDS.cmd.en_RTDS 			:= FALSE; (* Disable command *)
		gRTDS.outputs.do_RTDS 		:= FALSE; (* Set output low *)
		rtdsVariables.TON_RTDS.IN 	:= FALSE; (* Disable timer *)
	END_IF
	
	
	(* Determine if the RTDS is working properly *)
	gRTDS.status.ok := NOT gRTDS.status.RTDS_Disconnected;
	
END_ACTION
