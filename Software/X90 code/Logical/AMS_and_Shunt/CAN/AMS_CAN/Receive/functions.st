
ACTION getBankIdAndGroupId: 
	// Bank ID
	bankId.2 := ArCanReceive_0.ReceivedFrame.Data[0].7;
	bankId.1 := ArCanReceive_0.ReceivedFrame.Data[0].6;
	bankId.0 := ArCanReceive_0.ReceivedFrame.Data[0].5;
	bankId := bankId - 1;
	
	// Group ID
	groupId.2 := ArCanReceive_0.ReceivedFrame.Data[0].2;
	groupId.1 := ArCanReceive_0.ReceivedFrame.Data[0].1;
	groupId.0 := ArCanReceive_0.ReceivedFrame.Data[0].0;
END_ACTION

ACTION cellidToBankAndCell:
	// COnverting the send cell id from the orion BMS to Bank and specific cell
	bankId := 0;
	bankCellId := cellId;
	FOR i := 0 TO BANK_COUNT - 1 DO
		IF bankCellId >= 36 THEN
			bankCellId := bankCellId - 36;
			bankId := bankId + 1;
		ELSE
			EXIT;
		END_IF;
	END_FOR;

END_ACTION

ACTION appendTemps:

	FOR i:=0 TO (SIZEOF(gAMS.status.bank)/SIZEOF(gAMS.status.bank[0]))-1 DO
		FOR j := 0 TO (SIZEOF(gAMS.status.bank[0].temperatures)/SIZEOF(gAMS.status.bank[0].temperatures[0]))-1 DO
			gAMS.status.bank[i].temperatures[j] := gAMS.data.cellTempMax;
		END_FOR;
	END_FOR;
END_ACTION