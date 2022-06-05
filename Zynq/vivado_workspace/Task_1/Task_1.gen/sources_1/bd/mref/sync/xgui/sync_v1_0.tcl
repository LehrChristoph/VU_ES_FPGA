# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "RESET_VALUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SYNC_STAGES" -parent ${Page_0}


}

proc update_PARAM_VALUE.RESET_VALUE { PARAM_VALUE.RESET_VALUE } {
	# Procedure called to update RESET_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RESET_VALUE { PARAM_VALUE.RESET_VALUE } {
	# Procedure called to validate RESET_VALUE
	return true
}

proc update_PARAM_VALUE.SYNC_STAGES { PARAM_VALUE.SYNC_STAGES } {
	# Procedure called to update SYNC_STAGES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SYNC_STAGES { PARAM_VALUE.SYNC_STAGES } {
	# Procedure called to validate SYNC_STAGES
	return true
}


proc update_MODELPARAM_VALUE.SYNC_STAGES { MODELPARAM_VALUE.SYNC_STAGES PARAM_VALUE.SYNC_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SYNC_STAGES}] ${MODELPARAM_VALUE.SYNC_STAGES}
}

proc update_MODELPARAM_VALUE.RESET_VALUE { MODELPARAM_VALUE.RESET_VALUE PARAM_VALUE.RESET_VALUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RESET_VALUE}] ${MODELPARAM_VALUE.RESET_VALUE}
}

