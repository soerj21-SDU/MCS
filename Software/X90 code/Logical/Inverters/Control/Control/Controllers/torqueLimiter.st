ACTION torqueLimiterInit: 
	// Initialize the controller values
	gInverters.status.deratingStaticPercent := 100;
	
	control.TL.max_torque 	 := 1; // [%/100]. 0.3 = 30%
END_ACTION

ACTION torqueLimiterCyclic: 
	// Service the controller
	
	
	//	control.TL.enable			:= gInverters.cmd.enableStatic;
	//	control.TL.max_torque		:= gInverters.status.deratingStaticPercent / 100.00;
	//	control.TL();
END_ACTION