#include <brdkFile_func.h>

void brdkFileRead(struct brdkFileRead* inst) {
	brdk_file_read_internal_typ* this = (brdk_file_read_internal_typ*)&inst->internal;

	if(inst->enable) {
		switch(this->state) {
	
			case 0:	/* setup file open */
				inst->status = ERR_FUB_BUSY;
				this->FileOpen_0.enable 	= false;
				FileOpen(&this->FileOpen_0);
				this->FileOpen_0.enable 	= true;
				this->FileOpen_0.pDevice 	= inst->pFileDevice;
				this->FileOpen_0.pFile 		= inst->pFileName;
				this->FileOpen_0.mode 		= fiREAD_ONLY;
				this->state 				= 10;
				break;
	
			case 10: /* call file open */
				FileOpen(&this->FileOpen_0);
				switch(this->FileOpen_0.status) {
	
					case 0:	/* ERR_OK */
						this->FileRead_0.enable 	= false;
						FileRead(&this->FileRead_0);
						this->FileRead_0.enable 	= true;
						this->FileRead_0.ident 		= this->FileOpen_0.ident;
						this->FileRead_0.offset 	= 0;
						this->FileRead_0.pDest 		= inst->pData;
						if(this->FileOpen_0.filelen < inst->dataLength) this->FileRead_0.len = this->FileOpen_0.filelen;
						else this->FileRead_0.len 	= inst->dataLength;
						this->state 				= 20;					
						break;
	
					case 65535: break;	/* ERR_FUB_BUSY */
	
					default:
						inst->status 				= this->FileOpen_0.status;
						this->state 				= 999;
						break;
	
				}
				break;
	
			case 20: /* call file read */
				FileRead(&this->FileRead_0);
				switch(this->FileRead_0.status) {
					
					case 0:	/* ERR_OK */
						this->FileClose_0.enable 	= false;
						FileClose(&this->FileClose_0);
						this->FileClose_0.enable 	= true;
						this->FileClose_0.ident 	= this->FileRead_0.ident;
						this->state 				= 30;
						break;
	
					case 65535: break;	/* ERR_FUB_BUSY */
	
					default:
						inst->status 				= this->FileRead_0.status;
						this->state 				= 999;
						break;
	
				}
				break;
	
			case 30: /* call file close */
				FileClose(&this->FileClose_0);
				switch(this->FileClose_0.status) {
					
					case 0:	case 20721: /* ERR_OK - fiERR_FILE_NOT_OPENED */
						inst->readLength			= this->FileOpen_0.filelen;
						inst->status				= ERR_OK;
						this->state 				= 40;
						break;
	
					case 65535: break;	/* ERR_FUB_BUSY */
	
					default:
						inst->status 				= this->FileClose_0.status;
						this->state 				= 999;
						break;
	
				}
				break;

		}
	
	}
	else {
		inst->status				= ERR_FUB_ENABLE_FALSE;
		inst->readLength			= 0;
		this->state 				= 0;
	}
}
