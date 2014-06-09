library verilog;
use verilog.vl_types.all;
entity Mux_8Way is
    generic(
        DATA_WIDTH      : integer := 32
    );
    port(
        ctrl            : in     vl_logic_vector(2 downto 0);
        din0            : in     vl_logic_vector;
        din1            : in     vl_logic_vector;
        din2            : in     vl_logic_vector;
        din3            : in     vl_logic_vector;
        din4            : in     vl_logic_vector;
        din5            : in     vl_logic_vector;
        din6            : in     vl_logic_vector;
        din7            : in     vl_logic_vector;
        dout            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end Mux_8Way;
