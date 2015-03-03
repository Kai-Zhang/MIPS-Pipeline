module Op_Decoder (
	input [3:0] ALU_op,
	output [2:0] ALU_ctr
);

	assign ALU_ctr[2] = (~ALU_op[1] & ~ALU_op[3]) | (ALU_op[1] & ALU_op[3]) | (ALU_op[0] & ALU_op[2] & ~ALU_op[3]);
	assign ALU_ctr[1] = (~ALU_op[1] & ~ALU_op[2] & ~ALU_op[3]) | (~ALU_op[0] & ~ALU_op[2] & ALU_op[3]) |
								(~ALU_op[0] & ALU_op[1] & ALU_op[2]) | (ALU_op[1] & ALU_op[3]);
	assign ALU_ctr[0] = (~ALU_op[1] & ~ALU_op[2]) | (ALU_op[0] & ALU_op[2] & ~ALU_op[3]) | (ALU_op[1] & ALU_op[2] & ALU_op[3]);
endmodule

module Adder (
	input cin,
	input [31:0] data_a, data_b,
	output reg Carry,
	output Zero, Negative, Overflow,
	output reg [31:0] dout
);
	
	assign Overflow = ~data_a[31] & ~data_b[31] & dout[31] | data_a[31] & data_b[31] & ~dout[31];
	assign Negative = dout[31];
	assign Zero = (dout == 32'b0) ? 1'b1 : 1'b0;
	always @ (data_a or data_b or cin)
		{Carry, dout} = data_a + data_b + cin;
		
endmodule

module ALU_Mux (
	input [2:0] ctrl,
	input [255:0] din,
	output reg [31:0] dout
);
	
	always @ (ctrl or din)
		case (ctrl)
			3'd0: dout = din[31:0];
			3'd1: dout = din[63:32];
			3'd2: dout = din[95:64];
			3'd3: dout = din[127:96];
			3'd4: dout = din[159:128];
			3'd5: dout = din[191:160];
			3'd6: dout = din[223:192];
			3'd7: dout = din[255:224];
		endcase
endmodule

module Leading_Counter (
	input ext_in,
	input [31:0] din,
	output reg [31:0] dout
);

	wire [31:0] xor_out;
	
	assign xor_out = {32{ext_in}} ^ din;
	always @ (xor_out)
	begin
		if (xor_out[31] == 1'b1)
			dout = 32'd0;
		else if (xor_out[30] == 1'b1)
			dout = 32'd1;
		else if (xor_out[29] == 1'b1)
			dout = 32'd2;
		else if (xor_out[28] == 1'b1)
			dout = 32'd3;
		else if (xor_out[27] == 1'b1)
			dout = 32'd4;
		else if (xor_out[26] == 1'b1)
			dout = 32'd5;
		else if (xor_out[25] == 1'b1)
			dout = 32'd6;
		else if (xor_out[24] == 1'b1)
			dout = 32'd7;
		else if (xor_out[23] == 1'b1)
			dout = 32'd8;
		else if (xor_out[22] == 1'b1)
			dout = 32'd9;
		else if (xor_out[21] == 1'b1)
			dout = 32'd10;
		else if (xor_out[20] == 1'b1)
			dout = 32'd11;
		else if (xor_out[19] == 1'b1)
			dout = 32'd12;
		else if (xor_out[18] == 1'b1)
			dout = 32'd13;
		else if (xor_out[17] == 1'b1)
			dout = 32'd14;
		else if (xor_out[16] == 1'b1)
			dout = 32'd15;
		else if (xor_out[15] == 1'b1)
			dout = 32'd16;
		else if (xor_out[14] == 1'b1)
			dout = 32'd17;
		else if (xor_out[13] == 1'b1)
			dout = 32'd18;
		else if (xor_out[12] == 1'b1)
			dout = 32'd19;
		else if (xor_out[11] == 1'b1)
			dout = 32'd20;
		else if (xor_out[10] == 1'b1)
			dout = 32'd21;
		else if (xor_out[9] == 1'b1)
			dout = 32'd22;
		else if (xor_out[8] == 1'b1)
			dout = 32'd23;
		else if (xor_out[7] == 1'b1)
			dout = 32'd24;
		else if (xor_out[6] == 1'b1)
			dout = 32'd25;
		else if (xor_out[5] == 1'b1)
			dout = 32'd26;
		else if (xor_out[4] == 1'b1)
			dout = 32'd27;
		else if (xor_out[3] == 1'b1)
			dout = 32'd28;
		else if (xor_out[2] == 1'b1)
			dout = 32'd29;
		else if (xor_out[1] == 1'b1)
			dout = 32'd30;
		else if (xor_out[0] == 1'b1)
			dout = 32'd31;
		else
			dout = 32'd32;
	end
endmodule

module ALU (
	input [31:0] A_in, B_in,
	input [3:0] ALU_op,
	output Zero, Less, Overflow,
	output [31:0] ALU_out
);
	
	wire adder_overflow, adder_carry, adder_negative;
	wire [31:0] adder_out, se_out, slt_out, and_out, or_out, xor_out, lc_out;
	wire [2:0] alu_ctr;
	
	
	Adder adder (
		.cin (ALU_op[0]),
		.data_a (A_in),
		.data_b ({32{ALU_op[0]}} ^ B_in ),
		.dout (adder_out),
		.Zero (Zero),
		.Carry (adder_carry),
		.Negative (adder_negative),
		.Overflow (adder_overflow)
	);
	
	Y_Mux #(.DATA_WIDTH(1)) less_mux (
		.ctrl (ALU_op[0] & ALU_op[1] & ALU_op[2] & ~ALU_op[3]),
		.data_a (adder_overflow ^ adder_negative),
		.data_b (~adder_carry),
		.dout (Less)
	);
	
	Y_Mux se_mux (
		.ctrl (ALU_op[0]),
		.data_a ({{24{B_in[7]}}, B_in[7:0]}),
		.data_b ({{16{B_in[15]}}, B_in[15:0]}),
		.dout (se_out)
	);
	
	Y_Mux slt_mux (
		.ctrl (Less),
		.data_a (32'b0),
		.data_b (32'h1),
		.dout (slt_out)
	);
	
	Op_Decoder alu_controller (
		.ALU_op (ALU_op),
		.ALU_ctr (alu_ctr)
	);
	
	Leading_Counter lcz_counter (
		.ext_in (ALU_op[0]),
		.din (A_in),
		.dout (lc_out)
	);
	
	Mux_8Way rst_mux (
		.ctrl (alu_ctr),
		.din7 (adder_out),			// #7: Adder output
		.din6 (se_out),				// #6: seh/seb result
		.din5 (slt_out),				// #5: slt/slti/sltu/sltiu result
		.din4 (A_in & B_in),			// #4: And result
		.din3 (~(A_in | B_in)),		// #3: Nor result
		.din2 (A_in | B_in),			// #2: Or result
		.din1 (A_in ^ B_in),			// #1: Xor result
		.din0 (lc_out),				// #0: lco/lcz result
		.dout (ALU_out)
	);
	
	assign Overflow = adder_overflow & ALU_op[1] & ALU_op[2] & ALU_op[3];
endmodule
