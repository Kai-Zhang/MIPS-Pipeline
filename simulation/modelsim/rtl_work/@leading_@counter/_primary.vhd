library verilog;
use verilog.vl_types.all;
entity Leading_Counter is
    port(
        ext_in          : in     vl_logic;
        din             : in     vl_logic_vector(31 downto 0);
        dout            : out    vl_logic_vector(31 downto 0)
    );
end Leading_Counter;
