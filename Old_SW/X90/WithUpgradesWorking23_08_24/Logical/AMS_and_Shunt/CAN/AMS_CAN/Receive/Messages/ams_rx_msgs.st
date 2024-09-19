
ACTION msg_ams_000: 
	// Status

	// AMS State
	gAMS.status.amsState.0 := ArCanReceive_0.ReceivedFrame.Data[0].0;
	gAMS.status.amsState.1 := ArCanReceive_0.ReceivedFrame.Data[0].1;
	gAMS.status.amsState.2 := ArCanReceive_0.ReceivedFrame.Data[0].2;
	gAMS.status.amsState.3 := ArCanReceive_0.ReceivedFrame.Data[0].3;
	gAMS.status.amsState.4 := ArCanReceive_0.ReceivedFrame.Data[0].4;
	
	gAMS.status.scEnabled  		:= (gAMS.status.amsStateName = 'SC_ENABLED') OR (gAMS.status.amsStateName = 'TS_ACTIVE') OR (gAMS.status.amsStateName = 'DRIVE');
	gAMS.status.prechargingDone := (gAMS.status.amsStateName = 'TS_ACTIVE') OR (gAMS.status.amsStateName = 'DRIVE');
	
	// Bank count
	gAMS.status.amsBankCount.0 := ArCanReceive_0.ReceivedFrame.Data[0].5;
	gAMS.status.amsBankCount.1 := ArCanReceive_0.ReceivedFrame.Data[0].6;
	gAMS.status.amsBankCount.2 := ArCanReceive_0.ReceivedFrame.Data[0].7;
	
	// Error signals
	gAMS.status.error.amsError 				:= ArCanReceive_0.ReceivedFrame.Data[1].0;
	gAMS.status.error.imdError 				:= ArCanReceive_0.ReceivedFrame.Data[1].1;
	gAMS.status.error.hvdcInterlockError 	:= ArCanReceive_0.ReceivedFrame.Data[1].2;
	gAMS.status.error.tempWarn 				:= ArCanReceive_0.ReceivedFrame.Data[1].3;
	gAMS.status.error.voltWarn 				:= ArCanReceive_0.ReceivedFrame.Data[1].4;
	gAMS.status.error.precharge 			:= ArCanReceive_0.ReceivedFrame.Data[1].5;
	gAMS.status.error.airMinus 				:= ArCanReceive_0.ReceivedFrame.Data[1].6;
	gAMS.status.error.airPlus 				:= ArCanReceive_0.ReceivedFrame.Data[1].7;
	
	// Data
	// gAMS.data.cellVoltageMin_CAN 	:= BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[2]);
	gAMS.data.cellTempMax 			:= BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[3]);
	gAMS.data.stateOfCharge 		:= BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[4]);
	gAMS.status.Counter				:= BYTE_TO_USINT(ArCanReceive_0.ReceivedFrame.Data[5]);
	gAMS.status.RelayError 			:= BYTE_TO_USINT(ArCanReceive_0.ReceivedFrame.Data[6]);
	
END_ACTION

ACTION msg_ams_011: 
	// Cell voltages
	
	getBankIdAndGroupId;
	
	//	 Group ID
	//	0	Cell [0-6]
	//	1	Cell [7-13]
	//	2 	Cell [14-20]
	//	3 	Cell [21-27]
	gAMS.status.bank[bankId].cellVoltage[groupId*7 + 0] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[1])*0.02;
	gAMS.status.bank[bankId].cellVoltage[groupId*7 + 1] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[2])*0.02;
	gAMS.status.bank[bankId].cellVoltage[groupId*7 + 2] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[3])*0.02;
	gAMS.status.bank[bankId].cellVoltage[groupId*7 + 3] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[4])*0.02;
	gAMS.status.bank[bankId].cellVoltage[groupId*7 + 4] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[5])*0.02;
	gAMS.status.bank[bankId].cellVoltage[groupId*7 + 5] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[6])*0.02;
	gAMS.status.bank[bankId].cellVoltage[groupId*7 + 6] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[7])*0.02;
	
