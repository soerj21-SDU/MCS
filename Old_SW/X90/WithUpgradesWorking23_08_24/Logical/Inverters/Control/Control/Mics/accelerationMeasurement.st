
ACTION accelerationMeasurement: 
	TON_acceleration_0to100.PT := T#10s;
	
	TON_acceleration_0to100();
	
	IF enableAccelerationTimer THEN
		TON_acceleration_0to100(IN 		:= (gInverters.data.averageVelocityKmh >= 0.5 AND gStateMachine.status.state = STATE_DRIVE));	
		enableAccelerationTimer 		:= NOT TON_acceleration_0to100.Q;
		
		IF gInverters.data.averageVelocityKmh >= 100.0 THEN
			gInverters.data.acceleration_0to100kmh_inSecs := TON_acceleration_0to100.ET;
			enableAccelerationTimer 	:= FALSE;
			TON_acceleration_0to100.IN 	:= FALSE;
		END_IF;
	ELSE
		IF gInverters.data.averageVelocityKmh < 0.5 THEN
			enableAccelerationTimer 	:= TRUE;
			TON_acceleration_0to100.IN 	:= FALSE;
			gInverters.data.acceleration_0to100kmh_inSecs := T#0s;
		END_IF;
	END_IF;
	
END_ACTION
