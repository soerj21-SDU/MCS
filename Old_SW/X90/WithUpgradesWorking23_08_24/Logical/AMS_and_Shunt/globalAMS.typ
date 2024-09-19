
TYPE
	gAMS_cmd_typ : 	STRUCT 
		chargingPrescalerAmp : REAL;
		chargingPrescalerPercent : USINT;
		bankCount : USINT;
		mpo1 : USINT;
		mpo2 : USINT;
		mpo3 : USINT;
		mpe : USINT;
		commandId : USINT;
		startPrecharge : BOOL;
		enableSC : BOOL;
		enterDrive : BOOL;
		abort : BOOL;
	END_STRUCT;
	gAMS_data_history_typ : 	STRUCT 
		actPower : ARRAY[0..999]OF REAL;
		actCurrent : ARRAY[0..999]OF REAL;
		actSoc : ARRAY[0..999]OF REAL;
		actVoltage : ARRAY[0..999]OF REAL;
	END_STRUCT;
	gAMS_data_typ : 	STRUCT 
		stateOfCharge : REAL;
		outputCurrent : REAL;
		chargeCurrent : REAL;
		batteryVoltage : REAL;
		cellTempMax : REAL;
		cellVoltageMax : ARRAY[0..4]OF REAL;
		cellVoltageMin : ARRAY[0..4]OF REAL;
		bankTemperatureMax : ARRAY[0..4]OF REAL;
		bankTemperatureMin : ARRAY[0..4]OF REAL;
		bankResistorTemperatureMax : ARRAY[0..4]OF REAL;
		bankResistorTemperatureMin : ARRAY[0..4]OF REAL;
		history : gAMS_data_history_typ;
		packPower : REAL;
		cellVoltageMinOrion : REAL;
	END_STRUCT;
	gAMS_inputs_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
	gAMS_outputs_typ : 	STRUCT 
		com_idle : BOOL;
		com_sc_enable : BOOL;
		com_precharge : BOOL;
		com_drive : BOOL;
		com_charge : BOOL;
		com_resetShunt : BOOL;
	END_STRUCT;
	gAMS_status_bank_typ : 	STRUCT 
		bankVoltage : REAL;
		resistorTemperature : ARRAY[0..13]OF REAL;
		temperatures : ARRAY[0..9]OF REAL;
		cellVoltage : ARRAY[0..27]OF REAL;
	END_STRUCT;
	gAMS_status_error_typ : 	STRUCT 
		errorTimers : ARRAY[0..21]OF TON;
		amsError : BOOL;
		imdError : BOOL;
		hvdcInterlockError : BOOL;
		tempWarn : BOOL;
		voltWarn : BOOL;
		precharge : BOOL;
		airMinus : BOOL;
		airPlus : BOOL;
		lowVoltage : BOOL;
		highVoltage : BOOL;
		lowTemp : BOOL;
		highTemp : BOOL;
		ltc6813Com : BOOL;
		shuntCom : BOOL;
		openSc : BOOL;
		closeSc : BOOL;
		openAirMinus : BOOL;
		closeAirMinus : BOOL;
		openAirPlus : BOOL;
		closeAirPlus : BOOL;
		openPrePlus : BOOL;
		closePrePlus : BOOL;
		preTimeout : BOOL;
		unexpectedChargeRate : BOOL;
		bankCountMismatch : BOOL;
		unexpectedTsCurrent : BOOL;
		relayFailed : BOOL;
		scBroken : BOOL;
		unfitChargeVoltage : BOOL;
		monitorError : BOOL;
	END_STRUCT;
	gAMS_status_pack_typ : 	STRUCT 
		packVoltage : REAL;
		resistorTemperature : ARRAY[0..69]OF REAL;
		temperatures : ARRAY[0..49]OF REAL;
		InstantCellVoltage : ARRAY[0..179]OF REAL;
		cellTempMax : SINT;
		cellVoltage : ARRAY[0..179]OF REAL;
	END_STRUCT;
	gAMS_status_failsafe_typ : 	STRUCT 
		failsafeStatus : UINT;
	END_STRUCT;
	gAMS_status_relay_typ : 	STRUCT 
		dischargeRelayEnabled : BOOL;
		chargeRelayEnabled : BOOL;
		chargerSafetyEnabled : BOOL;
		malfunctionIndicatorActive : BOOL;
		MPI1SignalStatus : BOOL;
		alwaysOnSignalStatus : BOOL;
		isReadyInputStatus : BOOL;
		isChargingInputStatus : BOOL;
		MPI2SignalStatus : BOOL;
		MPI3SignalStatus : BOOL;
		chargeModeStatus : BOOL;
		MPO2SignalStatus : BOOL;
		MPO3SignalStatus : BOOL;
		MPO4SignalStatus : BOOL;
		MPEnableSignalStatus : BOOL;
		MPO1SignalStatus : BOOL;
		relayState : UINT;
	END_STRUCT;
	gAMS_status_typ : 	STRUCT 
		ok : BOOL;
		pack : gAMS_status_pack_typ;
		bank : ARRAY[0..4]OF gAMS_status_bank_typ;
		error : gAMS_status_error_typ;
		hasError : BOOL;
		amsBankCount : USINT;
		amsStateName : STRING[80];
		amsState : USINT;
		amsTurnedOnCharger : BOOL;
		scEnabled : BOOL;
		highPowerWarning : BOOL;
		highPowerError : BOOL;
		disconnected : BOOL;
		prechargingDone : BOOL;
		Counter : USINT;
		relayState : gAMS_status_relay_typ;
		failsafeStatus : gAMS_status_failsafe_typ;
		DTC1Status : UINT;
		DTC2Status : UINT;
		RelayError : USINT;
		errorInfo : STRING[80];
	END_STRUCT;
	gAMS_typ : 	STRUCT 
		status : gAMS_status_typ;
		outputs : gAMS_outputs_typ;
		data : gAMS_data_typ;
		inputs : gAMS_inputs_typ;
		cmd : gAMS_cmd_typ;
	END_STRUCT;
END_TYPE
