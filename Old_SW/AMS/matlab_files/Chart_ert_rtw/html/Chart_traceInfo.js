function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "Chart"};
	this.sidHashMap["Chart"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S1>"] = {sid: "embedded_test2:1"};
	this.sidHashMap["embedded_test2:1"] = {rtwname: "<S1>"};
	this.rtwnameHashMap["<S1>:1"] = {sid: "embedded_test2:1:1"};
	this.sidHashMap["embedded_test2:1:1"] = {rtwname: "<S1>:1"};
	this.rtwnameHashMap["<S1>:2"] = {sid: "embedded_test2:1:2"};
	this.sidHashMap["embedded_test2:1:2"] = {rtwname: "<S1>:2"};
	this.rtwnameHashMap["<S1>:5"] = {sid: "embedded_test2:1:5"};
	this.sidHashMap["embedded_test2:1:5"] = {rtwname: "<S1>:5"};
	this.rtwnameHashMap["<S1>:3"] = {sid: "embedded_test2:1:3"};
	this.sidHashMap["embedded_test2:1:3"] = {rtwname: "<S1>:3"};
	this.rtwnameHashMap["<S1>:4"] = {sid: "embedded_test2:1:4"};
	this.sidHashMap["embedded_test2:1:4"] = {rtwname: "<S1>:4"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
