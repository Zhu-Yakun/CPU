######################################################################
#
# File name : alu_tb_simulate.do
# Created on: Mon Dec 04 22:56:45 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.alu_tb xil_defaultlib.glbl

do {alu_tb_wave.do}

view wave
view structure
view signals

do {alu_tb.udo}

run 1000ns
