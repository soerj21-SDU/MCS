
TYPE
	bus_typ : 	STRUCT 
		ArCanSetBaudrate_0 : ArCanSetBaudrate;
		ArCanSend_0 : ArCanSend;
		ArCanReceive_0 : ArCanReceive;
		sendMessages : UDINT;
		receivedMessages : UDINT;
		deviceName : STRING[127];
		TON_detectTimer : ARRAY[0..1]OF TON;
		TON_sendTimer : TON;
		communicationState : CAN_STATES;
	END_STRUCT;
END_TYPE
