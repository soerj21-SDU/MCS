
ACTION convertData:
	// Takes in data in big endian and converts it to data in litte endian (which is used by the PLC)
	// Switch endian
	dataArr[3] := ArCanReceive_0.ReceivedFrame.Data[2];
	dataArr[2] := ArCanReceive_0.ReceivedFrame.Data[3];
	dataArr[1] := ArCanReceive_0.ReceivedFrame.Data[4];
	dataArr[0] := ArCanReceive_0.ReceivedFrame.Data[5];
	// Extract data from array
	memcpy(ADR(data), ADR(dataArr),4);
END_ACTION
