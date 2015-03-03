library verilog;
use verilog.vl_types.all;
entity PC_count is
    port(
        clk             : in     vl_logic;
        Keep            : in     vl_logic;
        NextPC          : in     vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0)
    );
end PC_count;
