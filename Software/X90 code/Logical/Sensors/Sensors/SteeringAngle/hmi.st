
ACTION hmi: 

	(* Wheels *)
	gSteeringAngle.data.wheelAngle := gSteeringAngle.data.angleDegrees / 3.33;
	gSteeringAngle.status.wheelSVG := '[{"select":"#wheel","duration":0,"spin":[';
	steeringAngleVariables.wheelAngleStr := REAL_TO_STRING(gSteeringAngle.data.wheelAngle);
	brdkStrCat(ADR(gSteeringAngle.status.wheelSVG), ADR(steeringAngleVariables.wheelAngleStr));
	brdkStrCat(ADR(gSteeringAngle.status.wheelSVG), ADR(',55,85]}]'));
	
	
	(* Steering angle transformation and show if buttons are pressed*)
	gSteeringAngle.status.steeringWheelSVG := '[';
	steeringAngleVariables.steeringWheelAngleStr := REAL_TO_STRING(gSteeringAngle.data.angleDegrees);
	brdkStrCat(ADR(gSteeringAngle.status.steeringWheelSVG),ADR('{"select":"#all","duration":0,"spin":['));
	brdkStrCat(ADR(gSteeringAngle.status.steeringWheelSVG),ADR(steeringAngleVariables.steeringWheelAngleStr));
	brdkStrCat(ADR(gSteeringAngle.status.steeringWheelSVG),ADR(',290,245]}'));
		
	brdkStrCat(ADR(gSteeringAngle.status.steeringWheelSVG),ADR(']'));
END_ACTION
