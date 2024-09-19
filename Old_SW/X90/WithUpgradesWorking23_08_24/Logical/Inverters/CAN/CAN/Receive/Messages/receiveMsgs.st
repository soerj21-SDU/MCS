
(* Inverter 1, Actual value 1 *)
ACTION Inv_ActualValue1: 

	gInverters.inverter[inverterId].inputs.com_systemReady 			:= bus[i].ArCanReceive_0.ReceivedFrame.Data[1].0;
	gInverters.inverter[inverterId].inputs.com_error 				:= bus[i].ArCanReceive_0.ReceivedFrame.Data[1].1;
	gInverters.inverter[inverterId].inputs.com_warning 				:= bus[i].ArCanReceive_0.ReceivedFrame.Data[1].2;
	gInverters.inverter[inverterId].inputs.com_quitDcOn 			:= bus[i].ArCanReceive_0.ReceivedFrame.Data[1].3;
	gInverters.inverter[inverterId].inputs.com_dcOn 				:= bus[i].ArCanReceive_0.ReceivedFrame.Data[1].4;
	gInverters.inverter[inverterId].inputs.com_quitInverterOn		:= bus[i].ArCanReceive_0.ReceivedFrame.Data[1].5;
	gInverters.inverter[inverterId].inputs.com_inverterOn 			:= bus[i].ArCanReceive_0.ReceivedFrame.Data[1].6;
	gInverters.inverter[inverterId].inputs.com_derating 			:= bus[i].ArCanReceive_0.ReceivedFrame.Data[1].7;

	memcpy(ADR(gInverters.inverter[inverterId].inputs.com_actualVelocity), 		ADR(bus[i].ArCanReceive_0.ReceivedFrame.Data[2]), 2);	
	memcpy(ADR(gInverters.inverter[inverterId].inputs.com_torqueCurrent), 	  	ADR(bus[i].ArCanReceive_0.ReceivedFrame.Data[4]), 2);
	memcpy(ADR(gInverters.inverter[inverterId].inputs.com_magnetizingCurrent), 	ADR(bus[i].ArCanReceive_0.ReceivedFrame.Data[6]), 2);
	
END_ACTION

(* Inverter 1, Actual value 2 *)
ACTION Inv_ActualValue2: 
	memcpy(ADR(gInverters.inverter[inverterId].inputs.com_tempMotor), 			ADR(bus[i].ArCanReceive_0.ReceivedFrame.Data[0]), 2);	
	memcpy(ADR(gInverters.inverter[inverterId].inputs.com_tempInverter), 		ADR(bus[i].ArCanReceive_0.ReceivedFrame.Data[2]), 2);
	memcpy(ADR(gInverters.inverter[inverterId].inputs.com_errorDiagnostics),	ADR(bus[i].ArCanReceive_0.ReceivedFrame.Data[4]), 2);
	memcpy(ADR(gInverters.inverter[inverterId].inputs.com_tempIGBT),  			ADR(bus[i].ArCanReceive_0.ReceivedFrame.Data[6]), 2);
END_ACTION

