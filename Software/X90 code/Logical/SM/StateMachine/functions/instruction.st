
ACTION initInstructions: 
	this.instructionList[INST_INITIALIZING] 			:= 'Initializing';
	this.instructionList[INST_PRESS_SAFETY_BUTTON] 		:= 'Press Safety Button';
	this.instructionList[INST_SC_NOT_ENABLED]			:= 'Wait for SC to be Enabled';
	this.instructionList[INST_PRESS_TRACTIVE_BUTTON] 	:= 'Press Tractive Button';
	this.instructionList[INST_AMS_NOT_READY]			:= 'Wait for AMS to be Ready';
	this.instructionList[INST_PRESS_BRAKE] 				:= 'Press Brake Predal';
	this.instructionList[INST_TORQUE_PEDAL_FAULT] 		:= 'Torque Pedal Fault';
	this.instructionList[INST_PRE_CHARGING] 			:= 'Pre-Charging. Wait';
	this.instructionList[INST_PRESS_DRIVE_BUTTON] 		:= 'Press Drive Button';
	this.instructionList[INST_FIX_ERROR] 				:= 'Remove Error';
	this.instructionList[INST_CLOSE_SAFETY_CHAIN] 		:= 'Close Shutdown Circuit';
	this.instructionList[INST_IN_DRIVE] 				:= 'To Exit Drive: Press Shutdown Button';
END_ACTION


ACTION instruction: 
	IF gStateMachine.status.instructionIndex = INST_CLOSE_SAFETY_CHAIN THEN
		gStateMachine.status.instruction := CONCAT(this.instructionList[INST_CLOSE_SAFETY_CHAIN], ' at: ');
		gStateMachine.status.instruction := CONCAT(gStateMachine.status.instruction, gSafetyChain.status.scErrorString);
	
		ELSE
			gStateMachine.status.instruction := this.instructionList[gStateMachine.status.instructionIndex];

		END_IF
END_ACTION
