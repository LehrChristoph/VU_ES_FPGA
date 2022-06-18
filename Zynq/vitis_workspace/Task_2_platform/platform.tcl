# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace/Task_2_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace/Task_2_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Task_2_platform}\
-hw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}\
-out {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vitis_workspace}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {Task_2_platform}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate -domains 
platform clean
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform clean
platform generate
platform clean
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate
platform clean
platform generate
platform generate
platform clean
platform generate
platform clean
platform generate
platform active {Task_2_platform}
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate -domains 
platform clean
platform generate
platform clean
platform generate
domain active {zynq_fsbl}
bsp reload
domain active {standalone_ps7_cortexa9_0}
bsp reload
platform generate -domains 
platform active {Task_2_platform}
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform generate
platform clean
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform clean
platform generate
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate -domains 
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate -domains 
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate -domains 
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate -domains 
platform clean
platform clean
platform generate
platform clean
platform clean
platform generate
platform generate -domains 
platform active {Task_2_platform}
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate -domains 
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate -domains 
platform clean
platform generate
platform clean
platform generate
platform active {Task_2_platform}
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate -domains 
platform clean
platform generate
platform clean
platform clean
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate
platform active {Task_2_platform}
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform generate
platform clean
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform generate
platform config -updatehw {/home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2_design_wrapper.xsa}
platform clean
platform generate
platform clean
