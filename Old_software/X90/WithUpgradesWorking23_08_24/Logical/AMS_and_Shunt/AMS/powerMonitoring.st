(* Keep track of the current power consumption and the maximum power *)
ACTION powerMonitoring: 
	// Actual power
//	gAMS.data.totalPowerKW := gAMS.data.totalPower / 1000.00;
	
	// Maximum power
//	IF gAMS.data.totalPower > gAMS.data.totalPowerMax THEN
//		gAMS.data.totalPowerMax := gAMS.data.totalPower;
//		gAMS.data.totalPowerMaxKW := gAMS.data.totalPowerMax / 1000.00;
//	END_IF;
	
	IF gInverters.cmd.enablePowerLimiter THEN
//		powerWarningLimit := gInverters.data.powerLimitKW*0.9;
//		IF gAMS.data.totalPowerKW > 1 THEN
//			gAMS.status.highPowerWarning := powerWarningLimit 					<= gAMS.data.totalPowerKW;
//			gAMS.status.highPowerError   := gInverters.data.powerLimitKW 	<= gAMS.data.totalPowerKW;
//		END_IF;
	ELSE
		gAMS.status.highPowerWarning := FALSE;
		gAMS.status.highPowerError   := FALSE;
	END_IF;
	
	
END_ACTION
