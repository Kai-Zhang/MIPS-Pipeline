module ForwardUnit(
input [4:0]Rs_Ex,Rt_Ex,Rd_Mem,Rd_Wr,
input RegWr_Mem,RegWr_Wr,
input [1:0]ALUSrcB_Ex,
output reg[1:0]ALUSrcA,ALUSrcB
);
reg A1,A2,B1,B2;
initial 
begin 
A1=0;A2=0;B1=0;B2=0;
end 
always @(*)
begin 
	A1=RegWr_Mem&&(Rd_Mem!=0)&&(Rd_Mem==Rs_Ex);
	A2=RegWr_Wr&&(Rd_Wr!=0)&&(Rd_Mem!=Rs_Ex)&&(Rd_Mem==Rs_Ex);
	B1=RegWr_Mem&&(Rd_Mem!=0)&&(Rd_Mem==Rt_Ex);
	B2=RegWr_Wr&&(Rd_Wr!=0)&&(Rd_Mem!=Rt_Ex)&&(Rd_Mem==Rt_Ex);
	if (A2) ALUSrcA=2'd2;
	else if (A1) ALUSrcA=2'd1;
	else ALUSrcA=2'd0;
	if (B2) ALUSrcB=2'd3;
	else if (B1) ALUSrcB=2'd2;
	else ALUSrcB=ALUSrcB_Ex;
end 
endmodule
