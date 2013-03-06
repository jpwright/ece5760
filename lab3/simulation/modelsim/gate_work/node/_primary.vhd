library verilog;
use verilog.vl_types.all;
entity node is
    port(
        left            : in     vl_logic_vector(17 downto 0);
        right           : in     vl_logic_vector(17 downto 0);
        up              : in     vl_logic_vector(17 downto 0);
        down            : in     vl_logic_vector(17 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        resetval        : in     vl_logic_vector(17 downto 0);
        value           : out    vl_logic_vector(17 downto 0)
    );
end node;
