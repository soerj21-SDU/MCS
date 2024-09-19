
TYPE
	gRTDS_typ : 	STRUCT 
		status : gRTDS_status_typ;
		inputs : gRTDS_inputs_typ;
		outputs : gRTDS_outputs_typ;
		cmd : gRTDS_cmd_typ;
		data : gRTDS_data_typ;
	END_STRUCT;
	gRTDS_status_typ : 	STRUCT 
		ok : BOOL;
		RTDS_Off : BOOL;
		RTDS_Disconnected : BOOL;
		RTDS_On : BOOL;
	END_STRUCT;
	gRTDS_data_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
	gRTDS_inputs_typ : 	STRUCT 
		im_RTDS_Current : INT;
	END_STRUCT;
	gRTDS_cmd_typ : 	STRUCT 
		en_RTDS : BOOL;
	END_STRUCT;
	gRTDS_outputs_typ : 	STRUCT 
		do_RTDS : BOOL;
	END_STRUCT;
END_TYPE
