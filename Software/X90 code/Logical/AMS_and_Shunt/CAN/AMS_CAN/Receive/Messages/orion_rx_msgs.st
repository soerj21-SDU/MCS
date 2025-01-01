// Frame ID's correspoinding to the orion bms
//  Some message
ACTION msg_orion_001: 
	// Byte 0 and 1
	brsmemcpy(ADR(packPower), ADR(ArCanReceive_0.ReceivedFrame.Data[0]), 2 * SIZEOF(ArCanReceive_0.ReceivedFrame.Data[0])); 
	gORION.data.packPower 	:= INT_TO_REAL(packPower) / 10; // packpower sent as 0.1kW 
	gAMS.data.packPower 	:= gORION.data.packPower;
	
	// byte 2 and 3, Total pack voltage
	brsmemcpy(ADR(packVoltage), ADR(ArCanReceive_0.ReceivedFrame.Data[2]), 2 * SIZEOF(ArCanReceive_0.ReceivedFrame.Data[2]));
	gAMS.data.batteryVoltage 	:= UINT_TO_REAL(packVoltage) / 10; // Pack voltage sent as 0.1V
	gORION.data.packVoltage 	:= gAMS.data.batteryVoltage;
	
	
	
	// Byte 4 and 5, Total pack Current
	brsmemcpy(ADR(packCurrent), ADR(ArCanReceive_0.ReceivedFrame.Data[4]), 2 * SIZEOF(ArCanReceive_0.ReceivedFrame.Data[4]));
	gAMS.data.outputCurrent 	:= INT_TO_REAL(packCurrent) / 10; // Pack Current sent as 0.1A
	gORION.data.outputCurrent 	:= gAMS.data.outputCurrent;
	gORION.data.chargeCurrent	:= - gAMS.data.outputCurrent;
	
	
	// Byte 6 and 7, Charge Current Limit
	brsmemcpy(ADR(gORION.data.CCL), ADR(ArCanReceive_0.ReceivedFrame.Data[6]), 2 * SIZEOF(ArCanReceive_0.ReceivedFrame.Data[6]));
	
	
	
END_ACTION


// Errors and DTC STATUS
ACTION msg_orion_002: 	
	// BYte 0 and 1
	brsmemcpy(ADR(gAMS.status.DTC1Status), ADR(ArCanReceive_0.ReceivedFrame.Data[0]), 2* SIZEOF(ArCanReceive_0.ReceivedFrame.Data[0]));
	// Byte 2 and 3
	brsmemcpy(ADR(gAMS.status.DTC2Status), ADR(ArCanReceive_0.ReceivedFrame.Data[2]), 2* SIZEOF(ArCanReceive_0.ReceivedFrame.Data[2]));
	gAMS.status.error.highVoltage	:= gAMS.status.DTC1Status.5 OR gAMS.status.DTC2Status.6;
	gAMS.status.error.lowVoltage	:= gAMS.status.DTC1Status.6 OR gAMS.status.DTC2Status.6;
	gAMS.status.error.highTemp 		:= gAMS.status.DTC1Status.7;
	
	// Byte 4
	// Make some flag wih the MPI to tell the status of these
	gAMS.status.error.imdError 		:= ArCanReceive_0.ReceivedFrame.Data[4].0;
	gAMS.status.error.amsError 		:= ArCanReceive_0.ReceivedFrame.Data[4].1;
	//gAMS.status.error.openSc		:= ArCanReceive_0.ReceivedFrame.Data[4].2;
	gAMS.status.scEnabled			:= ArCanReceive_0.ReceivedFrame.Data[4].2;
	gORION.status.sdcEnabled		:= gAMS.status.scEnabled;
	gAMS.status.relayState.MPEnableSignalStatus := ArCanReceive_0.ReceivedFrame.Data[4].3;
	
	
	// BYte 5, rolling counter incrementing every 100ms.
	gORION.data.rollingCounter := BYTE_TO_USINT(ArCanReceive_0.ReceivedFrame.Data[5]);
	
	
	// Byte 6 and 7, Discharge Current Limit
	brsmemcpy(ADR(gORION.data.DCL), ADR(ArCanReceive_0.ReceivedFrame.Data[6]), 2 * SIZEOF(ArCanReceive_0.ReceivedFrame.Data[6]));
	
	
