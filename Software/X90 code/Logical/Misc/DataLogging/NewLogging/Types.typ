
TYPE
	local_typ : 	STRUCT 
		stateinfo : STRING[50];
		state : UINT;
		activateLogging : BOOL;
		loggingActive : BOOL := FALSE;
		newFilename : STRING[50] := 'Datalog_%m_%d_%H_%M.csv';
		filename : STRING[50];
		activateLoggingArduino : BOOL := FALSE;
		setFilename : BOOL := FALSE;
	END_STRUCT;
END_TYPE
