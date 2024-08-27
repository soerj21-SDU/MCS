ACTION initForceIO:
	brdkSimInput_0[0].dpName  := '%IX.X1.DigitalInput05'; 			//::gSafetyChain.inputs.di_interlockWheelFR_OK
	brdkSimInput_0[1].dpName  := '%IX.X1.DigitalInput07'; 			//:gSafetyChain.inputs.di_shutdownRight_OK
	brdkSimInput_0[2].dpName  := '%IX.X1.DigitalInput06'; 			//::gSafetyChain.inputs.di_interlockWheelFL_OK
	brdkSimInput_0[3].dpName  := '%IX.X1.DigitalInput08'; 			//::gSafetyChain.inputs.di_interlockWheelRR_OK
	brdkSimInput_0[4].dpName  := '%IX.X1.DigitalInput01'; 			//::gSafetyChain.inputs.di_shutdownLeft_OK
	brdkSimInput_0[5].dpName  := '%IX.X1.DigitalInput02'; 			//::gSafetyChain.inputs.di_shutdownCockpit_OK
	brdkSimInput_0[6].dpName  := '%IX.X1.DigitalInput03'; 			//::gSafetyChain.inputs.di_inertiaSwitch_OK
	brdkSimInput_0[7].dpName  := '%IX.X1.DigitalInput04'; 			//::gSafetyChain.inputs.di_BOTS_OK
	brdkSimInput_0[8].dpName  := '%IX.X1.DigitalInput13'; 			//::gSafetyChain.inputs.di_TSMS_OK
	brdkSimInput_0[9].dpName  := '%IW.X1.AnalogInput20'; 			//::gSteeringAngle.inputs.angleSensor
	brdkSimInput_0[10].dpName := '%IW.X1.AnalogInput21'; 			//::gTorqueSensor.inputs.torque2
	brdkSimInput_0[11].dpName := '%IW.X1.AnalogInput22'; 			//::gBraking.inputs.ai_brakePressureFront
	brdkSimInput_0[12].dpName := '%IW.X1.AnalogInput24'; 			//::gTorqueSensor.inputs.torque1
	brdkSimInput_0[13].dpName := '%IW.X1.AnalogInput18'; 			//::gBraking.inputs.ai_brakePressureRear
	brdkSimInput_0[14].dpName := '%IX.IF6.ST2.DigitalInput07'; //::gSafetyChain.inputs.di_TS_Container
	brdkSimInput_0[15].dpName := '%IX.IF6.ST2.DigitalInput10'; //::gSafetyChain.inputs.di_interlockWheelRL_OK
	brdkSimInput_0[16].dpName := '%IX.IF6.ST2.DigitalInput09'; //::gSafetyChain.inputs.di_supply
	brdkSimInput_0[17].dpName := '%IX.IF6.ST2.DigitalInput03'; //::gSafetyChain.inputs.di_BSPD_OK
	brdkSimInput_0[18].dpName := '%IX.IF6.ST2.DigitalInput01'; //::gSafetyChain.inputs.di_interlockHVD_OK
	brdkSimInput_0[19].dpName := '%IX.IF6.ST2.DigitalInput02'; //::gSafetyChain.inputs.di_interlockTSMP_OK
END_ACTION
	


ACTION forceIO: 
	

	FOR i := 0 TO SIM_INPUTS-1 DO
		brdkSimInput_0[i].enable := gStateMachine.cmd.forceIO;
	END_FOR;		
	
	
	
	brdkSimInput_0[0].setValue  := gSafetyChain.cmd.di_interlockWheelFR_OK; 
	brdkSimInput_0[1].setValue  := gSafetyChain.cmd.di_shutdownRight_OK;
	brdkSimInput_0[2].setValue  := gSafetyChain.cmd.di_interlockWheelFL_OK;
	brdkSimInput_0[3].setValue  := gSafetyChain.cmd.di_interlockWheelRR_OK;
	brdkSimInput_0[4].setValue  := gSafetyChain.cmd.di_shutdownLeft_OK;
	brdkSimInput_0[5].setValue  := gSafetyChain.cmd.di_shutdownCockpit_OK;
	brdkSimInput_0[6].setValue  := gSafetyChain.cmd.di_inertiaSwitch_OK;
	brdkSimInput_0[7].setValue  := gSafetyChain.cmd.di_BOTS_OK;
	brdkSimInput_0[8].setValue  := gSafetyChain.cmd.di_TSMS_OK;
	brdkSimInput_0[9].setValue  := gSteeringAngle.cmd.angleSensor;
	brdkSimInput_0[10].setValue := gTorqueSensor.cmd.torque2;
	brdkSimInput_0[11].setValue := gBraking.cmd.brakePressureFront;
	brdkSimInput_0[12].setValue := gTorqueSensor.cmd.torque1;
	brdkSimInput_0[13].setValue := gBraking.cmd.brakePressureRear; 
	brdkSimInput_0[14].setValue := gSafetyChain.cmd.di_TS_Container;
	brdkSimInput_0[15].setValue := gSafetyChain.cmd.di_interlockWheelRL_OK;
	brdkSimInput_0[16].setValue := gSafetyChain.cmd.di_supply;
	brdkSimInput_0[17].setValue := gSafetyChain.cmd.di_BSPD_OK;
	brdkSimInput_0[18].setValue := gSafetyChain.cmd.di_interlockHVD_OK;
	brdkSimInput_0[19].setValue := gSafetyChain.cmd.di_interlockTSMP_OK;

	
	FOR i := 0 TO SIM_INPUTS-1 DO
		brdkSimInput_0[i]();
	END_FOR;
		
END_ACTION
