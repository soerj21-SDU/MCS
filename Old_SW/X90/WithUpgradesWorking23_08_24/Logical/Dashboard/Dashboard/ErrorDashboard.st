	
ACTION ErrorDashboard:
	
	gDashboard.outputs.com_error_Datalog 				:= NOT gDataLogging.status.dataloggingActive; // Datalogging not active
	gDashboard.outputs.com_error_SC 					:= NOT gSafetyChain.status.scOK_notEnabled; // Safety chain not ok
	gDashboard.outputs.com_error_Shunt 					:= NOT gShunt.status.ok; // Shunt error
	gDashboard.outputs.com_error_AMS 					:= NOT gAMS.status.ok; // AMS error
	gDashboard.outputs.com_error_Dashboard 				:= NOT gDashboard.status.ok; // Dashboard error
	gDashboard.outputs.com_error_3rd_Inv 				:= NOT gInverters.inverter[3].status.ok; // 3rd inverter error
	gDashboard.outputs.com_error_2nd_Inv 				:= NOT gInverters.inverter[2].status.ok; // 2nd inverter error
	gDashboard.outputs.com_error_1st_Inv 				:= NOT gInverters.inverter[1].status.ok; // 1st inverter error
	gDashboard.outputs.com_error_0_Inv 					:= NOT gInverters.inverter[0].status.ok; // [0] inverter error
	gDashboard.outputs.com_error_INS 					:= NOT gINS.status.ok; // INS error
	gDashboard.outputs.com_error_SteeringAngle 			:= gSteeringAngle.status.errorOutOfRange; // Steering angle out of range
	gDashboard.outputs.com_error_BreakPressure_Front 	:= gBraking.status.errorOutOfRangeFront; // Brake Pressure out-of-range (Front)
	gDashboard.outputs.com_error_BreakPressure_Back 	:= gBraking.status.errorOutOfRangeRear; // Brake Pressure out-of-range (Rear)
	gDashboard.outputs.com_error_TorquePedal 			:= gTorqueSensor.status.criticalError; // One of the Torque Pedal sensors out of range
	gDashboard.outputs.com_error_TorquePedal_Plausi 	:= gTorqueSensor.status.plausibilityError; // Plausibility error on Torque pedal
	gDashboard.outputs.com_error_RTDS 					:= NOT gRTDS.status.ok; // RTDS error
	gDashboard.outputs.com_error_Cooling	 			:= NOT gCooling.status.ok; // Cooling error
	gDashboard.outputs.com_error_LV 					:= gLowVoltageBattery.status.empty; // Low Voltage Battery critically low
	gDashboard.outputs.com_error_HighTemperature 		:= gCooling.status.warningHighTemperature;
END_ACTION

