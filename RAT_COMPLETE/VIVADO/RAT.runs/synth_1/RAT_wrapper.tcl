# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/VIVADO/RAT.cache/wt [current_project]
set_property parent.project_path C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/VIVADO/RAT.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/VIVADO/RAT.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/ALU.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/ALU_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/BCD7SEG_8.vhdl
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/CONTROL_UNIT.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/C_FLAG_FF.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/C_FLG_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/FLAGS.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/INTURREPT_WRAPPER.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/I_FLAG.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/Interrupt_Driver.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/RAT_MCU.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/REG_FILE.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/REG_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/SCRATCH_RAM.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/SCR_ADDR_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/SCR_DATA_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/SHAD_C.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/SHAD_Z.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/Z_FLAG_FF.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/Z_FLG_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/pc_mux.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/prog_rom.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/program_counter.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/stack_pointer.vhd
  C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/RAT_WRAPPER.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/Basys3_constraints.xdc
set_property used_in_implementation false [get_files C:/Users/edavis/Documents/CPE_233/RAT_COMPLETE/SRC/Basys3_constraints.xdc]


synth_design -top RAT_wrapper -part xc7a35tcpg236-1


write_checkpoint -force -noxdef RAT_wrapper.dcp

catch { report_utilization -file RAT_wrapper_utilization_synth.rpt -pb RAT_wrapper_utilization_synth.pb }
