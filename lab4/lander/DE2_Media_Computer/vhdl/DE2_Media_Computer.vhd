
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DE2_Media_Computer is

-------------------------------------------------------------------------------
--							 Port Declarations							 --
-------------------------------------------------------------------------------
port (
	-- Inputs
	CLOCK_50			: in std_logic;
	CLOCK_27			: in std_logic;
	KEY				  	: in std_logic_vector (3 downto 0);
	SW				   	: in std_logic_vector (17 downto 0);

	--  Communication
	UART_RXD			: in std_logic;

	--  Audio
	AUD_ADCDAT			: in std_logic;

	-- Bidirectionals
	GPIO_0				: inout std_logic_vector (35 downto 0);
	GPIO_1				: inout std_logic_vector (35 downto 0);

	--  Memory (SRAM)
	SRAM_DQ				: inout std_logic_vector (15 downto 0);
	
	-- Memory (SDRAM)
	DRAM_DQ				: inout std_logic_vector (15 downto 0);

	--  PS2 Port
	PS2_CLK				: inout std_logic;
	PS2_DAT				: inout std_logic;
	
	--  Audio
	AUD_BCLK			: inout std_logic;
	AUD_ADCLRCK			: inout std_logic;
	AUD_DACLRCK			: inout std_logic;
	
	--  Char LCD 16x2
	LCD_DATA			: inout std_logic_vector (7 downto 0);

	--  AV Config
	I2C_SDAT			: inout std_logic;
	
	-- Outputs
	TD_RESET			: out std_logic;
	
	--  Simple
	LEDG				: out std_logic_vector (8 downto 0);
	LEDR				: out std_logic_vector (17 downto 0);
	HEX0				: out std_logic_vector (6 downto 0);
	HEX1				: out std_logic_vector (6 downto 0);
	HEX2				: out std_logic_vector (6 downto 0);
	HEX3				: out std_logic_vector (6 downto 0);
	HEX4				: out std_logic_vector (6 downto 0);
	HEX5				: out std_logic_vector (6 downto 0);
	HEX6				: out std_logic_vector (6 downto 0);
	HEX7				: out std_logic_vector (6 downto 0);

	--  Memory (SRAM)
	SRAM_ADDR			: out std_logic_vector (17 downto 0);
	SRAM_CE_N			: out std_logic;
	SRAM_WE_N			: out std_logic;
	SRAM_OE_N			: out std_logic;
	SRAM_UB_N			: out std_logic;
	SRAM_LB_N			: out std_logic;

	--  Communication
	UART_TXD			: out std_logic;
	
	-- Memory (SDRAM)
	DRAM_ADDR			: out std_logic_vector (11 downto 0);
	DRAM_BA_1			: buffer std_logic;
	DRAM_BA_0			: buffer std_logic;
	DRAM_CAS_N			: out std_logic;
	DRAM_RAS_N			: out std_logic;
	DRAM_CLK			: out std_logic;
	DRAM_CKE			: out std_logic;
	DRAM_CS_N			: out std_logic;
	DRAM_WE_N			: out std_logic;
	DRAM_UDQM			: buffer std_logic;
	DRAM_LDQM			: buffer std_logic;

	--  Audio
	AUD_XCK				: out std_logic;
	AUD_DACDAT			: out std_logic;
	
	--  VGA
	VGA_CLK				: out std_logic;
	VGA_HS				: out std_logic;
	VGA_VS				: out std_logic;
	VGA_BLANK			: out std_logic;
	VGA_SYNC			: out std_logic;
	VGA_R				: out std_logic_vector (9 downto 0);
	VGA_G				: out std_logic_vector (9 downto 0);
	VGA_B				: out std_logic_vector (9 downto 0);

	--  Char LCD 16x2
	LCD_ON				: out std_logic;
	LCD_BLON			: out std_logic;
	LCD_EN				: out std_logic;
	LCD_RS				: out std_logic;
	LCD_RW				: out std_logic;
	
	--  AV Config
	I2C_SCLK			: out std_logic
	);
end DE2_Media_Computer;


architecture DE2_Media_Computer_rtl of DE2_Media_Computer is

