transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/StringrecFSM.vhd}
vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/FSMTerror.vhd}
vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/DUT.vhd}
vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/DFF1.vhdl}
vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/FSMKnife.vhd}
vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/EE224_Components.vhd}
vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/FSMgun.vhd}
vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/FSMBomb.vhd}

vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
