
(* 
Protocol specifications
https://gitlab.com/sdu-vikings/X/master-controller/-/wikis/Dashboard-CAN-Protocol
*)


ACTION msg_0x000: 
	ArCanSend_0.Frame.ID 		  := TX_CAN_ID_BASE + 16#000; // CAN-ID
	ArCanSend_0.Frame.DataLength  := 6; 	 // Datalength	
	
	speed 			:=	REAL_TO_INT(  gINS.data.actLonVelocity_kmh * 10.00 );
	soc 			:=	REAL_TO_INT(  gAMS.data.stateOfCharge * 10.00 );
	maxTemperature  := 	REAL_TO_UINT(MAX(gInverters.inverter[0].data.tempMotor, gInverters.inverter[1].data.tempMotor, gInverters.inverter[2].data.tempMotor, gInverters.inverter[3].data.tempMotor) * 10.00);
	
	memcpy(ADR(ArCanSend_0.Frame.Data[0]), ADR( speed 			), 2);
	memcpy(ADR(ArCanSend_0.Frame.Data[2]), ADR( soc 			), 2);
	memcpy(ADR(ArCanSend_0.Frame.Data[4]), ADR( maxTemperature	), 2);
	
END_ACTION

ACTION msg_0x001: 
	ArCanSend_0.Frame.ID 		  := TX_CAN_ID_BASE+ 16#001; // CAN-ID
	ArCanSend_0.Frame.DataLength  := 4; 	 // Datalength	

	
	memcpy(ADR(ArCanSend_0.Frame.Data[0]), ADR( gStateMachine.status.instructionIndex 	), 1);
	memcpy(ADR(ArCanSend_0.Frame.Data[1]), ADR( gStateMachine.status.state 				), 1);
	ArCanSend_0.Frame.Data[2].0 := gDashboard.outputs.com_error_Datalog;
	ArCanSend_0.Frame.Data[2].1 := gDashboard.outputs.com_error_SC;
	ArCanSend_0.Frame.Data[2].2 := gDashboard.outputs.com_error_Shunt;
	ArCanSend_0.Frame.Data[2].3 := gDashboard.outputs.com_error_AMS;
	ArCanSend_0.Frame.Data[2].4 := gDashboard.outputs.com_error_Dashboard;
	ArCanSend_0.Frame.Data[2].5 := gDashboard.outputs.com_error_3rd_Inv;
	ArCanSend_0.Frame.Data[2].6 := gDashboard.outputs.com_error_2nd_Inv;
	ArCanSend_0.Frame.Data[2].7 := gDashboard.outputs.com_error_1st_Inv;
	ArCanSend_0.Frame.Data[3].0 := gDashboard.outputs.com_error_0_Inv;
	ArCanSend_0.Frame.Data[3].1 := gDashboard.outputs.com_error_INS;
	ArCanSend_0.Frame.Data[3].2 := gDashboard.outputs.com_error_SteeringAngle;
	ArCanSend_0.Frame.Data[3].3 := gDashboard.outputs.com_error_BreakPressure_Front;
	ArCanSend_0.Frame.Data[3].4 := gDashboard.outputs.com_error_BreakPressure_Back;
	ArCanSend_0.Frame.Data[3].5 := gDashboard.outputs.com_error_TorquePedal;
	ArCanSend_0.Frame.Data[3].6 := gDashboard.outputs.com_error_TorquePedal_Plausi;
	ArCanSend_0.Frame.Data[3].7 := gDashboard.outputs.com_error_RTDS;
	ArCanSend_0.Frame.Data[4].0 := gDashboard.outputs.com_error_Cooling;
	ArCanSend_0.Frame.Data[4].1 := gDashboard.outputs.com_error_LV;
	ArCanSend_0.Frame.Data[4].2 := gDashboard.outputs.com_error_HighTemperature;

END_ACTION

ACTION msg_0x002: 
	ArCanSend_0.Frame.ID 		  := TX_CAN_ID_BASE + 16#002; // CAN-ID
	ArCanSend_0.Frame.DataLength  := 2; 	 // Datalength	
	
	
	ArCanSend_0.Frame.Data[0].0 := gDashboard.outputs.do_ledIMD;
	ArCanSend_0.Frame.Data[0].1 := gDashboard.outputs.do_ledAMS;
	ArCanSend_0.Frame.Data[0].2 := gDashboard.outputs.do_ledSC.0;
	ArCanSend_0.Frame.Data[0].3 := gDashboard.outputs.do_ledSC.1;
	ArCanSend_0.Frame.Data[0].4 := gDashboard.outputs.do_ledEBS;
	ArCanSend_0.Frame.Data[0].5 := gDashboard.outputs.do_ledDV;
	ArCanSend_0.Frame.Data[0].6 := gDashboard.outputs.do_ledREADY.0;
	ArCanSend_0.Frame.Data[0].7 := gDashboard.outputs.do_ledREADY.1;
	ArCanSend_0.Frame.Data[1].0 := gDashboard.outputs.do_ledLV;
	
	
	
END_ACTION

ACTION msg_0x003: 
	ArCanSend_0.Frame.ID 		  := TX_CAN_ID_BASE + 16#003; // CAN-ID
	ArCanSend_0.Frame.DataLength := 6; 	 // Datalength	
	
	memcpy(ADR(ArCanSend_0.Frame.Data[0]), ADR(gStateMachine.status.missionIndex), 1);
	
	ArCanSend_0.Frame.Data[1].0 := gInverters.cmd.enableTorqueVectoring;
	ArCanSend_0.Frame.Data[1].1 := gInverters.cmd.enableTractionControl;
	ArCanSend_0.Frame.Data[1].2 := gInverters.cmd.enablePowerLimiter;
	ArCanSend_0.Frame.Data[1].3 := gInverters.cmd.enableTorqueLimiter;
	//	ArCanSend_0.Frame.Data[1].4 := gInverters.cmd.enableLaunchProfile;
	ArCanSend_0.Frame.Data[1].5 := gInverters.cmd.enableRegenerativeBraking;
	ArCanSend_0.Frame.Data[1].6 := gInverters.status.regenerativeBrakingAvailable;
	torqueLimitNm  				:= REAL_TO_UINT(gInverters.data.torqueSetpointGain * 10.00);
	powerLimitKW  				:= REAL_TO_UINT(gInverters.data.powerLimitKW * 10.00);
	
	memcpy(ADR(ArCanSend_0.Frame.Data[2]), ADR(torqueLimitNm), 2);
	memcpy(ADR(ArCanSend_0.Frame.Data[4]), ADR(powerLimitKW), 2);
END_ACTION

ACTION msg_0x004:
	ArCanSend_0.Frame.ID 		  := TX_CAN_ID_BASE + 16#004; // CAN-ID
	ArCanSend_0.Frame.DataLength := 4; 	 // Datalength		
	
	lvBatVoltage  		:= 	REAL_TO_UINT( gLowVoltageBattery.data.voltage * 10.00 );
	estimatedRange  	:=  REAL_TO_UINT( gINS.data.distEstimated * 10.00 );
	
	
	memcpy(ADR(ArCanSend_0.Frame.Data[0]), ADR( lvBatVoltage 	), 2);
	memcpy(ADR(ArCanSend_0.Frame.Data[2]), ADR( estimatedRange  ), 2);
	
END_ACTION