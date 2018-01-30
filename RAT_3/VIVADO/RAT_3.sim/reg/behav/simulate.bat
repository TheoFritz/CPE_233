@echo off
set xv_path=C:\\Xilinx_Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xsim test_bench_reg_behav -key {Behavioral:reg:Functional:test_bench_reg} -tclbatch test_bench_reg.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
