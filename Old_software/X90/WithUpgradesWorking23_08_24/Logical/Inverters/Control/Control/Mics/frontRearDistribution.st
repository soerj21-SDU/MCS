
ACTION frontRearDistributionInit: 
//	// Static Front/Rear distribution
	
	

	
	
	
	
//	// 0.00   => No power on front, all power on rear
//	// 100.00 => Equal amount on front and rear
//	// 200.00 => All power on front, no power on rear
//	constant.FRONT_DISTRIBUTION				:= 100.0;
//	
//	
//	// Initialize values
//	FOR i := 0 TO INVERTER_COUNT DO
//		IF brdkStrCmp(ADR(gInverter[i].status.locationFrontBack), ADR('F')) = 0 THEN
//			gInverter[i].status.deratingFrontRearDistribution := constant.FRONT_DISTRIBUTION;
//		ELSE
//			gInverter[i].status.deratingFrontRearDistribution := 100.0 - constant.FRONT_DISTRIBUTION;
//		END_IF;
//	END_FOR;
//END_ACTION
//
//ACTION frontRearDistributionCyclic: 
//	// If static front/rear distribution is enabled add the distribution to the default amount
//	IF EDGEPOS(gInverters.cmd.enableFrontRearDistribution) THEN
//		// Write default values to front/rear distribution
//		FOR i := 0 TO INVERTER_COUNT DO
//			IF brdkStrCmp(ADR(gInverter[i].status.locationFrontBack), ADR('F')) = 0 THEN
//				gInverter[i].status.deratingFrontRearDistribution := constant.FRONT_DISTRIBUTION;
//			ELSE
//				gInverter[i].status.deratingFrontRearDistribution := 200.0 - constant.FRONT_DISTRIBUTION;
//			END_IF;
//		END_FOR;
//	END_IF;
//	
//	IF gInverters.cmd.enableFrontRearDistribution THEN
//		IF i <> 0 THEN	// Inverter 0 is used as the input
//			IF brdkStrCmp(ADR(gInverter[i].status.locationFrontBack), ADR('F')) = 0 THEN
//				// If inverter is in the front
//				gInverter[i].status.deratingFrontRearDistribution := gInverter[0].status.deratingFrontRearDistribution;
//			ELSE
//				// If the inverter is in the back
//				gInverter[i].status.deratingFrontRearDistribution := 200.0 - gInverter[0].status.deratingFrontRearDistribution;
//			END_IF;
//		END_IF;
//		
//	ELSE
//		// Distribution disabled
//		gInverter[i].status.deratingFrontRearDistribution := 100.0;
//	END_IF
//	// Convert from range [0, 200] to range [0,2]
//	gInverter[i].data.deratingFrontRearDistribution := gInverter[i].status.deratingFrontRearDistribution / 100.0;
END_ACTION

ACTION frontRearDistributionCyclic:
	gInverters.data.powerBias[0] := (1 - gInverters.data.rearBias) / 2;
	gInverters.data.powerBias[1] := (1 - gInverters.data.rearBias) / 2;
	gInverters.data.powerBias[2] := (gInverters.data.rearBias) / 2;
	gInverters.data.powerBias[3] := (gInverters.data.rearBias) / 2;
END_ACTION
