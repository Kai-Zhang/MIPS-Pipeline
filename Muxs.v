module Y_Mux
# (parameter DATA_WIDTH = 32)
(
	input ctrl,
	input [DATA_WIDTH-1:0] data_a, data_b,
	output reg [DATA_WIDTH-1:0] dout
);
	
	always @ (ctrl or data_a or data_b)
		case (ctrl)
			1'b0: dout = data_a;
			1'b1: dout = data_b;
		endcase
endmodule

module Mux_4Way
# (parameter DATA_WIDTH = 32)
(
	input [1:0] ctrl,
	input [DATA_WIDTH-1:0] data_a, data_b, data_c, data_d,
	output reg [DATA_WIDTH-1:0] dout
);
	
	always @ (ctrl or data_a or data_b or data_c or data_d)
		case (ctrl)
			2'b00: dout = data_a;
			2'b01: dout = data_b;
			2'b10: dout = data_c;
			2'b11: dout = data_d;
		endcase
endmodule

module Mux_8Way
# (parameter DATA_WIDTH = 32)
(
	input [2:0] ctrl,
	input [DATA_WIDTH-1:0] din0, din1, din2, din3, din4, din5, din6, din7,
	output reg [DATA_WIDTH-1:0] dout
);
	initial dout = {DATA_WIDTH{1'b0}};
	
	always @ (ctrl or 
	din0 or din1 or din2 or din3 or din4 or din5 or din6 or din7)
		case (ctrl)
			3'b000: dout = din0;
			3'b001: dout = din1;
			3'b010: dout = din2;
			3'b011: dout = din3;
			3'b100: dout = din4;
			3'b101: dout = din5;
			3'b110: dout = din6;
			3'b111: dout = din7;
		endcase
endmodule
