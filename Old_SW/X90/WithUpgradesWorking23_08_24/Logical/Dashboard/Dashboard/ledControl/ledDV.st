
(* Control the DV LED *)
ACTION ledDV: 
	IF gStateMachine.status.state = STATE_INITIALIZE THEN
		gDashboard.outputs.do_ledDV := TRUE;
	ELSE
		gDashboard.outputs.do_ledDV := FALSE;
	END_IF;
END_ACTION
