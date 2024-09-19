

(* State Tractive *)
ACTION stateTractive: 
	// Wait for a command to either go to drive or charging
	
END_ACTION

	(* Conditions for state change for STATE_OPENING_RELAYS *)
ACTION stateChangeTractive: 
	IF gStateMachine.status.stateChangeAllowed THEN

		(* If precharge is done and brake pressure is over threshold and drive button pressed change state to 'stateDrive'  *)
	
		(* If brakes are pressed *)
		IF 	gBraking.status.softBraking THEN
			(* No torque pedal critical error *)
			IF  NOT gTorqueSensor.status.criticalError AND gTorqueSensor.status.torquePercentage < 10 THEN
				(* Wait for AMS to be ready *)
				//IF gAMS.status.amsState = AMS_STATE_TC_ENABLED OR gAMS.status.amsState = AMS_STATE_DRIVE THEN
				IF gORION.state = PRECHARGING_DONE THEN
					(* Update instruction string. Press drive button *)
					gStateMachine.status.instructionIndex := INST_PRESS_DRIVE_BUTTON;
			
					(* Mark that the car is ready to go into drive *)
					gStateMachine.status.readyForStateDrive := TRUE;
					
					(* Pushing the drive button will set the car in state drive *)
					IF EDGEPOS(gDashboard.inputs.di_buttonDrive) THEN
						
						gStateMachine.status.state 	:= STATE_DRIVE;
						gAMS.cmd.enterDrive 		:= TRUE;
	
						(* If the PLC is simulated reset the button *)
						IF gIsSimulation THEN
							gDashboard.inputs.di_buttonDrive := FALSE;
						END_IF
					END_IF
				ELSE
					(* Wait for AMS to be ready *)
					gStateMachine.status.instructionIndex := INST_AMS_NOT_READY;
				END_IF;
			ELSE
				(* Update instruction string. Torque sensors out of range *)
				gStateMachine.status.instructionIndex := INST_TORQUE_PEDAL_FAULT;
			END_IF
		ELSE
			(* Update instruction string. Press brake *)
			gStateMachine.status.instructionIndex := INST_PRESS_BRAKE;
		END_IF

	
	
			
	
		(* If safety chain is broken go to state 'stateError' *)
		IF NOT gSafetyChain.status.scOKPersistent THEN
			gStateMachine.status.state 	:= STATE_ERROR;
			gAMS.cmd.abort 				:= TRUE;
		END_IF
		
	END_IF;
	
END_ACTION