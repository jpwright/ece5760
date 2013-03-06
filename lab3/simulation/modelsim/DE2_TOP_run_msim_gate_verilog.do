transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {DE2_TOP.vo}

vlog -vlog01compat -work work +incdir+C:/ece5760/lab3 {C:/ece5760/lab3/Audio_Filter_18bit_parallel.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc" audio_test

add wave *
view structure
view signals
run 100 ns
