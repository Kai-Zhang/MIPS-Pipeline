library verilog;
use verilog.vl_types.all;
entity ControlHazard is
    port(
        PCSource        : in     vl_logic_vector(1 downto 0);
        Reset_IF_ID     : out    vl_logic;
        Reset_ID_Ex     : out    vl_logic;
        Reset_Ex_Mem    : out    vl_logic
    );
end ControlHazard;
