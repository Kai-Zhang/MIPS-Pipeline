module ControlHazard(
	input [1:0] PCSource,
	output Reset_IF_ID, Reset_ID_Ex, Reset_Ex_Mem
	);
	
	assign Reset_ID_Ex = PCSource[1] | PCSource[0];
	assign Reset_IF_ID = PCSource[1] | PCSource[0];
	assign Reset_Ex_Mem = PCSource[1] | PCSource[0];
	
endmodule
