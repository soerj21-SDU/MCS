

ACTION tractionControlInit: 
	// Initialize the controller values
	control.TC.enable 		 := gInverters.cmd.enableTractionControl;
	control.TC.LON_SLIP_REF  := 0.1;
	FOR i := 0 TO INVERTER_COUNT DO
		control.TC.I_GAIN[i] := 0;
		control.TC.P_GAIN[i] := 0;
	END_FOR;
END_ACTION

ACTION tractionControlCyclic: 
	// Service the controller
	
	//	control.TC.enable			:= gInverters.cmd.enableTractionControl;
//	FOR i := 0 TO INVERTER_COUNT DO
//		control.TC.longitudinal_wheel_slip[i] := 0; // Calculate
//	END_FOR
//	control.TC();
END_ACTION