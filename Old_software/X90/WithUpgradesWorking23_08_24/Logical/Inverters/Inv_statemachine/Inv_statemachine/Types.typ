
TYPE
	mission_typ : 	STRUCT 
		missionList : ARRAY[0..MAX_MISSIONS]OF STRING[80];
		MpRecipeRegPar_0 : ARRAY[0..MAX_MISSION_PARAMETERS]OF MpRecipeRegPar;
		MpRecipeXml_0 : MpRecipeXml;
		missionOld : missionIndex_typ;
	END_STRUCT;
END_TYPE
