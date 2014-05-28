module InstMem(
input [31:0]Addr,
output [31:0]Inst
);
reg [7:0] ram[32:0];

assign Inst={ram[Addr],ram[Addr+1],ram[Addr+2],ram[Addr+3]};
endmodule
