
ACTION history:
	
	// Power history
	TON_historyPower.PT := powerHistoryInverval;
	TON_historyPower.IN := TRUE;
	IF TON_historyPower.Q THEN
		FOR i := 999 TO 1 BY -1 DO
			gAMS.data.history.actPower[i] := gAMS.data.history.actPower[i-1];	
		END_FOR;
		gAMS.data.history.actPower[0] := gShunt.data.actPowerKW;
		TON_historyPower.IN := FALSE;
	END_IF;
	TON_historyPower();
	
	// Current history
	TON_historyCurrent.PT := currentHistoryInverval;
	TON_historyCurrent.IN := TRUE;
	IF TON_historyCurrent.Q THEN
		FOR i := 999 TO 1 BY -1 DO
			gAMS.data.history.actCurrent[i] := gAMS.data.history.actCurrent[i-1];
		END_FOR;
		gAMS.data.history.actCurrent[0] := gShunt.data.actCurrent;
		TON_historyCurrent.IN := FALSE;
	END_IF;
	TON_historyCurrent();
	
	
	// soc history
	TON_historySoc.PT := socHistoryInverval;
	TON_historySoc.IN := TRUE;
	IF TON_historySoc.Q THEN
		FOR i := 999 TO 1 BY -1 DO
			gAMS.data.history.actSoc[i] := gAMS.data.history.actSoc[i-1];	
		END_FOR;
		gAMS.data.history.actSoc[0] := gAMS.data.stateOfCharge;		
		TON_historySoc.IN := FALSE;
	END_IF;
	TON_historySoc();

	// voltage history
	TON_historyVoltage.PT := voltageHistoryInverval;
	TON_historyVoltage.IN := TRUE;
	IF TON_historyVoltage.Q THEN
		FOR i := 999 TO 1 BY -1 DO
			gAMS.data.history.actVoltage[i] := gAMS.data.history.actVoltage[i-1];	
		END_FOR;
		gAMS.data.history.actVoltage[0] := gShunt.data.actVoltage;
		TON_historyVoltage.IN := FALSE;
	END_IF;
	TON_historyVoltage();
	
	
END_ACTION
