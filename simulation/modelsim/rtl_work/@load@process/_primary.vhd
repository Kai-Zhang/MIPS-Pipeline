library verilog;
use verilog.vl_types.all;
entity LoadProcess is
    port(
        RegWr           : in     vl_logic;
        Din             : in     vl_logic_vector(31 downto 0);
        LoadType        : in     vl_logic_vector(1 downto 0);
        LoadByte        : in     vl_logic_vector(1 downto 0);
        Dout            : out    vl_logic_vector(31 downto 0);
        Rd_byte_w_en    : out    vl_logic_vector(3 downto 0)
    );
end LoadProcess;
