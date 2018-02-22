# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.cache/wt [current_project]
set_property parent.project_path C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/imports/new/ALU.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/imports/new/ALU_MUX.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/imports/new/CONTROL_UNIT.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/imports/new/C_FLAG_FF.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/imports/new/FLAGS.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/imports/new/RAT_MCU.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/imports/new/REG_FILE.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/imports/new/REG_MUX.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/imports/new/Z_FLAG_FF.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/imports/new/pc_mux.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/prog_rom.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/imports/new/program_counter.vhd
  C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/sources_1/new/RAT_WRAPPER.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/constrs_1/imports/BASYS_FILES/Basys3_constraints.xdc
set_property used_in_implementation false [get_files C:/Users/dgaiero/Documents/School/College/Year_2/Quarter_2/CPE_233/RAT_6/VIVADO/RAT_6.srcs/constrs_1/imports/BASYS_FILES/Basys3_constraints.xdc]


synth_design -top RAT_wrapper -part xc7a35tcpg236-1


write_checkpoint -force -noxdef RAT_wrapper.dcp

catch { report_utilization -file RAT_wrapper_utilization_synth.rpt -pb RAT_wrapper_utilization_synth.pb }
