(* Action to pick out data for each variable from the received INS data *)
ACTION extractInsData:
	
	// Byte 0-5: Header
	
	
	// Data
	
	// 6 - 9: AccX
	memcpy(ADR(gINS.input.accX), ADR(Receiver.receive_data)+6,4);
	// 10-13: AccY
	memcpy(ADR(gINS.input.accY), ADR(Receiver.receive_data)+10,4);
	// 14-17: AccZ
	memcpy(ADR(gINS.input.accZ), ADR(Receiver.receive_data)+14,4);
	
	// 18-21: GyroX
	memcpy(ADR(gINS.input.gyroX), ADR(Receiver.receive_data)+18,4);
	// 22-25: GyroY
	memcpy(ADR(gINS.input.gyroY), ADR(Receiver.receive_data)+22,4);
	// 26-29: GyroZ
	memcpy(ADR(gINS.input.gyroZ), ADR(Receiver.receive_data)+26,4);
	
	// 30-33: VelX
	memcpy(ADR(gINS.input.velX), ADR(Receiver.receive_data)+30,4);
	// 34-37: VelY
	memcpy(ADR(gINS.input.velY), ADR(Receiver.receive_data)+34,4);
	// 38-41: VelZ
	memcpy(ADR(gINS.input.velZ), ADR(Receiver.receive_data)+38,4);

	// 42-42: Checksum / CRC
	
	
END_ACTION
