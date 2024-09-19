
TYPE
	this_typ : 	STRUCT 
		state : UINT;
		tmpStr : STRING[80];
		idxStr : STRING[10];
		strIdxPos : DINT;
		csvData : ARRAY[0..DATALOG_MAX_LOG_VARS]OF STRING[200];
		fileInfoSetting : fiFILE_INFO;
		DTGetTime_0 : DTGetTime;
		header : MpRecipeXmlHeaderType;
		MpDataRegPar : ARRAY[0..DATALOG_MAX_MAPP_VARS]OF MpDataRegPar;
		timestamp : this_timestamp_typ;
		pvData : ARRAY[0..DATALOG_MAX_LOG_VARS]OF this_pvdata_typ;
		pvRegData : ARRAY[0..DATALOG_MAX_MAPP_VARS]OF this_pvRegData_typ;
		okToRestart : BOOL;
		TON_errorReset : TON;
		TON_recordDelay : TON;
		systemReadyToLog : BOOL;
		maxIdxVariableX : USINT;
		brdkUSBConnect_0 : brdkUSBConnect;
		FileCreate_0 : FileCreate;
	END_STRUCT;
	this_timestamp_typ : 	STRUCT 
		str : STRING[64];
		old : DATE_AND_TIME;
	END_STRUCT;
	this_pvdata_typ : 	STRUCT 
		variable : STRING[200];
		enableVar : STRING[200];
	END_STRUCT;
	this_pvRegData_typ : 	STRUCT 
		variable : STRING[100];
		enableVar : STRING[100];
		enable : BOOL;
		address : UDINT;
		datalength : UDINT;
	END_STRUCT;
END_TYPE
