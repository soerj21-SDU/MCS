
TYPE
	gFile_input_typ : 	STRUCT 
		refresh : BOOL;
	END_STRUCT;
	gFile_output_typ : 	STRUCT 
		fileDevice : STRING[10];
		ready : BOOL;
	END_STRUCT;
	gFile_typ : 	STRUCT 
		output : gFile_output_typ;
		input : gFile_input_typ;
	END_STRUCT;
END_TYPE
