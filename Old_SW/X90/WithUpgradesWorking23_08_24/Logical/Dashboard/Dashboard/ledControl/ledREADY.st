

(* Control the READY LED *)
ACTION ledREADY: 
	IF gStateMachine.status.state = STATE_INITIALIZE THEN
		gDashboard.outputs.do_ledREADY := READY_ON;	
	ELSE
		IF gStateMachine.status.state = STATE_DRIVE THEN
			gDashboard.outputs.do_ledREADY := READY_ON;
		ELSIF gStateMachine.status.readyForStateDrive THEN
			gDashboard.outputs.do_ledREADY := READY_FAST_BLINK;
		ELSIF gStateMachine.status.state = STATE_TRACTIVE THEN
			gDashboard.outputs.do_ledREADY := READY_SLOW_BLINK;		
		ELSE
			gDashboard.outputs.do_ledREADY := READY_OFF;
		END_IF
	END_IF
	
	// Slow blink: State = TRACTIVE
	// Fast blink: State = TRACTIVE & gBraking.status.softBraking = TRUE & NOT gTorqueSensor.status.criticalError
	// On = DRIVE
	// Off : Else
	
END_ACTION
