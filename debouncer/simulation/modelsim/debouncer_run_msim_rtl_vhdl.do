transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/glitchinthematrix/EE_214/debouncer/debouncerFSM.vhd}
vcom -93 -work work {/home/glitchinthematrix/EE_214/debouncer/DFF2.vhdl}
vcom -93 -work work {/home/glitchinthematrix/EE_214/debouncer/DFF1.vhdl}

