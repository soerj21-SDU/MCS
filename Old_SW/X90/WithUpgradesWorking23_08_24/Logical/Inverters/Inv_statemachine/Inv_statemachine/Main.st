
PROGRAM _INIT
	(* Actions *)
	missionInit;
	
	
	(* Variable initializations  *)
	gInverters.cmd.autoReset := TRUE;
	
	(* Inverter Statuses *)
	FOR i := 0 TO INVERTER_COUNT DO
		// Determine if the inverters have errors or not
		gInverters.inverter[i].status.ok := 	NOT gInverters.inverter[i].status.inverterDisconnected AND 
									gInverters.inverter[i].status.inverterEnabled AND 
									(gInverters.inverter[i].status.state = INV_STATE_IDLE OR gInverters.inverter[i].status.state = INV_STATE_DRIVE OR gInverters.inverter[i].status.state = INV_STATE_SWITCH_ON);
	END_FOR;
	
	
	(* Intialize all inverter states *)
	FOR i := 0 TO INVERTER_COUNT DO
		gInverters.inverter[i].status.state  := INV_STATE_INIT;
	END_FOR;
	
//	gInverters.inverter[0].cmd.setModeManual := TRUE;

	
	TON_powerInv34.PT := T#1s;
	TON_powerInv34.IN := TRUE;
	
	TON_powerCycle[0].PT := T#5s;
	TON_powerCycle[1].PT := T#5s;
	
	gInverters.cmd.manualControl := FALSE;
	
	gInverters.cmd.enableConfigurationDuringDrive := FALSE;		// As default - Configuration of inverter parameters is not allowed during drive
	

	
	gInverters.output.do_enableInv12 	:= TRUE;
	gInverters.output.do_enableInv34 	:= TRUE;
	
	gInverters.cmd.activateInverters := FALSE;
END_PROGRAM

PROGRAM _CYCLIC
		
	(* Actions *)
	hmiAction;
	missionCyclic;

	
	
	gInverters.status.configurationEnabled := (gStateMachine.status.state <> STATE_DRIVE) OR gInverters.cmd.enableConfigurationDuringDrive;
	
	// Handle start and stop commands for the inverters depending on the car global state machine

	

	gInverters.cmd.activateInverters := gStateMachine.status.state = STATE_DRIVE;

	
