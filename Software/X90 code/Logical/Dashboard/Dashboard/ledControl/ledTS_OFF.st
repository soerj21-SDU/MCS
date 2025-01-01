

(* Control the TS_OFF LED *)
ACTION ledTS_OFF: 
	IF gStateMachine.status.state = STATE_INITIALIZE THEN
		gDashboard.outputs.do_ledTS_OFF := TRUE;
	ELSE
		gDashboard.outputs.do_ledTS_OFF := NOT (gStateMachine.status.state = STATE_TRACTIVE OR  gStateMachine.status.state = STATE_DRIVE);
	END_IF;
	
END_ACTION
