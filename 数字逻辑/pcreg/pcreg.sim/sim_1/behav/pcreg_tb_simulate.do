######################################################################
#
# File name : pcreg_tb_simulate.do
# Created on: Sun Nov 12 11:54:38 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.pcreg_tb xil_defaultlib.glbl

do {pcreg_tb_wave.do}

view wave
view structure
view signals

do {pcreg_tb.udo}

run 1000ns