//	gInverters.cmd.activateInverters := gStateMachine.status.state = STATE_DRIVE AND tempActivateInvsWhenInDrive;
	gInverters.cmd.stopInverters 	 := NOT gInverters.cmd.activateInverters;
	
	
	(* Mirror commands *)
	FOR i := 0 TO INVERTER_COUNT DO
		gInverters.inverter[i].cmd.startInverter := gInverters.cmd.activateInverters;
		gInverters.inverter[i].cmd.stopInverter  := gInverters.cmd.stopInverters;	
	END_FOR;

	TON_powerInv34();

	
	gInverters.inverter[1].cmd.powerCycle := gInverters.inverter[0].cmd.powerCycle := gInverters.cmd.powerCyclePair12;
	gInverters.inverter[3].cmd.powerCycle := gInverters.inverter[2].cmd.powerCycle := gInverters.cmd.powerCyclePair34;
	
	IF gStateMachine.status.state <> STATE_INITIALIZE THEN
		FOR i := 0 TO INVERTER_COUNT DO
			CASE gInverters.inverter[i].status.state OF
				INV_STATE_INIT:
					gInverters.inverter[i].status.stateName := 'Initialization';
					gInverters.output.do_powerInv12 := TRUE;
					
					IF TON_powerInv34.Q OR i < 2 THEN
						IF TON_powerInv34.Q THEN
							gInverters.output.do_powerInv34 	:= TRUE;	
							TON_powerInv34.IN 					:= FALSE;
						END_IF;
						gInverters.inverter[i].status.state 	:= INV_STATE_IDLE;
					END_IF
					
				INV_STATE_IDLE:
					gInverters.inverter[i].status.stateName := 'Idle';
					
					
					// If the start command has been send to the inverter. Start it up
					IF gInverters.inverter[i].cmd.startInverter THEN
						gInverters.inverter[i].status.state 		:= INV_STATE_SWITCH_ON;
						gInverters.inverter[i].status.substate 		:= 0;
					END_IF;
					
					// If an error occurs. Go to error state
					// OR NOT gInverters.inverter[i].inputs.com_systemReady
					IF gInverters.inverter[i].inputs.com_error OR (gInverters.inverter[i].status.inverterDisconnected AND NOT gIsSimulation) THEN
						gInverters.inverter[i].status.state 		:= INV_STATE_ERROR;
						gInverters.inverter[i].status.returnState 	:= INV_STATE_IDLE;
						gInverters.inverter[i].status.substate 		:= 0;
					END_IF;
					
					
				INV_STATE_SWITCH_ON:
					gInverters.inverter[i].status.stateName := 'Switching ON';
					CASE gInverters.inverter[i].status.substate OF
						0:  // System ready
							IF  gInverters.inverter[i].inputs.com_systemReady THEN;
								gInverters.inverter[i].status.substate 			:= 10;							
							END_IF;
						
						10: // Turn on DC
	//						IF NOT gInverters.inverter[i].cmd.setModeManual THEN
								gInverters.inverter[i].outputs.com_dcOn 		:= TRUE;
	//						END_IF;
							// Change state when precharge is done
							IF  gInverters.inverter[i].inputs.com_dcOn AND gInverters.inverter[i].inputs.com_quitDcOn THEN
								gInverters.inverter[i].status.substate 			:= 20;	
							END_IF;
							
						20: // Set torque limits
							gInverters.inverter[i].outputs.com_torqueLimitPos 	:= 0;
							gInverters.inverter[i].outputs.com_torqueLimitNeg 	:= 0;
							gInverters.inverter[i].status.substate 				:= 30;
							
						30: // Some hardware stuff
							// SET EF/EF2 = TRUE
							IF i = 0 OR i = 1 THEN
								gInverters.output.do_enableInv12 := TRUE;
							ELSE
								gInverters.output.do_enableInv34 := TRUE;
							END_IF;
							gInverters.inverter[i].status.substate 				:= 35;
						35:	
							// X140 binary input BE1 = TRUE
							gInverters.inverter[i].outputs.do_enable          	:= TRUE;
							gInverters.inverter[i].status.substate 				:= 40;
							
							
						40: // Enable inverter
	//						IF NOT gInverters.inverter[i].cmd.setModeManual THEN
								gInverters.inverter[i].outputs.com_enable 		:= TRUE;
	//						END_IF;
							gInverters.inverter[i].status.substate 				:= 50;
							
						50: // Turn inverter ON
	//						IF NOT gInverters.inverter[i].cmd.setModeManual THEN
								gInverters.inverter[i].outputs.com_interverOn 	:= TRUE;
	//						END_IF;
							
							IF gInverters.inverter[i].inputs.com_inverterOn AND gInverters.inverter[i].inputs.com_quitInverterOn THEN
								gInverters.inverter[i].status.substate 			:= 60;
							END_IF;
							
						60: // More hardware stuff
							// Set X140 binary input BE2 = 1
							gInverters.inverter[i].outputs.do_torqueLimitActive := TRUE;
							gInverters.inverter[i].status.substate 		  		:= 200;	
							
						200: // Start up complete. Go into drive
							gInverters.inverter[i].status.state 				:= INV_STATE_DRIVE;
							gInverters.inverter[i].status.substate 				:= 0;
						
	
						
					END_CASE;
					
					IF gInverters.inverter[i].cmd.stopInverter THEN
						gInverters.inverter[i].status.state 	:= INV_STATE_SWITCH_OFF;
						gInverters.inverter[i].status.substate 	:= 0;
					END_IF;
					
					// If an error occurs. Go to error state
					IF gInverters.inverter[i].inputs.com_error OR NOT gInverters.inverter[i].inputs.com_systemReady OR (gInverters.inverter[i].status.inverterDisconnected AND NOT gIsSimulation) THEN
						gInverters.inverter[i].status.state 		:= INV_STATE_ERROR;
						gInverters.inverter[i].status.returnState 	:= INV_STATE_SWITCH_ON;
						gInverters.inverter[i].status.substate 		:= 0;
					END_IF;
				
					
				INV_STATE_DRIVE:
					gInverters.inverter[i].status.stateName := 'Drive';
					
					// Check if inverter is in auto mode
	//				IF NOT gInverters.inverter[i].inputs.cmd_manual THEN
	//					gInverters.inverter[i].outputs.com_targetVelocity := 0;
	//					gInverters.inverter[i].outputs.com_torqueLimitPos := 0;
	//					gInverters.inverter[i].outputs.com_torqueLimitNeg := 0;
	//				END_IF;
					
					// Check if the stop commando has been send
					IF gInverters.inverter[i].cmd.stopInverter THEN
						gInverters.inverter[i].status.state 	:= INV_STATE_SWITCH_OFF;
						gInverters.inverter[i].status.substate 	:= 0;
					END_IF;
					
					// If an error occurs. Go to error state
					IF gInverters.inverter[i].inputs.com_error OR NOT gInverters.inverter[i].inputs.com_systemReady OR (gInverters.inverter[i].status.inverterDisconnected AND NOT gIsSimulation) THEN
						gInverters.inverter[i].status.state 			:= INV_STATE_ERROR;
						gInverters.inverter[i].status.returnState 		:= INV_STATE_SWITCH_ON;
						gInverters.inverter[i].status.substate 			:= 0;
					END_IF;
	
				INV_STATE_SWITCH_OFF:
					gInverters.inverter[i].status.stateName := 'Switching OFF';
					
					CASE gInverters.inverter[i].status.substate OF
						0: // Reset all setpoints
							gInverters.inverter[i].outputs.com_targetTorque 	:= 0;
							gInverters.inverter[i].outputs.com_torqueLimitPos 	:= 0;
							gInverters.inverter[i].outputs.com_torqueLimitNeg 	:= 0;
							gInverters.inverter[i].status.substate 				:= 10;
						
						10: // Hardware stuff
							// X140 binary input BE2 = FALSE
							gInverters.inverter[i].outputs.do_torqueLimitActive :=FALSE;
							gInverters.inverter[i].status.substate 			:= 20;
						
						20: // Turn off inverter
							gInverters.inverter[i].outputs.com_interverOn 	:= FALSE;
							gInverters.inverter[i].status.substate 			:= 30;
						
						30: // Disable inverter
							gInverters.inverter[i].outputs.com_enable 		:= FALSE;
							gInverters.inverter[i].status.substate 			:= 40;
							
						40: // Inverter turned off
							IF NOT gInverters.inverter[i].inputs.com_quitInverterOn THEN
								gInverters.inverter[i].status.substate 		:= 50;
							END_IF;
						
						50: // More hardware stuff
							// SET EF/EF2 = FALSE
							IF i = 0 OR i = 1 THEN
								gInverters.output.do_enableInv12 := FALSE;
							ELSE
								gInverters.output.do_enableInv34 := FALSE;
							END_IF;
							gInverters.inverter[i].status.substate 			:= 55;
						55:	
							// X140 binary input BE1 = FALSE
							gInverters.inverter[i].outputs.do_enable        := FALSE;
							gInverters.inverter[i].status.substate 			:= 60;
							
						60: // Turn DC OFF
							gInverters.inverter[i].outputs.com_dcOn 		:= FALSE;
							gInverters.inverter[i].status.substate 			:= 70;
							
						70: // Check that DC is off
							IF NOT gInverters.inverter[i].inputs.com_quitDcOn THEN
								gInverters.inverter[i].status.substate 		:= 80;	
							END_IF;
							gInverters.inverter[i].status.substate 			:= 200;
	
						200: // Change state 
							gInverters.inverter[i].status.state 			:= INV_STATE_IDLE;
							gInverters.inverter[i].status.substate 			:= 0;
						
					END_CASE;
					
					// If an error occurs. Go to error state
					IF gInverters.inverter[i].inputs.com_error OR NOT gInverters.inverter[i].inputs.com_systemReady OR (gInverters.inverter[i].status.inverterDisconnected AND NOT gIsSimulation) THEN
						gInverters.inverter[i].status.state 				:= INV_STATE_ERROR;
						gInverters.inverter[i].status.returnState 			:= INV_STATE_IDLE;
						gInverters.inverter[i].status.substate 				:= 0;
					END_IF;
		
				// Error state - Hard error. System needs to be reset in some way
				INV_STATE_ERROR:
					gInverters.inverter[i].status.stateName := 'Error';
					IF NOT gInverters.cmd.manualControl THEN
						CASE gInverters.inverter[i].status.substate OF
							
							// Turn drive off
							0: // Reset all setpoints
								gInverters.inverter[i].outputs.com_torqueLimitNeg 	:= 0;
								gInverters.inverter[i].outputs.com_torqueLimitPos 	:= 0;
								gInverters.inverter[i].outputs.com_targetTorque   	:= 0;
								
								gInverters.inverter[i].status.substate 				:= 10;
							10: // Turn off inverter
								gInverters.inverter[i].outputs.com_interverOn 		:= FALSE;
								gInverters.inverter[i].status.substate 				:= 20;
								
							20: // Set enable to false
								gInverters.inverter[i].outputs.com_enable 			:= FALSE;
								gInverters.inverter[i].status.substate 				:= 30;
								
							30: // Turn off torque
								// DI2 = 0
								gInverters.inverter[i].status.substate 				:= 40;
		
							40: // Turn off control
								// DI1 = 0
								gInverters.inverter[i].outputs.do_enable 			:= FALSE;
								gInverters.inverter[i].outputs.do_torqueLimitActive := FALSE;
	//							IF i = 0 OR i = 1 THEN
	//								gInverters.output.do_enableInv12 				:= FALSE;
	//							ELSE
	//								gInverters.output.do_enableInv34 				:= FALSE;
	//							END_IF;
								
								gInverters.inverter[i].status.substate 				:= 100;
								
							// Eliminate cause of error
							100:
								
								(* 
								
								DO SOMETHING. ELIMINATE EVERYTHING. 
								
								*)
								
								// If error is gone
								IF (NOT gInverters.inverter[i].inputs.com_error) AND (NOT gInverters.inverter[i].status.inverterDisconnected OR gIsSimulation) AND 
									(NOT gInverters.cmd.manualControl) AND (gInverters.inverter[i].inputs.com_systemReady) THEN
									gInverters.inverter[i].status.substate 		:= 200;
								END_IF
								
								
								
							200: // Start back up					
								// Return to the specified return-state
								gInverters.inverter[i].status.state 	:= gInverters.inverter[i].status.returnState;
								gInverters.inverter[i].status.substate 	:= 0;
						END_CASE;
					END_IF;
					
				 	// Stop button pressed. Disable everything and go to idle
					IF gInverters.inverter[i].cmd.stopInverter THEN
						// Disable everything
						gInverters.inverter[i].outputs.com_dcOn 				:= FALSE;
						gInverters.inverter[i].outputs.com_enable 				:= FALSE;
						gInverters.inverter[i].outputs.com_interverOn 			:= FALSE;
						gInverters.inverter[i].outputs.com_targetTorque 		:= 0;
						gInverters.inverter[i].outputs.com_torqueLimitNeg 		:= 0;
						gInverters.inverter[i].outputs.com_torqueLimitPos 		:= 0;
						IF NOT gInverters.cmd.manualControl THEN
							gInverters.inverter[i].outputs.do_enable 				:= FALSE;
							gInverters.inverter[i].outputs.do_torqueLimitActive 	:= FALSE;
						END_IF;
						