END_ACTION
 

ACTION msg_orion_003: 
	// 0 and 1, state of relays (Should be sent as little endian)
	brsmemcpy(ADR(gAMS.status.relayState.relayState),ADR(ArCanReceive_0.ReceivedFrame.Data[0]), 2* SIZEOF(ArCanReceive_0.ReceivedFrame.Data[0]));
	gAMS.status.relayState.dischargeRelayEnabled 		:= gAMS.status.relayState.relayState.0;
	gAMS.status.relayState.chargeRelayEnabled	 		:= gAMS.status.relayState.relayState.1;
	gAMS.status.relayState.chargerSafetyEnabled	 		:= gAMS.status.relayState.relayState.2;
	gAMS.status.relayState.malfunctionIndicatorActive 	:= gAMS.status.relayState.relayState.3;
	gAMS.status.relayState.MPI1SignalStatus 			:= gAMS.status.relayState.relayState.4;
	gAMS.status.relayState.alwaysOnSignalStatus 		:= gAMS.status.relayState.relayState.5;
	gAMS.status.relayState.isReadyInputStatus 			:= gAMS.status.relayState.relayState.6;
	gAMS.status.relayState.isChargingInputStatus 		:= gAMS.status.relayState.relayState.7;
	
	// gAMS.status.relayState.MPI2SignalStatus 			:= gAMS.status.relayState.relayState.8;
	// gAMS.status.relayState.MPI3SignalStatus  		:= gAMS.status.relayState.relayState.9;
	// gAMS.status.relayState.chargeModeStatus 			:= gAMS.status.relayState.relayState.10;
	// gAMS.status.relayState.MPO2SignalStatus 			:= gAMS.status.relayState.relayState.11;
	// gAMS.status.relayState.MPO3SignalStatus 			:= gAMS.status.relayState.relayState.12;
	// gAMS.status.relayState.MPO4SignalStatus 			:= gAMS.status.relayState.relayState.13;
	// gAMS.status.relayState.MPEnableSignalStatus 		:= gAMS.status.relayState.relayState.14;
	// gAMS.status.relayState.MPO1SignalStatus 			:= gAMS.status.relayState.relayState.15;
	

	
	// byte 3
	gAMS.data.cellTempMax := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[3]); // Max cell temperature of pack, send as (1 degree celcius)
	// Since it is not possible to get all cell voltages independently, max temp i applied to all cells in logic
	appendTemps;
	
	// Byte 4
	gAMS.data.stateOfCharge := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[4]) / 2; // State of charge of battery, (0,5%)
	
	// Byte 5
	gAMS.status.Counter := BYTE_TO_USINT(ArCanReceive_0.ReceivedFrame.Data[5]); // Counter can be used to make sure Orion BMS is still running and is not stuck
	
	// byte 6 and 7
	// Failsafe statuses:
	brsmemcpy(ADR(gAMS.status.failsafeStatus.failsafeStatus), ADR(ArCanReceive_0.ReceivedFrame.Data[6]), 2 * SIZEOF(ArCanReceive_0.ReceivedFrame.Data[6]));
	gAMS.status.error.relayFailed := gAMS.status.failsafeStatus.failsafeStatus.2;
	
	
END_ACTION

