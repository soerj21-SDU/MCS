
PROGRAM _INIT
	
	(* Write the sc error names into an array *)
	scStrings;
	
	
	gSafetyChain.inputs.di_LVMS_OK := TRUE;
	
	
	
END_PROGRAM

PROGRAM _CYCLIC

	// Read data into SC
	gSafetyChain.inputs.interlockHVDC_OK 	:= NOT gAMS.status.error.hvdcInterlockError; // Might be NOT, depends on how the signal from the CAN is
	gSafetyChain.inputs.IMD_OK 				:= gSafetyChain.inputs.interlockHVDC_OK AND NOT gAMS.status.error.imdError;
	gSafetyChain.inputs.AMS_OK 				:= gSafetyChain.inputs.interlockHVDC_OK AND NOT gAMS.status.error.amsError;
	
	
	(* Write all safety chain elements into an array ready for parsing through *)
	scUpdate;
	
	(* Go through all safety chain elements and check if they are broken or not *)
	FOR i := 0 TO MAX_SC_ELEMENTS DO
		IF NOT gSafetyChain.status.sc[i] THEN
			gSafetyChain.status.scErrorString 	:= gSafetyChain.status.scErrorStrings[i];
			gSafetyChain.status.scErrorIndex 	:= i;
			EXIT;
		END_IF
	END_FOR
		



	
	(* check all parts of the safety chain *)
//	gSafetyChain.status.scOK_notEnabled := gSafetyChain.inputs.di_TSMS_OK;

	gSafetyChain.status.scOK_notEnabled := 		gSafetyChain.inputs.AMS_OK 
											AND gSafetyChain.inputs.di_BOTS_OK
											AND gSafetyChain.inputs.di_TS_Container
											AND gSafetyChain.inputs.di_BSPD_OK 
											AND gSafetyChain.inputs.di_interlockHVD_OK
											AND gSafetyChain.inputs.IMD_OK
											AND gSafetyChain.inputs.di_inertiaSwitch_OK 
											AND gSafetyChain.inputs.di_interlockMotorFL_OK 
											AND gSafetyChain.inputs.di_interlockMotorFR_OK 
											AND gSafetyChain.inputs.di_interlockMotorRL_OK 
											AND gSafetyChain.inputs.di_interlockMotorRR_OK 
											AND gSafetyChain.inputs.di_interlockTSMP_OK 
											AND gSafetyChain.inputs.di_interlockWheelFL_OK 
											AND gSafetyChain.inputs.di_interlockWheelFR_OK 
											AND gSafetyChain.inputs.di_interlockWheelRL_OK 
											AND gSafetyChain.inputs.di_interlockWheelRR_OK 
											AND gSafetyChain.inputs.interlockHVDC_OK
											AND gSafetyChain.inputs.di_LVMS_OK
											AND gSafetyChain.inputs.di_supply
											AND gSafetyChain.inputs.di_shutdownCockpit_OK 
											AND gSafetyChain.inputs.di_shutdownLeft_OK 
											AND gSafetyChain.inputs.di_shutdownRight_OK 
											AND gSafetyChain.inputs.di_TSMS_OK;

	
	(* Get the safety chain status including the enable switch *)
	gSafetyChain.status.scOK := 	gSafetyChain.status.scOK_notEnabled AND gAMS.status.scEnabled;

	// Make a version of the scOK signal that is more robust towards noise and flicker on the shutdown circuit lines
	IF gStateMachine.status.state = STATE_ENABLING_SC OR gStateMachine.status.state = STATE_PRECHARGING THEN
		// When waiting for the AMS the SC experiences many spikes and the delay is therefore made very big to not falsely trigger.
		TON_persistancetimer.PT := T#10000ms;
	ELSE
		// Under normal conditions the SC should be concluded broken after 1 sec.
		TON_persistancetimer.PT := T#1000ms;
	END_IF;
	
	
	TON_persistancetimer.IN := NOT gSafetyChain.status.scOK;
	TON_persistancetimer();
	
	gSafetyChain.status.scOKPersistent := NOT TON_persistancetimer.Q;

	IF EDGENEG(gSafetyChain.status.scOKPersistent) THEN
		gEventLog.newEventString := 'SC Broken at: ';
		strcat(ADR(gEventLog.newEventString), ADR(gSafetyChain.status.scErrorString));
		logEvent;
	END_IF;
	
	
	(* Convert the SC status to USINT. This is used for the liveview to select a picture displaying the status *)
	IF gSafetyChain.status.scOK_notEnabled THEN
		gSafetyChain.status.scOK_usint := 1;
	ELSIF gSafetyChain.status.scOKPersistent THEN
		gSafetyChain.status.scOK_usint := 2;
	ELSE
		gSafetyChain.status.scOK_usint := 0;
	END_IF
	
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM

