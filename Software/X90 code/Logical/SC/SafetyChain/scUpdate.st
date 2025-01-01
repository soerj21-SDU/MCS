
(* Write SC values into array *)
ACTION scUpdate: 
	(* Collect inputs that are in groups *)
//	gSafetyChain.inputs.di_interlockMotorFR_OK := gSafetyChain.inputs.di_interlockTSMP_OK;	// 'FR Motor Interlock';
//	gSafetyChain.inputs.di_interlockMotorFL_OK := gSafetyChain.inputs.di_interlockTSMP_OK;	// 'FL Motor Interlock';
//	gSafetyChain.inputs.di_interlockMotorRR_OK := gSafetyChain.inputs.di_interlockTSMP_OK;	// 'RR Motor Interlock';
//	gSafetyChain.inputs.di_interlockMotorRL_OK := gSafetyChain.inputs.di_interlockTSMP_OK;	// 'RL Motor Interlock';
	
	// All 4 motor interlocks are dependant on the input from the RL motor
	gSafetyChain.inputs.di_interlockMotorFR_OK := gSafetyChain.inputs.di_interlockMotorRL_OK;	// 'FR Motor Interlock';
	gSafetyChain.inputs.di_interlockMotorFL_OK := gSafetyChain.inputs.di_interlockMotorRL_OK;	// 'FL Motor Interlock';
	gSafetyChain.inputs.di_interlockMotorRR_OK := gSafetyChain.inputs.di_interlockMotorRL_OK;	// 'RR Motor Interlock';
	
	// Connection boxes for front motors interlocks dependent on signal from TSMP
	gSafetyChain.inputs.di_interlockMotorConBoxFL_OK := gSafetyChain.inputs.di_interlockTSMP_OK;	// 'FL Motor Connection Box Interlock';
	gSafetyChain.inputs.di_interlockMotorConBoxFR_OK := gSafetyChain.inputs.di_interlockTSMP_OK;	// 'FR Motor Connection Box Interlock';
	
	
	(* Write safety chain values to array *)
	gSafetyChain.status.sc[0]  := gSafetyChain.inputs.di_LVMS_OK; 				// 'Low Voltage Master Switch';
	gSafetyChain.status.sc[1]  := gSafetyChain.inputs.di_supply;				// 'Supply'
	gSafetyChain.status.sc[2]  := gSafetyChain.inputs.di_shutdownCockpit_OK; 	// 'Cockpit Shutdown Button';
	gSafetyChain.status.sc[3]  := gSafetyChain.inputs.di_BOTS_OK;				// 'BOTS';
	gSafetyChain.status.sc[4]  := gSafetyChain.inputs.di_inertiaSwitch_OK;		// 'Intertia Switch';
	gSafetyChain.status.sc[5]  := gSafetyChain.inputs.di_shutdownLeft_OK; 		//'Left Shutdown Button';
	gSafetyChain.status.sc[6]  := gSafetyChain.inputs.di_shutdownRight_OK;		// 'Right Shutodwn Button';
	gSafetyChain.status.sc[7]  := gSafetyChain.inputs.di_interlockWheelFR_OK;	// 'FR Wheel Interlock';
	gSafetyChain.status.sc[8]  := gSafetyChain.inputs.di_interlockWheelFL_OK;	// 'FL Wheel Interlock';
	gSafetyChain.status.sc[9]  := gSafetyChain.inputs.di_interlockWheelRR_OK;	// 'RR Wheel Interlock';
	gSafetyChain.status.sc[10] := gSafetyChain.inputs.di_interlockWheelRL_OK;	// 'RL Wheel Interlock';
	gSafetyChain.status.sc[11] := gSafetyChain.inputs.interlockHVDC_OK;			// 'HV DC Interlock';
	gSafetyChain.status.sc[12] := gSafetyChain.inputs.IMD_OK;					// 'IMD';
	gSafetyChain.status.sc[13] := gSafetyChain.inputs.AMS_OK;					// 'AMS';
	gSafetyChain.status.sc[14] := gSafetyChain.inputs.di_TS_Container;			// 'TS Container';
	gSafetyChain.status.sc[15] := gSafetyChain.inputs.di_BSPD_OK;				// 'BSPD';
	gSafetyChain.status.sc[16] := gSafetyChain.inputs.di_interlockHVD_OK;		// 'HVD Interlock';
	gSafetyChain.status.sc[17] := gSafetyChain.inputs.di_interlockMotorFR_OK;	// 'FR Motor Interlock';
	gSafetyChain.status.sc[18] := gSafetyChain.inputs.di_interlockMotorFL_OK;	// 'FL Motor Interlock';
	gSafetyChain.status.sc[19] := gSafetyChain.inputs.di_interlockMotorRR_OK;	// 'RR Motor Interlock';
	gSafetyChain.status.sc[20] := gSafetyChain.inputs.di_interlockMotorRL_OK;	// 'RL Motor Interlock';
	gSafetyChain.status.sc[21] := gSafetyChain.inputs.di_interlockMotorConBoxFL_OK;	// 'FL Motor ConBox Interlock';
	gSafetyChain.status.sc[22] := gSafetyChain.inputs.di_interlockMotorConBoxFR_OK;	// 'FR Motor ConBox Interlock';
	gSafetyChain.status.sc[23] := gSafetyChain.inputs.di_interlockTSMP_OK;		// 'TSMP Interlock';
	gSafetyChain.status.sc[24] := gSafetyChain.inputs.di_TSMS_OK;				// 'Tractive System Master Switch';
	gSafetyChain.status.sc[25] := gAMS.status.scEnabled;						// 'Safety Chain Enable';
	gSafetyChain.status.sc[26] := FALSE;
END_ACTION
