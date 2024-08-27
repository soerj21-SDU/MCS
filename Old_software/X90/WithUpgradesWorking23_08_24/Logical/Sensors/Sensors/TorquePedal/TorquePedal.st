
ACTION TorquePedalInit: 
	(* Sensor edge values *)
	torquePedalVariables.torquePedalMin1 	:= 13636;
	torquePedalVariables.torquePedalMin2 	:= 2415;
	torquePedalVariables.torquePedalMax1 	:= 21181;
	torquePedalVariables.torquePedalMax2 	:= 7947;

	
	// Constant for limit torque percent
	IF maxTorquePercentThrottle = 0 THEN
		maxTorquePercentThrottle := 50; // Change to 100, Max Torque Percent
	END_IF;
	gTorqueSensor.status.maxTorquePercent := maxTorquePercentThrottle;
	
	
	
	(* Range for torque sensor 1 *)
	torquePedalConstants.highLimit1 := torquePedalVariables.torquePedalMax1 + 200;
	torquePedalConstants.lowLimit1  := 0;
	
	(* Range for torque sensor 2 *)
	torquePedalConstants.highLimit2 := torquePedalVariables.torquePedalMax2 + 200;
	torquePedalConstants.lowLimit2 	:= 0;

	(* Torque off hysteresis values *)
	torquePedalConstants.torqueOffUpperHysteresis := 25; // [%]
	torquePedalConstants.torqueOffLowerHysteresis := 5;  // [%]
	
	(* Plausibility check disable (for test setup) *)
	gTorqueSensor.cmd.disablePlausibilityCheck := FALSE;
END_ACTION

ACTION TorquePedal: 
	// Percent of MAX torque at full throttle:
	gTorqueSensor.status.maxTorquePercent := maxTorquePercentThrottle;
	
	gTorqueSensor.status.errorOutOfRangeSensor1 := 	INT_TO_UINT(gTorqueSensor.inputs.torque1) > torquePedalConstants.highLimit1 OR 
													INT_TO_UINT(gTorqueSensor.inputs.torque1) < torquePedalConstants.lowLimit1;
	
	gTorqueSensor.status.errorOutOfRangeSensor2 := 	INT_TO_UINT(gTorqueSensor.inputs.torque2) > torquePedalConstants.highLimit2 OR 
													INT_TO_UINT(gTorqueSensor.inputs.torque2) < torquePedalConstants.lowLimit2;
	
	
	
	
	(* Calculate pedal percentages *)
	
	// Sensor 1
	IF NOT gTorqueSensor.status.errorOutOfRangeSensor1 THEN
		torquePedalVariables.slope := (100)/(UINT_TO_REAL(torquePedalVariables.torquePedalMax1) - UINT_TO_REAL(torquePedalVariables.torquePedalMin1));
		gTorqueSensor.data.torque1Percent := LIMIT(0 ,torquePedalVariables.slope * (INT_TO_REAL(gTorqueSensor.inputs.torque1)-(10+UINT_TO_REAL(torquePedalVariables.torquePedalMin1))),100);
	ELSE
		gTorqueSensor.data.torque1Percent := 0;
	END_IF;
	// gTorqueSensor.status.maxTorquePercent TODO: USE THIS FOR SCALING
	// Sensor 2
	IF NOT gTorqueSensor.status.errorOutOfRangeSensor2 THEN
		torquePedalVariables.slope := (100)/(UINT_TO_REAL(torquePedalVariables.torquePedalMax2) - UINT_TO_REAL(torquePedalVariables.torquePedalMin2));
		gTorqueSensor.data.torque2Percent := LIMIT(0 ,torquePedalVariables.slope * (INT_TO_REAL(gTorqueSensor.inputs.torque2)-UINT_TO_REAL(torquePedalVariables.torquePedalMin2)),100);
	ELSE
		gTorqueSensor.data.torque2Percent := 0;
	END_IF;
	
	// Sensor 1 is arbitrarily taken to be the torque percentage
	// Value is then scaled by desired power
	gTorqueSensor.status.torquePercentage := gTorqueSensor.data.torque1Percent*gTorqueSensor.status.maxTorquePercent/100;

	
	
	(* Test if torque sensor values are out of range of each other*)
	TorqueSensorsOutOfRange;
	TorqueOff;
	
	
	(* Report critical error if either of the torque pedal sensors leave their working range *)
	gTorqueSensor.status.criticalError := gTorqueSensor.status.errorOutOfRangeSensor1 OR gTorqueSensor.status.errorOutOfRangeSensor2 OR gTorqueSensor.status.plausibilityError;
	
	(* Determine if the torque pedal is working properly *)
	gTorqueSensor.status.ok := NOT gTorqueSensor.status.criticalError;
	
	
END_ACTION


(* Test if torque pedals are more than 10% different than each other *)
ACTION TorqueSensorsOutOfRange: 
	IF gTorqueSensor.cmd.disablePlausibilityCheck THEN
		gTorqueSensor.status.plausibilityError := FALSE;
	ELSE
		// check if torque sensor 1 and 2 vary more than 5 %
		gTorqueSensor.status.plausibilityError := ABS(gTorqueSensor.data.torque1Percent - gTorqueSensor.data.torque2Percent) > 5;
	END_IF;
END_ACTION

ACTION TorqueOff:
	IF gTorqueSensor.status.torqueEnabled THEN
		(* Test the criterias for turning off the torque. If they are met start timer *)
		IF 	gBraking.status.softBraking AND 
			(gTorqueSensor.data.torque1Percent >= torquePedalConstants.torqueOffUpperHysteresis OR 
			 gTorqueSensor.data.torque2Percent >= torquePedalConstants.torqueOffUpperHysteresis OR
		 	 gORION.data.packPower >= 5.0) THEN
			
			torquePedalVariables.TON_torqueOff.PT := T#250ms;	// Set timer duration TODO: Change to 500 that is the limit in the rules
			torquePedalVariables.TON_torqueOff.IN := TRUE;		// Start timer
		ELSE
			torquePedalVariables.TON_torqueOff.IN := FALSE;		// Else stop timer
		END_IF
		
		IF torquePedalVariables.TON_torqueOff.Q THEN			// If timer runs out
			gTorqueSensor.status.torqueEnabled := FALSE;		// Remove torque
		ELSE
			gTorqueSensor.status.torqueEnabled := TRUE;			// Else keep torque
		END_IF;
	ELSE
		(* Test the criterias for turning on the torque *)
		gTorqueSensor.status.torqueEnabled := 	gTorqueSensor.data.torque1Percent < torquePedalConstants.torqueOffLowerHysteresis AND 
												gTorqueSensor.data.torque2Percent < torquePedalConstants.torqueOffLowerHysteresis AND (NOT gBraking.status.softBraking);	
		torquePedalVariables.TON_torqueOff.IN := FALSE;			// Make sure the torque timer is stopped
	END_IF
	torquePedalVariables.TON_torqueOff();						// Run torque timer
END_ACTION