-- CPU_fpoint.vhd

-- This file was auto-generated as part of a SOPC Builder generate operation.
-- If you edit it your changes will probably be lost.
-- 
-- The HDL file this wrapper is instantiating was not analysed successfully.
-- This can cause problems with the wrapper not matching the child module.
-- Please check that your hw.tcl file includes the following two commands:
-- `set_module_property TOP_LEVEL_HDL_FILE` and
-- `set_module_property TOP_LEVEL_HDL_MODULE`
-- Please also check that the HDL file does not contain syntax errors.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CPU_fpoint is
	port (
		clk    : in  std_logic                     := '0';             -- s1.clk
		clk_en : in  std_logic                     := '0';             --   .clk_en
		dataa  : in  std_logic_vector(31 downto 0) := (others => '0'); --   .dataa
		datab  : in  std_logic_vector(31 downto 0) := (others => '0'); --   .datab
		n      : in  std_logic_vector(1 downto 0)  := (others => '0'); --   .n
		reset  : in  std_logic                     := '0';             --   .reset
		start  : in  std_logic                     := '0';             --   .start
		done   : out std_logic;                                        --   .done
		result : out std_logic_vector(31 downto 0)                     --   .result
	);
end entity CPU_fpoint;

architecture rtl of CPU_fpoint is
	component fpoint_wrapper is
		generic (
			useDivider : integer := 0
		);
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			clk_en : in  std_logic                     := 'X';             -- clk_en
			dataa  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- dataa
			datab  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datab
			n      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- n
			reset  : in  std_logic                     := 'X';             -- reset
			start  : in  std_logic                     := 'X';             -- start
			done   : out std_logic;                                        -- done
			result : out std_logic_vector(31 downto 0)                     -- result
		);
	end component fpoint_wrapper;

begin

	cpu_fpoint : component fpoint_wrapper
		generic map (
			useDivider => 1
		)
		port map (
			clk    => clk,    -- s1.clk
			clk_en => clk_en, --   .clk_en
			dataa  => dataa,  --   .dataa
			datab  => datab,  --   .datab
			n      => n,      --   .n
			reset  => reset,  --   .reset
			start  => start,  --   .start
			done   => done,   --   .done
			result => result  --   .result
		);

end architecture rtl; -- of CPU_fpoint
