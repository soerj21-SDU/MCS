
FUNCTION_BLOCK brdkFileDeviceHandler (*Easy file device handler. This function block makes file device handling easy. The idea of the function block is that you only need to create one file device name that can be used for both internal and usb flash.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		enable : BOOL := FALSE; (*Enables the function block.*)
		setup : brdk_file_dev_handler_setup_typ; (*Setup options.*)
		simulation : brdk_file_dev_handler_sim_typ; (*Simulation options.*)
		useUSB : BOOL := FALSE; (*Stores on the USB if it is possible. Can be auto selected in the setup options.*)
	END_VAR
	VAR_OUTPUT
		availableUSB : ARRAY[0..BRDK_FILE_MAX_FILES_DEVICES] OF STRING[BRFK_FILE_MAX_FILE_DEVICE_LEN]; (*List of available USB devices.*)
		availableDevices : ARRAY[0..BRDK_FILE_MAX_FILES_DEVICES] OF STRING[BRFK_FILE_MAX_FILE_DEVICE_LEN]; (*List of available PLC devices.*)
		ready : BOOL := FALSE; (*Means that all file devices have been created and are ready to use.*)
		description : STRING[200] := ''; (*Status description.*)
		status : UINT := 0; (*Status of FileIO function blocks.*)
	END_VAR
	VAR
		internal : brdk_file_dev_handler_int_typ; (*Internal variables.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK brdkFileCreateSubFolders (*Creates folders based on a path string.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		enable : BOOL := FALSE; (*Enables the function block.*)
		path : STRING[BRDK_FILE_MAX_PATH_LEN] := ''; (*Path of folder to be created. Use \ to seperate folders.*)
		fileDevice : STRING[BRFK_FILE_MAX_FILE_DEVICE_LEN] := ''; (*File device name.*)
	END_VAR
	VAR_OUTPUT
		description : STRING[200] := ''; (*Status description.*)
		done : BOOL := FALSE; (*Function block done.*)
		status : UINT := 0; (*Status of DirCreate function block.*)
	END_VAR
	VAR
		internal : brdk_file_create_subfold_int_typ; (*Internal variables.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK brdkFileWrite (*Write data to a file.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		enable : BOOL := FALSE; (*Enables the function block.*)
		pFileDevice : UDINT := 0; (*String pointer to file device.*)
		pFileName : UDINT := 0; (*String pointer to file name.If the file does not exist it will be created.*)
		pData : UDINT := 0; (*Pointer to the data that must be written to the file.*)
		dataLength : UDINT := 0; (*Length of the data that must be written. If 0 is specified \0 will end the data.*)
		overwrite : BOOL := FALSE; (*Overwrite existing file. If not set the data will be appended to existing file.*)
	END_VAR
	VAR_OUTPUT
		status : UINT := 0; (*Status of the function block.*)
	END_VAR
	VAR
		internal : brdk_file_write_internal_typ; (*Internal variables.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK brdkFileRead (*Read data from a file.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		enable : BOOL := FALSE; (*Enables the function block.*)
		pFileDevice : UDINT := 0; (*String pointer to file device.*)
		pFileName : UDINT := 0; (*String pointer to file name.*)
		pData : UDINT := 0; (*Pointer to the data where the data is read to.*)
		dataLength : UDINT := 0; (*Length of the read data buffer.*)
	END_VAR
	VAR_OUTPUT
		status : UINT := 0; (*Status of the function block.*)
		readLength : UDINT := 0; (*Length of the read data.*)
	END_VAR
	VAR
		internal : brdk_file_read_internal_typ; (*Internal variables.*)
	END_VAR
END_FUNCTION_BLOCK
