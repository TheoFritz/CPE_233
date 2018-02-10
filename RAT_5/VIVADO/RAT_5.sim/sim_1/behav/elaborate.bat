@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 53b6cf554ed44938aa76c70a2574af4b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot RAT_MCU_behav xil_defaultlib.RAT_MCU -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
