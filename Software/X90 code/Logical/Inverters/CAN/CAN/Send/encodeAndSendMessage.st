
ACTION encodeAndSendMessage:
	(* Write data *)
	(* Booleans *)
	bus[i].ArCanSend_0.Frame.Data[1].0 := gInverters.inverter[j].outputs.com_interverOn;
	bus[i].ArCanSend_0.Frame.Data[1].1 := gInverters.inverter[j].outputs.com_dcOn;
	bus[i].ArCanSend_0.Frame.Data[1].2 := gInverters.inverter[j].outputs.com_enable;
	bus[i].ArCanSend_0.Frame.Data[1].3 := gInverters.inverter[j].outputs.com_errorReset;
	
	(* Integers *)
	IF gInverters.status.torqueBasedThrottle THEN // If throttle should be torque based, set velocity to max velocity
		IF gInverters.inverter[j].outputs.com_targetTorque > 0 THEN
			gInverters.inverter[j].outputs.com_targetTorque := gInverters.inverter[j].outputs.com_targetVelocity ; // Max RPM of motor
		ELSE
			gInverters.inverter[j].outputs.com_targetTorque := 0;
		END_IF;
	END_IF
	memcpy(ADR(bus[i].ArCanSend_0.Frame.Data[2]),ADR(gInverters.inverter[j].outputs.com_targetTorque), 2); // ACtually velocity setpoint [rpm]
	
	
	IF gInverters.inverter[j].outputs.com_torqueLimitPos < 0 THEN
	  gInverters.inverter[j].outputs.com_torqueLimitPos := 0;
	END_IF;
	memcpy(ADR(bus[i].ArCanSend_0.Frame.Data[4]),ADR(gInverters.inverter[j].outputs.com_torqueLimitPos), 2);
	memcpy(ADR(bus[i].ArCanSend_0.Frame.Data[6]),ADR(gInverters.inverter[j].outputs.com_torqueLimitNeg), 2);

	IF NOT gIsSimulation THEN
		
		(* Set DLC *)
		bus[i].ArCanSend_0.Frame.DataLength 	:= 8;
		
		(* Send message *)
		bus[i].ArCanSend_0(SendFrame := TRUE);
		bus[i].ArCanSend_0(SendFrame := FALSE);
	END_IF;
END_ACTION

