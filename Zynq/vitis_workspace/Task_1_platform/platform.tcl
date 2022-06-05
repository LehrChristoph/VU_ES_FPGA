# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace/Task_1_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace/Task_1_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Task_1_platform}\
-hw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_1/Task_1_platform.xsa}\
-out {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {Task_1_platform}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform clean
platform clean
