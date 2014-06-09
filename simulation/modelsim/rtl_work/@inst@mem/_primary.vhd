library verilog;
use verilog.vl_types.all;
entity InstMem is
    port(
        Addr            : in     vl_logic_vector(31 downto 0);
        Inst            : out    vl_logic_vector(31 downto 0)
    );
end InstMem;
