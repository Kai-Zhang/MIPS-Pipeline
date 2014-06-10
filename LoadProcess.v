module LoadProcess (
	input RegWr,
	input [31:0] Din,
	input [1:0] LoadType, LoadByte,
	output reg [31:0] Dout,
	output reg [3:0] Rd_byte_w_en
);

	always @ (*)
	begin
		case(LoadType)
		2'b10: begin Dout = Din; Rd_byte_w_en = 4'b1111; end
		2'b01: 
		begin
			case(LoadByte)
			2'b00: begin Dout = Din; Rd_byte_w_en = 4'b1111; end
			2'b01: begin Dout = Din << 8; Rd_byte_w_en = 4'b1110; end
			2'b10: begin Dout = Din << 16; Rd_byte_w_en = 4'b1100; end
			2'b11: begin Dout = Din << 24; Rd_byte_w_en = 4'b1000; end
			endcase
		end
		2'b11:
		begin
			case(LoadByte)
			2'b00: begin Dout = Din >> 24; Rd_byte_w_en = 4'b0001; end
			2'b01: begin Dout = Din >> 16; Rd_byte_w_en = 4'b0011; end
			2'b10: begin Dout = Din >> 8; Rd_byte_w_en = 4'b0111; end
			2'b11: begin Dout = Din; Rd_byte_w_en = 4'b1111; end
			endcase
		end
		default: begin Dout = Din; Rd_byte_w_en = {4{RegWr}}; end
		endcase
	end
endmodule

