ACTION setupLog: 
	
	//Variables to log
	loggingNames[0] := 'gStateMachine.status.state';
	loggingNames[1] := 'SENSORS:suspension.status.travelFL';
	loggingNames[2] := 'SENSORS:suspension.status.travelFR';
	loggingNames[3] := 'gSteeringAngle.data.angleDegrees';
	loggingNames[4] := 'gBraking.data.pressurePercentageRear';
	loggingNames[5] := 'gTorqueSensor.status.torquePercentage';
	loggingNames[6] := 'gInverters.inverter[0].data.actualVelocityKmh';
	loggingNames[7] := 'gInverters.inverter[1].data.actualVelocityKmh';
	loggingNames[8] := 'gInverters.inverter[2].data.actualVelocityKmh';
	loggingNames[9] := 'gInverters.inverter[3].data.actualVelocityKmh';
	loggingNames[10] := 'gInverters.inverter[0].outputs.com_torqueLimitPos';
	loggingNames[11] := 'gInverters.inverter[1].outputs.com_torqueLimitPos';
	loggingNames[12] := 'gInverters.inverter[2].outputs.com_torqueLimitPos';
	loggingNames[13] := 'gInverters.inverter[3].outputs.com_torqueLimitPos';
	loggingNames[14] := 'gInverters.inverter[0].data.torqueCurrent';
	loggingNames[15] := 'gInverters.inverter[1].data.torqueCurrent';
	loggingNames[16] := 'gInverters.inverter[2].data.torqueCurrent';
	loggingNames[17] := 'gInverters.inverter[3].data.torqueCurrent';
	loggingNames[18] := 'gInverters.inverter[0].data.torqueMagnitizingCurrent';
	loggingNames[19] := 'gInverters.inverter[1].data.torqueMagnitizingCurrent';
	loggingNames[20] := 'gInverters.inverter[2].data.torqueMagnitizingCurrent';
	loggingNames[21] := 'gInverters.inverter[3].data.torqueMagnitizingCurrent';
	loggingNames[22] := 'gInverters.inverter[0].data.tempInverter';
	loggingNames[23] := 'gInverters.inverter[1].data.tempInverter';
	loggingNames[24] := 'gInverters.inverter[2].data.tempInverter';
	loggingNames[25] := 'gInverters.inverter[3].data.tempInverter';
	loggingNames[26] := 'gInverters.inverter[0].data.tempMotor';
	loggingNames[27] := 'gInverters.inverter[1].data.tempMotor';
	loggingNames[28] := 'gInverters.inverter[2].data.tempMotor';
	loggingNames[29] := 'gInverters.inverter[3].data.tempMotor';
	loggingNames[30] := 'gAMS.data.cellTempMax';
	loggingNames[31] := 'gORION.data.packVoltage';
	loggingNames[32] := 'gORION.data.outputCurrent';
	loggingNames[33] := 'gTorqueSensor.data.torque1Percent';
	loggingNames[34] := 'gTorqueSensor.data.torque2Percent';
	loggingNames[35] := 'gORION.data.packPower';
	loggingNames[36] := 'SENSORS:accelerometer.input.x_direction';
	loggingNames[37] := 'SENSORS:accelerometer.input.y_direction';
	loggingNames[38] := 'SENSORS:accelerometer.input.z_direction';
	
	FOR i := 0 TO MAX_LOG_VAR DO
		mpDataRegPar_0[i].MpLink := ADR(gDataRecorderNew);
		mpDataRegPar_0[i].PVName := ADR(loggingNames[i]);
		mpDataRegPar_0[i].Enable := TRUE;
		mpDataRegPar_0[i]();
	END_FOR


	
END_ACTION
