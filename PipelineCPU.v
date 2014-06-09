module PipelineCPU(
input clk,
output [31:0]PC_out,Inst_IF_out,Inst_ID_out,
output [31:0]A_in_out,B_in_out,ALU_out_out,Shift_out_out,Rs_out_out,Rt_out_out,
output [4:0]Rs_ID_out,Shift_amount_out,
output [1:0]ALUSrcB_Ex_out,
output Shift_amountSrc_ID,
output Shift_amountSrc_Ex,
output [31:0]PCP4_IF
);
wire [31:0]PC;
//wire [31:0]PCP4_IF;
wire [31:0]PC_branch,PC_jump,NextPC;
wire [1:0]PCSource;
wire Keep;
assign PCP4_IF=PC+4;
assign NextPC=(PCSource==2'b0)?PCP4_IF:(PCSource==2'b01)?PC_branch:PC_jump;
wire [31:0]Inst_IF;
//IF Register
PC_count pc(clk,keep,NextPC,PC);
InstMem IM(PC,Inst_IF);
//IF
wire Reset_IF_ID,Keep_IF_ID,Reset_IF_Ex,Keep_IF_Ex;
wire [31:0]PCP4_ID,PCP4_Ex;
wire [31:0]Inst_ID,Inst_Ex;
IF_ID IF_ID_Reg(clk,Reset_IF_ID,Keep_IF_ID,PCP4_IF,Inst_IF,PCP4_ID,Inst_ID);

//ID 
wire [5:0]op,func;
wire [4:0]Rs_ID,Rt_ID,Rd_ID,Shamt_ID,Shamt_Ex;
wire [4:0]Rs_Ex,Rt_Ex,Rd_Ex,Rd_Mem,Rd_Wr;
wire [15:0]offset;
wire [31:0]LoadAddr;
wire [25:0]Target_ID,Target_Ex;
wire [1:0]LoadByte_ID,LoadByte_Ex;
wire [31:0]offset_ID,offset_Ex;
wire [31:0]Rs_out_ID,Rt_out_ID,Rd_in_ID;
wire [31:0]Rs_out_Ex,Rt_out_Ex;
wire [3:0]Rd_write_by_en_Ex,Rd_write_by_en_Mem,Rd_write_by_en;
wire Ext_op_ID;
wire RegWr_ID,RegWr_Ex,RegWr_Mem,RegWr_Wr;
assign op=Inst_ID[31:26];
assign Rs_ID=Inst_ID[25:21];
assign Rs_ID_out=Rs_ID;
assign Rt_ID=Inst_ID[20:16];
assign Rd_ID=Inst_ID[15:11];
assign Shamt_ID=Inst_ID[10:6];
assign func=Inst_ID[5:0];
assign offset=Inst_ID[15:0];
assign Target_ID=Inst_ID[25:0];
assign LoadAddr=offset_ID+PCP4_ID;
assign LoadByte_ID=LoadAddr[1:0];
assign Rd_write_by_en=Rd_write_by_en_Mem;
Extender extend(Ex_top_ID,offset,offset_ID);
Register register(clk,Rs_ID,Rt_ID,Rd_ID,Rd_in_ID,RegWr_Mem,Rd_write_by_en_Mem,Rs_out_ID,Rt_out_ID);
//Control Part
wire [3:0]ALU_op_ID,ALU_op_Ex;
wire [1:0]ALUSrcA;
wire [1:0]ALUSrcB_ID,ALUSrcB_Ex;
wire [1:0]Shift_op_ID,Shift_op_Ex;
wire [4:0]Shift_amount_ID;
wire ALUShift_Sel_ID,ALUShift_Sel_Ex;
wire RegDst_ID,RegDst_Ex;
//wire Shift_amountSrc_ID,Shift_amountSrc_Ex;
wire Jump_ID,Jump_Ex,Jump_Mem;
wire RegDt0_ID,RegDt0_Ex;
wire [2:0]Condition_ID,Condition_Ex,Condition_Mem;
Controller control(op,func,Shamt_ID,Rs_ID,Rt_ID,Ext_op_ID,RegDst_ID,Shift_amountSrc_ID,Jump_ID,ALUShift_Sel_ID,Regdt0_ID,
ALU_op_ID,Shift_op_ID,ALUSrcB_ID,Condition_ID,RegWr_ID);

