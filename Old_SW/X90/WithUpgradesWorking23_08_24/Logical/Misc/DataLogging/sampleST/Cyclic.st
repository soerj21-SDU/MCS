PROGRAM _INIT

	this.fileName 	:= 'brdkUSB.txt';
	this.fileSource := 'brdkUSB is a great library';
	 
END_PROGRAM

PROGRAM _CYCLIC

	CASE this.state OF

		0:	// wait for connected usb device
			IF this.brdkUSBConnect_0.status = BRDK_USB_STATUS_FB_READY THEN
				// finds the first avaible node
				FOR i := 0 TO BRDK_USB_MAX_DEVICES-1 DO
					IF this.brdkUSBConnect_0.node[i].device <> '' THEN
						this.FileCreate_0.pDevice	:= ADR(this.brdkUSBConnect_0.node[i].device);
						this.state := 10;
					END_IF
				END_FOR

			END_IF

		10:	// wait for command
			IF this.brdkUSBConnect_0.status = BRDK_USB_STATUS_FB_READY THEN
				IF this.cmd.createFile THEN
					this.cmd.createFile 		:= FALSE;
					this.FileCreate_0.enable 	:= TRUE;
					this.FileCreate_0.pFile		:= ADR(this.fileName);
					this.FileCreate_0();
					this.state := 20;
				END_IF
			ELSE
				this.state := 0;
			END_IF

		20:	// wait for file to be created on usb device
			this.FileCreate_0();
			CASE this.FileCreate_0.status OF

				ERR_OK:
					this.FileWrite_0.enable := TRUE;
					this.FileWrite_0.ident 	:= this.FileCreate_0.ident;
					this.FileWrite_0.offset := 0;
					this.FileWrite_0.pSrc 	:= ADR(this.fileSource);
					this.FileWrite_0.len	:= brsstrlen(ADR(this.fileSource));
					this.state 				:= 40;

				fiERR_EXIST:
					this.FileDelete_0.enable 	:= TRUE;
					this.FileDelete_0.pDevice 	:= this.FileCreate_0.pDevice;
					this.FileDelete_0.pName 	:= this.FileCreate_0.pFile;
					this.FileDelete_0();
					this.state 					:= 30;

			END_CASE

		30:	// delete file if it already exists
			this.FileDelete_0();
			CASE this.FileDelete_0.status OF

				ERR_OK,fiERR_FILE_NOT_FOUND:
					this.cmd.createFile := TRUE;
					this.state 			:= 10;

			END_CASE

		40:	// write to file
			this.FileWrite_0();
			CASE this.FileWrite_0.status OF

				ERR_OK:
					this.FileClose_0.enable := TRUE;
					this.FileClose_0.ident 	:= this.FileCreate_0.ident;
					this.FileClose_0();
					this.state := 50;

			END_CASE

		50:	// wait for file to be closed
			this.FileClose_0();
			CASE this.FileClose_0.status OF

				ERR_OK,fiERR_FILE_NOT_OPENED:
					this.state := 10;				

			END_CASE

	END_CASE

	this.brdkUSBConnect_0();

END_PROGRAM
