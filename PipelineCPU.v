module PipelineCPU(
	input clk,
	output [31:0]PC_out,Inst_IF_out,Inst_ID_out,
	output [31:0]A_in,B_in,ALU_out,Shift_out
);

	wire [31:0]PC;
	wire [31:0]PCP4_IF;
	wire [31:0]PC_branch,PC_jump,NextPC;
	wire [1:0]PCSource;
	wire Keep;
	assign PCP4_IF = PC+4;
	assign NextPC = (PCSource==2'b0)?PCP4_IF:(PCSource==2'b1)?PC_branch:PC_jump;
	wire [31:0]Inst_IF;
	//IF Register
	PC_count pc(clk,keep,NextPC,PC);
	InstMem IM(PC,Inst_IF);
	//ID
	wire Reset_IF_ID,Keep_IF_ID,Reset_IF_Ex,Keep_IF_Ex;
	wire [31:0]PCP4_ID,PCP4_Ex;
	wire [31:0]Inst_ID,Inst_Ex;
	IF_ID IF_ID_Reg(clk,Reset_IF_ID,Keep_IF_ID,PCP4_IF,Inst_IF,PCP4_ID,Inst_ID);
	
	//ID 
	wire [6:0]op,func;
	wire [4:0]Rs_ID,Rt_ID,Rd_ID,Shamt_ID;
	wire [4:0]Rs_Ex,Rt_Ex,Rd_Ex;
	wire [15:0]offset;
	wire [31:0]LoadAddr;
	wire [25:0]Target_ID,Target_Ex;
	wire [1:0]LoadByte_ID,LoadByte_Ex;
	wire [31:0]offset_ID,offset_Ex;
	wire [31:0]Rs_out_ID,Rt_out_ID,Rd_in_ID;
	wire [31:0]Rs_out_Ex,Rt_out_Ex;
	wire [3:0]Rd_write_by_en;
	wire Ext_op_ID;
	assign op=Inst_ID[31:26];
	assign Rs_ID=Inst_ID[25:21];
	assign Rt_ID=Inst_ID[20:16];
	assign Rd_ID=Inst_ID[15:11];
	assign Shamt_ID=Inst_ID[10:6];
	assign func=Inst_ID[5:0];
	assign offset=Inst_ID[15:0];
	assign Target_ID=Inst_ID[25:0];
	assign LoadAddr=offset_ID+PCP4_ID;
	assign LoadByte_ID=LoadAddr[1:0];
	
	Extender extend(Ex_top_ID,offset,offset_ID);
	Register register(clk,Rs_ID,Rt_ID,Rd_ID,Rd_in_ID,Rd_write_by_en,Rd_Rs_out_ID,Rt_out_ID);
	
	//Control Part
	wire [3:0]ALU_op_ID,ALU_op_Ex;
	wire ALUSrcA_ID,ALUSrcA_Ex;
	wire [2:0]ALUSrcB_ID,ALUSrcB_Ex;
	wire [1:0]Shift_op_ID,Shift_op_Ex;
	wire [4:0]Shift_amount_ID;
	wire ALUShift_Sel_ID,ALUShift_Sel_Ex;
	wire RegDst_ID,RegDst_Ex;
	wire Shift_amountSrc_ID,Shift_amountSrc_Ex;
	wire Jump_ID,Jump_Ex;
	wire RegDt0_ID,RegDt0_Ex;
	wire [2:0]Condition_ID,Condition_Ex;
	Controller control(op,func,Shamt_ID,Rs_ID,Rt_ID,Ext_op_ID,RegDst_ID,Shift_amountSrc_ID,Jump_ID,ALUShift_Sel_ID,Regdt0_ID,
	ALU_op_ID,Shift_op_ID,ALUSrcB_ID,Condition_ID);
	
	ID_Ex ID_Ex_Reg(clk,Rs_ID,Rt_ID,Rd_ID,offset_ID,RegDst_ID,Shift_amountSrc_ID,Jump_ID,ALUShift_Sel_ID,Regdt0_ID,
	ALU_op_ID,Shift_op_ID,ALUSrcB_ID,Condition_ID,Rs_Ex,Rt_Ex,Rd_Ex,offset_Ex,RegDst_Ex,Shift_amountSrc_Ex,Jump_Ex,
	ALUShift_Sel_Ex,Regdt0_Ex,ALU_op_Ex,Shift_op_Ex,ALUSrcB_Ex,Condition_Ex);
	
	
endmodule
