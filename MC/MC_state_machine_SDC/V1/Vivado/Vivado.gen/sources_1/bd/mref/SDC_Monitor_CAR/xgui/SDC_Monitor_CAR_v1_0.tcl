# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ClK_divider" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NO_OF_SDC_NODES" -parent ${Page_0}


}

proc update_PARAM_VALUE.ClK_divider { PARAM_VALUE.ClK_divider } {
	# Procedure called to update ClK_divider when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ClK_divider { PARAM_VALUE.ClK_divider } {
	# Procedure called to validate ClK_divider
	return true
}

proc update_PARAM_VALUE.NO_OF_SDC_NODES { PARAM_VALUE.NO_OF_SDC_NODES } {
	# Procedure called to update NO_OF_SDC_NODES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NO_OF_SDC_NODES { PARAM_VALUE.NO_OF_SDC_NODES } {
	# Procedure called to validate NO_OF_SDC_NODES
	return true
}


proc update_MODELPARAM_VALUE.NO_OF_SDC_NODES { MODELPARAM_VALUE.NO_OF_SDC_NODES PARAM_VALUE.NO_OF_SDC_NODES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NO_OF_SDC_NODES}] ${MODELPARAM_VALUE.NO_OF_SDC_NODES}
}

proc update_MODELPARAM_VALUE.ClK_divider { MODELPARAM_VALUE.ClK_divider PARAM_VALUE.ClK_divider } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ClK_divider}] ${MODELPARAM_VALUE.ClK_divider}
}

