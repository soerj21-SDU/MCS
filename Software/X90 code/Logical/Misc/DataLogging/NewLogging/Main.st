
PROGRAM _INIT
	this ACCESS ADR(local);
	(* Insert code here *)
	mpDataRecorder_0.MpLink 		:= ADR(gDataRecorderNew);
	mpDataRecorder_0.Enable 		:= FALSE;
	mpDataRecorder_0.SamplingTime := T#20ms; //[ms]
	mpDataRecorder_0.RecordMode	:= mpDATA_RECORD_MODE_TIME;
	
	mpDataRecorderConfig_0.MpLink := ADR(gDataRecorderNew);
	mpDataRecorderConfig_0.Configuration := ADR(mpDataRecorderConfigPar);
	mpDataRecorderConfig_0.Enable := TRUE;
	
	
	setupLog;
END_PROGRAM

PROGRAM _CYCLIC
	this ACCESS ADR(local);
	(* Insert code here *)
	 
	
	
	CASE this.state OF
		0:
			this.stateinfo := 'Waiting for filedevices';
			mpDataRecorder_0.Record := FALSE;
			
			
			IF gBrdkFileDev_0.ready  THEN
				this.state := 1;
			END_IF
			
			
		1: // Activate config load = TRUE
			mpDataRecorderConfig_0.Load := TRUE; 
			
			IF mpDataRecorderConfig_0.CommandDone THEN
				mpDataRecorderConfig_0.Load := FALSE;
				this.state := 10;
			END_IF

		5: //Wait for activate logging command
			
			
		10:
			this.stateinfo := 'Setting up Data Recorder';
			mpDataRecorder_0.DeviceName := ADR('LOG');
			mpDataRecorder_0.Enable	:= TRUE;
			
			IF mpDataRecorder_0.Error THEN
				this.state := 9999;
			ELSIF mpDataRecorder_0.Active THEN
				IF mpDataRecorder_0.Info.RegisteredPVCount = NUM_LOG_VAR THEN	
					this.state := 20;
				ELSE
					this.state := 900;
				END_IF;
			END_IF;
		
		20:
			this.stateinfo := 'Waiting for Enabling in LiveView'; 
			IF (this.activateLogging) THEN 
				mpDataRecorder_0.Record := TRUE;
			ELSIF this.setFilename THEN
				this.state := 200;
				this.setFilename := FALSE;
			END_IF 
			
			IF mpDataRecorder_0.Recording THEN
				this.state := 100;
			ELSIF mpDataRecorder_0.Error THEN
				this.state := 9999;
			END_IF;
			
		100:
			this.stateinfo := 'Data is being recorded';
			
			IF NOT (this.activateLogging) THEN 
				
				mpDataRecorder_0.Record := FALSE; 
				this.state := 0;
			END_IF;
			
			IF mpDataRecorder_0.Error THEN
				this.state := 9999;
			END_IF
		200:
			// change name
			// Set save = true
			IF this.newFilename <> '' THEN
				mpDataRecorderConfigPar.FileNamePattern := this.newFilename;
				this.newFilename := '';
			END_IF;
			
			mpDataRecorderConfig_0.Save := TRUE; 
			
			IF mpDataRecorderConfig_0.CommandDone THEN
				mpDataRecorderConfig_0.Save := FALSE; 
				this.state := 20;
			END_IF
			
		900:
			this.stateinfo := 'Re-Enable mpdatalog';
			mpDataRecorder_0.Record := FALSE;		
			this.state := 10;		
			
			
		9999:
			this.stateinfo := 'ERROR';
		
			mpDataRecorder_0.Record := FALSE;
			mpDataRecorder_0.ErrorReset := TRUE;
		
			IF NOT mpDataRecorder_0.Error THEN
				mpDataRecorder_0.ErrorReset := FALSE;
	  			this.state := 0;
			END_IF;
			
	END_CASE
	
	
	this.loggingActive := mpDataRecorder_0.Recording;
	this.filename := mpDataRecorder_0.Info.CurrentFileName;
	
	mpDataRecorderConfig_0();
	mpDataRecorder_0();
	
	FOR i := 0 TO MAX_LOG_VAR DO
		IF mpDataRegPar_0[i].Active THEN
			mpDataRegPar_0[i](); 
		ELSE 
			EXIT;
		END_IF;	
	END_FOR;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	mpDataRecorder_0(Enable := FALSE);
	
END_PROGRAM

