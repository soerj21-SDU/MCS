


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

END_ACTION

ACTION msg_0x002: 

END_ACTION

ACTION msg_0x003: 

END_ACTION