-------------------------------------------------------------------------------
--						   Subentity Declarations						  --
-------------------------------------------------------------------------------
	component nios_system
		port (
              -- 1) global signals:
                 signal clk : IN STD_LOGIC;
                 signal clk_27 : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sys_clk : OUT STD_LOGIC;
                 signal vga_clk : OUT STD_LOGIC;
                 signal sdram_clk : OUT STD_LOGIC;
                 signal audio_clk : OUT STD_LOGIC;

              -- the_AV_Config
                 signal I2C_SCLK_from_the_AV_Config : OUT STD_LOGIC;
                 signal I2C_SDAT_to_and_from_the_AV_Config : INOUT STD_LOGIC;

              -- the_Audio
                 signal AUD_ADCDAT_to_the_Audio : IN STD_LOGIC;
                 signal AUD_ADCLRCK_to_and_from_the_Audio : INOUT STD_LOGIC;
                 signal AUD_BCLK_to_and_from_the_Audio : INOUT STD_LOGIC;
                 signal AUD_DACDAT_from_the_Audio : OUT STD_LOGIC;
                 signal AUD_DACLRCK_to_and_from_the_Audio : INOUT STD_LOGIC;

              -- the_Char_LCD_16x2
                 signal LCD_BLON_from_the_Char_LCD_16x2 : OUT STD_LOGIC;
                 signal LCD_DATA_to_and_from_the_Char_LCD_16x2 : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal LCD_EN_from_the_Char_LCD_16x2 : OUT STD_LOGIC;
                 signal LCD_ON_from_the_Char_LCD_16x2 : OUT STD_LOGIC;
                 signal LCD_RS_from_the_Char_LCD_16x2 : OUT STD_LOGIC;
                 signal LCD_RW_from_the_Char_LCD_16x2 : OUT STD_LOGIC;

              -- the_Expansion_JP1
                 signal GPIO_0_to_and_from_the_Expansion_JP1 : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);

              -- the_Expansion_JP2
                 signal GPIO_1_to_and_from_the_Expansion_JP2 : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);

              -- the_Green_LEDs
                 signal LEDG_from_the_Green_LEDs : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);

              -- the_HEX3_HEX0
                 signal HEX0_from_the_HEX3_HEX0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
                 signal HEX1_from_the_HEX3_HEX0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
                 signal HEX2_from_the_HEX3_HEX0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
                 signal HEX3_from_the_HEX3_HEX0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);

              -- the_HEX7_HEX4
                 signal HEX4_from_the_HEX7_HEX4 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
                 signal HEX5_from_the_HEX7_HEX4 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
                 signal HEX6_from_the_HEX7_HEX4 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
                 signal HEX7_from_the_HEX7_HEX4 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);

              -- the_PS2_Port
                 signal PS2_CLK_to_and_from_the_PS2_Port : INOUT STD_LOGIC;
                 signal PS2_DAT_to_and_from_the_PS2_Port : INOUT STD_LOGIC;

              -- the_Pushbuttons
                 signal KEY_to_the_Pushbuttons : IN STD_LOGIC_VECTOR (3 DOWNTO 0);

              -- the_Red_LEDs
                 signal LEDR_from_the_Red_LEDs : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);

              -- the_SDRAM
                 signal zs_addr_from_the_SDRAM : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
                 signal zs_ba_from_the_SDRAM : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal zs_cas_n_from_the_SDRAM : OUT STD_LOGIC;
                 signal zs_cke_from_the_SDRAM : OUT STD_LOGIC;
                 signal zs_cs_n_from_the_SDRAM : OUT STD_LOGIC;
                 signal zs_dq_to_and_from_the_SDRAM : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal zs_dqm_from_the_SDRAM : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal zs_ras_n_from_the_SDRAM : OUT STD_LOGIC;
                 signal zs_we_n_from_the_SDRAM : OUT STD_LOGIC;

              -- the_SRAM
                 signal SRAM_ADDR_from_the_SRAM : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal SRAM_CE_N_from_the_SRAM : OUT STD_LOGIC;
                 signal SRAM_DQ_to_and_from_the_SRAM : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal SRAM_LB_N_from_the_SRAM : OUT STD_LOGIC;
                 signal SRAM_OE_N_from_the_SRAM : OUT STD_LOGIC;
                 signal SRAM_UB_N_from_the_SRAM : OUT STD_LOGIC;
                 signal SRAM_WE_N_from_the_SRAM : OUT STD_LOGIC;

              -- the_Serial_Port
                 signal UART_RXD_to_the_Serial_Port : IN STD_LOGIC;
                 signal UART_TXD_from_the_Serial_Port : OUT STD_LOGIC;

              -- the_Slider_Switches
                 signal SW_to_the_Slider_Switches : IN STD_LOGIC_VECTOR (17 DOWNTO 0);

              -- the_VGA_Controller
                 signal VGA_BLANK_from_the_VGA_Controller : OUT STD_LOGIC;
                 signal VGA_B_from_the_VGA_Controller : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
                 signal VGA_CLK_from_the_VGA_Controller : OUT STD_LOGIC;
                 signal VGA_G_from_the_VGA_Controller : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
                 signal VGA_HS_from_the_VGA_Controller : OUT STD_LOGIC;
                 signal VGA_R_from_the_VGA_Controller : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
                 signal VGA_SYNC_from_the_VGA_Controller : OUT STD_LOGIC;
                 signal VGA_VS_from_the_VGA_Controller : OUT STD_LOGIC
			  );
	end component;
	
