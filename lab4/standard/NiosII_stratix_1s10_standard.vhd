--megafunction wizard: %Altera SOPC Builder%
--GENERATION: STANDARD
--VERSION: WM1.0


--Legal Notice: (C)2009 Altera Corporation. All rights reserved.  Your
--use of Altera Corporation's design tools, logic functions and other
--software and tools, and its AMPP partner logic functions, and any
--output files any of the foregoing (including device programming or
--simulation files), and any associated documentation or information are
--expressly subject to the terms and conditions of the Altera Program
--License Subscription Agreement or other applicable license agreement,
--including, without limitation, that your use is for the sole purpose
--of programming logic devices manufactured by Altera and sold by Altera
--or its authorized distributors.  Please refer to the applicable
--agreement for further details.


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity NiosII_stratix_1s10_standard_clock_0_in_arbitrator is 
        port (
              -- inputs:
                 signal NiosII_stratix_1s10_standard_clock_0_in_endofpacket : IN STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_in_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_in_waitrequest : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal NiosII_stratix_1s10_standard_clock_0_in_address : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_in_byteenable : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_in_endofpacket_from_sa : OUT STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_in_nativeaddress : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_in_read : OUT STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_in_reset_n : OUT STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa : OUT STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_in_write : OUT STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_in_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_NiosII_stratix_1s10_standard_clock_0_in : OUT STD_LOGIC;
                 signal cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in : OUT STD_LOGIC;
                 signal d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer : OUT STD_LOGIC
              );
end entity NiosII_stratix_1s10_standard_clock_0_in_arbitrator;


architecture europa of NiosII_stratix_1s10_standard_clock_0_in_arbitrator is
                signal NiosII_stratix_1s10_standard_clock_0_in_allgrants :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_allow_new_arb_cycle :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_any_bursting_master_saved_grant :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_any_continuerequest :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_arb_counter_enable :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_in_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_in_beginbursttransfer_internal :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_begins_xfer :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_end_xfer :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_firsttransfer :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_grant_vector :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_in_a_read_cycle :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_in_a_write_cycle :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_master_qreq_vector :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_non_bursting_master_requests :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_reg_firsttransfer :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_slavearbiterlockenable :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_slavearbiterlockenable2 :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_unreg_firsttransfer :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_waits_for_read :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_waits_for_write :  STD_LOGIC;
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_NiosII_stratix_1s10_standard_clock_0_in :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_NiosII_stratix_1s10_standard_clock_0_in :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa :  STD_LOGIC;
                signal internal_cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in :  STD_LOGIC;
                signal internal_cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in :  STD_LOGIC;
                signal shifted_address_to_NiosII_stratix_1s10_standard_clock_0_in_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal wait_for_NiosII_stratix_1s10_standard_clock_0_in_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT NiosII_stratix_1s10_standard_clock_0_in_end_xfer;
    end if;

  end process;

  NiosII_stratix_1s10_standard_clock_0_in_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in);
  --assign NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa = NiosII_stratix_1s10_standard_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa <= NiosII_stratix_1s10_standard_clock_0_in_readdata;
  internal_cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 5) & std_logic_vector'("00000")) = std_logic_vector'("00100000000000000000100000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --assign NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa = NiosII_stratix_1s10_standard_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  internal_NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa <= NiosII_stratix_1s10_standard_clock_0_in_waitrequest;
  --NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter set values, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_arb_share_set_values <= std_logic_vector'("001");
  --NiosII_stratix_1s10_standard_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_non_bursting_master_requests <= internal_cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in;
  --NiosII_stratix_1s10_standard_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_any_bursting_master_saved_grant <= std_logic'('0');
  --NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(NiosII_stratix_1s10_standard_clock_0_in_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (NiosII_stratix_1s10_standard_clock_0_in_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --NiosII_stratix_1s10_standard_clock_0_in_allgrants all slave grants, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_allgrants <= NiosII_stratix_1s10_standard_clock_0_in_grant_vector;
  --NiosII_stratix_1s10_standard_clock_0_in_end_xfer assignment, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_end_xfer <= NOT ((NiosII_stratix_1s10_standard_clock_0_in_waits_for_read OR NiosII_stratix_1s10_standard_clock_0_in_waits_for_write));
  --end_xfer_arb_share_counter_term_NiosII_stratix_1s10_standard_clock_0_in arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_NiosII_stratix_1s10_standard_clock_0_in <= NiosII_stratix_1s10_standard_clock_0_in_end_xfer AND (((NOT NiosII_stratix_1s10_standard_clock_0_in_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_arb_counter_enable <= ((end_xfer_arb_share_counter_term_NiosII_stratix_1s10_standard_clock_0_in AND NiosII_stratix_1s10_standard_clock_0_in_allgrants)) OR ((end_xfer_arb_share_counter_term_NiosII_stratix_1s10_standard_clock_0_in AND NOT NiosII_stratix_1s10_standard_clock_0_in_non_bursting_master_requests));
  --NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(NiosII_stratix_1s10_standard_clock_0_in_arb_counter_enable) = '1' then 
        NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter <= NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --NiosII_stratix_1s10_standard_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      NiosII_stratix_1s10_standard_clock_0_in_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((NiosII_stratix_1s10_standard_clock_0_in_master_qreq_vector AND end_xfer_arb_share_counter_term_NiosII_stratix_1s10_standard_clock_0_in)) OR ((end_xfer_arb_share_counter_term_NiosII_stratix_1s10_standard_clock_0_in AND NOT NiosII_stratix_1s10_standard_clock_0_in_non_bursting_master_requests)))) = '1' then 
        NiosII_stratix_1s10_standard_clock_0_in_slavearbiterlockenable <= or_reduce(NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master NiosII_stratix_1s10_standard_clock_0/in arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= NiosII_stratix_1s10_standard_clock_0_in_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --NiosII_stratix_1s10_standard_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_slavearbiterlockenable2 <= or_reduce(NiosII_stratix_1s10_standard_clock_0_in_arb_share_counter_next_value);
  --cpu/data_master NiosII_stratix_1s10_standard_clock_0/in arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= NiosII_stratix_1s10_standard_clock_0_in_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --NiosII_stratix_1s10_standard_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_any_continuerequest <= std_logic'('1');
  --cpu_data_master_continuerequest continued request, which is an e_assign
  cpu_data_master_continuerequest <= std_logic'('1');
  internal_cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in <= internal_cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in AND NOT ((((cpu_data_master_read AND (NOT cpu_data_master_waitrequest))) OR (((NOT cpu_data_master_waitrequest) AND cpu_data_master_write))));
  --NiosII_stratix_1s10_standard_clock_0_in_writedata mux, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_writedata <= cpu_data_master_writedata (15 DOWNTO 0);
  --assign NiosII_stratix_1s10_standard_clock_0_in_endofpacket_from_sa = NiosII_stratix_1s10_standard_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_endofpacket_from_sa <= NiosII_stratix_1s10_standard_clock_0_in_endofpacket;
  --master is always granted when requested
  internal_cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in <= internal_cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in;
  --cpu/data_master saved-grant NiosII_stratix_1s10_standard_clock_0/in, which is an e_assign
  cpu_data_master_saved_grant_NiosII_stratix_1s10_standard_clock_0_in <= internal_cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in;
  --allow new arb cycle for NiosII_stratix_1s10_standard_clock_0/in, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  NiosII_stratix_1s10_standard_clock_0_in_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  NiosII_stratix_1s10_standard_clock_0_in_master_qreq_vector <= std_logic'('1');
  --NiosII_stratix_1s10_standard_clock_0_in_reset_n assignment, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_reset_n <= reset_n;
  --NiosII_stratix_1s10_standard_clock_0_in_firsttransfer first transaction, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_firsttransfer <= A_WE_StdLogic((std_logic'(NiosII_stratix_1s10_standard_clock_0_in_begins_xfer) = '1'), NiosII_stratix_1s10_standard_clock_0_in_unreg_firsttransfer, NiosII_stratix_1s10_standard_clock_0_in_reg_firsttransfer);
  --NiosII_stratix_1s10_standard_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_unreg_firsttransfer <= NOT ((NiosII_stratix_1s10_standard_clock_0_in_slavearbiterlockenable AND NiosII_stratix_1s10_standard_clock_0_in_any_continuerequest));
  --NiosII_stratix_1s10_standard_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      NiosII_stratix_1s10_standard_clock_0_in_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(NiosII_stratix_1s10_standard_clock_0_in_begins_xfer) = '1' then 
        NiosII_stratix_1s10_standard_clock_0_in_reg_firsttransfer <= NiosII_stratix_1s10_standard_clock_0_in_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --NiosII_stratix_1s10_standard_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_beginbursttransfer_internal <= NiosII_stratix_1s10_standard_clock_0_in_begins_xfer;
  --NiosII_stratix_1s10_standard_clock_0_in_read assignment, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_read <= internal_cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in AND cpu_data_master_read;
  --NiosII_stratix_1s10_standard_clock_0_in_write assignment, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_write <= internal_cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in AND cpu_data_master_write;
  shifted_address_to_NiosII_stratix_1s10_standard_clock_0_in_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --NiosII_stratix_1s10_standard_clock_0_in_address mux, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_address <= A_EXT (A_SRL(shifted_address_to_NiosII_stratix_1s10_standard_clock_0_in_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010")), 4);
  --slaveid NiosII_stratix_1s10_standard_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_nativeaddress <= A_EXT (A_SRL(cpu_data_master_address_to_slave,std_logic_vector'("00000000000000000000000000000010")), 3);
  --d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer <= NiosII_stratix_1s10_standard_clock_0_in_end_xfer;
    end if;

  end process;

  --NiosII_stratix_1s10_standard_clock_0_in_waits_for_read in a cycle, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_waits_for_read <= NiosII_stratix_1s10_standard_clock_0_in_in_a_read_cycle AND internal_NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa;
  --NiosII_stratix_1s10_standard_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_in_a_read_cycle <= internal_cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in AND cpu_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= NiosII_stratix_1s10_standard_clock_0_in_in_a_read_cycle;
  --NiosII_stratix_1s10_standard_clock_0_in_waits_for_write in a cycle, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_waits_for_write <= NiosII_stratix_1s10_standard_clock_0_in_in_a_write_cycle AND internal_NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa;
  --NiosII_stratix_1s10_standard_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_in_in_a_write_cycle <= internal_cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= NiosII_stratix_1s10_standard_clock_0_in_in_a_write_cycle;
  wait_for_NiosII_stratix_1s10_standard_clock_0_in_counter <= std_logic'('0');
  --NiosII_stratix_1s10_standard_clock_0_in_byteenable byte enable port mux, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_in_byteenable <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))), 2);
  --vhdl renameroo for output signals
  NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa <= internal_NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa;
  --vhdl renameroo for output signals
  cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in <= internal_cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in <= internal_cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in;
  --vhdl renameroo for output signals
  cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in <= internal_cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in;
--synthesis translate_off
    --NiosII_stratix_1s10_standard_clock_0/in enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity NiosII_stratix_1s10_standard_clock_0_out_arbitrator is 
        port (
              -- inputs:
                 signal NiosII_stratix_1s10_standard_clock_0_out_address : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_out_byteenable : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 : IN STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 : IN STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_read : IN STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_read_data_valid_pll_s1 : IN STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1 : IN STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_write : IN STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal d1_pll_s1_end_xfer : IN STD_LOGIC;
                 signal pll_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal NiosII_stratix_1s10_standard_clock_0_out_address_to_slave : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_out_readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_out_reset_n : OUT STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_waitrequest : OUT STD_LOGIC
              );
end entity NiosII_stratix_1s10_standard_clock_0_out_arbitrator;


architecture europa of NiosII_stratix_1s10_standard_clock_0_out_arbitrator is
                signal NiosII_stratix_1s10_standard_clock_0_out_address_last_time :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_out_byteenable_last_time :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_out_read_last_time :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_run :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_write_last_time :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_writedata_last_time :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal active_and_waiting_last_time :  STD_LOGIC;
                signal internal_NiosII_stratix_1s10_standard_clock_0_out_address_to_slave :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal internal_NiosII_stratix_1s10_standard_clock_0_out_waitrequest :  STD_LOGIC;
                signal r_2 :  STD_LOGIC;

begin

  --r_2 master_run cascaded wait assignment, which is an e_assign
  r_2 <= Vector_To_Std_Logic(((std_logic_vector'("00000000000000000000000000000001") AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 OR NOT NiosII_stratix_1s10_standard_clock_0_out_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT d1_pll_s1_end_xfer)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NiosII_stratix_1s10_standard_clock_0_out_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 OR NOT NiosII_stratix_1s10_standard_clock_0_out_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NiosII_stratix_1s10_standard_clock_0_out_write)))))))));
  --cascaded wait assignment, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_out_run <= r_2;
  --optimize select-logic by passing only those address bits which matter.
  internal_NiosII_stratix_1s10_standard_clock_0_out_address_to_slave <= NiosII_stratix_1s10_standard_clock_0_out_address;
  --NiosII_stratix_1s10_standard_clock_0/out readdata mux, which is an e_mux
  NiosII_stratix_1s10_standard_clock_0_out_readdata <= pll_s1_readdata_from_sa;
  --actual waitrequest port, which is an e_assign
  internal_NiosII_stratix_1s10_standard_clock_0_out_waitrequest <= NOT NiosII_stratix_1s10_standard_clock_0_out_run;
  --NiosII_stratix_1s10_standard_clock_0_out_reset_n assignment, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_out_reset_n <= reset_n;
  --vhdl renameroo for output signals
  NiosII_stratix_1s10_standard_clock_0_out_address_to_slave <= internal_NiosII_stratix_1s10_standard_clock_0_out_address_to_slave;
  --vhdl renameroo for output signals
  NiosII_stratix_1s10_standard_clock_0_out_waitrequest <= internal_NiosII_stratix_1s10_standard_clock_0_out_waitrequest;
--synthesis translate_off
    --NiosII_stratix_1s10_standard_clock_0_out_address check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        NiosII_stratix_1s10_standard_clock_0_out_address_last_time <= std_logic_vector'("0000");
      elsif clk'event and clk = '1' then
        NiosII_stratix_1s10_standard_clock_0_out_address_last_time <= NiosII_stratix_1s10_standard_clock_0_out_address;
      end if;

    end process;

    --NiosII_stratix_1s10_standard_clock_0/out waited last time, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        active_and_waiting_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        active_and_waiting_last_time <= internal_NiosII_stratix_1s10_standard_clock_0_out_waitrequest AND ((NiosII_stratix_1s10_standard_clock_0_out_read OR NiosII_stratix_1s10_standard_clock_0_out_write));
      end if;

    end process;

    --NiosII_stratix_1s10_standard_clock_0_out_address matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((NiosII_stratix_1s10_standard_clock_0_out_address /= NiosII_stratix_1s10_standard_clock_0_out_address_last_time))))) = '1' then 
          write(write_line, now);
          write(write_line, string'(": "));
          write(write_line, string'("NiosII_stratix_1s10_standard_clock_0_out_address did not heed wait!!!"));
          write(output, write_line.all);
          deallocate (write_line);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --NiosII_stratix_1s10_standard_clock_0_out_byteenable check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        NiosII_stratix_1s10_standard_clock_0_out_byteenable_last_time <= std_logic_vector'("00");
      elsif clk'event and clk = '1' then
        NiosII_stratix_1s10_standard_clock_0_out_byteenable_last_time <= NiosII_stratix_1s10_standard_clock_0_out_byteenable;
      end if;

    end process;

    --NiosII_stratix_1s10_standard_clock_0_out_byteenable matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line1 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((NiosII_stratix_1s10_standard_clock_0_out_byteenable /= NiosII_stratix_1s10_standard_clock_0_out_byteenable_last_time))))) = '1' then 
          write(write_line1, now);
          write(write_line1, string'(": "));
          write(write_line1, string'("NiosII_stratix_1s10_standard_clock_0_out_byteenable did not heed wait!!!"));
          write(output, write_line1.all);
          deallocate (write_line1);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --NiosII_stratix_1s10_standard_clock_0_out_read check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        NiosII_stratix_1s10_standard_clock_0_out_read_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        NiosII_stratix_1s10_standard_clock_0_out_read_last_time <= NiosII_stratix_1s10_standard_clock_0_out_read;
      end if;

    end process;

    --NiosII_stratix_1s10_standard_clock_0_out_read matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line2 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((std_logic'(NiosII_stratix_1s10_standard_clock_0_out_read) /= std_logic'(NiosII_stratix_1s10_standard_clock_0_out_read_last_time)))))) = '1' then 
          write(write_line2, now);
          write(write_line2, string'(": "));
          write(write_line2, string'("NiosII_stratix_1s10_standard_clock_0_out_read did not heed wait!!!"));
          write(output, write_line2.all);
          deallocate (write_line2);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --NiosII_stratix_1s10_standard_clock_0_out_write check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        NiosII_stratix_1s10_standard_clock_0_out_write_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        NiosII_stratix_1s10_standard_clock_0_out_write_last_time <= NiosII_stratix_1s10_standard_clock_0_out_write;
      end if;

    end process;

    --NiosII_stratix_1s10_standard_clock_0_out_write matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line3 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((std_logic'(NiosII_stratix_1s10_standard_clock_0_out_write) /= std_logic'(NiosII_stratix_1s10_standard_clock_0_out_write_last_time)))))) = '1' then 
          write(write_line3, now);
          write(write_line3, string'(": "));
          write(write_line3, string'("NiosII_stratix_1s10_standard_clock_0_out_write did not heed wait!!!"));
          write(output, write_line3.all);
          deallocate (write_line3);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --NiosII_stratix_1s10_standard_clock_0_out_writedata check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        NiosII_stratix_1s10_standard_clock_0_out_writedata_last_time <= std_logic_vector'("0000000000000000");
      elsif clk'event and clk = '1' then
        NiosII_stratix_1s10_standard_clock_0_out_writedata_last_time <= NiosII_stratix_1s10_standard_clock_0_out_writedata;
      end if;

    end process;

    --NiosII_stratix_1s10_standard_clock_0_out_writedata matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line4 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'(((active_and_waiting_last_time AND to_std_logic(((NiosII_stratix_1s10_standard_clock_0_out_writedata /= NiosII_stratix_1s10_standard_clock_0_out_writedata_last_time)))) AND NiosII_stratix_1s10_standard_clock_0_out_write)) = '1' then 
          write(write_line4, now);
          write(write_line4, string'(": "));
          write(write_line4, string'("NiosII_stratix_1s10_standard_clock_0_out_writedata did not heed wait!!!"));
          write(output, write_line4.all);
          deallocate (write_line4);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity button_pio_s1_arbitrator is 
        port (
              -- inputs:
                 signal button_pio_s1_irq : IN STD_LOGIC;
                 signal button_pio_s1_readdata : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal button_pio_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal button_pio_s1_chipselect : OUT STD_LOGIC;
                 signal button_pio_s1_irq_from_sa : OUT STD_LOGIC;
                 signal button_pio_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal button_pio_s1_reset_n : OUT STD_LOGIC;
                 signal button_pio_s1_write_n : OUT STD_LOGIC;
                 signal button_pio_s1_writedata : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_data_master_granted_button_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_button_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_button_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_requests_button_pio_s1 : OUT STD_LOGIC;
                 signal d1_button_pio_s1_end_xfer : OUT STD_LOGIC
              );
end entity button_pio_s1_arbitrator;


architecture europa of button_pio_s1_arbitrator is
                signal button_pio_s1_allgrants :  STD_LOGIC;
                signal button_pio_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal button_pio_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal button_pio_s1_any_continuerequest :  STD_LOGIC;
                signal button_pio_s1_arb_counter_enable :  STD_LOGIC;
                signal button_pio_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal button_pio_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal button_pio_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal button_pio_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal button_pio_s1_begins_xfer :  STD_LOGIC;
                signal button_pio_s1_end_xfer :  STD_LOGIC;
                signal button_pio_s1_firsttransfer :  STD_LOGIC;
                signal button_pio_s1_grant_vector :  STD_LOGIC;
                signal button_pio_s1_in_a_read_cycle :  STD_LOGIC;
                signal button_pio_s1_in_a_write_cycle :  STD_LOGIC;
                signal button_pio_s1_master_qreq_vector :  STD_LOGIC;
                signal button_pio_s1_non_bursting_master_requests :  STD_LOGIC;
                signal button_pio_s1_reg_firsttransfer :  STD_LOGIC;
                signal button_pio_s1_slavearbiterlockenable :  STD_LOGIC;
                signal button_pio_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal button_pio_s1_unreg_firsttransfer :  STD_LOGIC;
                signal button_pio_s1_waits_for_read :  STD_LOGIC;
                signal button_pio_s1_waits_for_write :  STD_LOGIC;
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_button_pio_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_button_pio_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_button_pio_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_button_pio_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_requests_button_pio_s1 :  STD_LOGIC;
                signal shifted_address_to_button_pio_s1_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal wait_for_button_pio_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT button_pio_s1_end_xfer;
    end if;

  end process;

  button_pio_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_data_master_qualified_request_button_pio_s1);
  --assign button_pio_s1_readdata_from_sa = button_pio_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  button_pio_s1_readdata_from_sa <= button_pio_s1_readdata;
  internal_cpu_data_master_requests_button_pio_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("10000100100000100001100000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --button_pio_s1_arb_share_counter set values, which is an e_mux
  button_pio_s1_arb_share_set_values <= std_logic_vector'("001");
  --button_pio_s1_non_bursting_master_requests mux, which is an e_mux
  button_pio_s1_non_bursting_master_requests <= internal_cpu_data_master_requests_button_pio_s1;
  --button_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  button_pio_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --button_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  button_pio_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(button_pio_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (button_pio_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(button_pio_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (button_pio_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --button_pio_s1_allgrants all slave grants, which is an e_mux
  button_pio_s1_allgrants <= button_pio_s1_grant_vector;
  --button_pio_s1_end_xfer assignment, which is an e_assign
  button_pio_s1_end_xfer <= NOT ((button_pio_s1_waits_for_read OR button_pio_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_button_pio_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_button_pio_s1 <= button_pio_s1_end_xfer AND (((NOT button_pio_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --button_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  button_pio_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_button_pio_s1 AND button_pio_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_button_pio_s1 AND NOT button_pio_s1_non_bursting_master_requests));
  --button_pio_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      button_pio_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(button_pio_s1_arb_counter_enable) = '1' then 
        button_pio_s1_arb_share_counter <= button_pio_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --button_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      button_pio_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((button_pio_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_button_pio_s1)) OR ((end_xfer_arb_share_counter_term_button_pio_s1 AND NOT button_pio_s1_non_bursting_master_requests)))) = '1' then 
        button_pio_s1_slavearbiterlockenable <= or_reduce(button_pio_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master button_pio/s1 arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= button_pio_s1_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --button_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  button_pio_s1_slavearbiterlockenable2 <= or_reduce(button_pio_s1_arb_share_counter_next_value);
  --cpu/data_master button_pio/s1 arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= button_pio_s1_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --button_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  button_pio_s1_any_continuerequest <= std_logic'('1');
  --cpu_data_master_continuerequest continued request, which is an e_assign
  cpu_data_master_continuerequest <= std_logic'('1');
  internal_cpu_data_master_qualified_request_button_pio_s1 <= internal_cpu_data_master_requests_button_pio_s1 AND NOT (((NOT cpu_data_master_waitrequest) AND cpu_data_master_write));
  --button_pio_s1_writedata mux, which is an e_mux
  button_pio_s1_writedata <= cpu_data_master_writedata (3 DOWNTO 0);
  --master is always granted when requested
  internal_cpu_data_master_granted_button_pio_s1 <= internal_cpu_data_master_qualified_request_button_pio_s1;
  --cpu/data_master saved-grant button_pio/s1, which is an e_assign
  cpu_data_master_saved_grant_button_pio_s1 <= internal_cpu_data_master_requests_button_pio_s1;
  --allow new arb cycle for button_pio/s1, which is an e_assign
  button_pio_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  button_pio_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  button_pio_s1_master_qreq_vector <= std_logic'('1');
  --button_pio_s1_reset_n assignment, which is an e_assign
  button_pio_s1_reset_n <= reset_n;
  button_pio_s1_chipselect <= internal_cpu_data_master_granted_button_pio_s1;
  --button_pio_s1_firsttransfer first transaction, which is an e_assign
  button_pio_s1_firsttransfer <= A_WE_StdLogic((std_logic'(button_pio_s1_begins_xfer) = '1'), button_pio_s1_unreg_firsttransfer, button_pio_s1_reg_firsttransfer);
  --button_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  button_pio_s1_unreg_firsttransfer <= NOT ((button_pio_s1_slavearbiterlockenable AND button_pio_s1_any_continuerequest));
  --button_pio_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      button_pio_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(button_pio_s1_begins_xfer) = '1' then 
        button_pio_s1_reg_firsttransfer <= button_pio_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --button_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  button_pio_s1_beginbursttransfer_internal <= button_pio_s1_begins_xfer;
  --~button_pio_s1_write_n assignment, which is an e_mux
  button_pio_s1_write_n <= NOT ((internal_cpu_data_master_granted_button_pio_s1 AND cpu_data_master_write));
  shifted_address_to_button_pio_s1_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --button_pio_s1_address mux, which is an e_mux
  button_pio_s1_address <= A_EXT (A_SRL(shifted_address_to_button_pio_s1_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_button_pio_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_button_pio_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_button_pio_s1_end_xfer <= button_pio_s1_end_xfer;
    end if;

  end process;

  --button_pio_s1_waits_for_read in a cycle, which is an e_mux
  button_pio_s1_waits_for_read <= button_pio_s1_in_a_read_cycle AND button_pio_s1_begins_xfer;
  --button_pio_s1_in_a_read_cycle assignment, which is an e_assign
  button_pio_s1_in_a_read_cycle <= internal_cpu_data_master_granted_button_pio_s1 AND cpu_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= button_pio_s1_in_a_read_cycle;
  --button_pio_s1_waits_for_write in a cycle, which is an e_mux
  button_pio_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(button_pio_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --button_pio_s1_in_a_write_cycle assignment, which is an e_assign
  button_pio_s1_in_a_write_cycle <= internal_cpu_data_master_granted_button_pio_s1 AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= button_pio_s1_in_a_write_cycle;
  wait_for_button_pio_s1_counter <= std_logic'('0');
  --assign button_pio_s1_irq_from_sa = button_pio_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  button_pio_s1_irq_from_sa <= button_pio_s1_irq;
  --vhdl renameroo for output signals
  cpu_data_master_granted_button_pio_s1 <= internal_cpu_data_master_granted_button_pio_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_button_pio_s1 <= internal_cpu_data_master_qualified_request_button_pio_s1;
  --vhdl renameroo for output signals
  cpu_data_master_requests_button_pio_s1 <= internal_cpu_data_master_requests_button_pio_s1;
--synthesis translate_off
    --button_pio/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity cpu_jtag_debug_module_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_data_master_debugaccess : IN STD_LOGIC;
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_instruction_master_latency_counter : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_instruction_master_read : IN STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_sdram_s1_shift_register : IN STD_LOGIC;
                 signal cpu_jtag_debug_module_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_jtag_debug_module_resetrequest : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_data_master_granted_cpu_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_cpu_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_cpu_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_data_master_requests_cpu_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_instruction_master_granted_cpu_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_cpu_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_cpu_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_instruction_master_requests_cpu_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_jtag_debug_module_address : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
                 signal cpu_jtag_debug_module_begintransfer : OUT STD_LOGIC;
                 signal cpu_jtag_debug_module_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_jtag_debug_module_chipselect : OUT STD_LOGIC;
                 signal cpu_jtag_debug_module_debugaccess : OUT STD_LOGIC;
                 signal cpu_jtag_debug_module_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_jtag_debug_module_reset : OUT STD_LOGIC;
                 signal cpu_jtag_debug_module_reset_n : OUT STD_LOGIC;
                 signal cpu_jtag_debug_module_resetrequest_from_sa : OUT STD_LOGIC;
                 signal cpu_jtag_debug_module_write : OUT STD_LOGIC;
                 signal cpu_jtag_debug_module_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d1_cpu_jtag_debug_module_end_xfer : OUT STD_LOGIC
              );
end entity cpu_jtag_debug_module_arbitrator;


architecture europa of cpu_jtag_debug_module_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_cpu_jtag_debug_module :  STD_LOGIC;
                signal cpu_instruction_master_arbiterlock :  STD_LOGIC;
                signal cpu_instruction_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_instruction_master_continuerequest :  STD_LOGIC;
                signal cpu_instruction_master_saved_grant_cpu_jtag_debug_module :  STD_LOGIC;
                signal cpu_jtag_debug_module_allgrants :  STD_LOGIC;
                signal cpu_jtag_debug_module_allow_new_arb_cycle :  STD_LOGIC;
                signal cpu_jtag_debug_module_any_bursting_master_saved_grant :  STD_LOGIC;
                signal cpu_jtag_debug_module_any_continuerequest :  STD_LOGIC;
                signal cpu_jtag_debug_module_arb_addend :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_jtag_debug_module_arb_counter_enable :  STD_LOGIC;
                signal cpu_jtag_debug_module_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal cpu_jtag_debug_module_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal cpu_jtag_debug_module_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal cpu_jtag_debug_module_arb_winner :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_jtag_debug_module_arbitration_holdoff_internal :  STD_LOGIC;
                signal cpu_jtag_debug_module_beginbursttransfer_internal :  STD_LOGIC;
                signal cpu_jtag_debug_module_begins_xfer :  STD_LOGIC;
                signal cpu_jtag_debug_module_chosen_master_double_vector :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal cpu_jtag_debug_module_chosen_master_rot_left :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_jtag_debug_module_end_xfer :  STD_LOGIC;
                signal cpu_jtag_debug_module_firsttransfer :  STD_LOGIC;
                signal cpu_jtag_debug_module_grant_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_jtag_debug_module_in_a_read_cycle :  STD_LOGIC;
                signal cpu_jtag_debug_module_in_a_write_cycle :  STD_LOGIC;
                signal cpu_jtag_debug_module_master_qreq_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_jtag_debug_module_non_bursting_master_requests :  STD_LOGIC;
                signal cpu_jtag_debug_module_reg_firsttransfer :  STD_LOGIC;
                signal cpu_jtag_debug_module_saved_chosen_master_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_jtag_debug_module_slavearbiterlockenable :  STD_LOGIC;
                signal cpu_jtag_debug_module_slavearbiterlockenable2 :  STD_LOGIC;
                signal cpu_jtag_debug_module_unreg_firsttransfer :  STD_LOGIC;
                signal cpu_jtag_debug_module_waits_for_read :  STD_LOGIC;
                signal cpu_jtag_debug_module_waits_for_write :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_cpu_jtag_debug_module :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_cpu_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_cpu_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_data_master_requests_cpu_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_instruction_master_granted_cpu_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_instruction_master_qualified_request_cpu_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_instruction_master_requests_cpu_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_jtag_debug_module_reset_n :  STD_LOGIC;
                signal last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module :  STD_LOGIC;
                signal last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module :  STD_LOGIC;
                signal shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal wait_for_cpu_jtag_debug_module_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT cpu_jtag_debug_module_end_xfer;
    end if;

  end process;

  cpu_jtag_debug_module_begins_xfer <= NOT d1_reasons_to_wait AND ((internal_cpu_data_master_qualified_request_cpu_jtag_debug_module OR internal_cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  --assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  cpu_jtag_debug_module_readdata_from_sa <= cpu_jtag_debug_module_readdata;
  internal_cpu_data_master_requests_cpu_jtag_debug_module <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 11) & std_logic_vector'("00000000000")) = std_logic_vector'("10000100100000000000000000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  cpu_jtag_debug_module_arb_share_set_values <= std_logic_vector'("001");
  --cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  cpu_jtag_debug_module_non_bursting_master_requests <= ((internal_cpu_data_master_requests_cpu_jtag_debug_module OR internal_cpu_instruction_master_requests_cpu_jtag_debug_module) OR internal_cpu_data_master_requests_cpu_jtag_debug_module) OR internal_cpu_instruction_master_requests_cpu_jtag_debug_module;
  --cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  cpu_jtag_debug_module_any_bursting_master_saved_grant <= std_logic'('0');
  --cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  cpu_jtag_debug_module_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(cpu_jtag_debug_module_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (cpu_jtag_debug_module_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(cpu_jtag_debug_module_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (cpu_jtag_debug_module_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  cpu_jtag_debug_module_allgrants <= (((or_reduce(cpu_jtag_debug_module_grant_vector)) OR (or_reduce(cpu_jtag_debug_module_grant_vector))) OR (or_reduce(cpu_jtag_debug_module_grant_vector))) OR (or_reduce(cpu_jtag_debug_module_grant_vector));
  --cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  cpu_jtag_debug_module_end_xfer <= NOT ((cpu_jtag_debug_module_waits_for_read OR cpu_jtag_debug_module_waits_for_write));
  --end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_cpu_jtag_debug_module <= cpu_jtag_debug_module_end_xfer AND (((NOT cpu_jtag_debug_module_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  cpu_jtag_debug_module_arb_counter_enable <= ((end_xfer_arb_share_counter_term_cpu_jtag_debug_module AND cpu_jtag_debug_module_allgrants)) OR ((end_xfer_arb_share_counter_term_cpu_jtag_debug_module AND NOT cpu_jtag_debug_module_non_bursting_master_requests));
  --cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_jtag_debug_module_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(cpu_jtag_debug_module_arb_counter_enable) = '1' then 
        cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_jtag_debug_module_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((or_reduce(cpu_jtag_debug_module_master_qreq_vector) AND end_xfer_arb_share_counter_term_cpu_jtag_debug_module)) OR ((end_xfer_arb_share_counter_term_cpu_jtag_debug_module AND NOT cpu_jtag_debug_module_non_bursting_master_requests)))) = '1' then 
        cpu_jtag_debug_module_slavearbiterlockenable <= or_reduce(cpu_jtag_debug_module_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= cpu_jtag_debug_module_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  cpu_jtag_debug_module_slavearbiterlockenable2 <= or_reduce(cpu_jtag_debug_module_arb_share_counter_next_value);
  --cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= cpu_jtag_debug_module_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  cpu_instruction_master_arbiterlock <= cpu_jtag_debug_module_slavearbiterlockenable AND cpu_instruction_master_continuerequest;
  --cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  cpu_instruction_master_arbiterlock2 <= cpu_jtag_debug_module_slavearbiterlockenable2 AND cpu_instruction_master_continuerequest;
  --cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_instruction_master_saved_grant_cpu_jtag_debug_module) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((cpu_jtag_debug_module_arbitration_holdoff_internal OR NOT internal_cpu_instruction_master_requests_cpu_jtag_debug_module))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module))))));
    end if;

  end process;

  --cpu_instruction_master_continuerequest continued request, which is an e_mux
  cpu_instruction_master_continuerequest <= last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module AND internal_cpu_instruction_master_requests_cpu_jtag_debug_module;
  --cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  cpu_jtag_debug_module_any_continuerequest <= cpu_instruction_master_continuerequest OR cpu_data_master_continuerequest;
  internal_cpu_data_master_qualified_request_cpu_jtag_debug_module <= internal_cpu_data_master_requests_cpu_jtag_debug_module AND NOT (((((NOT cpu_data_master_waitrequest) AND cpu_data_master_write)) OR cpu_instruction_master_arbiterlock));
  --cpu_jtag_debug_module_writedata mux, which is an e_mux
  cpu_jtag_debug_module_writedata <= cpu_data_master_writedata;
  internal_cpu_instruction_master_requests_cpu_jtag_debug_module <= ((to_std_logic(((Std_Logic_Vector'(cpu_instruction_master_address_to_slave(25 DOWNTO 11) & std_logic_vector'("00000000000")) = std_logic_vector'("10000100100000000000000000")))) AND (cpu_instruction_master_read))) AND cpu_instruction_master_read;
  --cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_data_master_saved_grant_cpu_jtag_debug_module) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((cpu_jtag_debug_module_arbitration_holdoff_internal OR NOT internal_cpu_data_master_requests_cpu_jtag_debug_module))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module))))));
    end if;

  end process;

  --cpu_data_master_continuerequest continued request, which is an e_mux
  cpu_data_master_continuerequest <= last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module AND internal_cpu_data_master_requests_cpu_jtag_debug_module;
  internal_cpu_instruction_master_qualified_request_cpu_jtag_debug_module <= internal_cpu_instruction_master_requests_cpu_jtag_debug_module AND NOT ((((cpu_instruction_master_read AND ((to_std_logic((((std_logic_vector'("000000000000000000000000000000") & (cpu_instruction_master_latency_counter)) /= std_logic_vector'("00000000000000000000000000000000")))) OR (cpu_instruction_master_read_data_valid_sdram_s1_shift_register))))) OR cpu_data_master_arbiterlock));
  --local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  cpu_instruction_master_read_data_valid_cpu_jtag_debug_module <= (internal_cpu_instruction_master_granted_cpu_jtag_debug_module AND cpu_instruction_master_read) AND NOT cpu_jtag_debug_module_waits_for_read;
  --allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  cpu_jtag_debug_module_allow_new_arb_cycle <= NOT cpu_data_master_arbiterlock AND NOT cpu_instruction_master_arbiterlock;
  --cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  cpu_jtag_debug_module_master_qreq_vector(0) <= internal_cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  --cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  internal_cpu_instruction_master_granted_cpu_jtag_debug_module <= cpu_jtag_debug_module_grant_vector(0);
  --cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  cpu_instruction_master_saved_grant_cpu_jtag_debug_module <= cpu_jtag_debug_module_arb_winner(0) AND internal_cpu_instruction_master_requests_cpu_jtag_debug_module;
  --cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  cpu_jtag_debug_module_master_qreq_vector(1) <= internal_cpu_data_master_qualified_request_cpu_jtag_debug_module;
  --cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  internal_cpu_data_master_granted_cpu_jtag_debug_module <= cpu_jtag_debug_module_grant_vector(1);
  --cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  cpu_data_master_saved_grant_cpu_jtag_debug_module <= cpu_jtag_debug_module_arb_winner(1) AND internal_cpu_data_master_requests_cpu_jtag_debug_module;
  --cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  cpu_jtag_debug_module_chosen_master_double_vector <= A_EXT (((std_logic_vector'("0") & ((cpu_jtag_debug_module_master_qreq_vector & cpu_jtag_debug_module_master_qreq_vector))) AND (((std_logic_vector'("0") & (Std_Logic_Vector'(NOT cpu_jtag_debug_module_master_qreq_vector & NOT cpu_jtag_debug_module_master_qreq_vector))) + (std_logic_vector'("000") & (cpu_jtag_debug_module_arb_addend))))), 4);
  --stable onehot encoding of arb winner
  cpu_jtag_debug_module_arb_winner <= A_WE_StdLogicVector((std_logic'(((cpu_jtag_debug_module_allow_new_arb_cycle AND or_reduce(cpu_jtag_debug_module_grant_vector)))) = '1'), cpu_jtag_debug_module_grant_vector, cpu_jtag_debug_module_saved_chosen_master_vector);
  --saved cpu_jtag_debug_module_grant_vector, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_jtag_debug_module_saved_chosen_master_vector <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(cpu_jtag_debug_module_allow_new_arb_cycle) = '1' then 
        cpu_jtag_debug_module_saved_chosen_master_vector <= A_WE_StdLogicVector((std_logic'(or_reduce(cpu_jtag_debug_module_grant_vector)) = '1'), cpu_jtag_debug_module_grant_vector, cpu_jtag_debug_module_saved_chosen_master_vector);
      end if;
    end if;

  end process;

  --onehot encoding of chosen master
  cpu_jtag_debug_module_grant_vector <= Std_Logic_Vector'(A_ToStdLogicVector(((cpu_jtag_debug_module_chosen_master_double_vector(1) OR cpu_jtag_debug_module_chosen_master_double_vector(3)))) & A_ToStdLogicVector(((cpu_jtag_debug_module_chosen_master_double_vector(0) OR cpu_jtag_debug_module_chosen_master_double_vector(2)))));
  --cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  cpu_jtag_debug_module_chosen_master_rot_left <= A_EXT (A_WE_StdLogicVector((((A_SLL(cpu_jtag_debug_module_arb_winner,std_logic_vector'("00000000000000000000000000000001")))) /= std_logic_vector'("00")), (std_logic_vector'("000000000000000000000000000000") & ((A_SLL(cpu_jtag_debug_module_arb_winner,std_logic_vector'("00000000000000000000000000000001"))))), std_logic_vector'("00000000000000000000000000000001")), 2);
  --cpu/jtag_debug_module's addend for next-master-grant
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_jtag_debug_module_arb_addend <= std_logic_vector'("01");
    elsif clk'event and clk = '1' then
      if std_logic'(or_reduce(cpu_jtag_debug_module_grant_vector)) = '1' then 
        cpu_jtag_debug_module_arb_addend <= A_WE_StdLogicVector((std_logic'(cpu_jtag_debug_module_end_xfer) = '1'), cpu_jtag_debug_module_chosen_master_rot_left, cpu_jtag_debug_module_grant_vector);
      end if;
    end if;

  end process;

  cpu_jtag_debug_module_begintransfer <= cpu_jtag_debug_module_begins_xfer;
  --assign lhs ~cpu_jtag_debug_module_reset of type reset_n to cpu_jtag_debug_module_reset_n, which is an e_assign
  cpu_jtag_debug_module_reset <= NOT internal_cpu_jtag_debug_module_reset_n;
  --cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  internal_cpu_jtag_debug_module_reset_n <= reset_n;
  --assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  cpu_jtag_debug_module_resetrequest_from_sa <= cpu_jtag_debug_module_resetrequest;
  cpu_jtag_debug_module_chipselect <= internal_cpu_data_master_granted_cpu_jtag_debug_module OR internal_cpu_instruction_master_granted_cpu_jtag_debug_module;
  --cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  cpu_jtag_debug_module_firsttransfer <= A_WE_StdLogic((std_logic'(cpu_jtag_debug_module_begins_xfer) = '1'), cpu_jtag_debug_module_unreg_firsttransfer, cpu_jtag_debug_module_reg_firsttransfer);
  --cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  cpu_jtag_debug_module_unreg_firsttransfer <= NOT ((cpu_jtag_debug_module_slavearbiterlockenable AND cpu_jtag_debug_module_any_continuerequest));
  --cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_jtag_debug_module_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(cpu_jtag_debug_module_begins_xfer) = '1' then 
        cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  cpu_jtag_debug_module_beginbursttransfer_internal <= cpu_jtag_debug_module_begins_xfer;
  --cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  cpu_jtag_debug_module_arbitration_holdoff_internal <= cpu_jtag_debug_module_begins_xfer AND cpu_jtag_debug_module_firsttransfer;
  --cpu_jtag_debug_module_write assignment, which is an e_mux
  cpu_jtag_debug_module_write <= internal_cpu_data_master_granted_cpu_jtag_debug_module AND cpu_data_master_write;
  shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --cpu_jtag_debug_module_address mux, which is an e_mux
  cpu_jtag_debug_module_address <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_cpu_jtag_debug_module)) = '1'), (A_SRL(shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010"))), (A_SRL(shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master,std_logic_vector'("00000000000000000000000000000010")))), 9);
  shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master <= cpu_instruction_master_address_to_slave;
  --d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_cpu_jtag_debug_module_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end if;

  end process;

  --cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  cpu_jtag_debug_module_waits_for_read <= cpu_jtag_debug_module_in_a_read_cycle AND cpu_jtag_debug_module_begins_xfer;
  --cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  cpu_jtag_debug_module_in_a_read_cycle <= ((internal_cpu_data_master_granted_cpu_jtag_debug_module AND cpu_data_master_read)) OR ((internal_cpu_instruction_master_granted_cpu_jtag_debug_module AND cpu_instruction_master_read));
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= cpu_jtag_debug_module_in_a_read_cycle;
  --cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  cpu_jtag_debug_module_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_jtag_debug_module_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  cpu_jtag_debug_module_in_a_write_cycle <= internal_cpu_data_master_granted_cpu_jtag_debug_module AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= cpu_jtag_debug_module_in_a_write_cycle;
  wait_for_cpu_jtag_debug_module_counter <= std_logic'('0');
  --cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  cpu_jtag_debug_module_byteenable <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_cpu_jtag_debug_module)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))), 4);
  --debugaccess mux, which is an e_mux
  cpu_jtag_debug_module_debugaccess <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_cpu_jtag_debug_module)) = '1'), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_debugaccess))), std_logic_vector'("00000000000000000000000000000000")));
  --vhdl renameroo for output signals
  cpu_data_master_granted_cpu_jtag_debug_module <= internal_cpu_data_master_granted_cpu_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_cpu_jtag_debug_module <= internal_cpu_data_master_qualified_request_cpu_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_data_master_requests_cpu_jtag_debug_module <= internal_cpu_data_master_requests_cpu_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_instruction_master_granted_cpu_jtag_debug_module <= internal_cpu_instruction_master_granted_cpu_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_instruction_master_qualified_request_cpu_jtag_debug_module <= internal_cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_instruction_master_requests_cpu_jtag_debug_module <= internal_cpu_instruction_master_requests_cpu_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_jtag_debug_module_reset_n <= internal_cpu_jtag_debug_module_reset_n;
--synthesis translate_off
    --cpu/jtag_debug_module enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

    --grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line5 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_data_master_granted_cpu_jtag_debug_module))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_instruction_master_granted_cpu_jtag_debug_module))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line5, now);
          write(write_line5, string'(": "));
          write(write_line5, string'("> 1 of grant signals are active simultaneously"));
          write(output, write_line5.all);
          deallocate (write_line5);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --saved_grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line6 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_data_master_saved_grant_cpu_jtag_debug_module))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_saved_grant_cpu_jtag_debug_module))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line6, now);
          write(write_line6, string'(": "));
          write(write_line6, string'("> 1 of saved_grant signals are active simultaneously"));
          write(output, write_line6.all);
          deallocate (write_line6);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_data_master_arbitrator is 
        port (
              -- inputs:
                 signal NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa : IN STD_LOGIC;
                 signal button_pio_s1_irq_from_sa : IN STD_LOGIC;
                 signal button_pio_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_byteenable_ext_flash_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in : IN STD_LOGIC;
                 signal cpu_data_master_granted_button_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_cpu_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_data_master_granted_ext_flash_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_ext_ram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_high_res_timer_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_jtag_uart_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_data_master_granted_lan91c111_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_lcd_display_control_slave : IN STD_LOGIC;
                 signal cpu_data_master_granted_led_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_onchip_ram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_reconfig_request_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_sdram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_seven_seg_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_sys_clk_timer_s1 : IN STD_LOGIC;
                 signal cpu_data_master_granted_sysid_control_slave : IN STD_LOGIC;
                 signal cpu_data_master_granted_uart1_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_button_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_cpu_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_ext_flash_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_ext_ram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_high_res_timer_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_lan91c111_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_lcd_display_control_slave : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_led_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_onchip_ram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_reconfig_request_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_sdram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_seven_seg_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_sys_clk_timer_s1 : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_sysid_control_slave : IN STD_LOGIC;
                 signal cpu_data_master_qualified_request_uart1_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_NiosII_stratix_1s10_standard_clock_0_in : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_button_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_cpu_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_ext_flash_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_ext_ram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_high_res_timer_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_lan91c111_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_lcd_display_control_slave : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_led_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_onchip_ram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_reconfig_request_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_sdram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_sdram_s1_shift_register : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_seven_seg_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_sys_clk_timer_s1 : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_sysid_control_slave : IN STD_LOGIC;
                 signal cpu_data_master_read_data_valid_uart1_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in : IN STD_LOGIC;
                 signal cpu_data_master_requests_button_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_cpu_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_data_master_requests_ext_flash_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_ext_ram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_high_res_timer_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_jtag_uart_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_data_master_requests_lan91c111_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_lcd_display_control_slave : IN STD_LOGIC;
                 signal cpu_data_master_requests_led_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_onchip_ram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_reconfig_request_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_sdram_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_seven_seg_pio_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_sys_clk_timer_s1 : IN STD_LOGIC;
                 signal cpu_data_master_requests_sysid_control_slave : IN STD_LOGIC;
                 signal cpu_data_master_requests_uart1_s1 : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer : IN STD_LOGIC;
                 signal d1_button_pio_s1_end_xfer : IN STD_LOGIC;
                 signal d1_cpu_jtag_debug_module_end_xfer : IN STD_LOGIC;
                 signal d1_ext_ram_bus_avalon_slave_end_xfer : IN STD_LOGIC;
                 signal d1_high_res_timer_s1_end_xfer : IN STD_LOGIC;
                 signal d1_irq_from_the_lan91c111 : IN STD_LOGIC;
                 signal d1_jtag_uart_avalon_jtag_slave_end_xfer : IN STD_LOGIC;
                 signal d1_lcd_display_control_slave_end_xfer : IN STD_LOGIC;
                 signal d1_led_pio_s1_end_xfer : IN STD_LOGIC;
                 signal d1_onchip_ram_s1_end_xfer : IN STD_LOGIC;
                 signal d1_reconfig_request_pio_s1_end_xfer : IN STD_LOGIC;
                 signal d1_sdram_s1_end_xfer : IN STD_LOGIC;
                 signal d1_seven_seg_pio_s1_end_xfer : IN STD_LOGIC;
                 signal d1_sys_clk_timer_s1_end_xfer : IN STD_LOGIC;
                 signal d1_sysid_control_slave_end_xfer : IN STD_LOGIC;
                 signal d1_uart1_s1_end_xfer : IN STD_LOGIC;
                 signal ext_flash_s1_wait_counter_eq_0 : IN STD_LOGIC;
                 signal ext_flash_s1_wait_counter_eq_1 : IN STD_LOGIC;
                 signal high_res_timer_s1_irq_from_sa : IN STD_LOGIC;
                 signal high_res_timer_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal incoming_ext_ram_bus_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal incoming_ext_ram_bus_data_with_Xs_converted_to_0 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal jtag_uart_avalon_jtag_slave_irq_from_sa : IN STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_avalon_jtag_slave_waitrequest_from_sa : IN STD_LOGIC;
                 signal lan91c111_s1_wait_counter_eq_0 : IN STD_LOGIC;
                 signal lan91c111_s1_wait_counter_eq_1 : IN STD_LOGIC;
                 signal lcd_display_control_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal lcd_display_control_slave_wait_counter_eq_0 : IN STD_LOGIC;
                 signal lcd_display_control_slave_wait_counter_eq_1 : IN STD_LOGIC;
                 signal led_pio_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal onchip_ram_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reconfig_request_pio_s1_readdata_from_sa : IN STD_LOGIC;
                 signal registered_cpu_data_master_read_data_valid_ext_flash_s1 : IN STD_LOGIC;
                 signal registered_cpu_data_master_read_data_valid_ext_ram_s1 : IN STD_LOGIC;
                 signal registered_cpu_data_master_read_data_valid_lan91c111_s1 : IN STD_LOGIC;
                 signal registered_cpu_data_master_read_data_valid_onchip_ram_s1 : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sdram_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal sdram_s1_waitrequest_from_sa : IN STD_LOGIC;
                 signal seven_seg_pio_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal sys_clk_timer_s1_irq_from_sa : IN STD_LOGIC;
                 signal sys_clk_timer_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal sysid_control_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal uart1_s1_irq_from_sa : IN STD_LOGIC;
                 signal uart1_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- outputs:
                 signal cpu_data_master_address_to_slave : OUT STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_dbs_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_data_master_dbs_write_8 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal cpu_data_master_irq : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_data_master_no_byte_enables_and_last_term : OUT STD_LOGIC;
                 signal cpu_data_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_data_master_waitrequest : OUT STD_LOGIC
              );
end entity cpu_data_master_arbitrator;


architecture europa of cpu_data_master_arbitrator is
                signal cpu_data_master_dbs_increment :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_data_master_run :  STD_LOGIC;
                signal dbs_8_reg_segment_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal dbs_8_reg_segment_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal dbs_8_reg_segment_2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal dbs_count_enable :  STD_LOGIC;
                signal dbs_counter_overflow :  STD_LOGIC;
                signal internal_cpu_data_master_address_to_slave :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal internal_cpu_data_master_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal internal_cpu_data_master_no_byte_enables_and_last_term :  STD_LOGIC;
                signal internal_cpu_data_master_waitrequest :  STD_LOGIC;
                signal last_dbs_term_and_run :  STD_LOGIC;
                signal next_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal p1_dbs_8_reg_segment_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal p1_dbs_8_reg_segment_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal p1_dbs_8_reg_segment_2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal p1_registered_cpu_data_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal pre_dbs_count_enable :  STD_LOGIC;
                signal r_0 :  STD_LOGIC;
                signal r_1 :  STD_LOGIC;
                signal r_2 :  STD_LOGIC;
                signal r_3 :  STD_LOGIC;
                signal registered_cpu_data_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

  --r_0 master_run cascaded wait assignment, which is an e_assign
  r_0 <= Vector_To_Std_Logic((((((((((((((((((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in OR NOT cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in OR NOT ((cpu_data_master_read OR cpu_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_read OR cpu_data_master_write)))))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in OR NOT ((cpu_data_master_read OR cpu_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_read OR cpu_data_master_write)))))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_qualified_request_button_pio_s1 OR NOT cpu_data_master_requests_button_pio_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_button_pio_s1 OR NOT cpu_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_button_pio_s1 OR NOT cpu_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_qualified_request_cpu_jtag_debug_module OR NOT cpu_data_master_requests_cpu_jtag_debug_module)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_granted_cpu_jtag_debug_module OR NOT cpu_data_master_qualified_request_cpu_jtag_debug_module)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_cpu_jtag_debug_module OR NOT cpu_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_cpu_jtag_debug_module OR NOT cpu_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((cpu_data_master_qualified_request_lan91c111_s1 OR registered_cpu_data_master_read_data_valid_lan91c111_s1) OR NOT cpu_data_master_requests_lan91c111_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((((cpu_data_master_qualified_request_ext_flash_s1 OR (((registered_cpu_data_master_read_data_valid_ext_flash_s1 AND internal_cpu_data_master_dbs_address(1)) AND internal_cpu_data_master_dbs_address(0)))) OR ((((cpu_data_master_write AND NOT(cpu_data_master_byteenable_ext_flash_s1)) AND internal_cpu_data_master_dbs_address(1)) AND internal_cpu_data_master_dbs_address(0)))) OR NOT cpu_data_master_requests_ext_flash_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((cpu_data_master_qualified_request_ext_ram_s1 OR registered_cpu_data_master_read_data_valid_ext_ram_s1) OR NOT cpu_data_master_requests_ext_ram_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_granted_lan91c111_s1 OR NOT cpu_data_master_qualified_request_lan91c111_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_granted_ext_flash_s1 OR NOT cpu_data_master_qualified_request_ext_flash_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_granted_ext_ram_s1 OR NOT cpu_data_master_qualified_request_ext_ram_s1)))))));
  --cascaded wait assignment, which is an e_assign
  cpu_data_master_run <= ((r_0 AND r_1) AND r_2) AND r_3;
  --r_1 master_run cascaded wait assignment, which is an e_assign
  r_1 <= Vector_To_Std_Logic(((((((((((((((((((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((NOT cpu_data_master_qualified_request_lan91c111_s1 OR NOT cpu_data_master_read) OR ((registered_cpu_data_master_read_data_valid_lan91c111_s1 AND cpu_data_master_read))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_lan91c111_s1 OR NOT cpu_data_master_write)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(lan91c111_s1_wait_counter_eq_1)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write)))))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((NOT cpu_data_master_qualified_request_ext_flash_s1 OR NOT cpu_data_master_read) OR (((registered_cpu_data_master_read_data_valid_ext_flash_s1 AND ((internal_cpu_data_master_dbs_address(1) AND internal_cpu_data_master_dbs_address(0)))) AND cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_ext_flash_s1 OR NOT cpu_data_master_write)))) OR ((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(ext_flash_s1_wait_counter_eq_1)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((internal_cpu_data_master_dbs_address(1) AND internal_cpu_data_master_dbs_address(0))))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write)))))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((NOT cpu_data_master_qualified_request_ext_ram_s1 OR NOT cpu_data_master_read) OR ((registered_cpu_data_master_read_data_valid_ext_ram_s1 AND cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_ext_ram_s1 OR NOT cpu_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_qualified_request_high_res_timer_s1 OR NOT cpu_data_master_requests_high_res_timer_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_high_res_timer_s1 OR NOT cpu_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_high_res_timer_s1 OR NOT cpu_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave OR NOT cpu_data_master_requests_jtag_uart_avalon_jtag_slave)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave OR NOT ((cpu_data_master_read OR cpu_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT jtag_uart_avalon_jtag_slave_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_read OR cpu_data_master_write)))))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave OR NOT ((cpu_data_master_read OR cpu_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT jtag_uart_avalon_jtag_slave_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_read OR cpu_data_master_write)))))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_lcd_display_control_slave OR NOT cpu_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(lcd_display_control_slave_wait_counter_eq_1)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_lcd_display_control_slave OR NOT cpu_data_master_write)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(lcd_display_control_slave_wait_counter_eq_1)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_qualified_request_led_pio_s1 OR NOT cpu_data_master_requests_led_pio_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_led_pio_s1 OR NOT cpu_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_read)))))))));
  --r_2 master_run cascaded wait assignment, which is an e_assign
  r_2 <= Vector_To_Std_Logic(((((((((((((((((((((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_led_pio_s1 OR NOT cpu_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((cpu_data_master_qualified_request_onchip_ram_s1 OR registered_cpu_data_master_read_data_valid_onchip_ram_s1) OR NOT cpu_data_master_requests_onchip_ram_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_granted_onchip_ram_s1 OR NOT cpu_data_master_qualified_request_onchip_ram_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((NOT cpu_data_master_qualified_request_onchip_ram_s1 OR NOT cpu_data_master_read) OR ((registered_cpu_data_master_read_data_valid_onchip_ram_s1 AND cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_onchip_ram_s1 OR NOT ((cpu_data_master_read OR cpu_data_master_write)))))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_read OR cpu_data_master_write)))))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_qualified_request_reconfig_request_pio_s1 OR NOT cpu_data_master_requests_reconfig_request_pio_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_reconfig_request_pio_s1 OR NOT cpu_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_reconfig_request_pio_s1 OR NOT cpu_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((cpu_data_master_qualified_request_sdram_s1 OR cpu_data_master_read_data_valid_sdram_s1) OR NOT cpu_data_master_requests_sdram_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_granted_sdram_s1 OR NOT cpu_data_master_qualified_request_sdram_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((NOT cpu_data_master_qualified_request_sdram_s1 OR NOT cpu_data_master_read) OR ((cpu_data_master_read_data_valid_sdram_s1 AND cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_sdram_s1 OR NOT ((cpu_data_master_read OR cpu_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT sdram_s1_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_read OR cpu_data_master_write)))))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_qualified_request_seven_seg_pio_s1 OR NOT cpu_data_master_requests_seven_seg_pio_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_seven_seg_pio_s1 OR NOT cpu_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_seven_seg_pio_s1 OR NOT cpu_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")));
  --r_3 master_run cascaded wait assignment, which is an e_assign
  r_3 <= Vector_To_Std_Logic((((((((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_qualified_request_sys_clk_timer_s1 OR NOT cpu_data_master_requests_sys_clk_timer_s1))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_sys_clk_timer_s1 OR NOT cpu_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_sys_clk_timer_s1 OR NOT cpu_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_sysid_control_slave OR NOT cpu_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_sysid_control_slave OR NOT cpu_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_uart1_s1 OR NOT ((cpu_data_master_read OR cpu_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_read OR cpu_data_master_write)))))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_data_master_qualified_request_uart1_s1 OR NOT ((cpu_data_master_read OR cpu_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_read OR cpu_data_master_write)))))))))));
  --optimize select-logic by passing only those address bits which matter.
  internal_cpu_data_master_address_to_slave <= cpu_data_master_address(25 DOWNTO 0);
  --unpredictable registered wait state incoming data, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      registered_cpu_data_master_readdata <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      registered_cpu_data_master_readdata <= p1_registered_cpu_data_master_readdata;
    end if;

  end process;

  --registered readdata mux, which is an e_mux
  p1_registered_cpu_data_master_readdata <= (((A_REP(NOT cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in, 32) OR (std_logic_vector'("0000000000000000") & (NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa)))) AND ((A_REP(NOT cpu_data_master_requests_jtag_uart_avalon_jtag_slave, 32) OR jtag_uart_avalon_jtag_slave_readdata_from_sa))) AND ((A_REP(NOT cpu_data_master_requests_sdram_s1, 32) OR sdram_s1_readdata_from_sa));
  --cpu/data_master readdata mux, which is an e_mux
  cpu_data_master_readdata <= (((((((((((((((((A_REP(NOT cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in, 32) OR registered_cpu_data_master_readdata)) AND ((A_REP(NOT cpu_data_master_requests_button_pio_s1, 32) OR (std_logic_vector'("0000000000000000000000000000") & (button_pio_s1_readdata_from_sa))))) AND ((A_REP(NOT cpu_data_master_requests_cpu_jtag_debug_module, 32) OR cpu_jtag_debug_module_readdata_from_sa))) AND ((A_REP(NOT cpu_data_master_requests_lan91c111_s1, 32) OR incoming_ext_ram_bus_data))) AND ((A_REP(NOT cpu_data_master_requests_ext_flash_s1, 32) OR Std_Logic_Vector'(incoming_ext_ram_bus_data_with_Xs_converted_to_0(7 DOWNTO 0) & dbs_8_reg_segment_2 & dbs_8_reg_segment_1 & dbs_8_reg_segment_0)))) AND ((A_REP(NOT cpu_data_master_requests_ext_ram_s1, 32) OR incoming_ext_ram_bus_data))) AND ((A_REP(NOT cpu_data_master_requests_high_res_timer_s1, 32) OR (std_logic_vector'("0000000000000000") & (high_res_timer_s1_readdata_from_sa))))) AND ((A_REP(NOT cpu_data_master_requests_jtag_uart_avalon_jtag_slave, 32) OR registered_cpu_data_master_readdata))) AND ((A_REP(NOT cpu_data_master_requests_lcd_display_control_slave, 32) OR (std_logic_vector'("000000000000000000000000") & (lcd_display_control_slave_readdata_from_sa))))) AND ((A_REP(NOT cpu_data_master_requests_led_pio_s1, 32) OR (std_logic_vector'("000000000000000000000000") & (led_pio_s1_readdata_from_sa))))) AND ((A_REP(NOT cpu_data_master_requests_onchip_ram_s1, 32) OR onchip_ram_s1_readdata_from_sa))) AND ((A_REP(NOT cpu_data_master_requests_reconfig_request_pio_s1, 32) OR (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(reconfig_request_pio_s1_readdata_from_sa)))))) AND ((A_REP(NOT cpu_data_master_requests_sdram_s1, 32) OR registered_cpu_data_master_readdata))) AND ((A_REP(NOT cpu_data_master_requests_seven_seg_pio_s1, 32) OR (std_logic_vector'("0000000000000000") & (seven_seg_pio_s1_readdata_from_sa))))) AND ((A_REP(NOT cpu_data_master_requests_sys_clk_timer_s1, 32) OR (std_logic_vector'("0000000000000000") & (sys_clk_timer_s1_readdata_from_sa))))) AND ((A_REP(NOT cpu_data_master_requests_sysid_control_slave, 32) OR sysid_control_slave_readdata_from_sa))) AND ((A_REP(NOT cpu_data_master_requests_uart1_s1, 32) OR (std_logic_vector'("0000000000000000") & (uart1_s1_readdata_from_sa))));
  --actual waitrequest port, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_cpu_data_master_waitrequest <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      internal_cpu_data_master_waitrequest <= Vector_To_Std_Logic(NOT (A_WE_StdLogicVector((std_logic'((NOT ((cpu_data_master_read OR cpu_data_master_write)))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_data_master_run AND internal_cpu_data_master_waitrequest))))))));
    end if;

  end process;

  --irq assign, which is an e_assign
  cpu_data_master_irq <= Std_Logic_Vector'(A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(d1_irq_from_the_lan91c111) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(uart1_s1_irq_from_sa) & A_ToStdLogicVector(high_res_timer_s1_irq_from_sa) & A_ToStdLogicVector(button_pio_s1_irq_from_sa) & A_ToStdLogicVector(jtag_uart_avalon_jtag_slave_irq_from_sa) & A_ToStdLogicVector(sys_clk_timer_s1_irq_from_sa));
  --no_byte_enables_and_last_term, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_cpu_data_master_no_byte_enables_and_last_term <= std_logic'('0');
    elsif clk'event and clk = '1' then
      internal_cpu_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end if;

  end process;

  --compute the last dbs term, which is an e_mux
  last_dbs_term_and_run <= (to_std_logic(((internal_cpu_data_master_dbs_address = std_logic_vector'("11")))) AND cpu_data_master_write) AND NOT(cpu_data_master_byteenable_ext_flash_s1);
  --pre dbs count enable, which is an e_mux
  pre_dbs_count_enable <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((((((NOT internal_cpu_data_master_no_byte_enables_and_last_term) AND cpu_data_master_requests_ext_flash_s1) AND cpu_data_master_write) AND NOT(cpu_data_master_byteenable_ext_flash_s1))) OR cpu_data_master_read_data_valid_ext_flash_s1)))) OR (((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((cpu_data_master_granted_ext_flash_s1 AND cpu_data_master_write)))) AND std_logic_vector'("00000000000000000000000000000001")) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((ext_flash_s1_wait_counter_eq_0 AND NOT d1_ext_ram_bus_avalon_slave_end_xfer)))))))));
  --input to dbs-8 stored 0, which is an e_mux
  p1_dbs_8_reg_segment_0 <= incoming_ext_ram_bus_data_with_Xs_converted_to_0;
  --dbs register for dbs-8 segment 0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbs_8_reg_segment_0 <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'((dbs_count_enable AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & ((internal_cpu_data_master_dbs_address(1 DOWNTO 0)))) = std_logic_vector'("00000000000000000000000000000000")))))) = '1' then 
        dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
      end if;
    end if;

  end process;

  --input to dbs-8 stored 1, which is an e_mux
  p1_dbs_8_reg_segment_1 <= incoming_ext_ram_bus_data_with_Xs_converted_to_0;
  --dbs register for dbs-8 segment 1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbs_8_reg_segment_1 <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'((dbs_count_enable AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & ((internal_cpu_data_master_dbs_address(1 DOWNTO 0)))) = std_logic_vector'("00000000000000000000000000000001")))))) = '1' then 
        dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
      end if;
    end if;

  end process;

  --input to dbs-8 stored 2, which is an e_mux
  p1_dbs_8_reg_segment_2 <= incoming_ext_ram_bus_data_with_Xs_converted_to_0;
  --dbs register for dbs-8 segment 2, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbs_8_reg_segment_2 <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'((dbs_count_enable AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & ((internal_cpu_data_master_dbs_address(1 DOWNTO 0)))) = std_logic_vector'("00000000000000000000000000000010")))))) = '1' then 
        dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
      end if;
    end if;

  end process;

  --mux write dbs 2, which is an e_mux
  cpu_data_master_dbs_write_8 <= A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (internal_cpu_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000000"))), cpu_data_master_writedata(7 DOWNTO 0), A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (internal_cpu_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000001"))), cpu_data_master_writedata(15 DOWNTO 8), A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (internal_cpu_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000010"))), cpu_data_master_writedata(23 DOWNTO 16), cpu_data_master_writedata(31 DOWNTO 24))));
  --dbs count increment, which is an e_mux
  cpu_data_master_dbs_increment <= A_EXT (A_WE_StdLogicVector((std_logic'((cpu_data_master_requests_ext_flash_s1)) = '1'), std_logic_vector'("00000000000000000000000000000001"), std_logic_vector'("00000000000000000000000000000000")), 2);
  --dbs counter overflow, which is an e_assign
  dbs_counter_overflow <= internal_cpu_data_master_dbs_address(1) AND NOT((next_dbs_address(1)));
  --next master address, which is an e_assign
  next_dbs_address <= A_EXT (((std_logic_vector'("0") & (internal_cpu_data_master_dbs_address)) + (std_logic_vector'("0") & (cpu_data_master_dbs_increment))), 2);
  --dbs count enable, which is an e_mux
  dbs_count_enable <= pre_dbs_count_enable;
  --dbs counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_cpu_data_master_dbs_address <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(dbs_count_enable) = '1' then 
        internal_cpu_data_master_dbs_address <= next_dbs_address;
      end if;
    end if;

  end process;

  --vhdl renameroo for output signals
  cpu_data_master_address_to_slave <= internal_cpu_data_master_address_to_slave;
  --vhdl renameroo for output signals
  cpu_data_master_dbs_address <= internal_cpu_data_master_dbs_address;
  --vhdl renameroo for output signals
  cpu_data_master_no_byte_enables_and_last_term <= internal_cpu_data_master_no_byte_enables_and_last_term;
  --vhdl renameroo for output signals
  cpu_data_master_waitrequest <= internal_cpu_data_master_waitrequest;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity cpu_instruction_master_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_instruction_master_address : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_instruction_master_granted_cpu_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_instruction_master_granted_ext_flash_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_granted_ext_ram_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_granted_lan91c111_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_granted_onchip_ram_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_granted_sdram_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_cpu_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_ext_flash_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_ext_ram_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_lan91c111_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_onchip_ram_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_sdram_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_read : IN STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_cpu_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_ext_flash_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_ext_ram_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_lan91c111_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_onchip_ram_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_sdram_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_sdram_s1_shift_register : IN STD_LOGIC;
                 signal cpu_instruction_master_requests_cpu_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_instruction_master_requests_ext_flash_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_requests_ext_ram_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_requests_lan91c111_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_requests_onchip_ram_s1 : IN STD_LOGIC;
                 signal cpu_instruction_master_requests_sdram_s1 : IN STD_LOGIC;
                 signal cpu_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d1_cpu_jtag_debug_module_end_xfer : IN STD_LOGIC;
                 signal d1_ext_ram_bus_avalon_slave_end_xfer : IN STD_LOGIC;
                 signal d1_onchip_ram_s1_end_xfer : IN STD_LOGIC;
                 signal d1_sdram_s1_end_xfer : IN STD_LOGIC;
                 signal ext_flash_s1_wait_counter_eq_0 : IN STD_LOGIC;
                 signal ext_flash_s1_wait_counter_eq_1 : IN STD_LOGIC;
                 signal incoming_ext_ram_bus_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal lan91c111_s1_wait_counter_eq_0 : IN STD_LOGIC;
                 signal lan91c111_s1_wait_counter_eq_1 : IN STD_LOGIC;
                 signal onchip_ram_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;
                 signal sdram_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal sdram_s1_waitrequest_from_sa : IN STD_LOGIC;

              -- outputs:
                 signal cpu_instruction_master_address_to_slave : OUT STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_instruction_master_dbs_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_instruction_master_latency_counter : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_instruction_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_instruction_master_readdatavalid : OUT STD_LOGIC;
                 signal cpu_instruction_master_waitrequest : OUT STD_LOGIC
              );
end entity cpu_instruction_master_arbitrator;


architecture europa of cpu_instruction_master_arbitrator is
                signal active_and_waiting_last_time :  STD_LOGIC;
                signal cpu_instruction_master_address_last_time :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal cpu_instruction_master_dbs_increment :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_instruction_master_dbs_rdv_counter :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_instruction_master_dbs_rdv_counter_inc :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_instruction_master_is_granted_some_slave :  STD_LOGIC;
                signal cpu_instruction_master_next_dbs_rdv_counter :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_instruction_master_read_but_no_slave_selected :  STD_LOGIC;
                signal cpu_instruction_master_read_last_time :  STD_LOGIC;
                signal cpu_instruction_master_run :  STD_LOGIC;
                signal dbs_count_enable :  STD_LOGIC;
                signal dbs_counter_overflow :  STD_LOGIC;
                signal dbs_latent_8_reg_segment_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal dbs_latent_8_reg_segment_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal dbs_latent_8_reg_segment_2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal dbs_rdv_count_enable :  STD_LOGIC;
                signal dbs_rdv_counter_overflow :  STD_LOGIC;
                signal internal_cpu_instruction_master_address_to_slave :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal internal_cpu_instruction_master_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal internal_cpu_instruction_master_latency_counter :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal internal_cpu_instruction_master_waitrequest :  STD_LOGIC;
                signal latency_load_value :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal next_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal p1_cpu_instruction_master_latency_counter :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal p1_dbs_latent_8_reg_segment_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal p1_dbs_latent_8_reg_segment_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal p1_dbs_latent_8_reg_segment_2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal pre_dbs_count_enable :  STD_LOGIC;
                signal pre_flush_cpu_instruction_master_readdatavalid :  STD_LOGIC;
                signal r_0 :  STD_LOGIC;
                signal r_1 :  STD_LOGIC;
                signal r_2 :  STD_LOGIC;

begin

  --r_0 master_run cascaded wait assignment, which is an e_assign
  r_0 <= Vector_To_Std_Logic((((((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_instruction_master_qualified_request_cpu_jtag_debug_module OR NOT cpu_instruction_master_requests_cpu_jtag_debug_module)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_instruction_master_granted_cpu_jtag_debug_module OR NOT cpu_instruction_master_qualified_request_cpu_jtag_debug_module)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_instruction_master_qualified_request_cpu_jtag_debug_module OR NOT cpu_instruction_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT d1_cpu_jtag_debug_module_end_xfer)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_read)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_instruction_master_qualified_request_lan91c111_s1 OR NOT cpu_instruction_master_requests_lan91c111_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_instruction_master_qualified_request_ext_flash_s1 OR NOT cpu_instruction_master_requests_ext_flash_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_instruction_master_qualified_request_ext_ram_s1 OR NOT cpu_instruction_master_requests_ext_ram_s1)))))));
  --cascaded wait assignment, which is an e_assign
  cpu_instruction_master_run <= (r_0 AND r_1) AND r_2;
  --r_1 master_run cascaded wait assignment, which is an e_assign
  r_1 <= Vector_To_Std_Logic(((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((((cpu_instruction_master_granted_lan91c111_s1 OR NOT cpu_instruction_master_qualified_request_lan91c111_s1)) AND ((cpu_instruction_master_granted_ext_flash_s1 OR NOT cpu_instruction_master_qualified_request_ext_flash_s1))) AND ((cpu_instruction_master_granted_ext_ram_s1 OR NOT cpu_instruction_master_qualified_request_ext_ram_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_instruction_master_qualified_request_lan91c111_s1 OR NOT cpu_instruction_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((lan91c111_s1_wait_counter_eq_0 AND NOT d1_ext_ram_bus_avalon_slave_end_xfer)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_instruction_master_qualified_request_ext_flash_s1 OR NOT cpu_instruction_master_read)))) OR ((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((ext_flash_s1_wait_counter_eq_0 AND NOT d1_ext_ram_bus_avalon_slave_end_xfer)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((internal_cpu_instruction_master_dbs_address(1) AND internal_cpu_instruction_master_dbs_address(0))))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_instruction_master_qualified_request_ext_ram_s1 OR NOT cpu_instruction_master_read)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_read)))))))));
  --r_2 master_run cascaded wait assignment, which is an e_assign
  r_2 <= Vector_To_Std_Logic((((((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_instruction_master_qualified_request_onchip_ram_s1 OR NOT cpu_instruction_master_requests_onchip_ram_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_instruction_master_granted_onchip_ram_s1 OR NOT cpu_instruction_master_qualified_request_onchip_ram_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_instruction_master_qualified_request_onchip_ram_s1 OR NOT cpu_instruction_master_read)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_read)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_instruction_master_qualified_request_sdram_s1 OR NOT cpu_instruction_master_requests_sdram_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_instruction_master_granted_sdram_s1 OR NOT cpu_instruction_master_qualified_request_sdram_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_instruction_master_qualified_request_sdram_s1 OR NOT cpu_instruction_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT sdram_s1_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_read)))))))));
  --optimize select-logic by passing only those address bits which matter.
  internal_cpu_instruction_master_address_to_slave <= cpu_instruction_master_address(25 DOWNTO 0);
  --cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_instruction_master_read_but_no_slave_selected <= std_logic'('0');
    elsif clk'event and clk = '1' then
      cpu_instruction_master_read_but_no_slave_selected <= (cpu_instruction_master_read AND cpu_instruction_master_run) AND NOT cpu_instruction_master_is_granted_some_slave;
    end if;

  end process;

  --some slave is getting selected, which is an e_mux
  cpu_instruction_master_is_granted_some_slave <= ((((cpu_instruction_master_granted_cpu_jtag_debug_module OR cpu_instruction_master_granted_lan91c111_s1) OR cpu_instruction_master_granted_ext_flash_s1) OR cpu_instruction_master_granted_ext_ram_s1) OR cpu_instruction_master_granted_onchip_ram_s1) OR cpu_instruction_master_granted_sdram_s1;
  --latent slave read data valids which may be flushed, which is an e_mux
  pre_flush_cpu_instruction_master_readdatavalid <= (((cpu_instruction_master_read_data_valid_lan91c111_s1 OR ((cpu_instruction_master_read_data_valid_ext_flash_s1 AND dbs_rdv_counter_overflow))) OR cpu_instruction_master_read_data_valid_ext_ram_s1) OR cpu_instruction_master_read_data_valid_onchip_ram_s1) OR cpu_instruction_master_read_data_valid_sdram_s1;
  --latent slave read data valid which is not flushed, which is an e_mux
  cpu_instruction_master_readdatavalid <= (((((((((((cpu_instruction_master_read_but_no_slave_selected OR pre_flush_cpu_instruction_master_readdatavalid) OR cpu_instruction_master_read_data_valid_cpu_jtag_debug_module) OR cpu_instruction_master_read_but_no_slave_selected) OR pre_flush_cpu_instruction_master_readdatavalid) OR cpu_instruction_master_read_but_no_slave_selected) OR pre_flush_cpu_instruction_master_readdatavalid) OR cpu_instruction_master_read_but_no_slave_selected) OR pre_flush_cpu_instruction_master_readdatavalid) OR cpu_instruction_master_read_but_no_slave_selected) OR pre_flush_cpu_instruction_master_readdatavalid) OR cpu_instruction_master_read_but_no_slave_selected) OR pre_flush_cpu_instruction_master_readdatavalid;
  --cpu/instruction_master readdata mux, which is an e_mux
  cpu_instruction_master_readdata <= ((((((A_REP(NOT ((cpu_instruction_master_qualified_request_cpu_jtag_debug_module AND cpu_instruction_master_read)) , 32) OR cpu_jtag_debug_module_readdata_from_sa)) AND ((A_REP(NOT cpu_instruction_master_read_data_valid_lan91c111_s1, 32) OR incoming_ext_ram_bus_data))) AND ((A_REP(NOT cpu_instruction_master_read_data_valid_ext_flash_s1, 32) OR Std_Logic_Vector'(incoming_ext_ram_bus_data(7 DOWNTO 0) & dbs_latent_8_reg_segment_2 & dbs_latent_8_reg_segment_1 & dbs_latent_8_reg_segment_0)))) AND ((A_REP(NOT cpu_instruction_master_read_data_valid_ext_ram_s1, 32) OR incoming_ext_ram_bus_data))) AND ((A_REP(NOT cpu_instruction_master_read_data_valid_onchip_ram_s1, 32) OR onchip_ram_s1_readdata_from_sa))) AND ((A_REP(NOT cpu_instruction_master_read_data_valid_sdram_s1, 32) OR sdram_s1_readdata_from_sa));
  --actual waitrequest port, which is an e_assign
  internal_cpu_instruction_master_waitrequest <= NOT cpu_instruction_master_run;
  --latent max counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_cpu_instruction_master_latency_counter <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      internal_cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end if;

  end process;

  --latency counter load mux, which is an e_mux
  p1_cpu_instruction_master_latency_counter <= A_EXT (A_WE_StdLogicVector((std_logic'(((cpu_instruction_master_run AND cpu_instruction_master_read))) = '1'), (std_logic_vector'("0000000000000000000000000000000") & (latency_load_value)), A_WE_StdLogicVector((((internal_cpu_instruction_master_latency_counter)) /= std_logic_vector'("00")), ((std_logic_vector'("0000000000000000000000000000000") & (internal_cpu_instruction_master_latency_counter)) - std_logic_vector'("000000000000000000000000000000001")), std_logic_vector'("000000000000000000000000000000000"))), 2);
  --read latency load values, which is an e_mux
  latency_load_value <= A_EXT (((((((std_logic_vector'("000000000000000000000000000000") & (A_REP(cpu_instruction_master_requests_lan91c111_s1, 2))) AND std_logic_vector'("00000000000000000000000000000010"))) OR (((std_logic_vector'("000000000000000000000000000000") & (A_REP(cpu_instruction_master_requests_ext_flash_s1, 2))) AND std_logic_vector'("00000000000000000000000000000010")))) OR (((std_logic_vector'("000000000000000000000000000000") & (A_REP(cpu_instruction_master_requests_ext_ram_s1, 2))) AND std_logic_vector'("00000000000000000000000000000010")))) OR (((std_logic_vector'("000000000000000000000000000000") & (A_REP(cpu_instruction_master_requests_onchip_ram_s1, 2))) AND std_logic_vector'("00000000000000000000000000000001")))), 2);
  --input to latent dbs-8 stored 0, which is an e_mux
  p1_dbs_latent_8_reg_segment_0 <= incoming_ext_ram_bus_data (7 DOWNTO 0);
  --dbs register for latent dbs-8 segment 0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbs_latent_8_reg_segment_0 <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'((dbs_rdv_count_enable AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & ((cpu_instruction_master_dbs_rdv_counter(1 DOWNTO 0)))) = std_logic_vector'("00000000000000000000000000000000")))))) = '1' then 
        dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
      end if;
    end if;

  end process;

  --input to latent dbs-8 stored 1, which is an e_mux
  p1_dbs_latent_8_reg_segment_1 <= incoming_ext_ram_bus_data (7 DOWNTO 0);
  --dbs register for latent dbs-8 segment 1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbs_latent_8_reg_segment_1 <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'((dbs_rdv_count_enable AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & ((cpu_instruction_master_dbs_rdv_counter(1 DOWNTO 0)))) = std_logic_vector'("00000000000000000000000000000001")))))) = '1' then 
        dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
      end if;
    end if;

  end process;

  --input to latent dbs-8 stored 2, which is an e_mux
  p1_dbs_latent_8_reg_segment_2 <= incoming_ext_ram_bus_data (7 DOWNTO 0);
  --dbs register for latent dbs-8 segment 2, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbs_latent_8_reg_segment_2 <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'((dbs_rdv_count_enable AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & ((cpu_instruction_master_dbs_rdv_counter(1 DOWNTO 0)))) = std_logic_vector'("00000000000000000000000000000010")))))) = '1' then 
        dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
      end if;
    end if;

  end process;

  --dbs count increment, which is an e_mux
  cpu_instruction_master_dbs_increment <= A_EXT (A_WE_StdLogicVector((std_logic'((cpu_instruction_master_requests_ext_flash_s1)) = '1'), std_logic_vector'("00000000000000000000000000000001"), std_logic_vector'("00000000000000000000000000000000")), 2);
  --dbs counter overflow, which is an e_assign
  dbs_counter_overflow <= internal_cpu_instruction_master_dbs_address(1) AND NOT((next_dbs_address(1)));
  --next master address, which is an e_assign
  next_dbs_address <= A_EXT (((std_logic_vector'("0") & (internal_cpu_instruction_master_dbs_address)) + (std_logic_vector'("0") & (cpu_instruction_master_dbs_increment))), 2);
  --dbs count enable, which is an e_mux
  dbs_count_enable <= pre_dbs_count_enable;
  --dbs counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_cpu_instruction_master_dbs_address <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(dbs_count_enable) = '1' then 
        internal_cpu_instruction_master_dbs_address <= next_dbs_address;
      end if;
    end if;

  end process;

  --p1 dbs rdv counter, which is an e_assign
  cpu_instruction_master_next_dbs_rdv_counter <= A_EXT (((std_logic_vector'("0") & (cpu_instruction_master_dbs_rdv_counter)) + (std_logic_vector'("0") & (cpu_instruction_master_dbs_rdv_counter_inc))), 2);
  --cpu_instruction_master_rdv_inc_mux, which is an e_mux
  cpu_instruction_master_dbs_rdv_counter_inc <= std_logic_vector'("01");
  --master any slave rdv, which is an e_mux
  dbs_rdv_count_enable <= cpu_instruction_master_read_data_valid_ext_flash_s1;
  --dbs rdv counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_instruction_master_dbs_rdv_counter <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(dbs_rdv_count_enable) = '1' then 
        cpu_instruction_master_dbs_rdv_counter <= cpu_instruction_master_next_dbs_rdv_counter;
      end if;
    end if;

  end process;

  --dbs rdv counter overflow, which is an e_assign
  dbs_rdv_counter_overflow <= cpu_instruction_master_dbs_rdv_counter(1) AND NOT cpu_instruction_master_next_dbs_rdv_counter(1);
  --pre dbs count enable, which is an e_mux
  pre_dbs_count_enable <= Vector_To_Std_Logic(((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((cpu_instruction_master_granted_ext_flash_s1 AND cpu_instruction_master_read)))) AND std_logic_vector'("00000000000000000000000000000001")) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((ext_flash_s1_wait_counter_eq_0 AND NOT d1_ext_ram_bus_avalon_slave_end_xfer)))))));
  --vhdl renameroo for output signals
  cpu_instruction_master_address_to_slave <= internal_cpu_instruction_master_address_to_slave;
  --vhdl renameroo for output signals
  cpu_instruction_master_dbs_address <= internal_cpu_instruction_master_dbs_address;
  --vhdl renameroo for output signals
  cpu_instruction_master_latency_counter <= internal_cpu_instruction_master_latency_counter;
  --vhdl renameroo for output signals
  cpu_instruction_master_waitrequest <= internal_cpu_instruction_master_waitrequest;
--synthesis translate_off
    --cpu_instruction_master_address check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        cpu_instruction_master_address_last_time <= std_logic_vector'("00000000000000000000000000");
      elsif clk'event and clk = '1' then
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
      end if;

    end process;

    --cpu/instruction_master waited last time, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        active_and_waiting_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        active_and_waiting_last_time <= internal_cpu_instruction_master_waitrequest AND (cpu_instruction_master_read);
      end if;

    end process;

    --cpu_instruction_master_address matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line7 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((cpu_instruction_master_address /= cpu_instruction_master_address_last_time))))) = '1' then 
          write(write_line7, now);
          write(write_line7, string'(": "));
          write(write_line7, string'("cpu_instruction_master_address did not heed wait!!!"));
          write(output, write_line7.all);
          deallocate (write_line7);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --cpu_instruction_master_read check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        cpu_instruction_master_read_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
      end if;

    end process;

    --cpu_instruction_master_read matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line8 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((std_logic'(cpu_instruction_master_read) /= std_logic'(cpu_instruction_master_read_last_time)))))) = '1' then 
          write(write_line8, now);
          write(write_line8, string'(": "));
          write(write_line8, string'("cpu_instruction_master_read did not heed wait!!!"));
          write(output, write_line8.all);
          deallocate (write_line8);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity ext_ram_bus_avalon_slave_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_data_master_dbs_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_data_master_dbs_write_8 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal cpu_data_master_no_byte_enables_and_last_term : IN STD_LOGIC;
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_instruction_master_dbs_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_instruction_master_latency_counter : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_instruction_master_read : IN STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_sdram_s1_shift_register : IN STD_LOGIC;
                 signal irq_from_the_lan91c111 : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal be_n_to_the_ext_ram : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal byteenablen_to_the_lan91c111 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_data_master_byteenable_ext_flash_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_granted_ext_flash_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_granted_ext_ram_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_granted_lan91c111_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_ext_flash_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_ext_ram_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_lan91c111_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_ext_flash_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_ext_ram_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_lan91c111_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_requests_ext_flash_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_requests_ext_ram_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_requests_lan91c111_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_granted_ext_flash_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_granted_ext_ram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_granted_lan91c111_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_ext_flash_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_ext_ram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_lan91c111_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_ext_flash_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_ext_ram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_lan91c111_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_requests_ext_flash_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_requests_ext_ram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_requests_lan91c111_s1 : OUT STD_LOGIC;
                 signal d1_ext_ram_bus_avalon_slave_end_xfer : OUT STD_LOGIC;
                 signal d1_irq_from_the_lan91c111 : OUT STD_LOGIC;
                 signal ext_flash_s1_wait_counter_eq_0 : OUT STD_LOGIC;
                 signal ext_flash_s1_wait_counter_eq_1 : OUT STD_LOGIC;
                 signal ext_ram_bus_address : OUT STD_LOGIC_VECTOR (22 DOWNTO 0);
                 signal ext_ram_bus_data : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal incoming_ext_ram_bus_data : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal incoming_ext_ram_bus_data_with_Xs_converted_to_0 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal ior_n_to_the_lan91c111 : OUT STD_LOGIC;
                 signal iow_n_to_the_lan91c111 : OUT STD_LOGIC;
                 signal lan91c111_s1_wait_counter_eq_0 : OUT STD_LOGIC;
                 signal lan91c111_s1_wait_counter_eq_1 : OUT STD_LOGIC;
                 signal read_n_to_the_ext_flash : OUT STD_LOGIC;
                 signal read_n_to_the_ext_ram : OUT STD_LOGIC;
                 signal registered_cpu_data_master_read_data_valid_ext_flash_s1 : OUT STD_LOGIC;
                 signal registered_cpu_data_master_read_data_valid_ext_ram_s1 : OUT STD_LOGIC;
                 signal registered_cpu_data_master_read_data_valid_lan91c111_s1 : OUT STD_LOGIC;
                 signal reset_to_the_lan91c111 : OUT STD_LOGIC;
                 signal select_n_to_the_ext_flash : OUT STD_LOGIC;
                 signal select_n_to_the_ext_ram : OUT STD_LOGIC;
                 signal write_n_to_the_ext_flash : OUT STD_LOGIC;
                 signal write_n_to_the_ext_ram : OUT STD_LOGIC
              );
end entity ext_ram_bus_avalon_slave_arbitrator;


architecture europa of ext_ram_bus_avalon_slave_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_byteenable_ext_flash_s1_segment_0 :  STD_LOGIC;
                signal cpu_data_master_byteenable_ext_flash_s1_segment_1 :  STD_LOGIC;
                signal cpu_data_master_byteenable_ext_flash_s1_segment_2 :  STD_LOGIC;
                signal cpu_data_master_byteenable_ext_flash_s1_segment_3 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_ext_flash_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_ext_ram_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_data_master_read_data_valid_ext_ram_s1_shift_register_in :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_lan91c111_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_data_master_read_data_valid_lan91c111_s1_shift_register_in :  STD_LOGIC;
                signal cpu_data_master_saved_grant_ext_flash_s1 :  STD_LOGIC;
                signal cpu_data_master_saved_grant_ext_ram_s1 :  STD_LOGIC;
                signal cpu_data_master_saved_grant_lan91c111_s1 :  STD_LOGIC;
                signal cpu_instruction_master_arbiterlock :  STD_LOGIC;
                signal cpu_instruction_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_instruction_master_continuerequest :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register_in :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register_in :  STD_LOGIC;
                signal cpu_instruction_master_saved_grant_ext_flash_s1 :  STD_LOGIC;
                signal cpu_instruction_master_saved_grant_ext_ram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_saved_grant_lan91c111_s1 :  STD_LOGIC;
                signal d1_in_a_write_cycle :  STD_LOGIC;
                signal d1_outgoing_ext_ram_bus_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_ext_ram_bus_avalon_slave :  STD_LOGIC;
                signal ext_flash_s1_counter_load_value :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal ext_flash_s1_in_a_read_cycle :  STD_LOGIC;
                signal ext_flash_s1_in_a_write_cycle :  STD_LOGIC;
                signal ext_flash_s1_pretend_byte_enable :  STD_LOGIC;
                signal ext_flash_s1_wait_counter :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal ext_flash_s1_waits_for_read :  STD_LOGIC;
                signal ext_flash_s1_waits_for_write :  STD_LOGIC;
                signal ext_flash_s1_with_write_latency :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_allgrants :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_allow_new_arb_cycle :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_any_bursting_master_saved_grant :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_any_continuerequest :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_arb_addend :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal ext_ram_bus_avalon_slave_arb_counter_enable :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal ext_ram_bus_avalon_slave_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal ext_ram_bus_avalon_slave_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal ext_ram_bus_avalon_slave_arb_winner :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal ext_ram_bus_avalon_slave_arbitration_holdoff_internal :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_beginbursttransfer_internal :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_begins_xfer :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_chosen_master_double_vector :  STD_LOGIC_VECTOR (11 DOWNTO 0);
                signal ext_ram_bus_avalon_slave_chosen_master_rot_left :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal ext_ram_bus_avalon_slave_end_xfer :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_firsttransfer :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_grant_vector :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal ext_ram_bus_avalon_slave_master_qreq_vector :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal ext_ram_bus_avalon_slave_non_bursting_master_requests :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_read_pending :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_reg_firsttransfer :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_saved_chosen_master_vector :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal ext_ram_bus_avalon_slave_slavearbiterlockenable :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_slavearbiterlockenable2 :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_unreg_firsttransfer :  STD_LOGIC;
                signal ext_ram_bus_avalon_slave_write_pending :  STD_LOGIC;
                signal ext_ram_s1_in_a_read_cycle :  STD_LOGIC;
                signal ext_ram_s1_in_a_write_cycle :  STD_LOGIC;
                signal ext_ram_s1_waits_for_read :  STD_LOGIC;
                signal ext_ram_s1_waits_for_write :  STD_LOGIC;
                signal ext_ram_s1_with_write_latency :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal incoming_ext_ram_bus_data_bit_0_is_x :  STD_LOGIC;
                signal incoming_ext_ram_bus_data_bit_1_is_x :  STD_LOGIC;
                signal incoming_ext_ram_bus_data_bit_2_is_x :  STD_LOGIC;
                signal incoming_ext_ram_bus_data_bit_3_is_x :  STD_LOGIC;
                signal incoming_ext_ram_bus_data_bit_4_is_x :  STD_LOGIC;
                signal incoming_ext_ram_bus_data_bit_5_is_x :  STD_LOGIC;
                signal incoming_ext_ram_bus_data_bit_6_is_x :  STD_LOGIC;
                signal incoming_ext_ram_bus_data_bit_7_is_x :  STD_LOGIC;
                signal internal_cpu_data_master_byteenable_ext_flash_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_granted_ext_flash_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_granted_ext_ram_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_granted_lan91c111_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_ext_flash_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_ext_ram_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_lan91c111_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_requests_ext_flash_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_requests_ext_ram_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_requests_lan91c111_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_granted_ext_flash_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_granted_ext_ram_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_granted_lan91c111_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_qualified_request_ext_flash_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_qualified_request_ext_ram_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_qualified_request_lan91c111_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_requests_ext_flash_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_requests_ext_ram_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_requests_lan91c111_s1 :  STD_LOGIC;
                signal internal_ext_flash_s1_wait_counter_eq_0 :  STD_LOGIC;
                signal internal_incoming_ext_ram_bus_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_lan91c111_s1_wait_counter_eq_0 :  STD_LOGIC;
                signal lan91c111_s1_counter_load_value :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal lan91c111_s1_in_a_read_cycle :  STD_LOGIC;
                signal lan91c111_s1_in_a_write_cycle :  STD_LOGIC;
                signal lan91c111_s1_wait_counter :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal lan91c111_s1_waits_for_read :  STD_LOGIC;
                signal lan91c111_s1_waits_for_write :  STD_LOGIC;
                signal lan91c111_s1_with_write_latency :  STD_LOGIC;
                signal last_cycle_cpu_data_master_granted_slave_ext_flash_s1 :  STD_LOGIC;
                signal last_cycle_cpu_data_master_granted_slave_ext_ram_s1 :  STD_LOGIC;
                signal last_cycle_cpu_data_master_granted_slave_lan91c111_s1 :  STD_LOGIC;
                signal last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 :  STD_LOGIC;
                signal last_cycle_cpu_instruction_master_granted_slave_ext_ram_s1 :  STD_LOGIC;
                signal last_cycle_cpu_instruction_master_granted_slave_lan91c111_s1 :  STD_LOGIC;
                signal outgoing_ext_ram_bus_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal p1_be_n_to_the_ext_ram :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal p1_byteenablen_to_the_lan91c111 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal p1_cpu_data_master_read_data_valid_ext_flash_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal p1_cpu_data_master_read_data_valid_ext_ram_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal p1_cpu_data_master_read_data_valid_lan91c111_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal p1_cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal p1_cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal p1_cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal p1_ext_ram_bus_address :  STD_LOGIC_VECTOR (22 DOWNTO 0);
                signal p1_ior_n_to_the_lan91c111 :  STD_LOGIC;
                signal p1_iow_n_to_the_lan91c111 :  STD_LOGIC;
                signal p1_read_n_to_the_ext_flash :  STD_LOGIC;
                signal p1_read_n_to_the_ext_ram :  STD_LOGIC;
                signal p1_reset_to_the_lan91c111 :  STD_LOGIC;
                signal p1_select_n_to_the_ext_flash :  STD_LOGIC;
                signal p1_select_n_to_the_ext_ram :  STD_LOGIC;
                signal p1_write_n_to_the_ext_flash :  STD_LOGIC;
                signal p1_write_n_to_the_ext_ram :  STD_LOGIC;
                signal time_to_write :  STD_LOGIC;
                signal wait_for_ext_flash_s1_counter :  STD_LOGIC;
                signal wait_for_ext_ram_s1_counter :  STD_LOGIC;
                signal wait_for_lan91c111_s1_counter :  STD_LOGIC;
                signal write_n_to_the_ext_ram_local :  STD_LOGIC;
                signal write_n_to_the_ext_ram_mask :  STD_LOGIC;
                signal wrote_half_cycle_ext_ram_s1_last_time :  STD_LOGIC;
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of be_n_to_the_ext_ram : signal is "FAST_OUTPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of byteenablen_to_the_lan91c111 : signal is "FAST_OUTPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of d1_in_a_write_cycle : signal is "FAST_OUTPUT_ENABLE_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of d1_outgoing_ext_ram_bus_data : signal is "FAST_OUTPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of ext_ram_bus_address : signal is "FAST_OUTPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of internal_incoming_ext_ram_bus_data : signal is "FAST_INPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of ior_n_to_the_lan91c111 : signal is "FAST_OUTPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of iow_n_to_the_lan91c111 : signal is "FAST_OUTPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of read_n_to_the_ext_flash : signal is "FAST_OUTPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of read_n_to_the_ext_ram : signal is "FAST_OUTPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of reset_to_the_lan91c111 : signal is "FAST_OUTPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of select_n_to_the_ext_flash : signal is "FAST_OUTPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of select_n_to_the_ext_ram : signal is "FAST_OUTPUT_REGISTER=ON";
attribute ALTERA_ATTRIBUTE of write_n_to_the_ext_flash : signal is "FAST_OUTPUT_REGISTER=ON";

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT ext_ram_bus_avalon_slave_end_xfer;
    end if;

  end process;

  ext_ram_bus_avalon_slave_begins_xfer <= NOT d1_reasons_to_wait AND ((((((internal_cpu_data_master_qualified_request_lan91c111_s1 OR internal_cpu_instruction_master_qualified_request_lan91c111_s1) OR internal_cpu_data_master_qualified_request_ext_flash_s1) OR internal_cpu_instruction_master_qualified_request_ext_flash_s1) OR internal_cpu_data_master_qualified_request_ext_ram_s1) OR internal_cpu_instruction_master_qualified_request_ext_ram_s1));
  internal_cpu_data_master_requests_lan91c111_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 16) & std_logic_vector'("0000000000000000")) = std_logic_vector'("10000100010000000000000000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --~select_n_to_the_ext_flash of type chipselect to ~p1_select_n_to_the_ext_flash, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      select_n_to_the_ext_flash <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      select_n_to_the_ext_flash <= p1_select_n_to_the_ext_flash;
    end if;

  end process;

  --~select_n_to_the_ext_ram of type chipselect to ~p1_select_n_to_the_ext_ram, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      select_n_to_the_ext_ram <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      select_n_to_the_ext_ram <= p1_select_n_to_the_ext_ram;
    end if;

  end process;

  ext_ram_bus_avalon_slave_write_pending <= std_logic'('0');
  --ext_ram_bus/avalon_slave read pending calc, which is an e_assign
  ext_ram_bus_avalon_slave_read_pending <= std_logic'('0');
  --registered rdv signal_name registered_cpu_data_master_read_data_valid_lan91c111_s1 assignment, which is an e_assign
  registered_cpu_data_master_read_data_valid_lan91c111_s1 <= cpu_data_master_read_data_valid_lan91c111_s1_shift_register(0);
  --ext_ram_bus_avalon_slave_arb_share_counter set values, which is an e_mux
  ext_ram_bus_avalon_slave_arb_share_set_values <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_ext_flash_s1)) = '1'), std_logic_vector'("00000000000000000000000000000100"), A_WE_StdLogicVector((std_logic'((internal_cpu_instruction_master_granted_ext_flash_s1)) = '1'), std_logic_vector'("00000000000000000000000000000100"), A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_ext_flash_s1)) = '1'), std_logic_vector'("00000000000000000000000000000100"), A_WE_StdLogicVector((std_logic'((internal_cpu_instruction_master_granted_ext_flash_s1)) = '1'), std_logic_vector'("00000000000000000000000000000100"), std_logic_vector'("00000000000000000000000000000001"))))), 3);
  --ext_ram_bus_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  ext_ram_bus_avalon_slave_non_bursting_master_requests <= ((((((((((internal_cpu_data_master_requests_lan91c111_s1 OR internal_cpu_instruction_master_requests_lan91c111_s1) OR internal_cpu_data_master_requests_ext_flash_s1) OR internal_cpu_instruction_master_requests_ext_flash_s1) OR internal_cpu_data_master_requests_ext_ram_s1) OR internal_cpu_instruction_master_requests_ext_ram_s1) OR internal_cpu_data_master_requests_lan91c111_s1) OR internal_cpu_instruction_master_requests_lan91c111_s1) OR internal_cpu_data_master_requests_ext_flash_s1) OR internal_cpu_instruction_master_requests_ext_flash_s1) OR internal_cpu_data_master_requests_ext_ram_s1) OR internal_cpu_instruction_master_requests_ext_ram_s1;
  --ext_ram_bus_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  ext_ram_bus_avalon_slave_any_bursting_master_saved_grant <= std_logic'('0');
  --ext_ram_bus_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  ext_ram_bus_avalon_slave_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(ext_ram_bus_avalon_slave_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (ext_ram_bus_avalon_slave_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(ext_ram_bus_avalon_slave_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (ext_ram_bus_avalon_slave_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --ext_ram_bus_avalon_slave_allgrants all slave grants, which is an e_mux
  ext_ram_bus_avalon_slave_allgrants <= (((((((((((or_reduce(ext_ram_bus_avalon_slave_grant_vector)) OR (or_reduce(ext_ram_bus_avalon_slave_grant_vector))) OR (or_reduce(ext_ram_bus_avalon_slave_grant_vector))) OR (or_reduce(ext_ram_bus_avalon_slave_grant_vector))) OR (or_reduce(ext_ram_bus_avalon_slave_grant_vector))) OR (or_reduce(ext_ram_bus_avalon_slave_grant_vector))) OR (or_reduce(ext_ram_bus_avalon_slave_grant_vector))) OR (or_reduce(ext_ram_bus_avalon_slave_grant_vector))) OR (or_reduce(ext_ram_bus_avalon_slave_grant_vector))) OR (or_reduce(ext_ram_bus_avalon_slave_grant_vector))) OR (or_reduce(ext_ram_bus_avalon_slave_grant_vector))) OR (or_reduce(ext_ram_bus_avalon_slave_grant_vector));
  --ext_ram_bus_avalon_slave_end_xfer assignment, which is an e_assign
  ext_ram_bus_avalon_slave_end_xfer <= NOT ((((((lan91c111_s1_waits_for_read OR lan91c111_s1_waits_for_write) OR ext_flash_s1_waits_for_read) OR ext_flash_s1_waits_for_write) OR ext_ram_s1_waits_for_read) OR ext_ram_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_ext_ram_bus_avalon_slave arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_ext_ram_bus_avalon_slave <= ext_ram_bus_avalon_slave_end_xfer AND (((NOT ext_ram_bus_avalon_slave_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --ext_ram_bus_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  ext_ram_bus_avalon_slave_arb_counter_enable <= ((end_xfer_arb_share_counter_term_ext_ram_bus_avalon_slave AND ext_ram_bus_avalon_slave_allgrants)) OR ((end_xfer_arb_share_counter_term_ext_ram_bus_avalon_slave AND NOT ext_ram_bus_avalon_slave_non_bursting_master_requests));
  --ext_ram_bus_avalon_slave_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      ext_ram_bus_avalon_slave_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(ext_ram_bus_avalon_slave_arb_counter_enable) = '1' then 
        ext_ram_bus_avalon_slave_arb_share_counter <= ext_ram_bus_avalon_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --ext_ram_bus_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      ext_ram_bus_avalon_slave_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((or_reduce(ext_ram_bus_avalon_slave_master_qreq_vector) AND end_xfer_arb_share_counter_term_ext_ram_bus_avalon_slave)) OR ((end_xfer_arb_share_counter_term_ext_ram_bus_avalon_slave AND NOT ext_ram_bus_avalon_slave_non_bursting_master_requests)))) = '1' then 
        ext_ram_bus_avalon_slave_slavearbiterlockenable <= or_reduce(ext_ram_bus_avalon_slave_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master ext_ram_bus/avalon_slave arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= ext_ram_bus_avalon_slave_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --ext_ram_bus_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  ext_ram_bus_avalon_slave_slavearbiterlockenable2 <= or_reduce(ext_ram_bus_avalon_slave_arb_share_counter_next_value);
  --cpu/data_master ext_ram_bus/avalon_slave arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= ext_ram_bus_avalon_slave_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --cpu/instruction_master ext_ram_bus/avalon_slave arbiterlock, which is an e_assign
  cpu_instruction_master_arbiterlock <= ext_ram_bus_avalon_slave_slavearbiterlockenable AND cpu_instruction_master_continuerequest;
  --cpu/instruction_master ext_ram_bus/avalon_slave arbiterlock2, which is an e_assign
  cpu_instruction_master_arbiterlock2 <= ext_ram_bus_avalon_slave_slavearbiterlockenable2 AND cpu_instruction_master_continuerequest;
  --cpu/instruction_master granted lan91c111/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_instruction_master_granted_slave_lan91c111_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_instruction_master_granted_slave_lan91c111_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_instruction_master_saved_grant_lan91c111_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((ext_ram_bus_avalon_slave_arbitration_holdoff_internal OR NOT internal_cpu_instruction_master_requests_lan91c111_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_instruction_master_granted_slave_lan91c111_s1))))));
    end if;

  end process;

  --cpu_instruction_master_continuerequest continued request, which is an e_mux
  cpu_instruction_master_continuerequest <= (((last_cycle_cpu_instruction_master_granted_slave_lan91c111_s1 AND internal_cpu_instruction_master_requests_lan91c111_s1)) OR ((last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 AND internal_cpu_instruction_master_requests_ext_flash_s1))) OR ((last_cycle_cpu_instruction_master_granted_slave_ext_ram_s1 AND internal_cpu_instruction_master_requests_ext_ram_s1));
  --ext_ram_bus_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  ext_ram_bus_avalon_slave_any_continuerequest <= ((((cpu_instruction_master_continuerequest OR cpu_instruction_master_continuerequest) OR cpu_instruction_master_continuerequest) OR cpu_data_master_continuerequest) OR cpu_data_master_continuerequest) OR cpu_data_master_continuerequest;
  internal_cpu_data_master_qualified_request_lan91c111_s1 <= internal_cpu_data_master_requests_lan91c111_s1 AND NOT (((((cpu_data_master_read AND (((ext_ram_bus_avalon_slave_write_pending OR (ext_ram_bus_avalon_slave_read_pending)) OR (or_reduce(cpu_data_master_read_data_valid_lan91c111_s1_shift_register)))))) OR (((ext_ram_bus_avalon_slave_read_pending) AND cpu_data_master_write))) OR cpu_instruction_master_arbiterlock));
  --cpu_data_master_read_data_valid_lan91c111_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  cpu_data_master_read_data_valid_lan91c111_s1_shift_register_in <= ((internal_cpu_data_master_granted_lan91c111_s1 AND cpu_data_master_read) AND NOT lan91c111_s1_waits_for_read) AND NOT (or_reduce(cpu_data_master_read_data_valid_lan91c111_s1_shift_register));
  --shift register p1 cpu_data_master_read_data_valid_lan91c111_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  p1_cpu_data_master_read_data_valid_lan91c111_s1_shift_register <= A_EXT ((cpu_data_master_read_data_valid_lan91c111_s1_shift_register & A_ToStdLogicVector(cpu_data_master_read_data_valid_lan91c111_s1_shift_register_in)), 2);
  --cpu_data_master_read_data_valid_lan91c111_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_data_master_read_data_valid_lan91c111_s1_shift_register <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      cpu_data_master_read_data_valid_lan91c111_s1_shift_register <= p1_cpu_data_master_read_data_valid_lan91c111_s1_shift_register;
    end if;

  end process;

  --local readdatavalid cpu_data_master_read_data_valid_lan91c111_s1, which is an e_mux
  cpu_data_master_read_data_valid_lan91c111_s1 <= cpu_data_master_read_data_valid_lan91c111_s1_shift_register(1);
  --ext_ram_bus_data register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_incoming_ext_ram_bus_data <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      internal_incoming_ext_ram_bus_data <= ext_ram_bus_data;
    end if;

  end process;

  --lan91c111_s1_with_write_latency assignment, which is an e_assign
  lan91c111_s1_with_write_latency <= in_a_write_cycle AND ((internal_cpu_data_master_qualified_request_lan91c111_s1 OR internal_cpu_instruction_master_qualified_request_lan91c111_s1));
  --time to write the data, which is an e_mux
  time_to_write <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'((lan91c111_s1_with_write_latency)) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'((ext_flash_s1_with_write_latency)) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'((ext_ram_s1_with_write_latency)) = '1'), std_logic_vector'("00000000000000000000000000000001"), std_logic_vector'("00000000000000000000000000000000")))));
  --d1_outgoing_ext_ram_bus_data register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_outgoing_ext_ram_bus_data <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      d1_outgoing_ext_ram_bus_data <= outgoing_ext_ram_bus_data;
    end if;

  end process;

  --write cycle delayed by 1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_in_a_write_cycle <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_in_a_write_cycle <= time_to_write;
    end if;

  end process;

  --d1_outgoing_ext_ram_bus_data tristate driver, which is an e_assign
  ext_ram_bus_data <= A_WE_StdLogicVector((std_logic'((d1_in_a_write_cycle)) = '1'), d1_outgoing_ext_ram_bus_data, A_REP(std_logic'('Z'), 32));
  --outgoing_ext_ram_bus_data mux, which is an e_mux
  outgoing_ext_ram_bus_data <= A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_lan91c111_s1)) = '1'), cpu_data_master_writedata, A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_ext_flash_s1)) = '1'), (std_logic_vector'("000000000000000000000000") & (cpu_data_master_dbs_write_8)), cpu_data_master_writedata));
  internal_cpu_data_master_requests_ext_flash_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 23) & std_logic_vector'("00000000000000000000000")) = std_logic_vector'("00000000000000000000000000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --registered rdv signal_name registered_cpu_data_master_read_data_valid_ext_flash_s1 assignment, which is an e_assign
  registered_cpu_data_master_read_data_valid_ext_flash_s1 <= cpu_data_master_read_data_valid_ext_flash_s1_shift_register(0);
  --cpu/instruction_master granted ext_flash/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_instruction_master_saved_grant_ext_flash_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((ext_ram_bus_avalon_slave_arbitration_holdoff_internal OR NOT internal_cpu_instruction_master_requests_ext_flash_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1))))));
    end if;

  end process;

  internal_cpu_data_master_qualified_request_ext_flash_s1 <= internal_cpu_data_master_requests_ext_flash_s1 AND NOT (((((cpu_data_master_read AND (((ext_ram_bus_avalon_slave_write_pending OR (ext_ram_bus_avalon_slave_read_pending)) OR (or_reduce(cpu_data_master_read_data_valid_ext_flash_s1_shift_register)))))) OR (((((ext_ram_bus_avalon_slave_read_pending OR cpu_data_master_no_byte_enables_and_last_term) OR NOT(internal_cpu_data_master_byteenable_ext_flash_s1))) AND cpu_data_master_write))) OR cpu_instruction_master_arbiterlock));
  --cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in <= ((internal_cpu_data_master_granted_ext_flash_s1 AND cpu_data_master_read) AND NOT ext_flash_s1_waits_for_read) AND NOT (or_reduce(cpu_data_master_read_data_valid_ext_flash_s1_shift_register));
  --shift register p1 cpu_data_master_read_data_valid_ext_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  p1_cpu_data_master_read_data_valid_ext_flash_s1_shift_register <= A_EXT ((cpu_data_master_read_data_valid_ext_flash_s1_shift_register & A_ToStdLogicVector(cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in)), 2);
  --cpu_data_master_read_data_valid_ext_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_data_master_read_data_valid_ext_flash_s1_shift_register <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      cpu_data_master_read_data_valid_ext_flash_s1_shift_register <= p1_cpu_data_master_read_data_valid_ext_flash_s1_shift_register;
    end if;

  end process;

  --local readdatavalid cpu_data_master_read_data_valid_ext_flash_s1, which is an e_mux
  cpu_data_master_read_data_valid_ext_flash_s1 <= cpu_data_master_read_data_valid_ext_flash_s1_shift_register(1);
  --ext_flash_s1_with_write_latency assignment, which is an e_assign
  ext_flash_s1_with_write_latency <= in_a_write_cycle AND ((internal_cpu_data_master_qualified_request_ext_flash_s1 OR internal_cpu_instruction_master_qualified_request_ext_flash_s1));
  internal_cpu_data_master_requests_ext_ram_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 20) & std_logic_vector'("00000000000000000000")) = std_logic_vector'("10000000000000000000000000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --registered rdv signal_name registered_cpu_data_master_read_data_valid_ext_ram_s1 assignment, which is an e_assign
  registered_cpu_data_master_read_data_valid_ext_ram_s1 <= cpu_data_master_read_data_valid_ext_ram_s1_shift_register(0);
  --shortening pos_edge ~write_n_to_the_ext_ram of type write to ~p1_write_n_to_the_ext_ram, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      write_n_to_the_ext_ram_local <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      write_n_to_the_ext_ram_local <= p1_write_n_to_the_ext_ram;
    end if;

  end process;

  --shortening neg_edge ~write_n_to_the_ext_ram of type write to ~p1_write_n_to_the_ext_ram, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      write_n_to_the_ext_ram_mask <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '0' then
      write_n_to_the_ext_ram_mask <= write_n_to_the_ext_ram_local;
    end if;

  end process;

  --shortening assignment ~write_n_to_the_ext_ram of type write to ~p1_write_n_to_the_ext_ram, which is an e_assign
  write_n_to_the_ext_ram <= NOT ((NOT write_n_to_the_ext_ram_local AND write_n_to_the_ext_ram_mask));
  --wrote_half_cycle_ext_ram_s1_last_time register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      wrote_half_cycle_ext_ram_s1_last_time <= std_logic'('0');
    elsif clk'event and clk = '1' then
      wrote_half_cycle_ext_ram_s1_last_time <= NOT p1_write_n_to_the_ext_ram;
    end if;

  end process;

  --cpu/instruction_master granted ext_ram/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_instruction_master_granted_slave_ext_ram_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_instruction_master_granted_slave_ext_ram_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_instruction_master_saved_grant_ext_ram_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((ext_ram_bus_avalon_slave_arbitration_holdoff_internal OR NOT internal_cpu_instruction_master_requests_ext_ram_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_instruction_master_granted_slave_ext_ram_s1))))));
    end if;

  end process;

  internal_cpu_data_master_qualified_request_ext_ram_s1 <= internal_cpu_data_master_requests_ext_ram_s1 AND NOT (((((cpu_data_master_read AND (((ext_ram_bus_avalon_slave_write_pending OR (ext_ram_bus_avalon_slave_read_pending)) OR (or_reduce(cpu_data_master_read_data_valid_ext_ram_s1_shift_register)))))) OR (((((wrote_half_cycle_ext_ram_s1_last_time OR NOT cpu_data_master_waitrequest) OR ext_ram_bus_avalon_slave_read_pending)) AND cpu_data_master_write))) OR cpu_instruction_master_arbiterlock));
  --cpu_data_master_read_data_valid_ext_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  cpu_data_master_read_data_valid_ext_ram_s1_shift_register_in <= ((internal_cpu_data_master_granted_ext_ram_s1 AND cpu_data_master_read) AND NOT ext_ram_s1_waits_for_read) AND NOT (or_reduce(cpu_data_master_read_data_valid_ext_ram_s1_shift_register));
  --shift register p1 cpu_data_master_read_data_valid_ext_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  p1_cpu_data_master_read_data_valid_ext_ram_s1_shift_register <= A_EXT ((cpu_data_master_read_data_valid_ext_ram_s1_shift_register & A_ToStdLogicVector(cpu_data_master_read_data_valid_ext_ram_s1_shift_register_in)), 2);
  --cpu_data_master_read_data_valid_ext_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_data_master_read_data_valid_ext_ram_s1_shift_register <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      cpu_data_master_read_data_valid_ext_ram_s1_shift_register <= p1_cpu_data_master_read_data_valid_ext_ram_s1_shift_register;
    end if;

  end process;

  --local readdatavalid cpu_data_master_read_data_valid_ext_ram_s1, which is an e_mux
  cpu_data_master_read_data_valid_ext_ram_s1 <= cpu_data_master_read_data_valid_ext_ram_s1_shift_register(1);
  --ext_ram_s1_with_write_latency assignment, which is an e_assign
  ext_ram_s1_with_write_latency <= in_a_write_cycle AND ((internal_cpu_data_master_qualified_request_ext_ram_s1 OR internal_cpu_instruction_master_qualified_request_ext_ram_s1));
  internal_cpu_instruction_master_requests_lan91c111_s1 <= ((to_std_logic(((Std_Logic_Vector'(cpu_instruction_master_address_to_slave(25 DOWNTO 16) & std_logic_vector'("0000000000000000")) = std_logic_vector'("10000100010000000000000000")))) AND (cpu_instruction_master_read))) AND cpu_instruction_master_read;
  --cpu/data_master granted lan91c111/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_data_master_granted_slave_lan91c111_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_data_master_granted_slave_lan91c111_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_data_master_saved_grant_lan91c111_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((ext_ram_bus_avalon_slave_arbitration_holdoff_internal OR NOT internal_cpu_data_master_requests_lan91c111_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_data_master_granted_slave_lan91c111_s1))))));
    end if;

  end process;

  --cpu_data_master_continuerequest continued request, which is an e_mux
  cpu_data_master_continuerequest <= (((last_cycle_cpu_data_master_granted_slave_lan91c111_s1 AND internal_cpu_data_master_requests_lan91c111_s1)) OR ((last_cycle_cpu_data_master_granted_slave_ext_flash_s1 AND internal_cpu_data_master_requests_ext_flash_s1))) OR ((last_cycle_cpu_data_master_granted_slave_ext_ram_s1 AND internal_cpu_data_master_requests_ext_ram_s1));
  internal_cpu_instruction_master_qualified_request_lan91c111_s1 <= internal_cpu_instruction_master_requests_lan91c111_s1 AND NOT ((((cpu_instruction_master_read AND ((((ext_ram_bus_avalon_slave_write_pending OR (ext_ram_bus_avalon_slave_read_pending)) OR to_std_logic(((std_logic_vector'("00000000000000000000000000000010")<(std_logic_vector'("000000000000000000000000000000") & (cpu_instruction_master_latency_counter)))))) OR (cpu_instruction_master_read_data_valid_sdram_s1_shift_register))))) OR cpu_data_master_arbiterlock));
  --cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register_in <= (internal_cpu_instruction_master_granted_lan91c111_s1 AND cpu_instruction_master_read) AND NOT lan91c111_s1_waits_for_read;
  --shift register p1 cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  p1_cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register <= A_EXT ((cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register & A_ToStdLogicVector(cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register_in)), 2);
  --cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register;
    end if;

  end process;

  --local readdatavalid cpu_instruction_master_read_data_valid_lan91c111_s1, which is an e_mux
  cpu_instruction_master_read_data_valid_lan91c111_s1 <= cpu_instruction_master_read_data_valid_lan91c111_s1_shift_register(1);
  internal_cpu_instruction_master_requests_ext_flash_s1 <= ((to_std_logic(((Std_Logic_Vector'(cpu_instruction_master_address_to_slave(25 DOWNTO 23) & std_logic_vector'("00000000000000000000000")) = std_logic_vector'("00000000000000000000000000")))) AND (cpu_instruction_master_read))) AND cpu_instruction_master_read;
  --cpu/data_master granted ext_flash/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_data_master_granted_slave_ext_flash_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_data_master_granted_slave_ext_flash_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_data_master_saved_grant_ext_flash_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((ext_ram_bus_avalon_slave_arbitration_holdoff_internal OR NOT internal_cpu_data_master_requests_ext_flash_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_data_master_granted_slave_ext_flash_s1))))));
    end if;

  end process;

  internal_cpu_instruction_master_qualified_request_ext_flash_s1 <= internal_cpu_instruction_master_requests_ext_flash_s1 AND NOT ((((cpu_instruction_master_read AND ((((ext_ram_bus_avalon_slave_write_pending OR (ext_ram_bus_avalon_slave_read_pending)) OR to_std_logic(((std_logic_vector'("00000000000000000000000000000010")<(std_logic_vector'("000000000000000000000000000000") & (cpu_instruction_master_latency_counter)))))) OR (cpu_instruction_master_read_data_valid_sdram_s1_shift_register))))) OR cpu_data_master_arbiterlock));
  --cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in <= (internal_cpu_instruction_master_granted_ext_flash_s1 AND cpu_instruction_master_read) AND NOT ext_flash_s1_waits_for_read;
  --shift register p1 cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  p1_cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register <= A_EXT ((cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register & A_ToStdLogicVector(cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in)), 2);
  --cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register;
    end if;

  end process;

  --local readdatavalid cpu_instruction_master_read_data_valid_ext_flash_s1, which is an e_mux
  cpu_instruction_master_read_data_valid_ext_flash_s1 <= cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register(1);
  internal_cpu_instruction_master_requests_ext_ram_s1 <= ((to_std_logic(((Std_Logic_Vector'(cpu_instruction_master_address_to_slave(25 DOWNTO 20) & std_logic_vector'("00000000000000000000")) = std_logic_vector'("10000000000000000000000000")))) AND (cpu_instruction_master_read))) AND cpu_instruction_master_read;
  --cpu/data_master granted ext_ram/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_data_master_granted_slave_ext_ram_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_data_master_granted_slave_ext_ram_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_data_master_saved_grant_ext_ram_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((ext_ram_bus_avalon_slave_arbitration_holdoff_internal OR NOT internal_cpu_data_master_requests_ext_ram_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_data_master_granted_slave_ext_ram_s1))))));
    end if;

  end process;

  internal_cpu_instruction_master_qualified_request_ext_ram_s1 <= internal_cpu_instruction_master_requests_ext_ram_s1 AND NOT ((((cpu_instruction_master_read AND ((((ext_ram_bus_avalon_slave_write_pending OR (ext_ram_bus_avalon_slave_read_pending)) OR to_std_logic(((std_logic_vector'("00000000000000000000000000000010")<(std_logic_vector'("000000000000000000000000000000") & (cpu_instruction_master_latency_counter)))))) OR (cpu_instruction_master_read_data_valid_sdram_s1_shift_register))))) OR cpu_data_master_arbiterlock));
  --cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register_in <= (internal_cpu_instruction_master_granted_ext_ram_s1 AND cpu_instruction_master_read) AND NOT ext_ram_s1_waits_for_read;
  --shift register p1 cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  p1_cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register <= A_EXT ((cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register & A_ToStdLogicVector(cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register_in)), 2);
  --cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register;
    end if;

  end process;

  --local readdatavalid cpu_instruction_master_read_data_valid_ext_ram_s1, which is an e_mux
  cpu_instruction_master_read_data_valid_ext_ram_s1 <= cpu_instruction_master_read_data_valid_ext_ram_s1_shift_register(1);
  --allow new arb cycle for ext_ram_bus/avalon_slave, which is an e_assign
  ext_ram_bus_avalon_slave_allow_new_arb_cycle <= NOT cpu_data_master_arbiterlock AND NOT cpu_instruction_master_arbiterlock;
  --cpu/instruction_master assignment into master qualified-requests vector for lan91c111/s1, which is an e_assign
  ext_ram_bus_avalon_slave_master_qreq_vector(0) <= internal_cpu_instruction_master_qualified_request_lan91c111_s1;
  --cpu/instruction_master grant lan91c111/s1, which is an e_assign
  internal_cpu_instruction_master_granted_lan91c111_s1 <= ext_ram_bus_avalon_slave_grant_vector(0);
  --cpu/instruction_master saved-grant lan91c111/s1, which is an e_assign
  cpu_instruction_master_saved_grant_lan91c111_s1 <= ext_ram_bus_avalon_slave_arb_winner(0) AND internal_cpu_instruction_master_requests_lan91c111_s1;
  --cpu/data_master assignment into master qualified-requests vector for lan91c111/s1, which is an e_assign
  ext_ram_bus_avalon_slave_master_qreq_vector(1) <= internal_cpu_data_master_qualified_request_lan91c111_s1;
  --cpu/data_master grant lan91c111/s1, which is an e_assign
  internal_cpu_data_master_granted_lan91c111_s1 <= ext_ram_bus_avalon_slave_grant_vector(1);
  --cpu/data_master saved-grant lan91c111/s1, which is an e_assign
  cpu_data_master_saved_grant_lan91c111_s1 <= ext_ram_bus_avalon_slave_arb_winner(1) AND internal_cpu_data_master_requests_lan91c111_s1;
  --cpu/instruction_master assignment into master qualified-requests vector for ext_flash/s1, which is an e_assign
  ext_ram_bus_avalon_slave_master_qreq_vector(2) <= internal_cpu_instruction_master_qualified_request_ext_flash_s1;
  --cpu/instruction_master grant ext_flash/s1, which is an e_assign
  internal_cpu_instruction_master_granted_ext_flash_s1 <= ext_ram_bus_avalon_slave_grant_vector(2);
  --cpu/instruction_master saved-grant ext_flash/s1, which is an e_assign
  cpu_instruction_master_saved_grant_ext_flash_s1 <= ext_ram_bus_avalon_slave_arb_winner(2) AND internal_cpu_instruction_master_requests_ext_flash_s1;
  --cpu/data_master assignment into master qualified-requests vector for ext_flash/s1, which is an e_assign
  ext_ram_bus_avalon_slave_master_qreq_vector(3) <= internal_cpu_data_master_qualified_request_ext_flash_s1;
  --cpu/data_master grant ext_flash/s1, which is an e_assign
  internal_cpu_data_master_granted_ext_flash_s1 <= ext_ram_bus_avalon_slave_grant_vector(3);
  --cpu/data_master saved-grant ext_flash/s1, which is an e_assign
  cpu_data_master_saved_grant_ext_flash_s1 <= ext_ram_bus_avalon_slave_arb_winner(3) AND internal_cpu_data_master_requests_ext_flash_s1;
  --cpu/instruction_master assignment into master qualified-requests vector for ext_ram/s1, which is an e_assign
  ext_ram_bus_avalon_slave_master_qreq_vector(4) <= internal_cpu_instruction_master_qualified_request_ext_ram_s1;
  --cpu/instruction_master grant ext_ram/s1, which is an e_assign
  internal_cpu_instruction_master_granted_ext_ram_s1 <= ext_ram_bus_avalon_slave_grant_vector(4);
  --cpu/instruction_master saved-grant ext_ram/s1, which is an e_assign
  cpu_instruction_master_saved_grant_ext_ram_s1 <= ext_ram_bus_avalon_slave_arb_winner(4) AND internal_cpu_instruction_master_requests_ext_ram_s1;
  --cpu/data_master assignment into master qualified-requests vector for ext_ram/s1, which is an e_assign
  ext_ram_bus_avalon_slave_master_qreq_vector(5) <= internal_cpu_data_master_qualified_request_ext_ram_s1;
  --cpu/data_master grant ext_ram/s1, which is an e_assign
  internal_cpu_data_master_granted_ext_ram_s1 <= ext_ram_bus_avalon_slave_grant_vector(5);
  --cpu/data_master saved-grant ext_ram/s1, which is an e_assign
  cpu_data_master_saved_grant_ext_ram_s1 <= ext_ram_bus_avalon_slave_arb_winner(5) AND internal_cpu_data_master_requests_ext_ram_s1;
  --ext_ram_bus/avalon_slave chosen-master double-vector, which is an e_assign
  ext_ram_bus_avalon_slave_chosen_master_double_vector <= A_EXT (((std_logic_vector'("0") & ((ext_ram_bus_avalon_slave_master_qreq_vector & ext_ram_bus_avalon_slave_master_qreq_vector))) AND (((std_logic_vector'("0") & (Std_Logic_Vector'(NOT ext_ram_bus_avalon_slave_master_qreq_vector & NOT ext_ram_bus_avalon_slave_master_qreq_vector))) + (std_logic_vector'("0000000") & (ext_ram_bus_avalon_slave_arb_addend))))), 12);
  --stable onehot encoding of arb winner
  ext_ram_bus_avalon_slave_arb_winner <= A_WE_StdLogicVector((std_logic'(((ext_ram_bus_avalon_slave_allow_new_arb_cycle AND or_reduce(ext_ram_bus_avalon_slave_grant_vector)))) = '1'), ext_ram_bus_avalon_slave_grant_vector, ext_ram_bus_avalon_slave_saved_chosen_master_vector);
  --saved ext_ram_bus_avalon_slave_grant_vector, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      ext_ram_bus_avalon_slave_saved_chosen_master_vector <= std_logic_vector'("000000");
    elsif clk'event and clk = '1' then
      if std_logic'(ext_ram_bus_avalon_slave_allow_new_arb_cycle) = '1' then 
        ext_ram_bus_avalon_slave_saved_chosen_master_vector <= A_WE_StdLogicVector((std_logic'(or_reduce(ext_ram_bus_avalon_slave_grant_vector)) = '1'), ext_ram_bus_avalon_slave_grant_vector, ext_ram_bus_avalon_slave_saved_chosen_master_vector);
      end if;
    end if;

  end process;

  --onehot encoding of chosen master
  ext_ram_bus_avalon_slave_grant_vector <= Std_Logic_Vector'(A_ToStdLogicVector(((ext_ram_bus_avalon_slave_chosen_master_double_vector(5) OR ext_ram_bus_avalon_slave_chosen_master_double_vector(11)))) & A_ToStdLogicVector(((ext_ram_bus_avalon_slave_chosen_master_double_vector(4) OR ext_ram_bus_avalon_slave_chosen_master_double_vector(10)))) & A_ToStdLogicVector(((ext_ram_bus_avalon_slave_chosen_master_double_vector(3) OR ext_ram_bus_avalon_slave_chosen_master_double_vector(9)))) & A_ToStdLogicVector(((ext_ram_bus_avalon_slave_chosen_master_double_vector(2) OR ext_ram_bus_avalon_slave_chosen_master_double_vector(8)))) & A_ToStdLogicVector(((ext_ram_bus_avalon_slave_chosen_master_double_vector(1) OR ext_ram_bus_avalon_slave_chosen_master_double_vector(7)))) & A_ToStdLogicVector(((ext_ram_bus_avalon_slave_chosen_master_double_vector(0) OR ext_ram_bus_avalon_slave_chosen_master_double_vector(6)))));
  --ext_ram_bus/avalon_slave chosen master rotated left, which is an e_assign
  ext_ram_bus_avalon_slave_chosen_master_rot_left <= A_EXT (A_WE_StdLogicVector((((A_SLL(ext_ram_bus_avalon_slave_arb_winner,std_logic_vector'("00000000000000000000000000000001")))) /= std_logic_vector'("000000")), (std_logic_vector'("00000000000000000000000000") & ((A_SLL(ext_ram_bus_avalon_slave_arb_winner,std_logic_vector'("00000000000000000000000000000001"))))), std_logic_vector'("00000000000000000000000000000001")), 6);
  --ext_ram_bus/avalon_slave's addend for next-master-grant
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      ext_ram_bus_avalon_slave_arb_addend <= std_logic_vector'("000001");
    elsif clk'event and clk = '1' then
      if std_logic'(or_reduce(ext_ram_bus_avalon_slave_grant_vector)) = '1' then 
        ext_ram_bus_avalon_slave_arb_addend <= A_WE_StdLogicVector((std_logic'(ext_ram_bus_avalon_slave_end_xfer) = '1'), ext_ram_bus_avalon_slave_chosen_master_rot_left, ext_ram_bus_avalon_slave_grant_vector);
      end if;
    end if;

  end process;

  --~reset_to_the_lan91c111 of type reset_n to ~p1_reset_to_the_lan91c111, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      reset_to_the_lan91c111 <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      reset_to_the_lan91c111 <= p1_reset_to_the_lan91c111;
    end if;

  end process;

  --~p1_reset_to_the_lan91c111 assignment, which is an e_assign
  p1_reset_to_the_lan91c111 <= NOT reset_n;
  --ext_ram_bus_avalon_slave_firsttransfer first transaction, which is an e_assign
  ext_ram_bus_avalon_slave_firsttransfer <= A_WE_StdLogic((std_logic'(ext_ram_bus_avalon_slave_begins_xfer) = '1'), ext_ram_bus_avalon_slave_unreg_firsttransfer, ext_ram_bus_avalon_slave_reg_firsttransfer);
  --ext_ram_bus_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  ext_ram_bus_avalon_slave_unreg_firsttransfer <= NOT ((ext_ram_bus_avalon_slave_slavearbiterlockenable AND ext_ram_bus_avalon_slave_any_continuerequest));
  --ext_ram_bus_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      ext_ram_bus_avalon_slave_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(ext_ram_bus_avalon_slave_begins_xfer) = '1' then 
        ext_ram_bus_avalon_slave_reg_firsttransfer <= ext_ram_bus_avalon_slave_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --ext_ram_bus_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  ext_ram_bus_avalon_slave_beginbursttransfer_internal <= ext_ram_bus_avalon_slave_begins_xfer;
  --ext_ram_bus_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  ext_ram_bus_avalon_slave_arbitration_holdoff_internal <= ext_ram_bus_avalon_slave_begins_xfer AND ext_ram_bus_avalon_slave_firsttransfer;
  --~ior_n_to_the_lan91c111 of type read to ~p1_ior_n_to_the_lan91c111, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      ior_n_to_the_lan91c111 <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      ior_n_to_the_lan91c111 <= p1_ior_n_to_the_lan91c111;
    end if;

  end process;

  --~p1_ior_n_to_the_lan91c111 assignment, which is an e_mux
  p1_ior_n_to_the_lan91c111 <= NOT ((((((internal_cpu_data_master_granted_lan91c111_s1 AND cpu_data_master_read)) OR ((internal_cpu_instruction_master_granted_lan91c111_s1 AND cpu_instruction_master_read)))) AND NOT ext_ram_bus_avalon_slave_begins_xfer));
  --~iow_n_to_the_lan91c111 of type write to ~p1_iow_n_to_the_lan91c111, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      iow_n_to_the_lan91c111 <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      iow_n_to_the_lan91c111 <= p1_iow_n_to_the_lan91c111;
    end if;

  end process;

  --~byteenablen_to_the_lan91c111 of type byteenable to ~p1_byteenablen_to_the_lan91c111, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      byteenablen_to_the_lan91c111 <= A_EXT (NOT std_logic_vector'("00000000000000000000000000000000"), 4);
    elsif clk'event and clk = '1' then
      byteenablen_to_the_lan91c111 <= p1_byteenablen_to_the_lan91c111;
    end if;

  end process;

  --~p1_iow_n_to_the_lan91c111 assignment, which is an e_mux
  p1_iow_n_to_the_lan91c111 <= NOT (((((internal_cpu_data_master_granted_lan91c111_s1 AND cpu_data_master_write)) AND NOT ext_ram_bus_avalon_slave_begins_xfer) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (lan91c111_s1_wait_counter))>=std_logic_vector'("00000000000000000000000000000001"))))));
  --ext_ram_bus_address of type address to p1_ext_ram_bus_address, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      ext_ram_bus_address <= std_logic_vector'("00000000000000000000000");
    elsif clk'event and clk = '1' then
      ext_ram_bus_address <= p1_ext_ram_bus_address;
    end if;

  end process;

  --p1_ext_ram_bus_address mux, which is an e_mux
  p1_ext_ram_bus_address <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_lan91c111_s1)) = '1'), (std_logic_vector'("00") & (cpu_data_master_address_to_slave)), A_WE_StdLogicVector((std_logic'((internal_cpu_instruction_master_granted_lan91c111_s1)) = '1'), (std_logic_vector'("00") & (cpu_instruction_master_address_to_slave)), A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_ext_flash_s1)) = '1'), (Std_Logic_Vector'(A_SRL(cpu_data_master_address_to_slave,std_logic_vector'("00000000000000000000000000000010")) & cpu_data_master_dbs_address(1 DOWNTO 0))), A_WE_StdLogicVector((std_logic'((internal_cpu_instruction_master_granted_ext_flash_s1)) = '1'), (Std_Logic_Vector'(A_SRL(cpu_instruction_master_address_to_slave,std_logic_vector'("00000000000000000000000000000010")) & cpu_instruction_master_dbs_address(1 DOWNTO 0))), (std_logic_vector'("00") & (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_ext_ram_s1)) = '1'), cpu_data_master_address_to_slave, cpu_instruction_master_address_to_slave))))))), 23);
  --d1_ext_ram_bus_avalon_slave_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_ext_ram_bus_avalon_slave_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_ext_ram_bus_avalon_slave_end_xfer <= ext_ram_bus_avalon_slave_end_xfer;
    end if;

  end process;

  --lan91c111_s1_wait_counter_eq_1 assignment, which is an e_assign
  lan91c111_s1_wait_counter_eq_1 <= to_std_logic(((std_logic_vector'("0000000000000000000000000000") & (lan91c111_s1_wait_counter)) = std_logic_vector'("00000000000000000000000000000001")));
  --lan91c111_s1_waits_for_read in a cycle, which is an e_mux
  lan91c111_s1_waits_for_read <= lan91c111_s1_in_a_read_cycle AND wait_for_lan91c111_s1_counter;
  --lan91c111_s1_in_a_read_cycle assignment, which is an e_assign
  lan91c111_s1_in_a_read_cycle <= ((internal_cpu_data_master_granted_lan91c111_s1 AND cpu_data_master_read)) OR ((internal_cpu_instruction_master_granted_lan91c111_s1 AND cpu_instruction_master_read));
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= (lan91c111_s1_in_a_read_cycle OR ext_flash_s1_in_a_read_cycle) OR ext_ram_s1_in_a_read_cycle;
  --lan91c111_s1_waits_for_write in a cycle, which is an e_mux
  lan91c111_s1_waits_for_write <= lan91c111_s1_in_a_write_cycle AND wait_for_lan91c111_s1_counter;
  --lan91c111_s1_in_a_write_cycle assignment, which is an e_assign
  lan91c111_s1_in_a_write_cycle <= internal_cpu_data_master_granted_lan91c111_s1 AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= (lan91c111_s1_in_a_write_cycle OR ext_flash_s1_in_a_write_cycle) OR ext_ram_s1_in_a_write_cycle;
  internal_lan91c111_s1_wait_counter_eq_0 <= to_std_logic(((std_logic_vector'("0000000000000000000000000000") & (lan91c111_s1_wait_counter)) = std_logic_vector'("00000000000000000000000000000000")));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      lan91c111_s1_wait_counter <= std_logic_vector'("0000");
    elsif clk'event and clk = '1' then
      lan91c111_s1_wait_counter <= lan91c111_s1_counter_load_value;
    end if;

  end process;

  lan91c111_s1_counter_load_value <= A_EXT (A_WE_StdLogicVector((std_logic'(((lan91c111_s1_in_a_write_cycle AND ext_ram_bus_avalon_slave_begins_xfer))) = '1'), std_logic_vector'("000000000000000000000000000001001"), A_WE_StdLogicVector((std_logic'(((lan91c111_s1_in_a_read_cycle AND ext_ram_bus_avalon_slave_begins_xfer))) = '1'), std_logic_vector'("000000000000000000000000000001000"), A_WE_StdLogicVector((std_logic'((NOT internal_lan91c111_s1_wait_counter_eq_0)) = '1'), ((std_logic_vector'("00000000000000000000000000000") & (lan91c111_s1_wait_counter)) - std_logic_vector'("000000000000000000000000000000001")), std_logic_vector'("000000000000000000000000000000000")))), 4);
  wait_for_lan91c111_s1_counter <= ext_ram_bus_avalon_slave_begins_xfer OR NOT internal_lan91c111_s1_wait_counter_eq_0;
  --~p1_byteenablen_to_the_lan91c111 byte enable port mux, which is an e_mux
  p1_byteenablen_to_the_lan91c111 <= A_EXT (NOT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_lan91c111_s1)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001")))), 4);
  p1_select_n_to_the_ext_flash <= NOT ((internal_cpu_data_master_granted_ext_flash_s1 OR internal_cpu_instruction_master_granted_ext_flash_s1));
  --~read_n_to_the_ext_flash of type read to ~p1_read_n_to_the_ext_flash, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      read_n_to_the_ext_flash <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      read_n_to_the_ext_flash <= p1_read_n_to_the_ext_flash;
    end if;

  end process;

  --~p1_read_n_to_the_ext_flash assignment, which is an e_mux
  p1_read_n_to_the_ext_flash <= NOT (((((((internal_cpu_data_master_granted_ext_flash_s1 AND cpu_data_master_read)) OR ((internal_cpu_instruction_master_granted_ext_flash_s1 AND cpu_instruction_master_read)))) AND NOT ext_ram_bus_avalon_slave_begins_xfer) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (ext_flash_s1_wait_counter))<std_logic_vector'("00000000000000000000000000001000"))))));
  --~write_n_to_the_ext_flash of type write to ~p1_write_n_to_the_ext_flash, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      write_n_to_the_ext_flash <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      write_n_to_the_ext_flash <= p1_write_n_to_the_ext_flash;
    end if;

  end process;

  --~p1_write_n_to_the_ext_flash assignment, which is an e_mux
  p1_write_n_to_the_ext_flash <= NOT (((((((internal_cpu_data_master_granted_ext_flash_s1 AND cpu_data_master_write)) AND NOT ext_ram_bus_avalon_slave_begins_xfer) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (ext_flash_s1_wait_counter))>=std_logic_vector'("00000000000000000000000000000010"))))) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (ext_flash_s1_wait_counter))<std_logic_vector'("00000000000000000000000000001010"))))) AND ext_flash_s1_pretend_byte_enable));
  --ext_flash_s1_wait_counter_eq_1 assignment, which is an e_assign
  ext_flash_s1_wait_counter_eq_1 <= to_std_logic(((std_logic_vector'("0000000000000000000000000000") & (ext_flash_s1_wait_counter)) = std_logic_vector'("00000000000000000000000000000001")));
  --ext_flash_s1_waits_for_read in a cycle, which is an e_mux
  ext_flash_s1_waits_for_read <= ext_flash_s1_in_a_read_cycle AND wait_for_ext_flash_s1_counter;
  --ext_flash_s1_in_a_read_cycle assignment, which is an e_assign
  ext_flash_s1_in_a_read_cycle <= ((internal_cpu_data_master_granted_ext_flash_s1 AND cpu_data_master_read)) OR ((internal_cpu_instruction_master_granted_ext_flash_s1 AND cpu_instruction_master_read));
  --ext_flash_s1_waits_for_write in a cycle, which is an e_mux
  ext_flash_s1_waits_for_write <= ext_flash_s1_in_a_write_cycle AND wait_for_ext_flash_s1_counter;
  --ext_flash_s1_in_a_write_cycle assignment, which is an e_assign
  ext_flash_s1_in_a_write_cycle <= internal_cpu_data_master_granted_ext_flash_s1 AND cpu_data_master_write;
  internal_ext_flash_s1_wait_counter_eq_0 <= to_std_logic(((std_logic_vector'("0000000000000000000000000000") & (ext_flash_s1_wait_counter)) = std_logic_vector'("00000000000000000000000000000000")));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      ext_flash_s1_wait_counter <= std_logic_vector'("0000");
    elsif clk'event and clk = '1' then
      ext_flash_s1_wait_counter <= ext_flash_s1_counter_load_value;
    end if;

  end process;

  ext_flash_s1_counter_load_value <= A_EXT (A_WE_StdLogicVector((std_logic'(((ext_flash_s1_in_a_read_cycle AND ext_ram_bus_avalon_slave_begins_xfer))) = '1'), std_logic_vector'("000000000000000000000000000001000"), A_WE_StdLogicVector((std_logic'(((ext_flash_s1_in_a_write_cycle AND ext_ram_bus_avalon_slave_begins_xfer))) = '1'), std_logic_vector'("000000000000000000000000000001010"), A_WE_StdLogicVector((std_logic'((NOT internal_ext_flash_s1_wait_counter_eq_0)) = '1'), ((std_logic_vector'("00000000000000000000000000000") & (ext_flash_s1_wait_counter)) - std_logic_vector'("000000000000000000000000000000001")), std_logic_vector'("000000000000000000000000000000000")))), 4);
  wait_for_ext_flash_s1_counter <= ext_ram_bus_avalon_slave_begins_xfer OR NOT internal_ext_flash_s1_wait_counter_eq_0;
  --ext_flash_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  ext_flash_s1_pretend_byte_enable <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_ext_flash_s1)) = '1'), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(internal_cpu_data_master_byteenable_ext_flash_s1))), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))));
  (cpu_data_master_byteenable_ext_flash_s1_segment_3, cpu_data_master_byteenable_ext_flash_s1_segment_2, cpu_data_master_byteenable_ext_flash_s1_segment_1, cpu_data_master_byteenable_ext_flash_s1_segment_0) <= cpu_data_master_byteenable;
  internal_cpu_data_master_byteenable_ext_flash_s1 <= A_WE_StdLogic((((std_logic_vector'("000000000000000000000000000000") & (cpu_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000000"))), cpu_data_master_byteenable_ext_flash_s1_segment_0, A_WE_StdLogic((((std_logic_vector'("000000000000000000000000000000") & (cpu_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000001"))), cpu_data_master_byteenable_ext_flash_s1_segment_1, A_WE_StdLogic((((std_logic_vector'("000000000000000000000000000000") & (cpu_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000010"))), cpu_data_master_byteenable_ext_flash_s1_segment_2, cpu_data_master_byteenable_ext_flash_s1_segment_3)));
  p1_select_n_to_the_ext_ram <= NOT ((internal_cpu_data_master_granted_ext_ram_s1 OR internal_cpu_instruction_master_granted_ext_ram_s1));
  --~read_n_to_the_ext_ram of type read to ~p1_read_n_to_the_ext_ram, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      read_n_to_the_ext_ram <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      read_n_to_the_ext_ram <= p1_read_n_to_the_ext_ram;
    end if;

  end process;

  --~p1_read_n_to_the_ext_ram assignment, which is an e_mux
  p1_read_n_to_the_ext_ram <= NOT ((((internal_cpu_data_master_granted_ext_ram_s1 AND cpu_data_master_read)) OR ((internal_cpu_instruction_master_granted_ext_ram_s1 AND cpu_instruction_master_read))));
  --~be_n_to_the_ext_ram of type byteenable to ~p1_be_n_to_the_ext_ram, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      be_n_to_the_ext_ram <= A_EXT (NOT std_logic_vector'("00000000000000000000000000000000"), 4);
    elsif clk'event and clk = '1' then
      be_n_to_the_ext_ram <= p1_be_n_to_the_ext_ram;
    end if;

  end process;

  --~p1_write_n_to_the_ext_ram assignment, which is an e_mux
  p1_write_n_to_the_ext_ram <= NOT ((internal_cpu_data_master_granted_ext_ram_s1 AND cpu_data_master_write));
  --ext_ram_s1_waits_for_read in a cycle, which is an e_mux
  ext_ram_s1_waits_for_read <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(ext_ram_s1_in_a_read_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --ext_ram_s1_in_a_read_cycle assignment, which is an e_assign
  ext_ram_s1_in_a_read_cycle <= ((internal_cpu_data_master_granted_ext_ram_s1 AND cpu_data_master_read)) OR ((internal_cpu_instruction_master_granted_ext_ram_s1 AND cpu_instruction_master_read));
  --ext_ram_s1_waits_for_write in a cycle, which is an e_mux
  ext_ram_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(ext_ram_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --ext_ram_s1_in_a_write_cycle assignment, which is an e_assign
  ext_ram_s1_in_a_write_cycle <= internal_cpu_data_master_granted_ext_ram_s1 AND cpu_data_master_write;
  wait_for_ext_ram_s1_counter <= std_logic'('0');
  --~p1_be_n_to_the_ext_ram byte enable port mux, which is an e_mux
  p1_be_n_to_the_ext_ram <= A_EXT (NOT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_ext_ram_s1)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001")))), 4);
  --first irq irq_from_the_lan91c111 register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_irq_from_the_lan91c111 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_irq_from_the_lan91c111 <= irq_from_the_lan91c111;
    end if;

  end process;

  --vhdl renameroo for output signals
  cpu_data_master_byteenable_ext_flash_s1 <= internal_cpu_data_master_byteenable_ext_flash_s1;
  --vhdl renameroo for output signals
  cpu_data_master_granted_ext_flash_s1 <= internal_cpu_data_master_granted_ext_flash_s1;
  --vhdl renameroo for output signals
  cpu_data_master_granted_ext_ram_s1 <= internal_cpu_data_master_granted_ext_ram_s1;
  --vhdl renameroo for output signals
  cpu_data_master_granted_lan91c111_s1 <= internal_cpu_data_master_granted_lan91c111_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_ext_flash_s1 <= internal_cpu_data_master_qualified_request_ext_flash_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_ext_ram_s1 <= internal_cpu_data_master_qualified_request_ext_ram_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_lan91c111_s1 <= internal_cpu_data_master_qualified_request_lan91c111_s1;
  --vhdl renameroo for output signals
  cpu_data_master_requests_ext_flash_s1 <= internal_cpu_data_master_requests_ext_flash_s1;
  --vhdl renameroo for output signals
  cpu_data_master_requests_ext_ram_s1 <= internal_cpu_data_master_requests_ext_ram_s1;
  --vhdl renameroo for output signals
  cpu_data_master_requests_lan91c111_s1 <= internal_cpu_data_master_requests_lan91c111_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_granted_ext_flash_s1 <= internal_cpu_instruction_master_granted_ext_flash_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_granted_ext_ram_s1 <= internal_cpu_instruction_master_granted_ext_ram_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_granted_lan91c111_s1 <= internal_cpu_instruction_master_granted_lan91c111_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_qualified_request_ext_flash_s1 <= internal_cpu_instruction_master_qualified_request_ext_flash_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_qualified_request_ext_ram_s1 <= internal_cpu_instruction_master_qualified_request_ext_ram_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_qualified_request_lan91c111_s1 <= internal_cpu_instruction_master_qualified_request_lan91c111_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_requests_ext_flash_s1 <= internal_cpu_instruction_master_requests_ext_flash_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_requests_ext_ram_s1 <= internal_cpu_instruction_master_requests_ext_ram_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_requests_lan91c111_s1 <= internal_cpu_instruction_master_requests_lan91c111_s1;
  --vhdl renameroo for output signals
  ext_flash_s1_wait_counter_eq_0 <= internal_ext_flash_s1_wait_counter_eq_0;
  --vhdl renameroo for output signals
  incoming_ext_ram_bus_data <= internal_incoming_ext_ram_bus_data;
  --vhdl renameroo for output signals
  lan91c111_s1_wait_counter_eq_0 <= internal_lan91c111_s1_wait_counter_eq_0;
--synthesis translate_off
    --lan91c111/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

    --incoming_ext_ram_bus_data_bit_0_is_x x check, which is an e_assign_is_x
    incoming_ext_ram_bus_data_bit_0_is_x <= A_WE_StdLogic(is_x(std_ulogic(internal_incoming_ext_ram_bus_data(0))), '1','0');
    --Crush incoming_ext_ram_bus_data_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
    incoming_ext_ram_bus_data_with_Xs_converted_to_0(0) <= A_WE_StdLogic((std_logic'(incoming_ext_ram_bus_data_bit_0_is_x) = '1'), std_logic'('0'), internal_incoming_ext_ram_bus_data(0));
    --incoming_ext_ram_bus_data_bit_1_is_x x check, which is an e_assign_is_x
    incoming_ext_ram_bus_data_bit_1_is_x <= A_WE_StdLogic(is_x(std_ulogic(internal_incoming_ext_ram_bus_data(1))), '1','0');
    --Crush incoming_ext_ram_bus_data_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
    incoming_ext_ram_bus_data_with_Xs_converted_to_0(1) <= A_WE_StdLogic((std_logic'(incoming_ext_ram_bus_data_bit_1_is_x) = '1'), std_logic'('0'), internal_incoming_ext_ram_bus_data(1));
    --incoming_ext_ram_bus_data_bit_2_is_x x check, which is an e_assign_is_x
    incoming_ext_ram_bus_data_bit_2_is_x <= A_WE_StdLogic(is_x(std_ulogic(internal_incoming_ext_ram_bus_data(2))), '1','0');
    --Crush incoming_ext_ram_bus_data_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
    incoming_ext_ram_bus_data_with_Xs_converted_to_0(2) <= A_WE_StdLogic((std_logic'(incoming_ext_ram_bus_data_bit_2_is_x) = '1'), std_logic'('0'), internal_incoming_ext_ram_bus_data(2));
    --incoming_ext_ram_bus_data_bit_3_is_x x check, which is an e_assign_is_x
    incoming_ext_ram_bus_data_bit_3_is_x <= A_WE_StdLogic(is_x(std_ulogic(internal_incoming_ext_ram_bus_data(3))), '1','0');
    --Crush incoming_ext_ram_bus_data_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
    incoming_ext_ram_bus_data_with_Xs_converted_to_0(3) <= A_WE_StdLogic((std_logic'(incoming_ext_ram_bus_data_bit_3_is_x) = '1'), std_logic'('0'), internal_incoming_ext_ram_bus_data(3));
    --incoming_ext_ram_bus_data_bit_4_is_x x check, which is an e_assign_is_x
    incoming_ext_ram_bus_data_bit_4_is_x <= A_WE_StdLogic(is_x(std_ulogic(internal_incoming_ext_ram_bus_data(4))), '1','0');
    --Crush incoming_ext_ram_bus_data_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
    incoming_ext_ram_bus_data_with_Xs_converted_to_0(4) <= A_WE_StdLogic((std_logic'(incoming_ext_ram_bus_data_bit_4_is_x) = '1'), std_logic'('0'), internal_incoming_ext_ram_bus_data(4));
    --incoming_ext_ram_bus_data_bit_5_is_x x check, which is an e_assign_is_x
    incoming_ext_ram_bus_data_bit_5_is_x <= A_WE_StdLogic(is_x(std_ulogic(internal_incoming_ext_ram_bus_data(5))), '1','0');
    --Crush incoming_ext_ram_bus_data_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
    incoming_ext_ram_bus_data_with_Xs_converted_to_0(5) <= A_WE_StdLogic((std_logic'(incoming_ext_ram_bus_data_bit_5_is_x) = '1'), std_logic'('0'), internal_incoming_ext_ram_bus_data(5));
    --incoming_ext_ram_bus_data_bit_6_is_x x check, which is an e_assign_is_x
    incoming_ext_ram_bus_data_bit_6_is_x <= A_WE_StdLogic(is_x(std_ulogic(internal_incoming_ext_ram_bus_data(6))), '1','0');
    --Crush incoming_ext_ram_bus_data_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
    incoming_ext_ram_bus_data_with_Xs_converted_to_0(6) <= A_WE_StdLogic((std_logic'(incoming_ext_ram_bus_data_bit_6_is_x) = '1'), std_logic'('0'), internal_incoming_ext_ram_bus_data(6));
    --incoming_ext_ram_bus_data_bit_7_is_x x check, which is an e_assign_is_x
    incoming_ext_ram_bus_data_bit_7_is_x <= A_WE_StdLogic(is_x(std_ulogic(internal_incoming_ext_ram_bus_data(7))), '1','0');
    --Crush incoming_ext_ram_bus_data_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
    incoming_ext_ram_bus_data_with_Xs_converted_to_0(7) <= A_WE_StdLogic((std_logic'(incoming_ext_ram_bus_data_bit_7_is_x) = '1'), std_logic'('0'), internal_incoming_ext_ram_bus_data(7));
    --ext_flash/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

    --ext_ram/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

    --grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line9 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("00000000000000000000000000") & (((std_logic_vector'("0") & (((std_logic_vector'("0") & (((std_logic_vector'("0") & (((std_logic_vector'("0") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_data_master_granted_ext_flash_s1))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_data_master_granted_ext_ram_s1)))))) + (std_logic_vector'("00") & (A_TOSTDLOGICVECTOR(internal_cpu_data_master_granted_lan91c111_s1)))))) + (std_logic_vector'("000") & (A_TOSTDLOGICVECTOR(internal_cpu_instruction_master_granted_ext_flash_s1)))))) + (std_logic_vector'("0000") & (A_TOSTDLOGICVECTOR(internal_cpu_instruction_master_granted_ext_ram_s1)))))) + (std_logic_vector'("00000") & (A_TOSTDLOGICVECTOR(internal_cpu_instruction_master_granted_lan91c111_s1))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line9, now);
          write(write_line9, string'(": "));
          write(write_line9, string'("> 1 of grant signals are active simultaneously"));
          write(output, write_line9.all);
          deallocate (write_line9);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --saved_grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line10 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("00000000000000000000000000") & (((std_logic_vector'("0") & (((std_logic_vector'("0") & (((std_logic_vector'("0") & (((std_logic_vector'("0") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_data_master_saved_grant_ext_flash_s1))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_data_master_saved_grant_ext_ram_s1)))))) + (std_logic_vector'("00") & (A_TOSTDLOGICVECTOR(cpu_data_master_saved_grant_lan91c111_s1)))))) + (std_logic_vector'("000") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_saved_grant_ext_flash_s1)))))) + (std_logic_vector'("0000") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_saved_grant_ext_ram_s1)))))) + (std_logic_vector'("00000") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_saved_grant_lan91c111_s1))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line10, now);
          write(write_line10, string'(": "));
          write(write_line10, string'("> 1 of saved_grant signals are active simultaneously"));
          write(output, write_line10.all);
          deallocate (write_line10);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on
--synthesis read_comments_as_HDL on
--    
--    incoming_ext_ram_bus_data_with_Xs_converted_to_0 <= internal_incoming_ext_ram_bus_data (7 DOWNTO 0);
--synthesis read_comments_as_HDL off

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ext_ram_bus_bridge_arbitrator is 
end entity ext_ram_bus_bridge_arbitrator;


architecture europa of ext_ram_bus_bridge_arbitrator is

begin


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity high_res_timer_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal high_res_timer_s1_irq : IN STD_LOGIC;
                 signal high_res_timer_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_data_master_granted_high_res_timer_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_high_res_timer_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_high_res_timer_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_requests_high_res_timer_s1 : OUT STD_LOGIC;
                 signal d1_high_res_timer_s1_end_xfer : OUT STD_LOGIC;
                 signal high_res_timer_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal high_res_timer_s1_chipselect : OUT STD_LOGIC;
                 signal high_res_timer_s1_irq_from_sa : OUT STD_LOGIC;
                 signal high_res_timer_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal high_res_timer_s1_reset_n : OUT STD_LOGIC;
                 signal high_res_timer_s1_write_n : OUT STD_LOGIC;
                 signal high_res_timer_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
              );
end entity high_res_timer_s1_arbitrator;


architecture europa of high_res_timer_s1_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_high_res_timer_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_high_res_timer_s1 :  STD_LOGIC;
                signal high_res_timer_s1_allgrants :  STD_LOGIC;
                signal high_res_timer_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal high_res_timer_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal high_res_timer_s1_any_continuerequest :  STD_LOGIC;
                signal high_res_timer_s1_arb_counter_enable :  STD_LOGIC;
                signal high_res_timer_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal high_res_timer_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal high_res_timer_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal high_res_timer_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal high_res_timer_s1_begins_xfer :  STD_LOGIC;
                signal high_res_timer_s1_end_xfer :  STD_LOGIC;
                signal high_res_timer_s1_firsttransfer :  STD_LOGIC;
                signal high_res_timer_s1_grant_vector :  STD_LOGIC;
                signal high_res_timer_s1_in_a_read_cycle :  STD_LOGIC;
                signal high_res_timer_s1_in_a_write_cycle :  STD_LOGIC;
                signal high_res_timer_s1_master_qreq_vector :  STD_LOGIC;
                signal high_res_timer_s1_non_bursting_master_requests :  STD_LOGIC;
                signal high_res_timer_s1_reg_firsttransfer :  STD_LOGIC;
                signal high_res_timer_s1_slavearbiterlockenable :  STD_LOGIC;
                signal high_res_timer_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal high_res_timer_s1_unreg_firsttransfer :  STD_LOGIC;
                signal high_res_timer_s1_waits_for_read :  STD_LOGIC;
                signal high_res_timer_s1_waits_for_write :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_high_res_timer_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_high_res_timer_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_requests_high_res_timer_s1 :  STD_LOGIC;
                signal shifted_address_to_high_res_timer_s1_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal wait_for_high_res_timer_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT high_res_timer_s1_end_xfer;
    end if;

  end process;

  high_res_timer_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_data_master_qualified_request_high_res_timer_s1);
  --assign high_res_timer_s1_readdata_from_sa = high_res_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  high_res_timer_s1_readdata_from_sa <= high_res_timer_s1_readdata;
  internal_cpu_data_master_requests_high_res_timer_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 5) & std_logic_vector'("00000")) = std_logic_vector'("10000100100000100000100000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --high_res_timer_s1_arb_share_counter set values, which is an e_mux
  high_res_timer_s1_arb_share_set_values <= std_logic_vector'("001");
  --high_res_timer_s1_non_bursting_master_requests mux, which is an e_mux
  high_res_timer_s1_non_bursting_master_requests <= internal_cpu_data_master_requests_high_res_timer_s1;
  --high_res_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  high_res_timer_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --high_res_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  high_res_timer_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(high_res_timer_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (high_res_timer_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(high_res_timer_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (high_res_timer_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --high_res_timer_s1_allgrants all slave grants, which is an e_mux
  high_res_timer_s1_allgrants <= high_res_timer_s1_grant_vector;
  --high_res_timer_s1_end_xfer assignment, which is an e_assign
  high_res_timer_s1_end_xfer <= NOT ((high_res_timer_s1_waits_for_read OR high_res_timer_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_high_res_timer_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_high_res_timer_s1 <= high_res_timer_s1_end_xfer AND (((NOT high_res_timer_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --high_res_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  high_res_timer_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_high_res_timer_s1 AND high_res_timer_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_high_res_timer_s1 AND NOT high_res_timer_s1_non_bursting_master_requests));
  --high_res_timer_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      high_res_timer_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(high_res_timer_s1_arb_counter_enable) = '1' then 
        high_res_timer_s1_arb_share_counter <= high_res_timer_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --high_res_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      high_res_timer_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((high_res_timer_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_high_res_timer_s1)) OR ((end_xfer_arb_share_counter_term_high_res_timer_s1 AND NOT high_res_timer_s1_non_bursting_master_requests)))) = '1' then 
        high_res_timer_s1_slavearbiterlockenable <= or_reduce(high_res_timer_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master high_res_timer/s1 arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= high_res_timer_s1_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --high_res_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  high_res_timer_s1_slavearbiterlockenable2 <= or_reduce(high_res_timer_s1_arb_share_counter_next_value);
  --cpu/data_master high_res_timer/s1 arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= high_res_timer_s1_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --high_res_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  high_res_timer_s1_any_continuerequest <= std_logic'('1');
  --cpu_data_master_continuerequest continued request, which is an e_assign
  cpu_data_master_continuerequest <= std_logic'('1');
  internal_cpu_data_master_qualified_request_high_res_timer_s1 <= internal_cpu_data_master_requests_high_res_timer_s1 AND NOT (((NOT cpu_data_master_waitrequest) AND cpu_data_master_write));
  --high_res_timer_s1_writedata mux, which is an e_mux
  high_res_timer_s1_writedata <= cpu_data_master_writedata (15 DOWNTO 0);
  --master is always granted when requested
  internal_cpu_data_master_granted_high_res_timer_s1 <= internal_cpu_data_master_qualified_request_high_res_timer_s1;
  --cpu/data_master saved-grant high_res_timer/s1, which is an e_assign
  cpu_data_master_saved_grant_high_res_timer_s1 <= internal_cpu_data_master_requests_high_res_timer_s1;
  --allow new arb cycle for high_res_timer/s1, which is an e_assign
  high_res_timer_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  high_res_timer_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  high_res_timer_s1_master_qreq_vector <= std_logic'('1');
  --high_res_timer_s1_reset_n assignment, which is an e_assign
  high_res_timer_s1_reset_n <= reset_n;
  high_res_timer_s1_chipselect <= internal_cpu_data_master_granted_high_res_timer_s1;
  --high_res_timer_s1_firsttransfer first transaction, which is an e_assign
  high_res_timer_s1_firsttransfer <= A_WE_StdLogic((std_logic'(high_res_timer_s1_begins_xfer) = '1'), high_res_timer_s1_unreg_firsttransfer, high_res_timer_s1_reg_firsttransfer);
  --high_res_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  high_res_timer_s1_unreg_firsttransfer <= NOT ((high_res_timer_s1_slavearbiterlockenable AND high_res_timer_s1_any_continuerequest));
  --high_res_timer_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      high_res_timer_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(high_res_timer_s1_begins_xfer) = '1' then 
        high_res_timer_s1_reg_firsttransfer <= high_res_timer_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --high_res_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  high_res_timer_s1_beginbursttransfer_internal <= high_res_timer_s1_begins_xfer;
  --~high_res_timer_s1_write_n assignment, which is an e_mux
  high_res_timer_s1_write_n <= NOT ((internal_cpu_data_master_granted_high_res_timer_s1 AND cpu_data_master_write));
  shifted_address_to_high_res_timer_s1_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --high_res_timer_s1_address mux, which is an e_mux
  high_res_timer_s1_address <= A_EXT (A_SRL(shifted_address_to_high_res_timer_s1_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010")), 3);
  --d1_high_res_timer_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_high_res_timer_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_high_res_timer_s1_end_xfer <= high_res_timer_s1_end_xfer;
    end if;

  end process;

  --high_res_timer_s1_waits_for_read in a cycle, which is an e_mux
  high_res_timer_s1_waits_for_read <= high_res_timer_s1_in_a_read_cycle AND high_res_timer_s1_begins_xfer;
  --high_res_timer_s1_in_a_read_cycle assignment, which is an e_assign
  high_res_timer_s1_in_a_read_cycle <= internal_cpu_data_master_granted_high_res_timer_s1 AND cpu_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= high_res_timer_s1_in_a_read_cycle;
  --high_res_timer_s1_waits_for_write in a cycle, which is an e_mux
  high_res_timer_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(high_res_timer_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --high_res_timer_s1_in_a_write_cycle assignment, which is an e_assign
  high_res_timer_s1_in_a_write_cycle <= internal_cpu_data_master_granted_high_res_timer_s1 AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= high_res_timer_s1_in_a_write_cycle;
  wait_for_high_res_timer_s1_counter <= std_logic'('0');
  --assign high_res_timer_s1_irq_from_sa = high_res_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  high_res_timer_s1_irq_from_sa <= high_res_timer_s1_irq;
  --vhdl renameroo for output signals
  cpu_data_master_granted_high_res_timer_s1 <= internal_cpu_data_master_granted_high_res_timer_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_high_res_timer_s1 <= internal_cpu_data_master_qualified_request_high_res_timer_s1;
  --vhdl renameroo for output signals
  cpu_data_master_requests_high_res_timer_s1 <= internal_cpu_data_master_requests_high_res_timer_s1;
--synthesis translate_off
    --high_res_timer/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity jtag_uart_avalon_jtag_slave_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_avalon_jtag_slave_dataavailable : IN STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_irq : IN STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_avalon_jtag_slave_readyfordata : IN STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_waitrequest : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_data_master_granted_jtag_uart_avalon_jtag_slave : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave : OUT STD_LOGIC;
                 signal cpu_data_master_requests_jtag_uart_avalon_jtag_slave : OUT STD_LOGIC;
                 signal d1_jtag_uart_avalon_jtag_slave_end_xfer : OUT STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_address : OUT STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_chipselect : OUT STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_dataavailable_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_irq_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_read_n : OUT STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_avalon_jtag_slave_readyfordata_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_reset_n : OUT STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_waitrequest_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_write_n : OUT STD_LOGIC;
                 signal jtag_uart_avalon_jtag_slave_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity jtag_uart_avalon_jtag_slave_arbitrator;


architecture europa of jtag_uart_avalon_jtag_slave_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_jtag_uart_avalon_jtag_slave :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave :  STD_LOGIC;
                signal internal_cpu_data_master_requests_jtag_uart_avalon_jtag_slave :  STD_LOGIC;
                signal internal_jtag_uart_avalon_jtag_slave_waitrequest_from_sa :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_allgrants :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_allow_new_arb_cycle :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_any_continuerequest :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_arb_counter_enable :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal jtag_uart_avalon_jtag_slave_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal jtag_uart_avalon_jtag_slave_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal jtag_uart_avalon_jtag_slave_beginbursttransfer_internal :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_begins_xfer :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_end_xfer :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_firsttransfer :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_grant_vector :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_in_a_read_cycle :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_in_a_write_cycle :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_master_qreq_vector :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_non_bursting_master_requests :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_reg_firsttransfer :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_slavearbiterlockenable :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_unreg_firsttransfer :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_waits_for_read :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal wait_for_jtag_uart_avalon_jtag_slave_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT jtag_uart_avalon_jtag_slave_end_xfer;
    end if;

  end process;

  jtag_uart_avalon_jtag_slave_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave);
  --assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_avalon_jtag_slave_readdata_from_sa <= jtag_uart_avalon_jtag_slave_readdata;
  internal_cpu_data_master_requests_jtag_uart_avalon_jtag_slave <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 3) & std_logic_vector'("000")) = std_logic_vector'("10000100100000100010110000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_avalon_jtag_slave_dataavailable_from_sa <= jtag_uart_avalon_jtag_slave_dataavailable;
  --assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_avalon_jtag_slave_readyfordata_from_sa <= jtag_uart_avalon_jtag_slave_readyfordata;
  --assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  internal_jtag_uart_avalon_jtag_slave_waitrequest_from_sa <= jtag_uart_avalon_jtag_slave_waitrequest;
  --jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  jtag_uart_avalon_jtag_slave_arb_share_set_values <= std_logic_vector'("001");
  --jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  jtag_uart_avalon_jtag_slave_non_bursting_master_requests <= internal_cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  --jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant <= std_logic'('0');
  --jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  jtag_uart_avalon_jtag_slave_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(jtag_uart_avalon_jtag_slave_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (jtag_uart_avalon_jtag_slave_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(jtag_uart_avalon_jtag_slave_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (jtag_uart_avalon_jtag_slave_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  jtag_uart_avalon_jtag_slave_allgrants <= jtag_uart_avalon_jtag_slave_grant_vector;
  --jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  jtag_uart_avalon_jtag_slave_end_xfer <= NOT ((jtag_uart_avalon_jtag_slave_waits_for_read OR jtag_uart_avalon_jtag_slave_waits_for_write));
  --end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave <= jtag_uart_avalon_jtag_slave_end_xfer AND (((NOT jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  jtag_uart_avalon_jtag_slave_arb_counter_enable <= ((end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave AND jtag_uart_avalon_jtag_slave_allgrants)) OR ((end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave AND NOT jtag_uart_avalon_jtag_slave_non_bursting_master_requests));
  --jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      jtag_uart_avalon_jtag_slave_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(jtag_uart_avalon_jtag_slave_arb_counter_enable) = '1' then 
        jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((jtag_uart_avalon_jtag_slave_master_qreq_vector AND end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave)) OR ((end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave AND NOT jtag_uart_avalon_jtag_slave_non_bursting_master_requests)))) = '1' then 
        jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= or_reduce(jtag_uart_avalon_jtag_slave_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= jtag_uart_avalon_jtag_slave_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 <= or_reduce(jtag_uart_avalon_jtag_slave_arb_share_counter_next_value);
  --cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  jtag_uart_avalon_jtag_slave_any_continuerequest <= std_logic'('1');
  --cpu_data_master_continuerequest continued request, which is an e_assign
  cpu_data_master_continuerequest <= std_logic'('1');
  internal_cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave <= internal_cpu_data_master_requests_jtag_uart_avalon_jtag_slave AND NOT ((((cpu_data_master_read AND (NOT cpu_data_master_waitrequest))) OR (((NOT cpu_data_master_waitrequest) AND cpu_data_master_write))));
  --jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  jtag_uart_avalon_jtag_slave_writedata <= cpu_data_master_writedata;
  --master is always granted when requested
  internal_cpu_data_master_granted_jtag_uart_avalon_jtag_slave <= internal_cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  --cpu/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave <= internal_cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  --allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  jtag_uart_avalon_jtag_slave_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  jtag_uart_avalon_jtag_slave_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  jtag_uart_avalon_jtag_slave_master_qreq_vector <= std_logic'('1');
  --jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  jtag_uart_avalon_jtag_slave_reset_n <= reset_n;
  jtag_uart_avalon_jtag_slave_chipselect <= internal_cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  --jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  jtag_uart_avalon_jtag_slave_firsttransfer <= A_WE_StdLogic((std_logic'(jtag_uart_avalon_jtag_slave_begins_xfer) = '1'), jtag_uart_avalon_jtag_slave_unreg_firsttransfer, jtag_uart_avalon_jtag_slave_reg_firsttransfer);
  --jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  jtag_uart_avalon_jtag_slave_unreg_firsttransfer <= NOT ((jtag_uart_avalon_jtag_slave_slavearbiterlockenable AND jtag_uart_avalon_jtag_slave_any_continuerequest));
  --jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      jtag_uart_avalon_jtag_slave_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(jtag_uart_avalon_jtag_slave_begins_xfer) = '1' then 
        jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  jtag_uart_avalon_jtag_slave_beginbursttransfer_internal <= jtag_uart_avalon_jtag_slave_begins_xfer;
  --~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  jtag_uart_avalon_jtag_slave_read_n <= NOT ((internal_cpu_data_master_granted_jtag_uart_avalon_jtag_slave AND cpu_data_master_read));
  --~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  jtag_uart_avalon_jtag_slave_write_n <= NOT ((internal_cpu_data_master_granted_jtag_uart_avalon_jtag_slave AND cpu_data_master_write));
  shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  jtag_uart_avalon_jtag_slave_address <= Vector_To_Std_Logic(A_SRL(shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010")));
  --d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_jtag_uart_avalon_jtag_slave_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end if;

  end process;

  --jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  jtag_uart_avalon_jtag_slave_waits_for_read <= jtag_uart_avalon_jtag_slave_in_a_read_cycle AND internal_jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  --jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  jtag_uart_avalon_jtag_slave_in_a_read_cycle <= internal_cpu_data_master_granted_jtag_uart_avalon_jtag_slave AND cpu_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  --jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  jtag_uart_avalon_jtag_slave_waits_for_write <= jtag_uart_avalon_jtag_slave_in_a_write_cycle AND internal_jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  --jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  jtag_uart_avalon_jtag_slave_in_a_write_cycle <= internal_cpu_data_master_granted_jtag_uart_avalon_jtag_slave AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wait_for_jtag_uart_avalon_jtag_slave_counter <= std_logic'('0');
  --assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_avalon_jtag_slave_irq_from_sa <= jtag_uart_avalon_jtag_slave_irq;
  --vhdl renameroo for output signals
  cpu_data_master_granted_jtag_uart_avalon_jtag_slave <= internal_cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave <= internal_cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  --vhdl renameroo for output signals
  cpu_data_master_requests_jtag_uart_avalon_jtag_slave <= internal_cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  --vhdl renameroo for output signals
  jtag_uart_avalon_jtag_slave_waitrequest_from_sa <= internal_jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
--synthesis translate_off
    --jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lcd_display_control_slave_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal lcd_display_control_slave_readdata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_data_master_granted_lcd_display_control_slave : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_lcd_display_control_slave : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_lcd_display_control_slave : OUT STD_LOGIC;
                 signal cpu_data_master_requests_lcd_display_control_slave : OUT STD_LOGIC;
                 signal d1_lcd_display_control_slave_end_xfer : OUT STD_LOGIC;
                 signal lcd_display_control_slave_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal lcd_display_control_slave_begintransfer : OUT STD_LOGIC;
                 signal lcd_display_control_slave_read : OUT STD_LOGIC;
                 signal lcd_display_control_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal lcd_display_control_slave_wait_counter_eq_0 : OUT STD_LOGIC;
                 signal lcd_display_control_slave_wait_counter_eq_1 : OUT STD_LOGIC;
                 signal lcd_display_control_slave_write : OUT STD_LOGIC;
                 signal lcd_display_control_slave_writedata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
              );
end entity lcd_display_control_slave_arbitrator;


architecture europa of lcd_display_control_slave_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_lcd_display_control_slave :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_lcd_display_control_slave :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_lcd_display_control_slave :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_lcd_display_control_slave :  STD_LOGIC;
                signal internal_cpu_data_master_requests_lcd_display_control_slave :  STD_LOGIC;
                signal internal_lcd_display_control_slave_wait_counter_eq_0 :  STD_LOGIC;
                signal lcd_display_control_slave_allgrants :  STD_LOGIC;
                signal lcd_display_control_slave_allow_new_arb_cycle :  STD_LOGIC;
                signal lcd_display_control_slave_any_bursting_master_saved_grant :  STD_LOGIC;
                signal lcd_display_control_slave_any_continuerequest :  STD_LOGIC;
                signal lcd_display_control_slave_arb_counter_enable :  STD_LOGIC;
                signal lcd_display_control_slave_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal lcd_display_control_slave_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal lcd_display_control_slave_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal lcd_display_control_slave_beginbursttransfer_internal :  STD_LOGIC;
                signal lcd_display_control_slave_begins_xfer :  STD_LOGIC;
                signal lcd_display_control_slave_counter_load_value :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal lcd_display_control_slave_end_xfer :  STD_LOGIC;
                signal lcd_display_control_slave_firsttransfer :  STD_LOGIC;
                signal lcd_display_control_slave_grant_vector :  STD_LOGIC;
                signal lcd_display_control_slave_in_a_read_cycle :  STD_LOGIC;
                signal lcd_display_control_slave_in_a_write_cycle :  STD_LOGIC;
                signal lcd_display_control_slave_master_qreq_vector :  STD_LOGIC;
                signal lcd_display_control_slave_non_bursting_master_requests :  STD_LOGIC;
                signal lcd_display_control_slave_pretend_byte_enable :  STD_LOGIC;
                signal lcd_display_control_slave_reg_firsttransfer :  STD_LOGIC;
                signal lcd_display_control_slave_slavearbiterlockenable :  STD_LOGIC;
                signal lcd_display_control_slave_slavearbiterlockenable2 :  STD_LOGIC;
                signal lcd_display_control_slave_unreg_firsttransfer :  STD_LOGIC;
                signal lcd_display_control_slave_wait_counter :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal lcd_display_control_slave_waits_for_read :  STD_LOGIC;
                signal lcd_display_control_slave_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_lcd_display_control_slave_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal wait_for_lcd_display_control_slave_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT lcd_display_control_slave_end_xfer;
    end if;

  end process;

  lcd_display_control_slave_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_data_master_qualified_request_lcd_display_control_slave);
  --assign lcd_display_control_slave_readdata_from_sa = lcd_display_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  lcd_display_control_slave_readdata_from_sa <= lcd_display_control_slave_readdata;
  internal_cpu_data_master_requests_lcd_display_control_slave <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("10000100100000100010000000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --lcd_display_control_slave_arb_share_counter set values, which is an e_mux
  lcd_display_control_slave_arb_share_set_values <= std_logic_vector'("001");
  --lcd_display_control_slave_non_bursting_master_requests mux, which is an e_mux
  lcd_display_control_slave_non_bursting_master_requests <= internal_cpu_data_master_requests_lcd_display_control_slave;
  --lcd_display_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  lcd_display_control_slave_any_bursting_master_saved_grant <= std_logic'('0');
  --lcd_display_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  lcd_display_control_slave_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(lcd_display_control_slave_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (lcd_display_control_slave_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(lcd_display_control_slave_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (lcd_display_control_slave_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --lcd_display_control_slave_allgrants all slave grants, which is an e_mux
  lcd_display_control_slave_allgrants <= lcd_display_control_slave_grant_vector;
  --lcd_display_control_slave_end_xfer assignment, which is an e_assign
  lcd_display_control_slave_end_xfer <= NOT ((lcd_display_control_slave_waits_for_read OR lcd_display_control_slave_waits_for_write));
  --end_xfer_arb_share_counter_term_lcd_display_control_slave arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_lcd_display_control_slave <= lcd_display_control_slave_end_xfer AND (((NOT lcd_display_control_slave_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --lcd_display_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  lcd_display_control_slave_arb_counter_enable <= ((end_xfer_arb_share_counter_term_lcd_display_control_slave AND lcd_display_control_slave_allgrants)) OR ((end_xfer_arb_share_counter_term_lcd_display_control_slave AND NOT lcd_display_control_slave_non_bursting_master_requests));
  --lcd_display_control_slave_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      lcd_display_control_slave_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(lcd_display_control_slave_arb_counter_enable) = '1' then 
        lcd_display_control_slave_arb_share_counter <= lcd_display_control_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --lcd_display_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      lcd_display_control_slave_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((lcd_display_control_slave_master_qreq_vector AND end_xfer_arb_share_counter_term_lcd_display_control_slave)) OR ((end_xfer_arb_share_counter_term_lcd_display_control_slave AND NOT lcd_display_control_slave_non_bursting_master_requests)))) = '1' then 
        lcd_display_control_slave_slavearbiterlockenable <= or_reduce(lcd_display_control_slave_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master lcd_display/control_slave arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= lcd_display_control_slave_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --lcd_display_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  lcd_display_control_slave_slavearbiterlockenable2 <= or_reduce(lcd_display_control_slave_arb_share_counter_next_value);
  --cpu/data_master lcd_display/control_slave arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= lcd_display_control_slave_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --lcd_display_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  lcd_display_control_slave_any_continuerequest <= std_logic'('1');
  --cpu_data_master_continuerequest continued request, which is an e_assign
  cpu_data_master_continuerequest <= std_logic'('1');
  internal_cpu_data_master_qualified_request_lcd_display_control_slave <= internal_cpu_data_master_requests_lcd_display_control_slave;
  --lcd_display_control_slave_writedata mux, which is an e_mux
  lcd_display_control_slave_writedata <= cpu_data_master_writedata (7 DOWNTO 0);
  --master is always granted when requested
  internal_cpu_data_master_granted_lcd_display_control_slave <= internal_cpu_data_master_qualified_request_lcd_display_control_slave;
  --cpu/data_master saved-grant lcd_display/control_slave, which is an e_assign
  cpu_data_master_saved_grant_lcd_display_control_slave <= internal_cpu_data_master_requests_lcd_display_control_slave;
  --allow new arb cycle for lcd_display/control_slave, which is an e_assign
  lcd_display_control_slave_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  lcd_display_control_slave_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  lcd_display_control_slave_master_qreq_vector <= std_logic'('1');
  lcd_display_control_slave_begintransfer <= lcd_display_control_slave_begins_xfer;
  --lcd_display_control_slave_firsttransfer first transaction, which is an e_assign
  lcd_display_control_slave_firsttransfer <= A_WE_StdLogic((std_logic'(lcd_display_control_slave_begins_xfer) = '1'), lcd_display_control_slave_unreg_firsttransfer, lcd_display_control_slave_reg_firsttransfer);
  --lcd_display_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  lcd_display_control_slave_unreg_firsttransfer <= NOT ((lcd_display_control_slave_slavearbiterlockenable AND lcd_display_control_slave_any_continuerequest));
  --lcd_display_control_slave_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      lcd_display_control_slave_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(lcd_display_control_slave_begins_xfer) = '1' then 
        lcd_display_control_slave_reg_firsttransfer <= lcd_display_control_slave_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --lcd_display_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  lcd_display_control_slave_beginbursttransfer_internal <= lcd_display_control_slave_begins_xfer;
  --lcd_display_control_slave_read assignment, which is an e_mux
  lcd_display_control_slave_read <= (((internal_cpu_data_master_granted_lcd_display_control_slave AND cpu_data_master_read)) AND NOT lcd_display_control_slave_begins_xfer) AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (lcd_display_control_slave_wait_counter))<std_logic_vector'("00000000000000000000000000001101"))));
  --lcd_display_control_slave_write assignment, which is an e_mux
  lcd_display_control_slave_write <= (((((internal_cpu_data_master_granted_lcd_display_control_slave AND cpu_data_master_write)) AND NOT lcd_display_control_slave_begins_xfer) AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (lcd_display_control_slave_wait_counter))>=std_logic_vector'("00000000000000000000000000001101"))))) AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (lcd_display_control_slave_wait_counter))<std_logic_vector'("00000000000000000000000000011010"))))) AND lcd_display_control_slave_pretend_byte_enable;
  shifted_address_to_lcd_display_control_slave_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --lcd_display_control_slave_address mux, which is an e_mux
  lcd_display_control_slave_address <= A_EXT (A_SRL(shifted_address_to_lcd_display_control_slave_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_lcd_display_control_slave_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_lcd_display_control_slave_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_lcd_display_control_slave_end_xfer <= lcd_display_control_slave_end_xfer;
    end if;

  end process;

  --lcd_display_control_slave_wait_counter_eq_1 assignment, which is an e_assign
  lcd_display_control_slave_wait_counter_eq_1 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (lcd_display_control_slave_wait_counter)) = std_logic_vector'("00000000000000000000000000000001")));
  --lcd_display_control_slave_waits_for_read in a cycle, which is an e_mux
  lcd_display_control_slave_waits_for_read <= lcd_display_control_slave_in_a_read_cycle AND wait_for_lcd_display_control_slave_counter;
  --lcd_display_control_slave_in_a_read_cycle assignment, which is an e_assign
  lcd_display_control_slave_in_a_read_cycle <= internal_cpu_data_master_granted_lcd_display_control_slave AND cpu_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= lcd_display_control_slave_in_a_read_cycle;
  --lcd_display_control_slave_waits_for_write in a cycle, which is an e_mux
  lcd_display_control_slave_waits_for_write <= lcd_display_control_slave_in_a_write_cycle AND wait_for_lcd_display_control_slave_counter;
  --lcd_display_control_slave_in_a_write_cycle assignment, which is an e_assign
  lcd_display_control_slave_in_a_write_cycle <= internal_cpu_data_master_granted_lcd_display_control_slave AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= lcd_display_control_slave_in_a_write_cycle;
  internal_lcd_display_control_slave_wait_counter_eq_0 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (lcd_display_control_slave_wait_counter)) = std_logic_vector'("00000000000000000000000000000000")));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      lcd_display_control_slave_wait_counter <= std_logic_vector'("000000");
    elsif clk'event and clk = '1' then
      lcd_display_control_slave_wait_counter <= lcd_display_control_slave_counter_load_value;
    end if;

  end process;

  lcd_display_control_slave_counter_load_value <= A_EXT (A_WE_StdLogicVector((std_logic'(((lcd_display_control_slave_in_a_write_cycle AND lcd_display_control_slave_begins_xfer))) = '1'), std_logic_vector'("000000000000000000000000000100101"), A_WE_StdLogicVector((std_logic'(((lcd_display_control_slave_in_a_read_cycle AND lcd_display_control_slave_begins_xfer))) = '1'), std_logic_vector'("000000000000000000000000000011000"), A_WE_StdLogicVector((std_logic'((NOT internal_lcd_display_control_slave_wait_counter_eq_0)) = '1'), ((std_logic_vector'("000000000000000000000000000") & (lcd_display_control_slave_wait_counter)) - std_logic_vector'("000000000000000000000000000000001")), std_logic_vector'("000000000000000000000000000000000")))), 6);
  wait_for_lcd_display_control_slave_counter <= lcd_display_control_slave_begins_xfer OR NOT internal_lcd_display_control_slave_wait_counter_eq_0;
  --lcd_display_control_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  lcd_display_control_slave_pretend_byte_enable <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_lcd_display_control_slave)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))));
  --vhdl renameroo for output signals
  cpu_data_master_granted_lcd_display_control_slave <= internal_cpu_data_master_granted_lcd_display_control_slave;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_lcd_display_control_slave <= internal_cpu_data_master_qualified_request_lcd_display_control_slave;
  --vhdl renameroo for output signals
  cpu_data_master_requests_lcd_display_control_slave <= internal_cpu_data_master_requests_lcd_display_control_slave;
  --vhdl renameroo for output signals
  lcd_display_control_slave_wait_counter_eq_0 <= internal_lcd_display_control_slave_wait_counter_eq_0;
--synthesis translate_off
    --lcd_display/control_slave enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity led_pio_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal led_pio_s1_readdata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_data_master_granted_led_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_led_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_led_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_requests_led_pio_s1 : OUT STD_LOGIC;
                 signal d1_led_pio_s1_end_xfer : OUT STD_LOGIC;
                 signal led_pio_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal led_pio_s1_chipselect : OUT STD_LOGIC;
                 signal led_pio_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal led_pio_s1_reset_n : OUT STD_LOGIC;
                 signal led_pio_s1_write_n : OUT STD_LOGIC;
                 signal led_pio_s1_writedata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
              );
end entity led_pio_s1_arbitrator;


architecture europa of led_pio_s1_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_led_pio_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_led_pio_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_led_pio_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_led_pio_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_requests_led_pio_s1 :  STD_LOGIC;
                signal led_pio_s1_allgrants :  STD_LOGIC;
                signal led_pio_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal led_pio_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal led_pio_s1_any_continuerequest :  STD_LOGIC;
                signal led_pio_s1_arb_counter_enable :  STD_LOGIC;
                signal led_pio_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal led_pio_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal led_pio_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal led_pio_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal led_pio_s1_begins_xfer :  STD_LOGIC;
                signal led_pio_s1_end_xfer :  STD_LOGIC;
                signal led_pio_s1_firsttransfer :  STD_LOGIC;
                signal led_pio_s1_grant_vector :  STD_LOGIC;
                signal led_pio_s1_in_a_read_cycle :  STD_LOGIC;
                signal led_pio_s1_in_a_write_cycle :  STD_LOGIC;
                signal led_pio_s1_master_qreq_vector :  STD_LOGIC;
                signal led_pio_s1_non_bursting_master_requests :  STD_LOGIC;
                signal led_pio_s1_pretend_byte_enable :  STD_LOGIC;
                signal led_pio_s1_reg_firsttransfer :  STD_LOGIC;
                signal led_pio_s1_slavearbiterlockenable :  STD_LOGIC;
                signal led_pio_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal led_pio_s1_unreg_firsttransfer :  STD_LOGIC;
                signal led_pio_s1_waits_for_read :  STD_LOGIC;
                signal led_pio_s1_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_led_pio_s1_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal wait_for_led_pio_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT led_pio_s1_end_xfer;
    end if;

  end process;

  led_pio_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_data_master_qualified_request_led_pio_s1);
  --assign led_pio_s1_readdata_from_sa = led_pio_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  led_pio_s1_readdata_from_sa <= led_pio_s1_readdata;
  internal_cpu_data_master_requests_led_pio_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("10000100100000100001110000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --led_pio_s1_arb_share_counter set values, which is an e_mux
  led_pio_s1_arb_share_set_values <= std_logic_vector'("001");
  --led_pio_s1_non_bursting_master_requests mux, which is an e_mux
  led_pio_s1_non_bursting_master_requests <= internal_cpu_data_master_requests_led_pio_s1;
  --led_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  led_pio_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --led_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  led_pio_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(led_pio_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (led_pio_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(led_pio_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (led_pio_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --led_pio_s1_allgrants all slave grants, which is an e_mux
  led_pio_s1_allgrants <= led_pio_s1_grant_vector;
  --led_pio_s1_end_xfer assignment, which is an e_assign
  led_pio_s1_end_xfer <= NOT ((led_pio_s1_waits_for_read OR led_pio_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_led_pio_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_led_pio_s1 <= led_pio_s1_end_xfer AND (((NOT led_pio_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --led_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  led_pio_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_led_pio_s1 AND led_pio_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_led_pio_s1 AND NOT led_pio_s1_non_bursting_master_requests));
  --led_pio_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      led_pio_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(led_pio_s1_arb_counter_enable) = '1' then 
        led_pio_s1_arb_share_counter <= led_pio_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --led_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      led_pio_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((led_pio_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_led_pio_s1)) OR ((end_xfer_arb_share_counter_term_led_pio_s1 AND NOT led_pio_s1_non_bursting_master_requests)))) = '1' then 
        led_pio_s1_slavearbiterlockenable <= or_reduce(led_pio_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master led_pio/s1 arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= led_pio_s1_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --led_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  led_pio_s1_slavearbiterlockenable2 <= or_reduce(led_pio_s1_arb_share_counter_next_value);
  --cpu/data_master led_pio/s1 arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= led_pio_s1_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --led_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  led_pio_s1_any_continuerequest <= std_logic'('1');
  --cpu_data_master_continuerequest continued request, which is an e_assign
  cpu_data_master_continuerequest <= std_logic'('1');
  internal_cpu_data_master_qualified_request_led_pio_s1 <= internal_cpu_data_master_requests_led_pio_s1 AND NOT (((NOT cpu_data_master_waitrequest) AND cpu_data_master_write));
  --led_pio_s1_writedata mux, which is an e_mux
  led_pio_s1_writedata <= cpu_data_master_writedata (7 DOWNTO 0);
  --master is always granted when requested
  internal_cpu_data_master_granted_led_pio_s1 <= internal_cpu_data_master_qualified_request_led_pio_s1;
  --cpu/data_master saved-grant led_pio/s1, which is an e_assign
  cpu_data_master_saved_grant_led_pio_s1 <= internal_cpu_data_master_requests_led_pio_s1;
  --allow new arb cycle for led_pio/s1, which is an e_assign
  led_pio_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  led_pio_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  led_pio_s1_master_qreq_vector <= std_logic'('1');
  --led_pio_s1_reset_n assignment, which is an e_assign
  led_pio_s1_reset_n <= reset_n;
  led_pio_s1_chipselect <= internal_cpu_data_master_granted_led_pio_s1;
  --led_pio_s1_firsttransfer first transaction, which is an e_assign
  led_pio_s1_firsttransfer <= A_WE_StdLogic((std_logic'(led_pio_s1_begins_xfer) = '1'), led_pio_s1_unreg_firsttransfer, led_pio_s1_reg_firsttransfer);
  --led_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  led_pio_s1_unreg_firsttransfer <= NOT ((led_pio_s1_slavearbiterlockenable AND led_pio_s1_any_continuerequest));
  --led_pio_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      led_pio_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(led_pio_s1_begins_xfer) = '1' then 
        led_pio_s1_reg_firsttransfer <= led_pio_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --led_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  led_pio_s1_beginbursttransfer_internal <= led_pio_s1_begins_xfer;
  --~led_pio_s1_write_n assignment, which is an e_mux
  led_pio_s1_write_n <= NOT ((((internal_cpu_data_master_granted_led_pio_s1 AND cpu_data_master_write)) AND led_pio_s1_pretend_byte_enable));
  shifted_address_to_led_pio_s1_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --led_pio_s1_address mux, which is an e_mux
  led_pio_s1_address <= A_EXT (A_SRL(shifted_address_to_led_pio_s1_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_led_pio_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_led_pio_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_led_pio_s1_end_xfer <= led_pio_s1_end_xfer;
    end if;

  end process;

  --led_pio_s1_waits_for_read in a cycle, which is an e_mux
  led_pio_s1_waits_for_read <= led_pio_s1_in_a_read_cycle AND led_pio_s1_begins_xfer;
  --led_pio_s1_in_a_read_cycle assignment, which is an e_assign
  led_pio_s1_in_a_read_cycle <= internal_cpu_data_master_granted_led_pio_s1 AND cpu_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= led_pio_s1_in_a_read_cycle;
  --led_pio_s1_waits_for_write in a cycle, which is an e_mux
  led_pio_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(led_pio_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --led_pio_s1_in_a_write_cycle assignment, which is an e_assign
  led_pio_s1_in_a_write_cycle <= internal_cpu_data_master_granted_led_pio_s1 AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= led_pio_s1_in_a_write_cycle;
  wait_for_led_pio_s1_counter <= std_logic'('0');
  --led_pio_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  led_pio_s1_pretend_byte_enable <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_led_pio_s1)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))));
  --vhdl renameroo for output signals
  cpu_data_master_granted_led_pio_s1 <= internal_cpu_data_master_granted_led_pio_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_led_pio_s1 <= internal_cpu_data_master_qualified_request_led_pio_s1;
  --vhdl renameroo for output signals
  cpu_data_master_requests_led_pio_s1 <= internal_cpu_data_master_requests_led_pio_s1;
--synthesis translate_off
    --led_pio/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity onchip_ram_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_instruction_master_latency_counter : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_instruction_master_read : IN STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_sdram_s1_shift_register : IN STD_LOGIC;
                 signal onchip_ram_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_data_master_granted_onchip_ram_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_onchip_ram_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_onchip_ram_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_requests_onchip_ram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_granted_onchip_ram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_onchip_ram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_onchip_ram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_requests_onchip_ram_s1 : OUT STD_LOGIC;
                 signal d1_onchip_ram_s1_end_xfer : OUT STD_LOGIC;
                 signal onchip_ram_s1_address : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
                 signal onchip_ram_s1_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal onchip_ram_s1_chipselect : OUT STD_LOGIC;
                 signal onchip_ram_s1_clken : OUT STD_LOGIC;
                 signal onchip_ram_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal onchip_ram_s1_write : OUT STD_LOGIC;
                 signal onchip_ram_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal registered_cpu_data_master_read_data_valid_onchip_ram_s1 : OUT STD_LOGIC
              );
end entity onchip_ram_s1_arbitrator;


architecture europa of onchip_ram_s1_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_onchip_ram_s1_shift_register :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in :  STD_LOGIC;
                signal cpu_data_master_saved_grant_onchip_ram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_arbiterlock :  STD_LOGIC;
                signal cpu_instruction_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_instruction_master_continuerequest :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in :  STD_LOGIC;
                signal cpu_instruction_master_saved_grant_onchip_ram_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_onchip_ram_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_onchip_ram_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_onchip_ram_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_requests_onchip_ram_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_granted_onchip_ram_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_qualified_request_onchip_ram_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_requests_onchip_ram_s1 :  STD_LOGIC;
                signal last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 :  STD_LOGIC;
                signal last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 :  STD_LOGIC;
                signal onchip_ram_s1_allgrants :  STD_LOGIC;
                signal onchip_ram_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal onchip_ram_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal onchip_ram_s1_any_continuerequest :  STD_LOGIC;
                signal onchip_ram_s1_arb_addend :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_ram_s1_arb_counter_enable :  STD_LOGIC;
                signal onchip_ram_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal onchip_ram_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal onchip_ram_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal onchip_ram_s1_arb_winner :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_ram_s1_arbitration_holdoff_internal :  STD_LOGIC;
                signal onchip_ram_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal onchip_ram_s1_begins_xfer :  STD_LOGIC;
                signal onchip_ram_s1_chosen_master_double_vector :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal onchip_ram_s1_chosen_master_rot_left :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_ram_s1_end_xfer :  STD_LOGIC;
                signal onchip_ram_s1_firsttransfer :  STD_LOGIC;
                signal onchip_ram_s1_grant_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_ram_s1_in_a_read_cycle :  STD_LOGIC;
                signal onchip_ram_s1_in_a_write_cycle :  STD_LOGIC;
                signal onchip_ram_s1_master_qreq_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_ram_s1_non_bursting_master_requests :  STD_LOGIC;
                signal onchip_ram_s1_reg_firsttransfer :  STD_LOGIC;
                signal onchip_ram_s1_saved_chosen_master_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_ram_s1_slavearbiterlockenable :  STD_LOGIC;
                signal onchip_ram_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal onchip_ram_s1_unreg_firsttransfer :  STD_LOGIC;
                signal onchip_ram_s1_waits_for_read :  STD_LOGIC;
                signal onchip_ram_s1_waits_for_write :  STD_LOGIC;
                signal p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register :  STD_LOGIC;
                signal p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register :  STD_LOGIC;
                signal shifted_address_to_onchip_ram_s1_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal shifted_address_to_onchip_ram_s1_from_cpu_instruction_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal wait_for_onchip_ram_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT onchip_ram_s1_end_xfer;
    end if;

  end process;

  onchip_ram_s1_begins_xfer <= NOT d1_reasons_to_wait AND ((internal_cpu_data_master_qualified_request_onchip_ram_s1 OR internal_cpu_instruction_master_qualified_request_onchip_ram_s1));
  --assign onchip_ram_s1_readdata_from_sa = onchip_ram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  onchip_ram_s1_readdata_from_sa <= onchip_ram_s1_readdata;
  internal_cpu_data_master_requests_onchip_ram_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 16) & std_logic_vector'("0000000000000000")) = std_logic_vector'("10000100000000000000000000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --registered rdv signal_name registered_cpu_data_master_read_data_valid_onchip_ram_s1 assignment, which is an e_assign
  registered_cpu_data_master_read_data_valid_onchip_ram_s1 <= cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in;
  --onchip_ram_s1_arb_share_counter set values, which is an e_mux
  onchip_ram_s1_arb_share_set_values <= std_logic_vector'("001");
  --onchip_ram_s1_non_bursting_master_requests mux, which is an e_mux
  onchip_ram_s1_non_bursting_master_requests <= ((internal_cpu_data_master_requests_onchip_ram_s1 OR internal_cpu_instruction_master_requests_onchip_ram_s1) OR internal_cpu_data_master_requests_onchip_ram_s1) OR internal_cpu_instruction_master_requests_onchip_ram_s1;
  --onchip_ram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  onchip_ram_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --onchip_ram_s1_arb_share_counter_next_value assignment, which is an e_assign
  onchip_ram_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(onchip_ram_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (onchip_ram_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(onchip_ram_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (onchip_ram_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --onchip_ram_s1_allgrants all slave grants, which is an e_mux
  onchip_ram_s1_allgrants <= (((or_reduce(onchip_ram_s1_grant_vector)) OR (or_reduce(onchip_ram_s1_grant_vector))) OR (or_reduce(onchip_ram_s1_grant_vector))) OR (or_reduce(onchip_ram_s1_grant_vector));
  --onchip_ram_s1_end_xfer assignment, which is an e_assign
  onchip_ram_s1_end_xfer <= NOT ((onchip_ram_s1_waits_for_read OR onchip_ram_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_onchip_ram_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_onchip_ram_s1 <= onchip_ram_s1_end_xfer AND (((NOT onchip_ram_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --onchip_ram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  onchip_ram_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_onchip_ram_s1 AND onchip_ram_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_onchip_ram_s1 AND NOT onchip_ram_s1_non_bursting_master_requests));
  --onchip_ram_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      onchip_ram_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(onchip_ram_s1_arb_counter_enable) = '1' then 
        onchip_ram_s1_arb_share_counter <= onchip_ram_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --onchip_ram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      onchip_ram_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((or_reduce(onchip_ram_s1_master_qreq_vector) AND end_xfer_arb_share_counter_term_onchip_ram_s1)) OR ((end_xfer_arb_share_counter_term_onchip_ram_s1 AND NOT onchip_ram_s1_non_bursting_master_requests)))) = '1' then 
        onchip_ram_s1_slavearbiterlockenable <= or_reduce(onchip_ram_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master onchip_ram/s1 arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= onchip_ram_s1_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --onchip_ram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  onchip_ram_s1_slavearbiterlockenable2 <= or_reduce(onchip_ram_s1_arb_share_counter_next_value);
  --cpu/data_master onchip_ram/s1 arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= onchip_ram_s1_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --cpu/instruction_master onchip_ram/s1 arbiterlock, which is an e_assign
  cpu_instruction_master_arbiterlock <= onchip_ram_s1_slavearbiterlockenable AND cpu_instruction_master_continuerequest;
  --cpu/instruction_master onchip_ram/s1 arbiterlock2, which is an e_assign
  cpu_instruction_master_arbiterlock2 <= onchip_ram_s1_slavearbiterlockenable2 AND cpu_instruction_master_continuerequest;
  --cpu/instruction_master granted onchip_ram/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_instruction_master_saved_grant_onchip_ram_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((onchip_ram_s1_arbitration_holdoff_internal OR NOT internal_cpu_instruction_master_requests_onchip_ram_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1))))));
    end if;

  end process;

  --cpu_instruction_master_continuerequest continued request, which is an e_mux
  cpu_instruction_master_continuerequest <= last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 AND internal_cpu_instruction_master_requests_onchip_ram_s1;
  --onchip_ram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  onchip_ram_s1_any_continuerequest <= cpu_instruction_master_continuerequest OR cpu_data_master_continuerequest;
  internal_cpu_data_master_qualified_request_onchip_ram_s1 <= internal_cpu_data_master_requests_onchip_ram_s1 AND NOT (((((cpu_data_master_read AND (cpu_data_master_read_data_valid_onchip_ram_s1_shift_register))) OR (((NOT cpu_data_master_waitrequest) AND cpu_data_master_write))) OR cpu_instruction_master_arbiterlock));
  --cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in <= ((internal_cpu_data_master_granted_onchip_ram_s1 AND cpu_data_master_read) AND NOT onchip_ram_s1_waits_for_read) AND NOT (cpu_data_master_read_data_valid_onchip_ram_s1_shift_register);
  --shift register p1 cpu_data_master_read_data_valid_onchip_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register <= Vector_To_Std_Logic(Std_Logic_Vector'(A_ToStdLogicVector(cpu_data_master_read_data_valid_onchip_ram_s1_shift_register) & A_ToStdLogicVector(cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in)));
  --cpu_data_master_read_data_valid_onchip_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_data_master_read_data_valid_onchip_ram_s1_shift_register <= std_logic'('0');
    elsif clk'event and clk = '1' then
      cpu_data_master_read_data_valid_onchip_ram_s1_shift_register <= p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
    end if;

  end process;

  --local readdatavalid cpu_data_master_read_data_valid_onchip_ram_s1, which is an e_mux
  cpu_data_master_read_data_valid_onchip_ram_s1 <= cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
  --onchip_ram_s1_writedata mux, which is an e_mux
  onchip_ram_s1_writedata <= cpu_data_master_writedata;
  --mux onchip_ram_s1_clken, which is an e_mux
  onchip_ram_s1_clken <= std_logic'('1');
  internal_cpu_instruction_master_requests_onchip_ram_s1 <= ((to_std_logic(((Std_Logic_Vector'(cpu_instruction_master_address_to_slave(25 DOWNTO 16) & std_logic_vector'("0000000000000000")) = std_logic_vector'("10000100000000000000000000")))) AND (cpu_instruction_master_read))) AND cpu_instruction_master_read;
  --cpu/data_master granted onchip_ram/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_data_master_saved_grant_onchip_ram_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((onchip_ram_s1_arbitration_holdoff_internal OR NOT internal_cpu_data_master_requests_onchip_ram_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_data_master_granted_slave_onchip_ram_s1))))));
    end if;

  end process;

  --cpu_data_master_continuerequest continued request, which is an e_mux
  cpu_data_master_continuerequest <= last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 AND internal_cpu_data_master_requests_onchip_ram_s1;
  internal_cpu_instruction_master_qualified_request_onchip_ram_s1 <= internal_cpu_instruction_master_requests_onchip_ram_s1 AND NOT ((((cpu_instruction_master_read AND ((to_std_logic(((std_logic_vector'("00000000000000000000000000000001")<(std_logic_vector'("000000000000000000000000000000") & (cpu_instruction_master_latency_counter))))) OR (cpu_instruction_master_read_data_valid_sdram_s1_shift_register))))) OR cpu_data_master_arbiterlock));
  --cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in <= (internal_cpu_instruction_master_granted_onchip_ram_s1 AND cpu_instruction_master_read) AND NOT onchip_ram_s1_waits_for_read;
  --shift register p1 cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register <= Vector_To_Std_Logic(Std_Logic_Vector'(A_ToStdLogicVector(cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register) & A_ToStdLogicVector(cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in)));
  --cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register <= std_logic'('0');
    elsif clk'event and clk = '1' then
      cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
    end if;

  end process;

  --local readdatavalid cpu_instruction_master_read_data_valid_onchip_ram_s1, which is an e_mux
  cpu_instruction_master_read_data_valid_onchip_ram_s1 <= cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
  --allow new arb cycle for onchip_ram/s1, which is an e_assign
  onchip_ram_s1_allow_new_arb_cycle <= NOT cpu_data_master_arbiterlock AND NOT cpu_instruction_master_arbiterlock;
  --cpu/instruction_master assignment into master qualified-requests vector for onchip_ram/s1, which is an e_assign
  onchip_ram_s1_master_qreq_vector(0) <= internal_cpu_instruction_master_qualified_request_onchip_ram_s1;
  --cpu/instruction_master grant onchip_ram/s1, which is an e_assign
  internal_cpu_instruction_master_granted_onchip_ram_s1 <= onchip_ram_s1_grant_vector(0);
  --cpu/instruction_master saved-grant onchip_ram/s1, which is an e_assign
  cpu_instruction_master_saved_grant_onchip_ram_s1 <= onchip_ram_s1_arb_winner(0) AND internal_cpu_instruction_master_requests_onchip_ram_s1;
  --cpu/data_master assignment into master qualified-requests vector for onchip_ram/s1, which is an e_assign
  onchip_ram_s1_master_qreq_vector(1) <= internal_cpu_data_master_qualified_request_onchip_ram_s1;
  --cpu/data_master grant onchip_ram/s1, which is an e_assign
  internal_cpu_data_master_granted_onchip_ram_s1 <= onchip_ram_s1_grant_vector(1);
  --cpu/data_master saved-grant onchip_ram/s1, which is an e_assign
  cpu_data_master_saved_grant_onchip_ram_s1 <= onchip_ram_s1_arb_winner(1) AND internal_cpu_data_master_requests_onchip_ram_s1;
  --onchip_ram/s1 chosen-master double-vector, which is an e_assign
  onchip_ram_s1_chosen_master_double_vector <= A_EXT (((std_logic_vector'("0") & ((onchip_ram_s1_master_qreq_vector & onchip_ram_s1_master_qreq_vector))) AND (((std_logic_vector'("0") & (Std_Logic_Vector'(NOT onchip_ram_s1_master_qreq_vector & NOT onchip_ram_s1_master_qreq_vector))) + (std_logic_vector'("000") & (onchip_ram_s1_arb_addend))))), 4);
  --stable onehot encoding of arb winner
  onchip_ram_s1_arb_winner <= A_WE_StdLogicVector((std_logic'(((onchip_ram_s1_allow_new_arb_cycle AND or_reduce(onchip_ram_s1_grant_vector)))) = '1'), onchip_ram_s1_grant_vector, onchip_ram_s1_saved_chosen_master_vector);
  --saved onchip_ram_s1_grant_vector, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      onchip_ram_s1_saved_chosen_master_vector <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(onchip_ram_s1_allow_new_arb_cycle) = '1' then 
        onchip_ram_s1_saved_chosen_master_vector <= A_WE_StdLogicVector((std_logic'(or_reduce(onchip_ram_s1_grant_vector)) = '1'), onchip_ram_s1_grant_vector, onchip_ram_s1_saved_chosen_master_vector);
      end if;
    end if;

  end process;

  --onehot encoding of chosen master
  onchip_ram_s1_grant_vector <= Std_Logic_Vector'(A_ToStdLogicVector(((onchip_ram_s1_chosen_master_double_vector(1) OR onchip_ram_s1_chosen_master_double_vector(3)))) & A_ToStdLogicVector(((onchip_ram_s1_chosen_master_double_vector(0) OR onchip_ram_s1_chosen_master_double_vector(2)))));
  --onchip_ram/s1 chosen master rotated left, which is an e_assign
  onchip_ram_s1_chosen_master_rot_left <= A_EXT (A_WE_StdLogicVector((((A_SLL(onchip_ram_s1_arb_winner,std_logic_vector'("00000000000000000000000000000001")))) /= std_logic_vector'("00")), (std_logic_vector'("000000000000000000000000000000") & ((A_SLL(onchip_ram_s1_arb_winner,std_logic_vector'("00000000000000000000000000000001"))))), std_logic_vector'("00000000000000000000000000000001")), 2);
  --onchip_ram/s1's addend for next-master-grant
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      onchip_ram_s1_arb_addend <= std_logic_vector'("01");
    elsif clk'event and clk = '1' then
      if std_logic'(or_reduce(onchip_ram_s1_grant_vector)) = '1' then 
        onchip_ram_s1_arb_addend <= A_WE_StdLogicVector((std_logic'(onchip_ram_s1_end_xfer) = '1'), onchip_ram_s1_chosen_master_rot_left, onchip_ram_s1_grant_vector);
      end if;
    end if;

  end process;

  onchip_ram_s1_chipselect <= internal_cpu_data_master_granted_onchip_ram_s1 OR internal_cpu_instruction_master_granted_onchip_ram_s1;
  --onchip_ram_s1_firsttransfer first transaction, which is an e_assign
  onchip_ram_s1_firsttransfer <= A_WE_StdLogic((std_logic'(onchip_ram_s1_begins_xfer) = '1'), onchip_ram_s1_unreg_firsttransfer, onchip_ram_s1_reg_firsttransfer);
  --onchip_ram_s1_unreg_firsttransfer first transaction, which is an e_assign
  onchip_ram_s1_unreg_firsttransfer <= NOT ((onchip_ram_s1_slavearbiterlockenable AND onchip_ram_s1_any_continuerequest));
  --onchip_ram_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      onchip_ram_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(onchip_ram_s1_begins_xfer) = '1' then 
        onchip_ram_s1_reg_firsttransfer <= onchip_ram_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --onchip_ram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  onchip_ram_s1_beginbursttransfer_internal <= onchip_ram_s1_begins_xfer;
  --onchip_ram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  onchip_ram_s1_arbitration_holdoff_internal <= onchip_ram_s1_begins_xfer AND onchip_ram_s1_firsttransfer;
  --onchip_ram_s1_write assignment, which is an e_mux
  onchip_ram_s1_write <= internal_cpu_data_master_granted_onchip_ram_s1 AND cpu_data_master_write;
  shifted_address_to_onchip_ram_s1_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --onchip_ram_s1_address mux, which is an e_mux
  onchip_ram_s1_address <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_onchip_ram_s1)) = '1'), (A_SRL(shifted_address_to_onchip_ram_s1_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010"))), (A_SRL(shifted_address_to_onchip_ram_s1_from_cpu_instruction_master,std_logic_vector'("00000000000000000000000000000010")))), 14);
  shifted_address_to_onchip_ram_s1_from_cpu_instruction_master <= cpu_instruction_master_address_to_slave;
  --d1_onchip_ram_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_onchip_ram_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_onchip_ram_s1_end_xfer <= onchip_ram_s1_end_xfer;
    end if;

  end process;

  --onchip_ram_s1_waits_for_read in a cycle, which is an e_mux
  onchip_ram_s1_waits_for_read <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(onchip_ram_s1_in_a_read_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --onchip_ram_s1_in_a_read_cycle assignment, which is an e_assign
  onchip_ram_s1_in_a_read_cycle <= ((internal_cpu_data_master_granted_onchip_ram_s1 AND cpu_data_master_read)) OR ((internal_cpu_instruction_master_granted_onchip_ram_s1 AND cpu_instruction_master_read));
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= onchip_ram_s1_in_a_read_cycle;
  --onchip_ram_s1_waits_for_write in a cycle, which is an e_mux
  onchip_ram_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(onchip_ram_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --onchip_ram_s1_in_a_write_cycle assignment, which is an e_assign
  onchip_ram_s1_in_a_write_cycle <= internal_cpu_data_master_granted_onchip_ram_s1 AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= onchip_ram_s1_in_a_write_cycle;
  wait_for_onchip_ram_s1_counter <= std_logic'('0');
  --onchip_ram_s1_byteenable byte enable port mux, which is an e_mux
  onchip_ram_s1_byteenable <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_onchip_ram_s1)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))), 4);
  --vhdl renameroo for output signals
  cpu_data_master_granted_onchip_ram_s1 <= internal_cpu_data_master_granted_onchip_ram_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_onchip_ram_s1 <= internal_cpu_data_master_qualified_request_onchip_ram_s1;
  --vhdl renameroo for output signals
  cpu_data_master_requests_onchip_ram_s1 <= internal_cpu_data_master_requests_onchip_ram_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_granted_onchip_ram_s1 <= internal_cpu_instruction_master_granted_onchip_ram_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_qualified_request_onchip_ram_s1 <= internal_cpu_instruction_master_qualified_request_onchip_ram_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_requests_onchip_ram_s1 <= internal_cpu_instruction_master_requests_onchip_ram_s1;
--synthesis translate_off
    --onchip_ram/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

    --grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line11 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_data_master_granted_onchip_ram_s1))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_instruction_master_granted_onchip_ram_s1))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line11, now);
          write(write_line11, string'(": "));
          write(write_line11, string'("> 1 of grant signals are active simultaneously"));
          write(output, write_line11.all);
          deallocate (write_line11);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --saved_grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line12 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_data_master_saved_grant_onchip_ram_s1))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_saved_grant_onchip_ram_s1))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line12, now);
          write(write_line12, string'(": "));
          write(write_line12, string'("> 1 of saved_grant signals are active simultaneously"));
          write(output, write_line12.all);
          deallocate (write_line12);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pll_s1_arbitrator is 
        port (
              -- inputs:
                 signal NiosII_stratix_1s10_standard_clock_0_out_address_to_slave : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_out_nativeaddress : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal NiosII_stratix_1s10_standard_clock_0_out_read : IN STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_write : IN STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal pll_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal pll_s1_resetrequest : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 : OUT STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 : OUT STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_read_data_valid_pll_s1 : OUT STD_LOGIC;
                 signal NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1 : OUT STD_LOGIC;
                 signal d1_pll_s1_end_xfer : OUT STD_LOGIC;
                 signal pll_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal pll_s1_chipselect : OUT STD_LOGIC;
                 signal pll_s1_read : OUT STD_LOGIC;
                 signal pll_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal pll_s1_reset_n : OUT STD_LOGIC;
                 signal pll_s1_resetrequest_from_sa : OUT STD_LOGIC;
                 signal pll_s1_write : OUT STD_LOGIC;
                 signal pll_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
              );
end entity pll_s1_arbitrator;


architecture europa of pll_s1_arbitrator is
                signal NiosII_stratix_1s10_standard_clock_0_out_arbiterlock :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_arbiterlock2 :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_continuerequest :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_saved_grant_pll_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_pll_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 :  STD_LOGIC;
                signal internal_NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 :  STD_LOGIC;
                signal internal_NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1 :  STD_LOGIC;
                signal pll_s1_allgrants :  STD_LOGIC;
                signal pll_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal pll_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal pll_s1_any_continuerequest :  STD_LOGIC;
                signal pll_s1_arb_counter_enable :  STD_LOGIC;
                signal pll_s1_arb_share_counter :  STD_LOGIC;
                signal pll_s1_arb_share_counter_next_value :  STD_LOGIC;
                signal pll_s1_arb_share_set_values :  STD_LOGIC;
                signal pll_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal pll_s1_begins_xfer :  STD_LOGIC;
                signal pll_s1_end_xfer :  STD_LOGIC;
                signal pll_s1_firsttransfer :  STD_LOGIC;
                signal pll_s1_grant_vector :  STD_LOGIC;
                signal pll_s1_in_a_read_cycle :  STD_LOGIC;
                signal pll_s1_in_a_write_cycle :  STD_LOGIC;
                signal pll_s1_master_qreq_vector :  STD_LOGIC;
                signal pll_s1_non_bursting_master_requests :  STD_LOGIC;
                signal pll_s1_reg_firsttransfer :  STD_LOGIC;
                signal pll_s1_slavearbiterlockenable :  STD_LOGIC;
                signal pll_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal pll_s1_unreg_firsttransfer :  STD_LOGIC;
                signal pll_s1_waits_for_read :  STD_LOGIC;
                signal pll_s1_waits_for_write :  STD_LOGIC;
                signal wait_for_pll_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT pll_s1_end_xfer;
    end if;

  end process;

  pll_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1);
  --assign pll_s1_readdata_from_sa = pll_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  pll_s1_readdata_from_sa <= pll_s1_readdata;
  internal_NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1 <= Vector_To_Std_Logic(((std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((NiosII_stratix_1s10_standard_clock_0_out_read OR NiosII_stratix_1s10_standard_clock_0_out_write)))))));
  --pll_s1_arb_share_counter set values, which is an e_mux
  pll_s1_arb_share_set_values <= std_logic'('1');
  --pll_s1_non_bursting_master_requests mux, which is an e_mux
  pll_s1_non_bursting_master_requests <= internal_NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1;
  --pll_s1_any_bursting_master_saved_grant mux, which is an e_mux
  pll_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --pll_s1_arb_share_counter_next_value assignment, which is an e_assign
  pll_s1_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(pll_s1_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(pll_s1_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(pll_s1_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(pll_s1_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --pll_s1_allgrants all slave grants, which is an e_mux
  pll_s1_allgrants <= pll_s1_grant_vector;
  --pll_s1_end_xfer assignment, which is an e_assign
  pll_s1_end_xfer <= NOT ((pll_s1_waits_for_read OR pll_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_pll_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_pll_s1 <= pll_s1_end_xfer AND (((NOT pll_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --pll_s1_arb_share_counter arbitration counter enable, which is an e_assign
  pll_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_pll_s1 AND pll_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_pll_s1 AND NOT pll_s1_non_bursting_master_requests));
  --pll_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pll_s1_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(pll_s1_arb_counter_enable) = '1' then 
        pll_s1_arb_share_counter <= pll_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --pll_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pll_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((pll_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_pll_s1)) OR ((end_xfer_arb_share_counter_term_pll_s1 AND NOT pll_s1_non_bursting_master_requests)))) = '1' then 
        pll_s1_slavearbiterlockenable <= pll_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --NiosII_stratix_1s10_standard_clock_0/out pll/s1 arbiterlock, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_out_arbiterlock <= pll_s1_slavearbiterlockenable AND NiosII_stratix_1s10_standard_clock_0_out_continuerequest;
  --pll_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  pll_s1_slavearbiterlockenable2 <= pll_s1_arb_share_counter_next_value;
  --NiosII_stratix_1s10_standard_clock_0/out pll/s1 arbiterlock2, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_out_arbiterlock2 <= pll_s1_slavearbiterlockenable2 AND NiosII_stratix_1s10_standard_clock_0_out_continuerequest;
  --pll_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  pll_s1_any_continuerequest <= std_logic'('1');
  --NiosII_stratix_1s10_standard_clock_0_out_continuerequest continued request, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_out_continuerequest <= std_logic'('1');
  internal_NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 <= internal_NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1;
  --pll_s1_writedata mux, which is an e_mux
  pll_s1_writedata <= NiosII_stratix_1s10_standard_clock_0_out_writedata;
  --master is always granted when requested
  internal_NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 <= internal_NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1;
  --NiosII_stratix_1s10_standard_clock_0/out saved-grant pll/s1, which is an e_assign
  NiosII_stratix_1s10_standard_clock_0_out_saved_grant_pll_s1 <= internal_NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1;
  --allow new arb cycle for pll/s1, which is an e_assign
  pll_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  pll_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  pll_s1_master_qreq_vector <= std_logic'('1');
  --pll_s1_reset_n assignment, which is an e_assign
  pll_s1_reset_n <= reset_n;
  --assign pll_s1_resetrequest_from_sa = pll_s1_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  pll_s1_resetrequest_from_sa <= pll_s1_resetrequest;
  pll_s1_chipselect <= internal_NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1;
  --pll_s1_firsttransfer first transaction, which is an e_assign
  pll_s1_firsttransfer <= A_WE_StdLogic((std_logic'(pll_s1_begins_xfer) = '1'), pll_s1_unreg_firsttransfer, pll_s1_reg_firsttransfer);
  --pll_s1_unreg_firsttransfer first transaction, which is an e_assign
  pll_s1_unreg_firsttransfer <= NOT ((pll_s1_slavearbiterlockenable AND pll_s1_any_continuerequest));
  --pll_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pll_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(pll_s1_begins_xfer) = '1' then 
        pll_s1_reg_firsttransfer <= pll_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --pll_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  pll_s1_beginbursttransfer_internal <= pll_s1_begins_xfer;
  --pll_s1_read assignment, which is an e_mux
  pll_s1_read <= internal_NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 AND NiosII_stratix_1s10_standard_clock_0_out_read;
  --pll_s1_write assignment, which is an e_mux
  pll_s1_write <= internal_NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 AND NiosII_stratix_1s10_standard_clock_0_out_write;
  --pll_s1_address mux, which is an e_mux
  pll_s1_address <= NiosII_stratix_1s10_standard_clock_0_out_nativeaddress;
  --d1_pll_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_pll_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_pll_s1_end_xfer <= pll_s1_end_xfer;
    end if;

  end process;

  --pll_s1_waits_for_read in a cycle, which is an e_mux
  pll_s1_waits_for_read <= pll_s1_in_a_read_cycle AND pll_s1_begins_xfer;
  --pll_s1_in_a_read_cycle assignment, which is an e_assign
  pll_s1_in_a_read_cycle <= internal_NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 AND NiosII_stratix_1s10_standard_clock_0_out_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= pll_s1_in_a_read_cycle;
  --pll_s1_waits_for_write in a cycle, which is an e_mux
  pll_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(pll_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --pll_s1_in_a_write_cycle assignment, which is an e_assign
  pll_s1_in_a_write_cycle <= internal_NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 AND NiosII_stratix_1s10_standard_clock_0_out_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= pll_s1_in_a_write_cycle;
  wait_for_pll_s1_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 <= internal_NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1;
  --vhdl renameroo for output signals
  NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 <= internal_NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1;
  --vhdl renameroo for output signals
  NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1 <= internal_NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1;
--synthesis translate_off
    --pll/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity reconfig_request_pio_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reconfig_request_pio_s1_readdata : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_data_master_granted_reconfig_request_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_reconfig_request_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_reconfig_request_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_requests_reconfig_request_pio_s1 : OUT STD_LOGIC;
                 signal d1_reconfig_request_pio_s1_end_xfer : OUT STD_LOGIC;
                 signal reconfig_request_pio_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal reconfig_request_pio_s1_chipselect : OUT STD_LOGIC;
                 signal reconfig_request_pio_s1_readdata_from_sa : OUT STD_LOGIC;
                 signal reconfig_request_pio_s1_reset_n : OUT STD_LOGIC;
                 signal reconfig_request_pio_s1_write_n : OUT STD_LOGIC;
                 signal reconfig_request_pio_s1_writedata : OUT STD_LOGIC
              );
end entity reconfig_request_pio_s1_arbitrator;


architecture europa of reconfig_request_pio_s1_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_reconfig_request_pio_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_reconfig_request_pio_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_reconfig_request_pio_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_reconfig_request_pio_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_requests_reconfig_request_pio_s1 :  STD_LOGIC;
                signal reconfig_request_pio_s1_allgrants :  STD_LOGIC;
                signal reconfig_request_pio_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal reconfig_request_pio_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal reconfig_request_pio_s1_any_continuerequest :  STD_LOGIC;
                signal reconfig_request_pio_s1_arb_counter_enable :  STD_LOGIC;
                signal reconfig_request_pio_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal reconfig_request_pio_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal reconfig_request_pio_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal reconfig_request_pio_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal reconfig_request_pio_s1_begins_xfer :  STD_LOGIC;
                signal reconfig_request_pio_s1_end_xfer :  STD_LOGIC;
                signal reconfig_request_pio_s1_firsttransfer :  STD_LOGIC;
                signal reconfig_request_pio_s1_grant_vector :  STD_LOGIC;
                signal reconfig_request_pio_s1_in_a_read_cycle :  STD_LOGIC;
                signal reconfig_request_pio_s1_in_a_write_cycle :  STD_LOGIC;
                signal reconfig_request_pio_s1_master_qreq_vector :  STD_LOGIC;
                signal reconfig_request_pio_s1_non_bursting_master_requests :  STD_LOGIC;
                signal reconfig_request_pio_s1_reg_firsttransfer :  STD_LOGIC;
                signal reconfig_request_pio_s1_slavearbiterlockenable :  STD_LOGIC;
                signal reconfig_request_pio_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal reconfig_request_pio_s1_unreg_firsttransfer :  STD_LOGIC;
                signal reconfig_request_pio_s1_waits_for_read :  STD_LOGIC;
                signal reconfig_request_pio_s1_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_reconfig_request_pio_s1_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal wait_for_reconfig_request_pio_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT reconfig_request_pio_s1_end_xfer;
    end if;

  end process;

  reconfig_request_pio_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_data_master_qualified_request_reconfig_request_pio_s1);
  --assign reconfig_request_pio_s1_readdata_from_sa = reconfig_request_pio_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  reconfig_request_pio_s1_readdata_from_sa <= reconfig_request_pio_s1_readdata;
  internal_cpu_data_master_requests_reconfig_request_pio_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("10000100100000100010100000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --reconfig_request_pio_s1_arb_share_counter set values, which is an e_mux
  reconfig_request_pio_s1_arb_share_set_values <= std_logic_vector'("001");
  --reconfig_request_pio_s1_non_bursting_master_requests mux, which is an e_mux
  reconfig_request_pio_s1_non_bursting_master_requests <= internal_cpu_data_master_requests_reconfig_request_pio_s1;
  --reconfig_request_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  reconfig_request_pio_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --reconfig_request_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  reconfig_request_pio_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(reconfig_request_pio_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (reconfig_request_pio_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(reconfig_request_pio_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (reconfig_request_pio_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --reconfig_request_pio_s1_allgrants all slave grants, which is an e_mux
  reconfig_request_pio_s1_allgrants <= reconfig_request_pio_s1_grant_vector;
  --reconfig_request_pio_s1_end_xfer assignment, which is an e_assign
  reconfig_request_pio_s1_end_xfer <= NOT ((reconfig_request_pio_s1_waits_for_read OR reconfig_request_pio_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_reconfig_request_pio_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_reconfig_request_pio_s1 <= reconfig_request_pio_s1_end_xfer AND (((NOT reconfig_request_pio_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --reconfig_request_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  reconfig_request_pio_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_reconfig_request_pio_s1 AND reconfig_request_pio_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_reconfig_request_pio_s1 AND NOT reconfig_request_pio_s1_non_bursting_master_requests));
  --reconfig_request_pio_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      reconfig_request_pio_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(reconfig_request_pio_s1_arb_counter_enable) = '1' then 
        reconfig_request_pio_s1_arb_share_counter <= reconfig_request_pio_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --reconfig_request_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      reconfig_request_pio_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((reconfig_request_pio_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_reconfig_request_pio_s1)) OR ((end_xfer_arb_share_counter_term_reconfig_request_pio_s1 AND NOT reconfig_request_pio_s1_non_bursting_master_requests)))) = '1' then 
        reconfig_request_pio_s1_slavearbiterlockenable <= or_reduce(reconfig_request_pio_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master reconfig_request_pio/s1 arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= reconfig_request_pio_s1_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --reconfig_request_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  reconfig_request_pio_s1_slavearbiterlockenable2 <= or_reduce(reconfig_request_pio_s1_arb_share_counter_next_value);
  --cpu/data_master reconfig_request_pio/s1 arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= reconfig_request_pio_s1_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --reconfig_request_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  reconfig_request_pio_s1_any_continuerequest <= std_logic'('1');
  --cpu_data_master_continuerequest continued request, which is an e_assign
  cpu_data_master_continuerequest <= std_logic'('1');
  internal_cpu_data_master_qualified_request_reconfig_request_pio_s1 <= internal_cpu_data_master_requests_reconfig_request_pio_s1 AND NOT (((NOT cpu_data_master_waitrequest) AND cpu_data_master_write));
  --reconfig_request_pio_s1_writedata mux, which is an e_mux
  reconfig_request_pio_s1_writedata <= cpu_data_master_writedata(0);
  --master is always granted when requested
  internal_cpu_data_master_granted_reconfig_request_pio_s1 <= internal_cpu_data_master_qualified_request_reconfig_request_pio_s1;
  --cpu/data_master saved-grant reconfig_request_pio/s1, which is an e_assign
  cpu_data_master_saved_grant_reconfig_request_pio_s1 <= internal_cpu_data_master_requests_reconfig_request_pio_s1;
  --allow new arb cycle for reconfig_request_pio/s1, which is an e_assign
  reconfig_request_pio_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  reconfig_request_pio_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  reconfig_request_pio_s1_master_qreq_vector <= std_logic'('1');
  --reconfig_request_pio_s1_reset_n assignment, which is an e_assign
  reconfig_request_pio_s1_reset_n <= reset_n;
  reconfig_request_pio_s1_chipselect <= internal_cpu_data_master_granted_reconfig_request_pio_s1;
  --reconfig_request_pio_s1_firsttransfer first transaction, which is an e_assign
  reconfig_request_pio_s1_firsttransfer <= A_WE_StdLogic((std_logic'(reconfig_request_pio_s1_begins_xfer) = '1'), reconfig_request_pio_s1_unreg_firsttransfer, reconfig_request_pio_s1_reg_firsttransfer);
  --reconfig_request_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  reconfig_request_pio_s1_unreg_firsttransfer <= NOT ((reconfig_request_pio_s1_slavearbiterlockenable AND reconfig_request_pio_s1_any_continuerequest));
  --reconfig_request_pio_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      reconfig_request_pio_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(reconfig_request_pio_s1_begins_xfer) = '1' then 
        reconfig_request_pio_s1_reg_firsttransfer <= reconfig_request_pio_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --reconfig_request_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  reconfig_request_pio_s1_beginbursttransfer_internal <= reconfig_request_pio_s1_begins_xfer;
  --~reconfig_request_pio_s1_write_n assignment, which is an e_mux
  reconfig_request_pio_s1_write_n <= NOT ((internal_cpu_data_master_granted_reconfig_request_pio_s1 AND cpu_data_master_write));
  shifted_address_to_reconfig_request_pio_s1_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --reconfig_request_pio_s1_address mux, which is an e_mux
  reconfig_request_pio_s1_address <= A_EXT (A_SRL(shifted_address_to_reconfig_request_pio_s1_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_reconfig_request_pio_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reconfig_request_pio_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_reconfig_request_pio_s1_end_xfer <= reconfig_request_pio_s1_end_xfer;
    end if;

  end process;

  --reconfig_request_pio_s1_waits_for_read in a cycle, which is an e_mux
  reconfig_request_pio_s1_waits_for_read <= reconfig_request_pio_s1_in_a_read_cycle AND reconfig_request_pio_s1_begins_xfer;
  --reconfig_request_pio_s1_in_a_read_cycle assignment, which is an e_assign
  reconfig_request_pio_s1_in_a_read_cycle <= internal_cpu_data_master_granted_reconfig_request_pio_s1 AND cpu_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= reconfig_request_pio_s1_in_a_read_cycle;
  --reconfig_request_pio_s1_waits_for_write in a cycle, which is an e_mux
  reconfig_request_pio_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(reconfig_request_pio_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --reconfig_request_pio_s1_in_a_write_cycle assignment, which is an e_assign
  reconfig_request_pio_s1_in_a_write_cycle <= internal_cpu_data_master_granted_reconfig_request_pio_s1 AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= reconfig_request_pio_s1_in_a_write_cycle;
  wait_for_reconfig_request_pio_s1_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_data_master_granted_reconfig_request_pio_s1 <= internal_cpu_data_master_granted_reconfig_request_pio_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_reconfig_request_pio_s1 <= internal_cpu_data_master_qualified_request_reconfig_request_pio_s1;
  --vhdl renameroo for output signals
  cpu_data_master_requests_reconfig_request_pio_s1 <= internal_cpu_data_master_requests_reconfig_request_pio_s1;
--synthesis translate_off
    --reconfig_request_pio/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rdv_fifo_for_cpu_data_master_to_sdram_s1_module is 
        port (
              -- inputs:
                 signal clear_fifo : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal data_in : IN STD_LOGIC;
                 signal read : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sync_reset : IN STD_LOGIC;
                 signal write : IN STD_LOGIC;

              -- outputs:
                 signal data_out : OUT STD_LOGIC;
                 signal empty : OUT STD_LOGIC;
                 signal fifo_contains_ones_n : OUT STD_LOGIC;
                 signal full : OUT STD_LOGIC
              );
end entity rdv_fifo_for_cpu_data_master_to_sdram_s1_module;


architecture europa of rdv_fifo_for_cpu_data_master_to_sdram_s1_module is
                signal full_0 :  STD_LOGIC;
                signal full_1 :  STD_LOGIC;
                signal full_2 :  STD_LOGIC;
                signal full_3 :  STD_LOGIC;
                signal full_4 :  STD_LOGIC;
                signal full_5 :  STD_LOGIC;
                signal full_6 :  STD_LOGIC;
                signal full_7 :  STD_LOGIC;
                signal how_many_ones :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal one_count_minus_one :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal one_count_plus_one :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal p0_full_0 :  STD_LOGIC;
                signal p0_stage_0 :  STD_LOGIC;
                signal p1_full_1 :  STD_LOGIC;
                signal p1_stage_1 :  STD_LOGIC;
                signal p2_full_2 :  STD_LOGIC;
                signal p2_stage_2 :  STD_LOGIC;
                signal p3_full_3 :  STD_LOGIC;
                signal p3_stage_3 :  STD_LOGIC;
                signal p4_full_4 :  STD_LOGIC;
                signal p4_stage_4 :  STD_LOGIC;
                signal p5_full_5 :  STD_LOGIC;
                signal p5_stage_5 :  STD_LOGIC;
                signal p6_full_6 :  STD_LOGIC;
                signal p6_stage_6 :  STD_LOGIC;
                signal stage_0 :  STD_LOGIC;
                signal stage_1 :  STD_LOGIC;
                signal stage_2 :  STD_LOGIC;
                signal stage_3 :  STD_LOGIC;
                signal stage_4 :  STD_LOGIC;
                signal stage_5 :  STD_LOGIC;
                signal stage_6 :  STD_LOGIC;
                signal updated_one_count :  STD_LOGIC_VECTOR (3 DOWNTO 0);

begin

  data_out <= stage_0;
  full <= full_6;
  empty <= NOT(full_0);
  full_7 <= std_logic'('0');
  --data_6, which is an e_mux
  p6_stage_6 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_7 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, data_in);
  --data_reg_6, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_6 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_6))))) = '1' then 
        if std_logic'(((sync_reset AND full_6) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_7))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_6 <= std_logic'('0');
        else
          stage_6 <= p6_stage_6;
        end if;
      end if;
    end if;

  end process;

  --control_6, which is an e_mux
  p6_full_6 <= Vector_To_Std_Logic(A_WE_StdLogicVector((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_5))), std_logic_vector'("00000000000000000000000000000000")));
  --control_reg_6, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_6 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_6 <= std_logic'('0');
        else
          full_6 <= p6_full_6;
        end if;
      end if;
    end if;

  end process;

  --data_5, which is an e_mux
  p5_stage_5 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_6 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_6);
  --data_reg_5, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_5 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_5))))) = '1' then 
        if std_logic'(((sync_reset AND full_5) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_6))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_5 <= std_logic'('0');
        else
          stage_5 <= p5_stage_5;
        end if;
      end if;
    end if;

  end process;

  --control_5, which is an e_mux
  p5_full_5 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), full_4, full_6);
  --control_reg_5, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_5 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_5 <= std_logic'('0');
        else
          full_5 <= p5_full_5;
        end if;
      end if;
    end if;

  end process;

  --data_4, which is an e_mux
  p4_stage_4 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_5 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_5);
  --data_reg_4, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_4 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_4))))) = '1' then 
        if std_logic'(((sync_reset AND full_4) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_5))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_4 <= std_logic'('0');
        else
          stage_4 <= p4_stage_4;
        end if;
      end if;
    end if;

  end process;

  --control_4, which is an e_mux
  p4_full_4 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), full_3, full_5);
  --control_reg_4, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_4 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_4 <= std_logic'('0');
        else
          full_4 <= p4_full_4;
        end if;
      end if;
    end if;

  end process;

  --data_3, which is an e_mux
  p3_stage_3 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_4 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_4);
  --data_reg_3, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_3 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_3))))) = '1' then 
        if std_logic'(((sync_reset AND full_3) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_4))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_3 <= std_logic'('0');
        else
          stage_3 <= p3_stage_3;
        end if;
      end if;
    end if;

  end process;

  --control_3, which is an e_mux
  p3_full_3 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), full_2, full_4);
  --control_reg_3, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_3 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_3 <= std_logic'('0');
        else
          full_3 <= p3_full_3;
        end if;
      end if;
    end if;

  end process;

  --data_2, which is an e_mux
  p2_stage_2 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_3 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_3);
  --data_reg_2, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_2 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_2))))) = '1' then 
        if std_logic'(((sync_reset AND full_2) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_3))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_2 <= std_logic'('0');
        else
          stage_2 <= p2_stage_2;
        end if;
      end if;
    end if;

  end process;

  --control_2, which is an e_mux
  p2_full_2 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), full_1, full_3);
  --control_reg_2, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_2 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_2 <= std_logic'('0');
        else
          full_2 <= p2_full_2;
        end if;
      end if;
    end if;

  end process;

  --data_1, which is an e_mux
  p1_stage_1 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_2 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_2);
  --data_reg_1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_1))))) = '1' then 
        if std_logic'(((sync_reset AND full_1) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_2))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_1 <= std_logic'('0');
        else
          stage_1 <= p1_stage_1;
        end if;
      end if;
    end if;

  end process;

  --control_1, which is an e_mux
  p1_full_1 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), full_0, full_2);
  --control_reg_1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_1 <= std_logic'('0');
        else
          full_1 <= p1_full_1;
        end if;
      end if;
    end if;

  end process;

  --data_0, which is an e_mux
  p0_stage_0 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_1 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_1);
  --data_reg_0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_0 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(((sync_reset AND full_0) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_1))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_0 <= std_logic'('0');
        else
          stage_0 <= p0_stage_0;
        end if;
      end if;
    end if;

  end process;

  --control_0, which is an e_mux
  p0_full_0 <= Vector_To_Std_Logic(A_WE_StdLogicVector((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), std_logic_vector'("00000000000000000000000000000001"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_1)))));
  --control_reg_0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_0 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'((clear_fifo AND NOT write)) = '1' then 
          full_0 <= std_logic'('0');
        else
          full_0 <= p0_full_0;
        end if;
      end if;
    end if;

  end process;

  one_count_plus_one <= A_EXT (((std_logic_vector'("00000000000000000000000000000") & (how_many_ones)) + std_logic_vector'("000000000000000000000000000000001")), 4);
  one_count_minus_one <= A_EXT (((std_logic_vector'("00000000000000000000000000000") & (how_many_ones)) - std_logic_vector'("000000000000000000000000000000001")), 4);
  --updated_one_count, which is an e_mux
  updated_one_count <= A_EXT (A_WE_StdLogicVector((std_logic'(((((clear_fifo OR sync_reset)) AND NOT(write)))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000") & (A_WE_StdLogicVector((std_logic'(((((clear_fifo OR sync_reset)) AND write))) = '1'), (std_logic_vector'("000") & (A_TOSTDLOGICVECTOR(data_in))), A_WE_StdLogicVector((std_logic'(((((read AND (data_in)) AND write) AND (stage_0)))) = '1'), how_many_ones, A_WE_StdLogicVector((std_logic'(((write AND (data_in)))) = '1'), one_count_plus_one, A_WE_StdLogicVector((std_logic'(((read AND (stage_0)))) = '1'), one_count_minus_one, how_many_ones))))))), 4);
  --counts how many ones in the data pipeline, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      how_many_ones <= std_logic_vector'("0000");
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR write)) = '1' then 
        how_many_ones <= updated_one_count;
      end if;
    end if;

  end process;

  --this fifo contains ones in the data pipeline, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_contains_ones_n <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR write)) = '1' then 
        fifo_contains_ones_n <= NOT (or_reduce(updated_one_count));
      end if;
    end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module is 
        port (
              -- inputs:
                 signal clear_fifo : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal data_in : IN STD_LOGIC;
                 signal read : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sync_reset : IN STD_LOGIC;
                 signal write : IN STD_LOGIC;

              -- outputs:
                 signal data_out : OUT STD_LOGIC;
                 signal empty : OUT STD_LOGIC;
                 signal fifo_contains_ones_n : OUT STD_LOGIC;
                 signal full : OUT STD_LOGIC
              );
end entity rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module;


architecture europa of rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module is
                signal full_0 :  STD_LOGIC;
                signal full_1 :  STD_LOGIC;
                signal full_2 :  STD_LOGIC;
                signal full_3 :  STD_LOGIC;
                signal full_4 :  STD_LOGIC;
                signal full_5 :  STD_LOGIC;
                signal full_6 :  STD_LOGIC;
                signal full_7 :  STD_LOGIC;
                signal how_many_ones :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal one_count_minus_one :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal one_count_plus_one :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal p0_full_0 :  STD_LOGIC;
                signal p0_stage_0 :  STD_LOGIC;
                signal p1_full_1 :  STD_LOGIC;
                signal p1_stage_1 :  STD_LOGIC;
                signal p2_full_2 :  STD_LOGIC;
                signal p2_stage_2 :  STD_LOGIC;
                signal p3_full_3 :  STD_LOGIC;
                signal p3_stage_3 :  STD_LOGIC;
                signal p4_full_4 :  STD_LOGIC;
                signal p4_stage_4 :  STD_LOGIC;
                signal p5_full_5 :  STD_LOGIC;
                signal p5_stage_5 :  STD_LOGIC;
                signal p6_full_6 :  STD_LOGIC;
                signal p6_stage_6 :  STD_LOGIC;
                signal stage_0 :  STD_LOGIC;
                signal stage_1 :  STD_LOGIC;
                signal stage_2 :  STD_LOGIC;
                signal stage_3 :  STD_LOGIC;
                signal stage_4 :  STD_LOGIC;
                signal stage_5 :  STD_LOGIC;
                signal stage_6 :  STD_LOGIC;
                signal updated_one_count :  STD_LOGIC_VECTOR (3 DOWNTO 0);

begin

  data_out <= stage_0;
  full <= full_6;
  empty <= NOT(full_0);
  full_7 <= std_logic'('0');
  --data_6, which is an e_mux
  p6_stage_6 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_7 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, data_in);
  --data_reg_6, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_6 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_6))))) = '1' then 
        if std_logic'(((sync_reset AND full_6) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_7))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_6 <= std_logic'('0');
        else
          stage_6 <= p6_stage_6;
        end if;
      end if;
    end if;

  end process;

  --control_6, which is an e_mux
  p6_full_6 <= Vector_To_Std_Logic(A_WE_StdLogicVector((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_5))), std_logic_vector'("00000000000000000000000000000000")));
  --control_reg_6, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_6 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_6 <= std_logic'('0');
        else
          full_6 <= p6_full_6;
        end if;
      end if;
    end if;

  end process;

  --data_5, which is an e_mux
  p5_stage_5 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_6 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_6);
  --data_reg_5, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_5 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_5))))) = '1' then 
        if std_logic'(((sync_reset AND full_5) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_6))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_5 <= std_logic'('0');
        else
          stage_5 <= p5_stage_5;
        end if;
      end if;
    end if;

  end process;

  --control_5, which is an e_mux
  p5_full_5 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), full_4, full_6);
  --control_reg_5, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_5 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_5 <= std_logic'('0');
        else
          full_5 <= p5_full_5;
        end if;
      end if;
    end if;

  end process;

  --data_4, which is an e_mux
  p4_stage_4 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_5 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_5);
  --data_reg_4, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_4 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_4))))) = '1' then 
        if std_logic'(((sync_reset AND full_4) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_5))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_4 <= std_logic'('0');
        else
          stage_4 <= p4_stage_4;
        end if;
      end if;
    end if;

  end process;

  --control_4, which is an e_mux
  p4_full_4 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), full_3, full_5);
  --control_reg_4, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_4 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_4 <= std_logic'('0');
        else
          full_4 <= p4_full_4;
        end if;
      end if;
    end if;

  end process;

  --data_3, which is an e_mux
  p3_stage_3 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_4 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_4);
  --data_reg_3, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_3 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_3))))) = '1' then 
        if std_logic'(((sync_reset AND full_3) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_4))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_3 <= std_logic'('0');
        else
          stage_3 <= p3_stage_3;
        end if;
      end if;
    end if;

  end process;

  --control_3, which is an e_mux
  p3_full_3 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), full_2, full_4);
  --control_reg_3, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_3 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_3 <= std_logic'('0');
        else
          full_3 <= p3_full_3;
        end if;
      end if;
    end if;

  end process;

  --data_2, which is an e_mux
  p2_stage_2 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_3 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_3);
  --data_reg_2, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_2 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_2))))) = '1' then 
        if std_logic'(((sync_reset AND full_2) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_3))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_2 <= std_logic'('0');
        else
          stage_2 <= p2_stage_2;
        end if;
      end if;
    end if;

  end process;

  --control_2, which is an e_mux
  p2_full_2 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), full_1, full_3);
  --control_reg_2, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_2 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_2 <= std_logic'('0');
        else
          full_2 <= p2_full_2;
        end if;
      end if;
    end if;

  end process;

  --data_1, which is an e_mux
  p1_stage_1 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_2 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_2);
  --data_reg_1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_1))))) = '1' then 
        if std_logic'(((sync_reset AND full_1) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_2))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_1 <= std_logic'('0');
        else
          stage_1 <= p1_stage_1;
        end if;
      end if;
    end if;

  end process;

  --control_1, which is an e_mux
  p1_full_1 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), full_0, full_2);
  --control_reg_1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_1 <= std_logic'('0');
        else
          full_1 <= p1_full_1;
        end if;
      end if;
    end if;

  end process;

  --data_0, which is an e_mux
  p0_stage_0 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_1 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_1);
  --data_reg_0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_0 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(((sync_reset AND full_0) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_1))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_0 <= std_logic'('0');
        else
          stage_0 <= p0_stage_0;
        end if;
      end if;
    end if;

  end process;

  --control_0, which is an e_mux
  p0_full_0 <= Vector_To_Std_Logic(A_WE_StdLogicVector((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), std_logic_vector'("00000000000000000000000000000001"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_1)))));
  --control_reg_0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_0 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'((clear_fifo AND NOT write)) = '1' then 
          full_0 <= std_logic'('0');
        else
          full_0 <= p0_full_0;
        end if;
      end if;
    end if;

  end process;

  one_count_plus_one <= A_EXT (((std_logic_vector'("00000000000000000000000000000") & (how_many_ones)) + std_logic_vector'("000000000000000000000000000000001")), 4);
  one_count_minus_one <= A_EXT (((std_logic_vector'("00000000000000000000000000000") & (how_many_ones)) - std_logic_vector'("000000000000000000000000000000001")), 4);
  --updated_one_count, which is an e_mux
  updated_one_count <= A_EXT (A_WE_StdLogicVector((std_logic'(((((clear_fifo OR sync_reset)) AND NOT(write)))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000") & (A_WE_StdLogicVector((std_logic'(((((clear_fifo OR sync_reset)) AND write))) = '1'), (std_logic_vector'("000") & (A_TOSTDLOGICVECTOR(data_in))), A_WE_StdLogicVector((std_logic'(((((read AND (data_in)) AND write) AND (stage_0)))) = '1'), how_many_ones, A_WE_StdLogicVector((std_logic'(((write AND (data_in)))) = '1'), one_count_plus_one, A_WE_StdLogicVector((std_logic'(((read AND (stage_0)))) = '1'), one_count_minus_one, how_many_ones))))))), 4);
  --counts how many ones in the data pipeline, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      how_many_ones <= std_logic_vector'("0000");
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR write)) = '1' then 
        how_many_ones <= updated_one_count;
      end if;
    end if;

  end process;

  --this fifo contains ones in the data pipeline, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_contains_ones_n <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR write)) = '1' then 
        fifo_contains_ones_n <= NOT (or_reduce(updated_one_count));
      end if;
    end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity sdram_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_instruction_master_latency_counter : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_instruction_master_read : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sdram_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal sdram_s1_readdatavalid : IN STD_LOGIC;
                 signal sdram_s1_waitrequest : IN STD_LOGIC;

              -- outputs:
                 signal cpu_data_master_granted_sdram_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_sdram_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_sdram_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_sdram_s1_shift_register : OUT STD_LOGIC;
                 signal cpu_data_master_requests_sdram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_granted_sdram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_qualified_request_sdram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_sdram_s1 : OUT STD_LOGIC;
                 signal cpu_instruction_master_read_data_valid_sdram_s1_shift_register : OUT STD_LOGIC;
                 signal cpu_instruction_master_requests_sdram_s1 : OUT STD_LOGIC;
                 signal d1_sdram_s1_end_xfer : OUT STD_LOGIC;
                 signal sdram_s1_address : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
                 signal sdram_s1_byteenable_n : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal sdram_s1_chipselect : OUT STD_LOGIC;
                 signal sdram_s1_read_n : OUT STD_LOGIC;
                 signal sdram_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal sdram_s1_reset_n : OUT STD_LOGIC;
                 signal sdram_s1_waitrequest_from_sa : OUT STD_LOGIC;
                 signal sdram_s1_write_n : OUT STD_LOGIC;
                 signal sdram_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity sdram_s1_arbitrator;


architecture europa of sdram_s1_arbitrator is
component rdv_fifo_for_cpu_data_master_to_sdram_s1_module is 
           port (
                 -- inputs:
                    signal clear_fifo : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal data_in : IN STD_LOGIC;
                    signal read : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sync_reset : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;

                 -- outputs:
                    signal data_out : OUT STD_LOGIC;
                    signal empty : OUT STD_LOGIC;
                    signal fifo_contains_ones_n : OUT STD_LOGIC;
                    signal full : OUT STD_LOGIC
                 );
end component rdv_fifo_for_cpu_data_master_to_sdram_s1_module;

component rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module is 
           port (
                 -- inputs:
                    signal clear_fifo : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal data_in : IN STD_LOGIC;
                    signal read : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sync_reset : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;

                 -- outputs:
                    signal data_out : OUT STD_LOGIC;
                    signal empty : OUT STD_LOGIC;
                    signal fifo_contains_ones_n : OUT STD_LOGIC;
                    signal full : OUT STD_LOGIC
                 );
end component rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module;

                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_rdv_fifo_empty_sdram_s1 :  STD_LOGIC;
                signal cpu_data_master_rdv_fifo_output_from_sdram_s1 :  STD_LOGIC;
                signal cpu_data_master_saved_grant_sdram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_arbiterlock :  STD_LOGIC;
                signal cpu_instruction_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_instruction_master_continuerequest :  STD_LOGIC;
                signal cpu_instruction_master_rdv_fifo_empty_sdram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_rdv_fifo_output_from_sdram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_saved_grant_sdram_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_sdram_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_sdram_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_sdram_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_read_data_valid_sdram_s1_shift_register :  STD_LOGIC;
                signal internal_cpu_data_master_requests_sdram_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_granted_sdram_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_qualified_request_sdram_s1 :  STD_LOGIC;
                signal internal_cpu_instruction_master_requests_sdram_s1 :  STD_LOGIC;
                signal internal_sdram_s1_waitrequest_from_sa :  STD_LOGIC;
                signal last_cycle_cpu_data_master_granted_slave_sdram_s1 :  STD_LOGIC;
                signal last_cycle_cpu_instruction_master_granted_slave_sdram_s1 :  STD_LOGIC;
                signal module_input :  STD_LOGIC;
                signal module_input1 :  STD_LOGIC;
                signal module_input2 :  STD_LOGIC;
                signal module_input3 :  STD_LOGIC;
                signal module_input4 :  STD_LOGIC;
                signal module_input5 :  STD_LOGIC;
                signal sdram_s1_allgrants :  STD_LOGIC;
                signal sdram_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal sdram_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal sdram_s1_any_continuerequest :  STD_LOGIC;
                signal sdram_s1_arb_addend :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sdram_s1_arb_counter_enable :  STD_LOGIC;
                signal sdram_s1_arb_share_counter :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal sdram_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal sdram_s1_arb_share_set_values :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal sdram_s1_arb_winner :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sdram_s1_arbitration_holdoff_internal :  STD_LOGIC;
                signal sdram_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal sdram_s1_begins_xfer :  STD_LOGIC;
                signal sdram_s1_chosen_master_double_vector :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal sdram_s1_chosen_master_rot_left :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sdram_s1_end_xfer :  STD_LOGIC;
                signal sdram_s1_firsttransfer :  STD_LOGIC;
                signal sdram_s1_grant_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sdram_s1_in_a_read_cycle :  STD_LOGIC;
                signal sdram_s1_in_a_write_cycle :  STD_LOGIC;
                signal sdram_s1_master_qreq_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sdram_s1_move_on_to_next_transaction :  STD_LOGIC;
                signal sdram_s1_non_bursting_master_requests :  STD_LOGIC;
                signal sdram_s1_readdatavalid_from_sa :  STD_LOGIC;
                signal sdram_s1_reg_firsttransfer :  STD_LOGIC;
                signal sdram_s1_saved_chosen_master_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sdram_s1_slavearbiterlockenable :  STD_LOGIC;
                signal sdram_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal sdram_s1_unreg_firsttransfer :  STD_LOGIC;
                signal sdram_s1_waits_for_read :  STD_LOGIC;
                signal sdram_s1_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_sdram_s1_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal shifted_address_to_sdram_s1_from_cpu_instruction_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal wait_for_sdram_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT sdram_s1_end_xfer;
    end if;

  end process;

  sdram_s1_begins_xfer <= NOT d1_reasons_to_wait AND ((internal_cpu_data_master_qualified_request_sdram_s1 OR internal_cpu_instruction_master_qualified_request_sdram_s1));
  --assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  sdram_s1_readdatavalid_from_sa <= sdram_s1_readdatavalid;
  --assign sdram_s1_readdata_from_sa = sdram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  sdram_s1_readdata_from_sa <= sdram_s1_readdata;
  internal_cpu_data_master_requests_sdram_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 24) & std_logic_vector'("000000000000000000000000")) = std_logic_vector'("01000000000000000000000000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  internal_sdram_s1_waitrequest_from_sa <= sdram_s1_waitrequest;
  --sdram_s1_arb_share_counter set values, which is an e_mux
  sdram_s1_arb_share_set_values <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_sdram_s1)) = '1'), std_logic_vector'("00000000000000000000000000001000"), A_WE_StdLogicVector((std_logic'((internal_cpu_instruction_master_granted_sdram_s1)) = '1'), std_logic_vector'("00000000000000000000000000001000"), A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_sdram_s1)) = '1'), std_logic_vector'("00000000000000000000000000001000"), A_WE_StdLogicVector((std_logic'((internal_cpu_instruction_master_granted_sdram_s1)) = '1'), std_logic_vector'("00000000000000000000000000001000"), std_logic_vector'("00000000000000000000000000000001"))))), 6);
  --sdram_s1_non_bursting_master_requests mux, which is an e_mux
  sdram_s1_non_bursting_master_requests <= ((internal_cpu_data_master_requests_sdram_s1 OR internal_cpu_instruction_master_requests_sdram_s1) OR internal_cpu_data_master_requests_sdram_s1) OR internal_cpu_instruction_master_requests_sdram_s1;
  --sdram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  sdram_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --sdram_s1_arb_share_counter_next_value assignment, which is an e_assign
  sdram_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(sdram_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000") & (sdram_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(sdram_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000") & (sdram_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 6);
  --sdram_s1_allgrants all slave grants, which is an e_mux
  sdram_s1_allgrants <= (((or_reduce(sdram_s1_grant_vector)) OR (or_reduce(sdram_s1_grant_vector))) OR (or_reduce(sdram_s1_grant_vector))) OR (or_reduce(sdram_s1_grant_vector));
  --sdram_s1_end_xfer assignment, which is an e_assign
  sdram_s1_end_xfer <= NOT ((sdram_s1_waits_for_read OR sdram_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_sdram_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_sdram_s1 <= sdram_s1_end_xfer AND (((NOT sdram_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --sdram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  sdram_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_sdram_s1 AND sdram_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_sdram_s1 AND NOT sdram_s1_non_bursting_master_requests));
  --sdram_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sdram_s1_arb_share_counter <= std_logic_vector'("000000");
    elsif clk'event and clk = '1' then
      if std_logic'(sdram_s1_arb_counter_enable) = '1' then 
        sdram_s1_arb_share_counter <= sdram_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --sdram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sdram_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((or_reduce(sdram_s1_master_qreq_vector) AND end_xfer_arb_share_counter_term_sdram_s1)) OR ((end_xfer_arb_share_counter_term_sdram_s1 AND NOT sdram_s1_non_bursting_master_requests)))) = '1' then 
        sdram_s1_slavearbiterlockenable <= or_reduce(sdram_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master sdram/s1 arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= sdram_s1_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --sdram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  sdram_s1_slavearbiterlockenable2 <= or_reduce(sdram_s1_arb_share_counter_next_value);
  --cpu/data_master sdram/s1 arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= sdram_s1_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --cpu/instruction_master sdram/s1 arbiterlock, which is an e_assign
  cpu_instruction_master_arbiterlock <= sdram_s1_slavearbiterlockenable AND cpu_instruction_master_continuerequest;
  --cpu/instruction_master sdram/s1 arbiterlock2, which is an e_assign
  cpu_instruction_master_arbiterlock2 <= sdram_s1_slavearbiterlockenable2 AND cpu_instruction_master_continuerequest;
  --cpu/instruction_master granted sdram/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_instruction_master_granted_slave_sdram_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_instruction_master_granted_slave_sdram_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_instruction_master_saved_grant_sdram_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((sdram_s1_arbitration_holdoff_internal OR NOT internal_cpu_instruction_master_requests_sdram_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_instruction_master_granted_slave_sdram_s1))))));
    end if;

  end process;

  --cpu_instruction_master_continuerequest continued request, which is an e_mux
  cpu_instruction_master_continuerequest <= last_cycle_cpu_instruction_master_granted_slave_sdram_s1 AND internal_cpu_instruction_master_requests_sdram_s1;
  --sdram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  sdram_s1_any_continuerequest <= cpu_instruction_master_continuerequest OR cpu_data_master_continuerequest;
  internal_cpu_data_master_qualified_request_sdram_s1 <= internal_cpu_data_master_requests_sdram_s1 AND NOT (((((cpu_data_master_read AND ((NOT cpu_data_master_waitrequest OR (internal_cpu_data_master_read_data_valid_sdram_s1_shift_register))))) OR (((NOT cpu_data_master_waitrequest) AND cpu_data_master_write))) OR cpu_instruction_master_arbiterlock));
  --unique name for sdram_s1_move_on_to_next_transaction, which is an e_assign
  sdram_s1_move_on_to_next_transaction <= sdram_s1_readdatavalid_from_sa;
  --rdv_fifo_for_cpu_data_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_sdram_s1 : rdv_fifo_for_cpu_data_master_to_sdram_s1_module
    port map(
      data_out => cpu_data_master_rdv_fifo_output_from_sdram_s1,
      empty => open,
      fifo_contains_ones_n => cpu_data_master_rdv_fifo_empty_sdram_s1,
      full => open,
      clear_fifo => module_input,
      clk => clk,
      data_in => internal_cpu_data_master_granted_sdram_s1,
      read => sdram_s1_move_on_to_next_transaction,
      reset_n => reset_n,
      sync_reset => module_input1,
      write => module_input2
    );

  module_input <= std_logic'('0');
  module_input1 <= std_logic'('0');
  module_input2 <= in_a_read_cycle AND NOT sdram_s1_waits_for_read;

  internal_cpu_data_master_read_data_valid_sdram_s1_shift_register <= NOT cpu_data_master_rdv_fifo_empty_sdram_s1;
  --local readdatavalid cpu_data_master_read_data_valid_sdram_s1, which is an e_mux
  cpu_data_master_read_data_valid_sdram_s1 <= ((sdram_s1_readdatavalid_from_sa AND cpu_data_master_rdv_fifo_output_from_sdram_s1)) AND NOT cpu_data_master_rdv_fifo_empty_sdram_s1;
  --sdram_s1_writedata mux, which is an e_mux
  sdram_s1_writedata <= cpu_data_master_writedata;
  internal_cpu_instruction_master_requests_sdram_s1 <= ((to_std_logic(((Std_Logic_Vector'(cpu_instruction_master_address_to_slave(25 DOWNTO 24) & std_logic_vector'("000000000000000000000000")) = std_logic_vector'("01000000000000000000000000")))) AND (cpu_instruction_master_read))) AND cpu_instruction_master_read;
  --cpu/data_master granted sdram/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_data_master_granted_slave_sdram_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_data_master_granted_slave_sdram_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_data_master_saved_grant_sdram_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((sdram_s1_arbitration_holdoff_internal OR NOT internal_cpu_data_master_requests_sdram_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_data_master_granted_slave_sdram_s1))))));
    end if;

  end process;

  --cpu_data_master_continuerequest continued request, which is an e_mux
  cpu_data_master_continuerequest <= last_cycle_cpu_data_master_granted_slave_sdram_s1 AND internal_cpu_data_master_requests_sdram_s1;
  internal_cpu_instruction_master_qualified_request_sdram_s1 <= internal_cpu_instruction_master_requests_sdram_s1 AND NOT ((((cpu_instruction_master_read AND to_std_logic((((((std_logic_vector'("000000000000000000000000000000") & (cpu_instruction_master_latency_counter)) /= std_logic_vector'("00000000000000000000000000000000"))) OR ((std_logic_vector'("00000000000000000000000000000001")<(std_logic_vector'("000000000000000000000000000000") & (cpu_instruction_master_latency_counter))))))))) OR cpu_data_master_arbiterlock));
  --rdv_fifo_for_cpu_instruction_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_instruction_master_to_sdram_s1 : rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module
    port map(
      data_out => cpu_instruction_master_rdv_fifo_output_from_sdram_s1,
      empty => open,
      fifo_contains_ones_n => cpu_instruction_master_rdv_fifo_empty_sdram_s1,
      full => open,
      clear_fifo => module_input3,
      clk => clk,
      data_in => internal_cpu_instruction_master_granted_sdram_s1,
      read => sdram_s1_move_on_to_next_transaction,
      reset_n => reset_n,
      sync_reset => module_input4,
      write => module_input5
    );

  module_input3 <= std_logic'('0');
  module_input4 <= std_logic'('0');
  module_input5 <= in_a_read_cycle AND NOT sdram_s1_waits_for_read;

  cpu_instruction_master_read_data_valid_sdram_s1_shift_register <= NOT cpu_instruction_master_rdv_fifo_empty_sdram_s1;
  --local readdatavalid cpu_instruction_master_read_data_valid_sdram_s1, which is an e_mux
  cpu_instruction_master_read_data_valid_sdram_s1 <= ((sdram_s1_readdatavalid_from_sa AND cpu_instruction_master_rdv_fifo_output_from_sdram_s1)) AND NOT cpu_instruction_master_rdv_fifo_empty_sdram_s1;
  --allow new arb cycle for sdram/s1, which is an e_assign
  sdram_s1_allow_new_arb_cycle <= NOT cpu_data_master_arbiterlock AND NOT cpu_instruction_master_arbiterlock;
  --cpu/instruction_master assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  sdram_s1_master_qreq_vector(0) <= internal_cpu_instruction_master_qualified_request_sdram_s1;
  --cpu/instruction_master grant sdram/s1, which is an e_assign
  internal_cpu_instruction_master_granted_sdram_s1 <= sdram_s1_grant_vector(0);
  --cpu/instruction_master saved-grant sdram/s1, which is an e_assign
  cpu_instruction_master_saved_grant_sdram_s1 <= sdram_s1_arb_winner(0) AND internal_cpu_instruction_master_requests_sdram_s1;
  --cpu/data_master assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  sdram_s1_master_qreq_vector(1) <= internal_cpu_data_master_qualified_request_sdram_s1;
  --cpu/data_master grant sdram/s1, which is an e_assign
  internal_cpu_data_master_granted_sdram_s1 <= sdram_s1_grant_vector(1);
  --cpu/data_master saved-grant sdram/s1, which is an e_assign
  cpu_data_master_saved_grant_sdram_s1 <= sdram_s1_arb_winner(1) AND internal_cpu_data_master_requests_sdram_s1;
  --sdram/s1 chosen-master double-vector, which is an e_assign
  sdram_s1_chosen_master_double_vector <= A_EXT (((std_logic_vector'("0") & ((sdram_s1_master_qreq_vector & sdram_s1_master_qreq_vector))) AND (((std_logic_vector'("0") & (Std_Logic_Vector'(NOT sdram_s1_master_qreq_vector & NOT sdram_s1_master_qreq_vector))) + (std_logic_vector'("000") & (sdram_s1_arb_addend))))), 4);
  --stable onehot encoding of arb winner
  sdram_s1_arb_winner <= A_WE_StdLogicVector((std_logic'(((sdram_s1_allow_new_arb_cycle AND or_reduce(sdram_s1_grant_vector)))) = '1'), sdram_s1_grant_vector, sdram_s1_saved_chosen_master_vector);
  --saved sdram_s1_grant_vector, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sdram_s1_saved_chosen_master_vector <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(sdram_s1_allow_new_arb_cycle) = '1' then 
        sdram_s1_saved_chosen_master_vector <= A_WE_StdLogicVector((std_logic'(or_reduce(sdram_s1_grant_vector)) = '1'), sdram_s1_grant_vector, sdram_s1_saved_chosen_master_vector);
      end if;
    end if;

  end process;

  --onehot encoding of chosen master
  sdram_s1_grant_vector <= Std_Logic_Vector'(A_ToStdLogicVector(((sdram_s1_chosen_master_double_vector(1) OR sdram_s1_chosen_master_double_vector(3)))) & A_ToStdLogicVector(((sdram_s1_chosen_master_double_vector(0) OR sdram_s1_chosen_master_double_vector(2)))));
  --sdram/s1 chosen master rotated left, which is an e_assign
  sdram_s1_chosen_master_rot_left <= A_EXT (A_WE_StdLogicVector((((A_SLL(sdram_s1_arb_winner,std_logic_vector'("00000000000000000000000000000001")))) /= std_logic_vector'("00")), (std_logic_vector'("000000000000000000000000000000") & ((A_SLL(sdram_s1_arb_winner,std_logic_vector'("00000000000000000000000000000001"))))), std_logic_vector'("00000000000000000000000000000001")), 2);
  --sdram/s1's addend for next-master-grant
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sdram_s1_arb_addend <= std_logic_vector'("01");
    elsif clk'event and clk = '1' then
      if std_logic'(or_reduce(sdram_s1_grant_vector)) = '1' then 
        sdram_s1_arb_addend <= A_WE_StdLogicVector((std_logic'(sdram_s1_end_xfer) = '1'), sdram_s1_chosen_master_rot_left, sdram_s1_grant_vector);
      end if;
    end if;

  end process;

  --sdram_s1_reset_n assignment, which is an e_assign
  sdram_s1_reset_n <= reset_n;
  sdram_s1_chipselect <= internal_cpu_data_master_granted_sdram_s1 OR internal_cpu_instruction_master_granted_sdram_s1;
  --sdram_s1_firsttransfer first transaction, which is an e_assign
  sdram_s1_firsttransfer <= A_WE_StdLogic((std_logic'(sdram_s1_begins_xfer) = '1'), sdram_s1_unreg_firsttransfer, sdram_s1_reg_firsttransfer);
  --sdram_s1_unreg_firsttransfer first transaction, which is an e_assign
  sdram_s1_unreg_firsttransfer <= NOT ((sdram_s1_slavearbiterlockenable AND sdram_s1_any_continuerequest));
  --sdram_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sdram_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(sdram_s1_begins_xfer) = '1' then 
        sdram_s1_reg_firsttransfer <= sdram_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --sdram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  sdram_s1_beginbursttransfer_internal <= sdram_s1_begins_xfer;
  --sdram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  sdram_s1_arbitration_holdoff_internal <= sdram_s1_begins_xfer AND sdram_s1_firsttransfer;
  --~sdram_s1_read_n assignment, which is an e_mux
  sdram_s1_read_n <= NOT ((((internal_cpu_data_master_granted_sdram_s1 AND cpu_data_master_read)) OR ((internal_cpu_instruction_master_granted_sdram_s1 AND cpu_instruction_master_read))));
  --~sdram_s1_write_n assignment, which is an e_mux
  sdram_s1_write_n <= NOT ((internal_cpu_data_master_granted_sdram_s1 AND cpu_data_master_write));
  shifted_address_to_sdram_s1_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --sdram_s1_address mux, which is an e_mux
  sdram_s1_address <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_sdram_s1)) = '1'), (A_SRL(shifted_address_to_sdram_s1_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010"))), (A_SRL(shifted_address_to_sdram_s1_from_cpu_instruction_master,std_logic_vector'("00000000000000000000000000000010")))), 22);
  shifted_address_to_sdram_s1_from_cpu_instruction_master <= cpu_instruction_master_address_to_slave;
  --d1_sdram_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_sdram_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_sdram_s1_end_xfer <= sdram_s1_end_xfer;
    end if;

  end process;

  --sdram_s1_waits_for_read in a cycle, which is an e_mux
  sdram_s1_waits_for_read <= sdram_s1_in_a_read_cycle AND internal_sdram_s1_waitrequest_from_sa;
  --sdram_s1_in_a_read_cycle assignment, which is an e_assign
  sdram_s1_in_a_read_cycle <= ((internal_cpu_data_master_granted_sdram_s1 AND cpu_data_master_read)) OR ((internal_cpu_instruction_master_granted_sdram_s1 AND cpu_instruction_master_read));
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= sdram_s1_in_a_read_cycle;
  --sdram_s1_waits_for_write in a cycle, which is an e_mux
  sdram_s1_waits_for_write <= sdram_s1_in_a_write_cycle AND internal_sdram_s1_waitrequest_from_sa;
  --sdram_s1_in_a_write_cycle assignment, which is an e_assign
  sdram_s1_in_a_write_cycle <= internal_cpu_data_master_granted_sdram_s1 AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= sdram_s1_in_a_write_cycle;
  wait_for_sdram_s1_counter <= std_logic'('0');
  --~sdram_s1_byteenable_n byte enable port mux, which is an e_mux
  sdram_s1_byteenable_n <= A_EXT (NOT (A_WE_StdLogicVector((std_logic'((internal_cpu_data_master_granted_sdram_s1)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001")))), 4);
  --vhdl renameroo for output signals
  cpu_data_master_granted_sdram_s1 <= internal_cpu_data_master_granted_sdram_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_sdram_s1 <= internal_cpu_data_master_qualified_request_sdram_s1;
  --vhdl renameroo for output signals
  cpu_data_master_read_data_valid_sdram_s1_shift_register <= internal_cpu_data_master_read_data_valid_sdram_s1_shift_register;
  --vhdl renameroo for output signals
  cpu_data_master_requests_sdram_s1 <= internal_cpu_data_master_requests_sdram_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_granted_sdram_s1 <= internal_cpu_instruction_master_granted_sdram_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_qualified_request_sdram_s1 <= internal_cpu_instruction_master_qualified_request_sdram_s1;
  --vhdl renameroo for output signals
  cpu_instruction_master_requests_sdram_s1 <= internal_cpu_instruction_master_requests_sdram_s1;
  --vhdl renameroo for output signals
  sdram_s1_waitrequest_from_sa <= internal_sdram_s1_waitrequest_from_sa;
--synthesis translate_off
    --sdram/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

    --grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line13 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_data_master_granted_sdram_s1))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_instruction_master_granted_sdram_s1))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line13, now);
          write(write_line13, string'(": "));
          write(write_line13, string'("> 1 of grant signals are active simultaneously"));
          write(output, write_line13.all);
          deallocate (write_line13);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --saved_grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line14 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_data_master_saved_grant_sdram_s1))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_instruction_master_saved_grant_sdram_s1))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line14, now);
          write(write_line14, string'(": "));
          write(write_line14, string'("> 1 of saved_grant signals are active simultaneously"));
          write(output, write_line14.all);
          deallocate (write_line14);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity seven_seg_pio_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;
                 signal seven_seg_pio_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- outputs:
                 signal cpu_data_master_granted_seven_seg_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_seven_seg_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_seven_seg_pio_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_requests_seven_seg_pio_s1 : OUT STD_LOGIC;
                 signal d1_seven_seg_pio_s1_end_xfer : OUT STD_LOGIC;
                 signal seven_seg_pio_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal seven_seg_pio_s1_chipselect : OUT STD_LOGIC;
                 signal seven_seg_pio_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal seven_seg_pio_s1_reset_n : OUT STD_LOGIC;
                 signal seven_seg_pio_s1_write_n : OUT STD_LOGIC;
                 signal seven_seg_pio_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
              );
end entity seven_seg_pio_s1_arbitrator;


architecture europa of seven_seg_pio_s1_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_seven_seg_pio_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_seven_seg_pio_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_seven_seg_pio_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_seven_seg_pio_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_requests_seven_seg_pio_s1 :  STD_LOGIC;
                signal seven_seg_pio_s1_allgrants :  STD_LOGIC;
                signal seven_seg_pio_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal seven_seg_pio_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal seven_seg_pio_s1_any_continuerequest :  STD_LOGIC;
                signal seven_seg_pio_s1_arb_counter_enable :  STD_LOGIC;
                signal seven_seg_pio_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal seven_seg_pio_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal seven_seg_pio_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal seven_seg_pio_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal seven_seg_pio_s1_begins_xfer :  STD_LOGIC;
                signal seven_seg_pio_s1_end_xfer :  STD_LOGIC;
                signal seven_seg_pio_s1_firsttransfer :  STD_LOGIC;
                signal seven_seg_pio_s1_grant_vector :  STD_LOGIC;
                signal seven_seg_pio_s1_in_a_read_cycle :  STD_LOGIC;
                signal seven_seg_pio_s1_in_a_write_cycle :  STD_LOGIC;
                signal seven_seg_pio_s1_master_qreq_vector :  STD_LOGIC;
                signal seven_seg_pio_s1_non_bursting_master_requests :  STD_LOGIC;
                signal seven_seg_pio_s1_reg_firsttransfer :  STD_LOGIC;
                signal seven_seg_pio_s1_slavearbiterlockenable :  STD_LOGIC;
                signal seven_seg_pio_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal seven_seg_pio_s1_unreg_firsttransfer :  STD_LOGIC;
                signal seven_seg_pio_s1_waits_for_read :  STD_LOGIC;
                signal seven_seg_pio_s1_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_seven_seg_pio_s1_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal wait_for_seven_seg_pio_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT seven_seg_pio_s1_end_xfer;
    end if;

  end process;

  seven_seg_pio_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_data_master_qualified_request_seven_seg_pio_s1);
  --assign seven_seg_pio_s1_readdata_from_sa = seven_seg_pio_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  seven_seg_pio_s1_readdata_from_sa <= seven_seg_pio_s1_readdata;
  internal_cpu_data_master_requests_seven_seg_pio_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("10000100100000100010010000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --seven_seg_pio_s1_arb_share_counter set values, which is an e_mux
  seven_seg_pio_s1_arb_share_set_values <= std_logic_vector'("001");
  --seven_seg_pio_s1_non_bursting_master_requests mux, which is an e_mux
  seven_seg_pio_s1_non_bursting_master_requests <= internal_cpu_data_master_requests_seven_seg_pio_s1;
  --seven_seg_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  seven_seg_pio_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --seven_seg_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  seven_seg_pio_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(seven_seg_pio_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (seven_seg_pio_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(seven_seg_pio_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (seven_seg_pio_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --seven_seg_pio_s1_allgrants all slave grants, which is an e_mux
  seven_seg_pio_s1_allgrants <= seven_seg_pio_s1_grant_vector;
  --seven_seg_pio_s1_end_xfer assignment, which is an e_assign
  seven_seg_pio_s1_end_xfer <= NOT ((seven_seg_pio_s1_waits_for_read OR seven_seg_pio_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_seven_seg_pio_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_seven_seg_pio_s1 <= seven_seg_pio_s1_end_xfer AND (((NOT seven_seg_pio_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --seven_seg_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  seven_seg_pio_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_seven_seg_pio_s1 AND seven_seg_pio_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_seven_seg_pio_s1 AND NOT seven_seg_pio_s1_non_bursting_master_requests));
  --seven_seg_pio_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      seven_seg_pio_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(seven_seg_pio_s1_arb_counter_enable) = '1' then 
        seven_seg_pio_s1_arb_share_counter <= seven_seg_pio_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --seven_seg_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      seven_seg_pio_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((seven_seg_pio_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_seven_seg_pio_s1)) OR ((end_xfer_arb_share_counter_term_seven_seg_pio_s1 AND NOT seven_seg_pio_s1_non_bursting_master_requests)))) = '1' then 
        seven_seg_pio_s1_slavearbiterlockenable <= or_reduce(seven_seg_pio_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master seven_seg_pio/s1 arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= seven_seg_pio_s1_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --seven_seg_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  seven_seg_pio_s1_slavearbiterlockenable2 <= or_reduce(seven_seg_pio_s1_arb_share_counter_next_value);
  --cpu/data_master seven_seg_pio/s1 arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= seven_seg_pio_s1_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --seven_seg_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  seven_seg_pio_s1_any_continuerequest <= std_logic'('1');
  --cpu_data_master_continuerequest continued request, which is an e_assign
  cpu_data_master_continuerequest <= std_logic'('1');
  internal_cpu_data_master_qualified_request_seven_seg_pio_s1 <= internal_cpu_data_master_requests_seven_seg_pio_s1 AND NOT (((NOT cpu_data_master_waitrequest) AND cpu_data_master_write));
  --seven_seg_pio_s1_writedata mux, which is an e_mux
  seven_seg_pio_s1_writedata <= cpu_data_master_writedata (15 DOWNTO 0);
  --master is always granted when requested
  internal_cpu_data_master_granted_seven_seg_pio_s1 <= internal_cpu_data_master_qualified_request_seven_seg_pio_s1;
  --cpu/data_master saved-grant seven_seg_pio/s1, which is an e_assign
  cpu_data_master_saved_grant_seven_seg_pio_s1 <= internal_cpu_data_master_requests_seven_seg_pio_s1;
  --allow new arb cycle for seven_seg_pio/s1, which is an e_assign
  seven_seg_pio_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  seven_seg_pio_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  seven_seg_pio_s1_master_qreq_vector <= std_logic'('1');
  --seven_seg_pio_s1_reset_n assignment, which is an e_assign
  seven_seg_pio_s1_reset_n <= reset_n;
  seven_seg_pio_s1_chipselect <= internal_cpu_data_master_granted_seven_seg_pio_s1;
  --seven_seg_pio_s1_firsttransfer first transaction, which is an e_assign
  seven_seg_pio_s1_firsttransfer <= A_WE_StdLogic((std_logic'(seven_seg_pio_s1_begins_xfer) = '1'), seven_seg_pio_s1_unreg_firsttransfer, seven_seg_pio_s1_reg_firsttransfer);
  --seven_seg_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  seven_seg_pio_s1_unreg_firsttransfer <= NOT ((seven_seg_pio_s1_slavearbiterlockenable AND seven_seg_pio_s1_any_continuerequest));
  --seven_seg_pio_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      seven_seg_pio_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(seven_seg_pio_s1_begins_xfer) = '1' then 
        seven_seg_pio_s1_reg_firsttransfer <= seven_seg_pio_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --seven_seg_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  seven_seg_pio_s1_beginbursttransfer_internal <= seven_seg_pio_s1_begins_xfer;
  --~seven_seg_pio_s1_write_n assignment, which is an e_mux
  seven_seg_pio_s1_write_n <= NOT ((internal_cpu_data_master_granted_seven_seg_pio_s1 AND cpu_data_master_write));
  shifted_address_to_seven_seg_pio_s1_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --seven_seg_pio_s1_address mux, which is an e_mux
  seven_seg_pio_s1_address <= A_EXT (A_SRL(shifted_address_to_seven_seg_pio_s1_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_seven_seg_pio_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_seven_seg_pio_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_seven_seg_pio_s1_end_xfer <= seven_seg_pio_s1_end_xfer;
    end if;

  end process;

  --seven_seg_pio_s1_waits_for_read in a cycle, which is an e_mux
  seven_seg_pio_s1_waits_for_read <= seven_seg_pio_s1_in_a_read_cycle AND seven_seg_pio_s1_begins_xfer;
  --seven_seg_pio_s1_in_a_read_cycle assignment, which is an e_assign
  seven_seg_pio_s1_in_a_read_cycle <= internal_cpu_data_master_granted_seven_seg_pio_s1 AND cpu_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= seven_seg_pio_s1_in_a_read_cycle;
  --seven_seg_pio_s1_waits_for_write in a cycle, which is an e_mux
  seven_seg_pio_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(seven_seg_pio_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --seven_seg_pio_s1_in_a_write_cycle assignment, which is an e_assign
  seven_seg_pio_s1_in_a_write_cycle <= internal_cpu_data_master_granted_seven_seg_pio_s1 AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= seven_seg_pio_s1_in_a_write_cycle;
  wait_for_seven_seg_pio_s1_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_data_master_granted_seven_seg_pio_s1 <= internal_cpu_data_master_granted_seven_seg_pio_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_seven_seg_pio_s1 <= internal_cpu_data_master_qualified_request_seven_seg_pio_s1;
  --vhdl renameroo for output signals
  cpu_data_master_requests_seven_seg_pio_s1 <= internal_cpu_data_master_requests_seven_seg_pio_s1;
--synthesis translate_off
    --seven_seg_pio/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sys_clk_timer_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;
                 signal sys_clk_timer_s1_irq : IN STD_LOGIC;
                 signal sys_clk_timer_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- outputs:
                 signal cpu_data_master_granted_sys_clk_timer_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_sys_clk_timer_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_sys_clk_timer_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_requests_sys_clk_timer_s1 : OUT STD_LOGIC;
                 signal d1_sys_clk_timer_s1_end_xfer : OUT STD_LOGIC;
                 signal sys_clk_timer_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal sys_clk_timer_s1_chipselect : OUT STD_LOGIC;
                 signal sys_clk_timer_s1_irq_from_sa : OUT STD_LOGIC;
                 signal sys_clk_timer_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal sys_clk_timer_s1_reset_n : OUT STD_LOGIC;
                 signal sys_clk_timer_s1_write_n : OUT STD_LOGIC;
                 signal sys_clk_timer_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
              );
end entity sys_clk_timer_s1_arbitrator;


architecture europa of sys_clk_timer_s1_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_sys_clk_timer_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_sys_clk_timer_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_sys_clk_timer_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_sys_clk_timer_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_requests_sys_clk_timer_s1 :  STD_LOGIC;
                signal shifted_address_to_sys_clk_timer_s1_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal sys_clk_timer_s1_allgrants :  STD_LOGIC;
                signal sys_clk_timer_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal sys_clk_timer_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal sys_clk_timer_s1_any_continuerequest :  STD_LOGIC;
                signal sys_clk_timer_s1_arb_counter_enable :  STD_LOGIC;
                signal sys_clk_timer_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal sys_clk_timer_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal sys_clk_timer_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal sys_clk_timer_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal sys_clk_timer_s1_begins_xfer :  STD_LOGIC;
                signal sys_clk_timer_s1_end_xfer :  STD_LOGIC;
                signal sys_clk_timer_s1_firsttransfer :  STD_LOGIC;
                signal sys_clk_timer_s1_grant_vector :  STD_LOGIC;
                signal sys_clk_timer_s1_in_a_read_cycle :  STD_LOGIC;
                signal sys_clk_timer_s1_in_a_write_cycle :  STD_LOGIC;
                signal sys_clk_timer_s1_master_qreq_vector :  STD_LOGIC;
                signal sys_clk_timer_s1_non_bursting_master_requests :  STD_LOGIC;
                signal sys_clk_timer_s1_reg_firsttransfer :  STD_LOGIC;
                signal sys_clk_timer_s1_slavearbiterlockenable :  STD_LOGIC;
                signal sys_clk_timer_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal sys_clk_timer_s1_unreg_firsttransfer :  STD_LOGIC;
                signal sys_clk_timer_s1_waits_for_read :  STD_LOGIC;
                signal sys_clk_timer_s1_waits_for_write :  STD_LOGIC;
                signal wait_for_sys_clk_timer_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT sys_clk_timer_s1_end_xfer;
    end if;

  end process;

  sys_clk_timer_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_data_master_qualified_request_sys_clk_timer_s1);
  --assign sys_clk_timer_s1_readdata_from_sa = sys_clk_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  sys_clk_timer_s1_readdata_from_sa <= sys_clk_timer_s1_readdata;
  internal_cpu_data_master_requests_sys_clk_timer_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 5) & std_logic_vector'("00000")) = std_logic_vector'("10000100100000100000000000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --sys_clk_timer_s1_arb_share_counter set values, which is an e_mux
  sys_clk_timer_s1_arb_share_set_values <= std_logic_vector'("001");
  --sys_clk_timer_s1_non_bursting_master_requests mux, which is an e_mux
  sys_clk_timer_s1_non_bursting_master_requests <= internal_cpu_data_master_requests_sys_clk_timer_s1;
  --sys_clk_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  sys_clk_timer_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --sys_clk_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  sys_clk_timer_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(sys_clk_timer_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (sys_clk_timer_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(sys_clk_timer_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (sys_clk_timer_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --sys_clk_timer_s1_allgrants all slave grants, which is an e_mux
  sys_clk_timer_s1_allgrants <= sys_clk_timer_s1_grant_vector;
  --sys_clk_timer_s1_end_xfer assignment, which is an e_assign
  sys_clk_timer_s1_end_xfer <= NOT ((sys_clk_timer_s1_waits_for_read OR sys_clk_timer_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_sys_clk_timer_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_sys_clk_timer_s1 <= sys_clk_timer_s1_end_xfer AND (((NOT sys_clk_timer_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --sys_clk_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  sys_clk_timer_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_sys_clk_timer_s1 AND sys_clk_timer_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_sys_clk_timer_s1 AND NOT sys_clk_timer_s1_non_bursting_master_requests));
  --sys_clk_timer_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sys_clk_timer_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(sys_clk_timer_s1_arb_counter_enable) = '1' then 
        sys_clk_timer_s1_arb_share_counter <= sys_clk_timer_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --sys_clk_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sys_clk_timer_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((sys_clk_timer_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_sys_clk_timer_s1)) OR ((end_xfer_arb_share_counter_term_sys_clk_timer_s1 AND NOT sys_clk_timer_s1_non_bursting_master_requests)))) = '1' then 
        sys_clk_timer_s1_slavearbiterlockenable <= or_reduce(sys_clk_timer_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master sys_clk_timer/s1 arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= sys_clk_timer_s1_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --sys_clk_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  sys_clk_timer_s1_slavearbiterlockenable2 <= or_reduce(sys_clk_timer_s1_arb_share_counter_next_value);
  --cpu/data_master sys_clk_timer/s1 arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= sys_clk_timer_s1_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --sys_clk_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  sys_clk_timer_s1_any_continuerequest <= std_logic'('1');
  --cpu_data_master_continuerequest continued request, which is an e_assign
  cpu_data_master_continuerequest <= std_logic'('1');
  internal_cpu_data_master_qualified_request_sys_clk_timer_s1 <= internal_cpu_data_master_requests_sys_clk_timer_s1 AND NOT (((NOT cpu_data_master_waitrequest) AND cpu_data_master_write));
  --sys_clk_timer_s1_writedata mux, which is an e_mux
  sys_clk_timer_s1_writedata <= cpu_data_master_writedata (15 DOWNTO 0);
  --master is always granted when requested
  internal_cpu_data_master_granted_sys_clk_timer_s1 <= internal_cpu_data_master_qualified_request_sys_clk_timer_s1;
  --cpu/data_master saved-grant sys_clk_timer/s1, which is an e_assign
  cpu_data_master_saved_grant_sys_clk_timer_s1 <= internal_cpu_data_master_requests_sys_clk_timer_s1;
  --allow new arb cycle for sys_clk_timer/s1, which is an e_assign
  sys_clk_timer_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  sys_clk_timer_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  sys_clk_timer_s1_master_qreq_vector <= std_logic'('1');
  --sys_clk_timer_s1_reset_n assignment, which is an e_assign
  sys_clk_timer_s1_reset_n <= reset_n;
  sys_clk_timer_s1_chipselect <= internal_cpu_data_master_granted_sys_clk_timer_s1;
  --sys_clk_timer_s1_firsttransfer first transaction, which is an e_assign
  sys_clk_timer_s1_firsttransfer <= A_WE_StdLogic((std_logic'(sys_clk_timer_s1_begins_xfer) = '1'), sys_clk_timer_s1_unreg_firsttransfer, sys_clk_timer_s1_reg_firsttransfer);
  --sys_clk_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  sys_clk_timer_s1_unreg_firsttransfer <= NOT ((sys_clk_timer_s1_slavearbiterlockenable AND sys_clk_timer_s1_any_continuerequest));
  --sys_clk_timer_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sys_clk_timer_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(sys_clk_timer_s1_begins_xfer) = '1' then 
        sys_clk_timer_s1_reg_firsttransfer <= sys_clk_timer_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --sys_clk_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  sys_clk_timer_s1_beginbursttransfer_internal <= sys_clk_timer_s1_begins_xfer;
  --~sys_clk_timer_s1_write_n assignment, which is an e_mux
  sys_clk_timer_s1_write_n <= NOT ((internal_cpu_data_master_granted_sys_clk_timer_s1 AND cpu_data_master_write));
  shifted_address_to_sys_clk_timer_s1_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --sys_clk_timer_s1_address mux, which is an e_mux
  sys_clk_timer_s1_address <= A_EXT (A_SRL(shifted_address_to_sys_clk_timer_s1_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010")), 3);
  --d1_sys_clk_timer_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_sys_clk_timer_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_sys_clk_timer_s1_end_xfer <= sys_clk_timer_s1_end_xfer;
    end if;

  end process;

  --sys_clk_timer_s1_waits_for_read in a cycle, which is an e_mux
  sys_clk_timer_s1_waits_for_read <= sys_clk_timer_s1_in_a_read_cycle AND sys_clk_timer_s1_begins_xfer;
  --sys_clk_timer_s1_in_a_read_cycle assignment, which is an e_assign
  sys_clk_timer_s1_in_a_read_cycle <= internal_cpu_data_master_granted_sys_clk_timer_s1 AND cpu_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= sys_clk_timer_s1_in_a_read_cycle;
  --sys_clk_timer_s1_waits_for_write in a cycle, which is an e_mux
  sys_clk_timer_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(sys_clk_timer_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --sys_clk_timer_s1_in_a_write_cycle assignment, which is an e_assign
  sys_clk_timer_s1_in_a_write_cycle <= internal_cpu_data_master_granted_sys_clk_timer_s1 AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= sys_clk_timer_s1_in_a_write_cycle;
  wait_for_sys_clk_timer_s1_counter <= std_logic'('0');
  --assign sys_clk_timer_s1_irq_from_sa = sys_clk_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  sys_clk_timer_s1_irq_from_sa <= sys_clk_timer_s1_irq;
  --vhdl renameroo for output signals
  cpu_data_master_granted_sys_clk_timer_s1 <= internal_cpu_data_master_granted_sys_clk_timer_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_sys_clk_timer_s1 <= internal_cpu_data_master_qualified_request_sys_clk_timer_s1;
  --vhdl renameroo for output signals
  cpu_data_master_requests_sys_clk_timer_s1 <= internal_cpu_data_master_requests_sys_clk_timer_s1;
--synthesis translate_off
    --sys_clk_timer/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sysid_control_slave_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sysid_control_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

              -- outputs:
                 signal cpu_data_master_granted_sysid_control_slave : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_sysid_control_slave : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_sysid_control_slave : OUT STD_LOGIC;
                 signal cpu_data_master_requests_sysid_control_slave : OUT STD_LOGIC;
                 signal d1_sysid_control_slave_end_xfer : OUT STD_LOGIC;
                 signal sysid_control_slave_address : OUT STD_LOGIC;
                 signal sysid_control_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity sysid_control_slave_arbitrator;


architecture europa of sysid_control_slave_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_sysid_control_slave :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_sysid_control_slave :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_sysid_control_slave :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_sysid_control_slave :  STD_LOGIC;
                signal internal_cpu_data_master_requests_sysid_control_slave :  STD_LOGIC;
                signal shifted_address_to_sysid_control_slave_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal sysid_control_slave_allgrants :  STD_LOGIC;
                signal sysid_control_slave_allow_new_arb_cycle :  STD_LOGIC;
                signal sysid_control_slave_any_bursting_master_saved_grant :  STD_LOGIC;
                signal sysid_control_slave_any_continuerequest :  STD_LOGIC;
                signal sysid_control_slave_arb_counter_enable :  STD_LOGIC;
                signal sysid_control_slave_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal sysid_control_slave_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal sysid_control_slave_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal sysid_control_slave_beginbursttransfer_internal :  STD_LOGIC;
                signal sysid_control_slave_begins_xfer :  STD_LOGIC;
                signal sysid_control_slave_end_xfer :  STD_LOGIC;
                signal sysid_control_slave_firsttransfer :  STD_LOGIC;
                signal sysid_control_slave_grant_vector :  STD_LOGIC;
                signal sysid_control_slave_in_a_read_cycle :  STD_LOGIC;
                signal sysid_control_slave_in_a_write_cycle :  STD_LOGIC;
                signal sysid_control_slave_master_qreq_vector :  STD_LOGIC;
                signal sysid_control_slave_non_bursting_master_requests :  STD_LOGIC;
                signal sysid_control_slave_reg_firsttransfer :  STD_LOGIC;
                signal sysid_control_slave_slavearbiterlockenable :  STD_LOGIC;
                signal sysid_control_slave_slavearbiterlockenable2 :  STD_LOGIC;
                signal sysid_control_slave_unreg_firsttransfer :  STD_LOGIC;
                signal sysid_control_slave_waits_for_read :  STD_LOGIC;
                signal sysid_control_slave_waits_for_write :  STD_LOGIC;
                signal wait_for_sysid_control_slave_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT sysid_control_slave_end_xfer;
    end if;

  end process;

  sysid_control_slave_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_data_master_qualified_request_sysid_control_slave);
  --assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  sysid_control_slave_readdata_from_sa <= sysid_control_slave_readdata;
  internal_cpu_data_master_requests_sysid_control_slave <= ((to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 3) & std_logic_vector'("000")) = std_logic_vector'("10000100100000100010111000")))) AND ((cpu_data_master_read OR cpu_data_master_write)))) AND cpu_data_master_read;
  --sysid_control_slave_arb_share_counter set values, which is an e_mux
  sysid_control_slave_arb_share_set_values <= std_logic_vector'("001");
  --sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  sysid_control_slave_non_bursting_master_requests <= internal_cpu_data_master_requests_sysid_control_slave;
  --sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  sysid_control_slave_any_bursting_master_saved_grant <= std_logic'('0');
  --sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  sysid_control_slave_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(sysid_control_slave_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (sysid_control_slave_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(sysid_control_slave_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (sysid_control_slave_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --sysid_control_slave_allgrants all slave grants, which is an e_mux
  sysid_control_slave_allgrants <= sysid_control_slave_grant_vector;
  --sysid_control_slave_end_xfer assignment, which is an e_assign
  sysid_control_slave_end_xfer <= NOT ((sysid_control_slave_waits_for_read OR sysid_control_slave_waits_for_write));
  --end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_sysid_control_slave <= sysid_control_slave_end_xfer AND (((NOT sysid_control_slave_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  sysid_control_slave_arb_counter_enable <= ((end_xfer_arb_share_counter_term_sysid_control_slave AND sysid_control_slave_allgrants)) OR ((end_xfer_arb_share_counter_term_sysid_control_slave AND NOT sysid_control_slave_non_bursting_master_requests));
  --sysid_control_slave_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sysid_control_slave_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(sysid_control_slave_arb_counter_enable) = '1' then 
        sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sysid_control_slave_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((sysid_control_slave_master_qreq_vector AND end_xfer_arb_share_counter_term_sysid_control_slave)) OR ((end_xfer_arb_share_counter_term_sysid_control_slave AND NOT sysid_control_slave_non_bursting_master_requests)))) = '1' then 
        sysid_control_slave_slavearbiterlockenable <= or_reduce(sysid_control_slave_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master sysid/control_slave arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= sysid_control_slave_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  sysid_control_slave_slavearbiterlockenable2 <= or_reduce(sysid_control_slave_arb_share_counter_next_value);
  --cpu/data_master sysid/control_slave arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= sysid_control_slave_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  sysid_control_slave_any_continuerequest <= std_logic'('1');
  --cpu_data_master_continuerequest continued request, which is an e_assign
  cpu_data_master_continuerequest <= std_logic'('1');
  internal_cpu_data_master_qualified_request_sysid_control_slave <= internal_cpu_data_master_requests_sysid_control_slave;
  --master is always granted when requested
  internal_cpu_data_master_granted_sysid_control_slave <= internal_cpu_data_master_qualified_request_sysid_control_slave;
  --cpu/data_master saved-grant sysid/control_slave, which is an e_assign
  cpu_data_master_saved_grant_sysid_control_slave <= internal_cpu_data_master_requests_sysid_control_slave;
  --allow new arb cycle for sysid/control_slave, which is an e_assign
  sysid_control_slave_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  sysid_control_slave_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  sysid_control_slave_master_qreq_vector <= std_logic'('1');
  --sysid_control_slave_firsttransfer first transaction, which is an e_assign
  sysid_control_slave_firsttransfer <= A_WE_StdLogic((std_logic'(sysid_control_slave_begins_xfer) = '1'), sysid_control_slave_unreg_firsttransfer, sysid_control_slave_reg_firsttransfer);
  --sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  sysid_control_slave_unreg_firsttransfer <= NOT ((sysid_control_slave_slavearbiterlockenable AND sysid_control_slave_any_continuerequest));
  --sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sysid_control_slave_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(sysid_control_slave_begins_xfer) = '1' then 
        sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  sysid_control_slave_beginbursttransfer_internal <= sysid_control_slave_begins_xfer;
  shifted_address_to_sysid_control_slave_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --sysid_control_slave_address mux, which is an e_mux
  sysid_control_slave_address <= Vector_To_Std_Logic(A_SRL(shifted_address_to_sysid_control_slave_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010")));
  --d1_sysid_control_slave_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_sysid_control_slave_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end if;

  end process;

  --sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  sysid_control_slave_waits_for_read <= sysid_control_slave_in_a_read_cycle AND sysid_control_slave_begins_xfer;
  --sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  sysid_control_slave_in_a_read_cycle <= internal_cpu_data_master_granted_sysid_control_slave AND cpu_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= sysid_control_slave_in_a_read_cycle;
  --sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  sysid_control_slave_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(sysid_control_slave_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  sysid_control_slave_in_a_write_cycle <= internal_cpu_data_master_granted_sysid_control_slave AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= sysid_control_slave_in_a_write_cycle;
  wait_for_sysid_control_slave_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_data_master_granted_sysid_control_slave <= internal_cpu_data_master_granted_sysid_control_slave;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_sysid_control_slave <= internal_cpu_data_master_qualified_request_sysid_control_slave;
  --vhdl renameroo for output signals
  cpu_data_master_requests_sysid_control_slave <= internal_cpu_data_master_requests_sysid_control_slave;
--synthesis translate_off
    --sysid/control_slave enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity uart1_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                 signal cpu_data_master_read : IN STD_LOGIC;
                 signal cpu_data_master_write : IN STD_LOGIC;
                 signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;
                 signal uart1_s1_dataavailable : IN STD_LOGIC;
                 signal uart1_s1_irq : IN STD_LOGIC;
                 signal uart1_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal uart1_s1_readyfordata : IN STD_LOGIC;

              -- outputs:
                 signal cpu_data_master_granted_uart1_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_qualified_request_uart1_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_read_data_valid_uart1_s1 : OUT STD_LOGIC;
                 signal cpu_data_master_requests_uart1_s1 : OUT STD_LOGIC;
                 signal d1_uart1_s1_end_xfer : OUT STD_LOGIC;
                 signal uart1_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal uart1_s1_begintransfer : OUT STD_LOGIC;
                 signal uart1_s1_chipselect : OUT STD_LOGIC;
                 signal uart1_s1_dataavailable_from_sa : OUT STD_LOGIC;
                 signal uart1_s1_irq_from_sa : OUT STD_LOGIC;
                 signal uart1_s1_read_n : OUT STD_LOGIC;
                 signal uart1_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal uart1_s1_readyfordata_from_sa : OUT STD_LOGIC;
                 signal uart1_s1_reset_n : OUT STD_LOGIC;
                 signal uart1_s1_write_n : OUT STD_LOGIC;
                 signal uart1_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
              );
end entity uart1_s1_arbitrator;


architecture europa of uart1_s1_arbitrator is
                signal cpu_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_data_master_continuerequest :  STD_LOGIC;
                signal cpu_data_master_saved_grant_uart1_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_uart1_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_data_master_granted_uart1_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_qualified_request_uart1_s1 :  STD_LOGIC;
                signal internal_cpu_data_master_requests_uart1_s1 :  STD_LOGIC;
                signal shifted_address_to_uart1_s1_from_cpu_data_master :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal uart1_s1_allgrants :  STD_LOGIC;
                signal uart1_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal uart1_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal uart1_s1_any_continuerequest :  STD_LOGIC;
                signal uart1_s1_arb_counter_enable :  STD_LOGIC;
                signal uart1_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal uart1_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal uart1_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal uart1_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal uart1_s1_begins_xfer :  STD_LOGIC;
                signal uart1_s1_end_xfer :  STD_LOGIC;
                signal uart1_s1_firsttransfer :  STD_LOGIC;
                signal uart1_s1_grant_vector :  STD_LOGIC;
                signal uart1_s1_in_a_read_cycle :  STD_LOGIC;
                signal uart1_s1_in_a_write_cycle :  STD_LOGIC;
                signal uart1_s1_master_qreq_vector :  STD_LOGIC;
                signal uart1_s1_non_bursting_master_requests :  STD_LOGIC;
                signal uart1_s1_reg_firsttransfer :  STD_LOGIC;
                signal uart1_s1_slavearbiterlockenable :  STD_LOGIC;
                signal uart1_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal uart1_s1_unreg_firsttransfer :  STD_LOGIC;
                signal uart1_s1_waits_for_read :  STD_LOGIC;
                signal uart1_s1_waits_for_write :  STD_LOGIC;
                signal wait_for_uart1_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT uart1_s1_end_xfer;
    end if;

  end process;

  uart1_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_data_master_qualified_request_uart1_s1);
  --assign uart1_s1_readdata_from_sa = uart1_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  uart1_s1_readdata_from_sa <= uart1_s1_readdata;
  internal_cpu_data_master_requests_uart1_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_data_master_address_to_slave(25 DOWNTO 5) & std_logic_vector'("00000")) = std_logic_vector'("10000100100000100001000000")))) AND ((cpu_data_master_read OR cpu_data_master_write));
  --assign uart1_s1_dataavailable_from_sa = uart1_s1_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  uart1_s1_dataavailable_from_sa <= uart1_s1_dataavailable;
  --assign uart1_s1_readyfordata_from_sa = uart1_s1_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  uart1_s1_readyfordata_from_sa <= uart1_s1_readyfordata;
  --uart1_s1_arb_share_counter set values, which is an e_mux
  uart1_s1_arb_share_set_values <= std_logic_vector'("001");
  --uart1_s1_non_bursting_master_requests mux, which is an e_mux
  uart1_s1_non_bursting_master_requests <= internal_cpu_data_master_requests_uart1_s1;
  --uart1_s1_any_bursting_master_saved_grant mux, which is an e_mux
  uart1_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --uart1_s1_arb_share_counter_next_value assignment, which is an e_assign
  uart1_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(uart1_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (uart1_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(uart1_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (uart1_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --uart1_s1_allgrants all slave grants, which is an e_mux
  uart1_s1_allgrants <= uart1_s1_grant_vector;
  --uart1_s1_end_xfer assignment, which is an e_assign
  uart1_s1_end_xfer <= NOT ((uart1_s1_waits_for_read OR uart1_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_uart1_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_uart1_s1 <= uart1_s1_end_xfer AND (((NOT uart1_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --uart1_s1_arb_share_counter arbitration counter enable, which is an e_assign
  uart1_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_uart1_s1 AND uart1_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_uart1_s1 AND NOT uart1_s1_non_bursting_master_requests));
  --uart1_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      uart1_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(uart1_s1_arb_counter_enable) = '1' then 
        uart1_s1_arb_share_counter <= uart1_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --uart1_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      uart1_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((uart1_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_uart1_s1)) OR ((end_xfer_arb_share_counter_term_uart1_s1 AND NOT uart1_s1_non_bursting_master_requests)))) = '1' then 
        uart1_s1_slavearbiterlockenable <= or_reduce(uart1_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu/data_master uart1/s1 arbiterlock, which is an e_assign
  cpu_data_master_arbiterlock <= uart1_s1_slavearbiterlockenable AND cpu_data_master_continuerequest;
  --uart1_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  uart1_s1_slavearbiterlockenable2 <= or_reduce(uart1_s1_arb_share_counter_next_value);
  --cpu/data_master uart1/s1 arbiterlock2, which is an e_assign
  cpu_data_master_arbiterlock2 <= uart1_s1_slavearbiterlockenable2 AND cpu_data_master_continuerequest;
  --uart1_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  uart1_s1_any_continuerequest <= std_logic'('1');
  --cpu_data_master_continuerequest continued request, which is an e_assign
  cpu_data_master_continuerequest <= std_logic'('1');
  internal_cpu_data_master_qualified_request_uart1_s1 <= internal_cpu_data_master_requests_uart1_s1;
  --uart1_s1_writedata mux, which is an e_mux
  uart1_s1_writedata <= cpu_data_master_writedata (15 DOWNTO 0);
  --master is always granted when requested
  internal_cpu_data_master_granted_uart1_s1 <= internal_cpu_data_master_qualified_request_uart1_s1;
  --cpu/data_master saved-grant uart1/s1, which is an e_assign
  cpu_data_master_saved_grant_uart1_s1 <= internal_cpu_data_master_requests_uart1_s1;
  --allow new arb cycle for uart1/s1, which is an e_assign
  uart1_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  uart1_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  uart1_s1_master_qreq_vector <= std_logic'('1');
  uart1_s1_begintransfer <= uart1_s1_begins_xfer;
  --uart1_s1_reset_n assignment, which is an e_assign
  uart1_s1_reset_n <= reset_n;
  uart1_s1_chipselect <= internal_cpu_data_master_granted_uart1_s1;
  --uart1_s1_firsttransfer first transaction, which is an e_assign
  uart1_s1_firsttransfer <= A_WE_StdLogic((std_logic'(uart1_s1_begins_xfer) = '1'), uart1_s1_unreg_firsttransfer, uart1_s1_reg_firsttransfer);
  --uart1_s1_unreg_firsttransfer first transaction, which is an e_assign
  uart1_s1_unreg_firsttransfer <= NOT ((uart1_s1_slavearbiterlockenable AND uart1_s1_any_continuerequest));
  --uart1_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      uart1_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(uart1_s1_begins_xfer) = '1' then 
        uart1_s1_reg_firsttransfer <= uart1_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --uart1_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  uart1_s1_beginbursttransfer_internal <= uart1_s1_begins_xfer;
  --~uart1_s1_read_n assignment, which is an e_mux
  uart1_s1_read_n <= NOT ((internal_cpu_data_master_granted_uart1_s1 AND cpu_data_master_read));
  --~uart1_s1_write_n assignment, which is an e_mux
  uart1_s1_write_n <= NOT ((internal_cpu_data_master_granted_uart1_s1 AND cpu_data_master_write));
  shifted_address_to_uart1_s1_from_cpu_data_master <= cpu_data_master_address_to_slave;
  --uart1_s1_address mux, which is an e_mux
  uart1_s1_address <= A_EXT (A_SRL(shifted_address_to_uart1_s1_from_cpu_data_master,std_logic_vector'("00000000000000000000000000000010")), 3);
  --d1_uart1_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_uart1_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_uart1_s1_end_xfer <= uart1_s1_end_xfer;
    end if;

  end process;

  --uart1_s1_waits_for_read in a cycle, which is an e_mux
  uart1_s1_waits_for_read <= uart1_s1_in_a_read_cycle AND uart1_s1_begins_xfer;
  --uart1_s1_in_a_read_cycle assignment, which is an e_assign
  uart1_s1_in_a_read_cycle <= internal_cpu_data_master_granted_uart1_s1 AND cpu_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= uart1_s1_in_a_read_cycle;
  --uart1_s1_waits_for_write in a cycle, which is an e_mux
  uart1_s1_waits_for_write <= uart1_s1_in_a_write_cycle AND uart1_s1_begins_xfer;
  --uart1_s1_in_a_write_cycle assignment, which is an e_assign
  uart1_s1_in_a_write_cycle <= internal_cpu_data_master_granted_uart1_s1 AND cpu_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= uart1_s1_in_a_write_cycle;
  wait_for_uart1_s1_counter <= std_logic'('0');
  --assign uart1_s1_irq_from_sa = uart1_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  uart1_s1_irq_from_sa <= uart1_s1_irq;
  --vhdl renameroo for output signals
  cpu_data_master_granted_uart1_s1 <= internal_cpu_data_master_granted_uart1_s1;
  --vhdl renameroo for output signals
  cpu_data_master_qualified_request_uart1_s1 <= internal_cpu_data_master_qualified_request_uart1_s1;
  --vhdl renameroo for output signals
  cpu_data_master_requests_uart1_s1 <= internal_cpu_data_master_requests_uart1_s1;
--synthesis translate_off
    --uart1/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity NiosII_stratix_1s10_standard_reset_pll_c0_out_domain_synch_module is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal data_in : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal data_out : OUT STD_LOGIC
              );
end entity NiosII_stratix_1s10_standard_reset_pll_c0_out_domain_synch_module;


architecture europa of NiosII_stratix_1s10_standard_reset_pll_c0_out_domain_synch_module is
                signal data_in_d1 :  STD_LOGIC;
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of data_in_d1 : signal is "{-from ""*""} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of data_out : signal is "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101";

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_in_d1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      data_in_d1 <= data_in;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_out <= std_logic'('0');
    elsif clk'event and clk = '1' then
      data_out <= data_in_d1;
    end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity NiosII_stratix_1s10_standard_reset_clk_domain_synch_module is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal data_in : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal data_out : OUT STD_LOGIC
              );
end entity NiosII_stratix_1s10_standard_reset_clk_domain_synch_module;


architecture europa of NiosII_stratix_1s10_standard_reset_clk_domain_synch_module is
                signal data_in_d1 :  STD_LOGIC;
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of data_in_d1 : signal is "{-from ""*""} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of data_out : signal is "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101";

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_in_d1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      data_in_d1 <= data_in;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_out <= std_logic'('0');
    elsif clk'event and clk = '1' then
      data_out <= data_in_d1;
    end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity NiosII_stratix_1s10_standard is 
        port (
              -- 1) global signals:
                 signal clk : IN STD_LOGIC;
                 signal pll_c0_out : OUT STD_LOGIC;
                 signal pll_e0_out : OUT STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- the_button_pio
                 signal in_port_to_the_button_pio : IN STD_LOGIC_VECTOR (3 DOWNTO 0);

              -- the_ext_ram_bus_avalon_slave
                 signal be_n_to_the_ext_ram : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal byteenablen_to_the_lan91c111 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal ext_ram_bus_address : OUT STD_LOGIC_VECTOR (22 DOWNTO 0);
                 signal ext_ram_bus_data : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal ior_n_to_the_lan91c111 : OUT STD_LOGIC;
                 signal iow_n_to_the_lan91c111 : OUT STD_LOGIC;
                 signal irq_from_the_lan91c111 : IN STD_LOGIC;
                 signal read_n_to_the_ext_flash : OUT STD_LOGIC;
                 signal read_n_to_the_ext_ram : OUT STD_LOGIC;
                 signal reset_to_the_lan91c111 : OUT STD_LOGIC;
                 signal select_n_to_the_ext_flash : OUT STD_LOGIC;
                 signal select_n_to_the_ext_ram : OUT STD_LOGIC;
                 signal write_n_to_the_ext_flash : OUT STD_LOGIC;
                 signal write_n_to_the_ext_ram : OUT STD_LOGIC;

              -- the_lcd_display
                 signal LCD_E_from_the_lcd_display : OUT STD_LOGIC;
                 signal LCD_RS_from_the_lcd_display : OUT STD_LOGIC;
                 signal LCD_RW_from_the_lcd_display : OUT STD_LOGIC;
                 signal LCD_data_to_and_from_the_lcd_display : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);

              -- the_led_pio
                 signal out_port_from_the_led_pio : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);

              -- the_reconfig_request_pio
                 signal bidir_port_to_and_from_the_reconfig_request_pio : INOUT STD_LOGIC;

              -- the_sdram
                 signal zs_addr_from_the_sdram : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
                 signal zs_ba_from_the_sdram : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal zs_cas_n_from_the_sdram : OUT STD_LOGIC;
                 signal zs_cke_from_the_sdram : OUT STD_LOGIC;
                 signal zs_cs_n_from_the_sdram : OUT STD_LOGIC;
                 signal zs_dq_to_and_from_the_sdram : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal zs_dqm_from_the_sdram : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal zs_ras_n_from_the_sdram : OUT STD_LOGIC;
                 signal zs_we_n_from_the_sdram : OUT STD_LOGIC;

              -- the_seven_seg_pio
                 signal out_port_from_the_seven_seg_pio : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- the_uart1
                 signal rxd_to_the_uart1 : IN STD_LOGIC;
                 signal txd_from_the_uart1 : OUT STD_LOGIC
              );
end entity NiosII_stratix_1s10_standard;


architecture europa of NiosII_stratix_1s10_standard is
component NiosII_stratix_1s10_standard_clock_0_in_arbitrator is 
           port (
                 -- inputs:
                    signal NiosII_stratix_1s10_standard_clock_0_in_endofpacket : IN STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_in_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_in_waitrequest : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal NiosII_stratix_1s10_standard_clock_0_in_address : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_in_byteenable : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_in_endofpacket_from_sa : OUT STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_in_nativeaddress : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_in_read : OUT STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_in_reset_n : OUT STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa : OUT STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_in_write : OUT STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_in_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_NiosII_stratix_1s10_standard_clock_0_in : OUT STD_LOGIC;
                    signal cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in : OUT STD_LOGIC;
                    signal d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer : OUT STD_LOGIC
                 );
end component NiosII_stratix_1s10_standard_clock_0_in_arbitrator;

component NiosII_stratix_1s10_standard_clock_0_out_arbitrator is 
           port (
                 -- inputs:
                    signal NiosII_stratix_1s10_standard_clock_0_out_address : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_out_byteenable : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 : IN STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 : IN STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_read : IN STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_read_data_valid_pll_s1 : IN STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1 : IN STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_write : IN STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal d1_pll_s1_end_xfer : IN STD_LOGIC;
                    signal pll_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal NiosII_stratix_1s10_standard_clock_0_out_address_to_slave : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_out_readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_out_reset_n : OUT STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_waitrequest : OUT STD_LOGIC
                 );
end component NiosII_stratix_1s10_standard_clock_0_out_arbitrator;

component NiosII_stratix_1s10_standard_clock_0 is 
           port (
                 -- inputs:
                    signal master_clk : IN STD_LOGIC;
                    signal master_endofpacket : IN STD_LOGIC;
                    signal master_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal master_reset_n : IN STD_LOGIC;
                    signal master_waitrequest : IN STD_LOGIC;
                    signal slave_address : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal slave_byteenable : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal slave_clk : IN STD_LOGIC;
                    signal slave_nativeaddress : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal slave_read : IN STD_LOGIC;
                    signal slave_reset_n : IN STD_LOGIC;
                    signal slave_write : IN STD_LOGIC;
                    signal slave_writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal master_address : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal master_byteenable : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal master_nativeaddress : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal master_read : OUT STD_LOGIC;
                    signal master_write : OUT STD_LOGIC;
                    signal master_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal slave_endofpacket : OUT STD_LOGIC;
                    signal slave_readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal slave_waitrequest : OUT STD_LOGIC
                 );
end component NiosII_stratix_1s10_standard_clock_0;

component button_pio_s1_arbitrator is 
           port (
                 -- inputs:
                    signal button_pio_s1_irq : IN STD_LOGIC;
                    signal button_pio_s1_readdata : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal button_pio_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal button_pio_s1_chipselect : OUT STD_LOGIC;
                    signal button_pio_s1_irq_from_sa : OUT STD_LOGIC;
                    signal button_pio_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal button_pio_s1_reset_n : OUT STD_LOGIC;
                    signal button_pio_s1_write_n : OUT STD_LOGIC;
                    signal button_pio_s1_writedata : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_data_master_granted_button_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_button_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_button_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_requests_button_pio_s1 : OUT STD_LOGIC;
                    signal d1_button_pio_s1_end_xfer : OUT STD_LOGIC
                 );
end component button_pio_s1_arbitrator;

component button_pio is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal in_port : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (3 DOWNTO 0);

                 -- outputs:
                    signal irq : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
                 );
end component button_pio;

component cpu_jtag_debug_module_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_data_master_debugaccess : IN STD_LOGIC;
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_instruction_master_latency_counter : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_instruction_master_read : IN STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_sdram_s1_shift_register : IN STD_LOGIC;
                    signal cpu_jtag_debug_module_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_jtag_debug_module_resetrequest : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_data_master_granted_cpu_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_cpu_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_cpu_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_data_master_requests_cpu_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_instruction_master_granted_cpu_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_cpu_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_cpu_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_instruction_master_requests_cpu_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_jtag_debug_module_address : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal cpu_jtag_debug_module_begintransfer : OUT STD_LOGIC;
                    signal cpu_jtag_debug_module_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_jtag_debug_module_chipselect : OUT STD_LOGIC;
                    signal cpu_jtag_debug_module_debugaccess : OUT STD_LOGIC;
                    signal cpu_jtag_debug_module_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_jtag_debug_module_reset : OUT STD_LOGIC;
                    signal cpu_jtag_debug_module_reset_n : OUT STD_LOGIC;
                    signal cpu_jtag_debug_module_resetrequest_from_sa : OUT STD_LOGIC;
                    signal cpu_jtag_debug_module_write : OUT STD_LOGIC;
                    signal cpu_jtag_debug_module_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d1_cpu_jtag_debug_module_end_xfer : OUT STD_LOGIC
                 );
end component cpu_jtag_debug_module_arbitrator;

component cpu_data_master_arbitrator is 
           port (
                 -- inputs:
                    signal NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa : IN STD_LOGIC;
                    signal button_pio_s1_irq_from_sa : IN STD_LOGIC;
                    signal button_pio_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_byteenable_ext_flash_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in : IN STD_LOGIC;
                    signal cpu_data_master_granted_button_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_cpu_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_data_master_granted_ext_flash_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_ext_ram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_high_res_timer_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_jtag_uart_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_data_master_granted_lan91c111_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_lcd_display_control_slave : IN STD_LOGIC;
                    signal cpu_data_master_granted_led_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_onchip_ram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_reconfig_request_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_sdram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_seven_seg_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_sys_clk_timer_s1 : IN STD_LOGIC;
                    signal cpu_data_master_granted_sysid_control_slave : IN STD_LOGIC;
                    signal cpu_data_master_granted_uart1_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_button_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_cpu_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_ext_flash_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_ext_ram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_high_res_timer_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_lan91c111_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_lcd_display_control_slave : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_led_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_onchip_ram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_reconfig_request_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_sdram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_seven_seg_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_sys_clk_timer_s1 : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_sysid_control_slave : IN STD_LOGIC;
                    signal cpu_data_master_qualified_request_uart1_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_NiosII_stratix_1s10_standard_clock_0_in : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_button_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_cpu_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_ext_flash_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_ext_ram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_high_res_timer_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_lan91c111_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_lcd_display_control_slave : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_led_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_onchip_ram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_reconfig_request_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_sdram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_sdram_s1_shift_register : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_seven_seg_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_sys_clk_timer_s1 : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_sysid_control_slave : IN STD_LOGIC;
                    signal cpu_data_master_read_data_valid_uart1_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in : IN STD_LOGIC;
                    signal cpu_data_master_requests_button_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_cpu_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_data_master_requests_ext_flash_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_ext_ram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_high_res_timer_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_jtag_uart_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_data_master_requests_lan91c111_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_lcd_display_control_slave : IN STD_LOGIC;
                    signal cpu_data_master_requests_led_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_onchip_ram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_reconfig_request_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_sdram_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_seven_seg_pio_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_sys_clk_timer_s1 : IN STD_LOGIC;
                    signal cpu_data_master_requests_sysid_control_slave : IN STD_LOGIC;
                    signal cpu_data_master_requests_uart1_s1 : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer : IN STD_LOGIC;
                    signal d1_button_pio_s1_end_xfer : IN STD_LOGIC;
                    signal d1_cpu_jtag_debug_module_end_xfer : IN STD_LOGIC;
                    signal d1_ext_ram_bus_avalon_slave_end_xfer : IN STD_LOGIC;
                    signal d1_high_res_timer_s1_end_xfer : IN STD_LOGIC;
                    signal d1_irq_from_the_lan91c111 : IN STD_LOGIC;
                    signal d1_jtag_uart_avalon_jtag_slave_end_xfer : IN STD_LOGIC;
                    signal d1_lcd_display_control_slave_end_xfer : IN STD_LOGIC;
                    signal d1_led_pio_s1_end_xfer : IN STD_LOGIC;
                    signal d1_onchip_ram_s1_end_xfer : IN STD_LOGIC;
                    signal d1_reconfig_request_pio_s1_end_xfer : IN STD_LOGIC;
                    signal d1_sdram_s1_end_xfer : IN STD_LOGIC;
                    signal d1_seven_seg_pio_s1_end_xfer : IN STD_LOGIC;
                    signal d1_sys_clk_timer_s1_end_xfer : IN STD_LOGIC;
                    signal d1_sysid_control_slave_end_xfer : IN STD_LOGIC;
                    signal d1_uart1_s1_end_xfer : IN STD_LOGIC;
                    signal ext_flash_s1_wait_counter_eq_0 : IN STD_LOGIC;
                    signal ext_flash_s1_wait_counter_eq_1 : IN STD_LOGIC;
                    signal high_res_timer_s1_irq_from_sa : IN STD_LOGIC;
                    signal high_res_timer_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal incoming_ext_ram_bus_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal incoming_ext_ram_bus_data_with_Xs_converted_to_0 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal jtag_uart_avalon_jtag_slave_irq_from_sa : IN STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_avalon_jtag_slave_waitrequest_from_sa : IN STD_LOGIC;
                    signal lan91c111_s1_wait_counter_eq_0 : IN STD_LOGIC;
                    signal lan91c111_s1_wait_counter_eq_1 : IN STD_LOGIC;
                    signal lcd_display_control_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal lcd_display_control_slave_wait_counter_eq_0 : IN STD_LOGIC;
                    signal lcd_display_control_slave_wait_counter_eq_1 : IN STD_LOGIC;
                    signal led_pio_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal onchip_ram_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reconfig_request_pio_s1_readdata_from_sa : IN STD_LOGIC;
                    signal registered_cpu_data_master_read_data_valid_ext_flash_s1 : IN STD_LOGIC;
                    signal registered_cpu_data_master_read_data_valid_ext_ram_s1 : IN STD_LOGIC;
                    signal registered_cpu_data_master_read_data_valid_lan91c111_s1 : IN STD_LOGIC;
                    signal registered_cpu_data_master_read_data_valid_onchip_ram_s1 : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sdram_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal sdram_s1_waitrequest_from_sa : IN STD_LOGIC;
                    signal seven_seg_pio_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal sys_clk_timer_s1_irq_from_sa : IN STD_LOGIC;
                    signal sys_clk_timer_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal sysid_control_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal uart1_s1_irq_from_sa : IN STD_LOGIC;
                    signal uart1_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal cpu_data_master_address_to_slave : OUT STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_dbs_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_data_master_dbs_write_8 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal cpu_data_master_irq : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_data_master_no_byte_enables_and_last_term : OUT STD_LOGIC;
                    signal cpu_data_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_data_master_waitrequest : OUT STD_LOGIC
                 );
end component cpu_data_master_arbitrator;

component cpu_instruction_master_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_instruction_master_address : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_instruction_master_granted_cpu_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_instruction_master_granted_ext_flash_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_granted_ext_ram_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_granted_lan91c111_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_granted_onchip_ram_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_granted_sdram_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_cpu_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_ext_flash_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_ext_ram_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_lan91c111_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_onchip_ram_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_sdram_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_read : IN STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_cpu_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_ext_flash_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_ext_ram_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_lan91c111_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_onchip_ram_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_sdram_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_sdram_s1_shift_register : IN STD_LOGIC;
                    signal cpu_instruction_master_requests_cpu_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_instruction_master_requests_ext_flash_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_requests_ext_ram_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_requests_lan91c111_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_requests_onchip_ram_s1 : IN STD_LOGIC;
                    signal cpu_instruction_master_requests_sdram_s1 : IN STD_LOGIC;
                    signal cpu_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d1_cpu_jtag_debug_module_end_xfer : IN STD_LOGIC;
                    signal d1_ext_ram_bus_avalon_slave_end_xfer : IN STD_LOGIC;
                    signal d1_onchip_ram_s1_end_xfer : IN STD_LOGIC;
                    signal d1_sdram_s1_end_xfer : IN STD_LOGIC;
                    signal ext_flash_s1_wait_counter_eq_0 : IN STD_LOGIC;
                    signal ext_flash_s1_wait_counter_eq_1 : IN STD_LOGIC;
                    signal incoming_ext_ram_bus_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal lan91c111_s1_wait_counter_eq_0 : IN STD_LOGIC;
                    signal lan91c111_s1_wait_counter_eq_1 : IN STD_LOGIC;
                    signal onchip_ram_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;
                    signal sdram_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal sdram_s1_waitrequest_from_sa : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_instruction_master_address_to_slave : OUT STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_instruction_master_dbs_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_instruction_master_latency_counter : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_instruction_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_instruction_master_readdatavalid : OUT STD_LOGIC;
                    signal cpu_instruction_master_waitrequest : OUT STD_LOGIC
                 );
end component cpu_instruction_master_arbitrator;

component cpu is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal d_irq : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d_waitrequest : IN STD_LOGIC;
                    signal i_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal i_readdatavalid : IN STD_LOGIC;
                    signal i_waitrequest : IN STD_LOGIC;
                    signal jtag_debug_module_address : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal jtag_debug_module_begintransfer : IN STD_LOGIC;
                    signal jtag_debug_module_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal jtag_debug_module_clk : IN STD_LOGIC;
                    signal jtag_debug_module_debugaccess : IN STD_LOGIC;
                    signal jtag_debug_module_reset : IN STD_LOGIC;
                    signal jtag_debug_module_select : IN STD_LOGIC;
                    signal jtag_debug_module_write : IN STD_LOGIC;
                    signal jtag_debug_module_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal d_address : OUT STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal d_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal d_read : OUT STD_LOGIC;
                    signal d_write : OUT STD_LOGIC;
                    signal d_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal i_address : OUT STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal i_read : OUT STD_LOGIC;
                    signal jtag_debug_module_debugaccess_to_roms : OUT STD_LOGIC;
                    signal jtag_debug_module_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_debug_module_resetrequest : OUT STD_LOGIC
                 );
end component cpu;

component ext_ram_bus_avalon_slave_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_data_master_dbs_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_data_master_dbs_write_8 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal cpu_data_master_no_byte_enables_and_last_term : IN STD_LOGIC;
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_instruction_master_dbs_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_instruction_master_latency_counter : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_instruction_master_read : IN STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_sdram_s1_shift_register : IN STD_LOGIC;
                    signal irq_from_the_lan91c111 : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal be_n_to_the_ext_ram : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal byteenablen_to_the_lan91c111 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_data_master_byteenable_ext_flash_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_granted_ext_flash_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_granted_ext_ram_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_granted_lan91c111_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_ext_flash_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_ext_ram_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_lan91c111_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_ext_flash_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_ext_ram_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_lan91c111_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_requests_ext_flash_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_requests_ext_ram_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_requests_lan91c111_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_granted_ext_flash_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_granted_ext_ram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_granted_lan91c111_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_ext_flash_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_ext_ram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_lan91c111_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_ext_flash_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_ext_ram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_lan91c111_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_requests_ext_flash_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_requests_ext_ram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_requests_lan91c111_s1 : OUT STD_LOGIC;
                    signal d1_ext_ram_bus_avalon_slave_end_xfer : OUT STD_LOGIC;
                    signal d1_irq_from_the_lan91c111 : OUT STD_LOGIC;
                    signal ext_flash_s1_wait_counter_eq_0 : OUT STD_LOGIC;
                    signal ext_flash_s1_wait_counter_eq_1 : OUT STD_LOGIC;
                    signal ext_ram_bus_address : OUT STD_LOGIC_VECTOR (22 DOWNTO 0);
                    signal ext_ram_bus_data : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal incoming_ext_ram_bus_data : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal incoming_ext_ram_bus_data_with_Xs_converted_to_0 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal ior_n_to_the_lan91c111 : OUT STD_LOGIC;
                    signal iow_n_to_the_lan91c111 : OUT STD_LOGIC;
                    signal lan91c111_s1_wait_counter_eq_0 : OUT STD_LOGIC;
                    signal lan91c111_s1_wait_counter_eq_1 : OUT STD_LOGIC;
                    signal read_n_to_the_ext_flash : OUT STD_LOGIC;
                    signal read_n_to_the_ext_ram : OUT STD_LOGIC;
                    signal registered_cpu_data_master_read_data_valid_ext_flash_s1 : OUT STD_LOGIC;
                    signal registered_cpu_data_master_read_data_valid_ext_ram_s1 : OUT STD_LOGIC;
                    signal registered_cpu_data_master_read_data_valid_lan91c111_s1 : OUT STD_LOGIC;
                    signal reset_to_the_lan91c111 : OUT STD_LOGIC;
                    signal select_n_to_the_ext_flash : OUT STD_LOGIC;
                    signal select_n_to_the_ext_ram : OUT STD_LOGIC;
                    signal write_n_to_the_ext_flash : OUT STD_LOGIC;
                    signal write_n_to_the_ext_ram : OUT STD_LOGIC
                 );
end component ext_ram_bus_avalon_slave_arbitrator;

component ext_ram_bus is 
end component ext_ram_bus;

component ext_ram_bus_bridge_arbitrator is 
end component ext_ram_bus_bridge_arbitrator;

component high_res_timer_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal high_res_timer_s1_irq : IN STD_LOGIC;
                    signal high_res_timer_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_data_master_granted_high_res_timer_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_high_res_timer_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_high_res_timer_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_requests_high_res_timer_s1 : OUT STD_LOGIC;
                    signal d1_high_res_timer_s1_end_xfer : OUT STD_LOGIC;
                    signal high_res_timer_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal high_res_timer_s1_chipselect : OUT STD_LOGIC;
                    signal high_res_timer_s1_irq_from_sa : OUT STD_LOGIC;
                    signal high_res_timer_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal high_res_timer_s1_reset_n : OUT STD_LOGIC;
                    signal high_res_timer_s1_write_n : OUT STD_LOGIC;
                    signal high_res_timer_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component high_res_timer_s1_arbitrator;

component high_res_timer is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal irq : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component high_res_timer;

component jtag_uart_avalon_jtag_slave_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_avalon_jtag_slave_dataavailable : IN STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_irq : IN STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_avalon_jtag_slave_readyfordata : IN STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_waitrequest : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_data_master_granted_jtag_uart_avalon_jtag_slave : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave : OUT STD_LOGIC;
                    signal cpu_data_master_requests_jtag_uart_avalon_jtag_slave : OUT STD_LOGIC;
                    signal d1_jtag_uart_avalon_jtag_slave_end_xfer : OUT STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_address : OUT STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_chipselect : OUT STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_dataavailable_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_irq_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_read_n : OUT STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_avalon_jtag_slave_readyfordata_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_reset_n : OUT STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_waitrequest_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_write_n : OUT STD_LOGIC;
                    signal jtag_uart_avalon_jtag_slave_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component jtag_uart_avalon_jtag_slave_arbitrator;

component jtag_uart is 
           port (
                 -- inputs:
                    signal av_address : IN STD_LOGIC;
                    signal av_chipselect : IN STD_LOGIC;
                    signal av_read_n : IN STD_LOGIC;
                    signal av_write_n : IN STD_LOGIC;
                    signal av_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal rst_n : IN STD_LOGIC;

                 -- outputs:
                    signal av_irq : OUT STD_LOGIC;
                    signal av_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal av_waitrequest : OUT STD_LOGIC;
                    signal dataavailable : OUT STD_LOGIC;
                    signal readyfordata : OUT STD_LOGIC
                 );
end component jtag_uart;

component lcd_display_control_slave_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal lcd_display_control_slave_readdata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_data_master_granted_lcd_display_control_slave : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_lcd_display_control_slave : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_lcd_display_control_slave : OUT STD_LOGIC;
                    signal cpu_data_master_requests_lcd_display_control_slave : OUT STD_LOGIC;
                    signal d1_lcd_display_control_slave_end_xfer : OUT STD_LOGIC;
                    signal lcd_display_control_slave_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal lcd_display_control_slave_begintransfer : OUT STD_LOGIC;
                    signal lcd_display_control_slave_read : OUT STD_LOGIC;
                    signal lcd_display_control_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal lcd_display_control_slave_wait_counter_eq_0 : OUT STD_LOGIC;
                    signal lcd_display_control_slave_wait_counter_eq_1 : OUT STD_LOGIC;
                    signal lcd_display_control_slave_write : OUT STD_LOGIC;
                    signal lcd_display_control_slave_writedata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component lcd_display_control_slave_arbitrator;

component lcd_display is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal begintransfer : IN STD_LOGIC;
                    signal read : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- outputs:
                    signal LCD_E : OUT STD_LOGIC;
                    signal LCD_RS : OUT STD_LOGIC;
                    signal LCD_RW : OUT STD_LOGIC;
                    signal LCD_data : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal readdata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component lcd_display;

component led_pio_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal led_pio_s1_readdata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_data_master_granted_led_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_led_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_led_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_requests_led_pio_s1 : OUT STD_LOGIC;
                    signal d1_led_pio_s1_end_xfer : OUT STD_LOGIC;
                    signal led_pio_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal led_pio_s1_chipselect : OUT STD_LOGIC;
                    signal led_pio_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal led_pio_s1_reset_n : OUT STD_LOGIC;
                    signal led_pio_s1_write_n : OUT STD_LOGIC;
                    signal led_pio_s1_writedata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component led_pio_s1_arbitrator;

component led_pio is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- outputs:
                    signal out_port : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal readdata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component led_pio;

component onchip_ram_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_instruction_master_latency_counter : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_instruction_master_read : IN STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_sdram_s1_shift_register : IN STD_LOGIC;
                    signal onchip_ram_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_data_master_granted_onchip_ram_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_onchip_ram_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_onchip_ram_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_requests_onchip_ram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_granted_onchip_ram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_onchip_ram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_onchip_ram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_requests_onchip_ram_s1 : OUT STD_LOGIC;
                    signal d1_onchip_ram_s1_end_xfer : OUT STD_LOGIC;
                    signal onchip_ram_s1_address : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
                    signal onchip_ram_s1_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal onchip_ram_s1_chipselect : OUT STD_LOGIC;
                    signal onchip_ram_s1_clken : OUT STD_LOGIC;
                    signal onchip_ram_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal onchip_ram_s1_write : OUT STD_LOGIC;
                    signal onchip_ram_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal registered_cpu_data_master_read_data_valid_onchip_ram_s1 : OUT STD_LOGIC
                 );
end component onchip_ram_s1_arbitrator;

component onchip_ram is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
                    signal byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal clken : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component onchip_ram;

component pll_s1_arbitrator is 
           port (
                 -- inputs:
                    signal NiosII_stratix_1s10_standard_clock_0_out_address_to_slave : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_out_nativeaddress : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal NiosII_stratix_1s10_standard_clock_0_out_read : IN STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_write : IN STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal pll_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal pll_s1_resetrequest : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 : OUT STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 : OUT STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_read_data_valid_pll_s1 : OUT STD_LOGIC;
                    signal NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1 : OUT STD_LOGIC;
                    signal d1_pll_s1_end_xfer : OUT STD_LOGIC;
                    signal pll_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal pll_s1_chipselect : OUT STD_LOGIC;
                    signal pll_s1_read : OUT STD_LOGIC;
                    signal pll_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal pll_s1_reset_n : OUT STD_LOGIC;
                    signal pll_s1_resetrequest_from_sa : OUT STD_LOGIC;
                    signal pll_s1_write : OUT STD_LOGIC;
                    signal pll_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component pll_s1_arbitrator;

component pll is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal read : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal c0 : OUT STD_LOGIC;
                    signal e0 : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal resetrequest : OUT STD_LOGIC
                 );
end component pll;

component reconfig_request_pio_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reconfig_request_pio_s1_readdata : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_data_master_granted_reconfig_request_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_reconfig_request_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_reconfig_request_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_requests_reconfig_request_pio_s1 : OUT STD_LOGIC;
                    signal d1_reconfig_request_pio_s1_end_xfer : OUT STD_LOGIC;
                    signal reconfig_request_pio_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal reconfig_request_pio_s1_chipselect : OUT STD_LOGIC;
                    signal reconfig_request_pio_s1_readdata_from_sa : OUT STD_LOGIC;
                    signal reconfig_request_pio_s1_reset_n : OUT STD_LOGIC;
                    signal reconfig_request_pio_s1_write_n : OUT STD_LOGIC;
                    signal reconfig_request_pio_s1_writedata : OUT STD_LOGIC
                 );
end component reconfig_request_pio_s1_arbitrator;

component reconfig_request_pio is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC;

                 -- outputs:
                    signal bidir_port : INOUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC
                 );
end component reconfig_request_pio;

component sdram_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_instruction_master_latency_counter : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_instruction_master_read : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sdram_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal sdram_s1_readdatavalid : IN STD_LOGIC;
                    signal sdram_s1_waitrequest : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_data_master_granted_sdram_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_sdram_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_sdram_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_sdram_s1_shift_register : OUT STD_LOGIC;
                    signal cpu_data_master_requests_sdram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_granted_sdram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_qualified_request_sdram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_sdram_s1 : OUT STD_LOGIC;
                    signal cpu_instruction_master_read_data_valid_sdram_s1_shift_register : OUT STD_LOGIC;
                    signal cpu_instruction_master_requests_sdram_s1 : OUT STD_LOGIC;
                    signal d1_sdram_s1_end_xfer : OUT STD_LOGIC;
                    signal sdram_s1_address : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
                    signal sdram_s1_byteenable_n : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal sdram_s1_chipselect : OUT STD_LOGIC;
                    signal sdram_s1_read_n : OUT STD_LOGIC;
                    signal sdram_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal sdram_s1_reset_n : OUT STD_LOGIC;
                    signal sdram_s1_waitrequest_from_sa : OUT STD_LOGIC;
                    signal sdram_s1_write_n : OUT STD_LOGIC;
                    signal sdram_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component sdram_s1_arbitrator;

component sdram is 
           port (
                 -- inputs:
                    signal az_addr : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
                    signal az_be_n : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal az_cs : IN STD_LOGIC;
                    signal az_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal az_rd_n : IN STD_LOGIC;
                    signal az_wr_n : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal za_data : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal za_valid : OUT STD_LOGIC;
                    signal za_waitrequest : OUT STD_LOGIC;
                    signal zs_addr : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
                    signal zs_ba : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal zs_cas_n : OUT STD_LOGIC;
                    signal zs_cke : OUT STD_LOGIC;
                    signal zs_cs_n : OUT STD_LOGIC;
                    signal zs_dq : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal zs_dqm : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal zs_ras_n : OUT STD_LOGIC;
                    signal zs_we_n : OUT STD_LOGIC
                 );
end component sdram;

component seven_seg_pio_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;
                    signal seven_seg_pio_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal cpu_data_master_granted_seven_seg_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_seven_seg_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_seven_seg_pio_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_requests_seven_seg_pio_s1 : OUT STD_LOGIC;
                    signal d1_seven_seg_pio_s1_end_xfer : OUT STD_LOGIC;
                    signal seven_seg_pio_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal seven_seg_pio_s1_chipselect : OUT STD_LOGIC;
                    signal seven_seg_pio_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal seven_seg_pio_s1_reset_n : OUT STD_LOGIC;
                    signal seven_seg_pio_s1_write_n : OUT STD_LOGIC;
                    signal seven_seg_pio_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component seven_seg_pio_s1_arbitrator;

component seven_seg_pio is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal out_port : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component seven_seg_pio;

component sys_clk_timer_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;
                    signal sys_clk_timer_s1_irq : IN STD_LOGIC;
                    signal sys_clk_timer_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal cpu_data_master_granted_sys_clk_timer_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_sys_clk_timer_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_sys_clk_timer_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_requests_sys_clk_timer_s1 : OUT STD_LOGIC;
                    signal d1_sys_clk_timer_s1_end_xfer : OUT STD_LOGIC;
                    signal sys_clk_timer_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal sys_clk_timer_s1_chipselect : OUT STD_LOGIC;
                    signal sys_clk_timer_s1_irq_from_sa : OUT STD_LOGIC;
                    signal sys_clk_timer_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal sys_clk_timer_s1_reset_n : OUT STD_LOGIC;
                    signal sys_clk_timer_s1_write_n : OUT STD_LOGIC;
                    signal sys_clk_timer_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component sys_clk_timer_s1_arbitrator;

component sys_clk_timer is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal irq : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component sys_clk_timer;

component sysid_control_slave_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sysid_control_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal cpu_data_master_granted_sysid_control_slave : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_sysid_control_slave : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_sysid_control_slave : OUT STD_LOGIC;
                    signal cpu_data_master_requests_sysid_control_slave : OUT STD_LOGIC;
                    signal d1_sysid_control_slave_end_xfer : OUT STD_LOGIC;
                    signal sysid_control_slave_address : OUT STD_LOGIC;
                    signal sysid_control_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component sysid_control_slave_arbitrator;

component sysid is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC;

                 -- outputs:
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component sysid;

component uart1_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_data_master_address_to_slave : IN STD_LOGIC_VECTOR (25 DOWNTO 0);
                    signal cpu_data_master_read : IN STD_LOGIC;
                    signal cpu_data_master_write : IN STD_LOGIC;
                    signal cpu_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;
                    signal uart1_s1_dataavailable : IN STD_LOGIC;
                    signal uart1_s1_irq : IN STD_LOGIC;
                    signal uart1_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal uart1_s1_readyfordata : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_data_master_granted_uart1_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_qualified_request_uart1_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_read_data_valid_uart1_s1 : OUT STD_LOGIC;
                    signal cpu_data_master_requests_uart1_s1 : OUT STD_LOGIC;
                    signal d1_uart1_s1_end_xfer : OUT STD_LOGIC;
                    signal uart1_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal uart1_s1_begintransfer : OUT STD_LOGIC;
                    signal uart1_s1_chipselect : OUT STD_LOGIC;
                    signal uart1_s1_dataavailable_from_sa : OUT STD_LOGIC;
                    signal uart1_s1_irq_from_sa : OUT STD_LOGIC;
                    signal uart1_s1_read_n : OUT STD_LOGIC;
                    signal uart1_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal uart1_s1_readyfordata_from_sa : OUT STD_LOGIC;
                    signal uart1_s1_reset_n : OUT STD_LOGIC;
                    signal uart1_s1_write_n : OUT STD_LOGIC;
                    signal uart1_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component uart1_s1_arbitrator;

component uart1 is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal begintransfer : IN STD_LOGIC;
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal read_n : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal rxd : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal dataavailable : OUT STD_LOGIC;
                    signal irq : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal readyfordata : OUT STD_LOGIC;
                    signal txd : OUT STD_LOGIC
                 );
end component uart1;

component NiosII_stratix_1s10_standard_reset_pll_c0_out_domain_synch_module is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal data_in : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal data_out : OUT STD_LOGIC
                 );
end component NiosII_stratix_1s10_standard_reset_pll_c0_out_domain_synch_module;

component NiosII_stratix_1s10_standard_reset_clk_domain_synch_module is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal data_in : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal data_out : OUT STD_LOGIC
                 );
end component NiosII_stratix_1s10_standard_reset_clk_domain_synch_module;

                signal NiosII_stratix_1s10_standard_clock_0_in_address :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_in_byteenable :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_in_endofpacket :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_endofpacket_from_sa :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_nativeaddress :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_in_read :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_readdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_in_reset_n :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_waitrequest :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_write :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_in_writedata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_out_address :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_out_address_to_slave :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_out_byteenable :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_out_endofpacket :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_nativeaddress :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_read :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_read_data_valid_pll_s1 :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_readdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1 :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_reset_n :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_waitrequest :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_write :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_writedata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal button_pio_s1_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal button_pio_s1_chipselect :  STD_LOGIC;
                signal button_pio_s1_irq :  STD_LOGIC;
                signal button_pio_s1_irq_from_sa :  STD_LOGIC;
                signal button_pio_s1_readdata :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal button_pio_s1_readdata_from_sa :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal button_pio_s1_reset_n :  STD_LOGIC;
                signal button_pio_s1_write_n :  STD_LOGIC;
                signal button_pio_s1_writedata :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal clk_reset_n :  STD_LOGIC;
                signal cpu_data_master_address :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal cpu_data_master_address_to_slave :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal cpu_data_master_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal cpu_data_master_byteenable_ext_flash_s1 :  STD_LOGIC;
                signal cpu_data_master_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_data_master_dbs_write_8 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal cpu_data_master_debugaccess :  STD_LOGIC;
                signal cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in :  STD_LOGIC;
                signal cpu_data_master_granted_button_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_granted_cpu_jtag_debug_module :  STD_LOGIC;
                signal cpu_data_master_granted_ext_flash_s1 :  STD_LOGIC;
                signal cpu_data_master_granted_ext_ram_s1 :  STD_LOGIC;
                signal cpu_data_master_granted_high_res_timer_s1 :  STD_LOGIC;
                signal cpu_data_master_granted_jtag_uart_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_data_master_granted_lan91c111_s1 :  STD_LOGIC;
                signal cpu_data_master_granted_lcd_display_control_slave :  STD_LOGIC;
                signal cpu_data_master_granted_led_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_granted_onchip_ram_s1 :  STD_LOGIC;
                signal cpu_data_master_granted_reconfig_request_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_granted_sdram_s1 :  STD_LOGIC;
                signal cpu_data_master_granted_seven_seg_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_granted_sys_clk_timer_s1 :  STD_LOGIC;
                signal cpu_data_master_granted_sysid_control_slave :  STD_LOGIC;
                signal cpu_data_master_granted_uart1_s1 :  STD_LOGIC;
                signal cpu_data_master_irq :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_data_master_no_byte_enables_and_last_term :  STD_LOGIC;
                signal cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in :  STD_LOGIC;
                signal cpu_data_master_qualified_request_button_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_qualified_request_cpu_jtag_debug_module :  STD_LOGIC;
                signal cpu_data_master_qualified_request_ext_flash_s1 :  STD_LOGIC;
                signal cpu_data_master_qualified_request_ext_ram_s1 :  STD_LOGIC;
                signal cpu_data_master_qualified_request_high_res_timer_s1 :  STD_LOGIC;
                signal cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_data_master_qualified_request_lan91c111_s1 :  STD_LOGIC;
                signal cpu_data_master_qualified_request_lcd_display_control_slave :  STD_LOGIC;
                signal cpu_data_master_qualified_request_led_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_qualified_request_onchip_ram_s1 :  STD_LOGIC;
                signal cpu_data_master_qualified_request_reconfig_request_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_qualified_request_sdram_s1 :  STD_LOGIC;
                signal cpu_data_master_qualified_request_seven_seg_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_qualified_request_sys_clk_timer_s1 :  STD_LOGIC;
                signal cpu_data_master_qualified_request_sysid_control_slave :  STD_LOGIC;
                signal cpu_data_master_qualified_request_uart1_s1 :  STD_LOGIC;
                signal cpu_data_master_read :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_NiosII_stratix_1s10_standard_clock_0_in :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_button_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_cpu_jtag_debug_module :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_ext_flash_s1 :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_ext_ram_s1 :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_high_res_timer_s1 :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_lan91c111_s1 :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_lcd_display_control_slave :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_led_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_onchip_ram_s1 :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_reconfig_request_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_sdram_s1 :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_sdram_s1_shift_register :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_seven_seg_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_sys_clk_timer_s1 :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_sysid_control_slave :  STD_LOGIC;
                signal cpu_data_master_read_data_valid_uart1_s1 :  STD_LOGIC;
                signal cpu_data_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in :  STD_LOGIC;
                signal cpu_data_master_requests_button_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_requests_cpu_jtag_debug_module :  STD_LOGIC;
                signal cpu_data_master_requests_ext_flash_s1 :  STD_LOGIC;
                signal cpu_data_master_requests_ext_ram_s1 :  STD_LOGIC;
                signal cpu_data_master_requests_high_res_timer_s1 :  STD_LOGIC;
                signal cpu_data_master_requests_jtag_uart_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_data_master_requests_lan91c111_s1 :  STD_LOGIC;
                signal cpu_data_master_requests_lcd_display_control_slave :  STD_LOGIC;
                signal cpu_data_master_requests_led_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_requests_onchip_ram_s1 :  STD_LOGIC;
                signal cpu_data_master_requests_reconfig_request_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_requests_sdram_s1 :  STD_LOGIC;
                signal cpu_data_master_requests_seven_seg_pio_s1 :  STD_LOGIC;
                signal cpu_data_master_requests_sys_clk_timer_s1 :  STD_LOGIC;
                signal cpu_data_master_requests_sysid_control_slave :  STD_LOGIC;
                signal cpu_data_master_requests_uart1_s1 :  STD_LOGIC;
                signal cpu_data_master_waitrequest :  STD_LOGIC;
                signal cpu_data_master_write :  STD_LOGIC;
                signal cpu_data_master_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_instruction_master_address :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal cpu_instruction_master_address_to_slave :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal cpu_instruction_master_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_instruction_master_granted_cpu_jtag_debug_module :  STD_LOGIC;
                signal cpu_instruction_master_granted_ext_flash_s1 :  STD_LOGIC;
                signal cpu_instruction_master_granted_ext_ram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_granted_lan91c111_s1 :  STD_LOGIC;
                signal cpu_instruction_master_granted_onchip_ram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_granted_sdram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_latency_counter :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_instruction_master_qualified_request_cpu_jtag_debug_module :  STD_LOGIC;
                signal cpu_instruction_master_qualified_request_ext_flash_s1 :  STD_LOGIC;
                signal cpu_instruction_master_qualified_request_ext_ram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_qualified_request_lan91c111_s1 :  STD_LOGIC;
                signal cpu_instruction_master_qualified_request_onchip_ram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_qualified_request_sdram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_read :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_cpu_jtag_debug_module :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_ext_flash_s1 :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_ext_ram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_lan91c111_s1 :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_onchip_ram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_sdram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_read_data_valid_sdram_s1_shift_register :  STD_LOGIC;
                signal cpu_instruction_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_instruction_master_readdatavalid :  STD_LOGIC;
                signal cpu_instruction_master_requests_cpu_jtag_debug_module :  STD_LOGIC;
                signal cpu_instruction_master_requests_ext_flash_s1 :  STD_LOGIC;
                signal cpu_instruction_master_requests_ext_ram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_requests_lan91c111_s1 :  STD_LOGIC;
                signal cpu_instruction_master_requests_onchip_ram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_requests_sdram_s1 :  STD_LOGIC;
                signal cpu_instruction_master_waitrequest :  STD_LOGIC;
                signal cpu_jtag_debug_module_address :  STD_LOGIC_VECTOR (8 DOWNTO 0);
                signal cpu_jtag_debug_module_begintransfer :  STD_LOGIC;
                signal cpu_jtag_debug_module_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal cpu_jtag_debug_module_chipselect :  STD_LOGIC;
                signal cpu_jtag_debug_module_debugaccess :  STD_LOGIC;
                signal cpu_jtag_debug_module_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_jtag_debug_module_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_jtag_debug_module_reset :  STD_LOGIC;
                signal cpu_jtag_debug_module_reset_n :  STD_LOGIC;
                signal cpu_jtag_debug_module_resetrequest :  STD_LOGIC;
                signal cpu_jtag_debug_module_resetrequest_from_sa :  STD_LOGIC;
                signal cpu_jtag_debug_module_write :  STD_LOGIC;
                signal cpu_jtag_debug_module_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer :  STD_LOGIC;
                signal d1_button_pio_s1_end_xfer :  STD_LOGIC;
                signal d1_cpu_jtag_debug_module_end_xfer :  STD_LOGIC;
                signal d1_ext_ram_bus_avalon_slave_end_xfer :  STD_LOGIC;
                signal d1_high_res_timer_s1_end_xfer :  STD_LOGIC;
                signal d1_irq_from_the_lan91c111 :  STD_LOGIC;
                signal d1_jtag_uart_avalon_jtag_slave_end_xfer :  STD_LOGIC;
                signal d1_lcd_display_control_slave_end_xfer :  STD_LOGIC;
                signal d1_led_pio_s1_end_xfer :  STD_LOGIC;
                signal d1_onchip_ram_s1_end_xfer :  STD_LOGIC;
                signal d1_pll_s1_end_xfer :  STD_LOGIC;
                signal d1_reconfig_request_pio_s1_end_xfer :  STD_LOGIC;
                signal d1_sdram_s1_end_xfer :  STD_LOGIC;
                signal d1_seven_seg_pio_s1_end_xfer :  STD_LOGIC;
                signal d1_sys_clk_timer_s1_end_xfer :  STD_LOGIC;
                signal d1_sysid_control_slave_end_xfer :  STD_LOGIC;
                signal d1_uart1_s1_end_xfer :  STD_LOGIC;
                signal ext_flash_s1_wait_counter_eq_0 :  STD_LOGIC;
                signal ext_flash_s1_wait_counter_eq_1 :  STD_LOGIC;
                signal high_res_timer_s1_address :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal high_res_timer_s1_chipselect :  STD_LOGIC;
                signal high_res_timer_s1_irq :  STD_LOGIC;
                signal high_res_timer_s1_irq_from_sa :  STD_LOGIC;
                signal high_res_timer_s1_readdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal high_res_timer_s1_readdata_from_sa :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal high_res_timer_s1_reset_n :  STD_LOGIC;
                signal high_res_timer_s1_write_n :  STD_LOGIC;
                signal high_res_timer_s1_writedata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal incoming_ext_ram_bus_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal incoming_ext_ram_bus_data_with_Xs_converted_to_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal internal_LCD_E_from_the_lcd_display :  STD_LOGIC;
                signal internal_LCD_RS_from_the_lcd_display :  STD_LOGIC;
                signal internal_LCD_RW_from_the_lcd_display :  STD_LOGIC;
                signal internal_be_n_to_the_ext_ram :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal internal_byteenablen_to_the_lan91c111 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal internal_ext_ram_bus_address :  STD_LOGIC_VECTOR (22 DOWNTO 0);
                signal internal_ior_n_to_the_lan91c111 :  STD_LOGIC;
                signal internal_iow_n_to_the_lan91c111 :  STD_LOGIC;
                signal internal_out_port_from_the_led_pio :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal internal_out_port_from_the_seven_seg_pio :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal internal_pll_c0_out :  STD_LOGIC;
                signal internal_read_n_to_the_ext_flash :  STD_LOGIC;
                signal internal_read_n_to_the_ext_ram :  STD_LOGIC;
                signal internal_reset_to_the_lan91c111 :  STD_LOGIC;
                signal internal_select_n_to_the_ext_flash :  STD_LOGIC;
                signal internal_select_n_to_the_ext_ram :  STD_LOGIC;
                signal internal_txd_from_the_uart1 :  STD_LOGIC;
                signal internal_write_n_to_the_ext_flash :  STD_LOGIC;
                signal internal_write_n_to_the_ext_ram :  STD_LOGIC;
                signal internal_zs_addr_from_the_sdram :  STD_LOGIC_VECTOR (11 DOWNTO 0);
                signal internal_zs_ba_from_the_sdram :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal internal_zs_cas_n_from_the_sdram :  STD_LOGIC;
                signal internal_zs_cke_from_the_sdram :  STD_LOGIC;
                signal internal_zs_cs_n_from_the_sdram :  STD_LOGIC;
                signal internal_zs_dqm_from_the_sdram :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal internal_zs_ras_n_from_the_sdram :  STD_LOGIC;
                signal internal_zs_we_n_from_the_sdram :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_address :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_chipselect :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_dataavailable :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_dataavailable_from_sa :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_irq :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_irq_from_sa :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_read_n :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal jtag_uart_avalon_jtag_slave_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal jtag_uart_avalon_jtag_slave_readyfordata :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_readyfordata_from_sa :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_reset_n :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_waitrequest :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_waitrequest_from_sa :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_write_n :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal lan91c111_s1_wait_counter_eq_0 :  STD_LOGIC;
                signal lan91c111_s1_wait_counter_eq_1 :  STD_LOGIC;
                signal lcd_display_control_slave_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal lcd_display_control_slave_begintransfer :  STD_LOGIC;
                signal lcd_display_control_slave_read :  STD_LOGIC;
                signal lcd_display_control_slave_readdata :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal lcd_display_control_slave_readdata_from_sa :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal lcd_display_control_slave_wait_counter_eq_0 :  STD_LOGIC;
                signal lcd_display_control_slave_wait_counter_eq_1 :  STD_LOGIC;
                signal lcd_display_control_slave_write :  STD_LOGIC;
                signal lcd_display_control_slave_writedata :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal led_pio_s1_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal led_pio_s1_chipselect :  STD_LOGIC;
                signal led_pio_s1_readdata :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal led_pio_s1_readdata_from_sa :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal led_pio_s1_reset_n :  STD_LOGIC;
                signal led_pio_s1_write_n :  STD_LOGIC;
                signal led_pio_s1_writedata :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal module_input6 :  STD_LOGIC;
                signal module_input7 :  STD_LOGIC;
                signal onchip_ram_s1_address :  STD_LOGIC_VECTOR (13 DOWNTO 0);
                signal onchip_ram_s1_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal onchip_ram_s1_chipselect :  STD_LOGIC;
                signal onchip_ram_s1_clken :  STD_LOGIC;
                signal onchip_ram_s1_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal onchip_ram_s1_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal onchip_ram_s1_write :  STD_LOGIC;
                signal onchip_ram_s1_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal out_clk_pll_c0 :  STD_LOGIC;
                signal out_clk_pll_e0 :  STD_LOGIC;
                signal pll_c0_out_reset_n :  STD_LOGIC;
                signal pll_s1_address :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal pll_s1_chipselect :  STD_LOGIC;
                signal pll_s1_read :  STD_LOGIC;
                signal pll_s1_readdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal pll_s1_readdata_from_sa :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal pll_s1_reset_n :  STD_LOGIC;
                signal pll_s1_resetrequest :  STD_LOGIC;
                signal pll_s1_resetrequest_from_sa :  STD_LOGIC;
                signal pll_s1_write :  STD_LOGIC;
                signal pll_s1_writedata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal reconfig_request_pio_s1_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal reconfig_request_pio_s1_chipselect :  STD_LOGIC;
                signal reconfig_request_pio_s1_readdata :  STD_LOGIC;
                signal reconfig_request_pio_s1_readdata_from_sa :  STD_LOGIC;
                signal reconfig_request_pio_s1_reset_n :  STD_LOGIC;
                signal reconfig_request_pio_s1_write_n :  STD_LOGIC;
                signal reconfig_request_pio_s1_writedata :  STD_LOGIC;
                signal registered_cpu_data_master_read_data_valid_ext_flash_s1 :  STD_LOGIC;
                signal registered_cpu_data_master_read_data_valid_ext_ram_s1 :  STD_LOGIC;
                signal registered_cpu_data_master_read_data_valid_lan91c111_s1 :  STD_LOGIC;
                signal registered_cpu_data_master_read_data_valid_onchip_ram_s1 :  STD_LOGIC;
                signal reset_n_sources :  STD_LOGIC;
                signal sdram_s1_address :  STD_LOGIC_VECTOR (21 DOWNTO 0);
                signal sdram_s1_byteenable_n :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal sdram_s1_chipselect :  STD_LOGIC;
                signal sdram_s1_read_n :  STD_LOGIC;
                signal sdram_s1_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal sdram_s1_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal sdram_s1_readdatavalid :  STD_LOGIC;
                signal sdram_s1_reset_n :  STD_LOGIC;
                signal sdram_s1_waitrequest :  STD_LOGIC;
                signal sdram_s1_waitrequest_from_sa :  STD_LOGIC;
                signal sdram_s1_write_n :  STD_LOGIC;
                signal sdram_s1_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal seven_seg_pio_s1_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal seven_seg_pio_s1_chipselect :  STD_LOGIC;
                signal seven_seg_pio_s1_readdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal seven_seg_pio_s1_readdata_from_sa :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal seven_seg_pio_s1_reset_n :  STD_LOGIC;
                signal seven_seg_pio_s1_write_n :  STD_LOGIC;
                signal seven_seg_pio_s1_writedata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal sys_clk_timer_s1_address :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal sys_clk_timer_s1_chipselect :  STD_LOGIC;
                signal sys_clk_timer_s1_irq :  STD_LOGIC;
                signal sys_clk_timer_s1_irq_from_sa :  STD_LOGIC;
                signal sys_clk_timer_s1_readdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal sys_clk_timer_s1_readdata_from_sa :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal sys_clk_timer_s1_reset_n :  STD_LOGIC;
                signal sys_clk_timer_s1_write_n :  STD_LOGIC;
                signal sys_clk_timer_s1_writedata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal sysid_control_slave_address :  STD_LOGIC;
                signal sysid_control_slave_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal sysid_control_slave_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal uart1_s1_address :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal uart1_s1_begintransfer :  STD_LOGIC;
                signal uart1_s1_chipselect :  STD_LOGIC;
                signal uart1_s1_dataavailable :  STD_LOGIC;
                signal uart1_s1_dataavailable_from_sa :  STD_LOGIC;
                signal uart1_s1_irq :  STD_LOGIC;
                signal uart1_s1_irq_from_sa :  STD_LOGIC;
                signal uart1_s1_read_n :  STD_LOGIC;
                signal uart1_s1_readdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal uart1_s1_readdata_from_sa :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal uart1_s1_readyfordata :  STD_LOGIC;
                signal uart1_s1_readyfordata_from_sa :  STD_LOGIC;
                signal uart1_s1_reset_n :  STD_LOGIC;
                signal uart1_s1_write_n :  STD_LOGIC;
                signal uart1_s1_writedata :  STD_LOGIC_VECTOR (15 DOWNTO 0);

begin

  --the_NiosII_stratix_1s10_standard_clock_0_in, which is an e_instance
  the_NiosII_stratix_1s10_standard_clock_0_in : NiosII_stratix_1s10_standard_clock_0_in_arbitrator
    port map(
      NiosII_stratix_1s10_standard_clock_0_in_address => NiosII_stratix_1s10_standard_clock_0_in_address,
      NiosII_stratix_1s10_standard_clock_0_in_byteenable => NiosII_stratix_1s10_standard_clock_0_in_byteenable,
      NiosII_stratix_1s10_standard_clock_0_in_endofpacket_from_sa => NiosII_stratix_1s10_standard_clock_0_in_endofpacket_from_sa,
      NiosII_stratix_1s10_standard_clock_0_in_nativeaddress => NiosII_stratix_1s10_standard_clock_0_in_nativeaddress,
      NiosII_stratix_1s10_standard_clock_0_in_read => NiosII_stratix_1s10_standard_clock_0_in_read,
      NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa => NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa,
      NiosII_stratix_1s10_standard_clock_0_in_reset_n => NiosII_stratix_1s10_standard_clock_0_in_reset_n,
      NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa => NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa,
      NiosII_stratix_1s10_standard_clock_0_in_write => NiosII_stratix_1s10_standard_clock_0_in_write,
      NiosII_stratix_1s10_standard_clock_0_in_writedata => NiosII_stratix_1s10_standard_clock_0_in_writedata,
      cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in => cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in,
      cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in => cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in,
      cpu_data_master_read_data_valid_NiosII_stratix_1s10_standard_clock_0_in => cpu_data_master_read_data_valid_NiosII_stratix_1s10_standard_clock_0_in,
      cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in => cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in,
      d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer => d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer,
      NiosII_stratix_1s10_standard_clock_0_in_endofpacket => NiosII_stratix_1s10_standard_clock_0_in_endofpacket,
      NiosII_stratix_1s10_standard_clock_0_in_readdata => NiosII_stratix_1s10_standard_clock_0_in_readdata,
      NiosII_stratix_1s10_standard_clock_0_in_waitrequest => NiosII_stratix_1s10_standard_clock_0_in_waitrequest,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_byteenable => cpu_data_master_byteenable,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      reset_n => pll_c0_out_reset_n
    );


  --the_NiosII_stratix_1s10_standard_clock_0_out, which is an e_instance
  the_NiosII_stratix_1s10_standard_clock_0_out : NiosII_stratix_1s10_standard_clock_0_out_arbitrator
    port map(
      NiosII_stratix_1s10_standard_clock_0_out_address_to_slave => NiosII_stratix_1s10_standard_clock_0_out_address_to_slave,
      NiosII_stratix_1s10_standard_clock_0_out_readdata => NiosII_stratix_1s10_standard_clock_0_out_readdata,
      NiosII_stratix_1s10_standard_clock_0_out_reset_n => NiosII_stratix_1s10_standard_clock_0_out_reset_n,
      NiosII_stratix_1s10_standard_clock_0_out_waitrequest => NiosII_stratix_1s10_standard_clock_0_out_waitrequest,
      NiosII_stratix_1s10_standard_clock_0_out_address => NiosII_stratix_1s10_standard_clock_0_out_address,
      NiosII_stratix_1s10_standard_clock_0_out_byteenable => NiosII_stratix_1s10_standard_clock_0_out_byteenable,
      NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 => NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1,
      NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 => NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1,
      NiosII_stratix_1s10_standard_clock_0_out_read => NiosII_stratix_1s10_standard_clock_0_out_read,
      NiosII_stratix_1s10_standard_clock_0_out_read_data_valid_pll_s1 => NiosII_stratix_1s10_standard_clock_0_out_read_data_valid_pll_s1,
      NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1 => NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1,
      NiosII_stratix_1s10_standard_clock_0_out_write => NiosII_stratix_1s10_standard_clock_0_out_write,
      NiosII_stratix_1s10_standard_clock_0_out_writedata => NiosII_stratix_1s10_standard_clock_0_out_writedata,
      clk => clk,
      d1_pll_s1_end_xfer => d1_pll_s1_end_xfer,
      pll_s1_readdata_from_sa => pll_s1_readdata_from_sa,
      reset_n => clk_reset_n
    );


  --the_NiosII_stratix_1s10_standard_clock_0, which is an e_ptf_instance
  the_NiosII_stratix_1s10_standard_clock_0 : NiosII_stratix_1s10_standard_clock_0
    port map(
      master_address => NiosII_stratix_1s10_standard_clock_0_out_address,
      master_byteenable => NiosII_stratix_1s10_standard_clock_0_out_byteenable,
      master_nativeaddress => NiosII_stratix_1s10_standard_clock_0_out_nativeaddress,
      master_read => NiosII_stratix_1s10_standard_clock_0_out_read,
      master_write => NiosII_stratix_1s10_standard_clock_0_out_write,
      master_writedata => NiosII_stratix_1s10_standard_clock_0_out_writedata,
      slave_endofpacket => NiosII_stratix_1s10_standard_clock_0_in_endofpacket,
      slave_readdata => NiosII_stratix_1s10_standard_clock_0_in_readdata,
      slave_waitrequest => NiosII_stratix_1s10_standard_clock_0_in_waitrequest,
      master_clk => clk,
      master_endofpacket => NiosII_stratix_1s10_standard_clock_0_out_endofpacket,
      master_readdata => NiosII_stratix_1s10_standard_clock_0_out_readdata,
      master_reset_n => NiosII_stratix_1s10_standard_clock_0_out_reset_n,
      master_waitrequest => NiosII_stratix_1s10_standard_clock_0_out_waitrequest,
      slave_address => NiosII_stratix_1s10_standard_clock_0_in_address,
      slave_byteenable => NiosII_stratix_1s10_standard_clock_0_in_byteenable,
      slave_clk => internal_pll_c0_out,
      slave_nativeaddress => NiosII_stratix_1s10_standard_clock_0_in_nativeaddress,
      slave_read => NiosII_stratix_1s10_standard_clock_0_in_read,
      slave_reset_n => NiosII_stratix_1s10_standard_clock_0_in_reset_n,
      slave_write => NiosII_stratix_1s10_standard_clock_0_in_write,
      slave_writedata => NiosII_stratix_1s10_standard_clock_0_in_writedata
    );


  --the_button_pio_s1, which is an e_instance
  the_button_pio_s1 : button_pio_s1_arbitrator
    port map(
      button_pio_s1_address => button_pio_s1_address,
      button_pio_s1_chipselect => button_pio_s1_chipselect,
      button_pio_s1_irq_from_sa => button_pio_s1_irq_from_sa,
      button_pio_s1_readdata_from_sa => button_pio_s1_readdata_from_sa,
      button_pio_s1_reset_n => button_pio_s1_reset_n,
      button_pio_s1_write_n => button_pio_s1_write_n,
      button_pio_s1_writedata => button_pio_s1_writedata,
      cpu_data_master_granted_button_pio_s1 => cpu_data_master_granted_button_pio_s1,
      cpu_data_master_qualified_request_button_pio_s1 => cpu_data_master_qualified_request_button_pio_s1,
      cpu_data_master_read_data_valid_button_pio_s1 => cpu_data_master_read_data_valid_button_pio_s1,
      cpu_data_master_requests_button_pio_s1 => cpu_data_master_requests_button_pio_s1,
      d1_button_pio_s1_end_xfer => d1_button_pio_s1_end_xfer,
      button_pio_s1_irq => button_pio_s1_irq,
      button_pio_s1_readdata => button_pio_s1_readdata,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      reset_n => pll_c0_out_reset_n
    );


  --the_button_pio, which is an e_ptf_instance
  the_button_pio : button_pio
    port map(
      irq => button_pio_s1_irq,
      readdata => button_pio_s1_readdata,
      address => button_pio_s1_address,
      chipselect => button_pio_s1_chipselect,
      clk => internal_pll_c0_out,
      in_port => in_port_to_the_button_pio,
      reset_n => button_pio_s1_reset_n,
      write_n => button_pio_s1_write_n,
      writedata => button_pio_s1_writedata
    );


  --the_cpu_jtag_debug_module, which is an e_instance
  the_cpu_jtag_debug_module : cpu_jtag_debug_module_arbitrator
    port map(
      cpu_data_master_granted_cpu_jtag_debug_module => cpu_data_master_granted_cpu_jtag_debug_module,
      cpu_data_master_qualified_request_cpu_jtag_debug_module => cpu_data_master_qualified_request_cpu_jtag_debug_module,
      cpu_data_master_read_data_valid_cpu_jtag_debug_module => cpu_data_master_read_data_valid_cpu_jtag_debug_module,
      cpu_data_master_requests_cpu_jtag_debug_module => cpu_data_master_requests_cpu_jtag_debug_module,
      cpu_instruction_master_granted_cpu_jtag_debug_module => cpu_instruction_master_granted_cpu_jtag_debug_module,
      cpu_instruction_master_qualified_request_cpu_jtag_debug_module => cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
      cpu_instruction_master_read_data_valid_cpu_jtag_debug_module => cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
      cpu_instruction_master_requests_cpu_jtag_debug_module => cpu_instruction_master_requests_cpu_jtag_debug_module,
      cpu_jtag_debug_module_address => cpu_jtag_debug_module_address,
      cpu_jtag_debug_module_begintransfer => cpu_jtag_debug_module_begintransfer,
      cpu_jtag_debug_module_byteenable => cpu_jtag_debug_module_byteenable,
      cpu_jtag_debug_module_chipselect => cpu_jtag_debug_module_chipselect,
      cpu_jtag_debug_module_debugaccess => cpu_jtag_debug_module_debugaccess,
      cpu_jtag_debug_module_readdata_from_sa => cpu_jtag_debug_module_readdata_from_sa,
      cpu_jtag_debug_module_reset => cpu_jtag_debug_module_reset,
      cpu_jtag_debug_module_reset_n => cpu_jtag_debug_module_reset_n,
      cpu_jtag_debug_module_resetrequest_from_sa => cpu_jtag_debug_module_resetrequest_from_sa,
      cpu_jtag_debug_module_write => cpu_jtag_debug_module_write,
      cpu_jtag_debug_module_writedata => cpu_jtag_debug_module_writedata,
      d1_cpu_jtag_debug_module_end_xfer => d1_cpu_jtag_debug_module_end_xfer,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_byteenable => cpu_data_master_byteenable,
      cpu_data_master_debugaccess => cpu_data_master_debugaccess,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      cpu_instruction_master_address_to_slave => cpu_instruction_master_address_to_slave,
      cpu_instruction_master_latency_counter => cpu_instruction_master_latency_counter,
      cpu_instruction_master_read => cpu_instruction_master_read,
      cpu_instruction_master_read_data_valid_sdram_s1_shift_register => cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
      cpu_jtag_debug_module_readdata => cpu_jtag_debug_module_readdata,
      cpu_jtag_debug_module_resetrequest => cpu_jtag_debug_module_resetrequest,
      reset_n => pll_c0_out_reset_n
    );


  --the_cpu_data_master, which is an e_instance
  the_cpu_data_master : cpu_data_master_arbitrator
    port map(
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_dbs_address => cpu_data_master_dbs_address,
      cpu_data_master_dbs_write_8 => cpu_data_master_dbs_write_8,
      cpu_data_master_irq => cpu_data_master_irq,
      cpu_data_master_no_byte_enables_and_last_term => cpu_data_master_no_byte_enables_and_last_term,
      cpu_data_master_readdata => cpu_data_master_readdata,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa => NiosII_stratix_1s10_standard_clock_0_in_readdata_from_sa,
      NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa => NiosII_stratix_1s10_standard_clock_0_in_waitrequest_from_sa,
      button_pio_s1_irq_from_sa => button_pio_s1_irq_from_sa,
      button_pio_s1_readdata_from_sa => button_pio_s1_readdata_from_sa,
      clk => internal_pll_c0_out,
      cpu_data_master_address => cpu_data_master_address,
      cpu_data_master_byteenable_ext_flash_s1 => cpu_data_master_byteenable_ext_flash_s1,
      cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in => cpu_data_master_granted_NiosII_stratix_1s10_standard_clock_0_in,
      cpu_data_master_granted_button_pio_s1 => cpu_data_master_granted_button_pio_s1,
      cpu_data_master_granted_cpu_jtag_debug_module => cpu_data_master_granted_cpu_jtag_debug_module,
      cpu_data_master_granted_ext_flash_s1 => cpu_data_master_granted_ext_flash_s1,
      cpu_data_master_granted_ext_ram_s1 => cpu_data_master_granted_ext_ram_s1,
      cpu_data_master_granted_high_res_timer_s1 => cpu_data_master_granted_high_res_timer_s1,
      cpu_data_master_granted_jtag_uart_avalon_jtag_slave => cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
      cpu_data_master_granted_lan91c111_s1 => cpu_data_master_granted_lan91c111_s1,
      cpu_data_master_granted_lcd_display_control_slave => cpu_data_master_granted_lcd_display_control_slave,
      cpu_data_master_granted_led_pio_s1 => cpu_data_master_granted_led_pio_s1,
      cpu_data_master_granted_onchip_ram_s1 => cpu_data_master_granted_onchip_ram_s1,
      cpu_data_master_granted_reconfig_request_pio_s1 => cpu_data_master_granted_reconfig_request_pio_s1,
      cpu_data_master_granted_sdram_s1 => cpu_data_master_granted_sdram_s1,
      cpu_data_master_granted_seven_seg_pio_s1 => cpu_data_master_granted_seven_seg_pio_s1,
      cpu_data_master_granted_sys_clk_timer_s1 => cpu_data_master_granted_sys_clk_timer_s1,
      cpu_data_master_granted_sysid_control_slave => cpu_data_master_granted_sysid_control_slave,
      cpu_data_master_granted_uart1_s1 => cpu_data_master_granted_uart1_s1,
      cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in => cpu_data_master_qualified_request_NiosII_stratix_1s10_standard_clock_0_in,
      cpu_data_master_qualified_request_button_pio_s1 => cpu_data_master_qualified_request_button_pio_s1,
      cpu_data_master_qualified_request_cpu_jtag_debug_module => cpu_data_master_qualified_request_cpu_jtag_debug_module,
      cpu_data_master_qualified_request_ext_flash_s1 => cpu_data_master_qualified_request_ext_flash_s1,
      cpu_data_master_qualified_request_ext_ram_s1 => cpu_data_master_qualified_request_ext_ram_s1,
      cpu_data_master_qualified_request_high_res_timer_s1 => cpu_data_master_qualified_request_high_res_timer_s1,
      cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave => cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
      cpu_data_master_qualified_request_lan91c111_s1 => cpu_data_master_qualified_request_lan91c111_s1,
      cpu_data_master_qualified_request_lcd_display_control_slave => cpu_data_master_qualified_request_lcd_display_control_slave,
      cpu_data_master_qualified_request_led_pio_s1 => cpu_data_master_qualified_request_led_pio_s1,
      cpu_data_master_qualified_request_onchip_ram_s1 => cpu_data_master_qualified_request_onchip_ram_s1,
      cpu_data_master_qualified_request_reconfig_request_pio_s1 => cpu_data_master_qualified_request_reconfig_request_pio_s1,
      cpu_data_master_qualified_request_sdram_s1 => cpu_data_master_qualified_request_sdram_s1,
      cpu_data_master_qualified_request_seven_seg_pio_s1 => cpu_data_master_qualified_request_seven_seg_pio_s1,
      cpu_data_master_qualified_request_sys_clk_timer_s1 => cpu_data_master_qualified_request_sys_clk_timer_s1,
      cpu_data_master_qualified_request_sysid_control_slave => cpu_data_master_qualified_request_sysid_control_slave,
      cpu_data_master_qualified_request_uart1_s1 => cpu_data_master_qualified_request_uart1_s1,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_read_data_valid_NiosII_stratix_1s10_standard_clock_0_in => cpu_data_master_read_data_valid_NiosII_stratix_1s10_standard_clock_0_in,
      cpu_data_master_read_data_valid_button_pio_s1 => cpu_data_master_read_data_valid_button_pio_s1,
      cpu_data_master_read_data_valid_cpu_jtag_debug_module => cpu_data_master_read_data_valid_cpu_jtag_debug_module,
      cpu_data_master_read_data_valid_ext_flash_s1 => cpu_data_master_read_data_valid_ext_flash_s1,
      cpu_data_master_read_data_valid_ext_ram_s1 => cpu_data_master_read_data_valid_ext_ram_s1,
      cpu_data_master_read_data_valid_high_res_timer_s1 => cpu_data_master_read_data_valid_high_res_timer_s1,
      cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave => cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
      cpu_data_master_read_data_valid_lan91c111_s1 => cpu_data_master_read_data_valid_lan91c111_s1,
      cpu_data_master_read_data_valid_lcd_display_control_slave => cpu_data_master_read_data_valid_lcd_display_control_slave,
      cpu_data_master_read_data_valid_led_pio_s1 => cpu_data_master_read_data_valid_led_pio_s1,
      cpu_data_master_read_data_valid_onchip_ram_s1 => cpu_data_master_read_data_valid_onchip_ram_s1,
      cpu_data_master_read_data_valid_reconfig_request_pio_s1 => cpu_data_master_read_data_valid_reconfig_request_pio_s1,
      cpu_data_master_read_data_valid_sdram_s1 => cpu_data_master_read_data_valid_sdram_s1,
      cpu_data_master_read_data_valid_sdram_s1_shift_register => cpu_data_master_read_data_valid_sdram_s1_shift_register,
      cpu_data_master_read_data_valid_seven_seg_pio_s1 => cpu_data_master_read_data_valid_seven_seg_pio_s1,
      cpu_data_master_read_data_valid_sys_clk_timer_s1 => cpu_data_master_read_data_valid_sys_clk_timer_s1,
      cpu_data_master_read_data_valid_sysid_control_slave => cpu_data_master_read_data_valid_sysid_control_slave,
      cpu_data_master_read_data_valid_uart1_s1 => cpu_data_master_read_data_valid_uart1_s1,
      cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in => cpu_data_master_requests_NiosII_stratix_1s10_standard_clock_0_in,
      cpu_data_master_requests_button_pio_s1 => cpu_data_master_requests_button_pio_s1,
      cpu_data_master_requests_cpu_jtag_debug_module => cpu_data_master_requests_cpu_jtag_debug_module,
      cpu_data_master_requests_ext_flash_s1 => cpu_data_master_requests_ext_flash_s1,
      cpu_data_master_requests_ext_ram_s1 => cpu_data_master_requests_ext_ram_s1,
      cpu_data_master_requests_high_res_timer_s1 => cpu_data_master_requests_high_res_timer_s1,
      cpu_data_master_requests_jtag_uart_avalon_jtag_slave => cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
      cpu_data_master_requests_lan91c111_s1 => cpu_data_master_requests_lan91c111_s1,
      cpu_data_master_requests_lcd_display_control_slave => cpu_data_master_requests_lcd_display_control_slave,
      cpu_data_master_requests_led_pio_s1 => cpu_data_master_requests_led_pio_s1,
      cpu_data_master_requests_onchip_ram_s1 => cpu_data_master_requests_onchip_ram_s1,
      cpu_data_master_requests_reconfig_request_pio_s1 => cpu_data_master_requests_reconfig_request_pio_s1,
      cpu_data_master_requests_sdram_s1 => cpu_data_master_requests_sdram_s1,
      cpu_data_master_requests_seven_seg_pio_s1 => cpu_data_master_requests_seven_seg_pio_s1,
      cpu_data_master_requests_sys_clk_timer_s1 => cpu_data_master_requests_sys_clk_timer_s1,
      cpu_data_master_requests_sysid_control_slave => cpu_data_master_requests_sysid_control_slave,
      cpu_data_master_requests_uart1_s1 => cpu_data_master_requests_uart1_s1,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      cpu_jtag_debug_module_readdata_from_sa => cpu_jtag_debug_module_readdata_from_sa,
      d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer => d1_NiosII_stratix_1s10_standard_clock_0_in_end_xfer,
      d1_button_pio_s1_end_xfer => d1_button_pio_s1_end_xfer,
      d1_cpu_jtag_debug_module_end_xfer => d1_cpu_jtag_debug_module_end_xfer,
      d1_ext_ram_bus_avalon_slave_end_xfer => d1_ext_ram_bus_avalon_slave_end_xfer,
      d1_high_res_timer_s1_end_xfer => d1_high_res_timer_s1_end_xfer,
      d1_irq_from_the_lan91c111 => d1_irq_from_the_lan91c111,
      d1_jtag_uart_avalon_jtag_slave_end_xfer => d1_jtag_uart_avalon_jtag_slave_end_xfer,
      d1_lcd_display_control_slave_end_xfer => d1_lcd_display_control_slave_end_xfer,
      d1_led_pio_s1_end_xfer => d1_led_pio_s1_end_xfer,
      d1_onchip_ram_s1_end_xfer => d1_onchip_ram_s1_end_xfer,
      d1_reconfig_request_pio_s1_end_xfer => d1_reconfig_request_pio_s1_end_xfer,
      d1_sdram_s1_end_xfer => d1_sdram_s1_end_xfer,
      d1_seven_seg_pio_s1_end_xfer => d1_seven_seg_pio_s1_end_xfer,
      d1_sys_clk_timer_s1_end_xfer => d1_sys_clk_timer_s1_end_xfer,
      d1_sysid_control_slave_end_xfer => d1_sysid_control_slave_end_xfer,
      d1_uart1_s1_end_xfer => d1_uart1_s1_end_xfer,
      ext_flash_s1_wait_counter_eq_0 => ext_flash_s1_wait_counter_eq_0,
      ext_flash_s1_wait_counter_eq_1 => ext_flash_s1_wait_counter_eq_1,
      high_res_timer_s1_irq_from_sa => high_res_timer_s1_irq_from_sa,
      high_res_timer_s1_readdata_from_sa => high_res_timer_s1_readdata_from_sa,
      incoming_ext_ram_bus_data => incoming_ext_ram_bus_data,
      incoming_ext_ram_bus_data_with_Xs_converted_to_0 => incoming_ext_ram_bus_data_with_Xs_converted_to_0,
      jtag_uart_avalon_jtag_slave_irq_from_sa => jtag_uart_avalon_jtag_slave_irq_from_sa,
      jtag_uart_avalon_jtag_slave_readdata_from_sa => jtag_uart_avalon_jtag_slave_readdata_from_sa,
      jtag_uart_avalon_jtag_slave_waitrequest_from_sa => jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
      lan91c111_s1_wait_counter_eq_0 => lan91c111_s1_wait_counter_eq_0,
      lan91c111_s1_wait_counter_eq_1 => lan91c111_s1_wait_counter_eq_1,
      lcd_display_control_slave_readdata_from_sa => lcd_display_control_slave_readdata_from_sa,
      lcd_display_control_slave_wait_counter_eq_0 => lcd_display_control_slave_wait_counter_eq_0,
      lcd_display_control_slave_wait_counter_eq_1 => lcd_display_control_slave_wait_counter_eq_1,
      led_pio_s1_readdata_from_sa => led_pio_s1_readdata_from_sa,
      onchip_ram_s1_readdata_from_sa => onchip_ram_s1_readdata_from_sa,
      reconfig_request_pio_s1_readdata_from_sa => reconfig_request_pio_s1_readdata_from_sa,
      registered_cpu_data_master_read_data_valid_ext_flash_s1 => registered_cpu_data_master_read_data_valid_ext_flash_s1,
      registered_cpu_data_master_read_data_valid_ext_ram_s1 => registered_cpu_data_master_read_data_valid_ext_ram_s1,
      registered_cpu_data_master_read_data_valid_lan91c111_s1 => registered_cpu_data_master_read_data_valid_lan91c111_s1,
      registered_cpu_data_master_read_data_valid_onchip_ram_s1 => registered_cpu_data_master_read_data_valid_onchip_ram_s1,
      reset_n => pll_c0_out_reset_n,
      sdram_s1_readdata_from_sa => sdram_s1_readdata_from_sa,
      sdram_s1_waitrequest_from_sa => sdram_s1_waitrequest_from_sa,
      seven_seg_pio_s1_readdata_from_sa => seven_seg_pio_s1_readdata_from_sa,
      sys_clk_timer_s1_irq_from_sa => sys_clk_timer_s1_irq_from_sa,
      sys_clk_timer_s1_readdata_from_sa => sys_clk_timer_s1_readdata_from_sa,
      sysid_control_slave_readdata_from_sa => sysid_control_slave_readdata_from_sa,
      uart1_s1_irq_from_sa => uart1_s1_irq_from_sa,
      uart1_s1_readdata_from_sa => uart1_s1_readdata_from_sa
    );


  --the_cpu_instruction_master, which is an e_instance
  the_cpu_instruction_master : cpu_instruction_master_arbitrator
    port map(
      cpu_instruction_master_address_to_slave => cpu_instruction_master_address_to_slave,
      cpu_instruction_master_dbs_address => cpu_instruction_master_dbs_address,
      cpu_instruction_master_latency_counter => cpu_instruction_master_latency_counter,
      cpu_instruction_master_readdata => cpu_instruction_master_readdata,
      cpu_instruction_master_readdatavalid => cpu_instruction_master_readdatavalid,
      cpu_instruction_master_waitrequest => cpu_instruction_master_waitrequest,
      clk => internal_pll_c0_out,
      cpu_instruction_master_address => cpu_instruction_master_address,
      cpu_instruction_master_granted_cpu_jtag_debug_module => cpu_instruction_master_granted_cpu_jtag_debug_module,
      cpu_instruction_master_granted_ext_flash_s1 => cpu_instruction_master_granted_ext_flash_s1,
      cpu_instruction_master_granted_ext_ram_s1 => cpu_instruction_master_granted_ext_ram_s1,
      cpu_instruction_master_granted_lan91c111_s1 => cpu_instruction_master_granted_lan91c111_s1,
      cpu_instruction_master_granted_onchip_ram_s1 => cpu_instruction_master_granted_onchip_ram_s1,
      cpu_instruction_master_granted_sdram_s1 => cpu_instruction_master_granted_sdram_s1,
      cpu_instruction_master_qualified_request_cpu_jtag_debug_module => cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
      cpu_instruction_master_qualified_request_ext_flash_s1 => cpu_instruction_master_qualified_request_ext_flash_s1,
      cpu_instruction_master_qualified_request_ext_ram_s1 => cpu_instruction_master_qualified_request_ext_ram_s1,
      cpu_instruction_master_qualified_request_lan91c111_s1 => cpu_instruction_master_qualified_request_lan91c111_s1,
      cpu_instruction_master_qualified_request_onchip_ram_s1 => cpu_instruction_master_qualified_request_onchip_ram_s1,
      cpu_instruction_master_qualified_request_sdram_s1 => cpu_instruction_master_qualified_request_sdram_s1,
      cpu_instruction_master_read => cpu_instruction_master_read,
      cpu_instruction_master_read_data_valid_cpu_jtag_debug_module => cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
      cpu_instruction_master_read_data_valid_ext_flash_s1 => cpu_instruction_master_read_data_valid_ext_flash_s1,
      cpu_instruction_master_read_data_valid_ext_ram_s1 => cpu_instruction_master_read_data_valid_ext_ram_s1,
      cpu_instruction_master_read_data_valid_lan91c111_s1 => cpu_instruction_master_read_data_valid_lan91c111_s1,
      cpu_instruction_master_read_data_valid_onchip_ram_s1 => cpu_instruction_master_read_data_valid_onchip_ram_s1,
      cpu_instruction_master_read_data_valid_sdram_s1 => cpu_instruction_master_read_data_valid_sdram_s1,
      cpu_instruction_master_read_data_valid_sdram_s1_shift_register => cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
      cpu_instruction_master_requests_cpu_jtag_debug_module => cpu_instruction_master_requests_cpu_jtag_debug_module,
      cpu_instruction_master_requests_ext_flash_s1 => cpu_instruction_master_requests_ext_flash_s1,
      cpu_instruction_master_requests_ext_ram_s1 => cpu_instruction_master_requests_ext_ram_s1,
      cpu_instruction_master_requests_lan91c111_s1 => cpu_instruction_master_requests_lan91c111_s1,
      cpu_instruction_master_requests_onchip_ram_s1 => cpu_instruction_master_requests_onchip_ram_s1,
      cpu_instruction_master_requests_sdram_s1 => cpu_instruction_master_requests_sdram_s1,
      cpu_jtag_debug_module_readdata_from_sa => cpu_jtag_debug_module_readdata_from_sa,
      d1_cpu_jtag_debug_module_end_xfer => d1_cpu_jtag_debug_module_end_xfer,
      d1_ext_ram_bus_avalon_slave_end_xfer => d1_ext_ram_bus_avalon_slave_end_xfer,
      d1_onchip_ram_s1_end_xfer => d1_onchip_ram_s1_end_xfer,
      d1_sdram_s1_end_xfer => d1_sdram_s1_end_xfer,
      ext_flash_s1_wait_counter_eq_0 => ext_flash_s1_wait_counter_eq_0,
      ext_flash_s1_wait_counter_eq_1 => ext_flash_s1_wait_counter_eq_1,
      incoming_ext_ram_bus_data => incoming_ext_ram_bus_data,
      lan91c111_s1_wait_counter_eq_0 => lan91c111_s1_wait_counter_eq_0,
      lan91c111_s1_wait_counter_eq_1 => lan91c111_s1_wait_counter_eq_1,
      onchip_ram_s1_readdata_from_sa => onchip_ram_s1_readdata_from_sa,
      reset_n => pll_c0_out_reset_n,
      sdram_s1_readdata_from_sa => sdram_s1_readdata_from_sa,
      sdram_s1_waitrequest_from_sa => sdram_s1_waitrequest_from_sa
    );


  --the_cpu, which is an e_ptf_instance
  the_cpu : cpu
    port map(
      d_address => cpu_data_master_address,
      d_byteenable => cpu_data_master_byteenable,
      d_read => cpu_data_master_read,
      d_write => cpu_data_master_write,
      d_writedata => cpu_data_master_writedata,
      i_address => cpu_instruction_master_address,
      i_read => cpu_instruction_master_read,
      jtag_debug_module_debugaccess_to_roms => cpu_data_master_debugaccess,
      jtag_debug_module_readdata => cpu_jtag_debug_module_readdata,
      jtag_debug_module_resetrequest => cpu_jtag_debug_module_resetrequest,
      clk => internal_pll_c0_out,
      d_irq => cpu_data_master_irq,
      d_readdata => cpu_data_master_readdata,
      d_waitrequest => cpu_data_master_waitrequest,
      i_readdata => cpu_instruction_master_readdata,
      i_readdatavalid => cpu_instruction_master_readdatavalid,
      i_waitrequest => cpu_instruction_master_waitrequest,
      jtag_debug_module_address => cpu_jtag_debug_module_address,
      jtag_debug_module_begintransfer => cpu_jtag_debug_module_begintransfer,
      jtag_debug_module_byteenable => cpu_jtag_debug_module_byteenable,
      jtag_debug_module_clk => internal_pll_c0_out,
      jtag_debug_module_debugaccess => cpu_jtag_debug_module_debugaccess,
      jtag_debug_module_reset => cpu_jtag_debug_module_reset,
      jtag_debug_module_select => cpu_jtag_debug_module_chipselect,
      jtag_debug_module_write => cpu_jtag_debug_module_write,
      jtag_debug_module_writedata => cpu_jtag_debug_module_writedata,
      reset_n => cpu_jtag_debug_module_reset_n
    );


  --the_ext_ram_bus_avalon_slave, which is an e_instance
  the_ext_ram_bus_avalon_slave : ext_ram_bus_avalon_slave_arbitrator
    port map(
      be_n_to_the_ext_ram => internal_be_n_to_the_ext_ram,
      byteenablen_to_the_lan91c111 => internal_byteenablen_to_the_lan91c111,
      cpu_data_master_byteenable_ext_flash_s1 => cpu_data_master_byteenable_ext_flash_s1,
      cpu_data_master_granted_ext_flash_s1 => cpu_data_master_granted_ext_flash_s1,
      cpu_data_master_granted_ext_ram_s1 => cpu_data_master_granted_ext_ram_s1,
      cpu_data_master_granted_lan91c111_s1 => cpu_data_master_granted_lan91c111_s1,
      cpu_data_master_qualified_request_ext_flash_s1 => cpu_data_master_qualified_request_ext_flash_s1,
      cpu_data_master_qualified_request_ext_ram_s1 => cpu_data_master_qualified_request_ext_ram_s1,
      cpu_data_master_qualified_request_lan91c111_s1 => cpu_data_master_qualified_request_lan91c111_s1,
      cpu_data_master_read_data_valid_ext_flash_s1 => cpu_data_master_read_data_valid_ext_flash_s1,
      cpu_data_master_read_data_valid_ext_ram_s1 => cpu_data_master_read_data_valid_ext_ram_s1,
      cpu_data_master_read_data_valid_lan91c111_s1 => cpu_data_master_read_data_valid_lan91c111_s1,
      cpu_data_master_requests_ext_flash_s1 => cpu_data_master_requests_ext_flash_s1,
      cpu_data_master_requests_ext_ram_s1 => cpu_data_master_requests_ext_ram_s1,
      cpu_data_master_requests_lan91c111_s1 => cpu_data_master_requests_lan91c111_s1,
      cpu_instruction_master_granted_ext_flash_s1 => cpu_instruction_master_granted_ext_flash_s1,
      cpu_instruction_master_granted_ext_ram_s1 => cpu_instruction_master_granted_ext_ram_s1,
      cpu_instruction_master_granted_lan91c111_s1 => cpu_instruction_master_granted_lan91c111_s1,
      cpu_instruction_master_qualified_request_ext_flash_s1 => cpu_instruction_master_qualified_request_ext_flash_s1,
      cpu_instruction_master_qualified_request_ext_ram_s1 => cpu_instruction_master_qualified_request_ext_ram_s1,
      cpu_instruction_master_qualified_request_lan91c111_s1 => cpu_instruction_master_qualified_request_lan91c111_s1,
      cpu_instruction_master_read_data_valid_ext_flash_s1 => cpu_instruction_master_read_data_valid_ext_flash_s1,
      cpu_instruction_master_read_data_valid_ext_ram_s1 => cpu_instruction_master_read_data_valid_ext_ram_s1,
      cpu_instruction_master_read_data_valid_lan91c111_s1 => cpu_instruction_master_read_data_valid_lan91c111_s1,
      cpu_instruction_master_requests_ext_flash_s1 => cpu_instruction_master_requests_ext_flash_s1,
      cpu_instruction_master_requests_ext_ram_s1 => cpu_instruction_master_requests_ext_ram_s1,
      cpu_instruction_master_requests_lan91c111_s1 => cpu_instruction_master_requests_lan91c111_s1,
      d1_ext_ram_bus_avalon_slave_end_xfer => d1_ext_ram_bus_avalon_slave_end_xfer,
      d1_irq_from_the_lan91c111 => d1_irq_from_the_lan91c111,
      ext_flash_s1_wait_counter_eq_0 => ext_flash_s1_wait_counter_eq_0,
      ext_flash_s1_wait_counter_eq_1 => ext_flash_s1_wait_counter_eq_1,
      ext_ram_bus_address => internal_ext_ram_bus_address,
      ext_ram_bus_data => ext_ram_bus_data,
      incoming_ext_ram_bus_data => incoming_ext_ram_bus_data,
      incoming_ext_ram_bus_data_with_Xs_converted_to_0 => incoming_ext_ram_bus_data_with_Xs_converted_to_0,
      ior_n_to_the_lan91c111 => internal_ior_n_to_the_lan91c111,
      iow_n_to_the_lan91c111 => internal_iow_n_to_the_lan91c111,
      lan91c111_s1_wait_counter_eq_0 => lan91c111_s1_wait_counter_eq_0,
      lan91c111_s1_wait_counter_eq_1 => lan91c111_s1_wait_counter_eq_1,
      read_n_to_the_ext_flash => internal_read_n_to_the_ext_flash,
      read_n_to_the_ext_ram => internal_read_n_to_the_ext_ram,
      registered_cpu_data_master_read_data_valid_ext_flash_s1 => registered_cpu_data_master_read_data_valid_ext_flash_s1,
      registered_cpu_data_master_read_data_valid_ext_ram_s1 => registered_cpu_data_master_read_data_valid_ext_ram_s1,
      registered_cpu_data_master_read_data_valid_lan91c111_s1 => registered_cpu_data_master_read_data_valid_lan91c111_s1,
      reset_to_the_lan91c111 => internal_reset_to_the_lan91c111,
      select_n_to_the_ext_flash => internal_select_n_to_the_ext_flash,
      select_n_to_the_ext_ram => internal_select_n_to_the_ext_ram,
      write_n_to_the_ext_flash => internal_write_n_to_the_ext_flash,
      write_n_to_the_ext_ram => internal_write_n_to_the_ext_ram,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_byteenable => cpu_data_master_byteenable,
      cpu_data_master_dbs_address => cpu_data_master_dbs_address,
      cpu_data_master_dbs_write_8 => cpu_data_master_dbs_write_8,
      cpu_data_master_no_byte_enables_and_last_term => cpu_data_master_no_byte_enables_and_last_term,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      cpu_instruction_master_address_to_slave => cpu_instruction_master_address_to_slave,
      cpu_instruction_master_dbs_address => cpu_instruction_master_dbs_address,
      cpu_instruction_master_latency_counter => cpu_instruction_master_latency_counter,
      cpu_instruction_master_read => cpu_instruction_master_read,
      cpu_instruction_master_read_data_valid_sdram_s1_shift_register => cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
      irq_from_the_lan91c111 => irq_from_the_lan91c111,
      reset_n => pll_c0_out_reset_n
    );


  --the_high_res_timer_s1, which is an e_instance
  the_high_res_timer_s1 : high_res_timer_s1_arbitrator
    port map(
      cpu_data_master_granted_high_res_timer_s1 => cpu_data_master_granted_high_res_timer_s1,
      cpu_data_master_qualified_request_high_res_timer_s1 => cpu_data_master_qualified_request_high_res_timer_s1,
      cpu_data_master_read_data_valid_high_res_timer_s1 => cpu_data_master_read_data_valid_high_res_timer_s1,
      cpu_data_master_requests_high_res_timer_s1 => cpu_data_master_requests_high_res_timer_s1,
      d1_high_res_timer_s1_end_xfer => d1_high_res_timer_s1_end_xfer,
      high_res_timer_s1_address => high_res_timer_s1_address,
      high_res_timer_s1_chipselect => high_res_timer_s1_chipselect,
      high_res_timer_s1_irq_from_sa => high_res_timer_s1_irq_from_sa,
      high_res_timer_s1_readdata_from_sa => high_res_timer_s1_readdata_from_sa,
      high_res_timer_s1_reset_n => high_res_timer_s1_reset_n,
      high_res_timer_s1_write_n => high_res_timer_s1_write_n,
      high_res_timer_s1_writedata => high_res_timer_s1_writedata,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      high_res_timer_s1_irq => high_res_timer_s1_irq,
      high_res_timer_s1_readdata => high_res_timer_s1_readdata,
      reset_n => pll_c0_out_reset_n
    );


  --the_high_res_timer, which is an e_ptf_instance
  the_high_res_timer : high_res_timer
    port map(
      irq => high_res_timer_s1_irq,
      readdata => high_res_timer_s1_readdata,
      address => high_res_timer_s1_address,
      chipselect => high_res_timer_s1_chipselect,
      clk => internal_pll_c0_out,
      reset_n => high_res_timer_s1_reset_n,
      write_n => high_res_timer_s1_write_n,
      writedata => high_res_timer_s1_writedata
    );


  --the_jtag_uart_avalon_jtag_slave, which is an e_instance
  the_jtag_uart_avalon_jtag_slave : jtag_uart_avalon_jtag_slave_arbitrator
    port map(
      cpu_data_master_granted_jtag_uart_avalon_jtag_slave => cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
      cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave => cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
      cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave => cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
      cpu_data_master_requests_jtag_uart_avalon_jtag_slave => cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
      d1_jtag_uart_avalon_jtag_slave_end_xfer => d1_jtag_uart_avalon_jtag_slave_end_xfer,
      jtag_uart_avalon_jtag_slave_address => jtag_uart_avalon_jtag_slave_address,
      jtag_uart_avalon_jtag_slave_chipselect => jtag_uart_avalon_jtag_slave_chipselect,
      jtag_uart_avalon_jtag_slave_dataavailable_from_sa => jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
      jtag_uart_avalon_jtag_slave_irq_from_sa => jtag_uart_avalon_jtag_slave_irq_from_sa,
      jtag_uart_avalon_jtag_slave_read_n => jtag_uart_avalon_jtag_slave_read_n,
      jtag_uart_avalon_jtag_slave_readdata_from_sa => jtag_uart_avalon_jtag_slave_readdata_from_sa,
      jtag_uart_avalon_jtag_slave_readyfordata_from_sa => jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
      jtag_uart_avalon_jtag_slave_reset_n => jtag_uart_avalon_jtag_slave_reset_n,
      jtag_uart_avalon_jtag_slave_waitrequest_from_sa => jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
      jtag_uart_avalon_jtag_slave_write_n => jtag_uart_avalon_jtag_slave_write_n,
      jtag_uart_avalon_jtag_slave_writedata => jtag_uart_avalon_jtag_slave_writedata,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      jtag_uart_avalon_jtag_slave_dataavailable => jtag_uart_avalon_jtag_slave_dataavailable,
      jtag_uart_avalon_jtag_slave_irq => jtag_uart_avalon_jtag_slave_irq,
      jtag_uart_avalon_jtag_slave_readdata => jtag_uart_avalon_jtag_slave_readdata,
      jtag_uart_avalon_jtag_slave_readyfordata => jtag_uart_avalon_jtag_slave_readyfordata,
      jtag_uart_avalon_jtag_slave_waitrequest => jtag_uart_avalon_jtag_slave_waitrequest,
      reset_n => pll_c0_out_reset_n
    );


  --the_jtag_uart, which is an e_ptf_instance
  the_jtag_uart : jtag_uart
    port map(
      av_irq => jtag_uart_avalon_jtag_slave_irq,
      av_readdata => jtag_uart_avalon_jtag_slave_readdata,
      av_waitrequest => jtag_uart_avalon_jtag_slave_waitrequest,
      dataavailable => jtag_uart_avalon_jtag_slave_dataavailable,
      readyfordata => jtag_uart_avalon_jtag_slave_readyfordata,
      av_address => jtag_uart_avalon_jtag_slave_address,
      av_chipselect => jtag_uart_avalon_jtag_slave_chipselect,
      av_read_n => jtag_uart_avalon_jtag_slave_read_n,
      av_write_n => jtag_uart_avalon_jtag_slave_write_n,
      av_writedata => jtag_uart_avalon_jtag_slave_writedata,
      clk => internal_pll_c0_out,
      rst_n => jtag_uart_avalon_jtag_slave_reset_n
    );


  --the_lcd_display_control_slave, which is an e_instance
  the_lcd_display_control_slave : lcd_display_control_slave_arbitrator
    port map(
      cpu_data_master_granted_lcd_display_control_slave => cpu_data_master_granted_lcd_display_control_slave,
      cpu_data_master_qualified_request_lcd_display_control_slave => cpu_data_master_qualified_request_lcd_display_control_slave,
      cpu_data_master_read_data_valid_lcd_display_control_slave => cpu_data_master_read_data_valid_lcd_display_control_slave,
      cpu_data_master_requests_lcd_display_control_slave => cpu_data_master_requests_lcd_display_control_slave,
      d1_lcd_display_control_slave_end_xfer => d1_lcd_display_control_slave_end_xfer,
      lcd_display_control_slave_address => lcd_display_control_slave_address,
      lcd_display_control_slave_begintransfer => lcd_display_control_slave_begintransfer,
      lcd_display_control_slave_read => lcd_display_control_slave_read,
      lcd_display_control_slave_readdata_from_sa => lcd_display_control_slave_readdata_from_sa,
      lcd_display_control_slave_wait_counter_eq_0 => lcd_display_control_slave_wait_counter_eq_0,
      lcd_display_control_slave_wait_counter_eq_1 => lcd_display_control_slave_wait_counter_eq_1,
      lcd_display_control_slave_write => lcd_display_control_slave_write,
      lcd_display_control_slave_writedata => lcd_display_control_slave_writedata,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_byteenable => cpu_data_master_byteenable,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      lcd_display_control_slave_readdata => lcd_display_control_slave_readdata,
      reset_n => pll_c0_out_reset_n
    );


  --the_lcd_display, which is an e_ptf_instance
  the_lcd_display : lcd_display
    port map(
      LCD_E => internal_LCD_E_from_the_lcd_display,
      LCD_RS => internal_LCD_RS_from_the_lcd_display,
      LCD_RW => internal_LCD_RW_from_the_lcd_display,
      LCD_data => LCD_data_to_and_from_the_lcd_display,
      readdata => lcd_display_control_slave_readdata,
      address => lcd_display_control_slave_address,
      begintransfer => lcd_display_control_slave_begintransfer,
      read => lcd_display_control_slave_read,
      write => lcd_display_control_slave_write,
      writedata => lcd_display_control_slave_writedata
    );


  --the_led_pio_s1, which is an e_instance
  the_led_pio_s1 : led_pio_s1_arbitrator
    port map(
      cpu_data_master_granted_led_pio_s1 => cpu_data_master_granted_led_pio_s1,
      cpu_data_master_qualified_request_led_pio_s1 => cpu_data_master_qualified_request_led_pio_s1,
      cpu_data_master_read_data_valid_led_pio_s1 => cpu_data_master_read_data_valid_led_pio_s1,
      cpu_data_master_requests_led_pio_s1 => cpu_data_master_requests_led_pio_s1,
      d1_led_pio_s1_end_xfer => d1_led_pio_s1_end_xfer,
      led_pio_s1_address => led_pio_s1_address,
      led_pio_s1_chipselect => led_pio_s1_chipselect,
      led_pio_s1_readdata_from_sa => led_pio_s1_readdata_from_sa,
      led_pio_s1_reset_n => led_pio_s1_reset_n,
      led_pio_s1_write_n => led_pio_s1_write_n,
      led_pio_s1_writedata => led_pio_s1_writedata,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_byteenable => cpu_data_master_byteenable,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      led_pio_s1_readdata => led_pio_s1_readdata,
      reset_n => pll_c0_out_reset_n
    );


  --the_led_pio, which is an e_ptf_instance
  the_led_pio : led_pio
    port map(
      out_port => internal_out_port_from_the_led_pio,
      readdata => led_pio_s1_readdata,
      address => led_pio_s1_address,
      chipselect => led_pio_s1_chipselect,
      clk => internal_pll_c0_out,
      reset_n => led_pio_s1_reset_n,
      write_n => led_pio_s1_write_n,
      writedata => led_pio_s1_writedata
    );


  --the_onchip_ram_s1, which is an e_instance
  the_onchip_ram_s1 : onchip_ram_s1_arbitrator
    port map(
      cpu_data_master_granted_onchip_ram_s1 => cpu_data_master_granted_onchip_ram_s1,
      cpu_data_master_qualified_request_onchip_ram_s1 => cpu_data_master_qualified_request_onchip_ram_s1,
      cpu_data_master_read_data_valid_onchip_ram_s1 => cpu_data_master_read_data_valid_onchip_ram_s1,
      cpu_data_master_requests_onchip_ram_s1 => cpu_data_master_requests_onchip_ram_s1,
      cpu_instruction_master_granted_onchip_ram_s1 => cpu_instruction_master_granted_onchip_ram_s1,
      cpu_instruction_master_qualified_request_onchip_ram_s1 => cpu_instruction_master_qualified_request_onchip_ram_s1,
      cpu_instruction_master_read_data_valid_onchip_ram_s1 => cpu_instruction_master_read_data_valid_onchip_ram_s1,
      cpu_instruction_master_requests_onchip_ram_s1 => cpu_instruction_master_requests_onchip_ram_s1,
      d1_onchip_ram_s1_end_xfer => d1_onchip_ram_s1_end_xfer,
      onchip_ram_s1_address => onchip_ram_s1_address,
      onchip_ram_s1_byteenable => onchip_ram_s1_byteenable,
      onchip_ram_s1_chipselect => onchip_ram_s1_chipselect,
      onchip_ram_s1_clken => onchip_ram_s1_clken,
      onchip_ram_s1_readdata_from_sa => onchip_ram_s1_readdata_from_sa,
      onchip_ram_s1_write => onchip_ram_s1_write,
      onchip_ram_s1_writedata => onchip_ram_s1_writedata,
      registered_cpu_data_master_read_data_valid_onchip_ram_s1 => registered_cpu_data_master_read_data_valid_onchip_ram_s1,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_byteenable => cpu_data_master_byteenable,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      cpu_instruction_master_address_to_slave => cpu_instruction_master_address_to_slave,
      cpu_instruction_master_latency_counter => cpu_instruction_master_latency_counter,
      cpu_instruction_master_read => cpu_instruction_master_read,
      cpu_instruction_master_read_data_valid_sdram_s1_shift_register => cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
      onchip_ram_s1_readdata => onchip_ram_s1_readdata,
      reset_n => pll_c0_out_reset_n
    );


  --the_onchip_ram, which is an e_ptf_instance
  the_onchip_ram : onchip_ram
    port map(
      readdata => onchip_ram_s1_readdata,
      address => onchip_ram_s1_address,
      byteenable => onchip_ram_s1_byteenable,
      chipselect => onchip_ram_s1_chipselect,
      clk => internal_pll_c0_out,
      clken => onchip_ram_s1_clken,
      write => onchip_ram_s1_write,
      writedata => onchip_ram_s1_writedata
    );


  --the_pll_s1, which is an e_instance
  the_pll_s1 : pll_s1_arbitrator
    port map(
      NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1 => NiosII_stratix_1s10_standard_clock_0_out_granted_pll_s1,
      NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1 => NiosII_stratix_1s10_standard_clock_0_out_qualified_request_pll_s1,
      NiosII_stratix_1s10_standard_clock_0_out_read_data_valid_pll_s1 => NiosII_stratix_1s10_standard_clock_0_out_read_data_valid_pll_s1,
      NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1 => NiosII_stratix_1s10_standard_clock_0_out_requests_pll_s1,
      d1_pll_s1_end_xfer => d1_pll_s1_end_xfer,
      pll_s1_address => pll_s1_address,
      pll_s1_chipselect => pll_s1_chipselect,
      pll_s1_read => pll_s1_read,
      pll_s1_readdata_from_sa => pll_s1_readdata_from_sa,
      pll_s1_reset_n => pll_s1_reset_n,
      pll_s1_resetrequest_from_sa => pll_s1_resetrequest_from_sa,
      pll_s1_write => pll_s1_write,
      pll_s1_writedata => pll_s1_writedata,
      NiosII_stratix_1s10_standard_clock_0_out_address_to_slave => NiosII_stratix_1s10_standard_clock_0_out_address_to_slave,
      NiosII_stratix_1s10_standard_clock_0_out_nativeaddress => NiosII_stratix_1s10_standard_clock_0_out_nativeaddress,
      NiosII_stratix_1s10_standard_clock_0_out_read => NiosII_stratix_1s10_standard_clock_0_out_read,
      NiosII_stratix_1s10_standard_clock_0_out_write => NiosII_stratix_1s10_standard_clock_0_out_write,
      NiosII_stratix_1s10_standard_clock_0_out_writedata => NiosII_stratix_1s10_standard_clock_0_out_writedata,
      clk => clk,
      pll_s1_readdata => pll_s1_readdata,
      pll_s1_resetrequest => pll_s1_resetrequest,
      reset_n => clk_reset_n
    );


  --pll_c0_out out_clk assignment, which is an e_assign
  internal_pll_c0_out <= out_clk_pll_c0;
  --pll_e0_out out_clk assignment, which is an e_assign
  pll_e0_out <= out_clk_pll_e0;
  --the_pll, which is an e_ptf_instance
  the_pll : pll
    port map(
      c0 => out_clk_pll_c0,
      e0 => out_clk_pll_e0,
      readdata => pll_s1_readdata,
      resetrequest => pll_s1_resetrequest,
      address => pll_s1_address,
      chipselect => pll_s1_chipselect,
      clk => clk,
      read => pll_s1_read,
      reset_n => pll_s1_reset_n,
      write => pll_s1_write,
      writedata => pll_s1_writedata
    );


  --the_reconfig_request_pio_s1, which is an e_instance
  the_reconfig_request_pio_s1 : reconfig_request_pio_s1_arbitrator
    port map(
      cpu_data_master_granted_reconfig_request_pio_s1 => cpu_data_master_granted_reconfig_request_pio_s1,
      cpu_data_master_qualified_request_reconfig_request_pio_s1 => cpu_data_master_qualified_request_reconfig_request_pio_s1,
      cpu_data_master_read_data_valid_reconfig_request_pio_s1 => cpu_data_master_read_data_valid_reconfig_request_pio_s1,
      cpu_data_master_requests_reconfig_request_pio_s1 => cpu_data_master_requests_reconfig_request_pio_s1,
      d1_reconfig_request_pio_s1_end_xfer => d1_reconfig_request_pio_s1_end_xfer,
      reconfig_request_pio_s1_address => reconfig_request_pio_s1_address,
      reconfig_request_pio_s1_chipselect => reconfig_request_pio_s1_chipselect,
      reconfig_request_pio_s1_readdata_from_sa => reconfig_request_pio_s1_readdata_from_sa,
      reconfig_request_pio_s1_reset_n => reconfig_request_pio_s1_reset_n,
      reconfig_request_pio_s1_write_n => reconfig_request_pio_s1_write_n,
      reconfig_request_pio_s1_writedata => reconfig_request_pio_s1_writedata,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      reconfig_request_pio_s1_readdata => reconfig_request_pio_s1_readdata,
      reset_n => pll_c0_out_reset_n
    );


  --the_reconfig_request_pio, which is an e_ptf_instance
  the_reconfig_request_pio : reconfig_request_pio
    port map(
      bidir_port => bidir_port_to_and_from_the_reconfig_request_pio,
      readdata => reconfig_request_pio_s1_readdata,
      address => reconfig_request_pio_s1_address,
      chipselect => reconfig_request_pio_s1_chipselect,
      clk => internal_pll_c0_out,
      reset_n => reconfig_request_pio_s1_reset_n,
      write_n => reconfig_request_pio_s1_write_n,
      writedata => reconfig_request_pio_s1_writedata
    );


  --the_sdram_s1, which is an e_instance
  the_sdram_s1 : sdram_s1_arbitrator
    port map(
      cpu_data_master_granted_sdram_s1 => cpu_data_master_granted_sdram_s1,
      cpu_data_master_qualified_request_sdram_s1 => cpu_data_master_qualified_request_sdram_s1,
      cpu_data_master_read_data_valid_sdram_s1 => cpu_data_master_read_data_valid_sdram_s1,
      cpu_data_master_read_data_valid_sdram_s1_shift_register => cpu_data_master_read_data_valid_sdram_s1_shift_register,
      cpu_data_master_requests_sdram_s1 => cpu_data_master_requests_sdram_s1,
      cpu_instruction_master_granted_sdram_s1 => cpu_instruction_master_granted_sdram_s1,
      cpu_instruction_master_qualified_request_sdram_s1 => cpu_instruction_master_qualified_request_sdram_s1,
      cpu_instruction_master_read_data_valid_sdram_s1 => cpu_instruction_master_read_data_valid_sdram_s1,
      cpu_instruction_master_read_data_valid_sdram_s1_shift_register => cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
      cpu_instruction_master_requests_sdram_s1 => cpu_instruction_master_requests_sdram_s1,
      d1_sdram_s1_end_xfer => d1_sdram_s1_end_xfer,
      sdram_s1_address => sdram_s1_address,
      sdram_s1_byteenable_n => sdram_s1_byteenable_n,
      sdram_s1_chipselect => sdram_s1_chipselect,
      sdram_s1_read_n => sdram_s1_read_n,
      sdram_s1_readdata_from_sa => sdram_s1_readdata_from_sa,
      sdram_s1_reset_n => sdram_s1_reset_n,
      sdram_s1_waitrequest_from_sa => sdram_s1_waitrequest_from_sa,
      sdram_s1_write_n => sdram_s1_write_n,
      sdram_s1_writedata => sdram_s1_writedata,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_byteenable => cpu_data_master_byteenable,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      cpu_instruction_master_address_to_slave => cpu_instruction_master_address_to_slave,
      cpu_instruction_master_latency_counter => cpu_instruction_master_latency_counter,
      cpu_instruction_master_read => cpu_instruction_master_read,
      reset_n => pll_c0_out_reset_n,
      sdram_s1_readdata => sdram_s1_readdata,
      sdram_s1_readdatavalid => sdram_s1_readdatavalid,
      sdram_s1_waitrequest => sdram_s1_waitrequest
    );


  --the_sdram, which is an e_ptf_instance
  the_sdram : sdram
    port map(
      za_data => sdram_s1_readdata,
      za_valid => sdram_s1_readdatavalid,
      za_waitrequest => sdram_s1_waitrequest,
      zs_addr => internal_zs_addr_from_the_sdram,
      zs_ba => internal_zs_ba_from_the_sdram,
      zs_cas_n => internal_zs_cas_n_from_the_sdram,
      zs_cke => internal_zs_cke_from_the_sdram,
      zs_cs_n => internal_zs_cs_n_from_the_sdram,
      zs_dq => zs_dq_to_and_from_the_sdram,
      zs_dqm => internal_zs_dqm_from_the_sdram,
      zs_ras_n => internal_zs_ras_n_from_the_sdram,
      zs_we_n => internal_zs_we_n_from_the_sdram,
      az_addr => sdram_s1_address,
      az_be_n => sdram_s1_byteenable_n,
      az_cs => sdram_s1_chipselect,
      az_data => sdram_s1_writedata,
      az_rd_n => sdram_s1_read_n,
      az_wr_n => sdram_s1_write_n,
      clk => internal_pll_c0_out,
      reset_n => sdram_s1_reset_n
    );


  --the_seven_seg_pio_s1, which is an e_instance
  the_seven_seg_pio_s1 : seven_seg_pio_s1_arbitrator
    port map(
      cpu_data_master_granted_seven_seg_pio_s1 => cpu_data_master_granted_seven_seg_pio_s1,
      cpu_data_master_qualified_request_seven_seg_pio_s1 => cpu_data_master_qualified_request_seven_seg_pio_s1,
      cpu_data_master_read_data_valid_seven_seg_pio_s1 => cpu_data_master_read_data_valid_seven_seg_pio_s1,
      cpu_data_master_requests_seven_seg_pio_s1 => cpu_data_master_requests_seven_seg_pio_s1,
      d1_seven_seg_pio_s1_end_xfer => d1_seven_seg_pio_s1_end_xfer,
      seven_seg_pio_s1_address => seven_seg_pio_s1_address,
      seven_seg_pio_s1_chipselect => seven_seg_pio_s1_chipselect,
      seven_seg_pio_s1_readdata_from_sa => seven_seg_pio_s1_readdata_from_sa,
      seven_seg_pio_s1_reset_n => seven_seg_pio_s1_reset_n,
      seven_seg_pio_s1_write_n => seven_seg_pio_s1_write_n,
      seven_seg_pio_s1_writedata => seven_seg_pio_s1_writedata,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      reset_n => pll_c0_out_reset_n,
      seven_seg_pio_s1_readdata => seven_seg_pio_s1_readdata
    );


  --the_seven_seg_pio, which is an e_ptf_instance
  the_seven_seg_pio : seven_seg_pio
    port map(
      out_port => internal_out_port_from_the_seven_seg_pio,
      readdata => seven_seg_pio_s1_readdata,
      address => seven_seg_pio_s1_address,
      chipselect => seven_seg_pio_s1_chipselect,
      clk => internal_pll_c0_out,
      reset_n => seven_seg_pio_s1_reset_n,
      write_n => seven_seg_pio_s1_write_n,
      writedata => seven_seg_pio_s1_writedata
    );


  --the_sys_clk_timer_s1, which is an e_instance
  the_sys_clk_timer_s1 : sys_clk_timer_s1_arbitrator
    port map(
      cpu_data_master_granted_sys_clk_timer_s1 => cpu_data_master_granted_sys_clk_timer_s1,
      cpu_data_master_qualified_request_sys_clk_timer_s1 => cpu_data_master_qualified_request_sys_clk_timer_s1,
      cpu_data_master_read_data_valid_sys_clk_timer_s1 => cpu_data_master_read_data_valid_sys_clk_timer_s1,
      cpu_data_master_requests_sys_clk_timer_s1 => cpu_data_master_requests_sys_clk_timer_s1,
      d1_sys_clk_timer_s1_end_xfer => d1_sys_clk_timer_s1_end_xfer,
      sys_clk_timer_s1_address => sys_clk_timer_s1_address,
      sys_clk_timer_s1_chipselect => sys_clk_timer_s1_chipselect,
      sys_clk_timer_s1_irq_from_sa => sys_clk_timer_s1_irq_from_sa,
      sys_clk_timer_s1_readdata_from_sa => sys_clk_timer_s1_readdata_from_sa,
      sys_clk_timer_s1_reset_n => sys_clk_timer_s1_reset_n,
      sys_clk_timer_s1_write_n => sys_clk_timer_s1_write_n,
      sys_clk_timer_s1_writedata => sys_clk_timer_s1_writedata,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_waitrequest => cpu_data_master_waitrequest,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      reset_n => pll_c0_out_reset_n,
      sys_clk_timer_s1_irq => sys_clk_timer_s1_irq,
      sys_clk_timer_s1_readdata => sys_clk_timer_s1_readdata
    );


  --the_sys_clk_timer, which is an e_ptf_instance
  the_sys_clk_timer : sys_clk_timer
    port map(
      irq => sys_clk_timer_s1_irq,
      readdata => sys_clk_timer_s1_readdata,
      address => sys_clk_timer_s1_address,
      chipselect => sys_clk_timer_s1_chipselect,
      clk => internal_pll_c0_out,
      reset_n => sys_clk_timer_s1_reset_n,
      write_n => sys_clk_timer_s1_write_n,
      writedata => sys_clk_timer_s1_writedata
    );


  --the_sysid_control_slave, which is an e_instance
  the_sysid_control_slave : sysid_control_slave_arbitrator
    port map(
      cpu_data_master_granted_sysid_control_slave => cpu_data_master_granted_sysid_control_slave,
      cpu_data_master_qualified_request_sysid_control_slave => cpu_data_master_qualified_request_sysid_control_slave,
      cpu_data_master_read_data_valid_sysid_control_slave => cpu_data_master_read_data_valid_sysid_control_slave,
      cpu_data_master_requests_sysid_control_slave => cpu_data_master_requests_sysid_control_slave,
      d1_sysid_control_slave_end_xfer => d1_sysid_control_slave_end_xfer,
      sysid_control_slave_address => sysid_control_slave_address,
      sysid_control_slave_readdata_from_sa => sysid_control_slave_readdata_from_sa,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_write => cpu_data_master_write,
      reset_n => pll_c0_out_reset_n,
      sysid_control_slave_readdata => sysid_control_slave_readdata
    );


  --the_sysid, which is an e_ptf_instance
  the_sysid : sysid
    port map(
      readdata => sysid_control_slave_readdata,
      address => sysid_control_slave_address
    );


  --the_uart1_s1, which is an e_instance
  the_uart1_s1 : uart1_s1_arbitrator
    port map(
      cpu_data_master_granted_uart1_s1 => cpu_data_master_granted_uart1_s1,
      cpu_data_master_qualified_request_uart1_s1 => cpu_data_master_qualified_request_uart1_s1,
      cpu_data_master_read_data_valid_uart1_s1 => cpu_data_master_read_data_valid_uart1_s1,
      cpu_data_master_requests_uart1_s1 => cpu_data_master_requests_uart1_s1,
      d1_uart1_s1_end_xfer => d1_uart1_s1_end_xfer,
      uart1_s1_address => uart1_s1_address,
      uart1_s1_begintransfer => uart1_s1_begintransfer,
      uart1_s1_chipselect => uart1_s1_chipselect,
      uart1_s1_dataavailable_from_sa => uart1_s1_dataavailable_from_sa,
      uart1_s1_irq_from_sa => uart1_s1_irq_from_sa,
      uart1_s1_read_n => uart1_s1_read_n,
      uart1_s1_readdata_from_sa => uart1_s1_readdata_from_sa,
      uart1_s1_readyfordata_from_sa => uart1_s1_readyfordata_from_sa,
      uart1_s1_reset_n => uart1_s1_reset_n,
      uart1_s1_write_n => uart1_s1_write_n,
      uart1_s1_writedata => uart1_s1_writedata,
      clk => internal_pll_c0_out,
      cpu_data_master_address_to_slave => cpu_data_master_address_to_slave,
      cpu_data_master_read => cpu_data_master_read,
      cpu_data_master_write => cpu_data_master_write,
      cpu_data_master_writedata => cpu_data_master_writedata,
      reset_n => pll_c0_out_reset_n,
      uart1_s1_dataavailable => uart1_s1_dataavailable,
      uart1_s1_irq => uart1_s1_irq,
      uart1_s1_readdata => uart1_s1_readdata,
      uart1_s1_readyfordata => uart1_s1_readyfordata
    );


  --the_uart1, which is an e_ptf_instance
  the_uart1 : uart1
    port map(
      dataavailable => uart1_s1_dataavailable,
      irq => uart1_s1_irq,
      readdata => uart1_s1_readdata,
      readyfordata => uart1_s1_readyfordata,
      txd => internal_txd_from_the_uart1,
      address => uart1_s1_address,
      begintransfer => uart1_s1_begintransfer,
      chipselect => uart1_s1_chipselect,
      clk => internal_pll_c0_out,
      read_n => uart1_s1_read_n,
      reset_n => uart1_s1_reset_n,
      rxd => rxd_to_the_uart1,
      write_n => uart1_s1_write_n,
      writedata => uart1_s1_writedata
    );


  --reset is asserted asynchronously and deasserted synchronously
  NiosII_stratix_1s10_standard_reset_pll_c0_out_domain_synch : NiosII_stratix_1s10_standard_reset_pll_c0_out_domain_synch_module
    port map(
      data_out => pll_c0_out_reset_n,
      clk => internal_pll_c0_out,
      data_in => module_input6,
      reset_n => reset_n_sources
    );

  module_input6 <= std_logic'('1');

  --reset sources mux, which is an e_mux
  reset_n_sources <= Vector_To_Std_Logic(NOT ((((((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT reset_n))) OR std_logic_vector'("00000000000000000000000000000000")) OR (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_jtag_debug_module_resetrequest_from_sa)))) OR (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_jtag_debug_module_resetrequest_from_sa)))) OR std_logic_vector'("00000000000000000000000000000000")) OR (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(pll_s1_resetrequest_from_sa)))) OR (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(pll_s1_resetrequest_from_sa))))));
  --reset is asserted asynchronously and deasserted synchronously
  NiosII_stratix_1s10_standard_reset_clk_domain_synch : NiosII_stratix_1s10_standard_reset_clk_domain_synch_module
    port map(
      data_out => clk_reset_n,
      clk => clk,
      data_in => module_input7,
      reset_n => reset_n_sources
    );

  module_input7 <= std_logic'('1');

  --NiosII_stratix_1s10_standard_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  NiosII_stratix_1s10_standard_clock_0_out_endofpacket <= std_logic'('0');
  --vhdl renameroo for output signals
  LCD_E_from_the_lcd_display <= internal_LCD_E_from_the_lcd_display;
  --vhdl renameroo for output signals
  LCD_RS_from_the_lcd_display <= internal_LCD_RS_from_the_lcd_display;
  --vhdl renameroo for output signals
  LCD_RW_from_the_lcd_display <= internal_LCD_RW_from_the_lcd_display;
  --vhdl renameroo for output signals
  be_n_to_the_ext_ram <= internal_be_n_to_the_ext_ram;
  --vhdl renameroo for output signals
  byteenablen_to_the_lan91c111 <= internal_byteenablen_to_the_lan91c111;
  --vhdl renameroo for output signals
  ext_ram_bus_address <= internal_ext_ram_bus_address;
  --vhdl renameroo for output signals
  ior_n_to_the_lan91c111 <= internal_ior_n_to_the_lan91c111;
  --vhdl renameroo for output signals
  iow_n_to_the_lan91c111 <= internal_iow_n_to_the_lan91c111;
  --vhdl renameroo for output signals
  out_port_from_the_led_pio <= internal_out_port_from_the_led_pio;
  --vhdl renameroo for output signals
  out_port_from_the_seven_seg_pio <= internal_out_port_from_the_seven_seg_pio;
  --vhdl renameroo for output signals
  pll_c0_out <= internal_pll_c0_out;
  --vhdl renameroo for output signals
  read_n_to_the_ext_flash <= internal_read_n_to_the_ext_flash;
  --vhdl renameroo for output signals
  read_n_to_the_ext_ram <= internal_read_n_to_the_ext_ram;
  --vhdl renameroo for output signals
  reset_to_the_lan91c111 <= internal_reset_to_the_lan91c111;
  --vhdl renameroo for output signals
  select_n_to_the_ext_flash <= internal_select_n_to_the_ext_flash;
  --vhdl renameroo for output signals
  select_n_to_the_ext_ram <= internal_select_n_to_the_ext_ram;
  --vhdl renameroo for output signals
  txd_from_the_uart1 <= internal_txd_from_the_uart1;
  --vhdl renameroo for output signals
  write_n_to_the_ext_flash <= internal_write_n_to_the_ext_flash;
  --vhdl renameroo for output signals
  write_n_to_the_ext_ram <= internal_write_n_to_the_ext_ram;
  --vhdl renameroo for output signals
  zs_addr_from_the_sdram <= internal_zs_addr_from_the_sdram;
  --vhdl renameroo for output signals
  zs_ba_from_the_sdram <= internal_zs_ba_from_the_sdram;
  --vhdl renameroo for output signals
  zs_cas_n_from_the_sdram <= internal_zs_cas_n_from_the_sdram;
  --vhdl renameroo for output signals
  zs_cke_from_the_sdram <= internal_zs_cke_from_the_sdram;
  --vhdl renameroo for output signals
  zs_cs_n_from_the_sdram <= internal_zs_cs_n_from_the_sdram;
  --vhdl renameroo for output signals
  zs_dqm_from_the_sdram <= internal_zs_dqm_from_the_sdram;
  --vhdl renameroo for output signals
  zs_ras_n_from_the_sdram <= internal_zs_ras_n_from_the_sdram;
  --vhdl renameroo for output signals
  zs_we_n_from_the_sdram <= internal_zs_we_n_from_the_sdram;

end europa;


--synthesis translate_off

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity ext_flash_lane0_module is 
        port (
              -- inputs:
                 signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal rdaddress : IN STD_LOGIC_VECTOR (22 DOWNTO 0);
                 signal rdclken : IN STD_LOGIC;
                 signal wraddress : IN STD_LOGIC_VECTOR (22 DOWNTO 0);
                 signal wrclock : IN STD_LOGIC;
                 signal wren : IN STD_LOGIC;

              -- outputs:
                 signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
              );
end entity ext_flash_lane0_module;


architecture europa of ext_flash_lane0_module is
              signal internal_q :  STD_LOGIC_VECTOR (7 DOWNTO 0);
              TYPE mem_array is ARRAY( 8388607 DOWNTO 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
              signal memory_has_been_read :  STD_LOGIC;
              signal read_address :  STD_LOGIC_VECTOR (22 DOWNTO 0);

      
FUNCTION convert_string_to_number(string_to_convert : STRING;
      final_char_index : NATURAL := 0)
RETURN NATURAL IS
   VARIABLE result: NATURAL := 0;
   VARIABLE current_index : NATURAL := 1;
   VARIABLE the_char : CHARACTER;

   BEGIN
      IF final_char_index = 0 THEN
         result := 0;
	 ELSE
         WHILE current_index <= final_char_index LOOP
            the_char := string_to_convert(current_index);
            IF    '0' <= the_char AND the_char <= '9' THEN
               result := result * 16 + character'pos(the_char) - character'pos('0');
            ELSIF 'A' <= the_char AND the_char <= 'F' THEN
               result := result * 16 + character'pos(the_char) - character'pos('A') + 10;
            ELSIF 'a' <= the_char AND the_char <= 'f' THEN
               result := result * 16 + character'pos(the_char) - character'pos('a') + 10;
            ELSE
               report "Ack, a formatting error!";
            END IF;
            current_index := current_index + 1;
         END LOOP;
      END IF; 
   RETURN result;
END convert_string_to_number;

 FUNCTION convert_string_to_std_logic(value : STRING; num_chars : INTEGER; mem_width_bits : INTEGER)
 RETURN STD_LOGIC_VECTOR is			   
     VARIABLE conv_string: std_logic_vector((mem_width_bits + 4)-1 downto 0);
     VARIABLE result : std_logic_vector((mem_width_bits -1) downto 0);
     VARIABLE curr_char : integer;
              
     BEGIN
     result := (others => '0');
     conv_string := (others => '0');
     
          FOR I IN 1 TO num_chars LOOP
	     curr_char := num_chars - (I-1);

             CASE value(I) IS
               WHEN '0' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0000";
               WHEN '1' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0001";
               WHEN '2' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0010";
               WHEN '3' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0011";
               WHEN '4' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0100";
               WHEN '5' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0101";
               WHEN '6' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0110";
               WHEN '7' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0111";
               WHEN '8' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1000";
               WHEN '9' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1001";
               WHEN 'A' | 'a' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1010";
               WHEN 'B' | 'b' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1011";
               WHEN 'C' | 'c' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1100";
               WHEN 'D' | 'd' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1101";
               WHEN 'E' | 'e' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1110";
               WHEN 'F' | 'f' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1111";
               WHEN 'X' | 'x' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "XXXX";
               WHEN ' ' => EXIT;
               WHEN HT  => exit;
               WHEN others =>
                  ASSERT False
                  REPORT "function From_Hex: string """ & value & """ contains non-hex character"
                       severity Error;
                  EXIT;
               END case;
            END loop;

          -- convert back to normal bit size
          result(mem_width_bits - 1 downto 0) := conv_string(mem_width_bits - 1 downto 0);

          RETURN result;
        END convert_string_to_std_logic;



begin
   process (wrclock, rdaddress) -- MG
    VARIABLE data_line : LINE;
    VARIABLE the_character_from_data_line : CHARACTER;
    VARIABLE b_munging_address : BOOLEAN := FALSE;
    VARIABLE converted_number : NATURAL := 0;
    VARIABLE found_string_array : STRING(1 TO 128);
    VARIABLE string_index : NATURAL := 0;
    VARIABLE line_length : NATURAL := 0;
    VARIABLE b_convert : BOOLEAN := FALSE;
    VARIABLE b_found_new_val : BOOLEAN := FALSE;
    VARIABLE load_address : NATURAL := 0;
    VARIABLE mem_index : NATURAL := 0;
    VARIABLE mem_init : BOOLEAN := FALSE;

    VARIABLE wr_address_internal : STD_LOGIC_VECTOR (22 DOWNTO 0) := (others => '0');
    FILE memory_contents_file : TEXT OPEN read_mode IS "ext_flash.dat";  
    variable Marc_Gaucherons_Memory_Variable : mem_array; -- MG
    
    begin
   -- need an initialization process
   -- this process initializes the whole memory array from a named file by copying the
   -- contents of the *.dat file to the memory array.

   -- find the @<address> thingy to load the memory from this point 
IF(NOT mem_init) THEN
   WHILE NOT(endfile(memory_contents_file)) LOOP

      readline(memory_contents_file, data_line);
      line_length := data_line'LENGTH;


      WHILE line_length > 0 LOOP
         read(data_line, the_character_from_data_line);

	       -- check for the @ character indicating a new address wad
 	       -- if not found, we're either still reading the new address _or_loading data
         IF '@' = the_character_from_data_line AND NOT b_munging_address THEN
  	    b_munging_address := TRUE;
            b_found_new_val := TRUE; 
	    -- get the rest of characters before white space and then convert them
	    -- to a number
	 ELSE 

            IF (' ' = the_character_from_data_line AND b_found_new_val) 
		OR (line_length = 1) THEN
               b_convert := TRUE;
	    END IF;

            IF NOT(' ' = the_character_from_data_line) THEN
               string_index := string_index + 1;
               found_string_array(string_index) := the_character_from_data_line;
--               IF NOT(b_munging_address) THEN
--                 dat_string_array(string_index) := the_character_from_data_line;
--               END IF;
	       b_found_new_val := TRUE;
            END IF;
	 END IF;

     IF b_convert THEN

       IF b_munging_address THEN
          converted_number := convert_string_to_number(found_string_array, string_index);    
          load_address := converted_number;
          mem_index := load_address;
--          mem_index := load_address / 1;
          b_munging_address := FALSE;
       ELSE
	  IF (mem_index < 8388608) THEN
	    Marc_Gaucherons_Memory_Variable(mem_index) := convert_string_to_std_logic(found_string_array, string_index, 8);
            mem_index := mem_index + 1;
          END IF;
       END IF; 
       b_convert := FALSE;
       b_found_new_val := FALSE;
       string_index := 0;
    END IF;
    line_length := line_length - 1; 
    END LOOP;

END LOOP;
-- get the first _real_ block of data, sized to our memory width
-- and keep on loading.
  mem_init := TRUE;
END IF;
-- END OF READMEM



      -- Write data
      if wrclock'event and wrclock = '1' then
        wr_address_internal := wraddress;
        if wren = '1' then 
          Marc_Gaucherons_Memory_Variable(CONV_INTEGER(UNSIGNED(wr_address_internal))) := data;
        end if;
      end if;

      -- read data
      q <= Marc_Gaucherons_Memory_Variable(CONV_INTEGER(UNSIGNED(rdaddress)));
      


    end process;
end europa;

--synthesis translate_on


--synthesis read_comments_as_HDL on
--library altera;
--use altera.altera_europa_support_lib.all;
--
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--library std;
--use std.textio.all;
--
--entity ext_flash_lane0_module is 
--        port (
--              
--                 signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--                 signal rdaddress : IN STD_LOGIC_VECTOR (22 DOWNTO 0);
--                 signal rdclken : IN STD_LOGIC;
--                 signal wraddress : IN STD_LOGIC_VECTOR (22 DOWNTO 0);
--                 signal wrclock : IN STD_LOGIC;
--                 signal wren : IN STD_LOGIC;
--
--              
--                 signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
--              );
--end entity ext_flash_lane0_module;
--
--
--architecture europa of ext_flash_lane0_module is
--  component lpm_ram_dp is
--GENERIC (
--      lpm_file : STRING;
--        lpm_hint : STRING;
--        lpm_indata : STRING;
--        lpm_outdata : STRING;
--        lpm_rdaddress_control : STRING;
--        lpm_width : NATURAL;
--        lpm_widthad : NATURAL;
--        lpm_wraddress_control : STRING;
--        suppress_memory_conversion_warnings : STRING
--      );
--    PORT (
--    signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
--        signal rdaddress : IN STD_LOGIC_VECTOR (22 DOWNTO 0);
--        signal wren : IN STD_LOGIC;
--        signal wrclock : IN STD_LOGIC;
--        signal wraddress : IN STD_LOGIC_VECTOR (22 DOWNTO 0);
--        signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--        signal rdclken : IN STD_LOGIC
--      );
--  end component lpm_ram_dp;
--                signal internal_q :  STD_LOGIC_VECTOR (7 DOWNTO 0);
--                TYPE mem_array is ARRAY( 8388607 DOWNTO 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
--                signal memory_has_been_read :  STD_LOGIC;
--                signal read_address :  STD_LOGIC_VECTOR (22 DOWNTO 0);
--
--begin
--
--  process (rdaddress)
--  begin
--      read_address <= rdaddress;
--
--  end process;
--
--  lpm_ram_dp_component : lpm_ram_dp
--    generic map(
--      lpm_file => "ext_flash.mif",
--      lpm_hint => "USE_EAB=ON",
--      lpm_indata => "REGISTERED",
--      lpm_outdata => "UNREGISTERED",
--      lpm_rdaddress_control => "UNREGISTERED",
--      lpm_width => 8,
--      lpm_widthad => 23,
--      lpm_wraddress_control => "REGISTERED",
--      suppress_memory_conversion_warnings => "ON"
--    )
--    port map(
--            data => data,
--            q => internal_q,
--            rdaddress => read_address,
--            rdclken => rdclken,
--            wraddress => wraddress,
--            wrclock => wrclock,
--            wren => wren
--    );
--
--  
--  q <= internal_q;
--end europa;
--
--synthesis read_comments_as_HDL off


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ext_flash is 
        port (
              -- inputs:
                 signal address : IN STD_LOGIC_VECTOR (22 DOWNTO 0);
                 signal read_n : IN STD_LOGIC;
                 signal select_n : IN STD_LOGIC;
                 signal write_n : IN STD_LOGIC;

              -- outputs:
                 signal data : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0)
              );
end entity ext_flash;


architecture europa of ext_flash is
--synthesis translate_off
component ext_flash_lane0_module is 
           port (
                 -- inputs:
                    signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal rdaddress : IN STD_LOGIC_VECTOR (22 DOWNTO 0);
                    signal rdclken : IN STD_LOGIC;
                    signal wraddress : IN STD_LOGIC_VECTOR (22 DOWNTO 0);
                    signal wrclock : IN STD_LOGIC;
                    signal wren : IN STD_LOGIC;

                 -- outputs:
                    signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component ext_flash_lane0_module;

--synthesis translate_on
                signal data_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal logic_vector_gasket :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal module_input8 :  STD_LOGIC;
                signal module_input9 :  STD_LOGIC;
                signal q_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);

begin

  --s1, which is an e_ptf_slave
--synthesis translate_off
    logic_vector_gasket <= data;
    data_0 <= logic_vector_gasket(7 DOWNTO 0);
    --ext_flash_lane0, which is an e_ram
    ext_flash_lane0 : ext_flash_lane0_module
      port map(
        q => q_0,
        data => data_0,
        rdaddress => address,
        rdclken => module_input8,
        wraddress => address,
        wrclock => write_n,
        wren => module_input9
      );

    module_input8 <= std_logic'('1');
    module_input9 <= NOT select_n;

    data <= A_WE_StdLogicVector((std_logic'(((NOT select_n AND NOT read_n))) = '1'), q_0, A_REP(std_logic'('Z'), 8));
--synthesis translate_on

end europa;


--synthesis translate_off

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity ext_ram_lane0_module is 
        port (
              -- inputs:
                 signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal rdclken : IN STD_LOGIC;
                 signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal wrclock : IN STD_LOGIC;
                 signal wren : IN STD_LOGIC;

              -- outputs:
                 signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
              );
end entity ext_ram_lane0_module;


architecture europa of ext_ram_lane0_module is
              signal internal_q1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
              TYPE mem_array is ARRAY( 262143 DOWNTO 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
              signal memory_has_been_read :  STD_LOGIC;
              signal read_address :  STD_LOGIC_VECTOR (17 DOWNTO 0);

      
FUNCTION convert_string_to_number(string_to_convert : STRING;
      final_char_index : NATURAL := 0)
RETURN NATURAL IS
   VARIABLE result: NATURAL := 0;
   VARIABLE current_index : NATURAL := 1;
   VARIABLE the_char : CHARACTER;

   BEGIN
      IF final_char_index = 0 THEN
         result := 0;
	 ELSE
         WHILE current_index <= final_char_index LOOP
            the_char := string_to_convert(current_index);
            IF    '0' <= the_char AND the_char <= '9' THEN
               result := result * 16 + character'pos(the_char) - character'pos('0');
            ELSIF 'A' <= the_char AND the_char <= 'F' THEN
               result := result * 16 + character'pos(the_char) - character'pos('A') + 10;
            ELSIF 'a' <= the_char AND the_char <= 'f' THEN
               result := result * 16 + character'pos(the_char) - character'pos('a') + 10;
            ELSE
               report "Ack, a formatting error!";
            END IF;
            current_index := current_index + 1;
         END LOOP;
      END IF; 
   RETURN result;
END convert_string_to_number;

 FUNCTION convert_string_to_std_logic(value : STRING; num_chars : INTEGER; mem_width_bits : INTEGER)
 RETURN STD_LOGIC_VECTOR is			   
     VARIABLE conv_string: std_logic_vector((mem_width_bits + 4)-1 downto 0);
     VARIABLE result : std_logic_vector((mem_width_bits -1) downto 0);
     VARIABLE curr_char : integer;
              
     BEGIN
     result := (others => '0');
     conv_string := (others => '0');
     
          FOR I IN 1 TO num_chars LOOP
	     curr_char := num_chars - (I-1);

             CASE value(I) IS
               WHEN '0' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0000";
               WHEN '1' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0001";
               WHEN '2' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0010";
               WHEN '3' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0011";
               WHEN '4' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0100";
               WHEN '5' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0101";
               WHEN '6' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0110";
               WHEN '7' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0111";
               WHEN '8' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1000";
               WHEN '9' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1001";
               WHEN 'A' | 'a' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1010";
               WHEN 'B' | 'b' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1011";
               WHEN 'C' | 'c' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1100";
               WHEN 'D' | 'd' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1101";
               WHEN 'E' | 'e' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1110";
               WHEN 'F' | 'f' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1111";
               WHEN 'X' | 'x' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "XXXX";
               WHEN ' ' => EXIT;
               WHEN HT  => exit;
               WHEN others =>
                  ASSERT False
                  REPORT "function From_Hex: string """ & value & """ contains non-hex character"
                       severity Error;
                  EXIT;
               END case;
            END loop;

          -- convert back to normal bit size
          result(mem_width_bits - 1 downto 0) := conv_string(mem_width_bits - 1 downto 0);

          RETURN result;
        END convert_string_to_std_logic;



begin
   process (wrclock, rdaddress) -- MG
    VARIABLE data_line : LINE;
    VARIABLE the_character_from_data_line : CHARACTER;
    VARIABLE b_munging_address : BOOLEAN := FALSE;
    VARIABLE converted_number : NATURAL := 0;
    VARIABLE found_string_array : STRING(1 TO 128);
    VARIABLE string_index : NATURAL := 0;
    VARIABLE line_length : NATURAL := 0;
    VARIABLE b_convert : BOOLEAN := FALSE;
    VARIABLE b_found_new_val : BOOLEAN := FALSE;
    VARIABLE load_address : NATURAL := 0;
    VARIABLE mem_index : NATURAL := 0;
    VARIABLE mem_init : BOOLEAN := FALSE;

    VARIABLE wr_address_internal : STD_LOGIC_VECTOR (17 DOWNTO 0) := (others => '0');
    FILE memory_contents_file : TEXT OPEN read_mode IS "ext_ram_lane0.dat";  
    variable Marc_Gaucherons_Memory_Variable : mem_array; -- MG
    
    begin
   -- need an initialization process
   -- this process initializes the whole memory array from a named file by copying the
   -- contents of the *.dat file to the memory array.

   -- find the @<address> thingy to load the memory from this point 
IF(NOT mem_init) THEN
   WHILE NOT(endfile(memory_contents_file)) LOOP

      readline(memory_contents_file, data_line);
      line_length := data_line'LENGTH;


      WHILE line_length > 0 LOOP
         read(data_line, the_character_from_data_line);

	       -- check for the @ character indicating a new address wad
 	       -- if not found, we're either still reading the new address _or_loading data
         IF '@' = the_character_from_data_line AND NOT b_munging_address THEN
  	    b_munging_address := TRUE;
            b_found_new_val := TRUE; 
	    -- get the rest of characters before white space and then convert them
	    -- to a number
	 ELSE 

            IF (' ' = the_character_from_data_line AND b_found_new_val) 
		OR (line_length = 1) THEN
               b_convert := TRUE;
	    END IF;

            IF NOT(' ' = the_character_from_data_line) THEN
               string_index := string_index + 1;
               found_string_array(string_index) := the_character_from_data_line;
--               IF NOT(b_munging_address) THEN
--                 dat_string_array(string_index) := the_character_from_data_line;
--               END IF;
	       b_found_new_val := TRUE;
            END IF;
	 END IF;

     IF b_convert THEN

       IF b_munging_address THEN
          converted_number := convert_string_to_number(found_string_array, string_index);    
          load_address := converted_number;
          mem_index := load_address;
--          mem_index := load_address / 1;
          b_munging_address := FALSE;
       ELSE
	  IF (mem_index < 262144) THEN
	    Marc_Gaucherons_Memory_Variable(mem_index) := convert_string_to_std_logic(found_string_array, string_index, 8);
            mem_index := mem_index + 1;
          END IF;
       END IF; 
       b_convert := FALSE;
       b_found_new_val := FALSE;
       string_index := 0;
    END IF;
    line_length := line_length - 1; 
    END LOOP;

END LOOP;
-- get the first _real_ block of data, sized to our memory width
-- and keep on loading.
  mem_init := TRUE;
END IF;
-- END OF READMEM



      -- Write data
      if wrclock'event and wrclock = '1' then
        wr_address_internal := wraddress;
        if wren = '1' then 
          Marc_Gaucherons_Memory_Variable(CONV_INTEGER(UNSIGNED(wr_address_internal))) := data;
        end if;
      end if;

      -- read data
      q <= Marc_Gaucherons_Memory_Variable(CONV_INTEGER(UNSIGNED(rdaddress)));
      


    end process;
end europa;

--synthesis translate_on


--synthesis read_comments_as_HDL on
--library altera;
--use altera.altera_europa_support_lib.all;
--
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--library std;
--use std.textio.all;
--
--entity ext_ram_lane0_module is 
--        port (
--              
--                 signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--                 signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--                 signal rdclken : IN STD_LOGIC;
--                 signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--                 signal wrclock : IN STD_LOGIC;
--                 signal wren : IN STD_LOGIC;
--
--              
--                 signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
--              );
--end entity ext_ram_lane0_module;
--
--
--architecture europa of ext_ram_lane0_module is
--  component lpm_ram_dp is
--GENERIC (
--      lpm_file : STRING;
--        lpm_hint : STRING;
--        lpm_indata : STRING;
--        lpm_outdata : STRING;
--        lpm_rdaddress_control : STRING;
--        lpm_width : NATURAL;
--        lpm_widthad : NATURAL;
--        lpm_wraddress_control : STRING;
--        suppress_memory_conversion_warnings : STRING
--      );
--    PORT (
--    signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
--        signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--        signal wren : IN STD_LOGIC;
--        signal wrclock : IN STD_LOGIC;
--        signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--        signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--        signal rdclken : IN STD_LOGIC
--      );
--  end component lpm_ram_dp;
--                signal internal_q1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
--                TYPE mem_array is ARRAY( 262143 DOWNTO 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
--                signal memory_has_been_read :  STD_LOGIC;
--                signal read_address :  STD_LOGIC_VECTOR (17 DOWNTO 0);
--
--begin
--
--  process (rdaddress)
--  begin
--      read_address <= rdaddress;
--
--  end process;
--
--  lpm_ram_dp_component : lpm_ram_dp
--    generic map(
--      lpm_file => "ext_ram_lane0.mif",
--      lpm_hint => "USE_EAB=ON",
--      lpm_indata => "REGISTERED",
--      lpm_outdata => "UNREGISTERED",
--      lpm_rdaddress_control => "UNREGISTERED",
--      lpm_width => 8,
--      lpm_widthad => 18,
--      lpm_wraddress_control => "REGISTERED",
--      suppress_memory_conversion_warnings => "ON"
--    )
--    port map(
--            data => data,
--            q => internal_q1,
--            rdaddress => read_address,
--            rdclken => rdclken,
--            wraddress => wraddress,
--            wrclock => wrclock,
--            wren => wren
--    );
--
--  
--  q <= internal_q1;
--end europa;
--
--synthesis read_comments_as_HDL off


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 


--synthesis translate_off

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity ext_ram_lane1_module is 
        port (
              -- inputs:
                 signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal rdclken : IN STD_LOGIC;
                 signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal wrclock : IN STD_LOGIC;
                 signal wren : IN STD_LOGIC;

              -- outputs:
                 signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
              );
end entity ext_ram_lane1_module;


architecture europa of ext_ram_lane1_module is
              signal internal_q2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
              TYPE mem_array is ARRAY( 262143 DOWNTO 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
              signal memory_has_been_read :  STD_LOGIC;
              signal read_address :  STD_LOGIC_VECTOR (17 DOWNTO 0);

      
FUNCTION convert_string_to_number(string_to_convert : STRING;
      final_char_index : NATURAL := 0)
RETURN NATURAL IS
   VARIABLE result: NATURAL := 0;
   VARIABLE current_index : NATURAL := 1;
   VARIABLE the_char : CHARACTER;

   BEGIN
      IF final_char_index = 0 THEN
         result := 0;
	 ELSE
         WHILE current_index <= final_char_index LOOP
            the_char := string_to_convert(current_index);
            IF    '0' <= the_char AND the_char <= '9' THEN
               result := result * 16 + character'pos(the_char) - character'pos('0');
            ELSIF 'A' <= the_char AND the_char <= 'F' THEN
               result := result * 16 + character'pos(the_char) - character'pos('A') + 10;
            ELSIF 'a' <= the_char AND the_char <= 'f' THEN
               result := result * 16 + character'pos(the_char) - character'pos('a') + 10;
            ELSE
               report "Ack, a formatting error!";
            END IF;
            current_index := current_index + 1;
         END LOOP;
      END IF; 
   RETURN result;
END convert_string_to_number;

 FUNCTION convert_string_to_std_logic(value : STRING; num_chars : INTEGER; mem_width_bits : INTEGER)
 RETURN STD_LOGIC_VECTOR is			   
     VARIABLE conv_string: std_logic_vector((mem_width_bits + 4)-1 downto 0);
     VARIABLE result : std_logic_vector((mem_width_bits -1) downto 0);
     VARIABLE curr_char : integer;
              
     BEGIN
     result := (others => '0');
     conv_string := (others => '0');
     
          FOR I IN 1 TO num_chars LOOP
	     curr_char := num_chars - (I-1);

             CASE value(I) IS
               WHEN '0' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0000";
               WHEN '1' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0001";
               WHEN '2' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0010";
               WHEN '3' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0011";
               WHEN '4' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0100";
               WHEN '5' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0101";
               WHEN '6' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0110";
               WHEN '7' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0111";
               WHEN '8' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1000";
               WHEN '9' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1001";
               WHEN 'A' | 'a' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1010";
               WHEN 'B' | 'b' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1011";
               WHEN 'C' | 'c' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1100";
               WHEN 'D' | 'd' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1101";
               WHEN 'E' | 'e' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1110";
               WHEN 'F' | 'f' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1111";
               WHEN 'X' | 'x' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "XXXX";
               WHEN ' ' => EXIT;
               WHEN HT  => exit;
               WHEN others =>
                  ASSERT False
                  REPORT "function From_Hex: string """ & value & """ contains non-hex character"
                       severity Error;
                  EXIT;
               END case;
            END loop;

          -- convert back to normal bit size
          result(mem_width_bits - 1 downto 0) := conv_string(mem_width_bits - 1 downto 0);

          RETURN result;
        END convert_string_to_std_logic;



begin
   process (wrclock, rdaddress) -- MG
    VARIABLE data_line : LINE;
    VARIABLE the_character_from_data_line : CHARACTER;
    VARIABLE b_munging_address : BOOLEAN := FALSE;
    VARIABLE converted_number : NATURAL := 0;
    VARIABLE found_string_array : STRING(1 TO 128);
    VARIABLE string_index : NATURAL := 0;
    VARIABLE line_length : NATURAL := 0;
    VARIABLE b_convert : BOOLEAN := FALSE;
    VARIABLE b_found_new_val : BOOLEAN := FALSE;
    VARIABLE load_address : NATURAL := 0;
    VARIABLE mem_index : NATURAL := 0;
    VARIABLE mem_init : BOOLEAN := FALSE;

    VARIABLE wr_address_internal : STD_LOGIC_VECTOR (17 DOWNTO 0) := (others => '0');
    FILE memory_contents_file : TEXT OPEN read_mode IS "ext_ram_lane1.dat";  
    variable Marc_Gaucherons_Memory_Variable : mem_array; -- MG
    
    begin
   -- need an initialization process
   -- this process initializes the whole memory array from a named file by copying the
   -- contents of the *.dat file to the memory array.

   -- find the @<address> thingy to load the memory from this point 
IF(NOT mem_init) THEN
   WHILE NOT(endfile(memory_contents_file)) LOOP

      readline(memory_contents_file, data_line);
      line_length := data_line'LENGTH;


      WHILE line_length > 0 LOOP
         read(data_line, the_character_from_data_line);

	       -- check for the @ character indicating a new address wad
 	       -- if not found, we're either still reading the new address _or_loading data
         IF '@' = the_character_from_data_line AND NOT b_munging_address THEN
  	    b_munging_address := TRUE;
            b_found_new_val := TRUE; 
	    -- get the rest of characters before white space and then convert them
	    -- to a number
	 ELSE 

            IF (' ' = the_character_from_data_line AND b_found_new_val) 
		OR (line_length = 1) THEN
               b_convert := TRUE;
	    END IF;

            IF NOT(' ' = the_character_from_data_line) THEN
               string_index := string_index + 1;
               found_string_array(string_index) := the_character_from_data_line;
--               IF NOT(b_munging_address) THEN
--                 dat_string_array(string_index) := the_character_from_data_line;
--               END IF;
	       b_found_new_val := TRUE;
            END IF;
	 END IF;

     IF b_convert THEN

       IF b_munging_address THEN
          converted_number := convert_string_to_number(found_string_array, string_index);    
          load_address := converted_number;
          mem_index := load_address;
--          mem_index := load_address / 1;
          b_munging_address := FALSE;
       ELSE
	  IF (mem_index < 262144) THEN
	    Marc_Gaucherons_Memory_Variable(mem_index) := convert_string_to_std_logic(found_string_array, string_index, 8);
            mem_index := mem_index + 1;
          END IF;
       END IF; 
       b_convert := FALSE;
       b_found_new_val := FALSE;
       string_index := 0;
    END IF;
    line_length := line_length - 1; 
    END LOOP;

END LOOP;
-- get the first _real_ block of data, sized to our memory width
-- and keep on loading.
  mem_init := TRUE;
END IF;
-- END OF READMEM



      -- Write data
      if wrclock'event and wrclock = '1' then
        wr_address_internal := wraddress;
        if wren = '1' then 
          Marc_Gaucherons_Memory_Variable(CONV_INTEGER(UNSIGNED(wr_address_internal))) := data;
        end if;
      end if;

      -- read data
      q <= Marc_Gaucherons_Memory_Variable(CONV_INTEGER(UNSIGNED(rdaddress)));
      


    end process;
end europa;

--synthesis translate_on


--synthesis read_comments_as_HDL on
--library altera;
--use altera.altera_europa_support_lib.all;
--
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--library std;
--use std.textio.all;
--
--entity ext_ram_lane1_module is 
--        port (
--              
--                 signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--                 signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--                 signal rdclken : IN STD_LOGIC;
--                 signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--                 signal wrclock : IN STD_LOGIC;
--                 signal wren : IN STD_LOGIC;
--
--              
--                 signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
--              );
--end entity ext_ram_lane1_module;
--
--
--architecture europa of ext_ram_lane1_module is
--  component lpm_ram_dp is
--GENERIC (
--      lpm_file : STRING;
--        lpm_hint : STRING;
--        lpm_indata : STRING;
--        lpm_outdata : STRING;
--        lpm_rdaddress_control : STRING;
--        lpm_width : NATURAL;
--        lpm_widthad : NATURAL;
--        lpm_wraddress_control : STRING;
--        suppress_memory_conversion_warnings : STRING
--      );
--    PORT (
--    signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
--        signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--        signal wren : IN STD_LOGIC;
--        signal wrclock : IN STD_LOGIC;
--        signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--        signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--        signal rdclken : IN STD_LOGIC
--      );
--  end component lpm_ram_dp;
--                signal internal_q2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
--                TYPE mem_array is ARRAY( 262143 DOWNTO 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
--                signal memory_has_been_read :  STD_LOGIC;
--                signal read_address :  STD_LOGIC_VECTOR (17 DOWNTO 0);
--
--begin
--
--  process (rdaddress)
--  begin
--      read_address <= rdaddress;
--
--  end process;
--
--  lpm_ram_dp_component : lpm_ram_dp
--    generic map(
--      lpm_file => "ext_ram_lane1.mif",
--      lpm_hint => "USE_EAB=ON",
--      lpm_indata => "REGISTERED",
--      lpm_outdata => "UNREGISTERED",
--      lpm_rdaddress_control => "UNREGISTERED",
--      lpm_width => 8,
--      lpm_widthad => 18,
--      lpm_wraddress_control => "REGISTERED",
--      suppress_memory_conversion_warnings => "ON"
--    )
--    port map(
--            data => data,
--            q => internal_q2,
--            rdaddress => read_address,
--            rdclken => rdclken,
--            wraddress => wraddress,
--            wrclock => wrclock,
--            wren => wren
--    );
--
--  
--  q <= internal_q2;
--end europa;
--
--synthesis read_comments_as_HDL off


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 


--synthesis translate_off

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity ext_ram_lane2_module is 
        port (
              -- inputs:
                 signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal rdclken : IN STD_LOGIC;
                 signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal wrclock : IN STD_LOGIC;
                 signal wren : IN STD_LOGIC;

              -- outputs:
                 signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
              );
end entity ext_ram_lane2_module;


architecture europa of ext_ram_lane2_module is
              signal internal_q3 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
              TYPE mem_array is ARRAY( 262143 DOWNTO 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
              signal memory_has_been_read :  STD_LOGIC;
              signal read_address :  STD_LOGIC_VECTOR (17 DOWNTO 0);

      
FUNCTION convert_string_to_number(string_to_convert : STRING;
      final_char_index : NATURAL := 0)
RETURN NATURAL IS
   VARIABLE result: NATURAL := 0;
   VARIABLE current_index : NATURAL := 1;
   VARIABLE the_char : CHARACTER;

   BEGIN
      IF final_char_index = 0 THEN
         result := 0;
	 ELSE
         WHILE current_index <= final_char_index LOOP
            the_char := string_to_convert(current_index);
            IF    '0' <= the_char AND the_char <= '9' THEN
               result := result * 16 + character'pos(the_char) - character'pos('0');
            ELSIF 'A' <= the_char AND the_char <= 'F' THEN
               result := result * 16 + character'pos(the_char) - character'pos('A') + 10;
            ELSIF 'a' <= the_char AND the_char <= 'f' THEN
               result := result * 16 + character'pos(the_char) - character'pos('a') + 10;
            ELSE
               report "Ack, a formatting error!";
            END IF;
            current_index := current_index + 1;
         END LOOP;
      END IF; 
   RETURN result;
END convert_string_to_number;

 FUNCTION convert_string_to_std_logic(value : STRING; num_chars : INTEGER; mem_width_bits : INTEGER)
 RETURN STD_LOGIC_VECTOR is			   
     VARIABLE conv_string: std_logic_vector((mem_width_bits + 4)-1 downto 0);
     VARIABLE result : std_logic_vector((mem_width_bits -1) downto 0);
     VARIABLE curr_char : integer;
              
     BEGIN
     result := (others => '0');
     conv_string := (others => '0');
     
          FOR I IN 1 TO num_chars LOOP
	     curr_char := num_chars - (I-1);

             CASE value(I) IS
               WHEN '0' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0000";
               WHEN '1' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0001";
               WHEN '2' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0010";
               WHEN '3' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0011";
               WHEN '4' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0100";
               WHEN '5' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0101";
               WHEN '6' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0110";
               WHEN '7' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0111";
               WHEN '8' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1000";
               WHEN '9' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1001";
               WHEN 'A' | 'a' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1010";
               WHEN 'B' | 'b' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1011";
               WHEN 'C' | 'c' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1100";
               WHEN 'D' | 'd' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1101";
               WHEN 'E' | 'e' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1110";
               WHEN 'F' | 'f' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1111";
               WHEN 'X' | 'x' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "XXXX";
               WHEN ' ' => EXIT;
               WHEN HT  => exit;
               WHEN others =>
                  ASSERT False
                  REPORT "function From_Hex: string """ & value & """ contains non-hex character"
                       severity Error;
                  EXIT;
               END case;
            END loop;

          -- convert back to normal bit size
          result(mem_width_bits - 1 downto 0) := conv_string(mem_width_bits - 1 downto 0);

          RETURN result;
        END convert_string_to_std_logic;



begin
   process (wrclock, rdaddress) -- MG
    VARIABLE data_line : LINE;
    VARIABLE the_character_from_data_line : CHARACTER;
    VARIABLE b_munging_address : BOOLEAN := FALSE;
    VARIABLE converted_number : NATURAL := 0;
    VARIABLE found_string_array : STRING(1 TO 128);
    VARIABLE string_index : NATURAL := 0;
    VARIABLE line_length : NATURAL := 0;
    VARIABLE b_convert : BOOLEAN := FALSE;
    VARIABLE b_found_new_val : BOOLEAN := FALSE;
    VARIABLE load_address : NATURAL := 0;
    VARIABLE mem_index : NATURAL := 0;
    VARIABLE mem_init : BOOLEAN := FALSE;

    VARIABLE wr_address_internal : STD_LOGIC_VECTOR (17 DOWNTO 0) := (others => '0');
    FILE memory_contents_file : TEXT OPEN read_mode IS "ext_ram_lane2.dat";  
    variable Marc_Gaucherons_Memory_Variable : mem_array; -- MG
    
    begin
   -- need an initialization process
   -- this process initializes the whole memory array from a named file by copying the
   -- contents of the *.dat file to the memory array.

   -- find the @<address> thingy to load the memory from this point 
IF(NOT mem_init) THEN
   WHILE NOT(endfile(memory_contents_file)) LOOP

      readline(memory_contents_file, data_line);
      line_length := data_line'LENGTH;


      WHILE line_length > 0 LOOP
         read(data_line, the_character_from_data_line);

	       -- check for the @ character indicating a new address wad
 	       -- if not found, we're either still reading the new address _or_loading data
         IF '@' = the_character_from_data_line AND NOT b_munging_address THEN
  	    b_munging_address := TRUE;
            b_found_new_val := TRUE; 
	    -- get the rest of characters before white space and then convert them
	    -- to a number
	 ELSE 

            IF (' ' = the_character_from_data_line AND b_found_new_val) 
		OR (line_length = 1) THEN
               b_convert := TRUE;
	    END IF;

            IF NOT(' ' = the_character_from_data_line) THEN
               string_index := string_index + 1;
               found_string_array(string_index) := the_character_from_data_line;
--               IF NOT(b_munging_address) THEN
--                 dat_string_array(string_index) := the_character_from_data_line;
--               END IF;
	       b_found_new_val := TRUE;
            END IF;
	 END IF;

     IF b_convert THEN

       IF b_munging_address THEN
          converted_number := convert_string_to_number(found_string_array, string_index);    
          load_address := converted_number;
          mem_index := load_address;
--          mem_index := load_address / 1;
          b_munging_address := FALSE;
       ELSE
	  IF (mem_index < 262144) THEN
	    Marc_Gaucherons_Memory_Variable(mem_index) := convert_string_to_std_logic(found_string_array, string_index, 8);
            mem_index := mem_index + 1;
          END IF;
       END IF; 
       b_convert := FALSE;
       b_found_new_val := FALSE;
       string_index := 0;
    END IF;
    line_length := line_length - 1; 
    END LOOP;

END LOOP;
-- get the first _real_ block of data, sized to our memory width
-- and keep on loading.
  mem_init := TRUE;
END IF;
-- END OF READMEM



      -- Write data
      if wrclock'event and wrclock = '1' then
        wr_address_internal := wraddress;
        if wren = '1' then 
          Marc_Gaucherons_Memory_Variable(CONV_INTEGER(UNSIGNED(wr_address_internal))) := data;
        end if;
      end if;

      -- read data
      q <= Marc_Gaucherons_Memory_Variable(CONV_INTEGER(UNSIGNED(rdaddress)));
      


    end process;
end europa;

--synthesis translate_on


--synthesis read_comments_as_HDL on
--library altera;
--use altera.altera_europa_support_lib.all;
--
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--library std;
--use std.textio.all;
--
--entity ext_ram_lane2_module is 
--        port (
--              
--                 signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--                 signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--                 signal rdclken : IN STD_LOGIC;
--                 signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--                 signal wrclock : IN STD_LOGIC;
--                 signal wren : IN STD_LOGIC;
--
--              
--                 signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
--              );
--end entity ext_ram_lane2_module;
--
--
--architecture europa of ext_ram_lane2_module is
--  component lpm_ram_dp is
--GENERIC (
--      lpm_file : STRING;
--        lpm_hint : STRING;
--        lpm_indata : STRING;
--        lpm_outdata : STRING;
--        lpm_rdaddress_control : STRING;
--        lpm_width : NATURAL;
--        lpm_widthad : NATURAL;
--        lpm_wraddress_control : STRING;
--        suppress_memory_conversion_warnings : STRING
--      );
--    PORT (
--    signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
--        signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--        signal wren : IN STD_LOGIC;
--        signal wrclock : IN STD_LOGIC;
--        signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--        signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--        signal rdclken : IN STD_LOGIC
--      );
--  end component lpm_ram_dp;
--                signal internal_q3 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
--                TYPE mem_array is ARRAY( 262143 DOWNTO 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
--                signal memory_has_been_read :  STD_LOGIC;
--                signal read_address :  STD_LOGIC_VECTOR (17 DOWNTO 0);
--
--begin
--
--  process (rdaddress)
--  begin
--      read_address <= rdaddress;
--
--  end process;
--
--  lpm_ram_dp_component : lpm_ram_dp
--    generic map(
--      lpm_file => "ext_ram_lane2.mif",
--      lpm_hint => "USE_EAB=ON",
--      lpm_indata => "REGISTERED",
--      lpm_outdata => "UNREGISTERED",
--      lpm_rdaddress_control => "UNREGISTERED",
--      lpm_width => 8,
--      lpm_widthad => 18,
--      lpm_wraddress_control => "REGISTERED",
--      suppress_memory_conversion_warnings => "ON"
--    )
--    port map(
--            data => data,
--            q => internal_q3,
--            rdaddress => read_address,
--            rdclken => rdclken,
--            wraddress => wraddress,
--            wrclock => wrclock,
--            wren => wren
--    );
--
--  
--  q <= internal_q3;
--end europa;
--
--synthesis read_comments_as_HDL off


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 


--synthesis translate_off

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity ext_ram_lane3_module is 
        port (
              -- inputs:
                 signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal rdclken : IN STD_LOGIC;
                 signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal wrclock : IN STD_LOGIC;
                 signal wren : IN STD_LOGIC;

              -- outputs:
                 signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
              );
end entity ext_ram_lane3_module;


architecture europa of ext_ram_lane3_module is
              signal internal_q4 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
              TYPE mem_array is ARRAY( 262143 DOWNTO 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
              signal memory_has_been_read :  STD_LOGIC;
              signal read_address :  STD_LOGIC_VECTOR (17 DOWNTO 0);

      
FUNCTION convert_string_to_number(string_to_convert : STRING;
      final_char_index : NATURAL := 0)
RETURN NATURAL IS
   VARIABLE result: NATURAL := 0;
   VARIABLE current_index : NATURAL := 1;
   VARIABLE the_char : CHARACTER;

   BEGIN
      IF final_char_index = 0 THEN
         result := 0;
	 ELSE
         WHILE current_index <= final_char_index LOOP
            the_char := string_to_convert(current_index);
            IF    '0' <= the_char AND the_char <= '9' THEN
               result := result * 16 + character'pos(the_char) - character'pos('0');
            ELSIF 'A' <= the_char AND the_char <= 'F' THEN
               result := result * 16 + character'pos(the_char) - character'pos('A') + 10;
            ELSIF 'a' <= the_char AND the_char <= 'f' THEN
               result := result * 16 + character'pos(the_char) - character'pos('a') + 10;
            ELSE
               report "Ack, a formatting error!";
            END IF;
            current_index := current_index + 1;
         END LOOP;
      END IF; 
   RETURN result;
END convert_string_to_number;

 FUNCTION convert_string_to_std_logic(value : STRING; num_chars : INTEGER; mem_width_bits : INTEGER)
 RETURN STD_LOGIC_VECTOR is			   
     VARIABLE conv_string: std_logic_vector((mem_width_bits + 4)-1 downto 0);
     VARIABLE result : std_logic_vector((mem_width_bits -1) downto 0);
     VARIABLE curr_char : integer;
              
     BEGIN
     result := (others => '0');
     conv_string := (others => '0');
     
          FOR I IN 1 TO num_chars LOOP
	     curr_char := num_chars - (I-1);

             CASE value(I) IS
               WHEN '0' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0000";
               WHEN '1' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0001";
               WHEN '2' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0010";
               WHEN '3' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0011";
               WHEN '4' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0100";
               WHEN '5' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0101";
               WHEN '6' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0110";
               WHEN '7' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "0111";
               WHEN '8' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1000";
               WHEN '9' =>  conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1001";
               WHEN 'A' | 'a' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1010";
               WHEN 'B' | 'b' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1011";
               WHEN 'C' | 'c' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1100";
               WHEN 'D' | 'd' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1101";
               WHEN 'E' | 'e' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1110";
               WHEN 'F' | 'f' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "1111";
               WHEN 'X' | 'x' => conv_string((4*curr_char)-1  DOWNTO 4*(curr_char-1)) := "XXXX";
               WHEN ' ' => EXIT;
               WHEN HT  => exit;
               WHEN others =>
                  ASSERT False
                  REPORT "function From_Hex: string """ & value & """ contains non-hex character"
                       severity Error;
                  EXIT;
               END case;
            END loop;

          -- convert back to normal bit size
          result(mem_width_bits - 1 downto 0) := conv_string(mem_width_bits - 1 downto 0);

          RETURN result;
        END convert_string_to_std_logic;



begin
   process (wrclock, rdaddress) -- MG
    VARIABLE data_line : LINE;
    VARIABLE the_character_from_data_line : CHARACTER;
    VARIABLE b_munging_address : BOOLEAN := FALSE;
    VARIABLE converted_number : NATURAL := 0;
    VARIABLE found_string_array : STRING(1 TO 128);
    VARIABLE string_index : NATURAL := 0;
    VARIABLE line_length : NATURAL := 0;
    VARIABLE b_convert : BOOLEAN := FALSE;
    VARIABLE b_found_new_val : BOOLEAN := FALSE;
    VARIABLE load_address : NATURAL := 0;
    VARIABLE mem_index : NATURAL := 0;
    VARIABLE mem_init : BOOLEAN := FALSE;

    VARIABLE wr_address_internal : STD_LOGIC_VECTOR (17 DOWNTO 0) := (others => '0');
    FILE memory_contents_file : TEXT OPEN read_mode IS "ext_ram_lane3.dat";  
    variable Marc_Gaucherons_Memory_Variable : mem_array; -- MG
    
    begin
   -- need an initialization process
   -- this process initializes the whole memory array from a named file by copying the
   -- contents of the *.dat file to the memory array.

   -- find the @<address> thingy to load the memory from this point 
IF(NOT mem_init) THEN
   WHILE NOT(endfile(memory_contents_file)) LOOP

      readline(memory_contents_file, data_line);
      line_length := data_line'LENGTH;


      WHILE line_length > 0 LOOP
         read(data_line, the_character_from_data_line);

	       -- check for the @ character indicating a new address wad
 	       -- if not found, we're either still reading the new address _or_loading data
         IF '@' = the_character_from_data_line AND NOT b_munging_address THEN
  	    b_munging_address := TRUE;
            b_found_new_val := TRUE; 
	    -- get the rest of characters before white space and then convert them
	    -- to a number
	 ELSE 

            IF (' ' = the_character_from_data_line AND b_found_new_val) 
		OR (line_length = 1) THEN
               b_convert := TRUE;
	    END IF;

            IF NOT(' ' = the_character_from_data_line) THEN
               string_index := string_index + 1;
               found_string_array(string_index) := the_character_from_data_line;
--               IF NOT(b_munging_address) THEN
--                 dat_string_array(string_index) := the_character_from_data_line;
--               END IF;
	       b_found_new_val := TRUE;
            END IF;
	 END IF;

     IF b_convert THEN

       IF b_munging_address THEN
          converted_number := convert_string_to_number(found_string_array, string_index);    
          load_address := converted_number;
          mem_index := load_address;
--          mem_index := load_address / 1;
          b_munging_address := FALSE;
       ELSE
	  IF (mem_index < 262144) THEN
	    Marc_Gaucherons_Memory_Variable(mem_index) := convert_string_to_std_logic(found_string_array, string_index, 8);
            mem_index := mem_index + 1;
          END IF;
       END IF; 
       b_convert := FALSE;
       b_found_new_val := FALSE;
       string_index := 0;
    END IF;
    line_length := line_length - 1; 
    END LOOP;

END LOOP;
-- get the first _real_ block of data, sized to our memory width
-- and keep on loading.
  mem_init := TRUE;
END IF;
-- END OF READMEM



      -- Write data
      if wrclock'event and wrclock = '1' then
        wr_address_internal := wraddress;
        if wren = '1' then 
          Marc_Gaucherons_Memory_Variable(CONV_INTEGER(UNSIGNED(wr_address_internal))) := data;
        end if;
      end if;

      -- read data
      q <= Marc_Gaucherons_Memory_Variable(CONV_INTEGER(UNSIGNED(rdaddress)));
      


    end process;
end europa;

--synthesis translate_on


--synthesis read_comments_as_HDL on
--library altera;
--use altera.altera_europa_support_lib.all;
--
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--library std;
--use std.textio.all;
--
--entity ext_ram_lane3_module is 
--        port (
--              
--                 signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--                 signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--                 signal rdclken : IN STD_LOGIC;
--                 signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--                 signal wrclock : IN STD_LOGIC;
--                 signal wren : IN STD_LOGIC;
--
--              
--                 signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
--              );
--end entity ext_ram_lane3_module;
--
--
--architecture europa of ext_ram_lane3_module is
--  component lpm_ram_dp is
--GENERIC (
--      lpm_file : STRING;
--        lpm_hint : STRING;
--        lpm_indata : STRING;
--        lpm_outdata : STRING;
--        lpm_rdaddress_control : STRING;
--        lpm_width : NATURAL;
--        lpm_widthad : NATURAL;
--        lpm_wraddress_control : STRING;
--        suppress_memory_conversion_warnings : STRING
--      );
--    PORT (
--    signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
--        signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--        signal wren : IN STD_LOGIC;
--        signal wrclock : IN STD_LOGIC;
--        signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
--        signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--        signal rdclken : IN STD_LOGIC
--      );
--  end component lpm_ram_dp;
--                signal internal_q4 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
--                TYPE mem_array is ARRAY( 262143 DOWNTO 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
--                signal memory_has_been_read :  STD_LOGIC;
--                signal read_address :  STD_LOGIC_VECTOR (17 DOWNTO 0);
--
--begin
--
--  process (rdaddress)
--  begin
--      read_address <= rdaddress;
--
--  end process;
--
--  lpm_ram_dp_component : lpm_ram_dp
--    generic map(
--      lpm_file => "ext_ram_lane3.mif",
--      lpm_hint => "USE_EAB=ON",
--      lpm_indata => "REGISTERED",
--      lpm_outdata => "UNREGISTERED",
--      lpm_rdaddress_control => "UNREGISTERED",
--      lpm_width => 8,
--      lpm_widthad => 18,
--      lpm_wraddress_control => "REGISTERED",
--      suppress_memory_conversion_warnings => "ON"
--    )
--    port map(
--            data => data,
--            q => internal_q4,
--            rdaddress => read_address,
--            rdclken => rdclken,
--            wraddress => wraddress,
--            wrclock => wrclock,
--            wren => wren
--    );
--
--  
--  q <= internal_q4;
--end europa;
--
--synthesis read_comments_as_HDL off


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ext_ram is 
        port (
              -- inputs:
                 signal address : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal be_n : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal read_n : IN STD_LOGIC;
                 signal select_n : IN STD_LOGIC;
                 signal write_n : IN STD_LOGIC;

              -- outputs:
                 signal data : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity ext_ram;


architecture europa of ext_ram is
--synthesis translate_off
component ext_ram_lane0_module is 
           port (
                 -- inputs:
                    signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal rdclken : IN STD_LOGIC;
                    signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal wrclock : IN STD_LOGIC;
                    signal wren : IN STD_LOGIC;

                 -- outputs:
                    signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component ext_ram_lane0_module;

component ext_ram_lane1_module is 
           port (
                 -- inputs:
                    signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal rdclken : IN STD_LOGIC;
                    signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal wrclock : IN STD_LOGIC;
                    signal wren : IN STD_LOGIC;

                 -- outputs:
                    signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component ext_ram_lane1_module;

component ext_ram_lane2_module is 
           port (
                 -- inputs:
                    signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal rdclken : IN STD_LOGIC;
                    signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal wrclock : IN STD_LOGIC;
                    signal wren : IN STD_LOGIC;

                 -- outputs:
                    signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component ext_ram_lane2_module;

component ext_ram_lane3_module is 
           port (
                 -- inputs:
                    signal data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal rdaddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal rdclken : IN STD_LOGIC;
                    signal wraddress : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal wrclock : IN STD_LOGIC;
                    signal wren : IN STD_LOGIC;

                 -- outputs:
                    signal q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component ext_ram_lane3_module;

--synthesis translate_on
                signal data_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal data_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal data_2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal data_3 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal logic_vector_gasket :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal module_input10 :  STD_LOGIC;
                signal module_input11 :  STD_LOGIC;
                signal module_input12 :  STD_LOGIC;
                signal module_input13 :  STD_LOGIC;
                signal module_input14 :  STD_LOGIC;
                signal module_input15 :  STD_LOGIC;
                signal module_input16 :  STD_LOGIC;
                signal module_input17 :  STD_LOGIC;
                signal q_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal q_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal q_2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal q_3 :  STD_LOGIC_VECTOR (7 DOWNTO 0);

begin

  --s1, which is an e_ptf_slave
--synthesis translate_off
    logic_vector_gasket <= data;
    data_0 <= logic_vector_gasket(7 DOWNTO 0);
    --ext_ram_lane0, which is an e_ram
    ext_ram_lane0 : ext_ram_lane0_module
      port map(
        q => q_0,
        data => data_0,
        rdaddress => address,
        rdclken => module_input10,
        wraddress => address,
        wrclock => write_n,
        wren => module_input11
      );

    module_input10 <= std_logic'('1');
    module_input11 <= NOT select_n AND NOT be_n(0);

    data_1 <= logic_vector_gasket(15 DOWNTO 8);
    --ext_ram_lane1, which is an e_ram
    ext_ram_lane1 : ext_ram_lane1_module
      port map(
        q => q_1,
        data => data_1,
        rdaddress => address,
        rdclken => module_input12,
        wraddress => address,
        wrclock => write_n,
        wren => module_input13
      );

    module_input12 <= std_logic'('1');
    module_input13 <= NOT select_n AND NOT be_n(1);

    data_2 <= logic_vector_gasket(23 DOWNTO 16);
    --ext_ram_lane2, which is an e_ram
    ext_ram_lane2 : ext_ram_lane2_module
      port map(
        q => q_2,
        data => data_2,
        rdaddress => address,
        rdclken => module_input14,
        wraddress => address,
        wrclock => write_n,
        wren => module_input15
      );

    module_input14 <= std_logic'('1');
    module_input15 <= NOT select_n AND NOT be_n(2);

    data_3 <= logic_vector_gasket(31 DOWNTO 24);
    --ext_ram_lane3, which is an e_ram
    ext_ram_lane3 : ext_ram_lane3_module
      port map(
        q => q_3,
        data => data_3,
        rdaddress => address,
        rdclken => module_input16,
        wraddress => address,
        wrclock => write_n,
        wren => module_input17
      );

    module_input16 <= std_logic'('1');
    module_input17 <= NOT select_n AND NOT be_n(3);

    data <= A_WE_StdLogicVector((std_logic'(((NOT select_n AND NOT read_n))) = '1'), (q_3 & q_2 & q_1 & q_0), A_REP(std_logic'('Z'), 32));
--synthesis translate_on

end europa;


--synthesis translate_off

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



-- <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
--add your libraries here
-- AND HERE WILL BE PRESERVED </ALTERA_NOTE>

entity test_bench is 
end entity test_bench;


architecture europa of test_bench is
component NiosII_stratix_1s10_standard is 
           port (
                 -- 1) global signals:
                    signal clk : IN STD_LOGIC;
                    signal pll_c0_out : OUT STD_LOGIC;
                    signal pll_e0_out : OUT STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- the_button_pio
                    signal in_port_to_the_button_pio : IN STD_LOGIC_VECTOR (3 DOWNTO 0);

                 -- the_ext_ram_bus_avalon_slave
                    signal be_n_to_the_ext_ram : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal byteenablen_to_the_lan91c111 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal ext_ram_bus_address : OUT STD_LOGIC_VECTOR (22 DOWNTO 0);
                    signal ext_ram_bus_data : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal ior_n_to_the_lan91c111 : OUT STD_LOGIC;
                    signal iow_n_to_the_lan91c111 : OUT STD_LOGIC;
                    signal irq_from_the_lan91c111 : IN STD_LOGIC;
                    signal read_n_to_the_ext_flash : OUT STD_LOGIC;
                    signal read_n_to_the_ext_ram : OUT STD_LOGIC;
                    signal reset_to_the_lan91c111 : OUT STD_LOGIC;
                    signal select_n_to_the_ext_flash : OUT STD_LOGIC;
                    signal select_n_to_the_ext_ram : OUT STD_LOGIC;
                    signal write_n_to_the_ext_flash : OUT STD_LOGIC;
                    signal write_n_to_the_ext_ram : OUT STD_LOGIC;

                 -- the_lcd_display
                    signal LCD_E_from_the_lcd_display : OUT STD_LOGIC;
                    signal LCD_RS_from_the_lcd_display : OUT STD_LOGIC;
                    signal LCD_RW_from_the_lcd_display : OUT STD_LOGIC;
                    signal LCD_data_to_and_from_the_lcd_display : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- the_led_pio
                    signal out_port_from_the_led_pio : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- the_reconfig_request_pio
                    signal bidir_port_to_and_from_the_reconfig_request_pio : INOUT STD_LOGIC;

                 -- the_sdram
                    signal zs_addr_from_the_sdram : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
                    signal zs_ba_from_the_sdram : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal zs_cas_n_from_the_sdram : OUT STD_LOGIC;
                    signal zs_cke_from_the_sdram : OUT STD_LOGIC;
                    signal zs_cs_n_from_the_sdram : OUT STD_LOGIC;
                    signal zs_dq_to_and_from_the_sdram : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal zs_dqm_from_the_sdram : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal zs_ras_n_from_the_sdram : OUT STD_LOGIC;
                    signal zs_we_n_from_the_sdram : OUT STD_LOGIC;

                 -- the_seven_seg_pio
                    signal out_port_from_the_seven_seg_pio : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- the_uart1
                    signal rxd_to_the_uart1 : IN STD_LOGIC;
                    signal txd_from_the_uart1 : OUT STD_LOGIC
                 );
end component NiosII_stratix_1s10_standard;

component ext_flash is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (22 DOWNTO 0);
                    signal read_n : IN STD_LOGIC;
                    signal select_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;

                 -- outputs:
                    signal data : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component ext_flash;

component ext_ram is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal be_n : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal read_n : IN STD_LOGIC;
                    signal select_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;

                 -- outputs:
                    signal data : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component ext_ram;

component sdram_test_component is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal zs_addr : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
                    signal zs_ba : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal zs_cas_n : IN STD_LOGIC;
                    signal zs_cke : IN STD_LOGIC;
                    signal zs_cs_n : IN STD_LOGIC;
                    signal zs_dqm : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal zs_ras_n : IN STD_LOGIC;
                    signal zs_we_n : IN STD_LOGIC;

                 -- outputs:
                    signal zs_dq : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component sdram_test_component;

                signal LCD_E_from_the_lcd_display :  STD_LOGIC;
                signal LCD_RS_from_the_lcd_display :  STD_LOGIC;
                signal LCD_RW_from_the_lcd_display :  STD_LOGIC;
                signal LCD_data_to_and_from_the_lcd_display :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal NiosII_stratix_1s10_standard_clock_0_in_endofpacket_from_sa :  STD_LOGIC;
                signal NiosII_stratix_1s10_standard_clock_0_out_endofpacket :  STD_LOGIC;
                signal be_n_to_the_ext_ram :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal bidir_port_to_and_from_the_reconfig_request_pio :  STD_LOGIC;
                signal byteenablen_to_the_lan91c111 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal clk :  STD_LOGIC;
                signal ext_ram_bus_address :  STD_LOGIC_VECTOR (22 DOWNTO 0);
                signal ext_ram_bus_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal in_port_to_the_button_pio :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal ior_n_to_the_lan91c111 :  STD_LOGIC;
                signal iow_n_to_the_lan91c111 :  STD_LOGIC;
                signal irq_from_the_lan91c111 :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_dataavailable_from_sa :  STD_LOGIC;
                signal jtag_uart_avalon_jtag_slave_readyfordata_from_sa :  STD_LOGIC;
                signal module_input18 :  STD_LOGIC_VECTOR (17 DOWNTO 0);
                signal out_port_from_the_led_pio :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal out_port_from_the_seven_seg_pio :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal pll_c0_out :  STD_LOGIC;
                signal pll_e0_out :  STD_LOGIC;
                signal read_n_to_the_ext_flash :  STD_LOGIC;
                signal read_n_to_the_ext_ram :  STD_LOGIC;
                signal reset_n :  STD_LOGIC;
                signal reset_to_the_lan91c111 :  STD_LOGIC;
                signal rxd_to_the_uart1 :  STD_LOGIC;
                signal select_n_to_the_ext_flash :  STD_LOGIC;
                signal select_n_to_the_ext_ram :  STD_LOGIC;
                signal txd_from_the_uart1 :  STD_LOGIC;
                signal uart1_s1_dataavailable_from_sa :  STD_LOGIC;
                signal uart1_s1_readyfordata_from_sa :  STD_LOGIC;
                signal write_n_to_the_ext_flash :  STD_LOGIC;
                signal write_n_to_the_ext_ram :  STD_LOGIC;
                signal zs_addr_from_the_sdram :  STD_LOGIC_VECTOR (11 DOWNTO 0);
                signal zs_ba_from_the_sdram :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal zs_cas_n_from_the_sdram :  STD_LOGIC;
                signal zs_cke_from_the_sdram :  STD_LOGIC;
                signal zs_cs_n_from_the_sdram :  STD_LOGIC;
                signal zs_dq_to_and_from_the_sdram :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal zs_dqm_from_the_sdram :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal zs_ras_n_from_the_sdram :  STD_LOGIC;
                signal zs_we_n_from_the_sdram :  STD_LOGIC;


-- <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
--add your component and signal declaration here
-- AND HERE WILL BE PRESERVED </ALTERA_NOTE>


begin

  --Set us up the Dut
  DUT : NiosII_stratix_1s10_standard
    port map(
      LCD_E_from_the_lcd_display => LCD_E_from_the_lcd_display,
      LCD_RS_from_the_lcd_display => LCD_RS_from_the_lcd_display,
      LCD_RW_from_the_lcd_display => LCD_RW_from_the_lcd_display,
      LCD_data_to_and_from_the_lcd_display => LCD_data_to_and_from_the_lcd_display,
      be_n_to_the_ext_ram => be_n_to_the_ext_ram,
      bidir_port_to_and_from_the_reconfig_request_pio => bidir_port_to_and_from_the_reconfig_request_pio,
      byteenablen_to_the_lan91c111 => byteenablen_to_the_lan91c111,
      ext_ram_bus_address => ext_ram_bus_address,
      ext_ram_bus_data => ext_ram_bus_data,
      ior_n_to_the_lan91c111 => ior_n_to_the_lan91c111,
      iow_n_to_the_lan91c111 => iow_n_to_the_lan91c111,
      out_port_from_the_led_pio => out_port_from_the_led_pio,
      out_port_from_the_seven_seg_pio => out_port_from_the_seven_seg_pio,
      pll_c0_out => pll_c0_out,
      pll_e0_out => pll_e0_out,
      read_n_to_the_ext_flash => read_n_to_the_ext_flash,
      read_n_to_the_ext_ram => read_n_to_the_ext_ram,
      reset_to_the_lan91c111 => reset_to_the_lan91c111,
      select_n_to_the_ext_flash => select_n_to_the_ext_flash,
      select_n_to_the_ext_ram => select_n_to_the_ext_ram,
      txd_from_the_uart1 => txd_from_the_uart1,
      write_n_to_the_ext_flash => write_n_to_the_ext_flash,
      write_n_to_the_ext_ram => write_n_to_the_ext_ram,
      zs_addr_from_the_sdram => zs_addr_from_the_sdram,
      zs_ba_from_the_sdram => zs_ba_from_the_sdram,
      zs_cas_n_from_the_sdram => zs_cas_n_from_the_sdram,
      zs_cke_from_the_sdram => zs_cke_from_the_sdram,
      zs_cs_n_from_the_sdram => zs_cs_n_from_the_sdram,
      zs_dq_to_and_from_the_sdram => zs_dq_to_and_from_the_sdram,
      zs_dqm_from_the_sdram => zs_dqm_from_the_sdram,
      zs_ras_n_from_the_sdram => zs_ras_n_from_the_sdram,
      zs_we_n_from_the_sdram => zs_we_n_from_the_sdram,
      clk => clk,
      in_port_to_the_button_pio => in_port_to_the_button_pio,
      irq_from_the_lan91c111 => irq_from_the_lan91c111,
      reset_n => reset_n,
      rxd_to_the_uart1 => rxd_to_the_uart1
    );


  --default value specified in MODULE button_pio ptf port section
  in_port_to_the_button_pio <= std_logic_vector'("1111");
  --the_ext_flash, which is an e_ptf_instance
  the_ext_flash : ext_flash
    port map(
      data => ext_ram_bus_data (7 DOWNTO 0),
      address => ext_ram_bus_address,
      read_n => read_n_to_the_ext_flash,
      select_n => select_n_to_the_ext_flash,
      write_n => write_n_to_the_ext_flash
    );


  --the_ext_ram, which is an e_ptf_instance
  the_ext_ram : ext_ram
    port map(
      data => ext_ram_bus_data,
      address => module_input18,
      be_n => be_n_to_the_ext_ram,
      read_n => read_n_to_the_ext_ram,
      select_n => select_n_to_the_ext_ram,
      write_n => write_n_to_the_ext_ram
    );

  module_input18 <= ext_ram_bus_address(19 DOWNTO 2);

  --default value specified in MODULE lan91c111 ptf port section
  irq_from_the_lan91c111 <= std_logic'('0');
  --the_sdram_test_component, which is an e_instance
  the_sdram_test_component : sdram_test_component
    port map(
      zs_dq => zs_dq_to_and_from_the_sdram,
      clk => pll_c0_out,
      zs_addr => zs_addr_from_the_sdram,
      zs_ba => zs_ba_from_the_sdram,
      zs_cas_n => zs_cas_n_from_the_sdram,
      zs_cke => zs_cke_from_the_sdram,
      zs_cs_n => zs_cs_n_from_the_sdram,
      zs_dqm => zs_dqm_from_the_sdram,
      zs_ras_n => zs_ras_n_from_the_sdram,
      zs_we_n => zs_we_n_from_the_sdram
    );


  process
  begin
    clk <= '0';
    loop
       wait for 10 ns;
       clk <= not clk;
    end loop;
  end process;
  PROCESS
    BEGIN
       reset_n <= '0';
       wait for 200 ns;
       reset_n <= '1'; 
    WAIT;
  END PROCESS;


-- <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
--add additional architecture here
-- AND HERE WILL BE PRESERVED </ALTERA_NOTE>


end europa;



--synthesis translate_on
