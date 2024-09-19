ACTION msg_shunt_021: 
	
	// Check if message is of type 'Result' which means it contains measured data and not configuration data
	// If byte 0 is b'0000xxxx' (the 4 msb's are 0) then the type of 'Result'
	IF ArCanReceive_0.ReceivedFrame.Data[0].7 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].6 = 0 AND 
		ArCanReceive_0.ReceivedFrame.Data[0].5 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].4 = 0 THEN	
		// Extract data and switch from big to little endian
		convertData;
		gShunt.data.actCurrent := UDINT_TO_REAL(data)/1000.0; // sent as big indian 4 bytes. [1mA]
	END_IF;
	
END_ACTION

//Considered to be voltage of the TS side of the car
ACTION msg_shunt_022: 
	IF ArCanReceive_0.ReceivedFrame.Data[0].7 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].6 = 0 AND 
		ArCanReceive_0.ReceivedFrame.Data[0].5 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].4 = 0 THEN	
		// Extract data
		convertData;
		gShunt.data.actVoltage := UDINT_TO_REAL(data)/1000.0; // sent as big indian 4 bytes. [1mV]
	END_IF;
	
END_ACTION

// Not currently in use
ACTION msg_shunt_023: 
	IF ArCanReceive_0.ReceivedFrame.Data[0].7 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].6 = 0 AND 
		ArCanReceive_0.ReceivedFrame.Data[0].5 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].4 = 0 THEN	
		// Extract data
		convertData;
		gShunt.data.actVoltage2 := UDINT_TO_REAL(data)/1000.0; // sent as big indian 4 bytes. [1mV]
	END_IF;
END_ACTION


ACTION msg_shunt_026: 
	IF ArCanReceive_0.ReceivedFrame.Data[0].7 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].6 = 0 AND 
		ArCanReceive_0.ReceivedFrame.Data[0].5 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].4 = 0 THEN	
		// Extract data
		convertData;
		gShunt.data.actPowerW := UDINT_TO_REAL(data);
		gShunt.data.actPowerKW := gShunt.data.actPowerW/1000.0; // sent as big indian 4 bytes. [1mW]
	END_IF;
END_ACTION

ACTION msg_shunt_027: 
	IF ArCanReceive_0.ReceivedFrame.Data[0].7 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].6 = 0 AND 
		ArCanReceive_0.ReceivedFrame.Data[0].5 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].4 = 0 THEN	
		// Extract data
		convertData;
		gShunt.data.actCurrentAS := UDINT_TO_REAL(data);
	END_IF;
END_ACTION

ACTION msg_shunt_028: 
	IF ArCanReceive_0.ReceivedFrame.Data[0].7 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].6 = 0 AND 
		ArCanReceive_0.ReceivedFrame.Data[0].5 = 0 AND ArCanReceive_0.ReceivedFrame.Data[0].4 = 0 THEN	
		// Extract data
		convertData;
		gShunt.data.actPowerWH  := UDINT_TO_REAL(data);
		gShunt.data.actPowerKWH := gShunt.data.actPowerWH/1000.0;
	END_IF;
END_ACTION

