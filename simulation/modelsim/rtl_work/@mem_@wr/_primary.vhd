library verilog;
use verilog.vl_types.all;
entity Mem_Wr is
    port(
        clk             : in     vl_logic;
        Reset           : in     vl_logic;
        ALUShift_out_in : in     vl_logic_vector(31 downto 0);
        Data_in         : in     vl_logic_vector(31 downto 0);
        Rd_write_by_en_in: in     vl_logic_vector(3 downto 0);
        Overflow_in     : in     vl_logic;
        RegWr_in        : in     vl_logic;
        MemtoReg_in     : in     vl_logic;
        Rd_in           : in     vl_logic_vector(4 downto 0);
        ALUShift_out_out: out    vl_logic_vector(31 downto 0);
        Rd_write_by_en_out: out    vl_logic_vector(3 downto 0);
        Data_out        : out    vl_logic_vector(31 downto 0);
        Overflow_out    : out    vl_logic;
        RegWr_out       : out    vl_logic;
        MemtoReg_out    : out    vl_logic;
        Rd_out          : out    vl_logic_vector(4 downto 0)
    );
end Mem_Wr;
