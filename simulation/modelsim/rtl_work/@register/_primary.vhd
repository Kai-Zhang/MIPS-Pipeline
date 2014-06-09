library verilog;
use verilog.vl_types.all;
entity \Register\ is
    port(
        clk             : in     vl_logic;
        Rs_addr         : in     vl_logic_vector(4 downto 0);
        Rt_addr         : in     vl_logic_vector(4 downto 0);
        Rd_addr         : in     vl_logic_vector(4 downto 0);
        Rd_in           : in     vl_logic_vector(31 downto 0);
        RegWr           : in     vl_logic;
        Rd_Byte_w_en    : in     vl_logic_vector(3 downto 0);
        Rs_out          : out    vl_logic_vector(31 downto 0);
        Rt_out          : out    vl_logic_vector(31 downto 0)
    );
end \Register\;
