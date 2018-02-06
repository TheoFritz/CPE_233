@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 4bb7dbfab2254b61b1a72223442b9a75 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot SPEAKER_DRIVER_behav xil_defaultlib.SPEAKER_DRIVER -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
