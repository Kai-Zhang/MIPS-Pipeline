module Mem_Wr(
input clk,
input Reset,
input [31:0]ALUShift_out_in,Data_in,
input [3:0]Rd_write_by_en_in,
input Overflow_in,
input RegWr_in,MemtoReg_in,
input [4:0]Rd_in,
output reg[31:0]ALUShift_out_out,
output reg[3:0]Rd_write_by_en_out,
output reg [31:0]Data_out,
output reg Overflow_out,
output reg RegWr_out,MemtoReg_out,
output reg [4:0]Rd_out
);
always @(negedge clk)
begin 
if (Reset)
begin 
	ALUShift_out_out<=0;
	Rd_write_by_en_out<=0;
	Data_out<=0;
	Overflow_out<=0;
	RegWr_out<=0;
	Rd_out<=0;
	MemtoReg_out<=0;
end 
else 
begin 
	ALUShift_out_out<=ALUShift_out_in;
	Rd_write_by_en_out<=Rd_write_by_en_in;
	Data_out<=Data_in;
	Overflow_out<=Overflow_in;
	RegWr_out<=RegWr_in;
	Rd_out<=Rd_in;
	MemtoReg_out<=MemtoReg_in;
end 
end 

endmodule