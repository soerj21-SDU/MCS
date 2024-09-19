ACTION errorsInit_action:
	// Set a timeout period and start all error timers
	FOR i := 0 TO 21 DO
		gAMS.status.error.errorTimers[i](IN := TRUE, PT := T#100ms);	
	END_FOR;
	
	// Init all errors as inactive
	gAMS.status.error.lowVoltage 			:= FALSE;
	gAMS.status.error.highVoltage 			:= FALSE;
	gAMS.status.error.lowTemp 				:= FALSE;
	gAMS.status.error.highTemp 				:= FALSE;
	gAMS.status.error.ltc6813Com 			:= FALSE;
	gAMS.status.error.shuntCom 				:= FALSE;
	gAMS.status.error.openSc 				:= FALSE;
	gAMS.status.error.closeSc 				:= FALSE;
	gAMS.status.error.openAirMinus 			:= FALSE;
	gAMS.status.error.closeAirMinus 		:= FALSE;
	gAMS.status.error.openAirPlus 			:= FALSE;
	gAMS.status.error.closeAirPlus 			:= FALSE;
	gAMS.status.error.openPrePlus 			:= FALSE;
	gAMS.status.error.closePrePlus  		:= FALSE;
	gAMS.status.error.preTimeout 			:= FALSE;
	gAMS.status.error.unexpectedChargeRate 	:= FALSE;
	gAMS.status.error.bankCountMismatch 	:= FALSE;
	gAMS.status.error.unexpectedTsCurrent 	:= FALSE;
	gAMS.status.error.relayFailed 			:= FALSE;
	gAMS.status.error.scBroken 				:= FALSE;
	gAMS.status.error.unfitChargeVoltage 	:= FALSE;
	gAMS.status.error.monitorError 			:= FALSE;
END_ACTION
	


ACTION error_action: 
	// Service all error timers
	FOR i := 0 TO 21 DO
		gAMS.status.error.errorTimers[i]();	
	END_FOR;
	
	(*  Write timer state to error flag. If timer runs out that means the error is inactive.
		The check should only run when the node is not in state INIT which also gives the timeout timers time to run out to begin with
		so no premature errors will be reported.*)
	
	
	//	1 ERROR_AMS_CELL_VOLTAGE_LOW
	//	2 ERROR_AMS_CELL_VOLTAGE_HIGH
	//	3 ERROR_AMS_CELL_TEMP_LOW
	//	4 ERROR_AMS_CELL_TEMP_HIGH
	//	5 ERROR_AMS_LTC6813_COMM
	//	6 ERROR_AMS_SHUNT_COMM
	//	7 ERROR_AMS_UNABLE_TO_OPEN_SC
	//	8 ERROR_AMS_UNABLE_TO_CLOSE_SC
	//	9 ERROR_AMS_UNABLE_TO_OPEN_AIR-
	//	10 ERROR_AMS_UNABLE_TO_CLOSE_AIR-
	//	11 ERROR_AMS_UNABLE_TO_OPEN_AIR+
	//	12 ERROR_AMS_UNABLE_TO_CLOSE_AIR+
	//	13 ERROR_AMS_UNABLE_TO_OPEN_PRE+
	//	14 ERROR_AMS_UNABLE_TO_CLOSE_PRE+
	//	15 ERROR_AMS_PRE_TIMEOUT
	//	16 ERROR_AMS_UNEXPECTED_CHARGE_RATE
	//	17 ERROR_AMS_BANK_COUNT_MISMATCH
	//	18 ERROR_AMS_UNEXSPECPTED_TS_CURRENT
	//	19 ERROR_AMS_RELAY_FAIELD
	//	20 ERROR_AMS_SC_BROKEN
	//	21 AMS_UNFIT_CHARGE_VOLTAGE
	//	22 AMS_MONITOR_ERROR
	IF gStateMachine.status.state <> STATE_INITIALIZE THEN
		gAMS.status.error.lowVoltage 			:= NOT gAMS.status.error.errorTimers[0].Q;
		gAMS.status.error.highVoltage 			:= NOT gAMS.status.error.errorTimers[1].Q;
		gAMS.status.error.lowTemp 				:= NOT gAMS.status.error.errorTimers[2].Q;
		gAMS.status.error.highTemp 				:= NOT gAMS.status.error.errorTimers[3].Q;
		gAMS.status.error.ltc6813Com 			:= NOT gAMS.status.error.errorTimers[4].Q;
		gAMS.status.error.shuntCom 				:= NOT gAMS.status.error.errorTimers[5].Q;
		gAMS.status.error.openSc 				:= NOT gAMS.status.error.errorTimers[6].Q;
		gAMS.status.error.closeSc 				:= NOT gAMS.status.error.errorTimers[7].Q;
		gAMS.status.error.openAirMinus 			:= NOT gAMS.status.error.errorTimers[8].Q;
		gAMS.status.error.closeAirMinus 		:= NOT gAMS.status.error.errorTimers[9].Q;
		gAMS.status.error.openAirPlus 			:= NOT gAMS.status.error.errorTimers[10].Q;
		gAMS.status.error.closeAirPlus 			:= NOT gAMS.status.error.errorTimers[11].Q;
		gAMS.status.error.openPrePlus 			:= NOT gAMS.status.error.errorTimers[12].Q;
		gAMS.status.error.closePrePlus  		:= NOT gAMS.status.error.errorTimers[13].Q;
		gAMS.status.error.preTimeout 			:= NOT gAMS.status.error.errorTimers[14].Q;
		gAMS.status.error.unexpectedChargeRate 	:= NOT gAMS.status.error.errorTimers[15].Q;
		gAMS.status.error.bankCountMismatch 	:= NOT gAMS.status.error.errorTimers[16].Q;
		gAMS.status.error.unexpectedTsCurrent 	:= NOT gAMS.status.error.errorTimers[17].Q;
		gAMS.status.error.relayFailed 			:= NOT gAMS.status.error.errorTimers[18].Q;
		gAMS.status.error.scBroken 				:= NOT gAMS.status.error.errorTimers[19].Q;
		gAMS.status.error.unfitChargeVoltage 	:= NOT gAMS.status.error.errorTimers[20].Q;
		gAMS.status.error.monitorError 			:= NOT gAMS.status.error.errorTimers[21].Q;
	END_IF;
	
	gAMS.status.hasError := gAMS.status.error.lowVoltage 		 OR gAMS.status.error.highVoltage 			OR 
							gAMS.status.error.lowTemp 			 OR gAMS.status.error.highTemp 				OR 
							gAMS.status.error.ltc6813Com 		 OR gAMS.status.error.shuntCom 				OR 
							gAMS.status.error.openSc 			 OR gAMS.status.error.closeSc 				OR 
							gAMS.status.error.openAirMinus 	 	 OR gAMS.status.error.closeAirMinus 		OR 
							gAMS.status.error.openAirPlus 	 	 OR gAMS.status.error.closeAirPlus 			OR 
							gAMS.status.error.openPrePlus 	 	 OR gAMS.status.error.closePrePlus 			OR 
							gAMS.status.error.preTimeout 		 OR gAMS.status.error.unexpectedChargeRate 	OR 
							gAMS.status.error.bankCountMismatch  OR gAMS.status.error.unexpectedTsCurrent 	OR 
							gAMS.status.error.relayFailed 		 OR gAMS.status.error.scBroken 				OR 
							gAMS.status.error.unfitChargeVoltage OR gAMS.status.error.monitorError; 
END_ACTION
