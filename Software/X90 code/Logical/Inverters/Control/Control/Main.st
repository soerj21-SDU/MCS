
PROGRAM _INIT

	// Initialize inverter locations
	gInverters.inverter[FL].status.location 	:= FL;
	gInverters.inverter[FR].status.location 	:= FR;
	gInverters.inverter[RL].status.location 	:= RL;
	gInverters.inverter[RR].status.location 	:= RR;
	
	

	FOR i := 0 TO INVERTER_COUNT DO
		// Initialize inverter location names
		CASE gInverters.inverter[i].status.location OF
			FL: gInverters.inverter[i].status.locationName := 'FL';
			FR: gInverters.inverter[i].status.locationName := 'FR';
			RL: gInverters.inverter[i].status.locationName := 'RL';
			RR: gInverters.inverter[i].status.locationName := 'RR';
		END_CASE

		// Enable All Inverters
		gInverters.inverter[i].cmd.enableInverter 			:= TRUE;
		
		// Initialize the error timeout to false
		gInverters.inverter[i].status.errorTimeout 			:= FALSE;
		
		// Initialize the shutdown by partner feature to false
		gInverters.inverter[i].cmd.shutdownByPartner 			:= FALSE;
		
		(* Set default output signals *)
//		gInverters.inverter[i].outputs.do_enable 				:= TRUE;
//		gInverters.inverter[i].outputs.do_torqueLimitActive   := TRUE;
		
		// Set max velocity
		gInverters.inverter[i].outputs.com_targetVelocity 	:= 17000;
		// Initialize the torque output and limits to 0
		gInverters.inverter[i].outputs.com_targetTorque	 	:= 0;
		gInverters.inverter[i].outputs.com_torqueLimitNeg 	:= 0;
		gInverters.inverter[i].outputs.com_torqueLimitPos 	:= 0;

		
	END_FOR;
	
	// Torque Gain used to convert torque outputs in range [0,1] to torque in range [0,torqueSetpointGain] required by the inverters
	gInverters.data.torqueSetpointGain 		:= 2143; //constant.MAX_TORQUE * 1000/constant.NOMINAL_TORQUE ; //[0.1%] of nominal torque
	

	// Initialize the inverter group hardware enable signals
	gInverters.output.do_enableInv12 			:= FALSE;
	gInverters.output.do_enableInv34 			:= FALSE;
	


	(* Control Initialization *)
	
	// Intialize controller enable signals. All are initialized to OFF because the actual state is handled by the mission feature
	gInverters.cmd.enablePowerLimiter 			:= FALSE;
	gInverters.cmd.enableRegenerativeBraking 	:= FALSE;
	gInverters.cmd.enableTorqueVectoring 		:= FALSE;
	gInverters.cmd.enableTractionControl 		:= FALSE;
	gInverters.cmd.enableTorqueLimiter			:= FALSE;
	gInverters.cmd.enableFrontRearDistribution 	:= FALSE;
	gInverters.cmd.enableMotorPairShutdown 		:= FALSE;
	
	// Torque Vectoring
	torqueVectoringInit;
	
	// Traction Control
	tractionControlInit;
	
	// Power Limiter
	powerLimiterInit;

	// Torque Limiter
	torqueLimiterInit;
	
	// Regenerative Braking, RB
	regenerativeBrakingInit;
	
	// Front/Rear Distribution
//	frontRearDistributionInit;
	
	

	// Get cycle time 
	RTInfo_0(enable := TRUE);
	cycletime := RTInfo_0.cycle_time / 1000; //[ms]

	
	// TEMP
	tempActivateOutputTorque := TRUE;
	
	gInverters.data.rearBias := 0.6;
	individualInverterTorqueEnabled := TRUE;
	
END_PROGRAM

PROGRAM _CYCLIC


	
	// Convert the speed from RPM to KMH
	convertToKmh;
	
	// Measure how fast the vehicle went from 0-100kmh
	accelerationMeasurement;
	

	
	// Torque off and pair control
	torqueOff;
	
	// Static Front Rear Distribution
//	frontRearDistributionCyclic;

	// Calculate average velocity
	gInverters.data.averageVelocityKmh := (gInverters.inverter[0].data.actualVelocityKmh + gInverters.inverter[1].data.actualVelocityKmh + gInverters.inverter[2].data.actualVelocityKmh + gInverters.inverter[3].data.actualVelocityKmh)/4.0;
	
	
	(* Run vehicle dynamic controllers *)
	// Torque vectoring
	torqueLimiterCyclic;
		
	// Traction Control
	tractionControlCyclic;
		
	
	// Torque Limiter
	torqueLimiterCyclic;
		
	// Regenerative Braking
	regenerativeBrakingCyclic;
	
	// Front Rear Distribution
	frontRearDistributionCyclic;
	
	
	(* Output torque *)
	FOR i := 0 TO INVERTER_COUNT DO
		gInverters.inverter[i].status.inverterEnabled := gInverters.inverter[i].cmd.enableInverter;
		
		// Find total output torque. [0,1], with unit [%/100]
