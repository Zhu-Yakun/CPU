######################################################################
#
# File name : display7_tb_simulate.do
# Created on: Sun Jan 14 00:46:09 +0800 2024
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.display7_tb xil_defaultlib.glbl

do {display7_tb_wave.do}

view wave
view structure
view signals

do {display7_tb.udo}

run 1000ns
