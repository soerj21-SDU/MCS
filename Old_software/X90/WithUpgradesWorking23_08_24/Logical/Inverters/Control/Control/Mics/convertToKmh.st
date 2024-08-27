
ACTION convertToKmh: 
	constant.GEAR_RATIO	  := 11.0118;
	constant.WHEEL_RADIUS := 0.195;
	constant.PI 		  := 3.141592;
	
	FOR i := 0 TO INVERTER_COUNT DO
		// Convert from RPM to KMH
		// Speed in km/h					=  (             Number of wheel rotations                ) * (       Wheel distance traveled	      ) * (m/min to km/h)
		gInverters.inverter[i].data.actualVelocityKmh := (gInverters.inverter[i].data.actualVelocity / constant.GEAR_RATIO) * (constant.WHEEL_RADIUS * 2 * constant.PI) * 0.06; 
	END_FOR;
	
	
END_ACTION
