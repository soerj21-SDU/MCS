
TYPE
	gEventLog_typ : 	STRUCT 
		newEventString : STRING[80];
		logNewEvent : BOOL;
		eventIndex : UINT := 0;
		events : ARRAY[0..EVENT_LOG_LENGTH]OF STRING[80];
		resetEventLog : BOOL;
	END_STRUCT;
END_TYPE
