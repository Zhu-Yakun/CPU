######################################################################
#
# File name : MULT_tb_simulate.do
# Created on: Sun Apr 07 18:51:15 +0800 2024
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.MULT_tb xil_defaultlib.glbl

do {MULT_tb_wave.do}

view wave
view structure
view signals

do {MULT_tb.udo}

run 1000ns
