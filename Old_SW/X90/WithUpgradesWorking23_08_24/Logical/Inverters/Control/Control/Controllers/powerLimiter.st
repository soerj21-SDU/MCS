ACTION powerLimiterInit: 
	// Initialize the controller values
	gInverters.data.powerLimitKW := 80;
	gInverters.data.powerLimitMargin := 0.9;
	
	//control.PL.enable 		 := gInverters.cmd.enablePowerLimiter;
	//control.PL.MAX_POWER	 := gInverters.data.powerLimitKW; // [kW]
	//FOR i := 0 TO INVERTER_COUNT DO
	//	control.PL.I_GAIN[i] := 0;
	//	control.PL.P_GAIN[i] := 0;
	//END_FOR;
	constant.NOMINAL_TORQUE := 9.8; // [Nm]
	constant.MAX_TORQUE 	:= 21; // [Nm]
END_ACTION

ACTION powerLimiterCyclic: 
	// Service the controller
	gInverters.data.MaxSpeedRPM :=  MAX(gInverters.inverter[0].data.actualVelocity, gInverters.inverter[1].data.actualVelocity, gInverters.inverter[2].data.actualVelocity, gInverters.inverter[3].data.actualVelocity, 1);
	MaxSpeedRADS := (gInverters.data.MaxSpeedRPM*2*constant.PI)/60;
	torqueLimitNM := ((MIN(gInverters.data.powerLimitKW,gORION.data.DCL_KW) /4)*1000)/MaxSpeedRADS * gInverters.data.powerLimitMargin; // 0.9 is equvivalent to 10% margin of limit
	gInverters.inverter[i].outputs.com_torqueLimitPos 	:= DINT_TO_INT(LIMIT(0,REAL_TO_DINT((torqueLimitNM/constant.NOMINAL_TORQUE)*1000), 32767)); // Is sent as 0.1% of nominel torque
	
	//control.PL.enable 				:= gInverters.cmd.enablePowerLimiter; // This might needed to be turned on?
	//control.PL.act_power			:= gShunt.data.actPowerKW;
	//control.PL.lowest_cell_voltage 	:= MIN(gAMS.data.cellVoltageMin[0], gAMS.data.cellVoltageMin[1], gAMS.data.cellVoltageMin[2], gAMS.data.cellVoltageMin[3], gAMS.data.cellVoltageMin[4]);
	//control.PL();
END_ACTION

ACTION powerLimiterCyclicIndividual: 
	// Service the controller
	ActualSpeedRADS := (MAX(gInverters.inverter[i].data.actualVelocity, 1)*2*constant.PI)/60;
	torqueLimitNM := (gInverters.data.powerLimitKwInverter[i]*1000)/ActualSpeedRADS * gInverters.data.powerLimitMargin; // 0.9 is equvivalent to 10% margin of limit
	gInverters.inverter[i].outputs.com_torqueLimitPos 	:= DINT_TO_INT(LIMIT(0,REAL_TO_DINT((torqueLimitNM/constant.NOMINAL_TORQUE)*1000), 32767)); // Is sent as 0.1% of nominel torque
	
	//control.PL.enable 				:= gInverters.cmd.enablePowerLimiter; // This might needed to be turned on?
	//control.PL.act_power			:= gShunt.data.actPowerKW;
	//control.PL.lowest_cell_voltage 	:= MIN(gAMS.data.cellVoltageMin[0], gAMS.data.cellVoltageMin[1], gAMS.data.cellVoltageMin[2], gAMS.data.cellVoltageMin[3], gAMS.data.cellVoltageMin[4]);
	//control.PL();
END_ACTION
