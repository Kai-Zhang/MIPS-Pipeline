library verilog;
use verilog.vl_types.all;
entity Adder is
    port(
        cin             : in     vl_logic;
        data_a          : in     vl_logic_vector(31 downto 0);
        data_b          : in     vl_logic_vector(31 downto 0);
        Carry           : out    vl_logic;
        Zero            : out    vl_logic;
        Negative        : out    vl_logic;
        Overflow        : out    vl_logic;
        dout            : out    vl_logic_vector(31 downto 0)
    );
end Adder;
