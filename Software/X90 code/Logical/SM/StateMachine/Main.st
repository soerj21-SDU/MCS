
PROGRAM _INIT

	gStateMachine.status.state 			:= STATE_INITIALIZE;	
	gStateMachine.status.stateOld 		:= gStateMachine.status.state;
	
	gStateMachine.status.stateChangeTimeout := FALSE;
	
	gIsSimulation 						:= DiagCpuIsSimulated();
	//gIsSimulation 	:= TRUE;
	


	
	(* Initialize the strings for the instructions *)
	initInstructions;
	
	initForceIO;
	
	TON_stateChange.PT 			:= T#500ms;
	this.TON_initialization.PT 	:= T#3s;
	TON_stateTimeout.PT 		:= T#15s;
	
	
END_PROGRAM

PROGRAM _CYCLIC
	(* Instruction to tell the driver what to do *)
	instruction;
	
	forceIO;

	// Handle state timeout
	TON_stateTimeout.IN := gStateMachine.status.state = STATE_ENABLING_SC OR gStateMachine.status.state = STATE_PRECHARGING;
	TON_stateTimeout();
	gStateMachine.status.stateChangeTimeout := TON_stateTimeout.Q;
	
	// Handle delay between state changes
	changeStateDelay;
	
	

	IF gEventLog.resetEventLog THEN
		resetEventLog;	
	END_IF;
	

	CASE gStateMachine.status.state OF
		(* The car startsup in this state. It controls the startup routine *)
		STATE_INITIALIZE:
			gStateMachine.status.stateName := 'Initialize';
			stateInit;
			stateChangeInit;
			
		(* 	Idle state where the car is when it is OK for driving but is waiting for start commands.
			The car enters this state when the startup routine is done and after a broken safety chain is closed *)
		STATE_IDLE:
			gStateMachine.status.stateName := 'Idle';
			stateIdle;
			stateChangeIdle;
			
		(* The AMS is opening the SC *)
		STATE_ENABLING_SC:
			gStateMachine.status.stateName := 'Enabling Shutdown Circuit';
			stateEnablingSC;
			stateChangeEnablingSC;
			
		(* The last part of the safety chain is enabled and the safety chain is fully closed *)
		STATE_SC_ENABLED:
			gStateMachine.status.stateName := 'Shutdown Circuit Enabled';
			stateSCEnabled;
			stateChangeSCEnabled;
			
		(* The SC is currently charging *)
		STATE_PRECHARGING:
			gStateMachine.status.stateName := 'Precharging';
			statePrecharging;
			stateChangePrecharging;
			
		(* The AIRs are closed and precharging is enabled *)
		STATE_TRACTIVE:
			gStateMachine.status.stateName := 'Tractive';
			stateTractive;
			stateChangeTractive;
			
		(* The car is in a driving state and pressing the torque pedal propels the car *)
		STATE_DRIVE:
			gStateMachine.status.stateName := 'Drive';
			stateDrive;
			stateChangeDrive;
		
		(* One or more elements of the safety chain are broken *)
		STATE_ERROR:
			gStateMachine.status.stateName := 'Error';
			stateError;
			stateChangeError;
		ELSE
	END_CASE
	


	// Log state change event
	IF gStateMachine.status.stateName <> gStateMachine.status.stateNameOld THEN
		gEventLog.newEventString := 'State changed to: ';
		strcat(ADR(gEventLog.newEventString),ADR(gStateMachine.status.stateName));
		logEvent;
	END_IF;  
	gStateMachine.status.stateNameOld := gStateMachine.status.stateName;



END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM

