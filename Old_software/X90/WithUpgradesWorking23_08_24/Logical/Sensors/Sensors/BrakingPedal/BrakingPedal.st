
ACTION BrakingPedalInit: 
	(* Sensor limit values *)
	brakingPedalVariables.brakingPedalRearMax 		:= 8000;
	brakingPedalVariables.brakingPedalRearMin 		:= 1655;
	brakingPedalVariables.brakingPedalFrontMax 		:= 8000;
	brakingPedalVariables.brakingPedalFrontMin 		:= 1655;
	
	
	(* Braking limits *)
	brakingPedalConstants.hardBrakingLimit			:= 5400;
	brakingPedalConstants.softBrakingLimit			:= 2000;
	
	(* Upper limit symboling an electrical fault *)
//	brakingPedalConstants.frontWarningLimitMaxMax 	:= brakingPedalVariables.brakingPedalFrontMax + 500;
//	brakingPedalConstants.rearWarningLimitMaxMax 	:= brakingPedalVariables.brakingPedalRearMax  + 500;
	brakingPedalConstants.frontWarningLimitMaxMax 	:= 15250;
	brakingPedalConstants.rearWarningLimitMaxMax 	:= 15250;
	
	
	(* Upper limit symboling a mechanical fault *)
	brakingPedalConstants.frontWarningLimitMax 		:= brakingPedalVariables.brakingPedalFrontMax + 100;
	brakingPedalConstants.rearWarningLimitMax 		:= brakingPedalVariables.brakingPedalRearMax  + 100;
	
	(* Lower limit symboling a mechanical fault *)
	brakingPedalConstants.frontWarningLimitMin 		:= brakingPedalVariables.brakingPedalFrontMin - 100;
	brakingPedalConstants.rearWarningLimitMin 		:= brakingPedalVariables.brakingPedalRearMin  - 100;
	
	(* Lower limit symboling an electrical fault *)
	brakingPedalConstants.frontWarningLimitMinMin 	:= brakingPedalVariables.brakingPedalFrontMin - 500;
	brakingPedalConstants.rearWarningLimitMinMin 	:= brakingPedalVariables.brakingPedalRearMin  - 500;
	
END_ACTION

ACTION BrakingPedal: 
	(* Detect if brake pedal is being pressed lightly *)
	gBraking.status.softBraking 		 := INT_TO_UINT(gBraking.inputs.ai_brakePressureFront) > brakingPedalConstants.softBrakingLimit OR 
											INT_TO_UINT(gBraking.inputs.ai_brakePressureRear)  > brakingPedalConstants.softBrakingLimit OR
											gSoftBrakingForced;
	
	(* Detect hard braking *)
	gBraking.status.hardBraking 		 := INT_TO_UINT(gBraking.inputs.ai_brakePressureFront) > brakingPedalConstants.hardBrakingLimit OR 
										    INT_TO_UINT(gBraking.inputs.ai_brakePressureRear)  > brakingPedalConstants.hardBrakingLimit;
	
	
	(* Control brakelight *)
	IF gStateMachine.status.state <> STATE_INITIALIZE THEN
		gBraking.outputs.do_brakeLight   := gBraking.status.softBraking;
	END_IF

	(* Check if brake pressures are out of range *)
	// If brake pressure front get above limit, an error message is shown. 
	gBraking.status.errorOutOfRangeFront := INT_TO_UINT(gBraking.inputs.ai_brakePressureFront) >= brakingPedalConstants.frontWarningLimitMax OR 
											INT_TO_UINT(gBraking.inputs.ai_brakePressureFront) <= brakingPedalConstants.frontWarningLimitMin;
	
	// If brake pressure rear get above limit, an error message is shown. 	
	gBraking.status.errorOutOfRangeRear := 	INT_TO_UINT(gBraking.inputs.ai_brakePressureRear) >= brakingPedalConstants.rearWarningLimitMax OR 
											INT_TO_UINT(gBraking.inputs.ai_brakePressureRear) <= brakingPedalConstants.rearWarningLimitMin;

	
	(* Calculate pedal percentages *)
	IF NOT gBraking.status.errorOutOfRangeFront THEN
		brakingPedalVariables.slope := (100.00)/(UINT_TO_REAL(brakingPedalVariables.brakingPedalFrontMax) - UINT_TO_REAL(brakingPedalVariables.brakingPedalFrontMin));
		gBraking.data.pressurePercentageFront := LIMIT(0 ,brakingPedalVariables.slope * (INT_TO_REAL(gBraking.inputs.ai_brakePressureFront)-UINT_TO_REAL(brakingPedalVariables.brakingPedalFrontMin)),100);
	ELSE
		gBraking.data.pressurePercentageFront := 0;
	END_IF;

	IF NOT gBraking.status.errorOutOfRangeRear THEN
		brakingPedalVariables.slope := (100.00)/(UINT_TO_REAL(brakingPedalVariables.brakingPedalRearMax) - UINT_TO_REAL(brakingPedalVariables.brakingPedalRearMin));
		gBraking.data.pressurePercentageRear := LIMIT(0 ,brakingPedalVariables.slope * (INT_TO_REAL(gBraking.inputs.ai_brakePressureRear)-UINT_TO_REAL(brakingPedalVariables.brakingPedalRearMin)),100);
	ELSE
		gBraking.data.pressurePercentageRear := 0;
	END_IF;
	
	
	gBraking.data.pressurePercentage := (gBraking.data.pressurePercentageFront + gBraking.data.pressurePercentageRear)/2.0;
	
	(* Determine if the brake pedal + sensors are working properly *)
	gBraking.status.ok := NOT gBraking.status.errorOutOfRangeFront AND NOT gBraking.status.errorOutOfRangeRear;
	
	
	// Calculate actual pressure
	gBraking.data.pressureBarFront 	:= ((INT_TO_REAL(gBraking.inputs.ai_brakePressureFront)*10/32768)-0.5)*40;
	gBraking.data.pressureBarRear	:= ((INT_TO_REAL(gBraking.inputs.ai_brakePressureRear)*10/32768)-0.5)*40;
	
END_ACTION
