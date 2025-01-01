
ACTION AccelerometerInit: 
	accelerometer.constants.VOLTAGE_MIN 			:= 0;
	accelerometer.constants.VOLTAGE_MAX 			:= 10;
	accelerometer.constants.MEASUREMENT_RES		    := 32767;
	accelerometer.constants.SENSOR_SUPPLY_VOLTAGE 	:= 3;
	accelerometer.constants.SENSITIVITY				:= 0.3;
	accelerometer.constants.ZERO_POINT				:= 1.5;
END_ACTION

ACTION Accelerometer:
	
	
	
	// Some calculation of the acceleration in g, based on analog voltage reading.
	accelerometer.status.voltage_x := UDINT_TO_REAL((accelerometer.constants.VOLTAGE_MAX - accelerometer.constants.VOLTAGE_MIN) * accelerometer.input.x_direction) / accelerometer.constants.MEASUREMENT_RES; 
	accelerometer.status.acceleration_x := (accelerometer.status.voltage_x - accelerometer.constants.ZERO_POINT) / accelerometer.constants.SENSITIVITY;

	// Some calculation of the acceleration in g, based on analog voltage reading.
	accelerometer.status.voltage_y := UDINT_TO_REAL((accelerometer.constants.VOLTAGE_MAX - accelerometer.constants.VOLTAGE_MIN) * accelerometer.input.y_direction) / accelerometer.constants.MEASUREMENT_RES; 
	accelerometer.status.acceleration_y := (accelerometer.status.voltage_y - accelerometer.constants.ZERO_POINT) / accelerometer.constants.SENSITIVITY;
	
	// Some calculation of the acceleration in g, based on analog voltage reading.
	accelerometer.status.voltage_z := UDINT_TO_REAL((accelerometer.constants.VOLTAGE_MAX - accelerometer.constants.VOLTAGE_MIN) * accelerometer.input.z_direction) / accelerometer.constants.MEASUREMENT_RES; 
	accelerometer.status.acceleration_z := (accelerometer.status.voltage_z - accelerometer.constants.ZERO_POINT) / accelerometer.constants.SENSITIVITY;
	
END_ACTION
