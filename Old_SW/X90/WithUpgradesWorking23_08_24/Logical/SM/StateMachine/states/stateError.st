
(* State State Error *)
ACTION stateError: 
	// gAMS.cmd.abort := TRUE;
	
	
END_ACTION


(* Conditions for state change for STATE_ERROR *)
ACTION stateChangeError: 
	IF gStateMachine.status.stateChangeAllowed THEN
		(* Update instruction string *)
		IF NOT gSafetyChain.status.scOK_notEnabled THEN
			// Safety chain is not alright 
			gStateMachine.status.instructionIndex := INST_CLOSE_SAFETY_CHAIN;	
		ELSE
			// Safety chain is alright. Some other problem is active
			gStateMachine.status.instructionIndex := INST_FIX_ERROR;
		END_IF;
		
		(* If safety chain is OK *)
		IF gSafetyChain.status.scOK_notEnabled AND NOT gTorqueSensor.status.criticalError THEN
			gAMS.cmd.abort := FALSE;
			gStateMachine.status.state := STATE_IDLE;	
		END_IF
	END_IF;
	
END_ACTION