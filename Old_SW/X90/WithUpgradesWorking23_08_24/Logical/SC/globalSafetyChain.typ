
TYPE
	gSafetyChain_cmd_typ : 	STRUCT 
		di_LVMS_OK : BOOL;
		di_supply : BOOL;
		di_shutdownCockpit_OK : BOOL;
		di_BOTS_OK : BOOL;
		di_inertiaSwitch_OK : BOOL;
		di_shutdownLeft_OK : BOOL;
		di_shutdownRight_OK : BOOL;
		di_interlockWheelFR_OK : BOOL;
		di_interlockWheelFL_OK : BOOL;
		di_interlockWheelRR_OK : BOOL;
		di_interlockWheelRL_OK : BOOL;
		di_interlockHVDC_OK : BOOL;
		di_IMD_OK : BOOL;
		di_AMS_OK : BOOL;
		di_TS_Container : BOOL;
		di_BSPD_OK : BOOL;
		di_interlockHVD_OK : BOOL;
		di_interlockMotorRR_OK : BOOL;
		di_interlockMotorRL_OK : BOOL;
		di_interlockMotorFR_OK : BOOL;
		di_interlockMotorFL_OK : BOOL;
		di_interlockTSMP_OK : BOOL;
		di_TSMS_OK : BOOL;
	END_STRUCT;
	gSafetyChain_typ : 	STRUCT 
		status : gSafetyChain_status_typ;
		outputs : gSafetyChain_outputs_typ;
		data : gSafetyChain_data_typ;
		inputs : gSafetyChain_inputs_typ;
		cmd : gSafetyChain_cmd_typ;
	END_STRUCT;
	gSafetyChain_status_typ : 	STRUCT 
		scOK_notEnabled : BOOL;
		scOK_usint : USINT;
		scOKPersistent : BOOL;
		scOK : BOOL;
		scErrorIndex : USINT;
		sc : ARRAY[0..MAX_SC_ELEMENTS]OF BOOL;
		scErrorStrings : ARRAY[0..MAX_SC_ELEMENTS]OF STRING[80];
		scErrorString : STRING[80];
		safetyChainEnabled : BOOL;
	END_STRUCT;
	gSafetyChain_inputs_typ : 	STRUCT 
		di_LVMS_OK : BOOL;
		di_supply : BOOL;
		di_shutdownCockpit_OK : BOOL;
		di_BOTS_OK : BOOL;
		di_inertiaSwitch_OK : BOOL;
		di_shutdownLeft_OK : BOOL;
		di_shutdownRight_OK : BOOL;
		di_interlockWheelFR_OK : BOOL;
		di_interlockWheelFL_OK : BOOL;
		di_interlockWheelRR_OK : BOOL;
		di_interlockWheelRL_OK : BOOL;
		interlockHVDC_OK : BOOL;
		IMD_OK : BOOL;
		AMS_OK : BOOL;
		di_TS_Container : BOOL;
		di_BSPD_OK : BOOL;
		di_interlockHVD_OK : BOOL;
		di_interlockMotorRR_OK : BOOL;
		di_interlockMotorRL_OK : BOOL;
		di_interlockMotorFR_OK : BOOL;
		di_interlockMotorFL_OK : BOOL;
		di_interlockTSMP_OK : BOOL;
		di_interlockMotorConBoxFR_OK : BOOL;
		di_interlockMotorConBoxFL_OK : BOOL;
		di_TSMS_OK : BOOL;
	END_STRUCT;
	gSafetyChain_outputs_typ : 	STRUCT 
		dummy : BOOL;
	END_STRUCT;
	gSafetyChain_data_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
END_TYPE
