library verilog;
use verilog.vl_types.all;
entity Y_Mux is
    generic(
        DATA_WIDTH      : integer := 32
    );
    port(
        ctrl            : in     vl_logic;
        data_a          : in     vl_logic_vector;
        data_b          : in     vl_logic_vector;
        dout            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end Y_Mux;
