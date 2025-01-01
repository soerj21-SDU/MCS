
TYPE
	local_typ : 	STRUCT 
		brdkFileDevUsb : brdkFileDeviceHandler;
		brdkFileDev : brdkFileDeviceHandler;
		lastFileName : STRING[255];
		brdkFileRead : brdkFileRead;
		fileName : STRING[255];
		fileType : STRING[5];
		delayTon : TON;
		setIdx : BOOL;
		stateInfo : STRING[40];
		state : UINT;
	END_STRUCT;
END_TYPE
