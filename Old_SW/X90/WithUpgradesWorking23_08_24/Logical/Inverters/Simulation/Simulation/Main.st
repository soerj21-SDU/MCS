
PROGRAM _INIT

	gIsSimulation 	:= DiagCpuIsSimulated();
				   
END_PROGRAM

PROGRAM _CYCLIC
	IF gIsSimulation THEN
		FOR i := 0 TO INVERTER_COUNT DO
			CASE gInverters.inverter[i].status.state OF
				INV_STATE_IDLE:
					gInverters.inverter[i].inputs.com_systemReady 		:= TRUE;
					
				INV_STATE_SWITCH_ON:
					gInverters.inverter[i].inputs.com_systemReady 		:= TRUE;
					IF gInverters.inverter[i].outputs.com_dcOn THEN
						gInverters.inverter[i].inputs.com_dcOn 			:= TRUE;
						gInverters.inverter[i].inputs.com_quitDcOn 		:= TRUE;
					ELSE
						gInverters.inverter[i].inputs.com_dcOn 			:= FALSE;
						gInverters.inverter[i].inputs.com_quitDcOn 		:= FALSE;
					END_IF;
					
					IF gInverters.inverter[i].outputs.com_interverOn THEN
						gInverters.inverter[i].inputs.com_quitInverterOn 	:= TRUE;
					ELSE 
						gInverters.inverter[i].inputs.com_quitInverterOn 	:= FALSE;
					END_IF;
				
				INV_STATE_DRIVE:

				INV_STATE_SWITCH_OFF:
					IF NOT gInverters.inverter[i].outputs.com_interverOn THEN
						gInverters.inverter[i].inputs.com_quitInverterOn 	:= FALSE;
					ELSE
						gInverters.inverter[i].inputs.com_quitInverterOn 	:= TRUE;
					END_IF;
				
					IF NOT gInverters.inverter[i].outputs.com_dcOn THEN
						gInverters.inverter[i].inputs.com_quitDcOn 		:= FALSE;		
					ELSE
						gInverters.inverter[i].inputs.com_quitDcOn 		:= TRUE;
					END_IF;
				INV_STATE_ERROR:
			END_CASE;
		END_FOR;
	END_IF;
	 
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM

