
TYPE
	brdkusb_sample_st_cmd_typ : 	STRUCT 
		createFile : BOOL;
	END_STRUCT;
	brdkusb_sample_st_interal_typ : 	STRUCT 
		state : UINT;
		brdkUSBConnect_0 : brdkUSBConnect;
		cmd : brdkusb_sample_st_cmd_typ;
		FileCreate_0 : FileCreate;
		FileClose_0 : FileClose;
		FileWrite_0 : FileWrite;
		FileDelete_0 : FileDelete;
		fileName : STRING[80];
		fileSource : STRING[100];
	END_STRUCT;
END_TYPE
