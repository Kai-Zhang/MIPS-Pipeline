library verilog;
use verilog.vl_types.all;
entity Ex_Mem is
    port(
        clk             : in     vl_logic;
        Reset           : in     vl_logic;
        PC_Branch_in    : in     vl_logic_vector(31 downto 0);
        PC_Jump_in      : in     vl_logic_vector(31 downto 0);
        ALUShift_out_in : in     vl_logic_vector(31 downto 0);
        Rd_write_by_en_in: in     vl_logic_vector(3 downto 0);
        Jump_in         : in     vl_logic;
        Less_in         : in     vl_logic;
        Zero_in         : in     vl_logic;
        Overflow_in     : in     vl_logic;
        Condition_in    : in     vl_logic_vector(2 downto 0);
        RegWr_in        : in     vl_logic;
        Rd_in           : in     vl_logic_vector(4 downto 0);
        PC_Branch_out   : out    vl_logic_vector(31 downto 0);
        PC_Jump_out     : out    vl_logic_vector(31 downto 0);
        ALUShift_out_out: out    vl_logic_vector(31 downto 0);
        Rd_write_by_en_out: out    vl_logic_vector(3 downto 0);
        Jump_out        : out    vl_logic;
        Less_out        : out    vl_logic;
        Zero_out        : out    vl_logic;
        Overflow_out    : out    vl_logic;
        Condition_out   : out    vl_logic_vector(2 downto 0);
        RegWr_out       : out    vl_logic;
        Rd_out          : out    vl_logic_vector(4 downto 0)
    );
end Ex_Mem;
