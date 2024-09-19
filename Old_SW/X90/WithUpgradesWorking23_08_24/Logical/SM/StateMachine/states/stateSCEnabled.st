

(* State Safety Chain Enabled *)
ACTION stateSCEnabled: 


END_ACTION

(* Conditions for state change for STATE_SAFETY_CHAIN_ENABLED *)
ACTION stateChangeSCEnabled: 
	IF gStateMachine.status.stateChangeAllowed THEN

		(* Update instruction string *)
		gStateMachine.status.instructionIndex := INST_PRESS_TRACTIVE_BUTTON;
	
		(* If tractive button pressed change state to 'stateOpeningRelays' *)
		IF EDGEPOS(gDashboard.inputs.di_buttonTractive) THEN
			gStateMachine.status.state 	:= STATE_PRECHARGING;
			gAMS.cmd.startPrecharge 	:= TRUE;
			
			(* If the PLC is simulated reset the button *)
			IF gIsSimulation THEN
				gDashboard.inputs.di_buttonTractive := FALSE;
			END_IF
		END_IF

		
		(* If safety chain is broken go to state 'stateError' *)
		IF NOT gSafetyChain.status.scOKPersistent THEN
			gStateMachine.status.state 	:= STATE_ERROR;
			gAMS.cmd.abort 				:= TRUE;
		END_IF
	END_IF;
	
END_ACTION
