######################################################################
#
# File name : _246tb_ex10_tb_simulate.do
# Created on: Fri Jul 12 19:46:59 +0800 2024
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L unisims_ver -L unimacro_ver -L secureip -L dist_mem_gen_v8_0_10 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib._246tb_ex10_tb xil_defaultlib.glbl

do {_246tb_ex10_tb_wave.do}

view wave
view structure
view signals

do {_246tb_ex10_tb.udo}

run 1000ns
