module PCSourceGen(
input [31:0]PC_branch_Mem,
input [31:0]PC_jump_Mem,
input [2:0]Condition,
input Less,Zero,Jump,
output reg [1:0]PCSource,
output reg [31:0]PC_branch,
output reg [31:0]PC_jump
);
reg temp;
always @(*)
begin 
	PC_branch=PC_branch_Mem;
	PC_jump=PC_jump_Mem;
	if (Jump)
	begin 
		PCSource=2;
	end 
	else
	begin 
		case (Condition)
		3'b000:PCSource=0;
		3'b001:PCSource=Zero;
		3'b010:PCSource=!Zero;
		3'b011:PCSource=!Less;
		3'b100:PCSource=!(Zero|Less);
		3'b101:PCSource=Zero|Less;
		3'b110:PCSource=Less;
		3'b111:PCSource=1;
		default:PCSource=0;
		endcase
	end 
end 
endmodule
