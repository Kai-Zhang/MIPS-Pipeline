library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        clk             : in     vl_logic;
        Reset           : in     vl_logic;
        Keep            : in     vl_logic;
        PCP4_in         : in     vl_logic_vector(31 downto 0);
        Inst_in         : in     vl_logic_vector(31 downto 0);
        PCP4_out        : out    vl_logic_vector(31 downto 0);
        Inst_out        : out    vl_logic_vector(31 downto 0)
    );
end IF_ID;
