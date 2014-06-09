library verilog;
use verilog.vl_types.all;
entity PipelineCPU is
    port(
        clk             : in     vl_logic;
        PC_out          : out    vl_logic_vector(31 downto 0);
        Inst_IF_out     : out    vl_logic_vector(31 downto 0);
        Inst_ID_out     : out    vl_logic_vector(31 downto 0);
        A_in_out        : out    vl_logic_vector(31 downto 0);
        B_in_out        : out    vl_logic_vector(31 downto 0);
        ALU_out_out     : out    vl_logic_vector(31 downto 0);
        Shift_out_out   : out    vl_logic_vector(31 downto 0);
        Rs_out_out      : out    vl_logic_vector(31 downto 0);
        Rt_out_out      : out    vl_logic_vector(31 downto 0);
        Rs_ID_out       : out    vl_logic_vector(4 downto 0);
        Shift_amount_out: out    vl_logic_vector(4 downto 0);
        ALUSrcB_Ex_out  : out    vl_logic_vector(1 downto 0);
        Shift_amountSrc_ID: out    vl_logic;
        Shift_amountSrc_Ex: out    vl_logic;
        PCP4_IF         : out    vl_logic_vector(31 downto 0)
    );
end PipelineCPU;
