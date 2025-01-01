
ACTION SuspensionMeasInit: 
	suspension.constants.VOLTAGE_MIN 			:= 0;
	suspension.constants.VOLTAGE_MAX 			:= 32;
	suspension.constants.MEASUREMENT_RES		:= 32767;
	suspension.constants.SENSOR_SUPPLY_VOLTAGE 	:= 24;
	suspension.constants.TRAVEL_RES				:= 50; // [mm]
END_ACTION


ACTION SuspensionMeas: 
	// Some calculation of the suspension travel in mm, based on analog voltage reading.
	suspension.status.voltageFL := UDINT_TO_REAL((suspension.constants.VOLTAGE_MAX - suspension.constants.VOLTAGE_MIN) * suspension.input.linearPosSensor[0]) / suspension.constants.MEASUREMENT_RES; 
	suspension.status.travelFL 	:= suspension.status.voltageFL/suspension.constants.SENSOR_SUPPLY_VOLTAGE * suspension.constants.TRAVEL_RES;

	// Some calculation of the suspension travel in mm, based on analog voltage reading.
	suspension.status.voltageRL := UDINT_TO_REAL((suspension.constants.VOLTAGE_MAX - suspension.constants.VOLTAGE_MIN) * suspension.input.linearPosSensor[1]) / suspension.constants.MEASUREMENT_RES; 
	suspension.status.travelRL 	:= suspension.status.voltageRL/suspension.constants.SENSOR_SUPPLY_VOLTAGE * suspension.constants.TRAVEL_RES;
	
	// Some calculation of the suspension travel in mm, based on analog voltage reading.
	suspension.status.voltageFR := UDINT_TO_REAL((suspension.constants.VOLTAGE_MAX - suspension.constants.VOLTAGE_MIN) * suspension.input.linearPosSensor[2]) / suspension.constants.MEASUREMENT_RES; 
	suspension.status.travelFR 	:= suspension.status.voltageFR/suspension.constants.SENSOR_SUPPLY_VOLTAGE * suspension.constants.TRAVEL_RES;
	
	// Some calculation of the suspension travel in mm, based on analog voltage reading.
	suspension.status.voltageRR := UDINT_TO_REAL((suspension.constants.VOLTAGE_MAX - suspension.constants.VOLTAGE_MIN) * suspension.input.linearPosSensor[3]) / suspension.constants.MEASUREMENT_RES; 
	suspension.status.travelRR	:= suspension.status.voltageRR/suspension.constants.SENSOR_SUPPLY_VOLTAGE * suspension.constants.TRAVEL_RES;
END_ACTION