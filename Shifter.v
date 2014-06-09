module Shifter(
input [31:0]data,
input [4:0]length,
input [1:0]choose,
output reg [31:0]data_out);
integer i;
always @(data or length or choose)
begin 
	case (choose)
	2'b00:data_out=data<<length;
	2'b01:data_out=data>>length;
	2'b10:data_out=data>>>length;
	2'b11:
	begin 
		data_out=data;
		for (i=0;i<length;i=i+1)
			data_out={data_out[0],data_out[31:1]};
	end 
	endcase
end 
endmodule