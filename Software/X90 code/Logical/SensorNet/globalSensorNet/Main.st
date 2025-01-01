
PROGRAM _INIT
	(* Device *)
	deviceName 						:= 'IF6.ST1.IF2';
	(* Bus *)
	ArCanSetBaudrate_0.Baudrate 	:= 1000000;
	(* Tramsit *)
	ArCanSend_0.Frame.Format 		:= arCAN_11BIT;
	(* Receive *)
	ArCanReceive_0.Format 			:= arCAN_11BIT;
	ArCanReceive_0.QueueSize		:= 100;
	ArCanReceive_0.IDMask			:= arCAN_RECEIVE_ALL;
	
	communicationState 				:= S_INIT;
	
	
	RX_CAN_ID_BASE 					:= 16#600;
	TX_CAN_ID_BASE 					:= 16#600;
	 
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	(* Send and receive messages *)
	can;
	

	calculateSensorNetOut_0(input := gSensorNet.data.coolingTemp1.input, polyCoeffs := gSensorNet.data.coolingTemp1.polyCoeffs);
	gSensorNet.data.coolingTemp1.value := calculateSensorNetOut_0.output;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

