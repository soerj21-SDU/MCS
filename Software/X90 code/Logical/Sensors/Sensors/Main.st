

PROGRAM _INIT
	(* Initialize all the sensors *)
	// Accelerometer
	AccelerometerInit;
	
	// Braking Pedal Sensor
	BrakingPedalInit;
	
	// Torque Pedal Sensor
	TorquePedalInit;
	
	// Steering Angle Sensor
	SteeringAngleInit;
	 
	// Low voltage battery
	LowVoltageBatteryInit;
	
	// Suspension Measurement
	SuspensionMeasInit;
END_PROGRAM

PROGRAM _CYCLIC
	//Accelerometer
	Accelerometer;
	
	// Handle Braking Pedal Sensor
	BrakingPedal;
	
	// Handle TorquePedal Sensor
	TorquePedal;
	
	// Handle Braking Pedal Sensor
	SteeringAngle;
	 
	// Low voltage battery
	LowVoltageBattery;
	
	// Suspension Measurement
	SuspensionMeas;
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

