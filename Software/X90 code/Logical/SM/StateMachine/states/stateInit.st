
(* State Initialize *)
ACTION stateInit: 

	this.TON_initialization();
	
	(* Start timer *)
	IF NOT this.TON_initialization.IN THEN
		this.TON_initialization.IN := TRUE;
	END_IF
	
END_ACTION


(* Conditions for state change for STATE_INITIALIZE*)
ACTION stateChangeInit: 

	(* Initialization done change state to ready *)
	IF this.TON_initialization.Q THEN
		this.TON_initialization.IN := FALSE;
		gStateMachine.status.state := STATE_IDLE;		
	END_IF
	
END_ACTION
