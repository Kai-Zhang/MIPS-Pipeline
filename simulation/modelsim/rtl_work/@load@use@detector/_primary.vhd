library verilog;
use verilog.vl_types.all;
entity LoadUseDetector is
    port(
        LoadType_ID     : in     vl_logic_vector(1 downto 0);
        LoadType_Ex     : in     vl_logic_vector(1 downto 0);
        rs_ID           : in     vl_logic_vector(4 downto 0);
        rt_ID           : in     vl_logic_vector(4 downto 0);
        rt_Ex           : in     vl_logic_vector(4 downto 0);
        Reset_ID_Ex     : out    vl_logic;
        Keep_IF_ID      : out    vl_logic;
        Keep_PC         : out    vl_logic
    );
end LoadUseDetector;
