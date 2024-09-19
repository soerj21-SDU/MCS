
PROGRAM _INIT
	(* Initialize all the sensors *)
	// Braking Pedal Sensor
	BrakingPedalInit;
	
	// Torque Pedal Sensor
	TorquePedalInit;
	
	// Steering Angle Sensor
	SteeringAngleInit;
	 
	// Low voltage battery
	LowVoltageBatteryInit;
END_PROGRAM

PROGRAM _CYCLIC
	
	// Handle Braking Pedal Sensor
	BrakingPedal;
	
	// Handle TorquePedal Sensor
	TorquePedal;
	
	// Handle Braking Pedal Sensor
	SteeringAngle;
	 
	// Low voltage battery
	LowVoltageBattery;
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

