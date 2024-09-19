
ACTION states: 
	// Generate command ID for AMS
	IF gAMS.cmd.abort THEN
		//Signal the AMS to shutdown TS, SC and go to state idle
		gORION.state := ABORT;
		
		gEventLog.newEventString := 'Abort command send to AMS';
		logEvent;
	END_IF;
	
	
	// States of ORION BMS
	CASE gORION.state OF			
		IDLE:
			gAMS.status.amsStateName := 'IDLE';
			gORION.relays.sdcEnable := FALSE;
			gORION.relays.precharge	:= FALSE;
			gORION.relays.airPlus	:= FALSE;
			gORION.relays.airMinus	:= FALSE;
			
			
			
			IF gAMS.cmd.enableSC THEN
				gAMS.cmd.enableSC := FALSE;
				gORION.state := ENABLING_SC;
		
				gEventLog.newEventString := 'Enable SC command send to AMS';
				logEvent;
			END_IF
			
		
		ENABLING_SC:
			gAMS.status.amsStateName := 'ENABLING_SC';
		
			// Settting Relays
			gORION.relays.sdcEnable := TRUE;
			gORION.relays.precharge	:= FALSE;
			gORION.relays.airPlus	:= FALSE;
			gORION.relays.airMinus	:= FALSE;
			
			IF gORION.status.sdcEnabled THEN
	  			gORION.state := SC_ENABLED;
			END_IF;
			
		SC_ENABLED:
			gAMS.status.amsStateName := 'SC_ENABLED';
			gORION.relays.sdcEnable := TRUE;
			gORION.relays.precharge	:= FALSE;
			gORION.relays.airPlus	:= FALSE;
			gORION.relays.airMinus	:= FALSE;
			
			
			IF gAMS.cmd.startPrecharge THEN
				gAMS.cmd.startPrecharge := FALSE;
				
				inrushCurrentDetected 	:= FALSE;
				gORION.state 			:= PRECHARGING;
				
				gEventLog.newEventString := 'Precharge command send to AMS';
				logEvent;
			END_IF
			
			
		PRECHARGING:
			gAMS.status.amsStateName := 'PRECHARGING';
			gORION.relays.sdcEnable := TRUE;
			gORION.relays.precharge	:= TRUE;
			gORION.relays.airPlus	:= FALSE;
			gORION.relays.airMinus	:= TRUE;
			
			
			IF gShunt.status.ok THEN
				prechargeCalculationShunt;
			ELSE
				prechargeCalculationOrion;	
			END_IF;
			
			IF inrushCurrentDetected AND prechargeLevelReached THEN
	  			gORION.state := PRECHARGING_DONE;
			END_IF;
			
			
		PRECHARGING_DONE:
			gAMS.status.amsStateName := 'PRECHARGING_DONE';
			gORION.relays.sdcEnable := TRUE;
			gORION.relays.precharge	:= TRUE;
			gORION.relays.airPlus	:= FALSE;
			gORION.relays.airMinus	:= TRUE;
			
			// Set global message for general StatemMachine to continue
			gAMS.status.prechargingDone := TRUE;
			
			
			IF gAMS.cmd.enterDrive THEN
				gAMS.cmd.enterDrive 	:= FALSE;
				// Setting 500ms delay for switching off Precharge 
				TON_prechargeDisableDrive.PT := T#500ms;
				TON_prechargeDisableDrive.IN := TRUE;
				gORION.state := DRIVE_PRECHARGE_ACTIVE;
	
				gEventLog.newEventString := 'Drive command send to AMS';
				logEvent;
			END_IF
					
			
		DRIVE_PRECHARGE_ACTIVE:
			gAMS.status.amsStateName := 'DRIVE_PRECHARGE_ACTIVE';		
			
			gORION.relays.sdcEnable := TRUE;
			gORION.relays.precharge	:= TRUE;
			gORION.relays.airPlus	:= TRUE;
			gORION.relays.airMinus	:= TRUE;
			
			
			
			// Some time before disabling precharge relay
			IF TON_prechargeDisableDrive.Q THEN
				TON_prechargeDisableDrive.IN := FALSE;
				gORION.state := DRIVE;
			END_IF;
		
			
			
			
		DRIVE:
			gAMS.status.amsStateName := 'DRIVE';
			// IN drive Precharge relay should be shut off
			gORION.relays.sdcEnable := TRUE;
			gORION.relays.precharge	:= FALSE;
			gORION.relays.airPlus	:= TRUE;
			gORION.relays.airMinus	:= TRUE;
			
			
			
		ABORT:
			gAMS.status.amsStateName := 'ABORT';
			// state reached, Resetting command
			gAMS.cmd.abort := FALSE;
			// All relays should be shut off, to make sure no HV is on the car
			gORION.relays.sdcEnable := FALSE;
			gORION.relays.precharge	:= FALSE;
			gORION.relays.airPlus	:= FALSE;
			gORION.relays.airMinus	:= FALSE;
			
			// TODO: FIgure out how to know if it is safe to go to idle again
			IF gORION.data.chargeCurrent = 0 AND gSafetyChain.status.scOK_notEnabled THEN
	  			gORION.state := IDLE;
			END_IF;
			
		
		ELSE
			// IF state is outside defined states, shut off relays
			gORION.relays.sdcEnable := FALSE;
			gORION.relays.precharge	:= FALSE;
			gORION.relays.airPlus	:= FALSE;
			gORION.relays.airMinus	:= FALSE;
	END_CASE;
	
	
	
	
	// Lookup name of AMS state (Only important states)
//	CASE gAMS.status.amsState OF
//		AMS_STATE_NONE: 		gAMS.status.amsStateName := 'NONE';
//		AMS_STATE_INIT: 		gAMS.status.amsStateName := 'INIT';
//		AMS_STATE_IDLE: 		gAMS.status.amsStateName := 'IDLE';
//		AMS_STATE_ERROR: 		gAMS.status.amsStateName := 'ERROR';
//		AMS_STATE_SC_ENABLED: 	gAMS.status.amsStateName := 'SC_ENABLED';
//		AMS_STATE_TC_ENABLED: 	gAMS.status.amsStateName := 'TS_ACTIVE';
//		AMS_STATE_DRIVE: 		gAMS.status.amsStateName := 'DRIVE';
//		ELSE
//	END_CASE;
	
	TON_prechargeDisableDrive();
	
END_ACTION
