
PROGRAM _INIT
	(* Insert code here *)
	gBrdkFileDev_0.enable := FALSE;
	gBrdkFileDev_0.setup.plcDrive := F_DRIVE;
	gBrdkFileDev_0.setup.usbOverrule := TRUE;
	gBrdkFileDev_0.simulation.pcRootFolder := 'Vikings';
	gBrdkFileDev_0.simulation.pcHDDrive := C_DRIVE;
	gBrdkFileDev_0.simulation.pcUSBDrive := D_DRIVE;
	
	
	
	gBrdkFileDev_0.setup.fileDevices[0].name 		:= 'LOG';
	gBrdkFileDev_0.setup.fileDevices[0].path 		:= 'x90log\log';
	gBrdkFileDev_0.setup.fileDevices[1].name 		:= 'TEMP';
	gBrdkFileDev_0.setup.fileDevices[1].path 		:= 'temp';
	
	// gBrdkFileDev_0.setup.fileDevices[0].useUSB		:= TRUE;

	
	this.delayTon.PT := T#2s;
	this.delayTon.IN := FALSE;
	
	this.state := 0;
	
	gBrdkFileDev_0();
END_PROGRAM

PROGRAM _CYCLIC
	
	CASE this.state OF
		0:	
			this.stateInfo := 'Waiting for File Devices to be ready';
			gBrdkFileDev_0.enable := TRUE;
			IF gBrdkFileDev_0.ready THEN
	  			this.state := 100;
			END_IF;
			
			IF gBrdkFileDev_0.status <> 0 THEN
				this.state := 9999;
			END_IF;
		100:
			this.stateInfo := 'All file devices are ready';
			
			IF gBrdkFileDev_0.status <> 0 THEN
				this.state := 9999;
			END_IF;
		9999:
			this.stateInfo := 'error occured';
			// Flicking the enable input of File Dev handler
			IF this.delayTon.Q THEN
				this.delayTon.IN := FALSE;
				gBrdkFileDev_0.enable := NOT gBrdkFileDev_0.enable;
			ELSE
				this.delayTon.IN := TRUE;
			END_IF;
		
			IF gBrdkFileDev_0.ready THEN
	  			this.state := 100;
			END_IF;
			
	END_CASE;
	
	
	// Create file devices 
	gBrdkFileDev_0();

	this.delayTon();
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 gBrdkFileDev_0(enable := FALSE);
END_PROGRAM

