
PROGRAM _INIT

	RTInfo_0(enable := TRUE);
	initSetup;

END_PROGRAM

PROGRAM _CYCLIC
	// call actions
	// setup;
	setupFile;
	
	//detect if config.enable is changed then restart datalog
	FOR i:=0 TO DATALOG_MAX_MAPP_VARS DO
		IF this.okToRestart AND this.pvRegData[i].variable <> '' THEN
			IF this.pvRegData[i].address <> 0 AND this.pvRegData[i].datalength = 1 THEN
				pBool ACCESS this.pvRegData[i].address;
				IF pBool <> this.pvRegData[i].enable THEN
					this.state := 0; //restart
				END_IF
			END_IF
		ELSE EXIT;
		END_IF
	END_FOR
	
	//if file is changed then restart datalog
	FileInfo_0();
	IF this.okToRestart AND this.timestamp.old <> this.fileInfoSetting.modTime THEN
		this.state := 0; //restart
	END_IF
	
	CASE this.state OF
		0:	// wait for connected usb device
			IF gBrdkFileDev_0.description = 'all file devices are ready to use' THEN
				// finds the first available node
				FOR i := 1 TO BRDK_USB_MAX_DEVICES-1 DO
					IF gBrdkFileDev_0.availableDevices[i] <> '' THEN
						this.FileCreate_0.pDevice	:= ADR(gBrdkFileDev_0.availableDevices[i]);
						this.state := 5;
					END_IF
				END_FOR
			END_IF
		
		5: //create log folder
			this.okToRestart := FALSE;
			this.timestamp.old := this.fileInfoSetting.modTime;
			MpDataRecorder_0.Enable := FALSE;
			DirCreate_0.enable := TRUE;
			IF DirCreate_0.status = fiERR_DIR_ALREADY_EXIST THEN
				DirCreate_0.enable := FALSE;
				this.state := 10;
			END_IF
			DirCreate_0();
		
		10:
			MpRecipeRegPar_csv.Enable := TRUE;
			IF MpRecipeRegPar_csv.Active THEN
				this.state := 20;
			ELSIF MpRecipeRegPar_csv.Error THEN
				this.state := 65000;
			END_IF
			
		20:
			MpRecipeCsv_0.Enable := TRUE;
			IF MpRecipeCsv_0.Active THEN
				this.state := 30;
			ELSIF MpRecipeCsv_0.Error THEN
				this.state := 65000;
			END_IF
		
		30: //DatalogSettings.csv ok?
			IF FileInfo_0.status = ERR_OK THEN
				this.state := 40;
			ELSIF FileInfo_0.status = fiERR_FILE_NOT_FOUND THEN
				this.state := 300;
			ELSIF FileInfo_0.status = ERR_FUB_BUSY THEN
			ELSE
				this.state := 65000;
			END_IF	
			
		40:
			MpRecipeCsv_0.Load := TRUE;
			IF MpRecipeCsv_0.CommandDone THEN
				MpRecipeCsv_0.Load := FALSE;
				this.state := 45;
			ELSIF MpRecipeCsv_0.Error THEN
				this.state := 65000;
			END_IF
			
		45:
			MpDataRecorder_0.Enable := TRUE;
			IF MpDataRecorder_0.Active THEN
				this.state := 50;
			ELSIF MpDataRecorder_0.Error THEN
				this.state := 65000;
			END_IF

		50://find logVar#logVarEnable and split it
			brsmemset(ADR(this.pvRegData), 0, SIZEOF(this.pvRegData));
			brsmemset(ADR(this.pvData), 0, SIZEOF(this.pvData));
			FOR i:=0 TO DATALOG_MAX_LOG_VARS DO
				IF gDataLogging.data.csvData[i] <> '' THEN
					this.strIdxPos := brdkStrSearch(ADR(gDataLogging.data.csvData[i]),ADR('#'));
					IF this.strIdxPos > 0 THEN //enable/disable variable found
						this.pvData[i].variable 	:= gDataLogging.data.csvData[i];
						this.pvData[i].enableVar 	:= gDataLogging.data.csvData[i];
						brdkStrSlice(ADR(this.pvData[i].variable), 0, this.strIdxPos);
						brdkStrSlice(ADR(this.pvData[i].enableVar), this.strIdxPos+1, SIZEOF(this.pvData[i].enableVar));
					ELSE
						this.pvData[i].variable := gDataLogging.data.csvData[i];
					END_IF
				ELSE EXIT;
				END_IF
			END_FOR
			this.state := 60;
			
		60://find and replace [x]. to [0..this.maxIdxVariableX]
			noOfPvVars := 0;
			FOR i:=0 TO DATALOG_MAX_LOG_VARS DO
				IF gDataLogging.data.csvData[i] <> '' THEN
					this.strIdxPos := brdkStrSearch(ADR(this.pvData[i].variable), ADR('[x]'));
				 	IF this.strIdxPos > 0 THEN
				 		FOR j:=0 TO this.maxIdxVariableX DO
							this.tmpStr := '[x]';
							brsitoa(j, ADR(this.idxStr));
							brdkStrReplace(ADR(this.tmpStr), ADR('x'), ADR(this.idxStr));
							this.pvRegData[noOfPvVars].variable 	:= this.pvData[i].variable;
							this.pvRegData[noOfPvVars].enableVar 	:= this.pvData[i].enableVar;
							brdkStrReplace(ADR(this.pvRegData[noOfPvVars].variable), ADR('[x]'), ADR(this.tmpStr));
							brdkStrReplace(ADR(this.pvRegData[noOfPvVars].enableVar), ADR('[x]'), ADR(this.tmpStr));
							PV_xgetadr(ADR(this.pvRegData[noOfPvVars].enableVar), ADR(this.pvRegData[noOfPvVars].address), ADR(this.pvRegData[noOfPvVars].datalength));
							noOfPvVars := noOfPvVars + 1;
						END_FOR
					ELSE
						this.pvRegData[noOfPvVars].variable 	:= this.pvData[i].variable;
						this.pvRegData[noOfPvVars].enableVar 	:= this.pvData[i].enableVar;
						PV_xgetadr(ADR(this.pvRegData[noOfPvVars].enableVar), ADR(this.pvRegData[noOfPvVars].address), ADR(this.pvRegData[noOfPvVars].datalength));
						noOfPvVars := noOfPvVars + 1;
				 	END_IF
				ELSE EXIT;
				END_IF
			END_FOR
			this.state := 65;
		
		65: //clear all reg pars before init again
			FOR i:=0 TO DATALOG_MAX_MAPP_VARS DO
				this.MpDataRegPar[i].Enable := FALSE;
			END_FOR
			this.state := 70;
		
		70: //registre pv's
			FOR i:=0 TO DATALOG_MAX_MAPP_VARS DO
				IF this.pvRegData[i].variable <> '' THEN
					this.MpDataRegPar[i].MpLink 		:= ADR(gDataRecorder);
					this.MpDataRegPar[i].Description 	:= ADR(this.pvRegData[i].variable);
					this.MpDataRegPar[i].PVName			:= ADR(this.pvRegData[i].variable);
					IF this.pvRegData[i].address <> 0 AND this.pvRegData[i].datalength = 1 THEN
						pBool ACCESS this.pvRegData[i].address;
						this.pvRegData[i].enable := pBool;
					ELSE
						this.pvRegData[i].enable := TRUE;
					END_IF
					this.MpDataRegPar[i].Enable	:= this.pvRegData[i].enable;
				ELSE EXIT;
				END_IF
			END_FOR
			this.okToRestart := TRUE;
			this.state := 80;

		80: //wait for system up and running
			IF this.systemReadyToLog THEN
				MpDataRecorder_0.Enable := TRUE;
				this.state := 85;
			END_IF

		85: //active
			IF MpDataRecorder_0.Active THEN
				this.TON_recordDelay.IN := TRUE;
				this.state := 90;
			ELSIF MpDataRecorder_0.Error THEN
				this.state := 65000;
			END_IF
		
		90: //delay before start recording
			IF this.TON_recordDelay.Q THEN
				this.TON_recordDelay.IN := FALSE;
				MpDataRecorder_0.Record := TRUE;
				this.state := 100;
			END_IF
			
		100: //ready
			gDataLogging.status.dataloggingActive := TRUE;
			IF gCreateLogFile THEN
				this.okToRestart := FALSE;
				MpDataRecorder_0.SnapShot := TRUE;
				this.state := 110;
			ELSIF NOT MpDataRecorder_0.Enable THEN // restart after download
				gCreateLogFile := FALSE;
				this.state := 0;
			ELSIF MpDataRecorder_0.Error THEN
				gCreateLogFile := FALSE;
				this.state := 65000;
			END_IF
			

			IF MpDataRecorder_0.Info.CurrentFileSize > 900 THEN
				this.state := 5;
			END_IF
			
	
		110: //waiting for datalog file created
			IF MpDataRecorder_0.SnapShotDone THEN
				MpDataRecorder_0.SnapShot 	:= FALSE;
				gCreateLogFile 				:= FALSE;
				this.state 					:= 100;
			ELSIF MpDataRecorder_0.Error THEN
				MpDataRecorder_0.ErrorReset	:= TRUE;
				MpDataRecorder_0.SnapShot 	:= FALSE;
				gCreateLogFile 				:= FALSE;
				this.state 					:= 65000;
			END_IF
		
		300: //create DatalogSettings.csv
			MpRecipeCsv_0.Save := TRUE;
			IF MpRecipeCsv_0.CommandDone THEN
				MpRecipeCsv_0.Save := FALSE;
				this.state := 0;
			ELSIF MpRecipeCsv_0.Error THEN
				this.state := 65000;
			END_IF
				
		65000://ERROR HANDLING = NONE :/
			this.TON_errorReset.IN	:= TRUE;
			IF this.TON_errorReset.Q THEN
				this.TON_errorReset.IN		:= FALSE;
				MpDataRecorder_0.Enable 	:= FALSE;
				MpRecipeRegPar_csv.Enable 	:= FALSE;
				MpRecipeCsv_0.Enable		:= FALSE;
				FileInfo_0.enable			:= FALSE;
				this.state					:= 0;
			END_IF
			
	END_CASE
	
	// Function Block Calls
	this.TON_errorReset(PT := T#10s);
	
	IF this.state <> 100 OR this.brdkUSBConnect_0.status <> BRDK_USB_STATUS_FB_READY THEN
		gDataLogging.status.dataloggingActive := FALSE;	
	END_IF
	

	this.TON_recordDelay();
	IF MpDataRecorder_0.Active THEN
		FOR i:=0 TO DATALOG_MAX_MAPP_VARS DO
			this.MpDataRegPar[i]();
		END_FOR
	END_IF
	MpDataRecorderConfig_0();
	MpDataRecorder_0();
	MpRecipeRegPar_csv();
	MpRecipeCsv_0();
	this.brdkUSBConnect_0();

END_PROGRAM

PROGRAM _EXIT
	// Disable Mapp Function Blocks
	MpDataRecorder_0(Enable := FALSE);
	MpDataRecorderConfig_0(Enable := FALSE);
	MpRecipeCsv_0(Enable := FALSE);
	MpRecipeRegPar_csv(Enable := FALSE);
END_PROGRAM