-------------------------------------------------------------------------------
--						   Parameter Declarations						  --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--				 Internal Wires and Registers Declarations				 --
-------------------------------------------------------------------------------
-- Internal Wires
-- Used to concatenate some SDRAM control signals
signal			 BA : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal			 DQM : STD_LOGIC_VECTOR(1 DOWNTO 0);

-- Internal Registers

-- State Machine Registers

begin

-------------------------------------------------------------------------------
--						 Finite State Machine(s)						   --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--							 Sequential Logic							  --
-------------------------------------------------------------------------------
	
-------------------------------------------------------------------------------
--							Combinational Logic							--
-------------------------------------------------------------------------------

DRAM_BA_1  <= BA(1);
DRAM_BA_0  <= BA(0);
DRAM_UDQM  <= DQM(1);
DRAM_LDQM  <= DQM(0);

GPIO_0( 0) <= 'Z';
GPIO_0( 2) <= 'Z';
GPIO_0(16) <= 'Z';
GPIO_0(18) <= 'Z';
GPIO_1( 0) <= 'Z';
GPIO_1( 2) <= 'Z';
GPIO_1(16) <= 'Z';
GPIO_1(18) <= 'Z';

TD_RESET   <= '1';

-------------------------------------------------------------------------------
--							  Internal Modules							 --
-------------------------------------------------------------------------------



