module InstMem(
input [31:0]Addr,
output [31:0]Inst
);
reg [7:0] ram[32:0];
integer i;
initial
begin 
for (i=0;i<32;i=i+1)
	ram[i]=8'b0;
//add  R3=R1(7ffffffe)+R2(2) 溢出 R3应该保持不变
{ram[3],ram[2],ram[1],ram[0]}=32'b00000000001000100001100000100000;
//addi R3=R1(7ffffffe)+4 溢出 R3应该保持不变
{ram[7],ram[6],ram[5],ram[4]}=32'b00100000001000110000000000000100;
//addiu R3=R1+4 R3应等于80000002 无溢出，存入R3
{ram[11],ram[10],ram[9],ram[8]}=32'b00100100001000110000000000000100;
end 
assign Inst={ram[Addr+3],ram[Addr+2],ram[Addr+1],ram[Addr]};
endmodule
