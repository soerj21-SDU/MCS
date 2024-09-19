
PROGRAM _INIT
	pumpOffCurrent := 1000;
	pumpOnCurrent  := 9500;
	gCooling.cmd.manualMode := FALSE;
	//gCooling.outputs.do_pump[1] := TRUE;
	FOR i := 0 TO 1 DO
		gCooling.outputs.do_pump[i] 	:= TRUE;
		gCooling.outputs.do_fan[i] 		:= TRUE;
		//gCooling.outputs.do_pump[i] 	:= FALSE;
		//gCooling.outputs.do_fan[i] 		:= FALSE;
	END_FOR
	
	gCooling.status.warningHighTemperature := FALSE;
	
	gCooling.cmd.inverterMaxTemp 	:= 60.0;
	gCooling.cmd.motorMaxTemp 		:= 100.0;
END_PROGRAM

PROGRAM _CYCLIC
	
	CASE COOLING_MODE_STATE OF
		0: // AUTO MODE
			IF gDashboard.inputs.di_button2 AND (gInverters.inverter[0].data.actualVelocityKmh = 0) THEN
	  			COOLING_MODE_STATE := 10;
			END_IF;
			IF gStateMachine.status.state = STATE_DRIVE THEN
				COOLING_MODE_STATE := 10;
			END_IF;
		10: // going to MANUAL MODE
			IF NOT gDashboard.inputs.di_button2 THEN
				gCooling.cmd.manualMode := TRUE;
				gCooling.outputs.do_pump[1] := TRUE;
				COOLING_MODE_STATE := 20;
			END_IF;
			
		20: // MANUAL MODE
			IF gDashboard.inputs.di_button2 AND (gInverters.inverter[0].data.actualVelocityKmh = 0) THEN
				COOLING_MODE_STATE := 30;
			END_IF;
			
		30:
			IF NOT gDashboard.inputs.di_button2 THEN
				gCooling.cmd.manualMode := FALSE;
				gCooling.outputs.do_pump[1] := FALSE;
				COOLING_MODE_STATE := 0;
			END_IF
	END_CASE;
	
	(* Convert analog temperature inputs to temperatures in degrees *)
	FOR i := 0 TO 1 DO			
		(* Cooling System Temperature approximated via 4th order polynomium *)
		gCooling.data.coolingSysTemp[i] := EXPT(gCooling.inputs.ai_coolingTemp[i],2) + 0.004914 * gCooling.inputs.ai_coolingTemp[i] - 44.62;
	END_FOR
	
	// If cooling system is not in manual mode (its in automatic mode)
	IF NOT gCooling.cmd.manualMode THEN
		FOR i := 0 TO 1 DO
			//IF gCooling.outputs.do_pump[i] THEN
				//IF INT_TO_UINT(gCooling.inputs.im_pumpCurrent[i]) < pumpOffCurrent THEN
					// No current is being drawn
				//	gCooling.status.pumpState[i] := PUMP_STATE_NOT_CONNECTED;
				//ELSIF INT_TO_UINT(gCooling.inputs.im_pumpCurrent[i]) > pumpOffCurrent AND INT_TO_UINT(gCooling.inputs.im_pumpCurrent[i]) < pumpOnCurrent THEN
					// Not enough current is being drawn
				//	gCooling.status.pumpState[i] := PUMP_STATE_NO_WATER;
				//ELSE
			// Normal amount of current is being drawn
				IF gStateMachine.status.state = STATE_TRACTIVE THEN
					gCooling.status.pumpState[i] := PUMP_STATE_OK;
				ELSE
					gCooling.status.pumpState[i] := PUMP_STATE_NO_WATER; // Just to turn off when not in tractive
				END_IF;
					
				// Check if there is an error on the pump. If the pump state is not OK there is an error
				gCooling.status.pumpError[i] := gCooling.status.pumpState[i] <> PUMP_STATE_OK;

				// If there is an error turn OFF the pump. Otherwise keep it ON
				gCooling.outputs.do_pump[i] := NOT gCooling.status.pumpError[i];
				
			//END_IF

		END_FOR
	END_IF;
	
	// Enable fan when in STATE_DRIVE
	FOR i := 0 TO 1 DO
		gCooling.outputs.do_fan[i] := gStateMachine.status.state = STATE_DRIVE;
	END_FOR;

	
	
	
	// Evaluate if inverter or motors have high temperature errors 
	gCooling.status.warningInverterHighTemp := MAX(gInverters.inverter[0].data.tempInverter, gInverters.inverter[1].data.tempInverter, gInverters.inverter[2].data.tempInverter, gInverters.inverter[3].data.tempInverter) > gCooling.cmd.inverterMaxTemp;
	gCooling.status.warningMotorHighTemp 	:= MAX(gInverters.inverter[0].data.tempMotor   , gInverters.inverter[1].data.tempMotor,    gInverters.inverter[2].data.tempMotor,    gInverters.inverter[3].data.tempMotor)    > gCooling.cmd.motorMaxTemp;
	
	
	// Evaluate if the cooling system is working properly. 
	gCooling.status.ok := NOT gCooling.status.pumpError[0] AND NOT gCooling.status.pumpError[1];
	
	// Evaluate if the cooling system sees any temperature higher than allowed
	gCooling.status.warningHighTemperature := gCooling.status.warningInverterHighTemp OR gCooling.status.warningMotorHighTemp;
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

