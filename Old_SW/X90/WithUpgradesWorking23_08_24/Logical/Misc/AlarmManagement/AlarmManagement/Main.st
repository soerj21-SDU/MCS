
PROGRAM _INIT
	MpAlarmXCore_0.MpLink 		:= ADR(gAlarmXCore);
	MpAlarmXCore_0.Enable 		:= TRUE;
	
	MpAlarmXListUI_0.MpLink 	:= ADR(gAlarmXCore);
	MpAlarmXListUI_0.UIConnect 	:= ADR(MpAlarmXListUIConnectType_0);
	MpAlarmXListUI_0.Enable 	:= TRUE;
	
	
END_PROGRAM

PROGRAM _CYCLIC
	(* Alarm *)
	MpAlarmXCore_0();
	MpAlarmXListUI_0();
	 
END_PROGRAM

PROGRAM _EXIT
	
	MpAlarmXCore_0(Enable:=FALSE);
	MpAlarmXListUI_0(Enable:=FALSE);
	 
END_PROGRAM

