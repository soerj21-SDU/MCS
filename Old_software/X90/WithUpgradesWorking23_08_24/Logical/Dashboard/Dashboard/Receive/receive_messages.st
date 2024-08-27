

ACTION msg_0x050: 
	gDashboard.inputs.di_buttonSafety		:= ArCanReceive_0.ReceivedFrame.Data[0].0;
	gDashboard.inputs.di_buttonTractive		:= ArCanReceive_0.ReceivedFrame.Data[0].1;
	gDashboard.inputs.di_buttonDrive		:= ArCanReceive_0.ReceivedFrame.Data[0].2;
	gDashboard.inputs.di_button1			:= ArCanReceive_0.ReceivedFrame.Data[0].3;
//	
//	gDashboard.inputs.di_buttonDrive		:= ArCanReceive_0.ReceivedFrame.Data[0].3;
//	gDashboard.inputs.di_button1			:= ArCanReceive_0.ReceivedFrame.Data[0].2;
//	
	gDashboard.inputs.di_button2			:= ArCanReceive_0.ReceivedFrame.Data[0].4;
	gDashboard.inputs.di_button3			:= ArCanReceive_0.ReceivedFrame.Data[0].5;
	gDashboard.inputs.di_button4			:= ArCanReceive_0.ReceivedFrame.Data[0].6;
END_ACTION


ACTION msg_0x051: 
	gDashboard.status.statusIndex := BYTE_TO_USINT(ArCanReceive_0.ReceivedFrame.Data[0]);
END_ACTION

ACTION msg_0x052: 
	(* Chagne driving mission *)
	CASE BYTE_TO_USINT(ArCanReceive_0.ReceivedFrame.Data[0]) OF 
		MISSION_NONE: 		  gStateMachine.status.missionIndex := MISSION_NONE;
		MISSION_ACCELERATION: gStateMachine.status.missionIndex := MISSION_ACCELERATION;
		MISSION_SKIDPAD: 	  gStateMachine.status.missionIndex := MISSION_SKIDPAD;
		MISSION_SPRINT: 	  gStateMachine.status.missionIndex := MISSION_SPRINT;
		MISSION_ENDURANCE: 	  gStateMachine.status.missionIndex := MISSION_ENDURANCE;
		MISSION_BRAKE_TEST:	  gStateMachine.status.missionIndex := MISSION_BRAKE_TEST;
		MISSION_TESTING: 	  gStateMachine.status.missionIndex := MISSION_TESTING;
		ELSE	  			  gStateMachine.status.missionIndex := MISSION_NONE;
	END_CASE;
END_ACTION

