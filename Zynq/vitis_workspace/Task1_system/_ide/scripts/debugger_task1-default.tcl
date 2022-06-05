# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace/Task1_system/_ide/scripts/debugger_task1-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace/Task1_system/_ide/scripts/debugger_task1-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248686061" && level==0 && jtag_device_ctx=="jsn-Zed-210248686061-23727093-0"}
fpga -file /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace/Task1/_ide/bitstream/Task_1_platform.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace/Task_1_platform/export/Task_1_platform/hw/Task_1_platform.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace/Task1/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace/Task1/Debug/Task1.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
