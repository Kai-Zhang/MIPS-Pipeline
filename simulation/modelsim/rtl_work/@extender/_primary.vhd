library verilog;
use verilog.vl_types.all;
entity Extender is
    port(
        Ctr             : in     vl_logic;
        imm_16          : in     vl_logic_vector(15 downto 0);
        imm_32          : out    vl_logic_vector(31 downto 0)
    );
end Extender;