//		gInverter[i].data.torqueOutput 	:= 	control.TC.derating_output[i] * // Traction Control, TC
//											control.PL.derating_output[i] * // Power Limiting,   PL
//											control.TL.derating_output[i];  // Torque Limiting,  TL
		
		// TEMP
		gInverters.inverter[i].data.torqueOutput := gTorqueSensor.status.torquePercentage/100.0;
		
		// Find total output torque in percent [0,100]. Only used for liveview
		gInverters.inverter[i].data.torqueOutputPercent 	:= gInverters.inverter[i].data.torqueOutput * 100.0;
		
		
		(* If inverter is enabled and in 'drive' calculate the torque output in range [0, torqueSetpointGain] *)
		IF gInverters.inverter[i].status.state = INV_STATE_DRIVE AND gInverters.inverter[i].status.inverterEnabled THEN
			torqueSetpoint[i] := gInverters.data.torqueSetpointGain * gInverters.inverter[i].data.torqueOutput;
		ELSE
			torqueSetpoint[i] := 0;
		END_IF;
		
		// Convert the torque setpoint to an int value
		IF gInverters.inverter[i].status.state = INV_STATE_DRIVE THEN
			IF tempActivateOutputTorque THEN
				// Calculating the target torque based on Throttle Position
				gInverters.inverter[i].outputs.com_targetTorque 	:= REAL_TO_INT(gTorqueSensor.status.torquePercentage/100 * gInverters.data.torqueSetpointGain * 4 * gInverters.data.powerBias[i] );
				
				
				// Power Limiter
				IF individualInverterTorqueEnabled THEN
					gInverters.data.powerLimitKwInverter[i] := MIN(gInverters.data.powerLimitKW,gORION.data.DCL_KW) * gInverters.data.powerBias[i];
//					gInverters.data.powerLimitKwInverter[1] := MIN(gInverters.data.powerLimitKW,gORION.data.DCL_KW) * 1 - gInverters.data.rearBias;
//					gInverters.data.powerLimitKwInverter[2] := MIN(gInverters.data.powerLimitKW,gORION.data.DCL_KW) * gInverters.data.rearBias;
//					gInverters.data.powerLimitKwInverter[3] := MIN(gInverters.data.powerLimitKW,gORION.data.DCL_KW) * gInverters.data.rearBias;
					powerLimiterCyclicIndividual;
				ELSE
					powerLimiterCyclic;
				END_IF;
				IF gInverters.status.torqueBasedThrottle THEN
	  				gInverters.inverter[i].outputs.com_torqueLimitPos := MIN(gInverters.inverter[i].outputs.com_torqueLimitPos, gInverters.inverter[i].outputs.com_targetTorque);
				END_IF;
				IF NOT gTorqueSensor.status.torqueEnabled THEN
					gInverters.inverter[i].outputs.com_torqueLimitPos 	:= 0;
					gInverters.inverter[i].outputs.com_targetTorque 	:= 0;
				END_IF;
				
			ELSIF tempManualControl THEN
				// Manually controlled
			ELSE
				gInverters.inverter[i].outputs.com_targetTorque := 0;
			END_IF;	
		ELSE
			gInverters.inverter[i].outputs.com_targetTorque := 0;
		END_IF;
		
//		gInverters.inverter[i].outputs.com_targetTorque := 0;
		
		
		// Regenerative Braking
		// Get negative torque limit in range [0,1]
		gInverters.inverter[i].data.regenerativeBraking 	:= 	control.RB.negative_torque_limit[i];
		
		// Convert to percent [0, 100] for liveview
		gInverters.inverter[i].data.regenerativeBraking 	:= 	control.RB.negative_torque_limit[i] * 100.0;
		
		
		IF gInverters.inverter[i].status.state = INV_STATE_DRIVE AND gInverters.inverter[i].status.inverterEnabled THEN
			// If the inverter is in a state where the negative torque limit is allowed to be changed 
			// calculate the torque limit by scaling the regenerative braking [0,1] by negativeTorqueLimGain to get it in 
			// the range [0, negativeTorqueLimGain] required by the inverter
			//gInverters.inverter[i].outputs.com_torqueLimitNeg := REAL_TO_INT(gInverters.data.negativeTorqueLimGain * gInverters.inverter[i].data.regenerativeBraking);
		ELSE
			// If inverter is in an invalid state for controlling the negative torque limit set it to 0 which is a save value
			//gInverters.inverter[i].outputs.com_torqueLimitNeg := 0;
		END_IF;
		
	END_FOR;
	

	
//	history;
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM


