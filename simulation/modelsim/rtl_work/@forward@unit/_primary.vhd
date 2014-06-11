library verilog;
use verilog.vl_types.all;
entity ForwardUnit is
    port(
        Rs_Ex           : in     vl_logic_vector(4 downto 0);
        Rt_Ex           : in     vl_logic_vector(4 downto 0);
        Rd_Mem          : in     vl_logic_vector(4 downto 0);
        Rd_Wr           : in     vl_logic_vector(4 downto 0);
        RegWr_Mem       : in     vl_logic;
        RegWr_Wr        : in     vl_logic;
        ALUSrcB_Ex      : in     vl_logic_vector(2 downto 0);
        ALUSrcA         : out    vl_logic_vector(1 downto 0);
        ALUSrcB         : out    vl_logic_vector(2 downto 0)
    );
end ForwardUnit;
