######################################################################
#
# File name : DIVU_tb_simulate.do
# Created on: Sun Apr 14 21:30:08 +0800 2024
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.DIVU_tb xil_defaultlib.glbl

do {DIVU_tb_wave.do}

view wave
view structure
view signals

do {DIVU_tb.udo}

run 1000ns
