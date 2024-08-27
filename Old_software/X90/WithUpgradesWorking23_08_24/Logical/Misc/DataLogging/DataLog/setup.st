


ACTION setup: 
	IF this.brdkUSBConnect_0.node[0].device <> '' THEN
		MpRecipeRegPar_csv.MpLink 	:= ADR(gRecipeCsv); 
		MpRecipeRegPar_csv.PVName 	:= ADR('DataLog:gDataLogging.inputs.csvData');
		MpRecipeRegPar_csv.Category	:= ADR('datalogSettings');
		
		MpRecipeCsv_0.MpLink 		:= ADR(gRecipeCsv);
		MpRecipeCsv_0.DeviceName 	:= ADR(this.brdkUSBConnect_0.node[0].device);
		MpRecipeCsv_0.FileName 		:= ADR('log/DatalogSettings');
		MpRecipeCsv_0.Category		:= ADR('datalogSettings');
		
		MpDataRecorder_0.MpLink			:= ADR(gDataRecorder);
		MpDataRecorder_0.DeviceName		:= ADR(this.brdkUSBConnect_0.node[0].device);
		MpDataRecorder_0.RecordMode 	:= mpDATA_RECORD_MODE_TIME;
		MpDataRecorder_0.SamplingTime	:= RTInfo_0.cycle_time / 1000; //micro to milli
	
		
		
		MpDataRecorderConfiguration.DecimalDigits	:= 3;
		MpDataRecorderConfiguration.BufferSize		:= 50000; //kB
		MpDataRecorderConfiguration.PowerFailSafe	:= FALSE;
		MpDataRecorderConfiguration.FileNamePattern	:= 'Datalog_%Y%m%d_%H%M%S.csv';
		MpDataRecorderConfiguration.DecimalMark		:= '.';
		MpDataRecorderConfiguration.AutoSave		:= FALSE;
		
		MpDataRecorderConfig_0.MpLink 				:= ADR(gDataRecorder);
		MpDataRecorderConfig_0.Configuration		:= ADR(MpDataRecorderConfiguration);
		MpDataRecorderConfig_0.Enable 				:= TRUE;
		
		FileInfo_0.pDevice			:= ADR(this.brdkUSBConnect_0.node[0].device);
		FileInfo_0.pName			:= ADR('log/DatalogSettings.csv');
		FileInfo_0.pInfo			:= ADR(this.fileInfoSetting);
		FileInfo_0.enable			:= TRUE;
		
		DirCreate_0.pDevice			:= ADR(this.brdkUSBConnect_0.node[0].device);
		DirCreate_0.pName			:= ADR('log');
		
		this.TON_recordDelay.PT 	:= T#10ms;
		this.maxIdxVariableX 		:= 0;
		this.systemReadyToLog 		:= TRUE;
	END_IF
END_ACTION
