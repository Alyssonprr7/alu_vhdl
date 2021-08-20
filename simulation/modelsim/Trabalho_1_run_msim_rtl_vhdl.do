transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/calindra/Documentos/Trabalho_1/adderSubtractor.vhd}
vcom -93 -work work {/home/calindra/Documentos/Trabalho_1/binary_to_7_seg.vhd}
vcom -93 -work work {/home/calindra/Documentos/Trabalho_1/alu.vhd}
vcom -93 -work work {/home/calindra/Documentos/Trabalho_1/interface.vhd}
vcom -93 -work work {/home/calindra/Documentos/Trabalho_1/counter.vhd}
vcom -93 -work work {/home/calindra/Documentos/Trabalho_1/interfaceWithCounter.vhd}

