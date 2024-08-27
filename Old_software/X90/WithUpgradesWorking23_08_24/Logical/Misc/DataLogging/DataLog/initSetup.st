	//(* Writing the data to be datalogged *) 
ACTION initSetup:  
	// State 
	gDataLogging.data.csvData[0] := 'gStateMachine.status.stateName';
	// Mission
	gDataLogging.data.csvData[1] := 'gStateMachine.status.mission';
	// Instruction
	gDataLogging.data.csvData[2] := 'gStateMachine.status.instruction';
	
	// ******* Dashboard information
	// State
	gDataLogging.data.csvData[3] := 'gDashboard.status.DashboardDisconnected';
	gDataLogging.data.csvData[4] := 'gDashboard.status.errorCode';
	// Buttons
	gDataLogging.data.csvData[5] := 'gDashboard.inputs.di_button1';
	gDataLogging.data.csvData[6] := 'gDashboard.inputs.di_button2';
	gDataLogging.data.csvData[7] := 'gDashboard.inputs.di_button3';
	gDataLogging.data.csvData[8] := 'gDashboard.inputs.di_button4';
	gDataLogging.data.csvData[9] := 'gDashboard.inputs.di_buttonSafety';
	gDataLogging.data.csvData[10] := 'gDashboard.inputs.di_buttonTractive';
	gDataLogging.data.csvData[11] := 'gDashboard.inputs.di_buttonDrive';
	
	// LED's
	gDataLogging.data.csvData[12] := 'gDashboard.outputs.do_ledAMS';
	gDataLogging.data.csvData[13] := 'gDashboard.outputs.do_ledIMD';
	gDataLogging.data.csvData[14] := 'gDashboard.outputs.do_ledLV';
	gDataLogging.data.csvData[15] := 'gDashboard.outputs.do_ledREADY';
	gDataLogging.data.csvData[16] := 'gDashboard.outputs.do_ledSC';
	gDataLogging.data.csvData[17] := 'gDashboard.outputs.do_ledTS_OFF';
	

END_ACTION