ID_Ex ID_Ex_Reg(clk,Rs_ID,Rt_ID,Rd_ID,Rs_out_ID,Rt_out_ID,offset_ID,RegDst_ID,Shift_amountSrc_ID,Jump_ID,ALUShift_Sel_ID,Regdt0_ID,
ALU_op_ID,Shift_op_ID,ALUSrcB_ID,Condition_ID,RegWr_ID,PCP4_ID,Target_ID,Shamt_ID,Rs_Ex,Rt_Ex,Rd_Ex,Rs_out_Ex,Rt_out_Ex,
offset_Ex,RegDst_Ex,Shift_amountSrc_Ex,Jump_Ex,ALUShift_Sel_Ex,Regdt0_Ex,ALU_op_Ex,
Shift_op_Ex,ALUSrcB_Ex,Condition_Ex,RegWr_Ex,PCP4_Ex,Target_Ex,Shamt_Ex);

//Ex Part
wire [31:0]PC_Ex,PC_jump_Ex,PC_jump_Mem,PC_branch_Ex,PC_branch_Mem;
wire [31:0]A,B,ALU_out,Shift_out,ALUShift_out_Ex,ALUShift_out_Mem;
wire Zero,Zero_Ex,Zero_Mem,Overflow,Overflow_Ex,Overflow_Mem,Less,Less_Ex,Less_Mem;
wire [4:0]Shift_amount;
wire [2:0]ALUSrcB;
wire [31:0]Result_out;
assign PC_Ex=PCP4_Ex-4;
assign PC_jump_Ex={PC_Ex[31:28],Target_Ex,2'b0};
assign PC_branch_Ex=PCP4_Ex+(offset_Ex<<2);
assign A=(ALUSrcA==2'b0)?Rs_out_Ex:(ALUSrcA==2'b1)?ALUShift_out_Ex:Result_out;
assign B=(ALUSrcB==2'b0)?Rt_out_Ex:(ALUSrcB==2'b1)?offset_Ex:(ALUSrcB==2'b10)?ALUShift_Sel_Ex:Result_out;
ALU alu(A,B,ALU_op_Ex,Zero,Less,Overflow,ALU_out);
assign Shift_amount=(Shift_amountSrc_Ex==0)?Shamt_Ex:Rs_out_Ex[4:0];
assign Shift_amount_out=Shift_amount;
Shifter shifter(Rt_out_Ex,Shift_amount,Shift_op_Ex,Shift_out);
assign ALUShift_out_Ex=(ALUShift_Sel_Ex==0)?ALU_out:Shift_out;
assign ALUSrcB_Ex_out=ALUSrcB_Ex;
//assign Rd_in=ALUShift_out_Ex;
assign Rd_write_by_en_Ex=(Overflow==1)?4'b0:4'b1111;
assign Less_Ex=Less;
assign Overflow_Ex=Overflow;
assign Zero_Ex=Zero;	
//Mem Part

Ex_Mem Ex_mem_Reg(clk,Reset,PC_branch_Ex,PC_jump_Ex,ALUShift_out_Ex,Rd_write_by_en_Ex,
Jump_Ex,Less_Ex,Zero_Ex,Overflow_Ex,Condition_Ex,RegWr_Ex,Rd_Ex,PC_branch_Mem,PC_jump_Mem,ALUShift_out_Mem,Rd_write_by_en_Mem,
Jump_Mem,Less_Mem,Zero_Mem,Overflow_Mem,Condition_Mem,RegWr_Mem,Rd_Mem);
PCSourceGen PCSrc(PC_branch_Mem,PC_jump_Mem,Condition_Mem,Less_Mem,Zero_Mem,Jump_Mem,PCSource,PC_branch,PC_jump);

//Mem_Wr Reg


//Wr Part

//Output Part 
assign PC_out=PC_Ex;
assign Inst_IF_out=Inst_IF;
assign Inst_ID_out=Inst_ID;
assign ALU_out_out=ALU_out;
assign A_in_out=A;
assign B_in_out=B;
assign Shift_out_out=Shift_out;
assign Rs_out_out=Rs_out_Ex;
assign Rt_out_out=Rt_out_Ex;
ControlHazard ch(Keep,Reset);
ForwardUnit fw(Rs_Ex,Rt_Ex,Rd_Mem,Rd_Wr,RegWr_Mem,RegWr_Wr,ALUSrcB_Ex,ALUSrcA,ALUSrcB);

endmodule
