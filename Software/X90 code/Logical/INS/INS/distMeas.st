
ACTION distanceMeasurement: 

	// dt = cycletime
	// h = ms/(1000*60*60) => h = ms/(3600000)
	distDelta := gINS.data.actLonVelocity_kmh * (UDINT_TO_REAL(cycletime)/3600000.0);
	
	// Increment distance traveled by distance delta
	gINS.data.actDistTraveledKm := gINS.data.actDistTraveledKm + distDelta;
	
	// Calculate the distance in meters as well
	gINS.data.actDistTraveledM := gINS.data.actDistTraveledKm*1000.0;
		
END_ACTION
