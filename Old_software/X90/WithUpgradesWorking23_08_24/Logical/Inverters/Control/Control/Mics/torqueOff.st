
(* Test if both brake and torque pedal is pressed at the same time. If so turn on torque until both pedals has been released again *)
ACTION torqueOff: 
	// If inverter are allowed to shut eachother down parse through each pair and check if it should shut its partner down
	IF gInverters.cmd.enableMotorPairShutdown THEN
		(* Front *)
		gInverters.inverter[1].cmd.shutdownByPartner := gInverters.inverter[0].status.errorTimeout;
		gInverters.inverter[0].cmd.shutdownByPartner := gInverters.inverter[1].status.errorTimeout;
		
		(* Rear *)
		gInverters.inverter[3].cmd.shutdownByPartner := gInverters.inverter[2].status.errorTimeout;
		gInverters.inverter[2].cmd.shutdownByPartner := gInverters.inverter[3].status.errorTimeout;
	ELSE
		// Else let all inverters run for themselves
		FOR i := 0 TO INVERTER_COUNT DO
			gInverters.inverter[i].cmd.shutdownByPartner := FALSE;
		END_FOR;
	END_IF;


	(* Output actual torque *)
	FOR i := 0 TO INVERTER_COUNT DO
		gInverters.inverter[i].outputs.torqueEnable := gTorqueSensor.status.torqueEnabled AND NOT (gInverters.inverter[i].cmd.shutdownByPartner OR gInverters.inverter[i].status.errorTimeout);
	END_FOR;
	IF NOT gInverters.cmd.manualControl THEN	
		IF gInverters.cmd.enableMotorPairShutdown THEN
			gInverters.output.do_enableInv12 := gInverters.inverter[0].outputs.torqueEnable AND gInverters.inverter[1].outputs.torqueEnable;
			gInverters.output.do_enableInv34 := gInverters.inverter[2].outputs.torqueEnable AND gInverters.inverter[3].outputs.torqueEnable;
		END_IF;
	END_IF;
	
END_ACTION
