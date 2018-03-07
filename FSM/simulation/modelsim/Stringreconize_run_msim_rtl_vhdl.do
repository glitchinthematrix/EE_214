transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/EE224_Components.vhd}
vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/DFF.vhdl}
vcom -93 -work work {/home/glitchinthematrix/EE_214/FSM/FSMgun.vhd}
