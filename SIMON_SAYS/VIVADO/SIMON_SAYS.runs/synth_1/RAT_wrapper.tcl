# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/VIVADO/SIMON_SAYS.cache/wt [current_project]
set_property parent.project_path C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/VIVADO/SIMON_SAYS.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Users/edavis/Documents/CPE_233/SIMON_SAYS/VIVADO/SIMON_SAYS.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/ALU.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/ALU_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/BCD7SEG_8.vhdl
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/CONTROL_UNIT.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/C_FLAG_FF.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/C_FLG_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/FLAGS.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/INTURREPT_WRAPPER.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/I_FLAG.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/LATCH.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/RAND_NUM_GEN.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/RAT_MCU.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/REG_FILE.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/REG_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/SCRATCH_RAM.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/SCR_ADDR_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/SCR_DATA_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/SHAD_C.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/SHAD_Z.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/Z_FLAG_FF.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/Z_FLG_MUX.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/ONE_SHOT_DEBOUNCE/counter_for_one_shot.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/ONE_SHOT_DEBOUNCE/debounce_one_shot_FSM.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/pc_mux.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/prog_rom.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/program_counter.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/stack_pointer.vhd
  C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/RAT_WRAPPER.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/Basys3_constraints.xdc
set_property used_in_implementation false [get_files C:/Users/edavis/Documents/CPE_233/SIMON_SAYS/SRC/Basys3_constraints.xdc]


synth_design -top RAT_wrapper -part xc7a35tcpg236-1


write_checkpoint -force -noxdef RAT_wrapper.dcp

catch { report_utilization -file RAT_wrapper_utilization_synth.rpt -pb RAT_wrapper_utilization_synth.pb }