// Related to DCL and CCL in KW 
ACTION msg_orion_004:
	// Byte 0-1 Discharge Current limit expressed in KW
	brsmemcpy(ADR(DCL_KW_Temp),ADR(ArCanReceive_0.ReceivedFrame.Data[0]), 2* SIZEOF(ArCanReceive_0.ReceivedFrame.Data[0]));
	gORION.data.DCL_KW := INT_TO_REAL(DCL_KW_Temp)/10; // [0.1kW]
	
	// Byte 2-3 Charge Current limit expressed in KW
	brsmemcpy(ADR(CCL_KW_Temp),ADR(ArCanReceive_0.ReceivedFrame.Data[2]), 2* SIZEOF(ArCanReceive_0.ReceivedFrame.Data[2]));
	gORION.data.CCL_KW := INT_TO_REAL(CCL_KW_Temp)/10; // [0.1kW]
END_ACTION
	

 // CELL VOLTAGES, sent though boradcasting
ACTION msg_orion_010:

	// Broadcasted cell voltages from the orion bms
	checksumGiven 		:= BYTE_TO_USINT(ArCanReceive_0.ReceivedFrame.Data[7]);
	checksumCalculated 	:= RX_ORION_ID_BASE + 16#010 + 8;
	checksumCalculated  := checksumCalculated + BYTE_TO_UDINT(ArCanReceive_0.ReceivedFrame.Data[0]);
	checksumCalculated  := checksumCalculated + BYTE_TO_UDINT(ArCanReceive_0.ReceivedFrame.Data[1]);
	checksumCalculated  := checksumCalculated + BYTE_TO_UDINT(ArCanReceive_0.ReceivedFrame.Data[2]);
	checksumCalculated  := checksumCalculated + BYTE_TO_UDINT(ArCanReceive_0.ReceivedFrame.Data[3]);
	checksumCalculated  := checksumCalculated + BYTE_TO_UDINT(ArCanReceive_0.ReceivedFrame.Data[4]);
	checksumCalculated  := checksumCalculated + BYTE_TO_UDINT(ArCanReceive_0.ReceivedFrame.Data[5]);
	checksumCalculated  := checksumCalculated + BYTE_TO_UDINT(ArCanReceive_0.ReceivedFrame.Data[6]);

	brsmemcpy(ADR(checksumValidate),ADR(checksumCalculated),1);
	
	
	// Checking if checksum is good
	IF checksumGiven = checksumValidate THEN
		checksumCorrect := checksumCorrect +1;
		// The checksum is correct and data is overwritten
		cellId := BYTE_TO_USINT(ArCanReceive_0.ReceivedFrame.Data[0]);
		brsmemcpy(ADR(tempVoltageHigh), ADR(ArCanReceive_0.ReceivedFrame.Data[1]), SIZEOF(ArCanReceive_0.ReceivedFrame.Data[1]));
		brsmemcpy(ADR(tempVoltageLow), ADR(ArCanReceive_0.ReceivedFrame.Data[2]), SIZEOF(ArCanReceive_0.ReceivedFrame.Data[2]));
		tempVoltage := tempVoltageLow + 256 * tempVoltageHigh; 
		gAMS.status.pack.InstantCellVoltage[cellId] := (UINT_TO_REAL(tempVoltage)) / 10000; // recieved data is 2 byte, 0.1mV
		
		
		
		brsmemcpy(ADR(tempVoltageHigh), ADR(ArCanReceive_0.ReceivedFrame.Data[5]), SIZEOF(ArCanReceive_0.ReceivedFrame.Data[5]));
		brsmemcpy(ADR(tempVoltageLow), ADR(ArCanReceive_0.ReceivedFrame.Data[6]), SIZEOF(ArCanReceive_0.ReceivedFrame.Data[6]));
		tempVoltage := tempVoltageLow + 256 * tempVoltageHigh; 
		gAMS.status.pack.cellVoltage[cellId] 		:= (UINT_TO_REAL(tempVoltage)) / 10000; // recieved data is 2 byte, 0.1mV
		
		cellidToBankAndCell;
		gAMS.status.bank[bankId].cellVoltage[bankCellId] := gAMS.status.pack.cellVoltage[cellId];
	END_IF;
	
	
END_ACTION

// CELL TEMPERATURES
ACTION msg_orion_011:
	// Broadcasted cell temperatures from the orion bms
	// Is not currently possible to implement
END_ACTION