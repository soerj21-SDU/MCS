
(* State Ready *)
ACTION stateIdle: 
	
END_ACTION


(* Conditions for state change for STATE_READY *)
ACTION stateChangeIdle: 
	IF gStateMachine.status.stateChangeAllowed THEN

		(* Update instruction string *)
		gStateMachine.status.instructionIndex := INST_PRESS_SAFETY_BUTTON;
	
		(* If safety button is pressed enable safety chain *)	
		IF EDGEPOS(gDashboard.inputs.di_buttonSafety) THEN
			gStateMachine.status.state 	:= STATE_ENABLING_SC;
			gAMS.cmd.enableSC 			:= TRUE;
			
			(* If the PLC is simulated reset the button *)
			IF gIsSimulation THEN
				gDashboard.inputs.di_buttonSafety := FALSE;
			END_IF
		END_IF
		
		(* If safety chain is broken go to state 'stateError' *)
		IF NOT gSafetyChain.status.scOK_notEnabled THEN
			gStateMachine.status.state 	:= STATE_ERROR;
			gAMS.cmd.abort 				:= TRUE;
		END_IF
	END_IF;
END_ACTION
