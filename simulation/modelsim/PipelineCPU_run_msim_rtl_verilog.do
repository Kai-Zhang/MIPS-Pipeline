transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/Memory.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/Muxs.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/Controller.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/ALU.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/Register.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/PipelineCPU.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/PC_count.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/IF_ID.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/Extender.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/ID_Ex.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/Shifter.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/Ex_Mem.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/PCSourceGen.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/Mem_Wr.v}
vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06 {D:/Documents/GitRepository/colab06/LoadProcess.v}

vlog -vlog01compat -work work +incdir+D:/Documents/GitRepository/colab06/simulation/modelsim {D:/Documents/GitRepository/colab06/simulation/modelsim/PipelineCPU.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  PipelineCPU_vlg_tst

add wave *
view structure
view signals
run -all
