module ID_Ex(
input clk,
input Reset,
input [4:0]Rs_in,
input [4:0]Rt_in,
input [4:0]Rd_in,
input [31:0]Rs_out_in,
input [31:0]Rt_out_in,
input [31:0]offset_in,
input [15:0]offset_raw_in,
input RegDst_in,
input Shift_amountSrc_in,
input Jump_in,
input ALUShift_Sel_in,
input RegDt0_in,
input [3:0]ALU_op_in,
input [1:0]Shift_op_in,
input [2:0]ALUSrcB_in,
input [2:0]Condition_in,
input [1:0]LoadType_in,LoadByte_in,
input RegWr_in,MemWr_in,MemtoReg_in,Exception_in,
input [31:0]PC_in,
input [25:0]Target_in,
input [4:0]Shamt_in,
output reg [4:0]Rs_out,
output reg [4:0]Rt_out,
output reg [4:0]Rd_out,
output reg [31:0]Rs_out_out,Rt_out_out,
output reg [31:0]offset_out,
output reg [15:0]offset_raw_out,
output reg RegDst_out,
output reg Shift_amountSrc_out,
output reg Jump_out,
output reg ALUShift_Sel_out,
output reg RegDt0_out,
output reg[3:0]ALU_op_out,
output reg [1:0]Shift_op_out,
output reg [2:0]ALUSrcB_out,
output reg [2:0]Condition_out,
output reg [1:0]LoadType_out,LoadByte_out,
output reg RegWr_out,MemWr_out,MemtoReg_out,Exception_out,
output reg [31:0]PC_out,
output reg [25:0]Target_Out,
output reg [4:0]Shamt_out
);
initial
begin 
	Rs_out=0;
	Rt_out=0;
	Rd_out=0;
	Rs_out_out=0;
	Rt_out_out=0;
	offset_out=0;
	offset_raw_out=0;
	RegDst_out=0;
	Shift_amountSrc_out=0;
	Jump_out=0;
	ALUShift_Sel_out=0;
	RegDt0_out=0;
	ALU_op_out=0;
	Shift_op_out=0;
	ALUSrcB_out=0;
	Condition_out=0;
	PC_out=0;
	Target_Out=0;
	Shamt_out=0;
	LoadType_out=0;
	LoadByte_out=0;
	RegWr_out=0;
	MemWr_out=0;
	MemtoReg_out=0;
	Exception_out=0;
end 
always @(negedge clk)
begin
if (Reset)
begin
	Rs_out<=0;
	Rt_out<=0;
	Rd_out<=0;
	Rs_out_out<=0;
	Rt_out_out<=0;
	offset_out<=0;
	offset_raw_out<=0;
	RegDst_out<=0;
	Shift_amountSrc_out<=0;
	Jump_out<=0;
	ALUShift_Sel_out<=0;
	RegDt0_out<=0;
	ALU_op_out<=0;
	Shift_op_out<=0;
	ALUSrcB_out<=0;
	Condition_out<=0;
	PC_out<=0;
	Target_Out<=0;
	Shamt_out<=0;
	LoadType_out<=0;
	LoadByte_out<=0;
	RegWr_out<=0;
	MemWr_out<=0;
	MemtoReg_out<=0;
	Exception_out<=0;
end
else
begin 
	Rs_out<=Rs_in;
	Rt_out<=Rt_in;
	Rd_out<=Rd_in;
	Rs_out_out<=Rs_out_in;
	Rt_out_out<=Rt_out_in;
	offset_out<=offset_in;
	offset_raw_out<=offset_raw_in;
	RegDst_out<=RegDst_in;
	Shift_amountSrc_out<=Shift_amountSrc_in;
	Jump_out<=Jump_in;
	ALUShift_Sel_out<=ALUShift_Sel_in;
	RegDt0_out<=RegDt0_in;
	ALU_op_out<=ALU_op_in;
	Shift_op_out<=Shift_op_in;
	ALUSrcB_out<=ALUSrcB_in;
	Condition_out<=Condition_in;
	PC_out<=PC_in;
	Target_Out<=Target_in;
	Shamt_out<=Shamt_in;
	LoadType_out<=LoadType_in;
	LoadByte_out<=LoadByte_in;
	RegWr_out<=RegWr_in;
	MemWr_out<=MemWr_in;
	MemtoReg_out<=MemtoReg_in;
	Exception_out<=Exception_in;
end
end
endmodule
