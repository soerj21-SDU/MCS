
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	
	
	

	calculateSensorNetOut_0(input := gSensorNet.data.coolingTemp1.input, polyCoeffs := gSensorNet.data.coolingTemp1.polyCoeffs);
	gSensorNet.data.coolingTemp1.value := calculateSensorNetOut_0.output;
	
	
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

