
ACTION logEvent: 

	gEventLog.events[gEventLog.eventIndex] := gEventLog.newEventString;
	
	gEventLog.eventIndex 				   := gEventLog.eventIndex + 1;
	IF gEventLog.eventIndex > EVENT_LOG_LENGTH THEN
		gEventLog.eventIndex := 0;	
	END_IF;
	
	gEventLog.events[gEventLog.eventIndex] := '';
	
END_ACTION

ACTION resetEventLog:
	
	FOR gEventLog.eventIndex := 0 TO EVENT_LOG_LENGTH DO
		gEventLog.events[gEventLog.eventIndex] := '';
	END_FOR;
	gEventLog.eventIndex := 0;

END_ACTION