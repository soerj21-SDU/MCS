
ACTION regenerativeBrakingInit:
	// Initialize the controller values
	control.RB.IDLE_MOTOR_TORQUE := 0.3; //[%/100]. 0.3 = 30%
END_ACTION


ACTION regenerativeBrakingCyclic:
	// Service the controller
	
//	control.RB.enable 		 	:= gInverters.cmd.enableRegenerativeBraking;
//	control.RB.brake_pressure	:= gBraking.data.pressurePercentage;
//	control.RB();
END_ACTION	

