
ACTION history: 
	// Power history
//	TON_history.PT := T#10ms;
//	TON_history.IN := TRUE;
//	IF TON_history.Q THEN
//		FOR i := 999 TO 1 BY -1 DO
//			FOR j := 0 TO 3 DO
//				gInverter[j].data.history.actualVelocityKmh[i] 		 := gInverter[j].data.history.actualVelocityKmh[i-1];
//				gInverter[j].data.history.com_targetTorque[i] 		 := gInverter[j].data.history.com_targetTorque[i-1];
//				gInverter[j].data.history.deratingTotalPercentage[i] := gInverter[j].data.history.deratingTotalPercentage[i-1];
//				gInverter[j].data.history.steeringAngle[i] 			 := gInverter[j].data.history.steeringAngle[i-1];
//				gInverter[j].data.history.torqueMax[i] 				 := gInverter[j].data.history.torqueMax[i-1];
//				gInverter[j].data.history.torquePercentage[i] 		 := gInverter[j].data.history.torquePercentage[i-1];
//			END_FOR;
//		END_FOR;
//		FOR j := 0 TO 3 DO
//			gInverter[j].data.history.actualVelocityKmh[i] 		 := gInverter[j].data.actualVelocityKmh;
//			gInverter[j].data.history.com_targetTorque[i] 		 := gInverter[j].outputs.com_targetTorque;
//			gInverter[j].data.history.deratingTotalPercentage[i] := gInverter[j].status.deratingTotalPercent;
//			gInverter[j].data.history.steeringAngle[i] 			 := gSteeringAngle.data.angleDegrees;
//			gInverter[j].data.history.torqueMax[i] 				 := gInverters.data.torqueLimitNm;
//			gInverter[j].data.history.torquePercentage[i] 		 := gTorqueSensor.status.torquePercentage;
//		END_FOR;
//		TON_history.IN := FALSE;
//	END_IF;
//	TON_history();
END_ACTION