END_ACTION

ACTION msg_ams_012: 
	// Cell temperatures
	
	getBankIdAndGroupId;
	
	// Group Id
	//	0 	Cell [0-4]
	//	1	Cell [5-9]
	gAMS.status.bank[bankId].temperatures[groupId*5 + 0] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[1]);
	gAMS.status.bank[bankId].temperatures[groupId*5 + 1] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[2]);
	gAMS.status.bank[bankId].temperatures[groupId*5 + 2] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[3]);
	gAMS.status.bank[bankId].temperatures[groupId*5 + 3] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[4]);
	gAMS.status.bank[bankId].temperatures[groupId*5 + 4] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[5]); // Changed to 5, was 4 before? May be an error
	
END_ACTION

ACTION msg_ams_013: 
	// Discharge Cell temperatures

	getBankIdAndGroupId;
	
	// Group Id
	//	0 	Cell [0-6]
	//	1	Cell [7-13]
	gAMS.status.bank[bankId].resistorTemperature[groupId*7 + 0] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[1]);
	gAMS.status.bank[bankId].resistorTemperature[groupId*7 + 1] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[2]);
	gAMS.status.bank[bankId].resistorTemperature[groupId*7 + 2] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[3]);
	gAMS.status.bank[bankId].resistorTemperature[groupId*7 + 3] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[4]);
	gAMS.status.bank[bankId].resistorTemperature[groupId*7 + 4] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[4]);
	gAMS.status.bank[bankId].resistorTemperature[groupId*7 + 5] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[4]);
	gAMS.status.bank[bankId].resistorTemperature[groupId*7 + 6] := BYTE_TO_REAL(ArCanReceive_0.ReceivedFrame.Data[4]);
END_ACTION


ACTION msg_ams_014: 
	// Extract first byte which contains the error ID
	errorId := BYTE_TO_USINT(ArCanReceive_0.ReceivedFrame.Data[0]);

	// Reset error timer
	gAMS.status.error.errorTimers[errorId-1](IN := FALSE);	
	gAMS.status.error.errorTimers[errorId-1](IN := TRUE);
	
	//	1  ERROR_AMS_CELL_VOLTAGE_LOW
	//	2  ERROR_AMS_CELL_VOLTAGE_HIGH
	//	3  ERROR_AMS_CELL_TEMP_LOW
	//	4  ERROR_AMS_CELL_TEMP_HIGH
	//	5  ERROR_AMS_LTC6813_COMM
	//	6  ERROR_AMS_SHUNT_COMM
	//	7  ERROR_AMS_UNABLE_TO_OPEN_SC
	//	8  ERROR_AMS_UNABLE_TO_CLOSE_SC
	//	9  ERROR_AMS_UNABLE_TO_OPEN_AIR-
	//	10 ERROR_AMS_UNABLE_TO_CLOSE_AIR-
	//	11 ERROR_AMS_UNABLE_TO_OPEN_AIR+
	//	12 ERROR_AMS_UNABLE_TO_CLOSE_AIR+
	//	13 ERROR_AMS_UNABLE_TO_OPEN_PRE+
	//	14 ERROR_AMS_UNABLE_TO_CLOSE_PRE+
	//	15 ERROR_AMS_PRE_TIMEOUT
	//	16 ERROR_AMS_UNEXPECTED_CHARGE_RATE
	//	17 ERROR_AMS_BANK_COUNT_MISMATCH
	//	18 ERROR_AMS_UNEXSPECPTED_TS_CURRENT
	//	19 ERROR_AMS_RELAY_FAIELD
	//	20 ERROR_AMS_SC_BROKEN
	//	21 AMS_UNFIT_CHARGE_VOLTAGE
	//	22 AMS_MONITOR_ERROR
END_ACTION

