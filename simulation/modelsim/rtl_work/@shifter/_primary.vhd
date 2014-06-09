library verilog;
use verilog.vl_types.all;
entity Shifter is
    port(
        data            : in     vl_logic_vector(31 downto 0);
        length          : in     vl_logic_vector(4 downto 0);
        choose          : in     vl_logic_vector(1 downto 0);
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end Shifter;
