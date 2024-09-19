
TYPE
	gDataLogging_typ : 	STRUCT 
		status : gDataLogging_status_typ;
		inputs : gDataLogging_inputs_typ;
		outputs : gDataLogging_outputs_typ;
		data : gDataLogging_data_typ;
	END_STRUCT;
	gDataLogging_status_typ : 	STRUCT 
		dataloggingActive : BOOL;
	END_STRUCT;
	gDataLogging_inputs_typ : 	STRUCT 
		dummy : UINT;
	END_STRUCT;
	gDataLogging_outputs_typ : 	STRUCT 
		dummy : BOOL;
	END_STRUCT;
	gDataLogging_data_typ : 	STRUCT 
		csvData : ARRAY[0..DATALOG_MAX_LOG_VARS]OF STRING[80];
	END_STRUCT;
END_TYPE
