
(* Control the SC LED *)

ACTION ledSC:
	
 	IF gStateMachine.status.state = STATE_INITIALIZE THEN
		gDashboard.outputs.do_ledSC := SC_ON;
	ELSE 
		IF gSafetyChain.status.scOK_notEnabled = TRUE AND gSafetyChain.status.scOK = FALSE THEN // If safety chain is OK, but enable button is false change to BLINKING
			gDashboard.outputs.do_ledSC := SC_BLINK;
		ELSIF gSafetyChain.status.scOK = TRUE THEN
			gDashboard.outputs.do_ledSC := SC_ON;
		ELSE
			gDashboard.outputs.do_ledSC := SC_OFF;
		END_IF	 
	END_IF
	
END_ACTION	