NiosII : nios_system
	port map(
		-- 1) global signals:
		clk	   									=> CLOCK_50,
		clk_27 									=> CLOCK_27,
		reset_n									=> KEY(0),
		sdram_clk								=> DRAM_CLK,
		audio_clk								=> AUD_XCK,
	
		-- the_AV_Config
		I2C_SDAT_to_and_from_the_AV_Config		=> I2C_SDAT,
		I2C_SCLK_from_the_AV_Config				=> I2C_SCLK,
	
		-- the_Audio
		AUD_ADCDAT_to_the_Audio					=> AUD_ADCDAT,
		AUD_BCLK_to_and_from_the_Audio			=> AUD_BCLK,
		AUD_ADCLRCK_to_and_from_the_Audio		=> AUD_ADCLRCK,
		AUD_DACLRCK_to_and_from_the_Audio		=> AUD_DACLRCK,
		AUD_DACDAT_from_the_Audio				=> AUD_DACDAT,

		-- the_Char_LCD_16x2
		LCD_DATA_to_and_from_the_Char_LCD_16x2	=> LCD_DATA,
		LCD_ON_from_the_Char_LCD_16x2			=> LCD_ON,
		LCD_BLON_from_the_Char_LCD_16x2			=> LCD_BLON,
		LCD_EN_from_the_Char_LCD_16x2			=> LCD_EN,
		LCD_RS_from_the_Char_LCD_16x2			=> LCD_RS,
		LCD_RW_from_the_Char_LCD_16x2			=> LCD_RW,

		-- the_Expansion_JP1
		GPIO_0_to_and_from_the_Expansion_JP1(0)	=> GPIO_0(1),
		GPIO_0_to_and_from_the_Expansion_JP1(13 downto 1)	
												=> GPIO_0(15 downto 3),
		GPIO_0_to_and_from_the_Expansion_JP1(14)=> GPIO_0(17),
		GPIO_0_to_and_from_the_Expansion_JP1(31 downto 15)	
												=> GPIO_0(35 downto 19),

		-- the_Expansion_JP2
		GPIO_1_to_and_from_the_Expansion_JP2(0)	=> GPIO_1(1),
		GPIO_1_to_and_from_the_Expansion_JP2(13 downto 1)	
												=> GPIO_1(15 downto 3),
		GPIO_1_to_and_from_the_Expansion_JP2(14)=> GPIO_1(17),
		GPIO_1_to_and_from_the_Expansion_JP2(31 downto 15)	
												=> GPIO_1(35 downto 19),

		-- the_Green_LEDs
		LEDG_from_the_Green_LEDs 				=> LEDG,
		
		-- the_HEX3_HEX0
		HEX0_from_the_HEX3_HEX0 				=> HEX0,
		HEX1_from_the_HEX3_HEX0 				=> HEX1,
		HEX2_from_the_HEX3_HEX0 				=> HEX2,
		HEX3_from_the_HEX3_HEX0 				=> HEX3,
		
		-- the_HEX7_HEX4
		HEX4_from_the_HEX7_HEX4 				=> HEX4,
		HEX5_from_the_HEX7_HEX4					=> HEX5,
		HEX6_from_the_HEX7_HEX4					=> HEX6,
		HEX7_from_the_HEX7_HEX4					=> HEX7,
		
		-- the_PS2_Port
		PS2_CLK_to_and_from_the_PS2_Port		=> PS2_CLK,
		PS2_DAT_to_and_from_the_PS2_Port		=> PS2_DAT,
	
		-- the_Pushbuttons
		KEY_to_the_Pushbuttons					=> (KEY(3 downto 1) & "1"),

		-- the_Red_LEDs
		LEDR_from_the_Red_LEDs 					=> LEDR,
		
		-- the_SDRAM
		zs_addr_from_the_sdram					=> DRAM_ADDR,
		zs_ba_from_the_sdram					=> BA,
		zs_cas_n_from_the_sdram					=> DRAM_CAS_N,
		zs_cke_from_the_sdram					=> DRAM_CKE,
		zs_cs_n_from_the_sdram					=> DRAM_CS_N,
		zs_dq_to_and_from_the_sdram				=> DRAM_DQ,
		zs_dqm_from_the_sdram					=> DQM,
		zs_ras_n_from_the_sdram					=> DRAM_RAS_N,
		zs_we_n_from_the_sdram					=> DRAM_WE_N,
		
		-- the_SRAM
		SRAM_ADDR_from_the_SRAM					=> SRAM_ADDR,
		SRAM_CE_N_from_the_SRAM					=> SRAM_CE_N,
		SRAM_DQ_to_and_from_the_SRAM			=> SRAM_DQ,
		SRAM_LB_N_from_the_SRAM					=> SRAM_LB_N,
		SRAM_OE_N_from_the_SRAM					=> SRAM_OE_N,
		SRAM_UB_N_from_the_SRAM 				=> SRAM_UB_N,
		SRAM_WE_N_from_the_SRAM 				=> SRAM_WE_N,
		
		-- the_Serial_port
		UART_RXD_to_the_Serial_port				=> UART_RXD,
		UART_TXD_from_the_Serial_port			=> UART_TXD,
		
		-- the_Slider_switches
		SW_to_the_Slider_switches				=> SW,
		
		-- the_VGA_Controller
		VGA_CLK_from_the_VGA_Controller			=> VGA_CLK,
		VGA_HS_from_the_VGA_Controller			=> VGA_HS,
		VGA_VS_from_the_VGA_Controller			=> VGA_VS,
		VGA_BLANK_from_the_VGA_Controller		=> VGA_BLANK,
		VGA_SYNC_from_the_VGA_Controller		=> VGA_SYNC,
		VGA_R_from_the_VGA_Controller			=> VGA_R,
		VGA_G_from_the_VGA_Controller			=> VGA_G,
		VGA_B_from_the_VGA_Controller			=> VGA_B
	);
	
end DE2_Media_Computer_rtl;

