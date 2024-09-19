
(* Control the IMD LED *)
ACTION ledIMD: 
	IF gStateMachine.status.state = STATE_INITIALIZE THEN
		gDashboard.outputs.do_ledIMD := TRUE;
	ELSE
		gDashboard.outputs.do_ledIMD := gAMS.status.error.imdError;
	END_IF;
END_ACTION
