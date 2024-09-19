
(* State Ready *)
ACTION stateEnablingSC: 
	(* Update instruction string *)
	gStateMachine.status.instructionIndex := INST_SC_NOT_ENABLED;
END_ACTION

(* Conditions for state change for STATE_ENABLE_SAFETY_CHAIN *)
ACTION stateChangeEnablingSC: 
	IF gStateMachine.status.stateChangeAllowed THEN
		(* If message received from AMS saying that SC is enabled *)
		IF gAMS.status.scEnabled THEN
			gStateMachine.status.state := STATE_SC_ENABLED;
		END_IF
		
		(* If safety chain is broken go to state 'stateError' *)
		IF NOT gSafetyChain.status.scOK_notEnabled THEN
			gStateMachine.status.state 	:= STATE_ERROR;
			gAMS.cmd.abort 				:= TRUE;
		END_IF
		
		IF gStateMachine.status.stateChangeTimeout THEN
			gAMS.cmd.abort := TRUE;
			gStateMachine.status.state 			    := STATE_IDLE;
		END_IF;
	END_IF;
	
END_ACTION