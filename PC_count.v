module PC_count(
input clk,
input Keep,
input [31:0]NextPC,
output reg [31:0]PC
);

always @(negedge clk)
begin 
  if (Keep) PC<=PC;
  else PC<=NextPC;
end 
endmodule
