library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        Op_code         : in     vl_logic_vector(5 downto 0);
        Funct           : in     vl_logic_vector(5 downto 0);
        Shamt           : in     vl_logic_vector(4 downto 0);
        Rs              : in     vl_logic_vector(4 downto 0);
        Rt              : in     vl_logic_vector(4 downto 0);
        Ext_op          : out    vl_logic;
        RegDst          : out    vl_logic;
        Shift_amountSrc : out    vl_logic;
        Jump            : out    vl_logic;
        ALU_Shift_Sel   : out    vl_logic;
        RegDt0          : out    vl_logic;
        ALU_op          : out    vl_logic_vector(3 downto 0);
        Shift_op        : out    vl_logic_vector(1 downto 0);
        ALUSrcB         : out    vl_logic_vector(1 downto 0);
        condition       : out    vl_logic_vector(2 downto 0);
        RegWr           : out    vl_logic
    );
end Controller;
