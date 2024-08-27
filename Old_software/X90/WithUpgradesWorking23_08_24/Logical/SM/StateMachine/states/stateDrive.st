

(* State Drive *)
ACTION stateDrive: 
	(* Update instruction string *)
	gStateMachine.status.instructionIndex 	:= INST_IN_DRIVE;
END_ACTION


(* Conditions for state change for STATE_DRIVE *)
ACTION stateChangeDrive: 
	IF gStateMachine.status.stateChangeAllowed THEN

		(* If safety chain is broken go to state 'stateError' *)
		IF NOT gSafetyChain.status.scOKPersistent THEN
			gStateMachine.status.state 	:= STATE_ERROR;
			gAMS.cmd.abort 				:= TRUE;
		END_IF
		
		(* If torque pedals get too far away from eachother. Exit drive and go to tractive *)
		IF gTorqueSensor.status.plausibilityError OR gInverters.cmd.exitDrive THEN
			gStateMachine.status.state := STATE_TRACTIVE;
		END_IF	
	END_IF;
	
END_ACTION