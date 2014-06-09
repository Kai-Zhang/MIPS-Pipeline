library verilog;
use verilog.vl_types.all;
entity PCSourceGen is
    port(
        PC_branch_Mem   : in     vl_logic_vector(31 downto 0);
        PC_jump_Mem     : in     vl_logic_vector(31 downto 0);
        Condition       : in     vl_logic_vector(2 downto 0);
        Less            : in     vl_logic;
        Zero            : in     vl_logic;
        Jump            : in     vl_logic;
        PCSource        : out    vl_logic_vector(1 downto 0);
        PC_branch       : out    vl_logic_vector(31 downto 0);
        PC_jump         : out    vl_logic_vector(31 downto 0)
    );
end PCSourceGen;
