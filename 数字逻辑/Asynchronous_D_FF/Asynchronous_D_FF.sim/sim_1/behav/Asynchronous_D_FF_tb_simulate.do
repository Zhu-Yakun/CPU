######################################################################
#
# File name : Asynchronous_D_FF_tb_simulate.do
# Created on: Sun Nov 12 11:00:57 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.Asynchronous_D_FF_tb xil_defaultlib.glbl

do {Asynchronous_D_FF_tb_wave.do}

view wave
view structure
view signals

do {Asynchronous_D_FF_tb.udo}

run 1000ns
