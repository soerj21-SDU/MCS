
(* Control the EBS LED *)
ACTION ledEBS: 
	IF gStateMachine.status.state = STATE_INITIALIZE THEN
		gDashboard.outputs.do_ledEBS := TRUE;
	ELSE
		gDashboard.outputs.do_ledEBS := FALSE;
	END_IF;
END_ACTION