//						IF i = 0 OR i = 1 THEN
//							gInverters.output.do_enableInv12 := FALSE;
//						ELSE
//							gInverters.output.do_enableInv34 := FALSE;
//						END_IF;
	//					// Switch state
	//					gInverters.inverter[i].status.state 	:= INV_STATE_IDLE;
	//					gInverters.inverter[i].status.substate 	:= 0;
					END_IF;
				
				INV_STATE_POWER_CYCLE:
					gInverters.inverter[i].status.stateName := 'Power Cycling';
	
					IF i = 0 OR i = 1 THEN
						TON_powerCycle[0].IN := TRUE;
						gInverters.output.do_powerInv12 := FALSE;
						IF TON_powerCycle[0].Q THEN
							TON_powerCycle[0].IN := FALSE;
							gInverters.inverter[i].status.state  := INV_STATE_INIT;
						END_IF;
					ELSIF i = 2 OR i = 3 THEN
						TON_powerCycle[1].IN := TRUE;
						gInverters.output.do_powerInv34 := FALSE;
						IF TON_powerCycle[1].Q THEN
							TON_powerCycle[1].IN := FALSE;
							gInverters.inverter[i].status.state  := INV_STATE_INIT;
							TON_powerInv34.IN := TRUE;
						END_IF;
					END_IF;
				
					IF gInverters.inverter[i].cmd.stopInverter THEN
						gInverters.inverter[i].status.state 		:= INV_STATE_IDLE;
						gInverters.inverter[i].status.substate 	:= 0;
					END_IF;
			END_CASE;
	
			
			
			
			IF gInverters.cmd.autoReset THEN
				// Small error - Soft reset without removing the motor from 'drive'
				gInverters.inverter[i].outputs.com_errorReset := gInverters.inverter[i].inputs.com_error;
			END_IF;
			
			// If inverter is commanded to power cycle. Change its state to STATE_POWER_CYCLE
			IF gInverters.inverter[i].cmd.powerCycle THEN
				gInverters.inverter[i].status.state   := INV_STATE_POWER_CYCLE;
				gInverters.inverter[i].cmd.powerCycle := FALSE;
			END_IF;
			
			
			
			(* Control the error timeout *)
			errorTimeout;
		
		END_FOR;
	END_IF;
	
	
	TON_powerCycle[0]();
	TON_powerCycle[1]();
	
	FOR i := 0 TO INVERTER_COUNT DO
		IF gInverters.cmd.powerCycle THEN
			gInverters.inverter[i].status.state  := INV_STATE_POWER_CYCLE;
		END_IF;
	END_FOR;
	
	FOR i := 0 TO INVERTER_COUNT DO
//	i := 2;
		IF gInverters.inverter[i].status.stateName <> oldStateName[i] THEN
			gEventLog.newEventString := 'Inv';
			IF    i = 0 THEN strcat(ADR(gEventLog.newEventString),ADR('1 '));
			ELSIF i = 1 THEN strcat(ADR(gEventLog.newEventString),ADR('2 '));
			ELSIF i = 2 THEN strcat(ADR(gEventLog.newEventString),ADR('3 '));
			ELSE 			 strcat(ADR(gEventLog.newEventString),ADR('4 '));
			END_IF;
			
			strcat(ADR(gEventLog.newEventString),ADR('now in state: '));
			strcat(ADR(gEventLog.newEventString),ADR(gInverters.inverter[i].status.stateName));
			logEvent;
		END_IF;
		oldStateName[i] := gInverters.inverter[i].status.stateName;
	END_FOR;

	
	gInverters.cmd.stopInverters := FALSE;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)

END_PROGRAM

