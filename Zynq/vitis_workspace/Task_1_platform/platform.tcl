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
-hw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_1/Task_1_design_wrapper.xsa}\
-out {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform write
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_1/Task_1_design_wrapper.xsa}
platform clean
platform clean
platform clean
platform generate
platform active {Task_1_platform}
bsp reload
bsp config clocking "false"
bsp reload
platform generate
platform clean
platform clean
platform active {Task_1_platform}
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_1_v2/Task_1_design_wrapper.xsa}
platform clean
platform clean
platform generate
bsp reload
platform config -updatehw {/run/media/christophlehr/4D4C-0071/Zynq_Lab/vivado_workspace/Task_1/Task_1_design_wrapper.xsa}
platform clean
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_1/Task_1_design_wrapper.xsa}
platform clean
platform clean
platform generate
platform active {Task_1_platform}
platform active {Task_1_platform}
platform clean
