module LoadUseDetector( 
	input [1:0] LoadType_ID, LoadType_Ex,
	input [4:0] rs_ID, rt_ID, rt_Ex,
	output Reset_ID_Ex, Keep_IF_ID, Keep_PC
);
	
	wire LoadUse;
	wire MemRead_ID, MemRead_Ex;
	assign MemRead_ID = (LoadType_ID == 2'b00) ? 1'b0 : 1'b1;
	assign MemRead_Ex = (LoadType_Ex == 2'b00) ? 1'b0 : 1'b1;
	assign LoadUse = (~MemRead_ID) & MemRead_Ex & ((rt_Ex == rs_ID) | (rt_Ex == rt_ID));

	assign Reset_ID_Ex = LoadUse;
	assign Keep_IF_ID = LoadUse;
	assign Keep_PC = LoadUse;
	
endmodule
