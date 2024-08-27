//
ACTION changeStateDelay: 
	IF gStateMachine.status.state <> STATE_TRACTIVE THEN
		gStateMachine.status.readyForStateDrive := FALSE;	
	END_IF
	


	TON_stateChange(IN := gStateMachine.status.stateOld <> gStateMachine.status.state);		
	IF TON_stateChange.Q THEN
		gStateMachine.status.stateOld := gStateMachine.status.state;
	END_IF;
	
	
	gStateMachine.status.stateChangeAllowed := gStateMachine.status.stateOld = gStateMachine.status.state;
	
	
	
	
END_ACTION
