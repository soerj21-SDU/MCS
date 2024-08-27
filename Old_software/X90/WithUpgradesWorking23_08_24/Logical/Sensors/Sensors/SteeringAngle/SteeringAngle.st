
ACTION SteeringAngleInit: 
	(* Sensor limit values *)
	steeringAngleVariables.leftValue 	:= 1000;
	steeringAngleVariables.rightValue 	:= 10000;
	
	(* Error detection values *)
	steeringAngleConstants.disconnectionLimit := 300;
	steeringAngleConstants.lowLimit 	:= steeringAngleVariables.leftValue  - 500;
	steeringAngleConstants.highLimit 	:= steeringAngleVariables.rightValue + 500;
	
	steeringAngleConstants.MAX_ANGLE 	:=  100.00;
	steeringAngleConstants.MIN_ANGLE 	:= -100.00;
END_ACTION


ACTION SteeringAngle: 
	(* 	Check if sensor input is within working range 
		If not report an error  	*)
	gSteeringAngle.status.disconnected := INT_TO_UINT(gSteeringAngle.inputs.angleSensor) < steeringAngleConstants.disconnectionLimit;
	gSteeringAngle.status.errorOutOfRange := (NOT gSteeringAngle.status.disconnected) AND (INT_TO_UINT(gSteeringAngle.inputs.angleSensor) > steeringAngleConstants.highLimit OR INT_TO_UINT(gSteeringAngle.inputs.angleSensor) < steeringAngleConstants.lowLimit);
	(* Summerize errors *)
	gSteeringAngle.status.error := gSteeringAngle.status.disconnected OR gSteeringAngle.status.errorOutOfRange;
	
	
	(* Calculate steering angle *)
	IF NOT gSteeringAngle.status.error THEN
		// No error
		IF INT_TO_UINT(gSteeringAngle.inputs.angleSensor) < steeringAngleVariables.leftValue THEN
			gSteeringAngle.data.angleDegrees := steeringAngleConstants.MIN_ANGLE;
		ELSIF INT_TO_UINT(gSteeringAngle.inputs.angleSensor) > steeringAngleVariables.rightValue THEN
			gSteeringAngle.data.angleDegrees := steeringAngleConstants.MAX_ANGLE;
		ELSE
			gSteeringAngle.data.angleDegrees := LIMIT(-100, (INT_TO_REAL(gSteeringAngle.inputs.angleSensor) - UINT_TO_REAL(steeringAngleVariables.leftValue))/(UINT_TO_REAL(steeringAngleVariables.rightValue) - UINT_TO_REAL(steeringAngleVariables.leftValue)) * 
			(ABS(steeringAngleConstants.MAX_ANGLE) + ABS(steeringAngleConstants.MIN_ANGLE)) + steeringAngleConstants.MIN_ANGLE, 100);
		END_IF;	
	ELSE
		// Error 
		gSteeringAngle.data.angleDegrees := 0;
	END_IF
	
	(* Determine if the steering angle sensor is working properly *)
	gSteeringAngle.status.ok := NOT gSteeringAngle.status.disconnected AND NOT gSteeringAngle.status.error;
	
	// Visualization action
	hmi;

END_ACTION
