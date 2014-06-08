module IF_ID(
	input clk,
	input Reset,
	input Keep,
	input [31:0]PCP4_in,Inst_in,
	output reg [31:0]PCP4_out,Inst_out
);

	always @(negedge clk)
	begin 
		if (Reset) 
		begin 
			PCP4_out <= 0;
			Inst_out <= 0;
		end 
		else if (Keep)
		begin 
			PCP4_out <= PCP4_out;
			Inst_out <= Inst_out;
		end 
		else 
		begin 
			PCP4_out <= PCP4_in;
			Inst_out <= Inst_in;
		end 
	end 
endmodule

