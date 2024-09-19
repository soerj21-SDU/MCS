
(* State Ready *)
ACTION statePrecharging: 

END_ACTION



(* State Ready *)
ACTION stateChangePrecharging: 
	IF gStateMachine.status.stateChangeAllowed THEN
		(* Update Instruction Index *)
		gStateMachine.status.instructionIndex := INST_PRE_CHARGING;
		
		IF gAMS.status.prechargingDone THEN
			gStateMachine.status.state := STATE_TRACTIVE;
		END_IF
		
		IF gStateMachine.status.stateChangeTimeout THEN
			gAMS.cmd.abort 				:= TRUE;
			gStateMachine.status.state 	:= STATE_IDLE; 
		END_IF;
		
		(* If safety chain is broken go to state 'stateError' *)
		IF NOT gSafetyChain.status.scOKPersistent THEN
			gStateMachine.status.state 	:= STATE_ERROR;
			gAMS.cmd.abort 				:= TRUE;
		END_IF
	END_IF;
END_ACTION

