library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        clk             : in     vl_logic;
        Mem_Wr_en       : in     vl_logic;
        Instr_Addr      : in     vl_logic_vector(31 downto 0);
        Data_Addr       : in     vl_logic_vector(31 downto 0);
        Din             : in     vl_logic_vector(31 downto 0);
        Inst            : out    vl_logic_vector(31 downto 0);
        Dout            : out    vl_logic_vector(31 downto 0)
    );
end Memory;
