
(* Control the AMS LED *)
ACTION ledAMS: 
	IF gStateMachine.status.state = STATE_INITIALIZE THEN
		gDashboard.outputs.do_ledAMS := TRUE;
	ELSE
		gDashboard.outputs.do_ledAMS := gAMS.status.error.amsError;
	END_IF;
	
END_ACTION
