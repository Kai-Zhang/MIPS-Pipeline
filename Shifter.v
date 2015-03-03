module Shifter (
	input [31:0] Shift_in,
	input [4:0] Shift_amount,
	input [1:0] Shift_op,
	output [31:0] Shift_out
);
	
	wire [31:0] layer_out[3:0];
	wire [4:0] ctr_0;
	wire [4:0] ctr_1;
	wire head;
	
	assign ctr_1[0] = Shift_amount[0] & (Shift_op[0] | Shift_op[1]);
	assign ctr_0[0] = Shift_amount[0] & (Shift_op[0] ^~ Shift_op[1]);
	assign ctr_1[1] = Shift_amount[1] & (Shift_op[0] | Shift_op[1]);
	assign ctr_0[1] = Shift_amount[1] & (Shift_op[0] ^~ Shift_op[1]);
	assign ctr_1[2] = Shift_amount[2] & (Shift_op[0] | Shift_op[1]);
	assign ctr_0[2] = Shift_amount[2] & (Shift_op[0] ^~ Shift_op[1]);
	assign ctr_1[3] = Shift_amount[3] & (Shift_op[0] | Shift_op[1]);
	assign ctr_0[3] = Shift_amount[3] & (Shift_op[0] ^~ Shift_op[1]);
	assign ctr_1[4] = Shift_amount[4] & (Shift_op[0] | Shift_op[1]);
	assign ctr_0[4] = Shift_amount[4] & (Shift_op[0] ^~ Shift_op[1]);
	
	Mux_4Way #(.DATA_WIDTH(1)) header (
		.ctrl (Shift_op),
		.data_a (1'b0),
		.data_b (1'b0),
		.data_c (Shift_in[31]),
		.data_d (1'b0),
		.dout (head)
	);
	
	Mux_4Way layer0 (
		.ctrl ({ctr_1[0], ctr_0[0]}),
		.data_a (Shift_in),
		.data_b ({Shift_in[30:0],1'b0}),
		.data_c ({head,Shift_in[31:1]}),
		.data_d ({Shift_in[0],Shift_in[31:1]}),
		.dout (layer_out[0])
	);
	Mux_4Way layer1 (
		.ctrl ({ctr_1[1], ctr_0[1]}),
		.data_a (layer_out[0]),
		.data_b ({layer_out[0][29:0],2'b0}),
		.data_c ({{2{head}},layer_out[0][31:2]}),
		.data_d ({layer_out[0][1:0],layer_out[0][31:2]}),
		.dout (layer_out[1])
	);
	Mux_4Way layer2 (
		.ctrl ({ctr_1[2], ctr_0[2]}),
		.data_a (layer_out[1]),
		.data_b ({layer_out[1][27:0],4'b0}),
		.data_c ({{4{head}},layer_out[1][31:4]}),
		.data_d ({layer_out[1][3:0],layer_out[1][31:4]}),
		.dout (layer_out[2])
	);
	Mux_4Way layer3 (
		.ctrl ({ctr_1[3], ctr_0[3]}),
		.data_a (layer_out[2]),
		.data_b ({layer_out[2][23:0],8'b0}),
		.data_c ({{8{head}},layer_out[2][31:8]}),
		.data_d ({layer_out[2][7:0],layer_out[2][31:8]}),
		.dout (layer_out[3])
	);
	Mux_4Way layer4 (
		.ctrl ({ctr_1[4], ctr_0[4]}),
		.data_a (layer_out[3]),
		.data_b ({layer_out[3][15:0],16'b0}),
		.data_c ({{16{head}},layer_out[3][31:16]}),
		.data_d ({layer_out[3][15:0],layer_out[3][31:16]}),
		.dout (Shift_out)
	);
endmodule
