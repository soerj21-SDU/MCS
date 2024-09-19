
ACTION orionErrorAction: 

	// If charger intends to do an AMS error, force an abort:
	IF NOT gAMS.status.relayState.dischargeRelayEnabled THEN
		gAMS.cmd.abort;
		gAMS.status.errorInfo := 'DischargeEnable pin is FALSE';
	END_IF;
	
	// If voltage too high force an abort
	IF gAMS.status.error.lowVoltage THEN
		gAMS.cmd.abort;
		gAMS.status.errorInfo := 'Voltage of a cell is too low';
	END_IF;
	
	// If Temp is too high
	IF gAMS.status.error.highTemp THEN
		gAMS.cmd.abort;
		gAMS.status.errorInfo := 'Temperature of a cell is too high';
	END_IF;
	
	// Manual check of  cell temp
	IF gAMS.data.cellTempMax > 60 THEN
		gAMS.cmd.abort;
		gAMS.status.errorInfo := 'Temperature of a cell is above 60 Degree';
	END_IF;
	
	// charge is above Discharge Current Limit (DCL)
	IF gORION.data.outputCurrent > gORION.data.DCL THEN
		gAMS.cmd.abort;
		gAMS.status.errorInfo := 'Charge Current Limit(CCL) exceeded';
	END_IF;
	
	// Rolling counter has changed
	IF gORION.data.rollingCounter <> gORION.data.rollingCounterOld THEN
		gORION.data.TON_counter.IN := FALSE;
		gORION.data.TON_counter();
		gORION.data.TON_counter.IN := TRUE;
	END_IF;
	gORION.data.rollingCounterOld := gORION.data.rollingCounter;
	
	// Timeout on the rolling counter
	IF gORION.data.TON_counter.Q THEN
		gAMS.cmd.abort := TRUE;
		gAMS.status.error.amsError 	:= TRUE;
		gORION.status.commTimeout	:= TRUE; 
		gAMS.status.errorInfo := 'Timeout of commnication with ORION BMS';
	ELSE
		gORION.status.commTimeout	:= FALSE; 
	END_IF;
	
	
	
	
	
	gORION.data.TON_counter();
	
	
END_ACTION
