function CodeMetrics() {
	 this.metricsArray = {};
	 this.metricsArray.var = new Array();
	 this.metricsArray.fcn = new Array();
	 this.metricsArray.var["DW_l"] = {file: "C:\\Master_project_windows\\Simulink\\Chart_ert_rtw\\stateflow_test.c",
	size: 2};
	 this.metricsArray.var["M_"] = {file: "C:\\Master_project_windows\\Simulink\\Chart_ert_rtw\\stateflow_test.c",
	size: 4};
	 this.metricsArray.var["U"] = {file: "C:\\Master_project_windows\\Simulink\\Chart_ert_rtw\\stateflow_test.c",
	size: 1};
	 this.metricsArray.var["Y"] = {file: "C:\\Master_project_windows\\Simulink\\Chart_ert_rtw\\stateflow_test.c",
	size: 2};
	 this.metricsArray.fcn["Chart_initialize"] = {file: "C:\\Master_project_windows\\Simulink\\Chart_ert_rtw\\stateflow_test.c",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["Chart_step"] = {file: "C:\\Master_project_windows\\Simulink\\Chart_ert_rtw\\stateflow_test.c",
	stack: 0,
	stackTotal: 0};
	 this.getMetrics = function(token) { 
		 var data;
		 data = this.metricsArray.var[token];
		 if (!data) {
			 data = this.metricsArray.fcn[token];
			 if (data) data.type = "fcn";
		 } else { 
			 data.type = "var";
		 }
	 return data; }; 
	 this.codeMetricsSummary = '<a href="Chart_metrics.html">Global Memory: 9(bytes) Maximum Stack: 0(bytes)</a>';
	}
CodeMetrics.instance = new CodeMetrics();
