
PROGRAM _INIT

	gAMS.data.outputCurrent := 0;
	gAMS.data.stateOfCharge := 0;
//	gAMS.data.totalPower 	:= 0;
//	gAMS.data.totalPowerMax := 0;  // Reset variable used to keep track of the maximum power used
	
	powerHistoryInverval 		:= T#10ms;
	currentHistoryInverval 		:= T#20ms;
	socHistoryInverval			:= T#500ms;
	voltageHistoryInverval  	:= T#100ms;
	gORION.data.TON_counter.PT	:= T#1s;
	
	constant.fullBatteryCapacityAh  := 12.5;
	constant.fullBatteryCapacitykWh := 6.475;
	
	constant.chargingCurrentMax := 12.5;
	gAMS.cmd.chargingPrescalerAmp := constant.chargingCurrentMax;
	
	gAMS.cmd.bankCount := 5;
	
	errorsInit_action;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	states;
	orionErrorAction;
	error_action;
	
		
	gAMS.data.chargeCurrent := - gAMS.data.outputCurrent;
	
//	gAMS.data.batteryVoltage := gAMS.status.bank[0].bankVoltage + gAMS.status.bank[1].bankVoltage + 
//								gAMS.status.bank[2].bankVoltage + gAMS.status.bank[3].bankVoltage + 
//								gAMS.status.bank[4].bankVoltage;
	
	
	
	gAMS.cmd.chargingPrescalerPercent := LIMIT(0, REAL_TO_USINT((gAMS.cmd.chargingPrescalerAmp / constant.chargingCurrentMax) * 100), 100);
	
	powerMonitoring;
	
	(* Determine if AMS has an error or not *)
	gAMS.status.ok 	 := (NOT gAMS.status.disconnected) AND (NOT (gAMS.status.amsStateName = 'ERROR')) AND (NOT gAMS.status.hasError);
	gShunt.status.ok := NOT gShunt.status.disconnected;
	
//	gAMS.data.stateOfCharge := ((constant.fullBatteryCapacitykWh-gShunt.data.actPowerKWH) / constant.fullBatteryCapacitykWh) * 100.00;
	 
	// Calculating the voltage of each bank
	FOR j := 0 TO BANK_COUNT-1 DO
		k := CELL_COUNT*j;
		tmpVoltage := 0;
		FOR i := 0 TO CELL_COUNT-1 DO
			// gAMS.status.bank[j].cellVoltage[i] := gAMS.status.pack.cellVoltage[i + k];
			tmpVoltage := tmpVoltage + gAMS.status.bank[j].cellVoltage[i]; 
		END_FOR;
		gAMS.status.bank[j].bankVoltage := tmpVoltage;
	END_FOR
	
	
	FOR j := 0 TO BANK_COUNT-1 DO
		// Max voltage
		tmpVoltageMax := 0;
		FOR i := 0 TO CELL_COUNT-1 DO
			IF gAMS.status.bank[j].cellVoltage[i] > tmpVoltageMax THEN
				tmpVoltageMax := gAMS.status.bank[j].cellVoltage[i];
			END_IF;
		END_FOR;
		gAMS.data.cellVoltageMax[j] := tmpVoltageMax;
		
		// Min voltage
		tmpVoltageMin := 10000;
		FOR i := 0 TO CELL_COUNT-1 DO
			IF gAMS.status.bank[j].cellVoltage[i] < tmpVoltageMin THEN
				tmpVoltageMin := gAMS.status.bank[j].cellVoltage[i];
			END_IF;
		END_FOR;
		gAMS.data.cellVoltageMin[j] := tmpVoltageMin;
		
		// Max temperature
		tmpTemperatureMax := 0;
		FOR i := 0 TO TEMPERATURE_COUNT-1 DO
			IF gAMS.status.bank[j].temperatures[i] > tmpTemperatureMax THEN
				tmpTemperatureMax := gAMS.status.bank[j].temperatures[i];
			END_IF;
		END_FOR;
		gAMS.data.bankTemperatureMax[j] := tmpTemperatureMax;
		
		// Min temperature
		tmpTemperatureMin := 10000;
		FOR i := 0 TO TEMPERATURE_COUNT-1 DO
			IF gAMS.status.bank[j].temperatures[i] < tmpTemperatureMin THEN
				tmpTemperatureMin := gAMS.status.bank[j].temperatures[i];
			END_IF;
		END_FOR;
		gAMS.data.bankTemperatureMin[j] := tmpTemperatureMin;
	
		
		// Max resistor temperature
		tmpTemperatureMax := 0;
		FOR i := 0 TO RESISTOR_COUNT-1 DO
			IF gAMS.status.bank[j].resistorTemperature[i] > tmpTemperatureMax THEN
				tmpTemperatureMax := gAMS.status.bank[j].resistorTemperature[i];
			END_IF;
		END_FOR;
		gAMS.data.bankResistorTemperatureMax[j] := tmpTemperatureMax;
		
		// Min temperature
		tmpTemperatureMin := 10000;
		FOR i := 0 TO RESISTOR_COUNT-1 DO
			IF gAMS.status.bank[j].resistorTemperature[i] < tmpTemperatureMin THEN
				tmpTemperatureMin := gAMS.status.bank[j].resistorTemperature[i];
			END_IF;
		END_FOR;
		gAMS.data.bankResistorTemperatureMin[j] := tmpTemperatureMin;
		
	END_FOR;
	
	history;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

