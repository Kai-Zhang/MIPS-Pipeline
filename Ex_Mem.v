module Ex_Mem(
	input clk,
	input [4:0]Rs_in,
	input [4:0]Rt_in,
	input [4:0]Rd_in,
	input [31:0]offset_in,
	input RegDst_in,
	input Shift_amountSrc_in,
	input Jump_in,
	input ALUShift_Sel_in,
	input RegDt0_in,
	input [3:0]ALU_op_in,
	input [1:0]Shift_op_in,
	input [2:0]ALUSrcB_in,
	input [2:0]Condition_in,
	output reg [4:0]Rs_out,
	output reg [4:0]Rt_out,
	output reg [4:0]Rd_out,
	output reg [31:0]offset_out,
	output reg RegDst_out,
	output reg Shift_amountSrc_out,
	output reg Jump_out,
	output reg ALUShift_Sel_out,
	output reg RegDt0_out,
	output reg[3:0]ALU_op_out,
	output reg [1:0]Shift_op_out,
	output reg [2:0]ALUSrcB_out,
	output reg [2:0]Condition_out
);

	always @(negedge clk)
	begin 
		Rs_out<=Rs_in;
		Rt_out<=Rt_in;
		Rd_out<=Rd_in;
		offset_out<=offset_in;
		RegDst_out<=RegDst_in;
		Shift_amountSrc_out<=Shift_amountSrc_in;
		Jump_out<=Jump_in;
		ALUShift_Sel_out<=ALUShift_Sel_in;
		RegDt0_out<=RegDt0_in;
		ALU_op_out<=ALU_op_in;
		Shift_op_out<=Shift_op_in;
		ALUSrcB_out<=ALUSrcB_in;
		Condition_out<=Condition_in;
	end 
endmodule
