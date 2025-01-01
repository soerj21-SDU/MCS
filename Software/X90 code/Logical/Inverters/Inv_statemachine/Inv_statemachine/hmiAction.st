(* Convert values to show on liveview *)
ACTION hmiAction:
	(* Calculate correct values *)
	FOR i := 0 TO INVERTER_COUNT DO
		
		gInverters.inverter[i].data.tempIGBT 					:= gInverters.inverter[i].inputs.com_tempIGBT 	/ 10.00;
		gInverters.inverter[i].data.tempInverter 				:= gInverters.inverter[i].inputs.com_tempInverter / 10.00;
		gInverters.inverter[i].data.tempMotor 				:= gInverters.inverter[i].inputs.com_tempMotor 	/ 10.00;
		
		gInverters.inverter[i].data.actualVelocity 			:= gInverters.inverter[i].inputs.com_actualVelocity;
		gInverters.inverter[i].data.torqueCurrent 			:= (gInverters.inverter[i].inputs.com_torqueCurrent*CONVERTER_PEAK_CURRENT)	  /16384.00;
		gInverters.inverter[i].data.torqueMagnitizingCurrent 	:= (gInverters.inverter[i].inputs.com_magnetizingCurrent*CONVERTER_PEAK_CURRENT)/16384.00;
	END_FOR;


	
END_ACTION
