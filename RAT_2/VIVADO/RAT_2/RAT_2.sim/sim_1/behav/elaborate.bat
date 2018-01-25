@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 70478705404e4b06a2e6b202382b1852 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot test_bench_behav xil_defaultlib.test_bench -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
