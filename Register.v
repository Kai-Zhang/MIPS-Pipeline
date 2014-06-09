module Register(
input clk,
input [4:0]Rs_addr,
input [4:0]Rt_addr,
input [4:0]Rd_addr,
input [31:0]Rd_in,
input RegWr,
input [3:0]Rd_Byte_w_en,
output reg[31:0]Rs_out,
output reg[31:0]Rt_out
);
reg [31:0] register[31:0];
integer i;
initial
begin 
for (i=0;i<32;i=i+1) register[i]=i;
	Rs_out=0;
	Rt_out=0;
end 
always @(posedge clk)
begin 
	if (Rd_addr!=0&&RegWr)
	begin 
	  if (Rd_Byte_w_en[3]==1)
	  register[Rd_addr][31:24]<=Rd_in[31:24];
	  if (Rd_Byte_w_en[2]==1)
	  register[Rd_addr][23:16]<=Rd_in[23:16];
	  if (Rd_Byte_w_en[1]==1)
	  register[Rd_addr][15:8]<=Rd_in[15:8];
	  if (Rd_Byte_w_en[0]==1)
	  register[Rd_addr][7:0]<=Rd_in[7:0];
	end 
end
always @(Rs_addr or Rt_addr)
begin 
	Rs_out=register[Rs_addr];
	Rt_out=register[Rt_addr];
end  
endmodule