
ACTION LowVoltageBatteryInit: 
	lvBatteryConstants.HighLimit := 13.0;
	lvBatteryConstants.LowLimit  := 11.0;
	
	lvBatteryVariables.TON_batteryEmpty.PT := T#1s;
	lvBatteryVariables.TON_batteryFull.PT := T#1s;
END_ACTION

ACTION LowVoltageBattery: 
//	gLowVoltageBattery.data.lowVoltageBatteryVoltage :=  0.001209 * gLowVoltageBattery.inputs.im_LowVoltageBattery_Voltage + 0.6351;
	gLowVoltageBattery.data.voltage :=  (32.0/32767.0) * gLowVoltageBattery.inputs.ai_voltage; 
	
	gLowVoltageBattery.data.current := (((10.0/32767.0)*gLowVoltageBattery.inputs.ai_current) - 0.5)/0.08;
	
	// Check if the low voltage battery is below a threshold and set status flag
	lvBatteryVariables.TON_batteryEmpty(IN := gLowVoltageBattery.data.voltage < lvBatteryConstants.LowLimit);
	gLowVoltageBattery.status.empty := lvBatteryVariables.TON_batteryEmpty.Q;

	
	// Check of the low voltage battery is above a threshold and set status flag
	lvBatteryVariables.TON_batteryFull(IN := gLowVoltageBattery.data.voltage > lvBatteryConstants.HighLimit);
	gLowVoltageBattery.status.full := lvBatteryVariables.TON_batteryFull.Q;
	
END_ACTION
