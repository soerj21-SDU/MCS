
(* Write SC error names into array *)
ACTION scStrings: 
	gSafetyChain.status.scErrorStrings[0] := 'Low Voltage Master Switch';
	gSafetyChain.status.scErrorStrings[1] := 'Supply';
	gSafetyChain.status.scErrorStrings[2] := 'Cockpit Shutdown Button';
	gSafetyChain.status.scErrorStrings[3] := 'BOTS';
	gSafetyChain.status.scErrorStrings[4] := 'Inertia Switch';
	gSafetyChain.status.scErrorStrings[5] := 'Left Shutdown Button';
	gSafetyChain.status.scErrorStrings[6] := 'Right Shutodwn Button';
	gSafetyChain.status.scErrorStrings[7] := 'FR Wheel Interlock';
	gSafetyChain.status.scErrorStrings[8] := 'FL Wheel Interlock';
	gSafetyChain.status.scErrorStrings[9] := 'RR Wheel Interlock';
	gSafetyChain.status.scErrorStrings[10] := 'RL Wheel Interlock';
	gSafetyChain.status.scErrorStrings[11] := 'HVDC Interlock';
	gSafetyChain.status.scErrorStrings[12] := 'IMD';
	gSafetyChain.status.scErrorStrings[13] := 'AMS';
	gSafetyChain.status.scErrorStrings[14] := 'TS container';
	gSafetyChain.status.scErrorStrings[15] := 'BSPD';
	gSafetyChain.status.scErrorStrings[16] := 'HVD Interlock';
	gSafetyChain.status.scErrorStrings[17] := 'TS Container interlocks'; 
	gSafetyChain.status.scErrorStrings[18] := 'TS Container interlocks'; 
	gSafetyChain.status.scErrorStrings[19] := 'TS Container interlocks'; 
	gSafetyChain.status.scErrorStrings[20] := 'TS Container interlocks'; 
	gSafetyChain.status.scErrorStrings[21] := 'TSMP or MotorConBox';
	gSafetyChain.status.scErrorStrings[22] := 'TSMP or MotorConBox';
	gSafetyChain.status.scErrorStrings[23] := 'TSMP or MotorConBox'; 
//	gSafetyChain.status.scErrorStrings[15] := 'FR Motor Interlock';
//	gSafetyChain.status.scErrorStrings[16] := 'FL Motor Interlock';
//	gSafetyChain.status.scErrorStrings[17] := 'RR Motor Interlock';
//	gSafetyChain.status.scErrorStrings[18] := 'RL Motor Interlock';
//	gSafetyChain.status.scErrorStrings[19] := 'TSMPs Interlock';
	gSafetyChain.status.scErrorStrings[24] := 'Tractive System Master Switch';
	gSafetyChain.status.scErrorStrings[25] := 'Shutdown Circuit Enable';
	gSafetyChain.status.scErrorStrings[26] := ' ';
END_ACTION
