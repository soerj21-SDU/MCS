

ACTION torqueVectoringInit:
	// Initialize the controller values
	control.TV.MAX_DERATING 		:= 0.50;// [%/100]
	control.TV.MAX_STEERING_ANGLE 	:= 100; // [deg]
END_ACTION


ACTION torqueVectoringCyclic:
	// Service the controller
	
//	control.TV.enable 			:= gInverters.cmd.enableTorqueVectoring;
//	control.TV.torque_input 	:= gTorqueSensor.status.torquePercentage/100.00; // Torque signal [0,1]
//	control.TV.steering_angle 	:= gSteeringAngle.data.angleDegrees;
//	control.TV();
END_ACTION	