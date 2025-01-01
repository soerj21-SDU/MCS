
PROGRAM _INIT
	(* Devices *)
	bus[0].deviceName := 'IF7';
	bus[1].deviceName := 'IF8';
	
	FOR i := 0 TO 1 DO
		(* Bus *)
		bus[i].ArCanSetBaudrate_0.Baudrate 	:= 500000;
		(* Transmit *)
		bus[i].ArCanSend_0.Frame.Format 	:= arCAN_11BIT;
		
		(* Receive *)
		bus[i].ArCanReceive_0.Format 		:= arCAN_11BIT;
		bus[i].ArCanReceive_0.QueueSize		:= 100;
		bus[i].ArCanReceive_0.IDMask		:= arCAN_RECEIVE_ALL;
		
		bus[i].communicationState := S_INIT;
		

		(* Set timeout for timers and start them*)
		FOR j := 0 TO 1 DO
			bus[i].TON_detectTimer[j].PT := T#100ms;
			bus[i].TON_detectTimer[j].IN := TRUE;
		END_FOR
		
	END_FOR;
	
	RX_CAN_ID_BASE := 16#200;
	TX_CAN_ID_BASE := 16#100;

	// TEMP
	gInverters.status.torqueBasedThrottle := TRUE;
	//bus[0].communicationState := S_IDLE;
	
END_PROGRAM

PROGRAM _CYCLIC
	FOR i := 0 TO 1 DO
		Bus;
	END_FOR;
END_PROGRAM

PROGRAM _EXIT
	
	 
END_PROGRAM

