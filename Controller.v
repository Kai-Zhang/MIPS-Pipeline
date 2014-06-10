module Controller (
	input [5:0] Op_code, Funct,
	input [4:0] Shamt, Rs, Rt,
	output reg Ext_op, RegDst, Shift_amountSrc, Jump, ALU_Shift_Sel, RegDt0,
	output reg [3:0] ALU_op,
	output reg [1:0] Shift_op, ALUSrcB,
	output reg [2:0] condition,
	output reg [1:0] LoadType,
	output reg RegWr, MemWr, MemtoReg
);

	always @ (*)
	begin
		case (Op_code)
			6'b000000:
			begin
				case (Funct)
					6'b100000:
					begin
						ALUSrcB = 2'd0;
						ALU_op = 4'b1110;
						RegDst = 1'b1;
						Jump = 1'b0;
						ALU_Shift_Sel = 1'b0;
						condition = 3'd0;
						RegDt0 = 1'b0;
						Ext_op=1'b0;
						Shift_amountSrc=1'b0;
						Shift_op=2'b0;
						LoadType=2'b00;
						RegWr=1'b1;
						MemWr=1'b0;
						MemtoReg=1'b0;
					end
					6'b100010:
					begin
						ALUSrcB = 2'd0;
						ALU_op = 4'b1111;
						RegDst = 1'b1;
						Jump = 1'b0;
						ALU_Shift_Sel = 1'b0;
						condition = 3'd0;
						RegDt0 = 1'b0;
						Ext_op=1'b0;
						Shift_amountSrc=1'b0;
						Shift_op=2'b0;
						LoadType=2'b00;
						RegWr=1'b1;
						MemWr=1'b0;
						MemtoReg=1'b0;
					end
					6'b100011:
					begin
						ALUSrcB = 2'd0;
						ALU_op = 4'b0001;
						RegDst = 1'b1;
						Jump = 1'b0;
						ALU_Shift_Sel = 1'b0;
						condition = 3'd0;
						RegDt0 = 1'b0;
						Ext_op=1'b0;
						Shift_amountSrc=1'b0;
						Shift_op=2'b0;
						LoadType=2'b00;
						RegWr=1'b1;
						MemWr=1'b0;
						MemtoReg=1'b0;
					end
					6'b000111:
					begin
						ALUSrcB = 2'd0;
						ALU_op=4'b0;
						RegDst = 1'b1;
						Shift_amountSrc = 1'b1;
						Jump = 1'b0;
						ALU_Shift_Sel = 1'b1;
						Shift_op = 2'd2;
						condition = 3'd0;
						RegDt0 = 1'b0;
						Ext_op=1'b0;
						LoadType=2'b00;
						RegWr=1'b1;
						MemWr=1'b0;
						MemtoReg=1'b0;
					end
					6'b000010:
					begin
						ALUSrcB = 2'd0;
						ALU_op=4'b0;
						RegDst = 1'b1;
						Shift_amountSrc = 1'b0;
						Jump = 1'b0;
						ALU_Shift_Sel = 1'b1;
						Shift_op = 2'd3;
						condition = 3'd0;
						RegDt0 = 1'b0;
						Ext_op=1'b0;
						LoadType=2'b00;
						RegWr=1'b1;
						MemWr=1'b0;
						MemtoReg=1'b0;
					end
					6'b101011:
					begin
						ALUSrcB = 2'd0;
						ALU_op = 4'b0111;
						RegDst = 1'b1;
						Jump = 1'b0;
						Shift_amountSrc = 1'b0;
						Shift_op=2'b0;
						ALU_Shift_Sel = 1'b0;
						condition = 3'd0;
						RegDt0 = 1'b0;
						Ext_op=1'b0;
						LoadType=2'b00;
						RegWr=1'b1;
						MemWr=1'b0;
						MemtoReg=1'b0;
					end
					default:
					begin
						ALUSrcB = 2'd0;
						ALU_op=4'b0;
						RegDst=1'b0;
						Jump = 1'b0;
						Shift_amountSrc=1'b0;
						Shift_op=2'b0;
						ALU_Shift_Sel=1'b0;
						condition = 3'd0;
						RegDt0=1'b0;
						Ext_op=1'b0;
						LoadType=2'b00;
						RegWr=1'b0;
						MemWr=1'b0;
						MemtoReg=1'b0;
					end
				endcase
			end
			6'b000001:
			begin
				ALUSrcB = 2'd0;
				ALU_op = 4'b0001;
				RegDst=1'b0;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel=1'b0;
				condition = 3'd3;
				RegDt0 = 1'b1;
				Ext_op = 1'b1;
				LoadType=2'b00;
				RegWr=1'b1;
				MemWr=1'b0;
				MemtoReg=1'b0;
			end
			6'b000010:
			begin
				ALUSrcB = 2'd0;
				ALU_op = 4'b0000;
				RegDst=1'b0;
				Jump = 1'b1;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel=1'b0;
				condition = 3'd0;
				RegDt0 = 1'b0;
				Ext_op = 1'b0;
				LoadType=2'b00;
				RegWr=1'b1;
				MemWr=1'b0;
				MemtoReg=1'b0;
			end
			6'b001000:
			begin
				ALUSrcB = 2'd1;
				ALU_op = 4'b1110;
				RegDst = 1'b0;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel = 1'b0;
				condition = 3'd0;
				RegDt0 = 1'b0;
				Ext_op = 1'b1;
				LoadType=2'b00;
				RegWr=1'b1;
				MemWr=1'b0;
				MemtoReg=1'b0;
			end
			6'b001001:
			begin
				ALUSrcB = 2'd1;
				ALU_op = 4'b0000;
				RegDst = 1'b0;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel = 1'b0;
				condition = 3'd0;
				RegDt0 = 1'b0;
				Ext_op = 1'b1;
				LoadType=2'b00;
				RegWr=1'b1;
				MemWr=1'b0;
				MemtoReg=1'b0;
			end
			6'b001010:
			begin
				ALUSrcB = 2'd1;
				ALU_op = 4'b0101;
				RegDst = 1'b0;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel = 1'b0;
				condition = 3'd0;
				RegDt0 = 1'b0;
				Ext_op = 1'b1;
				LoadType=2'b00;
				RegWr=1'b1;
				MemWr=1'b0;
				MemtoReg=1'b0;
			end
			6'b001110:
			begin
				ALUSrcB = 2'd1;
				ALU_op = 4'b1001;
				RegDst = 1'b0;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel = 1'b0;
				condition = 3'd0;
				RegDt0 = 1'b0;
				Ext_op = 1'b0;
				LoadType=2'b00;
				RegWr=1'b1;
				MemWr=1'b0;
				MemtoReg=1'b0;
			end
			6'b001111:
			begin
				ALUSrcB = 2'd2;
				ALU_op = 4'b0000;
				RegDst = 1'b0;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel = 1'b0;
				condition = 3'd0;
				RegDt0 = 1'b0;
				Ext_op = 1'b0;
				LoadType=2'b00;
				RegWr=1'b1;
				MemWr=1'b0;
				MemtoReg=1'b0;
			end
			6'b011100:
			begin
				case (Funct)
					6'b100001:
					begin
						ALUSrcB=2'b0;
						ALU_op = 4'b0011;
						RegDst = 1'b1;
						Jump = 1'b0;
						Shift_amountSrc=1'b0;
						Shift_op=2'b0;
						ALU_Shift_Sel = 1'b0;
						condition = 3'd0;
						RegDt0=1'b0;
						Ext_op=1'b0;
						LoadType=2'b00;
						RegWr=1'b1;
						MemWr=1'b0;
						MemtoReg=1'b0;
					end
					6'b100000:
					begin
						ALUSrcB=2'b0;
						ALU_op = 4'b0010;
						RegDst = 1'b1;
						Jump = 1'b0;
						Shift_amountSrc=1'b0;
						Shift_op=2'b0;
						ALU_Shift_Sel = 1'b0;
						condition = 3'd0;
						RegDt0=1'b0;
						Ext_op=1'b0;
						LoadType=2'b00;
						RegWr=1'b1;
						MemWr=1'b0;
						MemtoReg=1'b0;
					end
					default:
					begin
						ALUSrcB=2'b0;
						ALU_op = 4'b0000;
						RegDst = 1'b0;
						Jump = 1'b0;
						Shift_amountSrc=1'b0;
						Shift_op=2'b0;
						ALU_Shift_Sel = 1'b0;
						condition = 3'd0;
						RegDt0=1'b0;
						Ext_op=1'b0;
						LoadType=2'b00;
						RegWr=1'b1;
						MemWr=1'b0;
						MemtoReg=1'b0;
					end
				endcase
			end
			6'b011111:
			begin
				ALUSrcB = 2'd0;
				ALU_op = 4'b1010;
				RegDst = 1'b1;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel = 1'b0;
				condition = 3'd0;
				RegDt0=1'b0;
				Ext_op = 1'b1;
				LoadType=2'b00;
				RegWr=1'b1;
				MemWr=1'b0;
				MemtoReg=1'b0;
			end
			6'b100011:
			begin
				ALUSrcB = 2'd0;
				ALU_op = 4'b1110;
				RegDst = 1'b0;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel = 1'b0;
				condition = 3'd0;
				RegDt0 = 1'b0;
				Ext_op = 1'b1;
				LoadType=2'b10;
				RegWr = 1'b1;
				MemWr=1'b0;
				MemtoReg=1'b1;
			end
			6'b100010:
			begin
				ALUSrcB = 2'd0;
				ALU_op = 4'b1110;
				RegDst = 1'b0;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel = 1'b0;
				condition = 3'd0;
				RegDt0 = 1'b0;
				Ext_op = 1'b1;
				LoadType=2'b01;
				RegWr = 1'b1;
				MemWr=1'b0;
				MemtoReg=1'b1;
			end
			6'b100110:
			begin
				ALUSrcB = 2'd0;
				ALU_op = 4'b1110;
				RegDst = 1'b0;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel = 1'b0;
				condition = 3'd0;
				RegDt0 = 1'b0;
				Ext_op = 1'b1;
				LoadType=2'b11;
				RegWr = 1'b1;
				MemWr=1'b0;
				MemtoReg=1'b1;
			end
			6'b101011:
			begin
				ALUSrcB = 2'd0;
				ALU_op = 4'b1110;
				RegDst = 1'b0;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel = 1'b0;
				condition = 3'd0;
				RegDt0 = 1'b0;
				Ext_op = 1'b1;
				LoadType=2'b00;
				RegWr=1'b0;
				MemWr=1'b1;
				MemtoReg=1'b0;
			end
			default:
			begin
				ALUSrcB=2'b0;
				ALU_op = 4'b0000;
				RegDst = 1'b0;
				Jump = 1'b0;
				Shift_amountSrc=1'b0;
				Shift_op=2'b0;
				ALU_Shift_Sel = 1'b0;
				condition = 3'd0;
				RegDt0=1'b0;
				Ext_op=1'b0;
				LoadType=2'b00;
				RegWr=1'b0;
				MemWr=1'b0;
				MemtoReg=1'b0;
			end
		endcase
	end
endmodule
