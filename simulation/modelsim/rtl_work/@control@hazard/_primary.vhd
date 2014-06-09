library verilog;
use verilog.vl_types.all;
entity ControlHazard is
    port(
        Keep            : out    vl_logic;
        Reset           : out    vl_logic
    );
end ControlHazard;
