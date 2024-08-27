
(* Control the LV LED *)
ACTION ledLV: 	
	
	IF gStateMachine.status.state = STATE_INITIALIZE THEN
		gDashboard.outputs.do_ledLV := FALSE;
	
	ELSE
		IF gLowVoltageBattery.status.empty THEN
			gDashboard.outputs.do_ledLV := TRUE;
		ELSE
			gDashboard.outputs.do_ledLV := FALSE;
		END_IF;
		
	END_IF;
	
	
	
END_ACTION