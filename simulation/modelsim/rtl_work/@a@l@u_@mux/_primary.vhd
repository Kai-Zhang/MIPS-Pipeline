library verilog;
use verilog.vl_types.all;
entity ALU_Mux is
    port(
        ctrl            : in     vl_logic_vector(2 downto 0);
        din             : in     vl_logic_vector(255 downto 0);
        dout            : out    vl_logic_vector(31 downto 0)
    );
end ALU_Mux;
