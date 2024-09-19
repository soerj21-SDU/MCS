
ACTION missionInit: 
	
	missions.missionList[MISSION_NONE] 			:= 'Mission None';
	missions.missionList[MISSION_ACCELERATION] 	:= 'Mission Acceleration';
	missions.missionList[MISSION_SKIDPAD] 		:= 'Mission Skidpad';
	missions.missionList[MISSION_SPRINT] 		:= 'Mission Sprint';
	missions.missionList[MISSION_ENDURANCE] 	:= 'Mission Endurance';
	missions.missionList[MISSION_BRAKE_TEST] 	:= 'Mission Brake Test';
	missions.missionList[MISSION_TESTING] 		:= 'Mission Testing';
	
	gStateMachine.status.missionIndex 		:= MISSION_NONE;
	
	IF gIsSimulation THEN
		missions.MpRecipeXml_0.DeviceName 	:= ADR('C');
	ELSE
		missions.MpRecipeXml_0.DeviceName 	:= ADR('plc');
	END_IF;
	missions.MpRecipeXml_0.FileName 	:= ADR('mission_none');
	missions.MpRecipeXml_0.MpLink 		:= ADR(gRecipeXml);
	missions.MpRecipeXml_0.Enable 		:= TRUE;
	
	missions.MpRecipeRegPar_0[0].PVName := ADR('gInverters.data.powerLimitKW');
	missions.MpRecipeRegPar_0[1].PVName := ADR('gInverters.data.torqueLimitNm');
	missions.MpRecipeRegPar_0[2].PVName := ADR('gInverters.cmd.enableLaunchProfile');
	missions.MpRecipeRegPar_0[3].PVName := ADR('gInverters.cmd.enablePowerLimiter');
	missions.MpRecipeRegPar_0[4].PVName := ADR('gInverters.cmd.enableRegenerativeBraking');
	missions.MpRecipeRegPar_0[5].PVName := ADR('gInverters.cmd.enableTorqueVectoring');
	missions.MpRecipeRegPar_0[6].PVName := ADR('gInverters.cmd.enableTractionControl');
	missions.MpRecipeRegPar_0[7].PVName := ADR('gInverters.cmd.enableMotorPairShutdown');
	missions.MpRecipeRegPar_0[8].PVName := ADR('gInverters.cmd.enableConfigurationDuringDrive');
	missions.MpRecipeRegPar_0[9].PVName := ADR('gInverters.status.deratingStaticPercent');
	
	
	FOR i := 0 TO MAX_MISSION_PARAMETERS DO
		missions.MpRecipeRegPar_0[i].Enable := TRUE;
		missions.MpRecipeRegPar_0[i].MpLink := ADR(gRecipeXml);
	END_FOR;
	
	// Initialize to TRUE so the car will start by fetching the current mission data
	gStateMachine.cmd.changeMission 	:= TRUE;
	
END_ACTION

ACTION missionCyclic: 
	gStateMachine.status.mission := missions.missionList[gStateMachine.status.missionIndex];
	
	(* detect a mission change *)
	IF gStateMachine.status.missionIndex <> missions.missionOld THEN
		gStateMachine.cmd.changeMission := TRUE;
		missions.missionOld 			:= gStateMachine.status.missionIndex;
	END_IF;
	
	(* If the mission has been change load the mission config *)
	IF (gStateMachine.cmd.changeMission OR gStateMachine.cmd.loadMission) AND gInverters.status.configurationEnabled THEN
		gStateMachine.cmd.changeMission := FALSE;
		gStateMachine.cmd.loadMission := FALSE;
//		gDashboard.cmd.sendVehicleConfigMsg := TRUE; // Transmit new mission to dashboard
//		CASE gStateMachine.status.missionIndex OF 
//			MISSION_NONE: 		  missions.MpRecipeXml_0(FileName := ADR('mission_none'		 	));	
//			MISSION_ACCELERATION: missions.MpRecipeXml_0(FileName := ADR('mission_acceleration'	));	
//			MISSION_SKIDPAD: 	  missions.MpRecipeXml_0(FileName := ADR('mission_skidpad'	 	));	
//			MISSION_SPRINT: 	  missions.MpRecipeXml_0(FileName := ADR('mission_sprint'		));	
//			MISSION_ENDURANCE: 	  missions.MpRecipeXml_0(FileName := ADR('mission_endurance'	));	
//			MISSION_BRAKE_TEST:   missions.MpRecipeXml_0(FileName := ADR('mission_brake_test'	));	
//			MISSION_TESTING: 	  missions.MpRecipeXml_0(FileName := ADR('mission_testing'	 	));	
//		END_CASE
		missions.MpRecipeXml_0(Load := TRUE);
	END_IF;
	
	(* Save current configuration to current mission *)
	IF gStateMachine.cmd.saveMission THEN
		gStateMachine.cmd.saveMission := FALSE;
		missions.MpRecipeXml_0(Save := TRUE);
	END_IF;

	(* Run function blocks *)
	FOR i := 0 TO MAX_MISSION_PARAMETERS DO
		missions.MpRecipeRegPar_0[i]();
	END_FOR;
	missions.MpRecipeXml_0(Save := FALSE, Load := FALSE);
	
	
END_ACTION


