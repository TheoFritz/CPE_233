@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto f7414b1030d444f3b3dca70336423e08 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot ALU_TB_behav xil_defaultlib.ALU_TB -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
