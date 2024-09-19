	
ACTION rangeEstimation:
	(* Handle timer *)
	TON_rangEstTimer.IN := TRUE;
	TON_rangEstTimer();
	
	socActual 	:= gAMS.data.stateOfCharge;
	distActual 	:= gINS.data.actDistTraveledKm;
	
	(* If timeout occurs *)
	IF TON_rangEstTimer.Q THEN
		(* Reset Timer *)
		TON_rangEstTimer(IN := FALSE);
		(* if the previous SoC is higher *)
		IF socActual < socPrevious THEN	
			(* Calculate next value in range estimation *)
			MTFilterMovingAverage_0(In := LIMIT(0,distPrevious - (socPrevious*(distActual-distPrevious))/(socActual-socPrevious),50));
			gINS.data.distEstimated := MTFilterMovingAverage_0.Out;
			(* Previous SoC is lower than new, indication of charging *)
		END_IF;
		distPrevious := gINS.data.actDistTraveledKm;
		socPrevious  := gAMS.data.stateOfCharge;
	END_IF;
END_ACTION
