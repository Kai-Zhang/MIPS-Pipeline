module Ex_Mem(
input clk,
input Reset,
input [31:0]PC_Branch_in,PC_Jump_in,ALUShift_out_in,
input Jump_in,
input Less_in,
input Zero_in,
input Overflow_in,
input [2:0]Condition_in,
input [1:0]LoadType_in,LoadByte_in,
input RegWr_in,MemWr_in,MemtoReg_in,Exception_in,
input [4:0]Rd_in,
output reg[31:0]PC_Branch_out,PC_Jump_out,ALUShift_out_out,
output reg Jump_out,
output reg Less_out,
output reg Zero_out,
output reg Overflow_out,
output reg[2:0]Condition_out,
output reg [1:0]LoadType_out,LoadByte_out,
output reg RegWr_out,MemWr_out,MemtoReg_out,Exception_out,
output reg [4:0]Rd_out
);
initial 
begin 
	PC_Branch_out=0;
	PC_Jump_out=0;
	ALUShift_out_out=0;
	Jump_out=0;
	Less_out=0;
	Zero_out=0;
	Overflow_out=0;
	Condition_out=0;
	LoadType_out=0;
	LoadByte_out=0;
	RegWr_out=0;
	MemWr_out=0;
	Rd_out=0;
	MemtoReg_out=0;
	Exception_out=0;
end 
always @(negedge clk)
begin 
if (Reset)
begin 
	PC_Branch_out<=0;
	PC_Jump_out<=0;
	ALUShift_out_out<=0;
	Jump_out<=0;
	Less_out<=0;
	Zero_out<=0;
	Overflow_out<=0;
	Condition_out<=0;
	LoadType_out<=0;
	LoadByte_out<=0;
	RegWr_out<=0;
	MemWr_out<=0;
	Rd_out<=0;
	MemtoReg_out<=0;
	Exception_out<=0;
end 
else 
begin 
	PC_Branch_out<=PC_Branch_in;
	PC_Jump_out<=PC_Jump_in;
	ALUShift_out_out<=ALUShift_out_in;
	Jump_out<=Jump_in;
	Less_out<=Less_in;
	Zero_out<=Zero_in;
	Overflow_out<=Overflow_in;
	Condition_out<=Condition_in;
	LoadType_out<=LoadType_in;
	LoadByte_out<=LoadByte_in;
	RegWr_out<=RegWr_in;
	MemWr_out<=MemWr_in;
	Rd_out<=Rd_in;
	MemtoReg_out<=MemtoReg_in;
	Exception_out<=Exception_in;
end 
end 

endmodule
