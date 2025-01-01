
TYPE
	gDashboard_typ : 	STRUCT 
		status : gDashboard_status_typ;
		inputs : gDashboard_inputs_typ;
		outputs : gDashboard_outputs_typ;
		cmd : gDashboard_cmd_typ;
		data : gDashboard_data_typ;
	END_STRUCT;
	gDashboard_status_typ : 	STRUCT 
		ok : BOOL;
		DashboardDisconnected : BOOL;
		unknownMessageReceived : BOOL;
		unknownMessageID : UDINT;
		timeoutFromDashboard : BOOL;
		canFramesLost : BOOL;
		statusIndex : USINT;
		errorCode : USINT;
	END_STRUCT;
	gDashboard_data_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
	gDashboard_inputs_typ : 	STRUCT 
		di_buttonSafety : BOOL;
		di_buttonTractive : BOOL;
		di_buttonDrive : BOOL;
		di_button1 : BOOL;
		di_button2 : BOOL;
		di_button3 : BOOL;
		di_button4 : BOOL;
	END_STRUCT;
	gDashboard_cmd_typ : 	STRUCT 
		sendVehicleConfigMsg : BOOL;
	END_STRUCT;
	gDashboard_outputs_typ : 	STRUCT 
		do_ledTS_OFF : BOOL;
		do_ledIMD : BOOL;
		do_ledAMS : BOOL;
		do_ledEBS : BOOL;
		do_ledREADY : USINT;
		do_ledSC : USINT;
		do_ledLV : BOOL;
		do_ledDV : BOOL;
		Error : USINT;
		com_error_SC : BOOL;
		com_error_Shunt : BOOL;
		com_error_AMS : BOOL;
		com_error_Datalog : BOOL;
		com_error_Dashboard : BOOL;
		com_error_3rd_Inv : BOOL;
		com_error_2nd_Inv : BOOL;
		com_error_1st_Inv : BOOL;
		com_error_0_Inv : BOOL;
		com_error_INS : BOOL;
		com_error_SteeringAngle : BOOL;
		com_error_BreakPressure_Front : BOOL;
		com_error_BreakPressure_Back : BOOL;
		com_error_TorquePedal : BOOL;
		com_error_TorquePedal_Plausi : BOOL;
		com_error_RTDS : BOOL;
		com_error_Cooling : BOOL;
		com_error_LV : BOOL;
		com_error_HighTemperature : BOOL;
	END_STRUCT;
END_TYPE
