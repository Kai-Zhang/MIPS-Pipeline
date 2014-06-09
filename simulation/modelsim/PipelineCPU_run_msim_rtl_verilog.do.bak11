transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/Controller.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/ALU.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/Register.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/PipelineCPU.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/PC_count.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/InstMem.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/IF_ID.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/Extender.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/ID_Ex.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/Mux2.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/Shifter.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/Ex_Mem.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/PCSourceGen.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/ControlHazard.v}
vlog -vlog01compat -work work +incdir+D:/archexp/lab06 {D:/archexp/lab06/ForwardUnit.v}

vlog -vlog01compat -work work +incdir+D:/archexp/lab06/simulation/modelsim {D:/archexp/lab06/simulation/modelsim/PipelineCPU.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  PipelineCPU_vlg_tst

add wave *
view structure
view signals
run -all
