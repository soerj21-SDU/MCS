#include <brdkFile_func.h>

#define BR_TG_VENDOR_ID 1615
#define BR_TG_PRODUCT_ID 1001

void brdkFileDeviceHandler(struct brdkFileDeviceHandler* inst) {
	brdk_file_dev_handler_int_typ* this 	= (brdk_file_dev_handler_int_typ*)&inst->internal;		/* pointer to the internal structure */
	brdk_file_dev_handler_setup_typ* setup 	= (brdk_file_dev_handler_setup_typ*)&inst->setup;		/* pointer to the setup structure */
	brdk_file_dev_handler_sim_typ* sim 		= (brdk_file_dev_handler_sim_typ*)&inst->simulation;	/* pointer to the simulation structure */
	char tmpStr[200];
	
	if(inst->enable) {

		/* check whether the controller is beeing simulated and watch the usb status */
		if(!DiagCpuIsSimulated()) {
			if(!this->UsbNodeGet_0.enable) this->UsbNodeListGet_0.enable = true;
			this->UsbNodeListGet_0.pBuffer					= (unsigned long)&this->nodeId;
			this->UsbNodeListGet_0.bufferSize 				= sizeof(this->nodeId);
			this->UsbNodeListGet_0.filterInterfaceClass 	= asusb_CLASS_MASS_STORAGE;
			this->UsbNodeListGet_0.filterInterfaceSubClass 	= asusb_SUBCLASS_SCSI_COMMAND_SET;
			UsbNodeListGet(&this->UsbNodeListGet_0);
			if(this->UsbNodeListGet_0.status == asusbERR_USB_NOTFOUND) {
				this->nodeIdx 	= 0;
				this->usbOK 	= false;
			}
		
			this->UsbNodeGet_0.enable 		= true;
			this->UsbNodeGet_0.nodeId 		= this->nodeId[this->nodeIdx];
			this->UsbNodeGet_0.pBuffer 		= (unsigned long)&this->usbNode;
			this->UsbNodeGet_0.bufferSize 	= sizeof(this->usbNode);
			UsbNodeGet(&this->UsbNodeGet_0);
			if(this->UsbNodeGet_0.status == ERR_OK) {
				if(this->usbNode.vendorId == BR_TG_VENDOR_ID && this->usbNode.productId == BR_TG_PRODUCT_ID) {
					this->UsbNodeGet_0.enable = false;
					UsbNodeGet(&this->UsbNodeGet_0);
					this->nodeIdx++;
				}
				else this->usbOK = true;
			}
			else if(this->UsbNodeGet_0.status == asusbERR_USB_NOTFOUND) {
				this->UsbNodeListGet_0.enable = true;	
				this->nodeIdx = 0;		
				this->usbOK = false;
			}
			if(this->oldNodeId != this->UsbNodeGet_0.nodeId) this->usbOK = false;
			this->oldNodeId = this->UsbNodeGet_0.nodeId;
		}
		else {
			/* look for USB root folder */
			if(this->DirInfo_0.pDevice != 0) {
				this->DirInfo_0.enable 	= true;
				this->DirInfo_0.pPath 	= (unsigned long)"";
				DirInfo(&this->DirInfo_0);
				switch(this->DirInfo_0.status) {
					case 0: this->usbOK = true; break;
					case 20723: this->usbOK = false; break;
					default: break;
				}
			}
		}
		if(setup->usbOverrule) inst->useUSB = this->usbOK;	/* USB stick will overrule */
	}
	else {
		this->usbOK 					= false;
		this->nodeIdx 					= 0;
		this->DirInfo_0.enable 			= false;
		DirInfo(&this->DirInfo_0);
		this->UsbNodeGet_0.enable 		= false;
		UsbNodeGet(&this->UsbNodeGet_0);
		this->UsbNodeListGet_0.enable 	= false;
		UsbNodeListGet(&this->UsbNodeListGet_0);
	}

	/* drive handler */
	switch(this->driveState) {

		case 0:
			if(inst->enable) {
				if(!DiagCpuIsSimulated()) {										// If the plc is not simulated
					if((inst->useUSB && this->usbOK) || !inst->useUSB) {
						this->driveReady = true;
						if(!inst->useUSB)getDrive(setup->plcDrive,this->drive);
						else brdkStrCpy((unsigned long)this->drive,(unsigned long)this->usbNode.ifName);						
						getDrive(setup->plcDrive,this->driveInternal);
						this->driveState = 499;
					}
				}
				else {															// If the plc is simulated
					this->DevLink_0.enable 	= true;
					this->DevLink_0.pDevice = (unsigned long)"INTUSB";
					this->DevLink_0.pParam 	= buildParameterString(getDrive(sim->pcUSBDrive,this->drive),(char*)&"",(char*)&this->deviceParam);
					brdkStrCpy((unsigned long)this->driveInternal, (unsigned long) this->drive);
					this->driveState 		= 100;
				}
			}
			break;

		case 100:	/* create a file device for finding an attached usb flash */
			DevLink(&this->DevLink_0);
			if(this->DevLink_0.status != ERR_FUB_BUSY) {
				if(this->DevLink_0.status == ERR_OK || this->DevLink_0.status == fiERR_DEVICE_ALREADY_EXIST) {
					this->DirInfo_0.pDevice = this->DevLink_0.pDevice;
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					this->driveState 		= 110;
				}
				else {
					inst->status = this->DevLink_0.status;
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DevLink. Flip enable to reset fb.");
					this->driveState = 900;
				}
			}
			break;

		case 110:	/* wait for DirInfo to have been call once. Fb is call above */
			switch(this->DirInfo_0.status) {

				case 0: case 20723:
					if(!inst->useUSB) {
						getDrive(sim->pcHDDrive,this->drive);
						brdkStrCat((unsigned long)this->drive,(unsigned long)sim->pcRootFolder);
					}
					else getDrive(sim->pcUSBDrive,this->drive);
					getDrive(sim->pcHDDrive,this->driveInternal);
					brdkStrCat((unsigned long)this->driveInternal,(unsigned long)sim->pcRootFolder);
	
					this->driveState = 499;
					this->driveReady = true;
					break;

				case 65534: case 65535: break;

				default:
					inst->status 			= this->DirInfo_0.status;
					this->DirInfo_0.enable 	= false;
					DirInfo(&this->DirInfo_0);
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DirInfo. Flip enable to reset fb.");
					this->driveReady = false;
					this->driveState = 900;
					break;
			}
			break;

		case 499:	/* waiting for file devices to be ready */
			if(!inst->enable) {
				this->driveReady = false;
				this->driveState = 900;
			}
			else if(inst->ready) this->driveState = 500;
			break;

		case 500:	/* check if USB status changes */
			if(!inst->enable) {
				this->driveReady = false;
				this->driveState = 900;
			}
			else if((this->oldUseUSB != inst->useUSB) || (inst->useUSB && (this->oldUSBok != this->usbOK))) {	/* usb must be used and the ok status has changed */	
				this->driveReady = false;
				if(inst->useUSB && !this->usbOK) brdkStrCpy((unsigned long)inst->description,(unsigned long)"USB not ready. Turn off useUSB command.");	
				else this->driveState = 510;
			}
			this->oldUseUSB = inst->useUSB;
			this->oldUSBok 	= this->usbOK;
			this->oldNodeId = this->UsbNodeGet_0.nodeId;
			break;

		case 510:	/* select the new drive */
			if(!DiagCpuIsSimulated()) {																// check if the controller is simulated
				if(!inst->useUSB)getDrive(setup->plcDrive,this->drive);
				else brdkStrCpy((unsigned long)this->drive,(unsigned long)this->usbNode.ifName);	// If useUSB set drive to new usb 
				getDrive(setup->plcDrive,this->driveInternal);
			}
			else {
				if(!inst->useUSB) {
					getDrive(sim->pcHDDrive,this->drive);											// Get internal drive
					brdkStrCat((unsigned long)this->drive,(unsigned long)sim->pcRootFolder);		// Add folder name
				}
				else getDrive(sim->pcUSBDrive,this->drive);											// If useUSB and its a simulated PLC set drive to pcUSBDrive
				getDrive(sim->pcHDDrive,this->driveInternal);											// Get internal drive
				brdkStrCat((unsigned long)this->driveInternal,(unsigned long)sim->pcRootFolder);		// Add folder name
			}
			this->driveReady = true;
			this->driveState = 499;
			break;

		case 900:	/* error state */
			this->driveReady = false;
			if(!inst->enable) {
				inst->status 		= 0;
				this->driveState 	= 0;
			}
			break;

	}

	/* file device handler */
	switch(this->fileState) {
		
		case 0: /* wait for a drive */
			if(inst->enable) {
				if(this->driveReady) {
					this->DevLink_0.enable 	= true;
					this->DevLink_0.pDevice = (unsigned long)"ROOT";
					this->DevLink_0.pParam 	= buildParameterString((char*)&this->drive,(char*)&"",(char*)&this->deviceParam);
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"creates a devlink for the drive root");
					this->fileState 		= 10;
				}
			}
			else {
				inst->ready = false;
			}	
			break;

		case 10: /* Create drive for root */
			DevLink(&this->DevLink_0);
			if(this->DevLink_0.status != ERR_FUB_BUSY) {
				if(this->DevLink_0.status == ERR_OK) {
					brdkStrCpy((unsigned long)inst->availableDevices[0],this->DevLink_0.pDevice);
					this->activeHandles[0] = this->DevLink_0.handle;
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					this->fileIdx = 0;
					if(setup->fileDevices[this->fileIdx].name[0] != 0) {
						if(!this->usbOK || (this->usbOK && setup->fileDevices[this->fileIdx].useUSB && inst->useUSB)) this->brdkFileCreateSubFolders_0.enable = true;
						else this->brdkFileCreateSubFolders_0.enable = false;
						brdkStrCpy((unsigned long)this->brdkFileCreateSubFolders_0.path,(unsigned long)setup->fileDevices[this->fileIdx].path);
						brdkStrCpy((unsigned long)this->brdkFileCreateSubFolders_0.fileDevice,this->DevLink_0.pDevice);
						brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
						brdkStrCpy((unsigned long)inst->description,(unsigned long)"creates the needed folders");
						this->fileState = 20;
					}
					else this->fileState = 80;
				}
				else if(this->DevLink_0.status == fiERR_DEVICE_ALREADY_EXIST) {
					if(this->DevLink_0.handle != 0) {
						inst->status = this->DevLink_0.status;
						this->DevLink_0.enable 	= false;
						DevLink(&this->DevLink_0);
						brdkStrCpy((unsigned long)inst->description,(unsigned long)"Device ");
						brdkStrCat((unsigned long)inst->description,this->DevLink_0.pDevice);
						brdkStrCat((unsigned long)inst->description,(unsigned long)" already exists. Reboot controller to kill the old device.");	
						this->fileState = 900;
					}
					else {
						this->DevUnlink_0.enable = true;
						this->DevUnlink_0.handle = this->DevLink_0.handle;
						this->DevLink_0.enable 	= false;
						DevLink(&this->DevLink_0);
						this->fileState = 60;
					}
				} 
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DevLink. Flip enable to reset fb.");			
					inst->status 			= this->DevLink_0.status;
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					this->fileState 		= 900;
				}
			}
			break;

		case 20: /* Create the needed folders */
			brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
			if(this->brdkFileCreateSubFolders_0.done || !this->brdkFileCreateSubFolders_0.enable) {
				this->brdkFileCreateSubFolders_0.enable = false;
				brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
				this->fileIdx++;
				if(setup->fileDevices[this->fileIdx].name[0] != 0 && setup->fileDevices[this->fileIdx].path[0] != 0) {
					if(!this->usbOK || (this->usbOK && setup->fileDevices[this->fileIdx].useUSB && inst->useUSB)){
						this->brdkFileCreateSubFolders_0.enable = true;	
						brdkStrCpy((unsigned long)this->brdkFileCreateSubFolders_0.path,(unsigned long)setup->fileDevices[this->fileIdx].path);
						brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);		
					}	
				}
				else {
					if(this->usbOK){
						// USB device present => Create folders and device internally
						this->fileIdx = 0;
						this->DevLink_0.enable 	= true;
						this->DevLink_0.pDevice = (unsigned long)"INTERNAL_ROOT";
						this->DevLink_0.pParam 	= buildParameterString((char*)&this->driveInternal,(char*)&"",(char*)&this->deviceParam);
						brdkStrCpy((unsigned long)inst->description,(unsigned long)"creates a devlink for the drive internal");
						this->fileState = 30;
					}else{
						// No USB device present =>  Change device to ROOT device (internally)
						this->internalRootHandle = this->activeHandles[0];
						this->fileIdx = 0;
						this->DevLink_0.enable 	= true;
						this->DevLink_0.pDevice = (unsigned long)setup->fileDevices[this->fileIdx].name;
						this->DevLink_0.pParam 	= buildParameterString((char*)&this->drive,(char*)&setup->fileDevices[this->fileIdx].path,(char*)&this->deviceParam);				
						this->fileState = 50;
					}
				}
			}

			else if(this->brdkFileCreateSubFolders_0.status == fiERR_FILE_DEVICE) {
				if(DiagCpuIsSimulated()) {
					this->DevUnlink_0.enable 	= true;
					this->DevUnlink_0.handle 	= this->activeHandles[0];
					this->activeHandles[0] 		= 0;
					DevUnlink(&this->DevUnlink_0);
					this->brdkFileCreateSubFolders_0.enable = false;
					brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
					this->fileState 			= 200;
				}
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling brdkFileCreateSubFolders. Flip enable to reset fb.");			
					inst->status 				= this->brdkFileCreateSubFolders_0.status;
					this->brdkFileCreateSubFolders_0.enable = false;
					brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
					this->fileState 			= 900;	
				}
			}
			else if(this->brdkFileCreateSubFolders_0.status != ERR_FUB_BUSY) brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling brdkFileCreateSubFolders. Check fb for error codes.");
	
			break;

		case 30: /* Create devices internally */
			DevLink(&this->DevLink_0);
			if(this->DevLink_0.status != ERR_FUB_BUSY) {
				if(this->DevLink_0.status == ERR_OK) {
					this->internalRootHandle = this->DevLink_0.handle;
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					brdkStrCpy((unsigned long)this->brdkFileCreateSubFolders_0.path,(unsigned long)setup->fileDevices[this->fileIdx].path);
					brdkStrCpy((unsigned long)this->brdkFileCreateSubFolders_0.fileDevice,this->DevLink_0.pDevice);
					this->brdkFileCreateSubFolders_0.enable = true;
					brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"creates the needed folders internally");
					this->fileState = 40;
				}
				else if(this->DevLink_0.status == fiERR_DEVICE_ALREADY_EXIST) {
					if(this->DevLink_0.handle != 0) {
						inst->status = this->DevLink_0.status;
						this->DevLink_0.enable 	= false;
						DevLink(&this->DevLink_0);
						brdkStrCpy((unsigned long)inst->description,(unsigned long)"Device ");
						brdkStrCat((unsigned long)inst->description,this->DevLink_0.pDevice);
						brdkStrCat((unsigned long)inst->description,(unsigned long)" already exists. Reboot controller to kill the old device.");	
						this->fileState = 900;
					}
					else {
						this->DevUnlink_0.enable = true;
						this->DevUnlink_0.handle = this->DevLink_0.handle;
						this->DevLink_0.enable 	= false;
						DevLink(&this->DevLink_0);
						this->fileState = 70;
					}
				} 
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DevLink. Flip enable to reset fb.");			
					inst->status 			= this->DevLink_0.status;
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					this->fileState 		= 900;
				}
			}
			break;
		
		case 40: /* Create folders internally */
			brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
			if(this->brdkFileCreateSubFolders_0.done || !this->brdkFileCreateSubFolders_0.enable) {
				this->brdkFileCreateSubFolders_0.enable = false;
				brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
				this->fileIdx++;
				if(setup->fileDevices[this->fileIdx].name[0] != 0 && setup->fileDevices[this->fileIdx].path[0] != 0) {
					if(!setup->fileDevices[this->fileIdx].useUSB && inst->useUSB){
						this->brdkFileCreateSubFolders_0.enable = true;	
						brdkStrCpy((unsigned long)this->brdkFileCreateSubFolders_0.path,(unsigned long)setup->fileDevices[this->fileIdx].path);
						brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);		
					}	
				}
				else {
					this->fileIdx = 0;
					this->DevLink_0.enable 	= true;
					this->DevLink_0.pDevice = (unsigned long)setup->fileDevices[this->fileIdx].name;
					this->DevLink_0.pParam 	= buildParameterString((char*)&this->drive,(char*)&setup->fileDevices[this->fileIdx].path,(char*)&this->deviceParam);				
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"creates the needed file devices");
					this->fileState = 50;
				}
			}

			else if(this->brdkFileCreateSubFolders_0.status == fiERR_FILE_DEVICE) {
				if(DiagCpuIsSimulated()) {
					this->DevUnlink_0.enable 	= true;
					this->DevUnlink_0.handle 	= this->activeHandles[0];
					this->activeHandles[0] 		= 0;
					DevUnlink(&this->DevUnlink_0);
					this->brdkFileCreateSubFolders_0.enable = false;
					brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
					this->fileState 			= 200;
				}
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling brdkFileCreateSubFolders. Flip enable to reset fb.");			
					inst->status 				= this->brdkFileCreateSubFolders_0.status;
					this->brdkFileCreateSubFolders_0.enable = false;
					brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
					this->fileState 			= 900;	
				}
			}
			else if(this->brdkFileCreateSubFolders_0.status != ERR_FUB_BUSY) brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling brdkFileCreateSubFolders. Check fb for error codes.");
	
			break;
		
		case 50: /* Create USB devices */
			DevLink(&this->DevLink_0);
			if(this->DevLink_0.status != ERR_FUB_BUSY) {
				if(this->DevLink_0.status == ERR_OK) {
					this->activeHandles[this->fileIdx+1] = this->DevLink_0.handle;
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					this->fileIdx++;
					if(setup->fileDevices[this->fileIdx].name[0] != 0 && setup->fileDevices[this->fileIdx].path[0] != 0) {
						this->DevLink_0.enable 	= true;
						this->DevLink_0.pDevice = (unsigned long)setup->fileDevices[this->fileIdx].name;
						if(setup->fileDevices[this->fileIdx].useUSB) this->DevLink_0.pParam 	= buildParameterString((char*)&this->drive,(char*)&setup->fileDevices[this->fileIdx].path,(char*)&this->deviceParam);					
						else{
							if(!DiagCpuIsSimulated()) getDrive(setup->plcDrive,this->driveInternal);
							else {
								getDrive(sim->pcHDDrive,this->driveInternal);
								brdkStrCat((unsigned long)this->driveInternal,(unsigned long)sim->pcRootFolder);
							}
							this->DevLink_0.pParam 	= buildParameterString((char*)&this->driveInternal,(char*)&setup->fileDevices[this->fileIdx].path,(char*)&this->deviceParam);					
						}
					}
					else {
						inst->ready = true;
						brdkStrCpy((unsigned long)inst->description,(unsigned long)"all file devices are ready to use");
						this->fileState = 80;
					}
				}
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DevLink. Flip enable to reset fb.");			
					inst->status 			= this->DevLink_0.status;
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					this->fileState 		= 900;
				}
			}
			this->oldFileDeviceUseUSB[this->fileIdx] = setup->fileDevices[this->fileIdx].useUSB;
			break;

		case 60: /* Unlink root device */
			DevUnlink(&this->DevUnlink_0);
			if(this->DevUnlink_0.status != ERR_FUB_BUSY) {
				if(this->DevUnlink_0.status == ERR_OK) {
					this->DevUnlink_0.enable = false;
					DevUnlink(&this->DevUnlink_0);
					this->DevLink_0.enable 	= true;
					this->DevLink_0.pDevice = (unsigned long)"ROOT";
					this->DevLink_0.pParam 	= buildParameterString((char*)&this->drive,(char*)&"",(char*)&this->deviceParam);
					this->fileState 		= 10;
				}
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DevUnlink. Flip enable to reset fb.");			
					inst->status 				= this->DevUnlink_0.status;
					this->DevUnlink_0.enable 	= false;
					DevUnlink(&this->DevUnlink_0);
					this->fileState 			= 900;
				}
			}
			break;		
		
		case 70: /* Unlink root device */
			DevUnlink(&this->DevUnlink_0);
			if(this->DevUnlink_0.status != ERR_FUB_BUSY) {
				if(this->DevUnlink_0.status == ERR_OK) {
					this->DevUnlink_0.enable = false;
					DevUnlink(&this->DevUnlink_0);
					this->DevLink_0.enable 	= true;
					this->DevLink_0.pDevice = (unsigned long)"ROOT";
					this->DevLink_0.pParam 	= buildParameterString((char*)&this->drive,(char*)&"",(char*)&this->deviceParam);
					this->fileState 		= 30;
				}
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DevUnlink. Flip enable to reset fb.");			
					inst->status 				= this->DevUnlink_0.status;
					this->DevUnlink_0.enable 	= false;
					DevUnlink(&this->DevUnlink_0);
					this->fileState 			= 900;
				}
			}
			break;	
		
		case 80: /* Prepare for available list t be created */
			this->fileIdx 				= 0;
			this->availableDeviceIndex 	= 0;
			this->availableUsbIndex	 	= 0;
			this->fileState 			= 90;
			break;
		
		case 90: /* Create the available lists */
			brdkStrCpy((unsigned long)inst->availableDevices[this->fileIdx],(unsigned long)"");
			brdkStrCpy((unsigned long)inst->availableUSB[this->fileIdx]	   ,(unsigned long)"");		
			if(this->fileIdx != 0){
				if(brdkStrCmp((unsigned long)setup->fileDevices[this->fileIdx-1].name,(unsigned long)"") != 0){
					if(setup->fileDevices[this->fileIdx-1].useUSB && inst->useUSB && this->usbOK ){
						brdkStrCpy((unsigned long)inst->availableUSB[this->availableUsbIndex],(unsigned long)setup->fileDevices[this->fileIdx-1].name);
						this->availableUsbIndex++;
					}
					else{
						brdkStrCpy((unsigned long)inst->availableDevices[this->availableDeviceIndex],(unsigned long)setup->fileDevices[this->fileIdx-1].name);
						this->availableDeviceIndex++;
					}
				}
			}
			else{
				if(inst->useUSB && this->usbOK){				
					brdkStrCpy((unsigned long)inst->availableUSB[this->fileIdx],(unsigned long)"ROOT");
					this->availableUsbIndex++;
					brdkStrCpy((unsigned long)inst->availableDevices[this->fileIdx],(unsigned long)"INTERNAL_ROOT");
					this->availableDeviceIndex++;
				}
				else{
					brdkStrCpy((unsigned long)inst->availableDevices[this->fileIdx],(unsigned long)"ROOT");
					this->availableDeviceIndex++;
				}
			}
			this->fileIdx++;
			if(this->fileIdx >= BRDK_FILE_MAX_FILES_DEVICES){
				this->fileState 		= 100;
			}
			break;
		
		case 100:
			if(!inst->enable) {
				inst->ready 	= false;
				this->fileState = 900;
			}			
			
			if(this->fileIdx < BRDK_FILE_MAX_FILES_DEVICES) {
				this->fileIdx++;
			}
			else {
				this->fileIdx = 0;
			}
			
			if(!(this->oldFileDeviceUseUSB[this->fileIdx] == setup->fileDevices[this->fileIdx].useUSB) && this->activeHandles[this->fileIdx+1] != 0 && this->usbOK){
				inst->ready 				= false;	
				this->DevUnlink_0.enable 	= true;
				this->DevUnlink_0.handle 	= this->activeHandles[this->fileIdx+1];
				DevUnlink(&this->DevUnlink_0);
				brdkStrCpy((unsigned long)inst->description,(unsigned long)"removing device.");
				this->fileState 			= 300;
			}
			this->oldFileDeviceUseUSB[this->fileIdx] = setup->fileDevices[this->fileIdx].useUSB;
			
			if(!this->driveReady) {
				inst->ready = false;
				if(this->activeHandles[0] != 0) {
					this->fileIdx 				= 0;
					this->DevUnlink_0.enable 	= true;
					this->DevUnlink_0.handle 	= this->activeHandles[this->fileIdx];
					this->fileState 			= 110;
				}
				else this->fileState = 0;
			}
			
		break;

		case 110:	/* unlink file devices */
			DevUnlink(&this->DevUnlink_0);
			if(this->DevUnlink_0.status != ERR_FUB_BUSY) {
				if(this->DevUnlink_0.status == ERR_OK) {
					this->activeHandles[this->fileIdx] = 0;
					this->fileIdx++;
					this->DevUnlink_0.enable = false;
					DevUnlink(&this->DevUnlink_0);
					if(this->activeHandles[this->fileIdx] != 0) {
						this->DevUnlink_0.enable = true;
						this->DevUnlink_0.handle = this->activeHandles[this->fileIdx];
					}
					else this->fileState = 0;
				}
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DevUnlink. Flip enable to reset fb.");			
					inst->status 				= this->DevUnlink_0.status;
					this->DevUnlink_0.enable 	= false;
					DevUnlink(&this->DevUnlink_0);
					this->fileState 			= 900;
				}
			}
			break;

		case 200:
			DevUnlink(&this->DevUnlink_0);
			if(this->DevUnlink_0.status != ERR_FUB_BUSY) {
				if(this->DevUnlink_0.status == ERR_OK) {
					this->DevUnlink_0.enable = false;
					DevUnlink(&this->DevUnlink_0);
					this->DevLink_0.enable 	= true;
					this->DevLink_0.pDevice = (unsigned long)"tmpRoot";
					this->DevLink_0.pParam 	= buildParameterString(getDrive(sim->pcHDDrive,tmpStr),(char*)&"",(char*)&this->deviceParam);
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"creates a file device for sim root folder");
					this->fileState 		= 210;
				}
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DevUnlink. Flip enable to reset fb.");			
					inst->status 				= this->DevUnlink_0.status;
					this->DevUnlink_0.enable 	= false;
					DevUnlink(&this->DevUnlink_0);
					this->fileState 			= 900;
				}
			}
			break;

		case 210:
			DevLink(&this->DevLink_0);
			if(this->DevLink_0.status != ERR_FUB_BUSY) {
				if(this->DevLink_0.status == ERR_OK) {
					this->DevUnlink_0.handle 	= this->DevLink_0.handle;
					this->DevLink_0.enable 		= false;
					DevLink(&this->DevLink_0);
					this->brdkFileCreateSubFolders_0.enable = true;
					brdkStrCpy((unsigned long)this->brdkFileCreateSubFolders_0.path,(unsigned long)sim->pcRootFolder);
					brdkStrCpy((unsigned long)this->brdkFileCreateSubFolders_0.fileDevice,this->DevLink_0.pDevice);
					brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"creates the needed folders");
					this->fileState 			= 220;
				}
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DevLink. Flip enable to reset fb.");			
					inst->status 				= this->DevLink_0.status;
					this->DevLink_0.enable 		= false;
					DevLink(&this->DevLink_0);
					this->fileState 			= 900;
				}
			}
			break;

		case 220:
			brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
			if(this->brdkFileCreateSubFolders_0.done) {
				this->brdkFileCreateSubFolders_0.enable = false;
				brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
				this->DevUnlink_0.enable 	= true;
				this->fileState				= 230;
			}
			else if(this->brdkFileCreateSubFolders_0.status != ERR_FUB_BUSY) {
				brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling brdkFileCreateSubFolders. Flip enable to reset fb.");			
				inst->status 				= this->brdkFileCreateSubFolders_0.status;
				this->brdkFileCreateSubFolders_0.enable = false;
				brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
				this->fileState 			= 900;
			}
			break;

		case 230:
			DevUnlink(&this->DevUnlink_0);
			if(this->DevUnlink_0.status != ERR_FUB_BUSY) {
				if(this->DevUnlink_0.status == ERR_OK) {
					this->DevUnlink_0.enable = false;
					DevUnlink(&this->DevUnlink_0);
					this->fileState 			= 0;
				}
				else {
					inst->status 				= this->DevUnlink_0.status;
					this->DevUnlink_0.enable 	= false;
					DevUnlink(&this->DevUnlink_0);
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DevUnlink. Flip enable to reset fb.");
					this->fileState 			= 900;
				}
			}
			break;

				
		case 300: /* Remove device */
			DevUnlink(&this->DevUnlink_0);
			if(this->DevUnlink_0.status != ERR_FUB_BUSY) {
				if(this->DevUnlink_0.status == ERR_OK) {
					this->DevUnlink_0.enable = false;
					DevUnlink(&this->DevUnlink_0);
					this->activeHandles[this->fileIdx+1] = 0;
					
					this->DevLink_0.enable 	= true;
					if(setup->fileDevices[this->fileIdx].useUSB) this->DevLink_0.pDevice = (unsigned long)"ROOT";	
					else 										 this->DevLink_0.pDevice = (unsigned long)"INTERNAL_ROOT";	
					
					if(setup->fileDevices[this->fileIdx].useUSB) this->DevLink_0.pParam 	= buildParameterString((char*)&this->drive,(char*)&setup->fileDevices[this->fileIdx].path,(char*)&this->deviceParam);
					else{
						if(!DiagCpuIsSimulated()) getDrive(setup->plcDrive,this->driveInternal);					
						else {
							getDrive(sim->pcHDDrive,this->driveInternal);
							brdkStrCat((unsigned long)this->driveInternal,(unsigned long)sim->pcRootFolder);
						}
						this->DevLink_0.pParam 	= buildParameterString((char*)&this->driveInternal,(char*)&setup->fileDevices[this->fileIdx].path,(char*)&this->deviceParam);
					}
					DevLink(&this->DevLink_0);
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"switching to root device.");
					this->fileState = 310;
				}
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling DevUnlink. Flip enable to reset fb.");			
					inst->status 				= this->DevUnlink_0.status;
					this->DevUnlink_0.enable 	= false;
					DevUnlink(&this->DevUnlink_0);
					this->fileState 			= 900;
				}
			}
			break;
		
		case 310: /* Switch to root device */
			DevLink(&this->DevLink_0);
			if(this->DevLink_0.status != ERR_FUB_BUSY) {
				if(this->DevLink_0.status == ERR_OK || this->DevLink_0.status == fiERR_DEVICE_ALREADY_EXIST) {
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					this->brdkFileCreateSubFolders_0.enable = true;
					brdkStrCpy((unsigned long)this->brdkFileCreateSubFolders_0.path,(unsigned long)setup->fileDevices[this->fileIdx].path);
					brdkStrCpy((unsigned long)this->brdkFileCreateSubFolders_0.fileDevice,(unsigned long)this->DevLink_0.pDevice);
					brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"creating the needed folder.");
					this->fileState 		= 320;
				}
				else{
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error changing the device. Flip enable to reset fb.");			
					inst->status 			= this->DevLink_0.status;
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					this->fileState 		= 900;
				}
			}
			break;


		case 320: /* Create folder on device */
			brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
			if(this->brdkFileCreateSubFolders_0.done) {
				this->brdkFileCreateSubFolders_0.enable = false;
				brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
				this->DevLink_0.enable 	= true;
				this->DevLink_0.pDevice = (unsigned long)setup->fileDevices[this->fileIdx].name;	
				if(setup->fileDevices[this->fileIdx].useUSB) this->DevLink_0.pParam 	= buildParameterString((char*)&this->drive,(char*)&setup->fileDevices[this->fileIdx].path,(char*)&this->deviceParam);
				else{
					if(!DiagCpuIsSimulated()) getDrive(setup->plcDrive,this->driveInternal);					
					else {
						getDrive(sim->pcHDDrive,this->driveInternal);
						brdkStrCat((unsigned long)this->driveInternal,(unsigned long)sim->pcRootFolder);
					}
					this->DevLink_0.pParam 	= buildParameterString((char*)&this->driveInternal,(char*)&setup->fileDevices[this->fileIdx].path,(char*)&this->deviceParam);
				}
				DevLink(&this->DevLink_0);
				brdkStrCpy((unsigned long)inst->description,(unsigned long)"adding new device.");
				this->fileState 		= 330;
				
			}
			else if(this->brdkFileCreateSubFolders_0.status == fiERR_FILE_DEVICE) {
				if(DiagCpuIsSimulated()) {
//					this->DevUnlink_0.enable 	= true;
//					this->DevUnlink_0.handle 	= this->activeHandles[0];
//					this->activeHandles[0] 		= 0;
//					DevUnlink(&this->DevUnlink_0);
//					brdkStrCpy((unsigned long)this->brdkFileCreateSubFolders_0.path,(unsigned long)sim->pcRootFolder);
//					
//					this->brdkFileCreateSubFolders_0.enable = false;
//					brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
//
//					this->fileState 			= 400;
				}
				else {
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling brdkFileCreateSubFolders. Flip enable to reset fb.");			
					inst->status 				= this->brdkFileCreateSubFolders_0.status;
					this->brdkFileCreateSubFolders_0.enable = false;
					brdkFileCreateSubFolders(&this->brdkFileCreateSubFolders_0);
					this->fileState 			= 900;	
				}
			}
			else if(this->brdkFileCreateSubFolders_0.status != ERR_FUB_BUSY) 
				brdkStrCpy((unsigned long)inst->description,(unsigned long)"error calling brdkFileCreateSubFolders. Check fb for error codes.");

			break;

		case 330: /* Switch to new device */
			DevLink(&this->DevLink_0);
			if(this->DevLink_0.status != ERR_FUB_BUSY) {
				if(this->DevLink_0.status == ERR_OK || this->DevLink_0.status == fiERR_DEVICE_ALREADY_EXIST) {
					this->activeHandles[this->fileIdx+1] = this->DevLink_0.handle;
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					inst->ready 				= true;
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"all file devices are ready to use");
					this->fileState 			= 80;
				}
				else{
					brdkStrCpy((unsigned long)inst->description,(unsigned long)"error changing the device. Flip enable to reset fb.");			
					inst->status 			= this->DevLink_0.status;
					this->DevLink_0.enable 	= false;
					DevLink(&this->DevLink_0);
					this->fileState 		= 900;
				}
			}
			break;
		
		
		case 900: /* error state */
			if(!inst->enable) {
				inst->status 	= 0;
				this->fileState = 0;
			}
			break;

	}

}
