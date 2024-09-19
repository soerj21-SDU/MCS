
ACTION prechargeCalculationOrion: 
	
	// Check if any inrush current, to make sure precharging is acutally being performed
	IF gORION.data.outputCurrent > 0 THEN
		inrushCurrentDetected := TRUE;
	END_IF;
	
	// Calculate the voltage on the voltage on the Car side based on precharge resistor and pack voltage
	gORION.data.carVoltage := gORION.data.packVoltage - ABS(prechargeResistance * gORION.data.chargeCurrent);
	gORION.data.prechargeLevel := gORION.data.packVoltage / gORION.data.carVoltage;
	
	IF gORION.data.prechargeLevel >= requiredPrechargeLevel AND gORION.data.outputCurrent = 0 THEN
		prechargeLevelReached := TRUE;
	ELSE
		prechargeLevelReached := FALSE;
	END_IF;
	
END_ACTION

ACTION prechargeCalculationShunt: 
	
	IF gORION.data.packVoltage > 0 THEN
		IF gShunt.data.actVoltage >= gORION.data.packVoltage * requiredPrechargeLevel THEN
			prechargeLevelReached := TRUE;
		ELSE
			prechargeLevelReached := FALSE;
		END_IF;
	ELSE
		prechargeLevelReached := FALSE;
	END_IF
	
	
	
END_ACTION
