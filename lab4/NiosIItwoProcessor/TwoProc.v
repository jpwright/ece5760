//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2013 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_jtag_debug_module_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_0_data_master_address_to_slave,
                                             cpu_0_data_master_byteenable,
                                             cpu_0_data_master_debugaccess,
                                             cpu_0_data_master_read,
                                             cpu_0_data_master_waitrequest,
                                             cpu_0_data_master_write,
                                             cpu_0_data_master_writedata,
                                             cpu_0_instruction_master_address_to_slave,
                                             cpu_0_instruction_master_latency_counter,
                                             cpu_0_instruction_master_read,
                                             cpu_0_jtag_debug_module_readdata,
                                             cpu_0_jtag_debug_module_resetrequest,
                                             reset_n,

                                            // outputs:
                                             cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_jtag_debug_module_address,
                                             cpu_0_jtag_debug_module_begintransfer,
                                             cpu_0_jtag_debug_module_byteenable,
                                             cpu_0_jtag_debug_module_chipselect,
                                             cpu_0_jtag_debug_module_debugaccess,
                                             cpu_0_jtag_debug_module_readdata_from_sa,
                                             cpu_0_jtag_debug_module_reset_n,
                                             cpu_0_jtag_debug_module_resetrequest_from_sa,
                                             cpu_0_jtag_debug_module_write,
                                             cpu_0_jtag_debug_module_writedata,
                                             d1_cpu_0_jtag_debug_module_end_xfer
                                          )
;

  output           cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  output  [  8: 0] cpu_0_jtag_debug_module_address;
  output           cpu_0_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_0_jtag_debug_module_byteenable;
  output           cpu_0_jtag_debug_module_chipselect;
  output           cpu_0_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  output           cpu_0_jtag_debug_module_reset_n;
  output           cpu_0_jtag_debug_module_resetrequest_from_sa;
  output           cpu_0_jtag_debug_module_write;
  output  [ 31: 0] cpu_0_jtag_debug_module_writedata;
  output           d1_cpu_0_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 16: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata;
  input            cpu_0_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_allgrants;
  wire             cpu_0_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_0_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_0_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_addend;
  wire             cpu_0_jtag_debug_module_arb_counter_enable;
  reg              cpu_0_jtag_debug_module_arb_share_counter;
  wire             cpu_0_jtag_debug_module_arb_share_counter_next_value;
  wire             cpu_0_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_winner;
  wire             cpu_0_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_0_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_0_jtag_debug_module_begins_xfer;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_0_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_0_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire             cpu_0_jtag_debug_module_end_xfer;
  wire             cpu_0_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_0_jtag_debug_module_grant_vector;
  wire             cpu_0_jtag_debug_module_in_a_read_cycle;
  wire             cpu_0_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_0_jtag_debug_module_master_qreq_vector;
  wire             cpu_0_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  reg              cpu_0_jtag_debug_module_reg_firsttransfer;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_0_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_0_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_0_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_0_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_0_jtag_debug_module_waits_for_read;
  wire             cpu_0_jtag_debug_module_waits_for_write;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  reg              d1_cpu_0_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
  wire    [ 16: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 16: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master;
  wire             wait_for_cpu_0_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_0_jtag_debug_module_end_xfer;
    end


  assign cpu_0_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module));
  //assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata;

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[16 : 11] , 11'b0} == 17'h0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //cpu_0_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_0_jtag_debug_module_arb_share_set_values = 1;

  //cpu_0_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_0_jtag_debug_module_non_bursting_master_requests = cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module |
    cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_0_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_0_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_share_counter_next_value = cpu_0_jtag_debug_module_firsttransfer ? (cpu_0_jtag_debug_module_arb_share_set_values - 1) : |cpu_0_jtag_debug_module_arb_share_counter ? (cpu_0_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_0_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_0_jtag_debug_module_allgrants = (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector);

  //cpu_0_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_end_xfer = ~(cpu_0_jtag_debug_module_waits_for_read | cpu_0_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_end_xfer & (~cpu_0_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_0_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & cpu_0_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests);

  //cpu_0_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_0_jtag_debug_module_arb_counter_enable)
          cpu_0_jtag_debug_module_arb_share_counter <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_0_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests))
          cpu_0_jtag_debug_module_slavearbiterlockenable <= |cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_0_jtag_debug_module_slavearbiterlockenable2 = |cpu_0_jtag_debug_module_arb_share_counter_next_value;

  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_0_jtag_debug_module_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_data_master_requests_cpu_0_jtag_debug_module & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_0_jtag_debug_module_writedata = cpu_0_data_master_writedata;

  assign cpu_0_instruction_master_requests_cpu_0_jtag_debug_module = (({cpu_0_instruction_master_address_to_slave[16 : 11] , 11'b0} == 17'h0) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  assign cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_instruction_master_requests_cpu_0_jtag_debug_module & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/instruction_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[0];

  //cpu_0/instruction_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[0] && cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/data_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[1] = cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/data_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[1];

  //cpu_0/data_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[1] && cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_double_vector = {cpu_0_jtag_debug_module_master_qreq_vector, cpu_0_jtag_debug_module_master_qreq_vector} & ({~cpu_0_jtag_debug_module_master_qreq_vector, ~cpu_0_jtag_debug_module_master_qreq_vector} + cpu_0_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_0_jtag_debug_module_arb_winner = (cpu_0_jtag_debug_module_allow_new_arb_cycle & | cpu_0_jtag_debug_module_grant_vector) ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_0_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_0_jtag_debug_module_allow_new_arb_cycle)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= |cpu_0_jtag_debug_module_grant_vector ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_0_jtag_debug_module_grant_vector = {(cpu_0_jtag_debug_module_chosen_master_double_vector[1] | cpu_0_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_0_jtag_debug_module_chosen_master_double_vector[0] | cpu_0_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu_0/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_rot_left = (cpu_0_jtag_debug_module_arb_winner << 1) ? (cpu_0_jtag_debug_module_arb_winner << 1) : 1;

  //cpu_0/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_0_jtag_debug_module_grant_vector)
          cpu_0_jtag_debug_module_arb_addend <= cpu_0_jtag_debug_module_end_xfer? cpu_0_jtag_debug_module_chosen_master_rot_left : cpu_0_jtag_debug_module_grant_vector;
    end


  assign cpu_0_jtag_debug_module_begintransfer = cpu_0_jtag_debug_module_begins_xfer;
  //cpu_0_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_reset_n = reset_n;

  //assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest;

  assign cpu_0_jtag_debug_module_chipselect = cpu_0_data_master_granted_cpu_0_jtag_debug_module | cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  //cpu_0_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_firsttransfer = cpu_0_jtag_debug_module_begins_xfer ? cpu_0_jtag_debug_module_unreg_firsttransfer : cpu_0_jtag_debug_module_reg_firsttransfer;

  //cpu_0_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_unreg_firsttransfer = ~(cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_jtag_debug_module_any_continuerequest);

  //cpu_0_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_0_jtag_debug_module_begins_xfer)
          cpu_0_jtag_debug_module_reg_firsttransfer <= cpu_0_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_0_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_0_jtag_debug_module_beginbursttransfer_internal = cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_0_jtag_debug_module_arbitration_holdoff_internal = cpu_0_jtag_debug_module_begins_xfer & cpu_0_jtag_debug_module_firsttransfer;

  //cpu_0_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_0_jtag_debug_module_write = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //cpu_0_jtag_debug_module_address mux, which is an e_mux
  assign cpu_0_jtag_debug_module_address = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master >> 2) :
    (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_cpu_0_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_0_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_0_jtag_debug_module_end_xfer <= cpu_0_jtag_debug_module_end_xfer;
    end


  //cpu_0_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_read = cpu_0_jtag_debug_module_in_a_read_cycle & cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_read_cycle = (cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_0_jtag_debug_module_in_a_read_cycle;

  //cpu_0_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_write = cpu_0_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_0_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_write_cycle = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_0_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_0_jtag_debug_module_counter = 0;
  //cpu_0_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_0_jtag_debug_module_byteenable = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_0_jtag_debug_module_debugaccess = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_cpu_0_jtag_debug_module + cpu_0_instruction_master_granted_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module + cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_granted_in_0_s1,
                                       cpu_0_data_master_granted_mutex_0_s1,
                                       cpu_0_data_master_granted_onchip_memory_0_s1,
                                       cpu_0_data_master_granted_out_0_s1,
                                       cpu_0_data_master_granted_timer_0_s1,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_in_0_s1,
                                       cpu_0_data_master_qualified_request_mutex_0_s1,
                                       cpu_0_data_master_qualified_request_onchip_memory_0_s1,
                                       cpu_0_data_master_qualified_request_out_0_s1,
                                       cpu_0_data_master_qualified_request_timer_0_s1,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read_data_valid_in_0_s1,
                                       cpu_0_data_master_read_data_valid_mutex_0_s1,
                                       cpu_0_data_master_read_data_valid_onchip_memory_0_s1,
                                       cpu_0_data_master_read_data_valid_out_0_s1,
                                       cpu_0_data_master_read_data_valid_timer_0_s1,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_in_0_s1,
                                       cpu_0_data_master_requests_mutex_0_s1,
                                       cpu_0_data_master_requests_onchip_memory_0_s1,
                                       cpu_0_data_master_requests_out_0_s1,
                                       cpu_0_data_master_requests_timer_0_s1,
                                       cpu_0_data_master_write,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       d1_in_0_s1_end_xfer,
                                       d1_mutex_0_s1_end_xfer,
                                       d1_onchip_memory_0_s1_end_xfer,
                                       d1_out_0_s1_end_xfer,
                                       d1_timer_0_s1_end_xfer,
                                       in_0_s1_readdata_from_sa,
                                       mutex_0_s1_readdata_from_sa,
                                       onchip_memory_0_s1_readdata_from_sa,
                                       out_0_s1_readdata_from_sa,
                                       registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1,
                                       reset_n,
                                       timer_0_s1_irq_from_sa,
                                       timer_0_s1_readdata_from_sa,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_irq,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 16: 0] cpu_0_data_master_address_to_slave;
  output  [ 31: 0] cpu_0_data_master_irq;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_waitrequest;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_granted_in_0_s1;
  input            cpu_0_data_master_granted_mutex_0_s1;
  input            cpu_0_data_master_granted_onchip_memory_0_s1;
  input            cpu_0_data_master_granted_out_0_s1;
  input            cpu_0_data_master_granted_timer_0_s1;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_in_0_s1;
  input            cpu_0_data_master_qualified_request_mutex_0_s1;
  input            cpu_0_data_master_qualified_request_onchip_memory_0_s1;
  input            cpu_0_data_master_qualified_request_out_0_s1;
  input            cpu_0_data_master_qualified_request_timer_0_s1;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read_data_valid_in_0_s1;
  input            cpu_0_data_master_read_data_valid_mutex_0_s1;
  input            cpu_0_data_master_read_data_valid_onchip_memory_0_s1;
  input            cpu_0_data_master_read_data_valid_out_0_s1;
  input            cpu_0_data_master_read_data_valid_timer_0_s1;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_in_0_s1;
  input            cpu_0_data_master_requests_mutex_0_s1;
  input            cpu_0_data_master_requests_onchip_memory_0_s1;
  input            cpu_0_data_master_requests_out_0_s1;
  input            cpu_0_data_master_requests_timer_0_s1;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_in_0_s1_end_xfer;
  input            d1_mutex_0_s1_end_xfer;
  input            d1_onchip_memory_0_s1_end_xfer;
  input            d1_out_0_s1_end_xfer;
  input            d1_timer_0_s1_end_xfer;
  input   [ 31: 0] in_0_s1_readdata_from_sa;
  input   [ 31: 0] mutex_0_s1_readdata_from_sa;
  input   [ 31: 0] onchip_memory_0_s1_readdata_from_sa;
  input   [ 31: 0] out_0_s1_readdata_from_sa;
  input            registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1;
  input            reset_n;
  input            timer_0_s1_irq_from_sa;
  input   [ 15: 0] timer_0_s1_readdata_from_sa;

  wire    [ 16: 0] cpu_0_data_master_address_to_slave;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_run;
  reg              cpu_0_data_master_waitrequest;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) & (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & ((~cpu_0_data_master_qualified_request_in_0_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_in_0_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_mutex_0_s1 | ~cpu_0_data_master_requests_mutex_0_s1) & (cpu_0_data_master_granted_mutex_0_s1 | ~cpu_0_data_master_qualified_request_mutex_0_s1) & ((~cpu_0_data_master_qualified_request_mutex_0_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_mutex_0_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_onchip_memory_0_s1 | registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1 | ~cpu_0_data_master_requests_onchip_memory_0_s1) & (cpu_0_data_master_granted_onchip_memory_0_s1 | ~cpu_0_data_master_qualified_request_onchip_memory_0_s1) & ((~cpu_0_data_master_qualified_request_onchip_memory_0_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_onchip_memory_0_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_out_0_s1 | ~cpu_0_data_master_requests_out_0_s1);

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_0_data_master_qualified_request_out_0_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_out_0_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_requests_timer_0_s1) & ((~cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = {cpu_0_data_master_address[16],
    2'b0,
    cpu_0_data_master_address[13 : 0]};

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_cpu_0_jtag_debug_module}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_in_0_s1}} | in_0_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_mutex_0_s1}} | mutex_0_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_onchip_memory_0_s1}} | onchip_memory_0_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_out_0_s1}} | out_0_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_timer_0_s1}} | timer_0_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_waitrequest <= ~0;
      else 
        cpu_0_data_master_waitrequest <= ~((~(cpu_0_data_master_read | cpu_0_data_master_write))? 0: (cpu_0_data_master_run & cpu_0_data_master_waitrequest));
    end


  //irq assign, which is an e_assign
  assign cpu_0_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    timer_0_s1_irq_from_sa};


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_granted_onchip_memory_0_s1,
                                              cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_qualified_request_onchip_memory_0_s1,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1,
                                              cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_requests_onchip_memory_0_s1,
                                              cpu_0_jtag_debug_module_readdata_from_sa,
                                              d1_cpu_0_jtag_debug_module_end_xfer,
                                              d1_onchip_memory_0_s1_end_xfer,
                                              onchip_memory_0_s1_readdata_from_sa,
                                              reset_n,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_latency_counter,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_readdatavalid,
                                              cpu_0_instruction_master_waitrequest
                                           )
;

  output  [ 16: 0] cpu_0_instruction_master_address_to_slave;
  output           cpu_0_instruction_master_latency_counter;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_readdatavalid;
  output           cpu_0_instruction_master_waitrequest;
  input            clk;
  input   [ 16: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_granted_onchip_memory_0_s1;
  input            cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_qualified_request_onchip_memory_0_s1;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1;
  input            cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_requests_onchip_memory_0_s1;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_onchip_memory_0_s1_end_xfer;
  input   [ 31: 0] onchip_memory_0_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 16: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 16: 0] cpu_0_instruction_master_address_to_slave;
  wire             cpu_0_instruction_master_is_granted_some_slave;
  reg              cpu_0_instruction_master_latency_counter;
  reg              cpu_0_instruction_master_read_but_no_slave_selected;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  wire             latency_load_value;
  wire             p1_cpu_0_instruction_master_latency_counter;
  wire             pre_flush_cpu_0_instruction_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) & (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_onchip_memory_0_s1 | ~cpu_0_instruction_master_requests_onchip_memory_0_s1) & (cpu_0_instruction_master_granted_onchip_memory_0_s1 | ~cpu_0_instruction_master_qualified_request_onchip_memory_0_s1) & ((~cpu_0_instruction_master_qualified_request_onchip_memory_0_s1 | ~cpu_0_instruction_master_read | (1 & cpu_0_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = {cpu_0_instruction_master_address[16],
    2'b0,
    cpu_0_instruction_master_address[13 : 0]};

  //cpu_0_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_instruction_master_read_but_no_slave_selected <= cpu_0_instruction_master_read & cpu_0_instruction_master_run & ~cpu_0_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_instruction_master_is_granted_some_slave = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_granted_onchip_memory_0_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_instruction_master_readdatavalid = cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_instruction_master_readdatavalid = cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid;

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~(cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module & cpu_0_instruction_master_read)}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1}} | onchip_memory_0_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_0_instruction_master_waitrequest = ~cpu_0_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_latency_counter <= 0;
      else 
        cpu_0_instruction_master_latency_counter <= p1_cpu_0_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_0_instruction_master_latency_counter = ((cpu_0_instruction_master_run & cpu_0_instruction_master_read))? latency_load_value :
    (cpu_0_instruction_master_latency_counter)? cpu_0_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {cpu_0_instruction_master_requests_onchip_memory_0_s1}} & 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_address_last_time <= 0;
      else 
        cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
    end


  //cpu_0/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_instruction_master_waitrequest & (cpu_0_instruction_master_read);
    end


  //cpu_0_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_address != cpu_0_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_last_time <= 0;
      else 
        cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
    end


  //cpu_0_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_read != cpu_0_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_1_jtag_debug_module_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_1_data_master_address_to_slave,
                                             cpu_1_data_master_byteenable,
                                             cpu_1_data_master_debugaccess,
                                             cpu_1_data_master_read,
                                             cpu_1_data_master_waitrequest,
                                             cpu_1_data_master_write,
                                             cpu_1_data_master_writedata,
                                             cpu_1_instruction_master_address_to_slave,
                                             cpu_1_instruction_master_latency_counter,
                                             cpu_1_instruction_master_read,
                                             cpu_1_jtag_debug_module_readdata,
                                             cpu_1_jtag_debug_module_resetrequest,
                                             reset_n,

                                            // outputs:
                                             cpu_1_data_master_granted_cpu_1_jtag_debug_module,
                                             cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module,
                                             cpu_1_data_master_read_data_valid_cpu_1_jtag_debug_module,
                                             cpu_1_data_master_requests_cpu_1_jtag_debug_module,
                                             cpu_1_instruction_master_granted_cpu_1_jtag_debug_module,
                                             cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module,
                                             cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module,
                                             cpu_1_instruction_master_requests_cpu_1_jtag_debug_module,
                                             cpu_1_jtag_debug_module_address,
                                             cpu_1_jtag_debug_module_begintransfer,
                                             cpu_1_jtag_debug_module_byteenable,
                                             cpu_1_jtag_debug_module_chipselect,
                                             cpu_1_jtag_debug_module_debugaccess,
                                             cpu_1_jtag_debug_module_readdata_from_sa,
                                             cpu_1_jtag_debug_module_reset_n,
                                             cpu_1_jtag_debug_module_resetrequest_from_sa,
                                             cpu_1_jtag_debug_module_write,
                                             cpu_1_jtag_debug_module_writedata,
                                             d1_cpu_1_jtag_debug_module_end_xfer
                                          )
;

  output           cpu_1_data_master_granted_cpu_1_jtag_debug_module;
  output           cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module;
  output           cpu_1_data_master_read_data_valid_cpu_1_jtag_debug_module;
  output           cpu_1_data_master_requests_cpu_1_jtag_debug_module;
  output           cpu_1_instruction_master_granted_cpu_1_jtag_debug_module;
  output           cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module;
  output           cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module;
  output           cpu_1_instruction_master_requests_cpu_1_jtag_debug_module;
  output  [  8: 0] cpu_1_jtag_debug_module_address;
  output           cpu_1_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_1_jtag_debug_module_byteenable;
  output           cpu_1_jtag_debug_module_chipselect;
  output           cpu_1_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_1_jtag_debug_module_readdata_from_sa;
  output           cpu_1_jtag_debug_module_reset_n;
  output           cpu_1_jtag_debug_module_resetrequest_from_sa;
  output           cpu_1_jtag_debug_module_write;
  output  [ 31: 0] cpu_1_jtag_debug_module_writedata;
  output           d1_cpu_1_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 17: 0] cpu_1_data_master_address_to_slave;
  input   [  3: 0] cpu_1_data_master_byteenable;
  input            cpu_1_data_master_debugaccess;
  input            cpu_1_data_master_read;
  input            cpu_1_data_master_waitrequest;
  input            cpu_1_data_master_write;
  input   [ 31: 0] cpu_1_data_master_writedata;
  input   [ 17: 0] cpu_1_instruction_master_address_to_slave;
  input            cpu_1_instruction_master_latency_counter;
  input            cpu_1_instruction_master_read;
  input   [ 31: 0] cpu_1_jtag_debug_module_readdata;
  input            cpu_1_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_1_data_master_arbiterlock;
  wire             cpu_1_data_master_arbiterlock2;
  wire             cpu_1_data_master_continuerequest;
  wire             cpu_1_data_master_granted_cpu_1_jtag_debug_module;
  wire             cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module;
  wire             cpu_1_data_master_read_data_valid_cpu_1_jtag_debug_module;
  wire             cpu_1_data_master_requests_cpu_1_jtag_debug_module;
  wire             cpu_1_data_master_saved_grant_cpu_1_jtag_debug_module;
  wire             cpu_1_instruction_master_arbiterlock;
  wire             cpu_1_instruction_master_arbiterlock2;
  wire             cpu_1_instruction_master_continuerequest;
  wire             cpu_1_instruction_master_granted_cpu_1_jtag_debug_module;
  wire             cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module;
  wire             cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module;
  wire             cpu_1_instruction_master_requests_cpu_1_jtag_debug_module;
  wire             cpu_1_instruction_master_saved_grant_cpu_1_jtag_debug_module;
  wire    [  8: 0] cpu_1_jtag_debug_module_address;
  wire             cpu_1_jtag_debug_module_allgrants;
  wire             cpu_1_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_1_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_1_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_1_jtag_debug_module_arb_addend;
  wire             cpu_1_jtag_debug_module_arb_counter_enable;
  reg              cpu_1_jtag_debug_module_arb_share_counter;
  wire             cpu_1_jtag_debug_module_arb_share_counter_next_value;
  wire             cpu_1_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_1_jtag_debug_module_arb_winner;
  wire             cpu_1_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_1_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_1_jtag_debug_module_begins_xfer;
  wire             cpu_1_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_1_jtag_debug_module_byteenable;
  wire             cpu_1_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_1_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_1_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_1_jtag_debug_module_debugaccess;
  wire             cpu_1_jtag_debug_module_end_xfer;
  wire             cpu_1_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_1_jtag_debug_module_grant_vector;
  wire             cpu_1_jtag_debug_module_in_a_read_cycle;
  wire             cpu_1_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_1_jtag_debug_module_master_qreq_vector;
  wire             cpu_1_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_1_jtag_debug_module_readdata_from_sa;
  reg              cpu_1_jtag_debug_module_reg_firsttransfer;
  wire             cpu_1_jtag_debug_module_reset_n;
  wire             cpu_1_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_1_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_1_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_1_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_1_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_1_jtag_debug_module_waits_for_read;
  wire             cpu_1_jtag_debug_module_waits_for_write;
  wire             cpu_1_jtag_debug_module_write;
  wire    [ 31: 0] cpu_1_jtag_debug_module_writedata;
  reg              d1_cpu_1_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_1_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_1_data_master_granted_slave_cpu_1_jtag_debug_module;
  reg              last_cycle_cpu_1_instruction_master_granted_slave_cpu_1_jtag_debug_module;
  wire    [ 17: 0] shifted_address_to_cpu_1_jtag_debug_module_from_cpu_1_data_master;
  wire    [ 17: 0] shifted_address_to_cpu_1_jtag_debug_module_from_cpu_1_instruction_master;
  wire             wait_for_cpu_1_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_1_jtag_debug_module_end_xfer;
    end


  assign cpu_1_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module | cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module));
  //assign cpu_1_jtag_debug_module_readdata_from_sa = cpu_1_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_1_jtag_debug_module_readdata_from_sa = cpu_1_jtag_debug_module_readdata;

  assign cpu_1_data_master_requests_cpu_1_jtag_debug_module = ({cpu_1_data_master_address_to_slave[17 : 11] , 11'b0} == 18'h0) & (cpu_1_data_master_read | cpu_1_data_master_write);
  //cpu_1_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_1_jtag_debug_module_arb_share_set_values = 1;

  //cpu_1_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_1_jtag_debug_module_non_bursting_master_requests = cpu_1_data_master_requests_cpu_1_jtag_debug_module |
    cpu_1_instruction_master_requests_cpu_1_jtag_debug_module |
    cpu_1_data_master_requests_cpu_1_jtag_debug_module |
    cpu_1_instruction_master_requests_cpu_1_jtag_debug_module;

  //cpu_1_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_1_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_1_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_1_jtag_debug_module_arb_share_counter_next_value = cpu_1_jtag_debug_module_firsttransfer ? (cpu_1_jtag_debug_module_arb_share_set_values - 1) : |cpu_1_jtag_debug_module_arb_share_counter ? (cpu_1_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_1_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_1_jtag_debug_module_allgrants = (|cpu_1_jtag_debug_module_grant_vector) |
    (|cpu_1_jtag_debug_module_grant_vector) |
    (|cpu_1_jtag_debug_module_grant_vector) |
    (|cpu_1_jtag_debug_module_grant_vector);

  //cpu_1_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_1_jtag_debug_module_end_xfer = ~(cpu_1_jtag_debug_module_waits_for_read | cpu_1_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_1_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_1_jtag_debug_module = cpu_1_jtag_debug_module_end_xfer & (~cpu_1_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_1_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_1_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_1_jtag_debug_module & cpu_1_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_1_jtag_debug_module & ~cpu_1_jtag_debug_module_non_bursting_master_requests);

  //cpu_1_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_1_jtag_debug_module_arb_counter_enable)
          cpu_1_jtag_debug_module_arb_share_counter <= cpu_1_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_1_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_1_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_1_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_1_jtag_debug_module & ~cpu_1_jtag_debug_module_non_bursting_master_requests))
          cpu_1_jtag_debug_module_slavearbiterlockenable <= |cpu_1_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_1/data_master cpu_1/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_1_data_master_arbiterlock = cpu_1_jtag_debug_module_slavearbiterlockenable & cpu_1_data_master_continuerequest;

  //cpu_1_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_1_jtag_debug_module_slavearbiterlockenable2 = |cpu_1_jtag_debug_module_arb_share_counter_next_value;

  //cpu_1/data_master cpu_1/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_1_data_master_arbiterlock2 = cpu_1_jtag_debug_module_slavearbiterlockenable2 & cpu_1_data_master_continuerequest;

  //cpu_1/instruction_master cpu_1/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_1_instruction_master_arbiterlock = cpu_1_jtag_debug_module_slavearbiterlockenable & cpu_1_instruction_master_continuerequest;

  //cpu_1/instruction_master cpu_1/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_1_instruction_master_arbiterlock2 = cpu_1_jtag_debug_module_slavearbiterlockenable2 & cpu_1_instruction_master_continuerequest;

  //cpu_1/instruction_master granted cpu_1/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_1_instruction_master_granted_slave_cpu_1_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_1_instruction_master_granted_slave_cpu_1_jtag_debug_module <= cpu_1_instruction_master_saved_grant_cpu_1_jtag_debug_module ? 1 : (cpu_1_jtag_debug_module_arbitration_holdoff_internal | ~cpu_1_instruction_master_requests_cpu_1_jtag_debug_module) ? 0 : last_cycle_cpu_1_instruction_master_granted_slave_cpu_1_jtag_debug_module;
    end


  //cpu_1_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_1_instruction_master_continuerequest = last_cycle_cpu_1_instruction_master_granted_slave_cpu_1_jtag_debug_module & cpu_1_instruction_master_requests_cpu_1_jtag_debug_module;

  //cpu_1_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_1_jtag_debug_module_any_continuerequest = cpu_1_instruction_master_continuerequest |
    cpu_1_data_master_continuerequest;

  assign cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module = cpu_1_data_master_requests_cpu_1_jtag_debug_module & ~(((~cpu_1_data_master_waitrequest) & cpu_1_data_master_write) | cpu_1_instruction_master_arbiterlock);
  //cpu_1_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_1_jtag_debug_module_writedata = cpu_1_data_master_writedata;

  assign cpu_1_instruction_master_requests_cpu_1_jtag_debug_module = (({cpu_1_instruction_master_address_to_slave[17 : 11] , 11'b0} == 18'h0) & (cpu_1_instruction_master_read)) & cpu_1_instruction_master_read;
  //cpu_1/data_master granted cpu_1/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_1_data_master_granted_slave_cpu_1_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_1_data_master_granted_slave_cpu_1_jtag_debug_module <= cpu_1_data_master_saved_grant_cpu_1_jtag_debug_module ? 1 : (cpu_1_jtag_debug_module_arbitration_holdoff_internal | ~cpu_1_data_master_requests_cpu_1_jtag_debug_module) ? 0 : last_cycle_cpu_1_data_master_granted_slave_cpu_1_jtag_debug_module;
    end


  //cpu_1_data_master_continuerequest continued request, which is an e_mux
  assign cpu_1_data_master_continuerequest = last_cycle_cpu_1_data_master_granted_slave_cpu_1_jtag_debug_module & cpu_1_data_master_requests_cpu_1_jtag_debug_module;

  assign cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module = cpu_1_instruction_master_requests_cpu_1_jtag_debug_module & ~((cpu_1_instruction_master_read & ((cpu_1_instruction_master_latency_counter != 0))) | cpu_1_data_master_arbiterlock);
  //local readdatavalid cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module, which is an e_mux
  assign cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module = cpu_1_instruction_master_granted_cpu_1_jtag_debug_module & cpu_1_instruction_master_read & ~cpu_1_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu_1/jtag_debug_module, which is an e_assign
  assign cpu_1_jtag_debug_module_allow_new_arb_cycle = ~cpu_1_data_master_arbiterlock & ~cpu_1_instruction_master_arbiterlock;

  //cpu_1/instruction_master assignment into master qualified-requests vector for cpu_1/jtag_debug_module, which is an e_assign
  assign cpu_1_jtag_debug_module_master_qreq_vector[0] = cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module;

  //cpu_1/instruction_master grant cpu_1/jtag_debug_module, which is an e_assign
  assign cpu_1_instruction_master_granted_cpu_1_jtag_debug_module = cpu_1_jtag_debug_module_grant_vector[0];

  //cpu_1/instruction_master saved-grant cpu_1/jtag_debug_module, which is an e_assign
  assign cpu_1_instruction_master_saved_grant_cpu_1_jtag_debug_module = cpu_1_jtag_debug_module_arb_winner[0] && cpu_1_instruction_master_requests_cpu_1_jtag_debug_module;

  //cpu_1/data_master assignment into master qualified-requests vector for cpu_1/jtag_debug_module, which is an e_assign
  assign cpu_1_jtag_debug_module_master_qreq_vector[1] = cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module;

  //cpu_1/data_master grant cpu_1/jtag_debug_module, which is an e_assign
  assign cpu_1_data_master_granted_cpu_1_jtag_debug_module = cpu_1_jtag_debug_module_grant_vector[1];

  //cpu_1/data_master saved-grant cpu_1/jtag_debug_module, which is an e_assign
  assign cpu_1_data_master_saved_grant_cpu_1_jtag_debug_module = cpu_1_jtag_debug_module_arb_winner[1] && cpu_1_data_master_requests_cpu_1_jtag_debug_module;

  //cpu_1/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_1_jtag_debug_module_chosen_master_double_vector = {cpu_1_jtag_debug_module_master_qreq_vector, cpu_1_jtag_debug_module_master_qreq_vector} & ({~cpu_1_jtag_debug_module_master_qreq_vector, ~cpu_1_jtag_debug_module_master_qreq_vector} + cpu_1_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_1_jtag_debug_module_arb_winner = (cpu_1_jtag_debug_module_allow_new_arb_cycle & | cpu_1_jtag_debug_module_grant_vector) ? cpu_1_jtag_debug_module_grant_vector : cpu_1_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_1_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_1_jtag_debug_module_allow_new_arb_cycle)
          cpu_1_jtag_debug_module_saved_chosen_master_vector <= |cpu_1_jtag_debug_module_grant_vector ? cpu_1_jtag_debug_module_grant_vector : cpu_1_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_1_jtag_debug_module_grant_vector = {(cpu_1_jtag_debug_module_chosen_master_double_vector[1] | cpu_1_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_1_jtag_debug_module_chosen_master_double_vector[0] | cpu_1_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu_1/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_1_jtag_debug_module_chosen_master_rot_left = (cpu_1_jtag_debug_module_arb_winner << 1) ? (cpu_1_jtag_debug_module_arb_winner << 1) : 1;

  //cpu_1/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_1_jtag_debug_module_grant_vector)
          cpu_1_jtag_debug_module_arb_addend <= cpu_1_jtag_debug_module_end_xfer? cpu_1_jtag_debug_module_chosen_master_rot_left : cpu_1_jtag_debug_module_grant_vector;
    end


  assign cpu_1_jtag_debug_module_begintransfer = cpu_1_jtag_debug_module_begins_xfer;
  //cpu_1_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_1_jtag_debug_module_reset_n = reset_n;

  //assign cpu_1_jtag_debug_module_resetrequest_from_sa = cpu_1_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_1_jtag_debug_module_resetrequest_from_sa = cpu_1_jtag_debug_module_resetrequest;

  assign cpu_1_jtag_debug_module_chipselect = cpu_1_data_master_granted_cpu_1_jtag_debug_module | cpu_1_instruction_master_granted_cpu_1_jtag_debug_module;
  //cpu_1_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_1_jtag_debug_module_firsttransfer = cpu_1_jtag_debug_module_begins_xfer ? cpu_1_jtag_debug_module_unreg_firsttransfer : cpu_1_jtag_debug_module_reg_firsttransfer;

  //cpu_1_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_1_jtag_debug_module_unreg_firsttransfer = ~(cpu_1_jtag_debug_module_slavearbiterlockenable & cpu_1_jtag_debug_module_any_continuerequest);

  //cpu_1_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_1_jtag_debug_module_begins_xfer)
          cpu_1_jtag_debug_module_reg_firsttransfer <= cpu_1_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_1_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_1_jtag_debug_module_beginbursttransfer_internal = cpu_1_jtag_debug_module_begins_xfer;

  //cpu_1_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_1_jtag_debug_module_arbitration_holdoff_internal = cpu_1_jtag_debug_module_begins_xfer & cpu_1_jtag_debug_module_firsttransfer;

  //cpu_1_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_1_jtag_debug_module_write = cpu_1_data_master_granted_cpu_1_jtag_debug_module & cpu_1_data_master_write;

  assign shifted_address_to_cpu_1_jtag_debug_module_from_cpu_1_data_master = cpu_1_data_master_address_to_slave;
  //cpu_1_jtag_debug_module_address mux, which is an e_mux
  assign cpu_1_jtag_debug_module_address = (cpu_1_data_master_granted_cpu_1_jtag_debug_module)? (shifted_address_to_cpu_1_jtag_debug_module_from_cpu_1_data_master >> 2) :
    (shifted_address_to_cpu_1_jtag_debug_module_from_cpu_1_instruction_master >> 2);

  assign shifted_address_to_cpu_1_jtag_debug_module_from_cpu_1_instruction_master = cpu_1_instruction_master_address_to_slave;
  //d1_cpu_1_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_1_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_1_jtag_debug_module_end_xfer <= cpu_1_jtag_debug_module_end_xfer;
    end


  //cpu_1_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_1_jtag_debug_module_waits_for_read = cpu_1_jtag_debug_module_in_a_read_cycle & cpu_1_jtag_debug_module_begins_xfer;

  //cpu_1_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_1_jtag_debug_module_in_a_read_cycle = (cpu_1_data_master_granted_cpu_1_jtag_debug_module & cpu_1_data_master_read) | (cpu_1_instruction_master_granted_cpu_1_jtag_debug_module & cpu_1_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_1_jtag_debug_module_in_a_read_cycle;

  //cpu_1_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_1_jtag_debug_module_waits_for_write = cpu_1_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_1_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_1_jtag_debug_module_in_a_write_cycle = cpu_1_data_master_granted_cpu_1_jtag_debug_module & cpu_1_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_1_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_1_jtag_debug_module_counter = 0;
  //cpu_1_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_1_jtag_debug_module_byteenable = (cpu_1_data_master_granted_cpu_1_jtag_debug_module)? cpu_1_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_1_jtag_debug_module_debugaccess = (cpu_1_data_master_granted_cpu_1_jtag_debug_module)? cpu_1_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_1/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_1_data_master_granted_cpu_1_jtag_debug_module + cpu_1_instruction_master_granted_cpu_1_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_1_data_master_saved_grant_cpu_1_jtag_debug_module + cpu_1_instruction_master_saved_grant_cpu_1_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_1_data_master_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_1_data_master_address,
                                       cpu_1_data_master_granted_cpu_1_jtag_debug_module,
                                       cpu_1_data_master_granted_in_1_s1,
                                       cpu_1_data_master_granted_mutex_0_s1,
                                       cpu_1_data_master_granted_onchip_memory_1_s1,
                                       cpu_1_data_master_granted_out_1_s1,
                                       cpu_1_data_master_granted_timer_1_s1,
                                       cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module,
                                       cpu_1_data_master_qualified_request_in_1_s1,
                                       cpu_1_data_master_qualified_request_mutex_0_s1,
                                       cpu_1_data_master_qualified_request_onchip_memory_1_s1,
                                       cpu_1_data_master_qualified_request_out_1_s1,
                                       cpu_1_data_master_qualified_request_timer_1_s1,
                                       cpu_1_data_master_read,
                                       cpu_1_data_master_read_data_valid_cpu_1_jtag_debug_module,
                                       cpu_1_data_master_read_data_valid_in_1_s1,
                                       cpu_1_data_master_read_data_valid_mutex_0_s1,
                                       cpu_1_data_master_read_data_valid_onchip_memory_1_s1,
                                       cpu_1_data_master_read_data_valid_out_1_s1,
                                       cpu_1_data_master_read_data_valid_timer_1_s1,
                                       cpu_1_data_master_requests_cpu_1_jtag_debug_module,
                                       cpu_1_data_master_requests_in_1_s1,
                                       cpu_1_data_master_requests_mutex_0_s1,
                                       cpu_1_data_master_requests_onchip_memory_1_s1,
                                       cpu_1_data_master_requests_out_1_s1,
                                       cpu_1_data_master_requests_timer_1_s1,
                                       cpu_1_data_master_write,
                                       cpu_1_jtag_debug_module_readdata_from_sa,
                                       d1_cpu_1_jtag_debug_module_end_xfer,
                                       d1_in_1_s1_end_xfer,
                                       d1_mutex_0_s1_end_xfer,
                                       d1_onchip_memory_1_s1_end_xfer,
                                       d1_out_1_s1_end_xfer,
                                       d1_timer_1_s1_end_xfer,
                                       in_1_s1_readdata_from_sa,
                                       mutex_0_s1_readdata_from_sa,
                                       onchip_memory_1_s1_readdata_from_sa,
                                       out_1_s1_readdata_from_sa,
                                       registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1,
                                       reset_n,
                                       timer_1_s1_irq_from_sa,
                                       timer_1_s1_readdata_from_sa,

                                      // outputs:
                                       cpu_1_data_master_address_to_slave,
                                       cpu_1_data_master_irq,
                                       cpu_1_data_master_readdata,
                                       cpu_1_data_master_waitrequest
                                    )
;

  output  [ 17: 0] cpu_1_data_master_address_to_slave;
  output  [ 31: 0] cpu_1_data_master_irq;
  output  [ 31: 0] cpu_1_data_master_readdata;
  output           cpu_1_data_master_waitrequest;
  input            clk;
  input   [ 17: 0] cpu_1_data_master_address;
  input            cpu_1_data_master_granted_cpu_1_jtag_debug_module;
  input            cpu_1_data_master_granted_in_1_s1;
  input            cpu_1_data_master_granted_mutex_0_s1;
  input            cpu_1_data_master_granted_onchip_memory_1_s1;
  input            cpu_1_data_master_granted_out_1_s1;
  input            cpu_1_data_master_granted_timer_1_s1;
  input            cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module;
  input            cpu_1_data_master_qualified_request_in_1_s1;
  input            cpu_1_data_master_qualified_request_mutex_0_s1;
  input            cpu_1_data_master_qualified_request_onchip_memory_1_s1;
  input            cpu_1_data_master_qualified_request_out_1_s1;
  input            cpu_1_data_master_qualified_request_timer_1_s1;
  input            cpu_1_data_master_read;
  input            cpu_1_data_master_read_data_valid_cpu_1_jtag_debug_module;
  input            cpu_1_data_master_read_data_valid_in_1_s1;
  input            cpu_1_data_master_read_data_valid_mutex_0_s1;
  input            cpu_1_data_master_read_data_valid_onchip_memory_1_s1;
  input            cpu_1_data_master_read_data_valid_out_1_s1;
  input            cpu_1_data_master_read_data_valid_timer_1_s1;
  input            cpu_1_data_master_requests_cpu_1_jtag_debug_module;
  input            cpu_1_data_master_requests_in_1_s1;
  input            cpu_1_data_master_requests_mutex_0_s1;
  input            cpu_1_data_master_requests_onchip_memory_1_s1;
  input            cpu_1_data_master_requests_out_1_s1;
  input            cpu_1_data_master_requests_timer_1_s1;
  input            cpu_1_data_master_write;
  input   [ 31: 0] cpu_1_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_1_jtag_debug_module_end_xfer;
  input            d1_in_1_s1_end_xfer;
  input            d1_mutex_0_s1_end_xfer;
  input            d1_onchip_memory_1_s1_end_xfer;
  input            d1_out_1_s1_end_xfer;
  input            d1_timer_1_s1_end_xfer;
  input   [ 31: 0] in_1_s1_readdata_from_sa;
  input   [ 31: 0] mutex_0_s1_readdata_from_sa;
  input   [ 31: 0] onchip_memory_1_s1_readdata_from_sa;
  input   [ 31: 0] out_1_s1_readdata_from_sa;
  input            registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1;
  input            reset_n;
  input            timer_1_s1_irq_from_sa;
  input   [ 15: 0] timer_1_s1_readdata_from_sa;

  wire    [ 17: 0] cpu_1_data_master_address_to_slave;
  wire    [ 31: 0] cpu_1_data_master_irq;
  wire    [ 31: 0] cpu_1_data_master_readdata;
  wire             cpu_1_data_master_run;
  reg              cpu_1_data_master_waitrequest;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module | ~cpu_1_data_master_requests_cpu_1_jtag_debug_module) & (cpu_1_data_master_granted_cpu_1_jtag_debug_module | ~cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module) & ((~cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module | ~cpu_1_data_master_read | (1 & 1 & cpu_1_data_master_read))) & ((~cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module | ~cpu_1_data_master_write | (1 & cpu_1_data_master_write))) & 1 & ((~cpu_1_data_master_qualified_request_in_1_s1 | ~cpu_1_data_master_read | (1 & 1 & cpu_1_data_master_read))) & ((~cpu_1_data_master_qualified_request_in_1_s1 | ~cpu_1_data_master_write | (1 & cpu_1_data_master_write))) & 1 & (cpu_1_data_master_qualified_request_mutex_0_s1 | ~cpu_1_data_master_requests_mutex_0_s1) & (cpu_1_data_master_granted_mutex_0_s1 | ~cpu_1_data_master_qualified_request_mutex_0_s1) & ((~cpu_1_data_master_qualified_request_mutex_0_s1 | ~cpu_1_data_master_read | (1 & 1 & cpu_1_data_master_read))) & ((~cpu_1_data_master_qualified_request_mutex_0_s1 | ~cpu_1_data_master_write | (1 & cpu_1_data_master_write))) & 1 & (cpu_1_data_master_qualified_request_onchip_memory_1_s1 | registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1 | ~cpu_1_data_master_requests_onchip_memory_1_s1) & (cpu_1_data_master_granted_onchip_memory_1_s1 | ~cpu_1_data_master_qualified_request_onchip_memory_1_s1) & ((~cpu_1_data_master_qualified_request_onchip_memory_1_s1 | ~cpu_1_data_master_read | (registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1 & cpu_1_data_master_read))) & ((~cpu_1_data_master_qualified_request_onchip_memory_1_s1 | ~(cpu_1_data_master_read | cpu_1_data_master_write) | (1 & (cpu_1_data_master_read | cpu_1_data_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_1_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_1_data_master_qualified_request_out_1_s1 | ~cpu_1_data_master_requests_out_1_s1) & ((~cpu_1_data_master_qualified_request_out_1_s1 | ~cpu_1_data_master_read | (1 & 1 & cpu_1_data_master_read))) & ((~cpu_1_data_master_qualified_request_out_1_s1 | ~cpu_1_data_master_write | (1 & cpu_1_data_master_write))) & 1 & (cpu_1_data_master_qualified_request_timer_1_s1 | ~cpu_1_data_master_requests_timer_1_s1) & ((~cpu_1_data_master_qualified_request_timer_1_s1 | ~cpu_1_data_master_read | (1 & 1 & cpu_1_data_master_read))) & ((~cpu_1_data_master_qualified_request_timer_1_s1 | ~cpu_1_data_master_write | (1 & cpu_1_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_1_data_master_address_to_slave = {cpu_1_data_master_address[17],
    3'b0,
    cpu_1_data_master_address[13 : 0]};

  //cpu_1/data_master readdata mux, which is an e_mux
  assign cpu_1_data_master_readdata = ({32 {~cpu_1_data_master_requests_cpu_1_jtag_debug_module}} | cpu_1_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_1_data_master_requests_in_1_s1}} | in_1_s1_readdata_from_sa) &
    ({32 {~cpu_1_data_master_requests_mutex_0_s1}} | mutex_0_s1_readdata_from_sa) &
    ({32 {~cpu_1_data_master_requests_onchip_memory_1_s1}} | onchip_memory_1_s1_readdata_from_sa) &
    ({32 {~cpu_1_data_master_requests_out_1_s1}} | out_1_s1_readdata_from_sa) &
    ({32 {~cpu_1_data_master_requests_timer_1_s1}} | timer_1_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_data_master_waitrequest <= ~0;
      else 
        cpu_1_data_master_waitrequest <= ~((~(cpu_1_data_master_read | cpu_1_data_master_write))? 0: (cpu_1_data_master_run & cpu_1_data_master_waitrequest));
    end


  //irq assign, which is an e_assign
  assign cpu_1_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    timer_1_s1_irq_from_sa};


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_1_instruction_master_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_1_instruction_master_address,
                                              cpu_1_instruction_master_granted_cpu_1_jtag_debug_module,
                                              cpu_1_instruction_master_granted_onchip_memory_1_s1,
                                              cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module,
                                              cpu_1_instruction_master_qualified_request_onchip_memory_1_s1,
                                              cpu_1_instruction_master_read,
                                              cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module,
                                              cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1,
                                              cpu_1_instruction_master_requests_cpu_1_jtag_debug_module,
                                              cpu_1_instruction_master_requests_onchip_memory_1_s1,
                                              cpu_1_jtag_debug_module_readdata_from_sa,
                                              d1_cpu_1_jtag_debug_module_end_xfer,
                                              d1_onchip_memory_1_s1_end_xfer,
                                              onchip_memory_1_s1_readdata_from_sa,
                                              reset_n,

                                             // outputs:
                                              cpu_1_instruction_master_address_to_slave,
                                              cpu_1_instruction_master_latency_counter,
                                              cpu_1_instruction_master_readdata,
                                              cpu_1_instruction_master_readdatavalid,
                                              cpu_1_instruction_master_waitrequest
                                           )
;

  output  [ 17: 0] cpu_1_instruction_master_address_to_slave;
  output           cpu_1_instruction_master_latency_counter;
  output  [ 31: 0] cpu_1_instruction_master_readdata;
  output           cpu_1_instruction_master_readdatavalid;
  output           cpu_1_instruction_master_waitrequest;
  input            clk;
  input   [ 17: 0] cpu_1_instruction_master_address;
  input            cpu_1_instruction_master_granted_cpu_1_jtag_debug_module;
  input            cpu_1_instruction_master_granted_onchip_memory_1_s1;
  input            cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module;
  input            cpu_1_instruction_master_qualified_request_onchip_memory_1_s1;
  input            cpu_1_instruction_master_read;
  input            cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module;
  input            cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1;
  input            cpu_1_instruction_master_requests_cpu_1_jtag_debug_module;
  input            cpu_1_instruction_master_requests_onchip_memory_1_s1;
  input   [ 31: 0] cpu_1_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_1_jtag_debug_module_end_xfer;
  input            d1_onchip_memory_1_s1_end_xfer;
  input   [ 31: 0] onchip_memory_1_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 17: 0] cpu_1_instruction_master_address_last_time;
  wire    [ 17: 0] cpu_1_instruction_master_address_to_slave;
  wire             cpu_1_instruction_master_is_granted_some_slave;
  reg              cpu_1_instruction_master_latency_counter;
  reg              cpu_1_instruction_master_read_but_no_slave_selected;
  reg              cpu_1_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_1_instruction_master_readdata;
  wire             cpu_1_instruction_master_readdatavalid;
  wire             cpu_1_instruction_master_run;
  wire             cpu_1_instruction_master_waitrequest;
  wire             latency_load_value;
  wire             p1_cpu_1_instruction_master_latency_counter;
  wire             pre_flush_cpu_1_instruction_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module | ~cpu_1_instruction_master_requests_cpu_1_jtag_debug_module) & (cpu_1_instruction_master_granted_cpu_1_jtag_debug_module | ~cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module) & ((~cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module | ~cpu_1_instruction_master_read | (1 & ~d1_cpu_1_jtag_debug_module_end_xfer & cpu_1_instruction_master_read))) & 1 & (cpu_1_instruction_master_qualified_request_onchip_memory_1_s1 | ~cpu_1_instruction_master_requests_onchip_memory_1_s1) & (cpu_1_instruction_master_granted_onchip_memory_1_s1 | ~cpu_1_instruction_master_qualified_request_onchip_memory_1_s1) & ((~cpu_1_instruction_master_qualified_request_onchip_memory_1_s1 | ~cpu_1_instruction_master_read | (1 & cpu_1_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_1_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_1_instruction_master_address_to_slave = {cpu_1_instruction_master_address[17],
    3'b0,
    cpu_1_instruction_master_address[13 : 0]};

  //cpu_1_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_1_instruction_master_read_but_no_slave_selected <= cpu_1_instruction_master_read & cpu_1_instruction_master_run & ~cpu_1_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_1_instruction_master_is_granted_some_slave = cpu_1_instruction_master_granted_cpu_1_jtag_debug_module |
    cpu_1_instruction_master_granted_onchip_memory_1_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_1_instruction_master_readdatavalid = cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_1_instruction_master_readdatavalid = cpu_1_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_1_instruction_master_readdatavalid |
    cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module |
    cpu_1_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_1_instruction_master_readdatavalid;

  //cpu_1/instruction_master readdata mux, which is an e_mux
  assign cpu_1_instruction_master_readdata = ({32 {~(cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module & cpu_1_instruction_master_read)}} | cpu_1_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1}} | onchip_memory_1_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_1_instruction_master_waitrequest = ~cpu_1_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_instruction_master_latency_counter <= 0;
      else 
        cpu_1_instruction_master_latency_counter <= p1_cpu_1_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_1_instruction_master_latency_counter = ((cpu_1_instruction_master_run & cpu_1_instruction_master_read))? latency_load_value :
    (cpu_1_instruction_master_latency_counter)? cpu_1_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {cpu_1_instruction_master_requests_onchip_memory_1_s1}} & 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_1_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_instruction_master_address_last_time <= 0;
      else 
        cpu_1_instruction_master_address_last_time <= cpu_1_instruction_master_address;
    end


  //cpu_1/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_1_instruction_master_waitrequest & (cpu_1_instruction_master_read);
    end


  //cpu_1_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_1_instruction_master_address != cpu_1_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_1_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_1_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_instruction_master_read_last_time <= 0;
      else 
        cpu_1_instruction_master_read_last_time <= cpu_1_instruction_master_read;
    end


  //cpu_1_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_1_instruction_master_read != cpu_1_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_1_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module in_0_s1_arbitrator (
                            // inputs:
                             clk,
                             cpu_0_data_master_address_to_slave,
                             cpu_0_data_master_read,
                             cpu_0_data_master_write,
                             in_0_s1_readdata,
                             reset_n,

                            // outputs:
                             cpu_0_data_master_granted_in_0_s1,
                             cpu_0_data_master_qualified_request_in_0_s1,
                             cpu_0_data_master_read_data_valid_in_0_s1,
                             cpu_0_data_master_requests_in_0_s1,
                             d1_in_0_s1_end_xfer,
                             in_0_s1_address,
                             in_0_s1_readdata_from_sa,
                             in_0_s1_reset_n
                          )
;

  output           cpu_0_data_master_granted_in_0_s1;
  output           cpu_0_data_master_qualified_request_in_0_s1;
  output           cpu_0_data_master_read_data_valid_in_0_s1;
  output           cpu_0_data_master_requests_in_0_s1;
  output           d1_in_0_s1_end_xfer;
  output  [  1: 0] in_0_s1_address;
  output  [ 31: 0] in_0_s1_readdata_from_sa;
  output           in_0_s1_reset_n;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] in_0_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_in_0_s1;
  wire             cpu_0_data_master_qualified_request_in_0_s1;
  wire             cpu_0_data_master_read_data_valid_in_0_s1;
  wire             cpu_0_data_master_requests_in_0_s1;
  wire             cpu_0_data_master_saved_grant_in_0_s1;
  reg              d1_in_0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_in_0_s1;
  wire    [  1: 0] in_0_s1_address;
  wire             in_0_s1_allgrants;
  wire             in_0_s1_allow_new_arb_cycle;
  wire             in_0_s1_any_bursting_master_saved_grant;
  wire             in_0_s1_any_continuerequest;
  wire             in_0_s1_arb_counter_enable;
  reg              in_0_s1_arb_share_counter;
  wire             in_0_s1_arb_share_counter_next_value;
  wire             in_0_s1_arb_share_set_values;
  wire             in_0_s1_beginbursttransfer_internal;
  wire             in_0_s1_begins_xfer;
  wire             in_0_s1_end_xfer;
  wire             in_0_s1_firsttransfer;
  wire             in_0_s1_grant_vector;
  wire             in_0_s1_in_a_read_cycle;
  wire             in_0_s1_in_a_write_cycle;
  wire             in_0_s1_master_qreq_vector;
  wire             in_0_s1_non_bursting_master_requests;
  wire    [ 31: 0] in_0_s1_readdata_from_sa;
  reg              in_0_s1_reg_firsttransfer;
  wire             in_0_s1_reset_n;
  reg              in_0_s1_slavearbiterlockenable;
  wire             in_0_s1_slavearbiterlockenable2;
  wire             in_0_s1_unreg_firsttransfer;
  wire             in_0_s1_waits_for_read;
  wire             in_0_s1_waits_for_write;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 16: 0] shifted_address_to_in_0_s1_from_cpu_0_data_master;
  wire             wait_for_in_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~in_0_s1_end_xfer;
    end


  assign in_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_in_0_s1));
  //assign in_0_s1_readdata_from_sa = in_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign in_0_s1_readdata_from_sa = in_0_s1_readdata;

  assign cpu_0_data_master_requests_in_0_s1 = (({cpu_0_data_master_address_to_slave[16 : 4] , 4'b0} == 17'h830) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //in_0_s1_arb_share_counter set values, which is an e_mux
  assign in_0_s1_arb_share_set_values = 1;

  //in_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign in_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_in_0_s1;

  //in_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign in_0_s1_any_bursting_master_saved_grant = 0;

  //in_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign in_0_s1_arb_share_counter_next_value = in_0_s1_firsttransfer ? (in_0_s1_arb_share_set_values - 1) : |in_0_s1_arb_share_counter ? (in_0_s1_arb_share_counter - 1) : 0;

  //in_0_s1_allgrants all slave grants, which is an e_mux
  assign in_0_s1_allgrants = |in_0_s1_grant_vector;

  //in_0_s1_end_xfer assignment, which is an e_assign
  assign in_0_s1_end_xfer = ~(in_0_s1_waits_for_read | in_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_in_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_in_0_s1 = in_0_s1_end_xfer & (~in_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //in_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign in_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_in_0_s1 & in_0_s1_allgrants) | (end_xfer_arb_share_counter_term_in_0_s1 & ~in_0_s1_non_bursting_master_requests);

  //in_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_0_s1_arb_share_counter <= 0;
      else if (in_0_s1_arb_counter_enable)
          in_0_s1_arb_share_counter <= in_0_s1_arb_share_counter_next_value;
    end


  //in_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_0_s1_slavearbiterlockenable <= 0;
      else if ((|in_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_in_0_s1) | (end_xfer_arb_share_counter_term_in_0_s1 & ~in_0_s1_non_bursting_master_requests))
          in_0_s1_slavearbiterlockenable <= |in_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master in_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = in_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //in_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign in_0_s1_slavearbiterlockenable2 = |in_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master in_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = in_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //in_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign in_0_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_in_0_s1 = cpu_0_data_master_requests_in_0_s1;
  //master is always granted when requested
  assign cpu_0_data_master_granted_in_0_s1 = cpu_0_data_master_qualified_request_in_0_s1;

  //cpu_0/data_master saved-grant in_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_in_0_s1 = cpu_0_data_master_requests_in_0_s1;

  //allow new arb cycle for in_0/s1, which is an e_assign
  assign in_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign in_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign in_0_s1_master_qreq_vector = 1;

  //in_0_s1_reset_n assignment, which is an e_assign
  assign in_0_s1_reset_n = reset_n;

  //in_0_s1_firsttransfer first transaction, which is an e_assign
  assign in_0_s1_firsttransfer = in_0_s1_begins_xfer ? in_0_s1_unreg_firsttransfer : in_0_s1_reg_firsttransfer;

  //in_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign in_0_s1_unreg_firsttransfer = ~(in_0_s1_slavearbiterlockenable & in_0_s1_any_continuerequest);

  //in_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_0_s1_reg_firsttransfer <= 1'b1;
      else if (in_0_s1_begins_xfer)
          in_0_s1_reg_firsttransfer <= in_0_s1_unreg_firsttransfer;
    end


  //in_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign in_0_s1_beginbursttransfer_internal = in_0_s1_begins_xfer;

  assign shifted_address_to_in_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //in_0_s1_address mux, which is an e_mux
  assign in_0_s1_address = shifted_address_to_in_0_s1_from_cpu_0_data_master >> 2;

  //d1_in_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_0_s1_end_xfer <= 1;
      else 
        d1_in_0_s1_end_xfer <= in_0_s1_end_xfer;
    end


  //in_0_s1_waits_for_read in a cycle, which is an e_mux
  assign in_0_s1_waits_for_read = in_0_s1_in_a_read_cycle & in_0_s1_begins_xfer;

  //in_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign in_0_s1_in_a_read_cycle = cpu_0_data_master_granted_in_0_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = in_0_s1_in_a_read_cycle;

  //in_0_s1_waits_for_write in a cycle, which is an e_mux
  assign in_0_s1_waits_for_write = in_0_s1_in_a_write_cycle & 0;

  //in_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign in_0_s1_in_a_write_cycle = cpu_0_data_master_granted_in_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = in_0_s1_in_a_write_cycle;

  assign wait_for_in_0_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //in_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module in_1_s1_arbitrator (
                            // inputs:
                             clk,
                             cpu_1_data_master_address_to_slave,
                             cpu_1_data_master_read,
                             cpu_1_data_master_write,
                             in_1_s1_readdata,
                             reset_n,

                            // outputs:
                             cpu_1_data_master_granted_in_1_s1,
                             cpu_1_data_master_qualified_request_in_1_s1,
                             cpu_1_data_master_read_data_valid_in_1_s1,
                             cpu_1_data_master_requests_in_1_s1,
                             d1_in_1_s1_end_xfer,
                             in_1_s1_address,
                             in_1_s1_readdata_from_sa,
                             in_1_s1_reset_n
                          )
;

  output           cpu_1_data_master_granted_in_1_s1;
  output           cpu_1_data_master_qualified_request_in_1_s1;
  output           cpu_1_data_master_read_data_valid_in_1_s1;
  output           cpu_1_data_master_requests_in_1_s1;
  output           d1_in_1_s1_end_xfer;
  output  [  1: 0] in_1_s1_address;
  output  [ 31: 0] in_1_s1_readdata_from_sa;
  output           in_1_s1_reset_n;
  input            clk;
  input   [ 17: 0] cpu_1_data_master_address_to_slave;
  input            cpu_1_data_master_read;
  input            cpu_1_data_master_write;
  input   [ 31: 0] in_1_s1_readdata;
  input            reset_n;

  wire             cpu_1_data_master_arbiterlock;
  wire             cpu_1_data_master_arbiterlock2;
  wire             cpu_1_data_master_continuerequest;
  wire             cpu_1_data_master_granted_in_1_s1;
  wire             cpu_1_data_master_qualified_request_in_1_s1;
  wire             cpu_1_data_master_read_data_valid_in_1_s1;
  wire             cpu_1_data_master_requests_in_1_s1;
  wire             cpu_1_data_master_saved_grant_in_1_s1;
  reg              d1_in_1_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_in_1_s1;
  wire    [  1: 0] in_1_s1_address;
  wire             in_1_s1_allgrants;
  wire             in_1_s1_allow_new_arb_cycle;
  wire             in_1_s1_any_bursting_master_saved_grant;
  wire             in_1_s1_any_continuerequest;
  wire             in_1_s1_arb_counter_enable;
  reg              in_1_s1_arb_share_counter;
  wire             in_1_s1_arb_share_counter_next_value;
  wire             in_1_s1_arb_share_set_values;
  wire             in_1_s1_beginbursttransfer_internal;
  wire             in_1_s1_begins_xfer;
  wire             in_1_s1_end_xfer;
  wire             in_1_s1_firsttransfer;
  wire             in_1_s1_grant_vector;
  wire             in_1_s1_in_a_read_cycle;
  wire             in_1_s1_in_a_write_cycle;
  wire             in_1_s1_master_qreq_vector;
  wire             in_1_s1_non_bursting_master_requests;
  wire    [ 31: 0] in_1_s1_readdata_from_sa;
  reg              in_1_s1_reg_firsttransfer;
  wire             in_1_s1_reset_n;
  reg              in_1_s1_slavearbiterlockenable;
  wire             in_1_s1_slavearbiterlockenable2;
  wire             in_1_s1_unreg_firsttransfer;
  wire             in_1_s1_waits_for_read;
  wire             in_1_s1_waits_for_write;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 17: 0] shifted_address_to_in_1_s1_from_cpu_1_data_master;
  wire             wait_for_in_1_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~in_1_s1_end_xfer;
    end


  assign in_1_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_1_data_master_qualified_request_in_1_s1));
  //assign in_1_s1_readdata_from_sa = in_1_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign in_1_s1_readdata_from_sa = in_1_s1_readdata;

  assign cpu_1_data_master_requests_in_1_s1 = (({cpu_1_data_master_address_to_slave[17 : 4] , 4'b0} == 18'h870) & (cpu_1_data_master_read | cpu_1_data_master_write)) & cpu_1_data_master_read;
  //in_1_s1_arb_share_counter set values, which is an e_mux
  assign in_1_s1_arb_share_set_values = 1;

  //in_1_s1_non_bursting_master_requests mux, which is an e_mux
  assign in_1_s1_non_bursting_master_requests = cpu_1_data_master_requests_in_1_s1;

  //in_1_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign in_1_s1_any_bursting_master_saved_grant = 0;

  //in_1_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign in_1_s1_arb_share_counter_next_value = in_1_s1_firsttransfer ? (in_1_s1_arb_share_set_values - 1) : |in_1_s1_arb_share_counter ? (in_1_s1_arb_share_counter - 1) : 0;

  //in_1_s1_allgrants all slave grants, which is an e_mux
  assign in_1_s1_allgrants = |in_1_s1_grant_vector;

  //in_1_s1_end_xfer assignment, which is an e_assign
  assign in_1_s1_end_xfer = ~(in_1_s1_waits_for_read | in_1_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_in_1_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_in_1_s1 = in_1_s1_end_xfer & (~in_1_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //in_1_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign in_1_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_in_1_s1 & in_1_s1_allgrants) | (end_xfer_arb_share_counter_term_in_1_s1 & ~in_1_s1_non_bursting_master_requests);

  //in_1_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_1_s1_arb_share_counter <= 0;
      else if (in_1_s1_arb_counter_enable)
          in_1_s1_arb_share_counter <= in_1_s1_arb_share_counter_next_value;
    end


  //in_1_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_1_s1_slavearbiterlockenable <= 0;
      else if ((|in_1_s1_master_qreq_vector & end_xfer_arb_share_counter_term_in_1_s1) | (end_xfer_arb_share_counter_term_in_1_s1 & ~in_1_s1_non_bursting_master_requests))
          in_1_s1_slavearbiterlockenable <= |in_1_s1_arb_share_counter_next_value;
    end


  //cpu_1/data_master in_1/s1 arbiterlock, which is an e_assign
  assign cpu_1_data_master_arbiterlock = in_1_s1_slavearbiterlockenable & cpu_1_data_master_continuerequest;

  //in_1_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign in_1_s1_slavearbiterlockenable2 = |in_1_s1_arb_share_counter_next_value;

  //cpu_1/data_master in_1/s1 arbiterlock2, which is an e_assign
  assign cpu_1_data_master_arbiterlock2 = in_1_s1_slavearbiterlockenable2 & cpu_1_data_master_continuerequest;

  //in_1_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign in_1_s1_any_continuerequest = 1;

  //cpu_1_data_master_continuerequest continued request, which is an e_assign
  assign cpu_1_data_master_continuerequest = 1;

  assign cpu_1_data_master_qualified_request_in_1_s1 = cpu_1_data_master_requests_in_1_s1;
  //master is always granted when requested
  assign cpu_1_data_master_granted_in_1_s1 = cpu_1_data_master_qualified_request_in_1_s1;

  //cpu_1/data_master saved-grant in_1/s1, which is an e_assign
  assign cpu_1_data_master_saved_grant_in_1_s1 = cpu_1_data_master_requests_in_1_s1;

  //allow new arb cycle for in_1/s1, which is an e_assign
  assign in_1_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign in_1_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign in_1_s1_master_qreq_vector = 1;

  //in_1_s1_reset_n assignment, which is an e_assign
  assign in_1_s1_reset_n = reset_n;

  //in_1_s1_firsttransfer first transaction, which is an e_assign
  assign in_1_s1_firsttransfer = in_1_s1_begins_xfer ? in_1_s1_unreg_firsttransfer : in_1_s1_reg_firsttransfer;

  //in_1_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign in_1_s1_unreg_firsttransfer = ~(in_1_s1_slavearbiterlockenable & in_1_s1_any_continuerequest);

  //in_1_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_1_s1_reg_firsttransfer <= 1'b1;
      else if (in_1_s1_begins_xfer)
          in_1_s1_reg_firsttransfer <= in_1_s1_unreg_firsttransfer;
    end


  //in_1_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign in_1_s1_beginbursttransfer_internal = in_1_s1_begins_xfer;

  assign shifted_address_to_in_1_s1_from_cpu_1_data_master = cpu_1_data_master_address_to_slave;
  //in_1_s1_address mux, which is an e_mux
  assign in_1_s1_address = shifted_address_to_in_1_s1_from_cpu_1_data_master >> 2;

  //d1_in_1_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_1_s1_end_xfer <= 1;
      else 
        d1_in_1_s1_end_xfer <= in_1_s1_end_xfer;
    end


  //in_1_s1_waits_for_read in a cycle, which is an e_mux
  assign in_1_s1_waits_for_read = in_1_s1_in_a_read_cycle & in_1_s1_begins_xfer;

  //in_1_s1_in_a_read_cycle assignment, which is an e_assign
  assign in_1_s1_in_a_read_cycle = cpu_1_data_master_granted_in_1_s1 & cpu_1_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = in_1_s1_in_a_read_cycle;

  //in_1_s1_waits_for_write in a cycle, which is an e_mux
  assign in_1_s1_waits_for_write = in_1_s1_in_a_write_cycle & 0;

  //in_1_s1_in_a_write_cycle assignment, which is an e_assign
  assign in_1_s1_in_a_write_cycle = cpu_1_data_master_granted_in_1_s1 & cpu_1_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = in_1_s1_in_a_write_cycle;

  assign wait_for_in_1_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //in_1/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module mutex_0_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_read,
                                cpu_0_data_master_waitrequest,
                                cpu_0_data_master_write,
                                cpu_0_data_master_writedata,
                                cpu_1_data_master_address_to_slave,
                                cpu_1_data_master_read,
                                cpu_1_data_master_waitrequest,
                                cpu_1_data_master_write,
                                cpu_1_data_master_writedata,
                                mutex_0_s1_readdata,
                                reset_n,

                               // outputs:
                                cpu_0_data_master_granted_mutex_0_s1,
                                cpu_0_data_master_qualified_request_mutex_0_s1,
                                cpu_0_data_master_read_data_valid_mutex_0_s1,
                                cpu_0_data_master_requests_mutex_0_s1,
                                cpu_1_data_master_granted_mutex_0_s1,
                                cpu_1_data_master_qualified_request_mutex_0_s1,
                                cpu_1_data_master_read_data_valid_mutex_0_s1,
                                cpu_1_data_master_requests_mutex_0_s1,
                                d1_mutex_0_s1_end_xfer,
                                mutex_0_s1_address,
                                mutex_0_s1_chipselect,
                                mutex_0_s1_read,
                                mutex_0_s1_readdata_from_sa,
                                mutex_0_s1_reset_n,
                                mutex_0_s1_write,
                                mutex_0_s1_writedata
                             )
;

  output           cpu_0_data_master_granted_mutex_0_s1;
  output           cpu_0_data_master_qualified_request_mutex_0_s1;
  output           cpu_0_data_master_read_data_valid_mutex_0_s1;
  output           cpu_0_data_master_requests_mutex_0_s1;
  output           cpu_1_data_master_granted_mutex_0_s1;
  output           cpu_1_data_master_qualified_request_mutex_0_s1;
  output           cpu_1_data_master_read_data_valid_mutex_0_s1;
  output           cpu_1_data_master_requests_mutex_0_s1;
  output           d1_mutex_0_s1_end_xfer;
  output           mutex_0_s1_address;
  output           mutex_0_s1_chipselect;
  output           mutex_0_s1_read;
  output  [ 31: 0] mutex_0_s1_readdata_from_sa;
  output           mutex_0_s1_reset_n;
  output           mutex_0_s1_write;
  output  [ 31: 0] mutex_0_s1_writedata;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 17: 0] cpu_1_data_master_address_to_slave;
  input            cpu_1_data_master_read;
  input            cpu_1_data_master_waitrequest;
  input            cpu_1_data_master_write;
  input   [ 31: 0] cpu_1_data_master_writedata;
  input   [ 31: 0] mutex_0_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_mutex_0_s1;
  wire             cpu_0_data_master_qualified_request_mutex_0_s1;
  wire             cpu_0_data_master_read_data_valid_mutex_0_s1;
  wire             cpu_0_data_master_requests_mutex_0_s1;
  wire             cpu_0_data_master_saved_grant_mutex_0_s1;
  wire             cpu_1_data_master_arbiterlock;
  wire             cpu_1_data_master_arbiterlock2;
  wire             cpu_1_data_master_continuerequest;
  wire             cpu_1_data_master_granted_mutex_0_s1;
  wire             cpu_1_data_master_qualified_request_mutex_0_s1;
  wire             cpu_1_data_master_read_data_valid_mutex_0_s1;
  wire             cpu_1_data_master_requests_mutex_0_s1;
  wire             cpu_1_data_master_saved_grant_mutex_0_s1;
  reg              d1_mutex_0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_mutex_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_mutex_0_s1;
  reg              last_cycle_cpu_1_data_master_granted_slave_mutex_0_s1;
  wire             mutex_0_s1_address;
  wire             mutex_0_s1_allgrants;
  wire             mutex_0_s1_allow_new_arb_cycle;
  wire             mutex_0_s1_any_bursting_master_saved_grant;
  wire             mutex_0_s1_any_continuerequest;
  reg     [  1: 0] mutex_0_s1_arb_addend;
  wire             mutex_0_s1_arb_counter_enable;
  reg              mutex_0_s1_arb_share_counter;
  wire             mutex_0_s1_arb_share_counter_next_value;
  wire             mutex_0_s1_arb_share_set_values;
  wire    [  1: 0] mutex_0_s1_arb_winner;
  wire             mutex_0_s1_arbitration_holdoff_internal;
  wire             mutex_0_s1_beginbursttransfer_internal;
  wire             mutex_0_s1_begins_xfer;
  wire             mutex_0_s1_chipselect;
  wire    [  3: 0] mutex_0_s1_chosen_master_double_vector;
  wire    [  1: 0] mutex_0_s1_chosen_master_rot_left;
  wire             mutex_0_s1_end_xfer;
  wire             mutex_0_s1_firsttransfer;
  wire    [  1: 0] mutex_0_s1_grant_vector;
  wire             mutex_0_s1_in_a_read_cycle;
  wire             mutex_0_s1_in_a_write_cycle;
  wire    [  1: 0] mutex_0_s1_master_qreq_vector;
  wire             mutex_0_s1_non_bursting_master_requests;
  wire             mutex_0_s1_read;
  wire    [ 31: 0] mutex_0_s1_readdata_from_sa;
  reg              mutex_0_s1_reg_firsttransfer;
  wire             mutex_0_s1_reset_n;
  reg     [  1: 0] mutex_0_s1_saved_chosen_master_vector;
  reg              mutex_0_s1_slavearbiterlockenable;
  wire             mutex_0_s1_slavearbiterlockenable2;
  wire             mutex_0_s1_unreg_firsttransfer;
  wire             mutex_0_s1_waits_for_read;
  wire             mutex_0_s1_waits_for_write;
  wire             mutex_0_s1_write;
  wire    [ 31: 0] mutex_0_s1_writedata;
  wire    [ 16: 0] shifted_address_to_mutex_0_s1_from_cpu_0_data_master;
  wire    [ 17: 0] shifted_address_to_mutex_0_s1_from_cpu_1_data_master;
  wire             wait_for_mutex_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~mutex_0_s1_end_xfer;
    end


  assign mutex_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_mutex_0_s1 | cpu_1_data_master_qualified_request_mutex_0_s1));
  //assign mutex_0_s1_readdata_from_sa = mutex_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign mutex_0_s1_readdata_from_sa = mutex_0_s1_readdata;

  assign cpu_0_data_master_requests_mutex_0_s1 = ({cpu_0_data_master_address_to_slave[16 : 3] , 3'b0} == 17'h880) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //mutex_0_s1_arb_share_counter set values, which is an e_mux
  assign mutex_0_s1_arb_share_set_values = 1;

  //mutex_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign mutex_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_mutex_0_s1 |
    cpu_1_data_master_requests_mutex_0_s1 |
    cpu_0_data_master_requests_mutex_0_s1 |
    cpu_1_data_master_requests_mutex_0_s1;

  //mutex_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign mutex_0_s1_any_bursting_master_saved_grant = 0;

  //mutex_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign mutex_0_s1_arb_share_counter_next_value = mutex_0_s1_firsttransfer ? (mutex_0_s1_arb_share_set_values - 1) : |mutex_0_s1_arb_share_counter ? (mutex_0_s1_arb_share_counter - 1) : 0;

  //mutex_0_s1_allgrants all slave grants, which is an e_mux
  assign mutex_0_s1_allgrants = (|mutex_0_s1_grant_vector) |
    (|mutex_0_s1_grant_vector) |
    (|mutex_0_s1_grant_vector) |
    (|mutex_0_s1_grant_vector);

  //mutex_0_s1_end_xfer assignment, which is an e_assign
  assign mutex_0_s1_end_xfer = ~(mutex_0_s1_waits_for_read | mutex_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_mutex_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_mutex_0_s1 = mutex_0_s1_end_xfer & (~mutex_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //mutex_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign mutex_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_mutex_0_s1 & mutex_0_s1_allgrants) | (end_xfer_arb_share_counter_term_mutex_0_s1 & ~mutex_0_s1_non_bursting_master_requests);

  //mutex_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mutex_0_s1_arb_share_counter <= 0;
      else if (mutex_0_s1_arb_counter_enable)
          mutex_0_s1_arb_share_counter <= mutex_0_s1_arb_share_counter_next_value;
    end


  //mutex_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mutex_0_s1_slavearbiterlockenable <= 0;
      else if ((|mutex_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_mutex_0_s1) | (end_xfer_arb_share_counter_term_mutex_0_s1 & ~mutex_0_s1_non_bursting_master_requests))
          mutex_0_s1_slavearbiterlockenable <= |mutex_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master mutex_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = mutex_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //mutex_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign mutex_0_s1_slavearbiterlockenable2 = |mutex_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master mutex_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = mutex_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_1/data_master mutex_0/s1 arbiterlock, which is an e_assign
  assign cpu_1_data_master_arbiterlock = mutex_0_s1_slavearbiterlockenable & cpu_1_data_master_continuerequest;

  //cpu_1/data_master mutex_0/s1 arbiterlock2, which is an e_assign
  assign cpu_1_data_master_arbiterlock2 = mutex_0_s1_slavearbiterlockenable2 & cpu_1_data_master_continuerequest;

  //cpu_1/data_master granted mutex_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_1_data_master_granted_slave_mutex_0_s1 <= 0;
      else 
        last_cycle_cpu_1_data_master_granted_slave_mutex_0_s1 <= cpu_1_data_master_saved_grant_mutex_0_s1 ? 1 : (mutex_0_s1_arbitration_holdoff_internal | ~cpu_1_data_master_requests_mutex_0_s1) ? 0 : last_cycle_cpu_1_data_master_granted_slave_mutex_0_s1;
    end


  //cpu_1_data_master_continuerequest continued request, which is an e_mux
  assign cpu_1_data_master_continuerequest = last_cycle_cpu_1_data_master_granted_slave_mutex_0_s1 & cpu_1_data_master_requests_mutex_0_s1;

  //mutex_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign mutex_0_s1_any_continuerequest = cpu_1_data_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_mutex_0_s1 = cpu_0_data_master_requests_mutex_0_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_1_data_master_arbiterlock);
  //mutex_0_s1_writedata mux, which is an e_mux
  assign mutex_0_s1_writedata = (cpu_0_data_master_granted_mutex_0_s1)? cpu_0_data_master_writedata :
    cpu_1_data_master_writedata;

  assign cpu_1_data_master_requests_mutex_0_s1 = ({cpu_1_data_master_address_to_slave[17 : 3] , 3'b0} == 18'h880) & (cpu_1_data_master_read | cpu_1_data_master_write);
  //cpu_0/data_master granted mutex_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_mutex_0_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_mutex_0_s1 <= cpu_0_data_master_saved_grant_mutex_0_s1 ? 1 : (mutex_0_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_mutex_0_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_mutex_0_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_mutex_0_s1 & cpu_0_data_master_requests_mutex_0_s1;

  assign cpu_1_data_master_qualified_request_mutex_0_s1 = cpu_1_data_master_requests_mutex_0_s1 & ~(((~cpu_1_data_master_waitrequest) & cpu_1_data_master_write) | cpu_0_data_master_arbiterlock);
  //allow new arb cycle for mutex_0/s1, which is an e_assign
  assign mutex_0_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_1_data_master_arbiterlock;

  //cpu_1/data_master assignment into master qualified-requests vector for mutex_0/s1, which is an e_assign
  assign mutex_0_s1_master_qreq_vector[0] = cpu_1_data_master_qualified_request_mutex_0_s1;

  //cpu_1/data_master grant mutex_0/s1, which is an e_assign
  assign cpu_1_data_master_granted_mutex_0_s1 = mutex_0_s1_grant_vector[0];

  //cpu_1/data_master saved-grant mutex_0/s1, which is an e_assign
  assign cpu_1_data_master_saved_grant_mutex_0_s1 = mutex_0_s1_arb_winner[0] && cpu_1_data_master_requests_mutex_0_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for mutex_0/s1, which is an e_assign
  assign mutex_0_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_mutex_0_s1;

  //cpu_0/data_master grant mutex_0/s1, which is an e_assign
  assign cpu_0_data_master_granted_mutex_0_s1 = mutex_0_s1_grant_vector[1];

  //cpu_0/data_master saved-grant mutex_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_mutex_0_s1 = mutex_0_s1_arb_winner[1] && cpu_0_data_master_requests_mutex_0_s1;

  //mutex_0/s1 chosen-master double-vector, which is an e_assign
  assign mutex_0_s1_chosen_master_double_vector = {mutex_0_s1_master_qreq_vector, mutex_0_s1_master_qreq_vector} & ({~mutex_0_s1_master_qreq_vector, ~mutex_0_s1_master_qreq_vector} + mutex_0_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign mutex_0_s1_arb_winner = (mutex_0_s1_allow_new_arb_cycle & | mutex_0_s1_grant_vector) ? mutex_0_s1_grant_vector : mutex_0_s1_saved_chosen_master_vector;

  //saved mutex_0_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mutex_0_s1_saved_chosen_master_vector <= 0;
      else if (mutex_0_s1_allow_new_arb_cycle)
          mutex_0_s1_saved_chosen_master_vector <= |mutex_0_s1_grant_vector ? mutex_0_s1_grant_vector : mutex_0_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign mutex_0_s1_grant_vector = {(mutex_0_s1_chosen_master_double_vector[1] | mutex_0_s1_chosen_master_double_vector[3]),
    (mutex_0_s1_chosen_master_double_vector[0] | mutex_0_s1_chosen_master_double_vector[2])};

  //mutex_0/s1 chosen master rotated left, which is an e_assign
  assign mutex_0_s1_chosen_master_rot_left = (mutex_0_s1_arb_winner << 1) ? (mutex_0_s1_arb_winner << 1) : 1;

  //mutex_0/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mutex_0_s1_arb_addend <= 1;
      else if (|mutex_0_s1_grant_vector)
          mutex_0_s1_arb_addend <= mutex_0_s1_end_xfer? mutex_0_s1_chosen_master_rot_left : mutex_0_s1_grant_vector;
    end


  //mutex_0_s1_reset_n assignment, which is an e_assign
  assign mutex_0_s1_reset_n = reset_n;

  assign mutex_0_s1_chipselect = cpu_0_data_master_granted_mutex_0_s1 | cpu_1_data_master_granted_mutex_0_s1;
  //mutex_0_s1_firsttransfer first transaction, which is an e_assign
  assign mutex_0_s1_firsttransfer = mutex_0_s1_begins_xfer ? mutex_0_s1_unreg_firsttransfer : mutex_0_s1_reg_firsttransfer;

  //mutex_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign mutex_0_s1_unreg_firsttransfer = ~(mutex_0_s1_slavearbiterlockenable & mutex_0_s1_any_continuerequest);

  //mutex_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mutex_0_s1_reg_firsttransfer <= 1'b1;
      else if (mutex_0_s1_begins_xfer)
          mutex_0_s1_reg_firsttransfer <= mutex_0_s1_unreg_firsttransfer;
    end


  //mutex_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign mutex_0_s1_beginbursttransfer_internal = mutex_0_s1_begins_xfer;

  //mutex_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign mutex_0_s1_arbitration_holdoff_internal = mutex_0_s1_begins_xfer & mutex_0_s1_firsttransfer;

  //mutex_0_s1_read assignment, which is an e_mux
  assign mutex_0_s1_read = (cpu_0_data_master_granted_mutex_0_s1 & cpu_0_data_master_read) | (cpu_1_data_master_granted_mutex_0_s1 & cpu_1_data_master_read);

  //mutex_0_s1_write assignment, which is an e_mux
  assign mutex_0_s1_write = (cpu_0_data_master_granted_mutex_0_s1 & cpu_0_data_master_write) | (cpu_1_data_master_granted_mutex_0_s1 & cpu_1_data_master_write);

  assign shifted_address_to_mutex_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //mutex_0_s1_address mux, which is an e_mux
  assign mutex_0_s1_address = (cpu_0_data_master_granted_mutex_0_s1)? (shifted_address_to_mutex_0_s1_from_cpu_0_data_master >> 2) :
    (shifted_address_to_mutex_0_s1_from_cpu_1_data_master >> 2);

  assign shifted_address_to_mutex_0_s1_from_cpu_1_data_master = cpu_1_data_master_address_to_slave;
  //d1_mutex_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_mutex_0_s1_end_xfer <= 1;
      else 
        d1_mutex_0_s1_end_xfer <= mutex_0_s1_end_xfer;
    end


  //mutex_0_s1_waits_for_read in a cycle, which is an e_mux
  assign mutex_0_s1_waits_for_read = mutex_0_s1_in_a_read_cycle & mutex_0_s1_begins_xfer;

  //mutex_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign mutex_0_s1_in_a_read_cycle = (cpu_0_data_master_granted_mutex_0_s1 & cpu_0_data_master_read) | (cpu_1_data_master_granted_mutex_0_s1 & cpu_1_data_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = mutex_0_s1_in_a_read_cycle;

  //mutex_0_s1_waits_for_write in a cycle, which is an e_mux
  assign mutex_0_s1_waits_for_write = mutex_0_s1_in_a_write_cycle & 0;

  //mutex_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign mutex_0_s1_in_a_write_cycle = (cpu_0_data_master_granted_mutex_0_s1 & cpu_0_data_master_write) | (cpu_1_data_master_granted_mutex_0_s1 & cpu_1_data_master_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = mutex_0_s1_in_a_write_cycle;

  assign wait_for_mutex_0_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //mutex_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_mutex_0_s1 + cpu_1_data_master_granted_mutex_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_mutex_0_s1 + cpu_1_data_master_saved_grant_mutex_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_memory_0_s1_arbitrator (
                                       // inputs:
                                        clk,
                                        cpu_0_data_master_address_to_slave,
                                        cpu_0_data_master_byteenable,
                                        cpu_0_data_master_read,
                                        cpu_0_data_master_waitrequest,
                                        cpu_0_data_master_write,
                                        cpu_0_data_master_writedata,
                                        cpu_0_instruction_master_address_to_slave,
                                        cpu_0_instruction_master_latency_counter,
                                        cpu_0_instruction_master_read,
                                        onchip_memory_0_s1_readdata,
                                        reset_n,

                                       // outputs:
                                        cpu_0_data_master_granted_onchip_memory_0_s1,
                                        cpu_0_data_master_qualified_request_onchip_memory_0_s1,
                                        cpu_0_data_master_read_data_valid_onchip_memory_0_s1,
                                        cpu_0_data_master_requests_onchip_memory_0_s1,
                                        cpu_0_instruction_master_granted_onchip_memory_0_s1,
                                        cpu_0_instruction_master_qualified_request_onchip_memory_0_s1,
                                        cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1,
                                        cpu_0_instruction_master_requests_onchip_memory_0_s1,
                                        d1_onchip_memory_0_s1_end_xfer,
                                        onchip_memory_0_s1_address,
                                        onchip_memory_0_s1_byteenable,
                                        onchip_memory_0_s1_chipselect,
                                        onchip_memory_0_s1_clken,
                                        onchip_memory_0_s1_readdata_from_sa,
                                        onchip_memory_0_s1_reset,
                                        onchip_memory_0_s1_write,
                                        onchip_memory_0_s1_writedata,
                                        registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1
                                     )
;

  output           cpu_0_data_master_granted_onchip_memory_0_s1;
  output           cpu_0_data_master_qualified_request_onchip_memory_0_s1;
  output           cpu_0_data_master_read_data_valid_onchip_memory_0_s1;
  output           cpu_0_data_master_requests_onchip_memory_0_s1;
  output           cpu_0_instruction_master_granted_onchip_memory_0_s1;
  output           cpu_0_instruction_master_qualified_request_onchip_memory_0_s1;
  output           cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1;
  output           cpu_0_instruction_master_requests_onchip_memory_0_s1;
  output           d1_onchip_memory_0_s1_end_xfer;
  output  [ 11: 0] onchip_memory_0_s1_address;
  output  [  3: 0] onchip_memory_0_s1_byteenable;
  output           onchip_memory_0_s1_chipselect;
  output           onchip_memory_0_s1_clken;
  output  [ 31: 0] onchip_memory_0_s1_readdata_from_sa;
  output           onchip_memory_0_s1_reset;
  output           onchip_memory_0_s1_write;
  output  [ 31: 0] onchip_memory_0_s1_writedata;
  output           registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 16: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input   [ 31: 0] onchip_memory_0_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_onchip_memory_0_s1;
  wire             cpu_0_data_master_qualified_request_onchip_memory_0_s1;
  wire             cpu_0_data_master_read_data_valid_onchip_memory_0_s1;
  reg              cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register_in;
  wire             cpu_0_data_master_requests_onchip_memory_0_s1;
  wire             cpu_0_data_master_saved_grant_onchip_memory_0_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_onchip_memory_0_s1;
  wire             cpu_0_instruction_master_qualified_request_onchip_memory_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1;
  reg              cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_onchip_memory_0_s1;
  wire             cpu_0_instruction_master_saved_grant_onchip_memory_0_s1;
  reg              d1_onchip_memory_0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_memory_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_onchip_memory_0_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory_0_s1;
  wire    [ 11: 0] onchip_memory_0_s1_address;
  wire             onchip_memory_0_s1_allgrants;
  wire             onchip_memory_0_s1_allow_new_arb_cycle;
  wire             onchip_memory_0_s1_any_bursting_master_saved_grant;
  wire             onchip_memory_0_s1_any_continuerequest;
  reg     [  1: 0] onchip_memory_0_s1_arb_addend;
  wire             onchip_memory_0_s1_arb_counter_enable;
  reg              onchip_memory_0_s1_arb_share_counter;
  wire             onchip_memory_0_s1_arb_share_counter_next_value;
  wire             onchip_memory_0_s1_arb_share_set_values;
  wire    [  1: 0] onchip_memory_0_s1_arb_winner;
  wire             onchip_memory_0_s1_arbitration_holdoff_internal;
  wire             onchip_memory_0_s1_beginbursttransfer_internal;
  wire             onchip_memory_0_s1_begins_xfer;
  wire    [  3: 0] onchip_memory_0_s1_byteenable;
  wire             onchip_memory_0_s1_chipselect;
  wire    [  3: 0] onchip_memory_0_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_memory_0_s1_chosen_master_rot_left;
  wire             onchip_memory_0_s1_clken;
  wire             onchip_memory_0_s1_end_xfer;
  wire             onchip_memory_0_s1_firsttransfer;
  wire    [  1: 0] onchip_memory_0_s1_grant_vector;
  wire             onchip_memory_0_s1_in_a_read_cycle;
  wire             onchip_memory_0_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_memory_0_s1_master_qreq_vector;
  wire             onchip_memory_0_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_memory_0_s1_readdata_from_sa;
  reg              onchip_memory_0_s1_reg_firsttransfer;
  wire             onchip_memory_0_s1_reset;
  reg     [  1: 0] onchip_memory_0_s1_saved_chosen_master_vector;
  reg              onchip_memory_0_s1_slavearbiterlockenable;
  wire             onchip_memory_0_s1_slavearbiterlockenable2;
  wire             onchip_memory_0_s1_unreg_firsttransfer;
  wire             onchip_memory_0_s1_waits_for_read;
  wire             onchip_memory_0_s1_waits_for_write;
  wire             onchip_memory_0_s1_write;
  wire    [ 31: 0] onchip_memory_0_s1_writedata;
  wire             p1_cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register;
  wire             registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1;
  wire    [ 16: 0] shifted_address_to_onchip_memory_0_s1_from_cpu_0_data_master;
  wire    [ 16: 0] shifted_address_to_onchip_memory_0_s1_from_cpu_0_instruction_master;
  wire             wait_for_onchip_memory_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_memory_0_s1_end_xfer;
    end


  assign onchip_memory_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_onchip_memory_0_s1 | cpu_0_instruction_master_qualified_request_onchip_memory_0_s1));
  //assign onchip_memory_0_s1_readdata_from_sa = onchip_memory_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_memory_0_s1_readdata_from_sa = onchip_memory_0_s1_readdata;

  assign cpu_0_data_master_requests_onchip_memory_0_s1 = ({cpu_0_data_master_address_to_slave[16 : 14] , 14'b0} == 17'h10000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1 assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1 = cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register_in;

  //onchip_memory_0_s1_arb_share_counter set values, which is an e_mux
  assign onchip_memory_0_s1_arb_share_set_values = 1;

  //onchip_memory_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_memory_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_onchip_memory_0_s1 |
    cpu_0_instruction_master_requests_onchip_memory_0_s1 |
    cpu_0_data_master_requests_onchip_memory_0_s1 |
    cpu_0_instruction_master_requests_onchip_memory_0_s1;

  //onchip_memory_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_memory_0_s1_any_bursting_master_saved_grant = 0;

  //onchip_memory_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_memory_0_s1_arb_share_counter_next_value = onchip_memory_0_s1_firsttransfer ? (onchip_memory_0_s1_arb_share_set_values - 1) : |onchip_memory_0_s1_arb_share_counter ? (onchip_memory_0_s1_arb_share_counter - 1) : 0;

  //onchip_memory_0_s1_allgrants all slave grants, which is an e_mux
  assign onchip_memory_0_s1_allgrants = (|onchip_memory_0_s1_grant_vector) |
    (|onchip_memory_0_s1_grant_vector) |
    (|onchip_memory_0_s1_grant_vector) |
    (|onchip_memory_0_s1_grant_vector);

  //onchip_memory_0_s1_end_xfer assignment, which is an e_assign
  assign onchip_memory_0_s1_end_xfer = ~(onchip_memory_0_s1_waits_for_read | onchip_memory_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_memory_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_memory_0_s1 = onchip_memory_0_s1_end_xfer & (~onchip_memory_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_memory_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_memory_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_memory_0_s1 & onchip_memory_0_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_memory_0_s1 & ~onchip_memory_0_s1_non_bursting_master_requests);

  //onchip_memory_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_0_s1_arb_share_counter <= 0;
      else if (onchip_memory_0_s1_arb_counter_enable)
          onchip_memory_0_s1_arb_share_counter <= onchip_memory_0_s1_arb_share_counter_next_value;
    end


  //onchip_memory_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_0_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_memory_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_memory_0_s1) | (end_xfer_arb_share_counter_term_onchip_memory_0_s1 & ~onchip_memory_0_s1_non_bursting_master_requests))
          onchip_memory_0_s1_slavearbiterlockenable <= |onchip_memory_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master onchip_memory_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = onchip_memory_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //onchip_memory_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_memory_0_s1_slavearbiterlockenable2 = |onchip_memory_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master onchip_memory_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = onchip_memory_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master onchip_memory_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = onchip_memory_0_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master onchip_memory_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = onchip_memory_0_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted onchip_memory_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory_0_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory_0_s1 <= cpu_0_instruction_master_saved_grant_onchip_memory_0_s1 ? 1 : (onchip_memory_0_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_onchip_memory_0_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory_0_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory_0_s1 & cpu_0_instruction_master_requests_onchip_memory_0_s1;

  //onchip_memory_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_memory_0_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_onchip_memory_0_s1 = cpu_0_data_master_requests_onchip_memory_0_s1 & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register))) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register_in = cpu_0_data_master_granted_onchip_memory_0_s1 & cpu_0_data_master_read & ~onchip_memory_0_s1_waits_for_read & ~(|cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register = {cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register, cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_onchip_memory_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_onchip_memory_0_s1 = cpu_0_data_master_read_data_valid_onchip_memory_0_s1_shift_register;

  //onchip_memory_0_s1_writedata mux, which is an e_mux
  assign onchip_memory_0_s1_writedata = cpu_0_data_master_writedata;

  //mux onchip_memory_0_s1_clken, which is an e_mux
  assign onchip_memory_0_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_onchip_memory_0_s1 = (({cpu_0_instruction_master_address_to_slave[16 : 14] , 14'b0} == 17'h10000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted onchip_memory_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_onchip_memory_0_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_onchip_memory_0_s1 <= cpu_0_data_master_saved_grant_onchip_memory_0_s1 ? 1 : (onchip_memory_0_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_onchip_memory_0_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_onchip_memory_0_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_onchip_memory_0_s1 & cpu_0_data_master_requests_onchip_memory_0_s1;

  assign cpu_0_instruction_master_qualified_request_onchip_memory_0_s1 = cpu_0_instruction_master_requests_onchip_memory_0_s1 & ~((cpu_0_instruction_master_read & ((1 < cpu_0_instruction_master_latency_counter))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register_in = cpu_0_instruction_master_granted_onchip_memory_0_s1 & cpu_0_instruction_master_read & ~onchip_memory_0_s1_waits_for_read;

  //shift register p1 cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register = {cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register, cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register <= 0;
      else 
        cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1 = cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1_shift_register;

  //allow new arb cycle for onchip_memory_0/s1, which is an e_assign
  assign onchip_memory_0_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for onchip_memory_0/s1, which is an e_assign
  assign onchip_memory_0_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_onchip_memory_0_s1;

  //cpu_0/instruction_master grant onchip_memory_0/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_onchip_memory_0_s1 = onchip_memory_0_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant onchip_memory_0/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_onchip_memory_0_s1 = onchip_memory_0_s1_arb_winner[0] && cpu_0_instruction_master_requests_onchip_memory_0_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for onchip_memory_0/s1, which is an e_assign
  assign onchip_memory_0_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_onchip_memory_0_s1;

  //cpu_0/data_master grant onchip_memory_0/s1, which is an e_assign
  assign cpu_0_data_master_granted_onchip_memory_0_s1 = onchip_memory_0_s1_grant_vector[1];

  //cpu_0/data_master saved-grant onchip_memory_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_onchip_memory_0_s1 = onchip_memory_0_s1_arb_winner[1] && cpu_0_data_master_requests_onchip_memory_0_s1;

  //onchip_memory_0/s1 chosen-master double-vector, which is an e_assign
  assign onchip_memory_0_s1_chosen_master_double_vector = {onchip_memory_0_s1_master_qreq_vector, onchip_memory_0_s1_master_qreq_vector} & ({~onchip_memory_0_s1_master_qreq_vector, ~onchip_memory_0_s1_master_qreq_vector} + onchip_memory_0_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_memory_0_s1_arb_winner = (onchip_memory_0_s1_allow_new_arb_cycle & | onchip_memory_0_s1_grant_vector) ? onchip_memory_0_s1_grant_vector : onchip_memory_0_s1_saved_chosen_master_vector;

  //saved onchip_memory_0_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_0_s1_saved_chosen_master_vector <= 0;
      else if (onchip_memory_0_s1_allow_new_arb_cycle)
          onchip_memory_0_s1_saved_chosen_master_vector <= |onchip_memory_0_s1_grant_vector ? onchip_memory_0_s1_grant_vector : onchip_memory_0_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_memory_0_s1_grant_vector = {(onchip_memory_0_s1_chosen_master_double_vector[1] | onchip_memory_0_s1_chosen_master_double_vector[3]),
    (onchip_memory_0_s1_chosen_master_double_vector[0] | onchip_memory_0_s1_chosen_master_double_vector[2])};

  //onchip_memory_0/s1 chosen master rotated left, which is an e_assign
  assign onchip_memory_0_s1_chosen_master_rot_left = (onchip_memory_0_s1_arb_winner << 1) ? (onchip_memory_0_s1_arb_winner << 1) : 1;

  //onchip_memory_0/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_0_s1_arb_addend <= 1;
      else if (|onchip_memory_0_s1_grant_vector)
          onchip_memory_0_s1_arb_addend <= onchip_memory_0_s1_end_xfer? onchip_memory_0_s1_chosen_master_rot_left : onchip_memory_0_s1_grant_vector;
    end


  //~onchip_memory_0_s1_reset assignment, which is an e_assign
  assign onchip_memory_0_s1_reset = ~reset_n;

  assign onchip_memory_0_s1_chipselect = cpu_0_data_master_granted_onchip_memory_0_s1 | cpu_0_instruction_master_granted_onchip_memory_0_s1;
  //onchip_memory_0_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_memory_0_s1_firsttransfer = onchip_memory_0_s1_begins_xfer ? onchip_memory_0_s1_unreg_firsttransfer : onchip_memory_0_s1_reg_firsttransfer;

  //onchip_memory_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_memory_0_s1_unreg_firsttransfer = ~(onchip_memory_0_s1_slavearbiterlockenable & onchip_memory_0_s1_any_continuerequest);

  //onchip_memory_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_0_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_memory_0_s1_begins_xfer)
          onchip_memory_0_s1_reg_firsttransfer <= onchip_memory_0_s1_unreg_firsttransfer;
    end


  //onchip_memory_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_memory_0_s1_beginbursttransfer_internal = onchip_memory_0_s1_begins_xfer;

  //onchip_memory_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_memory_0_s1_arbitration_holdoff_internal = onchip_memory_0_s1_begins_xfer & onchip_memory_0_s1_firsttransfer;

  //onchip_memory_0_s1_write assignment, which is an e_mux
  assign onchip_memory_0_s1_write = cpu_0_data_master_granted_onchip_memory_0_s1 & cpu_0_data_master_write;

  assign shifted_address_to_onchip_memory_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //onchip_memory_0_s1_address mux, which is an e_mux
  assign onchip_memory_0_s1_address = (cpu_0_data_master_granted_onchip_memory_0_s1)? (shifted_address_to_onchip_memory_0_s1_from_cpu_0_data_master >> 2) :
    (shifted_address_to_onchip_memory_0_s1_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_onchip_memory_0_s1_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_onchip_memory_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_memory_0_s1_end_xfer <= 1;
      else 
        d1_onchip_memory_0_s1_end_xfer <= onchip_memory_0_s1_end_xfer;
    end


  //onchip_memory_0_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_memory_0_s1_waits_for_read = onchip_memory_0_s1_in_a_read_cycle & 0;

  //onchip_memory_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_memory_0_s1_in_a_read_cycle = (cpu_0_data_master_granted_onchip_memory_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_onchip_memory_0_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_memory_0_s1_in_a_read_cycle;

  //onchip_memory_0_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_memory_0_s1_waits_for_write = onchip_memory_0_s1_in_a_write_cycle & 0;

  //onchip_memory_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_memory_0_s1_in_a_write_cycle = cpu_0_data_master_granted_onchip_memory_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_memory_0_s1_in_a_write_cycle;

  assign wait_for_onchip_memory_0_s1_counter = 0;
  //onchip_memory_0_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_memory_0_s1_byteenable = (cpu_0_data_master_granted_onchip_memory_0_s1)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_memory_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_onchip_memory_0_s1 + cpu_0_instruction_master_granted_onchip_memory_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_onchip_memory_0_s1 + cpu_0_instruction_master_saved_grant_onchip_memory_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_memory_1_s1_arbitrator (
                                       // inputs:
                                        clk,
                                        cpu_1_data_master_address_to_slave,
                                        cpu_1_data_master_byteenable,
                                        cpu_1_data_master_read,
                                        cpu_1_data_master_waitrequest,
                                        cpu_1_data_master_write,
                                        cpu_1_data_master_writedata,
                                        cpu_1_instruction_master_address_to_slave,
                                        cpu_1_instruction_master_latency_counter,
                                        cpu_1_instruction_master_read,
                                        onchip_memory_1_s1_readdata,
                                        reset_n,

                                       // outputs:
                                        cpu_1_data_master_granted_onchip_memory_1_s1,
                                        cpu_1_data_master_qualified_request_onchip_memory_1_s1,
                                        cpu_1_data_master_read_data_valid_onchip_memory_1_s1,
                                        cpu_1_data_master_requests_onchip_memory_1_s1,
                                        cpu_1_instruction_master_granted_onchip_memory_1_s1,
                                        cpu_1_instruction_master_qualified_request_onchip_memory_1_s1,
                                        cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1,
                                        cpu_1_instruction_master_requests_onchip_memory_1_s1,
                                        d1_onchip_memory_1_s1_end_xfer,
                                        onchip_memory_1_s1_address,
                                        onchip_memory_1_s1_byteenable,
                                        onchip_memory_1_s1_chipselect,
                                        onchip_memory_1_s1_clken,
                                        onchip_memory_1_s1_readdata_from_sa,
                                        onchip_memory_1_s1_reset,
                                        onchip_memory_1_s1_write,
                                        onchip_memory_1_s1_writedata,
                                        registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1
                                     )
;

  output           cpu_1_data_master_granted_onchip_memory_1_s1;
  output           cpu_1_data_master_qualified_request_onchip_memory_1_s1;
  output           cpu_1_data_master_read_data_valid_onchip_memory_1_s1;
  output           cpu_1_data_master_requests_onchip_memory_1_s1;
  output           cpu_1_instruction_master_granted_onchip_memory_1_s1;
  output           cpu_1_instruction_master_qualified_request_onchip_memory_1_s1;
  output           cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1;
  output           cpu_1_instruction_master_requests_onchip_memory_1_s1;
  output           d1_onchip_memory_1_s1_end_xfer;
  output  [ 11: 0] onchip_memory_1_s1_address;
  output  [  3: 0] onchip_memory_1_s1_byteenable;
  output           onchip_memory_1_s1_chipselect;
  output           onchip_memory_1_s1_clken;
  output  [ 31: 0] onchip_memory_1_s1_readdata_from_sa;
  output           onchip_memory_1_s1_reset;
  output           onchip_memory_1_s1_write;
  output  [ 31: 0] onchip_memory_1_s1_writedata;
  output           registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1;
  input            clk;
  input   [ 17: 0] cpu_1_data_master_address_to_slave;
  input   [  3: 0] cpu_1_data_master_byteenable;
  input            cpu_1_data_master_read;
  input            cpu_1_data_master_waitrequest;
  input            cpu_1_data_master_write;
  input   [ 31: 0] cpu_1_data_master_writedata;
  input   [ 17: 0] cpu_1_instruction_master_address_to_slave;
  input            cpu_1_instruction_master_latency_counter;
  input            cpu_1_instruction_master_read;
  input   [ 31: 0] onchip_memory_1_s1_readdata;
  input            reset_n;

  wire             cpu_1_data_master_arbiterlock;
  wire             cpu_1_data_master_arbiterlock2;
  wire             cpu_1_data_master_continuerequest;
  wire             cpu_1_data_master_granted_onchip_memory_1_s1;
  wire             cpu_1_data_master_qualified_request_onchip_memory_1_s1;
  wire             cpu_1_data_master_read_data_valid_onchip_memory_1_s1;
  reg              cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register;
  wire             cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register_in;
  wire             cpu_1_data_master_requests_onchip_memory_1_s1;
  wire             cpu_1_data_master_saved_grant_onchip_memory_1_s1;
  wire             cpu_1_instruction_master_arbiterlock;
  wire             cpu_1_instruction_master_arbiterlock2;
  wire             cpu_1_instruction_master_continuerequest;
  wire             cpu_1_instruction_master_granted_onchip_memory_1_s1;
  wire             cpu_1_instruction_master_qualified_request_onchip_memory_1_s1;
  wire             cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1;
  reg              cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register;
  wire             cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register_in;
  wire             cpu_1_instruction_master_requests_onchip_memory_1_s1;
  wire             cpu_1_instruction_master_saved_grant_onchip_memory_1_s1;
  reg              d1_onchip_memory_1_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_memory_1_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_1_data_master_granted_slave_onchip_memory_1_s1;
  reg              last_cycle_cpu_1_instruction_master_granted_slave_onchip_memory_1_s1;
  wire    [ 11: 0] onchip_memory_1_s1_address;
  wire             onchip_memory_1_s1_allgrants;
  wire             onchip_memory_1_s1_allow_new_arb_cycle;
  wire             onchip_memory_1_s1_any_bursting_master_saved_grant;
  wire             onchip_memory_1_s1_any_continuerequest;
  reg     [  1: 0] onchip_memory_1_s1_arb_addend;
  wire             onchip_memory_1_s1_arb_counter_enable;
  reg              onchip_memory_1_s1_arb_share_counter;
  wire             onchip_memory_1_s1_arb_share_counter_next_value;
  wire             onchip_memory_1_s1_arb_share_set_values;
  wire    [  1: 0] onchip_memory_1_s1_arb_winner;
  wire             onchip_memory_1_s1_arbitration_holdoff_internal;
  wire             onchip_memory_1_s1_beginbursttransfer_internal;
  wire             onchip_memory_1_s1_begins_xfer;
  wire    [  3: 0] onchip_memory_1_s1_byteenable;
  wire             onchip_memory_1_s1_chipselect;
  wire    [  3: 0] onchip_memory_1_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_memory_1_s1_chosen_master_rot_left;
  wire             onchip_memory_1_s1_clken;
  wire             onchip_memory_1_s1_end_xfer;
  wire             onchip_memory_1_s1_firsttransfer;
  wire    [  1: 0] onchip_memory_1_s1_grant_vector;
  wire             onchip_memory_1_s1_in_a_read_cycle;
  wire             onchip_memory_1_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_memory_1_s1_master_qreq_vector;
  wire             onchip_memory_1_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_memory_1_s1_readdata_from_sa;
  reg              onchip_memory_1_s1_reg_firsttransfer;
  wire             onchip_memory_1_s1_reset;
  reg     [  1: 0] onchip_memory_1_s1_saved_chosen_master_vector;
  reg              onchip_memory_1_s1_slavearbiterlockenable;
  wire             onchip_memory_1_s1_slavearbiterlockenable2;
  wire             onchip_memory_1_s1_unreg_firsttransfer;
  wire             onchip_memory_1_s1_waits_for_read;
  wire             onchip_memory_1_s1_waits_for_write;
  wire             onchip_memory_1_s1_write;
  wire    [ 31: 0] onchip_memory_1_s1_writedata;
  wire             p1_cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register;
  wire             p1_cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register;
  wire             registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1;
  wire    [ 17: 0] shifted_address_to_onchip_memory_1_s1_from_cpu_1_data_master;
  wire    [ 17: 0] shifted_address_to_onchip_memory_1_s1_from_cpu_1_instruction_master;
  wire             wait_for_onchip_memory_1_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_memory_1_s1_end_xfer;
    end


  assign onchip_memory_1_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_1_data_master_qualified_request_onchip_memory_1_s1 | cpu_1_instruction_master_qualified_request_onchip_memory_1_s1));
  //assign onchip_memory_1_s1_readdata_from_sa = onchip_memory_1_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_memory_1_s1_readdata_from_sa = onchip_memory_1_s1_readdata;

  assign cpu_1_data_master_requests_onchip_memory_1_s1 = ({cpu_1_data_master_address_to_slave[17 : 14] , 14'b0} == 18'h20000) & (cpu_1_data_master_read | cpu_1_data_master_write);
  //registered rdv signal_name registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1 assignment, which is an e_assign
  assign registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1 = cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register_in;

  //onchip_memory_1_s1_arb_share_counter set values, which is an e_mux
  assign onchip_memory_1_s1_arb_share_set_values = 1;

  //onchip_memory_1_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_memory_1_s1_non_bursting_master_requests = cpu_1_data_master_requests_onchip_memory_1_s1 |
    cpu_1_instruction_master_requests_onchip_memory_1_s1 |
    cpu_1_data_master_requests_onchip_memory_1_s1 |
    cpu_1_instruction_master_requests_onchip_memory_1_s1;

  //onchip_memory_1_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_memory_1_s1_any_bursting_master_saved_grant = 0;

  //onchip_memory_1_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_memory_1_s1_arb_share_counter_next_value = onchip_memory_1_s1_firsttransfer ? (onchip_memory_1_s1_arb_share_set_values - 1) : |onchip_memory_1_s1_arb_share_counter ? (onchip_memory_1_s1_arb_share_counter - 1) : 0;

  //onchip_memory_1_s1_allgrants all slave grants, which is an e_mux
  assign onchip_memory_1_s1_allgrants = (|onchip_memory_1_s1_grant_vector) |
    (|onchip_memory_1_s1_grant_vector) |
    (|onchip_memory_1_s1_grant_vector) |
    (|onchip_memory_1_s1_grant_vector);

  //onchip_memory_1_s1_end_xfer assignment, which is an e_assign
  assign onchip_memory_1_s1_end_xfer = ~(onchip_memory_1_s1_waits_for_read | onchip_memory_1_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_memory_1_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_memory_1_s1 = onchip_memory_1_s1_end_xfer & (~onchip_memory_1_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_memory_1_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_memory_1_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_memory_1_s1 & onchip_memory_1_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_memory_1_s1 & ~onchip_memory_1_s1_non_bursting_master_requests);

  //onchip_memory_1_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_1_s1_arb_share_counter <= 0;
      else if (onchip_memory_1_s1_arb_counter_enable)
          onchip_memory_1_s1_arb_share_counter <= onchip_memory_1_s1_arb_share_counter_next_value;
    end


  //onchip_memory_1_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_1_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_memory_1_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_memory_1_s1) | (end_xfer_arb_share_counter_term_onchip_memory_1_s1 & ~onchip_memory_1_s1_non_bursting_master_requests))
          onchip_memory_1_s1_slavearbiterlockenable <= |onchip_memory_1_s1_arb_share_counter_next_value;
    end


  //cpu_1/data_master onchip_memory_1/s1 arbiterlock, which is an e_assign
  assign cpu_1_data_master_arbiterlock = onchip_memory_1_s1_slavearbiterlockenable & cpu_1_data_master_continuerequest;

  //onchip_memory_1_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_memory_1_s1_slavearbiterlockenable2 = |onchip_memory_1_s1_arb_share_counter_next_value;

  //cpu_1/data_master onchip_memory_1/s1 arbiterlock2, which is an e_assign
  assign cpu_1_data_master_arbiterlock2 = onchip_memory_1_s1_slavearbiterlockenable2 & cpu_1_data_master_continuerequest;

  //cpu_1/instruction_master onchip_memory_1/s1 arbiterlock, which is an e_assign
  assign cpu_1_instruction_master_arbiterlock = onchip_memory_1_s1_slavearbiterlockenable & cpu_1_instruction_master_continuerequest;

  //cpu_1/instruction_master onchip_memory_1/s1 arbiterlock2, which is an e_assign
  assign cpu_1_instruction_master_arbiterlock2 = onchip_memory_1_s1_slavearbiterlockenable2 & cpu_1_instruction_master_continuerequest;

  //cpu_1/instruction_master granted onchip_memory_1/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_1_instruction_master_granted_slave_onchip_memory_1_s1 <= 0;
      else 
        last_cycle_cpu_1_instruction_master_granted_slave_onchip_memory_1_s1 <= cpu_1_instruction_master_saved_grant_onchip_memory_1_s1 ? 1 : (onchip_memory_1_s1_arbitration_holdoff_internal | ~cpu_1_instruction_master_requests_onchip_memory_1_s1) ? 0 : last_cycle_cpu_1_instruction_master_granted_slave_onchip_memory_1_s1;
    end


  //cpu_1_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_1_instruction_master_continuerequest = last_cycle_cpu_1_instruction_master_granted_slave_onchip_memory_1_s1 & cpu_1_instruction_master_requests_onchip_memory_1_s1;

  //onchip_memory_1_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_memory_1_s1_any_continuerequest = cpu_1_instruction_master_continuerequest |
    cpu_1_data_master_continuerequest;

  assign cpu_1_data_master_qualified_request_onchip_memory_1_s1 = cpu_1_data_master_requests_onchip_memory_1_s1 & ~((cpu_1_data_master_read & ((|cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register))) | ((~cpu_1_data_master_waitrequest) & cpu_1_data_master_write) | cpu_1_instruction_master_arbiterlock);
  //cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register_in = cpu_1_data_master_granted_onchip_memory_1_s1 & cpu_1_data_master_read & ~onchip_memory_1_s1_waits_for_read & ~(|cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register);

  //shift register p1 cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register = {cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register, cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register_in};

  //cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register <= 0;
      else 
        cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register <= p1_cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register;
    end


  //local readdatavalid cpu_1_data_master_read_data_valid_onchip_memory_1_s1, which is an e_mux
  assign cpu_1_data_master_read_data_valid_onchip_memory_1_s1 = cpu_1_data_master_read_data_valid_onchip_memory_1_s1_shift_register;

  //onchip_memory_1_s1_writedata mux, which is an e_mux
  assign onchip_memory_1_s1_writedata = cpu_1_data_master_writedata;

  //mux onchip_memory_1_s1_clken, which is an e_mux
  assign onchip_memory_1_s1_clken = 1'b1;

  assign cpu_1_instruction_master_requests_onchip_memory_1_s1 = (({cpu_1_instruction_master_address_to_slave[17 : 14] , 14'b0} == 18'h20000) & (cpu_1_instruction_master_read)) & cpu_1_instruction_master_read;
  //cpu_1/data_master granted onchip_memory_1/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_1_data_master_granted_slave_onchip_memory_1_s1 <= 0;
      else 
        last_cycle_cpu_1_data_master_granted_slave_onchip_memory_1_s1 <= cpu_1_data_master_saved_grant_onchip_memory_1_s1 ? 1 : (onchip_memory_1_s1_arbitration_holdoff_internal | ~cpu_1_data_master_requests_onchip_memory_1_s1) ? 0 : last_cycle_cpu_1_data_master_granted_slave_onchip_memory_1_s1;
    end


  //cpu_1_data_master_continuerequest continued request, which is an e_mux
  assign cpu_1_data_master_continuerequest = last_cycle_cpu_1_data_master_granted_slave_onchip_memory_1_s1 & cpu_1_data_master_requests_onchip_memory_1_s1;

  assign cpu_1_instruction_master_qualified_request_onchip_memory_1_s1 = cpu_1_instruction_master_requests_onchip_memory_1_s1 & ~((cpu_1_instruction_master_read & ((1 < cpu_1_instruction_master_latency_counter))) | cpu_1_data_master_arbiterlock);
  //cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register_in = cpu_1_instruction_master_granted_onchip_memory_1_s1 & cpu_1_instruction_master_read & ~onchip_memory_1_s1_waits_for_read;

  //shift register p1 cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register = {cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register, cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register_in};

  //cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register <= 0;
      else 
        cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register <= p1_cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register;
    end


  //local readdatavalid cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1, which is an e_mux
  assign cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1 = cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1_shift_register;

  //allow new arb cycle for onchip_memory_1/s1, which is an e_assign
  assign onchip_memory_1_s1_allow_new_arb_cycle = ~cpu_1_data_master_arbiterlock & ~cpu_1_instruction_master_arbiterlock;

  //cpu_1/instruction_master assignment into master qualified-requests vector for onchip_memory_1/s1, which is an e_assign
  assign onchip_memory_1_s1_master_qreq_vector[0] = cpu_1_instruction_master_qualified_request_onchip_memory_1_s1;

  //cpu_1/instruction_master grant onchip_memory_1/s1, which is an e_assign
  assign cpu_1_instruction_master_granted_onchip_memory_1_s1 = onchip_memory_1_s1_grant_vector[0];

  //cpu_1/instruction_master saved-grant onchip_memory_1/s1, which is an e_assign
  assign cpu_1_instruction_master_saved_grant_onchip_memory_1_s1 = onchip_memory_1_s1_arb_winner[0] && cpu_1_instruction_master_requests_onchip_memory_1_s1;

  //cpu_1/data_master assignment into master qualified-requests vector for onchip_memory_1/s1, which is an e_assign
  assign onchip_memory_1_s1_master_qreq_vector[1] = cpu_1_data_master_qualified_request_onchip_memory_1_s1;

  //cpu_1/data_master grant onchip_memory_1/s1, which is an e_assign
  assign cpu_1_data_master_granted_onchip_memory_1_s1 = onchip_memory_1_s1_grant_vector[1];

  //cpu_1/data_master saved-grant onchip_memory_1/s1, which is an e_assign
  assign cpu_1_data_master_saved_grant_onchip_memory_1_s1 = onchip_memory_1_s1_arb_winner[1] && cpu_1_data_master_requests_onchip_memory_1_s1;

  //onchip_memory_1/s1 chosen-master double-vector, which is an e_assign
  assign onchip_memory_1_s1_chosen_master_double_vector = {onchip_memory_1_s1_master_qreq_vector, onchip_memory_1_s1_master_qreq_vector} & ({~onchip_memory_1_s1_master_qreq_vector, ~onchip_memory_1_s1_master_qreq_vector} + onchip_memory_1_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_memory_1_s1_arb_winner = (onchip_memory_1_s1_allow_new_arb_cycle & | onchip_memory_1_s1_grant_vector) ? onchip_memory_1_s1_grant_vector : onchip_memory_1_s1_saved_chosen_master_vector;

  //saved onchip_memory_1_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_1_s1_saved_chosen_master_vector <= 0;
      else if (onchip_memory_1_s1_allow_new_arb_cycle)
          onchip_memory_1_s1_saved_chosen_master_vector <= |onchip_memory_1_s1_grant_vector ? onchip_memory_1_s1_grant_vector : onchip_memory_1_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_memory_1_s1_grant_vector = {(onchip_memory_1_s1_chosen_master_double_vector[1] | onchip_memory_1_s1_chosen_master_double_vector[3]),
    (onchip_memory_1_s1_chosen_master_double_vector[0] | onchip_memory_1_s1_chosen_master_double_vector[2])};

  //onchip_memory_1/s1 chosen master rotated left, which is an e_assign
  assign onchip_memory_1_s1_chosen_master_rot_left = (onchip_memory_1_s1_arb_winner << 1) ? (onchip_memory_1_s1_arb_winner << 1) : 1;

  //onchip_memory_1/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_1_s1_arb_addend <= 1;
      else if (|onchip_memory_1_s1_grant_vector)
          onchip_memory_1_s1_arb_addend <= onchip_memory_1_s1_end_xfer? onchip_memory_1_s1_chosen_master_rot_left : onchip_memory_1_s1_grant_vector;
    end


  //~onchip_memory_1_s1_reset assignment, which is an e_assign
  assign onchip_memory_1_s1_reset = ~reset_n;

  assign onchip_memory_1_s1_chipselect = cpu_1_data_master_granted_onchip_memory_1_s1 | cpu_1_instruction_master_granted_onchip_memory_1_s1;
  //onchip_memory_1_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_memory_1_s1_firsttransfer = onchip_memory_1_s1_begins_xfer ? onchip_memory_1_s1_unreg_firsttransfer : onchip_memory_1_s1_reg_firsttransfer;

  //onchip_memory_1_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_memory_1_s1_unreg_firsttransfer = ~(onchip_memory_1_s1_slavearbiterlockenable & onchip_memory_1_s1_any_continuerequest);

  //onchip_memory_1_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_1_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_memory_1_s1_begins_xfer)
          onchip_memory_1_s1_reg_firsttransfer <= onchip_memory_1_s1_unreg_firsttransfer;
    end


  //onchip_memory_1_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_memory_1_s1_beginbursttransfer_internal = onchip_memory_1_s1_begins_xfer;

  //onchip_memory_1_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_memory_1_s1_arbitration_holdoff_internal = onchip_memory_1_s1_begins_xfer & onchip_memory_1_s1_firsttransfer;

  //onchip_memory_1_s1_write assignment, which is an e_mux
  assign onchip_memory_1_s1_write = cpu_1_data_master_granted_onchip_memory_1_s1 & cpu_1_data_master_write;

  assign shifted_address_to_onchip_memory_1_s1_from_cpu_1_data_master = cpu_1_data_master_address_to_slave;
  //onchip_memory_1_s1_address mux, which is an e_mux
  assign onchip_memory_1_s1_address = (cpu_1_data_master_granted_onchip_memory_1_s1)? (shifted_address_to_onchip_memory_1_s1_from_cpu_1_data_master >> 2) :
    (shifted_address_to_onchip_memory_1_s1_from_cpu_1_instruction_master >> 2);

  assign shifted_address_to_onchip_memory_1_s1_from_cpu_1_instruction_master = cpu_1_instruction_master_address_to_slave;
  //d1_onchip_memory_1_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_memory_1_s1_end_xfer <= 1;
      else 
        d1_onchip_memory_1_s1_end_xfer <= onchip_memory_1_s1_end_xfer;
    end


  //onchip_memory_1_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_memory_1_s1_waits_for_read = onchip_memory_1_s1_in_a_read_cycle & 0;

  //onchip_memory_1_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_memory_1_s1_in_a_read_cycle = (cpu_1_data_master_granted_onchip_memory_1_s1 & cpu_1_data_master_read) | (cpu_1_instruction_master_granted_onchip_memory_1_s1 & cpu_1_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_memory_1_s1_in_a_read_cycle;

  //onchip_memory_1_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_memory_1_s1_waits_for_write = onchip_memory_1_s1_in_a_write_cycle & 0;

  //onchip_memory_1_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_memory_1_s1_in_a_write_cycle = cpu_1_data_master_granted_onchip_memory_1_s1 & cpu_1_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_memory_1_s1_in_a_write_cycle;

  assign wait_for_onchip_memory_1_s1_counter = 0;
  //onchip_memory_1_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_memory_1_s1_byteenable = (cpu_1_data_master_granted_onchip_memory_1_s1)? cpu_1_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_memory_1/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_1_data_master_granted_onchip_memory_1_s1 + cpu_1_instruction_master_granted_onchip_memory_1_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_1_data_master_saved_grant_onchip_memory_1_s1 + cpu_1_instruction_master_saved_grant_onchip_memory_1_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module out_0_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_0_data_master_address_to_slave,
                              cpu_0_data_master_read,
                              cpu_0_data_master_waitrequest,
                              cpu_0_data_master_write,
                              cpu_0_data_master_writedata,
                              out_0_s1_readdata,
                              reset_n,

                             // outputs:
                              cpu_0_data_master_granted_out_0_s1,
                              cpu_0_data_master_qualified_request_out_0_s1,
                              cpu_0_data_master_read_data_valid_out_0_s1,
                              cpu_0_data_master_requests_out_0_s1,
                              d1_out_0_s1_end_xfer,
                              out_0_s1_address,
                              out_0_s1_chipselect,
                              out_0_s1_readdata_from_sa,
                              out_0_s1_reset_n,
                              out_0_s1_write_n,
                              out_0_s1_writedata
                           )
;

  output           cpu_0_data_master_granted_out_0_s1;
  output           cpu_0_data_master_qualified_request_out_0_s1;
  output           cpu_0_data_master_read_data_valid_out_0_s1;
  output           cpu_0_data_master_requests_out_0_s1;
  output           d1_out_0_s1_end_xfer;
  output  [  1: 0] out_0_s1_address;
  output           out_0_s1_chipselect;
  output  [ 31: 0] out_0_s1_readdata_from_sa;
  output           out_0_s1_reset_n;
  output           out_0_s1_write_n;
  output  [ 31: 0] out_0_s1_writedata;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] out_0_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_out_0_s1;
  wire             cpu_0_data_master_qualified_request_out_0_s1;
  wire             cpu_0_data_master_read_data_valid_out_0_s1;
  wire             cpu_0_data_master_requests_out_0_s1;
  wire             cpu_0_data_master_saved_grant_out_0_s1;
  reg              d1_out_0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_out_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] out_0_s1_address;
  wire             out_0_s1_allgrants;
  wire             out_0_s1_allow_new_arb_cycle;
  wire             out_0_s1_any_bursting_master_saved_grant;
  wire             out_0_s1_any_continuerequest;
  wire             out_0_s1_arb_counter_enable;
  reg              out_0_s1_arb_share_counter;
  wire             out_0_s1_arb_share_counter_next_value;
  wire             out_0_s1_arb_share_set_values;
  wire             out_0_s1_beginbursttransfer_internal;
  wire             out_0_s1_begins_xfer;
  wire             out_0_s1_chipselect;
  wire             out_0_s1_end_xfer;
  wire             out_0_s1_firsttransfer;
  wire             out_0_s1_grant_vector;
  wire             out_0_s1_in_a_read_cycle;
  wire             out_0_s1_in_a_write_cycle;
  wire             out_0_s1_master_qreq_vector;
  wire             out_0_s1_non_bursting_master_requests;
  wire    [ 31: 0] out_0_s1_readdata_from_sa;
  reg              out_0_s1_reg_firsttransfer;
  wire             out_0_s1_reset_n;
  reg              out_0_s1_slavearbiterlockenable;
  wire             out_0_s1_slavearbiterlockenable2;
  wire             out_0_s1_unreg_firsttransfer;
  wire             out_0_s1_waits_for_read;
  wire             out_0_s1_waits_for_write;
  wire             out_0_s1_write_n;
  wire    [ 31: 0] out_0_s1_writedata;
  wire    [ 16: 0] shifted_address_to_out_0_s1_from_cpu_0_data_master;
  wire             wait_for_out_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~out_0_s1_end_xfer;
    end


  assign out_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_out_0_s1));
  //assign out_0_s1_readdata_from_sa = out_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign out_0_s1_readdata_from_sa = out_0_s1_readdata;

  assign cpu_0_data_master_requests_out_0_s1 = ({cpu_0_data_master_address_to_slave[16 : 4] , 4'b0} == 17'h820) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //out_0_s1_arb_share_counter set values, which is an e_mux
  assign out_0_s1_arb_share_set_values = 1;

  //out_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign out_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_out_0_s1;

  //out_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign out_0_s1_any_bursting_master_saved_grant = 0;

  //out_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign out_0_s1_arb_share_counter_next_value = out_0_s1_firsttransfer ? (out_0_s1_arb_share_set_values - 1) : |out_0_s1_arb_share_counter ? (out_0_s1_arb_share_counter - 1) : 0;

  //out_0_s1_allgrants all slave grants, which is an e_mux
  assign out_0_s1_allgrants = |out_0_s1_grant_vector;

  //out_0_s1_end_xfer assignment, which is an e_assign
  assign out_0_s1_end_xfer = ~(out_0_s1_waits_for_read | out_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_out_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_out_0_s1 = out_0_s1_end_xfer & (~out_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //out_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign out_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_out_0_s1 & out_0_s1_allgrants) | (end_xfer_arb_share_counter_term_out_0_s1 & ~out_0_s1_non_bursting_master_requests);

  //out_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_0_s1_arb_share_counter <= 0;
      else if (out_0_s1_arb_counter_enable)
          out_0_s1_arb_share_counter <= out_0_s1_arb_share_counter_next_value;
    end


  //out_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_0_s1_slavearbiterlockenable <= 0;
      else if ((|out_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_out_0_s1) | (end_xfer_arb_share_counter_term_out_0_s1 & ~out_0_s1_non_bursting_master_requests))
          out_0_s1_slavearbiterlockenable <= |out_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master out_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = out_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //out_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign out_0_s1_slavearbiterlockenable2 = |out_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master out_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = out_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //out_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign out_0_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_out_0_s1 = cpu_0_data_master_requests_out_0_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //out_0_s1_writedata mux, which is an e_mux
  assign out_0_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_out_0_s1 = cpu_0_data_master_qualified_request_out_0_s1;

  //cpu_0/data_master saved-grant out_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_out_0_s1 = cpu_0_data_master_requests_out_0_s1;

  //allow new arb cycle for out_0/s1, which is an e_assign
  assign out_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign out_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign out_0_s1_master_qreq_vector = 1;

  //out_0_s1_reset_n assignment, which is an e_assign
  assign out_0_s1_reset_n = reset_n;

  assign out_0_s1_chipselect = cpu_0_data_master_granted_out_0_s1;
  //out_0_s1_firsttransfer first transaction, which is an e_assign
  assign out_0_s1_firsttransfer = out_0_s1_begins_xfer ? out_0_s1_unreg_firsttransfer : out_0_s1_reg_firsttransfer;

  //out_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign out_0_s1_unreg_firsttransfer = ~(out_0_s1_slavearbiterlockenable & out_0_s1_any_continuerequest);

  //out_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_0_s1_reg_firsttransfer <= 1'b1;
      else if (out_0_s1_begins_xfer)
          out_0_s1_reg_firsttransfer <= out_0_s1_unreg_firsttransfer;
    end


  //out_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign out_0_s1_beginbursttransfer_internal = out_0_s1_begins_xfer;

  //~out_0_s1_write_n assignment, which is an e_mux
  assign out_0_s1_write_n = ~(cpu_0_data_master_granted_out_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_out_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //out_0_s1_address mux, which is an e_mux
  assign out_0_s1_address = shifted_address_to_out_0_s1_from_cpu_0_data_master >> 2;

  //d1_out_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_out_0_s1_end_xfer <= 1;
      else 
        d1_out_0_s1_end_xfer <= out_0_s1_end_xfer;
    end


  //out_0_s1_waits_for_read in a cycle, which is an e_mux
  assign out_0_s1_waits_for_read = out_0_s1_in_a_read_cycle & out_0_s1_begins_xfer;

  //out_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign out_0_s1_in_a_read_cycle = cpu_0_data_master_granted_out_0_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = out_0_s1_in_a_read_cycle;

  //out_0_s1_waits_for_write in a cycle, which is an e_mux
  assign out_0_s1_waits_for_write = out_0_s1_in_a_write_cycle & 0;

  //out_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign out_0_s1_in_a_write_cycle = cpu_0_data_master_granted_out_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = out_0_s1_in_a_write_cycle;

  assign wait_for_out_0_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //out_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module out_1_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_1_data_master_address_to_slave,
                              cpu_1_data_master_read,
                              cpu_1_data_master_waitrequest,
                              cpu_1_data_master_write,
                              cpu_1_data_master_writedata,
                              out_1_s1_readdata,
                              reset_n,

                             // outputs:
                              cpu_1_data_master_granted_out_1_s1,
                              cpu_1_data_master_qualified_request_out_1_s1,
                              cpu_1_data_master_read_data_valid_out_1_s1,
                              cpu_1_data_master_requests_out_1_s1,
                              d1_out_1_s1_end_xfer,
                              out_1_s1_address,
                              out_1_s1_chipselect,
                              out_1_s1_readdata_from_sa,
                              out_1_s1_reset_n,
                              out_1_s1_write_n,
                              out_1_s1_writedata
                           )
;

  output           cpu_1_data_master_granted_out_1_s1;
  output           cpu_1_data_master_qualified_request_out_1_s1;
  output           cpu_1_data_master_read_data_valid_out_1_s1;
  output           cpu_1_data_master_requests_out_1_s1;
  output           d1_out_1_s1_end_xfer;
  output  [  1: 0] out_1_s1_address;
  output           out_1_s1_chipselect;
  output  [ 31: 0] out_1_s1_readdata_from_sa;
  output           out_1_s1_reset_n;
  output           out_1_s1_write_n;
  output  [ 31: 0] out_1_s1_writedata;
  input            clk;
  input   [ 17: 0] cpu_1_data_master_address_to_slave;
  input            cpu_1_data_master_read;
  input            cpu_1_data_master_waitrequest;
  input            cpu_1_data_master_write;
  input   [ 31: 0] cpu_1_data_master_writedata;
  input   [ 31: 0] out_1_s1_readdata;
  input            reset_n;

  wire             cpu_1_data_master_arbiterlock;
  wire             cpu_1_data_master_arbiterlock2;
  wire             cpu_1_data_master_continuerequest;
  wire             cpu_1_data_master_granted_out_1_s1;
  wire             cpu_1_data_master_qualified_request_out_1_s1;
  wire             cpu_1_data_master_read_data_valid_out_1_s1;
  wire             cpu_1_data_master_requests_out_1_s1;
  wire             cpu_1_data_master_saved_grant_out_1_s1;
  reg              d1_out_1_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_out_1_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] out_1_s1_address;
  wire             out_1_s1_allgrants;
  wire             out_1_s1_allow_new_arb_cycle;
  wire             out_1_s1_any_bursting_master_saved_grant;
  wire             out_1_s1_any_continuerequest;
  wire             out_1_s1_arb_counter_enable;
  reg              out_1_s1_arb_share_counter;
  wire             out_1_s1_arb_share_counter_next_value;
  wire             out_1_s1_arb_share_set_values;
  wire             out_1_s1_beginbursttransfer_internal;
  wire             out_1_s1_begins_xfer;
  wire             out_1_s1_chipselect;
  wire             out_1_s1_end_xfer;
  wire             out_1_s1_firsttransfer;
  wire             out_1_s1_grant_vector;
  wire             out_1_s1_in_a_read_cycle;
  wire             out_1_s1_in_a_write_cycle;
  wire             out_1_s1_master_qreq_vector;
  wire             out_1_s1_non_bursting_master_requests;
  wire    [ 31: 0] out_1_s1_readdata_from_sa;
  reg              out_1_s1_reg_firsttransfer;
  wire             out_1_s1_reset_n;
  reg              out_1_s1_slavearbiterlockenable;
  wire             out_1_s1_slavearbiterlockenable2;
  wire             out_1_s1_unreg_firsttransfer;
  wire             out_1_s1_waits_for_read;
  wire             out_1_s1_waits_for_write;
  wire             out_1_s1_write_n;
  wire    [ 31: 0] out_1_s1_writedata;
  wire    [ 17: 0] shifted_address_to_out_1_s1_from_cpu_1_data_master;
  wire             wait_for_out_1_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~out_1_s1_end_xfer;
    end


  assign out_1_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_1_data_master_qualified_request_out_1_s1));
  //assign out_1_s1_readdata_from_sa = out_1_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign out_1_s1_readdata_from_sa = out_1_s1_readdata;

  assign cpu_1_data_master_requests_out_1_s1 = ({cpu_1_data_master_address_to_slave[17 : 4] , 4'b0} == 18'h860) & (cpu_1_data_master_read | cpu_1_data_master_write);
  //out_1_s1_arb_share_counter set values, which is an e_mux
  assign out_1_s1_arb_share_set_values = 1;

  //out_1_s1_non_bursting_master_requests mux, which is an e_mux
  assign out_1_s1_non_bursting_master_requests = cpu_1_data_master_requests_out_1_s1;

  //out_1_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign out_1_s1_any_bursting_master_saved_grant = 0;

  //out_1_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign out_1_s1_arb_share_counter_next_value = out_1_s1_firsttransfer ? (out_1_s1_arb_share_set_values - 1) : |out_1_s1_arb_share_counter ? (out_1_s1_arb_share_counter - 1) : 0;

  //out_1_s1_allgrants all slave grants, which is an e_mux
  assign out_1_s1_allgrants = |out_1_s1_grant_vector;

  //out_1_s1_end_xfer assignment, which is an e_assign
  assign out_1_s1_end_xfer = ~(out_1_s1_waits_for_read | out_1_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_out_1_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_out_1_s1 = out_1_s1_end_xfer & (~out_1_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //out_1_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign out_1_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_out_1_s1 & out_1_s1_allgrants) | (end_xfer_arb_share_counter_term_out_1_s1 & ~out_1_s1_non_bursting_master_requests);

  //out_1_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_1_s1_arb_share_counter <= 0;
      else if (out_1_s1_arb_counter_enable)
          out_1_s1_arb_share_counter <= out_1_s1_arb_share_counter_next_value;
    end


  //out_1_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_1_s1_slavearbiterlockenable <= 0;
      else if ((|out_1_s1_master_qreq_vector & end_xfer_arb_share_counter_term_out_1_s1) | (end_xfer_arb_share_counter_term_out_1_s1 & ~out_1_s1_non_bursting_master_requests))
          out_1_s1_slavearbiterlockenable <= |out_1_s1_arb_share_counter_next_value;
    end


  //cpu_1/data_master out_1/s1 arbiterlock, which is an e_assign
  assign cpu_1_data_master_arbiterlock = out_1_s1_slavearbiterlockenable & cpu_1_data_master_continuerequest;

  //out_1_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign out_1_s1_slavearbiterlockenable2 = |out_1_s1_arb_share_counter_next_value;

  //cpu_1/data_master out_1/s1 arbiterlock2, which is an e_assign
  assign cpu_1_data_master_arbiterlock2 = out_1_s1_slavearbiterlockenable2 & cpu_1_data_master_continuerequest;

  //out_1_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign out_1_s1_any_continuerequest = 1;

  //cpu_1_data_master_continuerequest continued request, which is an e_assign
  assign cpu_1_data_master_continuerequest = 1;

  assign cpu_1_data_master_qualified_request_out_1_s1 = cpu_1_data_master_requests_out_1_s1 & ~(((~cpu_1_data_master_waitrequest) & cpu_1_data_master_write));
  //out_1_s1_writedata mux, which is an e_mux
  assign out_1_s1_writedata = cpu_1_data_master_writedata;

  //master is always granted when requested
  assign cpu_1_data_master_granted_out_1_s1 = cpu_1_data_master_qualified_request_out_1_s1;

  //cpu_1/data_master saved-grant out_1/s1, which is an e_assign
  assign cpu_1_data_master_saved_grant_out_1_s1 = cpu_1_data_master_requests_out_1_s1;

  //allow new arb cycle for out_1/s1, which is an e_assign
  assign out_1_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign out_1_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign out_1_s1_master_qreq_vector = 1;

  //out_1_s1_reset_n assignment, which is an e_assign
  assign out_1_s1_reset_n = reset_n;

  assign out_1_s1_chipselect = cpu_1_data_master_granted_out_1_s1;
  //out_1_s1_firsttransfer first transaction, which is an e_assign
  assign out_1_s1_firsttransfer = out_1_s1_begins_xfer ? out_1_s1_unreg_firsttransfer : out_1_s1_reg_firsttransfer;

  //out_1_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign out_1_s1_unreg_firsttransfer = ~(out_1_s1_slavearbiterlockenable & out_1_s1_any_continuerequest);

  //out_1_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          out_1_s1_reg_firsttransfer <= 1'b1;
      else if (out_1_s1_begins_xfer)
          out_1_s1_reg_firsttransfer <= out_1_s1_unreg_firsttransfer;
    end


  //out_1_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign out_1_s1_beginbursttransfer_internal = out_1_s1_begins_xfer;

  //~out_1_s1_write_n assignment, which is an e_mux
  assign out_1_s1_write_n = ~(cpu_1_data_master_granted_out_1_s1 & cpu_1_data_master_write);

  assign shifted_address_to_out_1_s1_from_cpu_1_data_master = cpu_1_data_master_address_to_slave;
  //out_1_s1_address mux, which is an e_mux
  assign out_1_s1_address = shifted_address_to_out_1_s1_from_cpu_1_data_master >> 2;

  //d1_out_1_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_out_1_s1_end_xfer <= 1;
      else 
        d1_out_1_s1_end_xfer <= out_1_s1_end_xfer;
    end


  //out_1_s1_waits_for_read in a cycle, which is an e_mux
  assign out_1_s1_waits_for_read = out_1_s1_in_a_read_cycle & out_1_s1_begins_xfer;

  //out_1_s1_in_a_read_cycle assignment, which is an e_assign
  assign out_1_s1_in_a_read_cycle = cpu_1_data_master_granted_out_1_s1 & cpu_1_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = out_1_s1_in_a_read_cycle;

  //out_1_s1_waits_for_write in a cycle, which is an e_mux
  assign out_1_s1_waits_for_write = out_1_s1_in_a_write_cycle & 0;

  //out_1_s1_in_a_write_cycle assignment, which is an e_assign
  assign out_1_s1_in_a_write_cycle = cpu_1_data_master_granted_out_1_s1 & cpu_1_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = out_1_s1_in_a_write_cycle;

  assign wait_for_out_1_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //out_1/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_0_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_read,
                                cpu_0_data_master_waitrequest,
                                cpu_0_data_master_write,
                                cpu_0_data_master_writedata,
                                reset_n,
                                timer_0_s1_irq,
                                timer_0_s1_readdata,

                               // outputs:
                                cpu_0_data_master_granted_timer_0_s1,
                                cpu_0_data_master_qualified_request_timer_0_s1,
                                cpu_0_data_master_read_data_valid_timer_0_s1,
                                cpu_0_data_master_requests_timer_0_s1,
                                d1_timer_0_s1_end_xfer,
                                timer_0_s1_address,
                                timer_0_s1_chipselect,
                                timer_0_s1_irq_from_sa,
                                timer_0_s1_readdata_from_sa,
                                timer_0_s1_reset_n,
                                timer_0_s1_write_n,
                                timer_0_s1_writedata
                             )
;

  output           cpu_0_data_master_granted_timer_0_s1;
  output           cpu_0_data_master_qualified_request_timer_0_s1;
  output           cpu_0_data_master_read_data_valid_timer_0_s1;
  output           cpu_0_data_master_requests_timer_0_s1;
  output           d1_timer_0_s1_end_xfer;
  output  [  2: 0] timer_0_s1_address;
  output           timer_0_s1_chipselect;
  output           timer_0_s1_irq_from_sa;
  output  [ 15: 0] timer_0_s1_readdata_from_sa;
  output           timer_0_s1_reset_n;
  output           timer_0_s1_write_n;
  output  [ 15: 0] timer_0_s1_writedata;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;
  input            timer_0_s1_irq;
  input   [ 15: 0] timer_0_s1_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_timer_0_s1;
  wire             cpu_0_data_master_qualified_request_timer_0_s1;
  wire             cpu_0_data_master_read_data_valid_timer_0_s1;
  wire             cpu_0_data_master_requests_timer_0_s1;
  wire             cpu_0_data_master_saved_grant_timer_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 16: 0] shifted_address_to_timer_0_s1_from_cpu_0_data_master;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_allgrants;
  wire             timer_0_s1_allow_new_arb_cycle;
  wire             timer_0_s1_any_bursting_master_saved_grant;
  wire             timer_0_s1_any_continuerequest;
  wire             timer_0_s1_arb_counter_enable;
  reg              timer_0_s1_arb_share_counter;
  wire             timer_0_s1_arb_share_counter_next_value;
  wire             timer_0_s1_arb_share_set_values;
  wire             timer_0_s1_beginbursttransfer_internal;
  wire             timer_0_s1_begins_xfer;
  wire             timer_0_s1_chipselect;
  wire             timer_0_s1_end_xfer;
  wire             timer_0_s1_firsttransfer;
  wire             timer_0_s1_grant_vector;
  wire             timer_0_s1_in_a_read_cycle;
  wire             timer_0_s1_in_a_write_cycle;
  wire             timer_0_s1_irq_from_sa;
  wire             timer_0_s1_master_qreq_vector;
  wire             timer_0_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  reg              timer_0_s1_reg_firsttransfer;
  wire             timer_0_s1_reset_n;
  reg              timer_0_s1_slavearbiterlockenable;
  wire             timer_0_s1_slavearbiterlockenable2;
  wire             timer_0_s1_unreg_firsttransfer;
  wire             timer_0_s1_waits_for_read;
  wire             timer_0_s1_waits_for_write;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  wire             wait_for_timer_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_0_s1_end_xfer;
    end


  assign timer_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_timer_0_s1));
  //assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata;

  assign cpu_0_data_master_requests_timer_0_s1 = ({cpu_0_data_master_address_to_slave[16 : 5] , 5'b0} == 17'h800) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //timer_0_s1_arb_share_counter set values, which is an e_mux
  assign timer_0_s1_arb_share_set_values = 1;

  //timer_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_timer_0_s1;

  //timer_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_0_s1_any_bursting_master_saved_grant = 0;

  //timer_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_0_s1_arb_share_counter_next_value = timer_0_s1_firsttransfer ? (timer_0_s1_arb_share_set_values - 1) : |timer_0_s1_arb_share_counter ? (timer_0_s1_arb_share_counter - 1) : 0;

  //timer_0_s1_allgrants all slave grants, which is an e_mux
  assign timer_0_s1_allgrants = |timer_0_s1_grant_vector;

  //timer_0_s1_end_xfer assignment, which is an e_assign
  assign timer_0_s1_end_xfer = ~(timer_0_s1_waits_for_read | timer_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_0_s1 = timer_0_s1_end_xfer & (~timer_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_0_s1 & timer_0_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests);

  //timer_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_arb_share_counter <= 0;
      else if (timer_0_s1_arb_counter_enable)
          timer_0_s1_arb_share_counter <= timer_0_s1_arb_share_counter_next_value;
    end


  //timer_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_slavearbiterlockenable <= 0;
      else if ((|timer_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_0_s1) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests))
          timer_0_s1_slavearbiterlockenable <= |timer_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master timer_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = timer_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //timer_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_0_s1_slavearbiterlockenable2 = |timer_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master timer_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = timer_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //timer_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_0_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_timer_0_s1 = cpu_0_data_master_requests_timer_0_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //timer_0_s1_writedata mux, which is an e_mux
  assign timer_0_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_timer_0_s1 = cpu_0_data_master_qualified_request_timer_0_s1;

  //cpu_0/data_master saved-grant timer_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_timer_0_s1 = cpu_0_data_master_requests_timer_0_s1;

  //allow new arb cycle for timer_0/s1, which is an e_assign
  assign timer_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_0_s1_master_qreq_vector = 1;

  //timer_0_s1_reset_n assignment, which is an e_assign
  assign timer_0_s1_reset_n = reset_n;

  assign timer_0_s1_chipselect = cpu_0_data_master_granted_timer_0_s1;
  //timer_0_s1_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_firsttransfer = timer_0_s1_begins_xfer ? timer_0_s1_unreg_firsttransfer : timer_0_s1_reg_firsttransfer;

  //timer_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_unreg_firsttransfer = ~(timer_0_s1_slavearbiterlockenable & timer_0_s1_any_continuerequest);

  //timer_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_reg_firsttransfer <= 1'b1;
      else if (timer_0_s1_begins_xfer)
          timer_0_s1_reg_firsttransfer <= timer_0_s1_unreg_firsttransfer;
    end


  //timer_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_0_s1_beginbursttransfer_internal = timer_0_s1_begins_xfer;

  //~timer_0_s1_write_n assignment, which is an e_mux
  assign timer_0_s1_write_n = ~(cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_timer_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //timer_0_s1_address mux, which is an e_mux
  assign timer_0_s1_address = shifted_address_to_timer_0_s1_from_cpu_0_data_master >> 2;

  //d1_timer_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_0_s1_end_xfer <= 1;
      else 
        d1_timer_0_s1_end_xfer <= timer_0_s1_end_xfer;
    end


  //timer_0_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_read = timer_0_s1_in_a_read_cycle & timer_0_s1_begins_xfer;

  //timer_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_read_cycle = cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_0_s1_in_a_read_cycle;

  //timer_0_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_write = timer_0_s1_in_a_write_cycle & 0;

  //timer_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_write_cycle = cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_0_s1_in_a_write_cycle;

  assign wait_for_timer_0_s1_counter = 0;
  //assign timer_0_s1_irq_from_sa = timer_0_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_irq_from_sa = timer_0_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_1_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_1_data_master_address_to_slave,
                                cpu_1_data_master_read,
                                cpu_1_data_master_waitrequest,
                                cpu_1_data_master_write,
                                cpu_1_data_master_writedata,
                                reset_n,
                                timer_1_s1_irq,
                                timer_1_s1_readdata,

                               // outputs:
                                cpu_1_data_master_granted_timer_1_s1,
                                cpu_1_data_master_qualified_request_timer_1_s1,
                                cpu_1_data_master_read_data_valid_timer_1_s1,
                                cpu_1_data_master_requests_timer_1_s1,
                                d1_timer_1_s1_end_xfer,
                                timer_1_s1_address,
                                timer_1_s1_chipselect,
                                timer_1_s1_irq_from_sa,
                                timer_1_s1_readdata_from_sa,
                                timer_1_s1_reset_n,
                                timer_1_s1_write_n,
                                timer_1_s1_writedata
                             )
;

  output           cpu_1_data_master_granted_timer_1_s1;
  output           cpu_1_data_master_qualified_request_timer_1_s1;
  output           cpu_1_data_master_read_data_valid_timer_1_s1;
  output           cpu_1_data_master_requests_timer_1_s1;
  output           d1_timer_1_s1_end_xfer;
  output  [  2: 0] timer_1_s1_address;
  output           timer_1_s1_chipselect;
  output           timer_1_s1_irq_from_sa;
  output  [ 15: 0] timer_1_s1_readdata_from_sa;
  output           timer_1_s1_reset_n;
  output           timer_1_s1_write_n;
  output  [ 15: 0] timer_1_s1_writedata;
  input            clk;
  input   [ 17: 0] cpu_1_data_master_address_to_slave;
  input            cpu_1_data_master_read;
  input            cpu_1_data_master_waitrequest;
  input            cpu_1_data_master_write;
  input   [ 31: 0] cpu_1_data_master_writedata;
  input            reset_n;
  input            timer_1_s1_irq;
  input   [ 15: 0] timer_1_s1_readdata;

  wire             cpu_1_data_master_arbiterlock;
  wire             cpu_1_data_master_arbiterlock2;
  wire             cpu_1_data_master_continuerequest;
  wire             cpu_1_data_master_granted_timer_1_s1;
  wire             cpu_1_data_master_qualified_request_timer_1_s1;
  wire             cpu_1_data_master_read_data_valid_timer_1_s1;
  wire             cpu_1_data_master_requests_timer_1_s1;
  wire             cpu_1_data_master_saved_grant_timer_1_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_1_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_1_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 17: 0] shifted_address_to_timer_1_s1_from_cpu_1_data_master;
  wire    [  2: 0] timer_1_s1_address;
  wire             timer_1_s1_allgrants;
  wire             timer_1_s1_allow_new_arb_cycle;
  wire             timer_1_s1_any_bursting_master_saved_grant;
  wire             timer_1_s1_any_continuerequest;
  wire             timer_1_s1_arb_counter_enable;
  reg              timer_1_s1_arb_share_counter;
  wire             timer_1_s1_arb_share_counter_next_value;
  wire             timer_1_s1_arb_share_set_values;
  wire             timer_1_s1_beginbursttransfer_internal;
  wire             timer_1_s1_begins_xfer;
  wire             timer_1_s1_chipselect;
  wire             timer_1_s1_end_xfer;
  wire             timer_1_s1_firsttransfer;
  wire             timer_1_s1_grant_vector;
  wire             timer_1_s1_in_a_read_cycle;
  wire             timer_1_s1_in_a_write_cycle;
  wire             timer_1_s1_irq_from_sa;
  wire             timer_1_s1_master_qreq_vector;
  wire             timer_1_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_1_s1_readdata_from_sa;
  reg              timer_1_s1_reg_firsttransfer;
  wire             timer_1_s1_reset_n;
  reg              timer_1_s1_slavearbiterlockenable;
  wire             timer_1_s1_slavearbiterlockenable2;
  wire             timer_1_s1_unreg_firsttransfer;
  wire             timer_1_s1_waits_for_read;
  wire             timer_1_s1_waits_for_write;
  wire             timer_1_s1_write_n;
  wire    [ 15: 0] timer_1_s1_writedata;
  wire             wait_for_timer_1_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_1_s1_end_xfer;
    end


  assign timer_1_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_1_data_master_qualified_request_timer_1_s1));
  //assign timer_1_s1_readdata_from_sa = timer_1_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_1_s1_readdata_from_sa = timer_1_s1_readdata;

  assign cpu_1_data_master_requests_timer_1_s1 = ({cpu_1_data_master_address_to_slave[17 : 5] , 5'b0} == 18'h840) & (cpu_1_data_master_read | cpu_1_data_master_write);
  //timer_1_s1_arb_share_counter set values, which is an e_mux
  assign timer_1_s1_arb_share_set_values = 1;

  //timer_1_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_1_s1_non_bursting_master_requests = cpu_1_data_master_requests_timer_1_s1;

  //timer_1_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_1_s1_any_bursting_master_saved_grant = 0;

  //timer_1_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_1_s1_arb_share_counter_next_value = timer_1_s1_firsttransfer ? (timer_1_s1_arb_share_set_values - 1) : |timer_1_s1_arb_share_counter ? (timer_1_s1_arb_share_counter - 1) : 0;

  //timer_1_s1_allgrants all slave grants, which is an e_mux
  assign timer_1_s1_allgrants = |timer_1_s1_grant_vector;

  //timer_1_s1_end_xfer assignment, which is an e_assign
  assign timer_1_s1_end_xfer = ~(timer_1_s1_waits_for_read | timer_1_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_1_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_1_s1 = timer_1_s1_end_xfer & (~timer_1_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_1_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_1_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_1_s1 & timer_1_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_1_s1 & ~timer_1_s1_non_bursting_master_requests);

  //timer_1_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_1_s1_arb_share_counter <= 0;
      else if (timer_1_s1_arb_counter_enable)
          timer_1_s1_arb_share_counter <= timer_1_s1_arb_share_counter_next_value;
    end


  //timer_1_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_1_s1_slavearbiterlockenable <= 0;
      else if ((|timer_1_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_1_s1) | (end_xfer_arb_share_counter_term_timer_1_s1 & ~timer_1_s1_non_bursting_master_requests))
          timer_1_s1_slavearbiterlockenable <= |timer_1_s1_arb_share_counter_next_value;
    end


  //cpu_1/data_master timer_1/s1 arbiterlock, which is an e_assign
  assign cpu_1_data_master_arbiterlock = timer_1_s1_slavearbiterlockenable & cpu_1_data_master_continuerequest;

  //timer_1_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_1_s1_slavearbiterlockenable2 = |timer_1_s1_arb_share_counter_next_value;

  //cpu_1/data_master timer_1/s1 arbiterlock2, which is an e_assign
  assign cpu_1_data_master_arbiterlock2 = timer_1_s1_slavearbiterlockenable2 & cpu_1_data_master_continuerequest;

  //timer_1_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_1_s1_any_continuerequest = 1;

  //cpu_1_data_master_continuerequest continued request, which is an e_assign
  assign cpu_1_data_master_continuerequest = 1;

  assign cpu_1_data_master_qualified_request_timer_1_s1 = cpu_1_data_master_requests_timer_1_s1 & ~(((~cpu_1_data_master_waitrequest) & cpu_1_data_master_write));
  //timer_1_s1_writedata mux, which is an e_mux
  assign timer_1_s1_writedata = cpu_1_data_master_writedata;

  //master is always granted when requested
  assign cpu_1_data_master_granted_timer_1_s1 = cpu_1_data_master_qualified_request_timer_1_s1;

  //cpu_1/data_master saved-grant timer_1/s1, which is an e_assign
  assign cpu_1_data_master_saved_grant_timer_1_s1 = cpu_1_data_master_requests_timer_1_s1;

  //allow new arb cycle for timer_1/s1, which is an e_assign
  assign timer_1_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_1_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_1_s1_master_qreq_vector = 1;

  //timer_1_s1_reset_n assignment, which is an e_assign
  assign timer_1_s1_reset_n = reset_n;

  assign timer_1_s1_chipselect = cpu_1_data_master_granted_timer_1_s1;
  //timer_1_s1_firsttransfer first transaction, which is an e_assign
  assign timer_1_s1_firsttransfer = timer_1_s1_begins_xfer ? timer_1_s1_unreg_firsttransfer : timer_1_s1_reg_firsttransfer;

  //timer_1_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_1_s1_unreg_firsttransfer = ~(timer_1_s1_slavearbiterlockenable & timer_1_s1_any_continuerequest);

  //timer_1_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_1_s1_reg_firsttransfer <= 1'b1;
      else if (timer_1_s1_begins_xfer)
          timer_1_s1_reg_firsttransfer <= timer_1_s1_unreg_firsttransfer;
    end


  //timer_1_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_1_s1_beginbursttransfer_internal = timer_1_s1_begins_xfer;

  //~timer_1_s1_write_n assignment, which is an e_mux
  assign timer_1_s1_write_n = ~(cpu_1_data_master_granted_timer_1_s1 & cpu_1_data_master_write);

  assign shifted_address_to_timer_1_s1_from_cpu_1_data_master = cpu_1_data_master_address_to_slave;
  //timer_1_s1_address mux, which is an e_mux
  assign timer_1_s1_address = shifted_address_to_timer_1_s1_from_cpu_1_data_master >> 2;

  //d1_timer_1_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_1_s1_end_xfer <= 1;
      else 
        d1_timer_1_s1_end_xfer <= timer_1_s1_end_xfer;
    end


  //timer_1_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_1_s1_waits_for_read = timer_1_s1_in_a_read_cycle & timer_1_s1_begins_xfer;

  //timer_1_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_1_s1_in_a_read_cycle = cpu_1_data_master_granted_timer_1_s1 & cpu_1_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_1_s1_in_a_read_cycle;

  //timer_1_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_1_s1_waits_for_write = timer_1_s1_in_a_write_cycle & 0;

  //timer_1_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_1_s1_in_a_write_cycle = cpu_1_data_master_granted_timer_1_s1 & cpu_1_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_1_s1_in_a_write_cycle;

  assign wait_for_timer_1_s1_counter = 0;
  //assign timer_1_s1_irq_from_sa = timer_1_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_1_s1_irq_from_sa = timer_1_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer_1/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module TwoProc_reset_clk_domain_synch_module (
                                               // inputs:
                                                clk,
                                                data_in,
                                                reset_n,

                                               // outputs:
                                                data_out
                                             )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module TwoProc (
                 // 1) global signals:
                  clk,
                  reset_n,

                 // the_in_0
                  in_port_to_the_in_0,

                 // the_in_1
                  in_port_to_the_in_1,

                 // the_out_0
                  out_port_from_the_out_0,

                 // the_out_1
                  out_port_from_the_out_1
               )
;

  output  [ 31: 0] out_port_from_the_out_0;
  output  [ 31: 0] out_port_from_the_out_1;
  input            clk;
  input   [  7: 0] in_port_to_the_in_0;
  input   [  7: 0] in_port_to_the_in_1;
  input            reset_n;

  wire             clk_reset_n;
  wire    [ 16: 0] cpu_0_data_master_address;
  wire    [ 16: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_granted_in_0_s1;
  wire             cpu_0_data_master_granted_mutex_0_s1;
  wire             cpu_0_data_master_granted_onchip_memory_0_s1;
  wire             cpu_0_data_master_granted_out_0_s1;
  wire             cpu_0_data_master_granted_timer_0_s1;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_in_0_s1;
  wire             cpu_0_data_master_qualified_request_mutex_0_s1;
  wire             cpu_0_data_master_qualified_request_onchip_memory_0_s1;
  wire             cpu_0_data_master_qualified_request_out_0_s1;
  wire             cpu_0_data_master_qualified_request_timer_0_s1;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_in_0_s1;
  wire             cpu_0_data_master_read_data_valid_mutex_0_s1;
  wire             cpu_0_data_master_read_data_valid_onchip_memory_0_s1;
  wire             cpu_0_data_master_read_data_valid_out_0_s1;
  wire             cpu_0_data_master_read_data_valid_timer_0_s1;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_in_0_s1;
  wire             cpu_0_data_master_requests_mutex_0_s1;
  wire             cpu_0_data_master_requests_onchip_memory_0_s1;
  wire             cpu_0_data_master_requests_out_0_s1;
  wire             cpu_0_data_master_requests_timer_0_s1;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 16: 0] cpu_0_instruction_master_address;
  wire    [ 16: 0] cpu_0_instruction_master_address_to_slave;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_granted_onchip_memory_0_s1;
  wire             cpu_0_instruction_master_latency_counter;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_onchip_memory_0_s1;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_onchip_memory_0_s1;
  wire             cpu_0_instruction_master_waitrequest;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  wire    [ 17: 0] cpu_1_data_master_address;
  wire    [ 17: 0] cpu_1_data_master_address_to_slave;
  wire    [  3: 0] cpu_1_data_master_byteenable;
  wire             cpu_1_data_master_debugaccess;
  wire             cpu_1_data_master_granted_cpu_1_jtag_debug_module;
  wire             cpu_1_data_master_granted_in_1_s1;
  wire             cpu_1_data_master_granted_mutex_0_s1;
  wire             cpu_1_data_master_granted_onchip_memory_1_s1;
  wire             cpu_1_data_master_granted_out_1_s1;
  wire             cpu_1_data_master_granted_timer_1_s1;
  wire    [ 31: 0] cpu_1_data_master_irq;
  wire             cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module;
  wire             cpu_1_data_master_qualified_request_in_1_s1;
  wire             cpu_1_data_master_qualified_request_mutex_0_s1;
  wire             cpu_1_data_master_qualified_request_onchip_memory_1_s1;
  wire             cpu_1_data_master_qualified_request_out_1_s1;
  wire             cpu_1_data_master_qualified_request_timer_1_s1;
  wire             cpu_1_data_master_read;
  wire             cpu_1_data_master_read_data_valid_cpu_1_jtag_debug_module;
  wire             cpu_1_data_master_read_data_valid_in_1_s1;
  wire             cpu_1_data_master_read_data_valid_mutex_0_s1;
  wire             cpu_1_data_master_read_data_valid_onchip_memory_1_s1;
  wire             cpu_1_data_master_read_data_valid_out_1_s1;
  wire             cpu_1_data_master_read_data_valid_timer_1_s1;
  wire    [ 31: 0] cpu_1_data_master_readdata;
  wire             cpu_1_data_master_requests_cpu_1_jtag_debug_module;
  wire             cpu_1_data_master_requests_in_1_s1;
  wire             cpu_1_data_master_requests_mutex_0_s1;
  wire             cpu_1_data_master_requests_onchip_memory_1_s1;
  wire             cpu_1_data_master_requests_out_1_s1;
  wire             cpu_1_data_master_requests_timer_1_s1;
  wire             cpu_1_data_master_waitrequest;
  wire             cpu_1_data_master_write;
  wire    [ 31: 0] cpu_1_data_master_writedata;
  wire    [ 17: 0] cpu_1_instruction_master_address;
  wire    [ 17: 0] cpu_1_instruction_master_address_to_slave;
  wire             cpu_1_instruction_master_granted_cpu_1_jtag_debug_module;
  wire             cpu_1_instruction_master_granted_onchip_memory_1_s1;
  wire             cpu_1_instruction_master_latency_counter;
  wire             cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module;
  wire             cpu_1_instruction_master_qualified_request_onchip_memory_1_s1;
  wire             cpu_1_instruction_master_read;
  wire             cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module;
  wire             cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1;
  wire    [ 31: 0] cpu_1_instruction_master_readdata;
  wire             cpu_1_instruction_master_readdatavalid;
  wire             cpu_1_instruction_master_requests_cpu_1_jtag_debug_module;
  wire             cpu_1_instruction_master_requests_onchip_memory_1_s1;
  wire             cpu_1_instruction_master_waitrequest;
  wire    [  8: 0] cpu_1_jtag_debug_module_address;
  wire             cpu_1_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_1_jtag_debug_module_byteenable;
  wire             cpu_1_jtag_debug_module_chipselect;
  wire             cpu_1_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_1_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_1_jtag_debug_module_readdata_from_sa;
  wire             cpu_1_jtag_debug_module_reset_n;
  wire             cpu_1_jtag_debug_module_resetrequest;
  wire             cpu_1_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_1_jtag_debug_module_write;
  wire    [ 31: 0] cpu_1_jtag_debug_module_writedata;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             d1_cpu_1_jtag_debug_module_end_xfer;
  wire             d1_in_0_s1_end_xfer;
  wire             d1_in_1_s1_end_xfer;
  wire             d1_mutex_0_s1_end_xfer;
  wire             d1_onchip_memory_0_s1_end_xfer;
  wire             d1_onchip_memory_1_s1_end_xfer;
  wire             d1_out_0_s1_end_xfer;
  wire             d1_out_1_s1_end_xfer;
  wire             d1_timer_0_s1_end_xfer;
  wire             d1_timer_1_s1_end_xfer;
  wire    [  1: 0] in_0_s1_address;
  wire    [ 31: 0] in_0_s1_readdata;
  wire    [ 31: 0] in_0_s1_readdata_from_sa;
  wire             in_0_s1_reset_n;
  wire    [  1: 0] in_1_s1_address;
  wire    [ 31: 0] in_1_s1_readdata;
  wire    [ 31: 0] in_1_s1_readdata_from_sa;
  wire             in_1_s1_reset_n;
  wire             mutex_0_s1_address;
  wire             mutex_0_s1_chipselect;
  wire             mutex_0_s1_read;
  wire    [ 31: 0] mutex_0_s1_readdata;
  wire    [ 31: 0] mutex_0_s1_readdata_from_sa;
  wire             mutex_0_s1_reset_n;
  wire             mutex_0_s1_write;
  wire    [ 31: 0] mutex_0_s1_writedata;
  wire    [ 11: 0] onchip_memory_0_s1_address;
  wire    [  3: 0] onchip_memory_0_s1_byteenable;
  wire             onchip_memory_0_s1_chipselect;
  wire             onchip_memory_0_s1_clken;
  wire    [ 31: 0] onchip_memory_0_s1_readdata;
  wire    [ 31: 0] onchip_memory_0_s1_readdata_from_sa;
  wire             onchip_memory_0_s1_reset;
  wire             onchip_memory_0_s1_write;
  wire    [ 31: 0] onchip_memory_0_s1_writedata;
  wire    [ 11: 0] onchip_memory_1_s1_address;
  wire    [  3: 0] onchip_memory_1_s1_byteenable;
  wire             onchip_memory_1_s1_chipselect;
  wire             onchip_memory_1_s1_clken;
  wire    [ 31: 0] onchip_memory_1_s1_readdata;
  wire    [ 31: 0] onchip_memory_1_s1_readdata_from_sa;
  wire             onchip_memory_1_s1_reset;
  wire             onchip_memory_1_s1_write;
  wire    [ 31: 0] onchip_memory_1_s1_writedata;
  wire    [  1: 0] out_0_s1_address;
  wire             out_0_s1_chipselect;
  wire    [ 31: 0] out_0_s1_readdata;
  wire    [ 31: 0] out_0_s1_readdata_from_sa;
  wire             out_0_s1_reset_n;
  wire             out_0_s1_write_n;
  wire    [ 31: 0] out_0_s1_writedata;
  wire    [  1: 0] out_1_s1_address;
  wire             out_1_s1_chipselect;
  wire    [ 31: 0] out_1_s1_readdata;
  wire    [ 31: 0] out_1_s1_readdata_from_sa;
  wire             out_1_s1_reset_n;
  wire             out_1_s1_write_n;
  wire    [ 31: 0] out_1_s1_writedata;
  wire    [ 31: 0] out_port_from_the_out_0;
  wire    [ 31: 0] out_port_from_the_out_1;
  wire             registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1;
  wire             registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1;
  wire             reset_n_sources;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_chipselect;
  wire             timer_0_s1_irq;
  wire             timer_0_s1_irq_from_sa;
  wire    [ 15: 0] timer_0_s1_readdata;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  wire             timer_0_s1_reset_n;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  wire    [  2: 0] timer_1_s1_address;
  wire             timer_1_s1_chipselect;
  wire             timer_1_s1_irq;
  wire             timer_1_s1_irq_from_sa;
  wire    [ 15: 0] timer_1_s1_readdata;
  wire    [ 15: 0] timer_1_s1_readdata_from_sa;
  wire             timer_1_s1_reset_n;
  wire             timer_1_s1_write_n;
  wire    [ 15: 0] timer_1_s1_writedata;
  cpu_0_jtag_debug_module_arbitrator the_cpu_0_jtag_debug_module
    (
      .clk                                                                (clk),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_debugaccess                                      (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                  (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module        (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module          (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                 (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_waitrequest                                      (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                        (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_jtag_debug_module_address                                    (cpu_0_jtag_debug_module_address),
      .cpu_0_jtag_debug_module_begintransfer                              (cpu_0_jtag_debug_module_begintransfer),
      .cpu_0_jtag_debug_module_byteenable                                 (cpu_0_jtag_debug_module_byteenable),
      .cpu_0_jtag_debug_module_chipselect                                 (cpu_0_jtag_debug_module_chipselect),
      .cpu_0_jtag_debug_module_debugaccess                                (cpu_0_jtag_debug_module_debugaccess),
      .cpu_0_jtag_debug_module_readdata                                   (cpu_0_jtag_debug_module_readdata),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .cpu_0_jtag_debug_module_reset_n                                    (cpu_0_jtag_debug_module_reset_n),
      .cpu_0_jtag_debug_module_resetrequest                               (cpu_0_jtag_debug_module_resetrequest),
      .cpu_0_jtag_debug_module_resetrequest_from_sa                       (cpu_0_jtag_debug_module_resetrequest_from_sa),
      .cpu_0_jtag_debug_module_write                                      (cpu_0_jtag_debug_module_write),
      .cpu_0_jtag_debug_module_writedata                                  (cpu_0_jtag_debug_module_writedata),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .reset_n                                                            (clk_reset_n)
    );

  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .clk                                                             (clk),
      .cpu_0_data_master_address                                       (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                              (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module               (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_granted_in_0_s1                               (cpu_0_data_master_granted_in_0_s1),
      .cpu_0_data_master_granted_mutex_0_s1                            (cpu_0_data_master_granted_mutex_0_s1),
      .cpu_0_data_master_granted_onchip_memory_0_s1                    (cpu_0_data_master_granted_onchip_memory_0_s1),
      .cpu_0_data_master_granted_out_0_s1                              (cpu_0_data_master_granted_out_0_s1),
      .cpu_0_data_master_granted_timer_0_s1                            (cpu_0_data_master_granted_timer_0_s1),
      .cpu_0_data_master_irq                                           (cpu_0_data_master_irq),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module     (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_in_0_s1                     (cpu_0_data_master_qualified_request_in_0_s1),
      .cpu_0_data_master_qualified_request_mutex_0_s1                  (cpu_0_data_master_qualified_request_mutex_0_s1),
      .cpu_0_data_master_qualified_request_onchip_memory_0_s1          (cpu_0_data_master_qualified_request_onchip_memory_0_s1),
      .cpu_0_data_master_qualified_request_out_0_s1                    (cpu_0_data_master_qualified_request_out_0_s1),
      .cpu_0_data_master_qualified_request_timer_0_s1                  (cpu_0_data_master_qualified_request_timer_0_s1),
      .cpu_0_data_master_read                                          (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module       (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read_data_valid_in_0_s1                       (cpu_0_data_master_read_data_valid_in_0_s1),
      .cpu_0_data_master_read_data_valid_mutex_0_s1                    (cpu_0_data_master_read_data_valid_mutex_0_s1),
      .cpu_0_data_master_read_data_valid_onchip_memory_0_s1            (cpu_0_data_master_read_data_valid_onchip_memory_0_s1),
      .cpu_0_data_master_read_data_valid_out_0_s1                      (cpu_0_data_master_read_data_valid_out_0_s1),
      .cpu_0_data_master_read_data_valid_timer_0_s1                    (cpu_0_data_master_read_data_valid_timer_0_s1),
      .cpu_0_data_master_readdata                                      (cpu_0_data_master_readdata),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module              (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_in_0_s1                              (cpu_0_data_master_requests_in_0_s1),
      .cpu_0_data_master_requests_mutex_0_s1                           (cpu_0_data_master_requests_mutex_0_s1),
      .cpu_0_data_master_requests_onchip_memory_0_s1                   (cpu_0_data_master_requests_onchip_memory_0_s1),
      .cpu_0_data_master_requests_out_0_s1                             (cpu_0_data_master_requests_out_0_s1),
      .cpu_0_data_master_requests_timer_0_s1                           (cpu_0_data_master_requests_timer_0_s1),
      .cpu_0_data_master_waitrequest                                   (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                         (cpu_0_data_master_write),
      .cpu_0_jtag_debug_module_readdata_from_sa                        (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_cpu_0_jtag_debug_module_end_xfer                             (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_in_0_s1_end_xfer                                             (d1_in_0_s1_end_xfer),
      .d1_mutex_0_s1_end_xfer                                          (d1_mutex_0_s1_end_xfer),
      .d1_onchip_memory_0_s1_end_xfer                                  (d1_onchip_memory_0_s1_end_xfer),
      .d1_out_0_s1_end_xfer                                            (d1_out_0_s1_end_xfer),
      .d1_timer_0_s1_end_xfer                                          (d1_timer_0_s1_end_xfer),
      .in_0_s1_readdata_from_sa                                        (in_0_s1_readdata_from_sa),
      .mutex_0_s1_readdata_from_sa                                     (mutex_0_s1_readdata_from_sa),
      .onchip_memory_0_s1_readdata_from_sa                             (onchip_memory_0_s1_readdata_from_sa),
      .out_0_s1_readdata_from_sa                                       (out_0_s1_readdata_from_sa),
      .registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1 (registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1),
      .reset_n                                                         (clk_reset_n),
      .timer_0_s1_irq_from_sa                                          (timer_0_s1_irq_from_sa),
      .timer_0_s1_readdata_from_sa                                     (timer_0_s1_readdata_from_sa)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .clk                                                                (clk),
      .cpu_0_instruction_master_address                                   (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_granted_onchip_memory_0_s1                (cpu_0_instruction_master_granted_onchip_memory_0_s1),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_onchip_memory_0_s1      (cpu_0_instruction_master_qualified_request_onchip_memory_0_s1),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1        (cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1),
      .cpu_0_instruction_master_readdata                                  (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_readdatavalid                             (cpu_0_instruction_master_readdatavalid),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_onchip_memory_0_s1               (cpu_0_instruction_master_requests_onchip_memory_0_s1),
      .cpu_0_instruction_master_waitrequest                               (cpu_0_instruction_master_waitrequest),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_onchip_memory_0_s1_end_xfer                                     (d1_onchip_memory_0_s1_end_xfer),
      .onchip_memory_0_s1_readdata_from_sa                                (onchip_memory_0_s1_readdata_from_sa),
      .reset_n                                                            (clk_reset_n)
    );

  cpu_0 the_cpu_0
    (
      .clk                                   (clk),
      .d_address                             (cpu_0_data_master_address),
      .d_byteenable                          (cpu_0_data_master_byteenable),
      .d_irq                                 (cpu_0_data_master_irq),
      .d_read                                (cpu_0_data_master_read),
      .d_readdata                            (cpu_0_data_master_readdata),
      .d_waitrequest                         (cpu_0_data_master_waitrequest),
      .d_write                               (cpu_0_data_master_write),
      .d_writedata                           (cpu_0_data_master_writedata),
      .i_address                             (cpu_0_instruction_master_address),
      .i_read                                (cpu_0_instruction_master_read),
      .i_readdata                            (cpu_0_instruction_master_readdata),
      .i_readdatavalid                       (cpu_0_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_0_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_0_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_0_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_0_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_0_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_0_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_0_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_0_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_0_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_0_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_0_jtag_debug_module_writedata),
      .reset_n                               (cpu_0_jtag_debug_module_reset_n)
    );

  cpu_1_jtag_debug_module_arbitrator the_cpu_1_jtag_debug_module
    (
      .clk                                                                (clk),
      .cpu_1_data_master_address_to_slave                                 (cpu_1_data_master_address_to_slave),
      .cpu_1_data_master_byteenable                                       (cpu_1_data_master_byteenable),
      .cpu_1_data_master_debugaccess                                      (cpu_1_data_master_debugaccess),
      .cpu_1_data_master_granted_cpu_1_jtag_debug_module                  (cpu_1_data_master_granted_cpu_1_jtag_debug_module),
      .cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module        (cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module),
      .cpu_1_data_master_read                                             (cpu_1_data_master_read),
      .cpu_1_data_master_read_data_valid_cpu_1_jtag_debug_module          (cpu_1_data_master_read_data_valid_cpu_1_jtag_debug_module),
      .cpu_1_data_master_requests_cpu_1_jtag_debug_module                 (cpu_1_data_master_requests_cpu_1_jtag_debug_module),
      .cpu_1_data_master_waitrequest                                      (cpu_1_data_master_waitrequest),
      .cpu_1_data_master_write                                            (cpu_1_data_master_write),
      .cpu_1_data_master_writedata                                        (cpu_1_data_master_writedata),
      .cpu_1_instruction_master_address_to_slave                          (cpu_1_instruction_master_address_to_slave),
      .cpu_1_instruction_master_granted_cpu_1_jtag_debug_module           (cpu_1_instruction_master_granted_cpu_1_jtag_debug_module),
      .cpu_1_instruction_master_latency_counter                           (cpu_1_instruction_master_latency_counter),
      .cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module (cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module),
      .cpu_1_instruction_master_read                                      (cpu_1_instruction_master_read),
      .cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module   (cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module),
      .cpu_1_instruction_master_requests_cpu_1_jtag_debug_module          (cpu_1_instruction_master_requests_cpu_1_jtag_debug_module),
      .cpu_1_jtag_debug_module_address                                    (cpu_1_jtag_debug_module_address),
      .cpu_1_jtag_debug_module_begintransfer                              (cpu_1_jtag_debug_module_begintransfer),
      .cpu_1_jtag_debug_module_byteenable                                 (cpu_1_jtag_debug_module_byteenable),
      .cpu_1_jtag_debug_module_chipselect                                 (cpu_1_jtag_debug_module_chipselect),
      .cpu_1_jtag_debug_module_debugaccess                                (cpu_1_jtag_debug_module_debugaccess),
      .cpu_1_jtag_debug_module_readdata                                   (cpu_1_jtag_debug_module_readdata),
      .cpu_1_jtag_debug_module_readdata_from_sa                           (cpu_1_jtag_debug_module_readdata_from_sa),
      .cpu_1_jtag_debug_module_reset_n                                    (cpu_1_jtag_debug_module_reset_n),
      .cpu_1_jtag_debug_module_resetrequest                               (cpu_1_jtag_debug_module_resetrequest),
      .cpu_1_jtag_debug_module_resetrequest_from_sa                       (cpu_1_jtag_debug_module_resetrequest_from_sa),
      .cpu_1_jtag_debug_module_write                                      (cpu_1_jtag_debug_module_write),
      .cpu_1_jtag_debug_module_writedata                                  (cpu_1_jtag_debug_module_writedata),
      .d1_cpu_1_jtag_debug_module_end_xfer                                (d1_cpu_1_jtag_debug_module_end_xfer),
      .reset_n                                                            (clk_reset_n)
    );

  cpu_1_data_master_arbitrator the_cpu_1_data_master
    (
      .clk                                                             (clk),
      .cpu_1_data_master_address                                       (cpu_1_data_master_address),
      .cpu_1_data_master_address_to_slave                              (cpu_1_data_master_address_to_slave),
      .cpu_1_data_master_granted_cpu_1_jtag_debug_module               (cpu_1_data_master_granted_cpu_1_jtag_debug_module),
      .cpu_1_data_master_granted_in_1_s1                               (cpu_1_data_master_granted_in_1_s1),
      .cpu_1_data_master_granted_mutex_0_s1                            (cpu_1_data_master_granted_mutex_0_s1),
      .cpu_1_data_master_granted_onchip_memory_1_s1                    (cpu_1_data_master_granted_onchip_memory_1_s1),
      .cpu_1_data_master_granted_out_1_s1                              (cpu_1_data_master_granted_out_1_s1),
      .cpu_1_data_master_granted_timer_1_s1                            (cpu_1_data_master_granted_timer_1_s1),
      .cpu_1_data_master_irq                                           (cpu_1_data_master_irq),
      .cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module     (cpu_1_data_master_qualified_request_cpu_1_jtag_debug_module),
      .cpu_1_data_master_qualified_request_in_1_s1                     (cpu_1_data_master_qualified_request_in_1_s1),
      .cpu_1_data_master_qualified_request_mutex_0_s1                  (cpu_1_data_master_qualified_request_mutex_0_s1),
      .cpu_1_data_master_qualified_request_onchip_memory_1_s1          (cpu_1_data_master_qualified_request_onchip_memory_1_s1),
      .cpu_1_data_master_qualified_request_out_1_s1                    (cpu_1_data_master_qualified_request_out_1_s1),
      .cpu_1_data_master_qualified_request_timer_1_s1                  (cpu_1_data_master_qualified_request_timer_1_s1),
      .cpu_1_data_master_read                                          (cpu_1_data_master_read),
      .cpu_1_data_master_read_data_valid_cpu_1_jtag_debug_module       (cpu_1_data_master_read_data_valid_cpu_1_jtag_debug_module),
      .cpu_1_data_master_read_data_valid_in_1_s1                       (cpu_1_data_master_read_data_valid_in_1_s1),
      .cpu_1_data_master_read_data_valid_mutex_0_s1                    (cpu_1_data_master_read_data_valid_mutex_0_s1),
      .cpu_1_data_master_read_data_valid_onchip_memory_1_s1            (cpu_1_data_master_read_data_valid_onchip_memory_1_s1),
      .cpu_1_data_master_read_data_valid_out_1_s1                      (cpu_1_data_master_read_data_valid_out_1_s1),
      .cpu_1_data_master_read_data_valid_timer_1_s1                    (cpu_1_data_master_read_data_valid_timer_1_s1),
      .cpu_1_data_master_readdata                                      (cpu_1_data_master_readdata),
      .cpu_1_data_master_requests_cpu_1_jtag_debug_module              (cpu_1_data_master_requests_cpu_1_jtag_debug_module),
      .cpu_1_data_master_requests_in_1_s1                              (cpu_1_data_master_requests_in_1_s1),
      .cpu_1_data_master_requests_mutex_0_s1                           (cpu_1_data_master_requests_mutex_0_s1),
      .cpu_1_data_master_requests_onchip_memory_1_s1                   (cpu_1_data_master_requests_onchip_memory_1_s1),
      .cpu_1_data_master_requests_out_1_s1                             (cpu_1_data_master_requests_out_1_s1),
      .cpu_1_data_master_requests_timer_1_s1                           (cpu_1_data_master_requests_timer_1_s1),
      .cpu_1_data_master_waitrequest                                   (cpu_1_data_master_waitrequest),
      .cpu_1_data_master_write                                         (cpu_1_data_master_write),
      .cpu_1_jtag_debug_module_readdata_from_sa                        (cpu_1_jtag_debug_module_readdata_from_sa),
      .d1_cpu_1_jtag_debug_module_end_xfer                             (d1_cpu_1_jtag_debug_module_end_xfer),
      .d1_in_1_s1_end_xfer                                             (d1_in_1_s1_end_xfer),
      .d1_mutex_0_s1_end_xfer                                          (d1_mutex_0_s1_end_xfer),
      .d1_onchip_memory_1_s1_end_xfer                                  (d1_onchip_memory_1_s1_end_xfer),
      .d1_out_1_s1_end_xfer                                            (d1_out_1_s1_end_xfer),
      .d1_timer_1_s1_end_xfer                                          (d1_timer_1_s1_end_xfer),
      .in_1_s1_readdata_from_sa                                        (in_1_s1_readdata_from_sa),
      .mutex_0_s1_readdata_from_sa                                     (mutex_0_s1_readdata_from_sa),
      .onchip_memory_1_s1_readdata_from_sa                             (onchip_memory_1_s1_readdata_from_sa),
      .out_1_s1_readdata_from_sa                                       (out_1_s1_readdata_from_sa),
      .registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1 (registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1),
      .reset_n                                                         (clk_reset_n),
      .timer_1_s1_irq_from_sa                                          (timer_1_s1_irq_from_sa),
      .timer_1_s1_readdata_from_sa                                     (timer_1_s1_readdata_from_sa)
    );

  cpu_1_instruction_master_arbitrator the_cpu_1_instruction_master
    (
      .clk                                                                (clk),
      .cpu_1_instruction_master_address                                   (cpu_1_instruction_master_address),
      .cpu_1_instruction_master_address_to_slave                          (cpu_1_instruction_master_address_to_slave),
      .cpu_1_instruction_master_granted_cpu_1_jtag_debug_module           (cpu_1_instruction_master_granted_cpu_1_jtag_debug_module),
      .cpu_1_instruction_master_granted_onchip_memory_1_s1                (cpu_1_instruction_master_granted_onchip_memory_1_s1),
      .cpu_1_instruction_master_latency_counter                           (cpu_1_instruction_master_latency_counter),
      .cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module (cpu_1_instruction_master_qualified_request_cpu_1_jtag_debug_module),
      .cpu_1_instruction_master_qualified_request_onchip_memory_1_s1      (cpu_1_instruction_master_qualified_request_onchip_memory_1_s1),
      .cpu_1_instruction_master_read                                      (cpu_1_instruction_master_read),
      .cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module   (cpu_1_instruction_master_read_data_valid_cpu_1_jtag_debug_module),
      .cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1        (cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1),
      .cpu_1_instruction_master_readdata                                  (cpu_1_instruction_master_readdata),
      .cpu_1_instruction_master_readdatavalid                             (cpu_1_instruction_master_readdatavalid),
      .cpu_1_instruction_master_requests_cpu_1_jtag_debug_module          (cpu_1_instruction_master_requests_cpu_1_jtag_debug_module),
      .cpu_1_instruction_master_requests_onchip_memory_1_s1               (cpu_1_instruction_master_requests_onchip_memory_1_s1),
      .cpu_1_instruction_master_waitrequest                               (cpu_1_instruction_master_waitrequest),
      .cpu_1_jtag_debug_module_readdata_from_sa                           (cpu_1_jtag_debug_module_readdata_from_sa),
      .d1_cpu_1_jtag_debug_module_end_xfer                                (d1_cpu_1_jtag_debug_module_end_xfer),
      .d1_onchip_memory_1_s1_end_xfer                                     (d1_onchip_memory_1_s1_end_xfer),
      .onchip_memory_1_s1_readdata_from_sa                                (onchip_memory_1_s1_readdata_from_sa),
      .reset_n                                                            (clk_reset_n)
    );

  cpu_1 the_cpu_1
    (
      .clk                                   (clk),
      .d_address                             (cpu_1_data_master_address),
      .d_byteenable                          (cpu_1_data_master_byteenable),
      .d_irq                                 (cpu_1_data_master_irq),
      .d_read                                (cpu_1_data_master_read),
      .d_readdata                            (cpu_1_data_master_readdata),
      .d_waitrequest                         (cpu_1_data_master_waitrequest),
      .d_write                               (cpu_1_data_master_write),
      .d_writedata                           (cpu_1_data_master_writedata),
      .i_address                             (cpu_1_instruction_master_address),
      .i_read                                (cpu_1_instruction_master_read),
      .i_readdata                            (cpu_1_instruction_master_readdata),
      .i_readdatavalid                       (cpu_1_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_1_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_1_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_1_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_1_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_1_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_1_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_1_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_1_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_1_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_1_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_1_jtag_debug_module_writedata),
      .reset_n                               (cpu_1_jtag_debug_module_reset_n)
    );

  in_0_s1_arbitrator the_in_0_s1
    (
      .clk                                         (clk),
      .cpu_0_data_master_address_to_slave          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_in_0_s1           (cpu_0_data_master_granted_in_0_s1),
      .cpu_0_data_master_qualified_request_in_0_s1 (cpu_0_data_master_qualified_request_in_0_s1),
      .cpu_0_data_master_read                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_in_0_s1   (cpu_0_data_master_read_data_valid_in_0_s1),
      .cpu_0_data_master_requests_in_0_s1          (cpu_0_data_master_requests_in_0_s1),
      .cpu_0_data_master_write                     (cpu_0_data_master_write),
      .d1_in_0_s1_end_xfer                         (d1_in_0_s1_end_xfer),
      .in_0_s1_address                             (in_0_s1_address),
      .in_0_s1_readdata                            (in_0_s1_readdata),
      .in_0_s1_readdata_from_sa                    (in_0_s1_readdata_from_sa),
      .in_0_s1_reset_n                             (in_0_s1_reset_n),
      .reset_n                                     (clk_reset_n)
    );

  in_0 the_in_0
    (
      .address  (in_0_s1_address),
      .clk      (clk),
      .in_port  (in_port_to_the_in_0),
      .readdata (in_0_s1_readdata),
      .reset_n  (in_0_s1_reset_n)
    );

  in_1_s1_arbitrator the_in_1_s1
    (
      .clk                                         (clk),
      .cpu_1_data_master_address_to_slave          (cpu_1_data_master_address_to_slave),
      .cpu_1_data_master_granted_in_1_s1           (cpu_1_data_master_granted_in_1_s1),
      .cpu_1_data_master_qualified_request_in_1_s1 (cpu_1_data_master_qualified_request_in_1_s1),
      .cpu_1_data_master_read                      (cpu_1_data_master_read),
      .cpu_1_data_master_read_data_valid_in_1_s1   (cpu_1_data_master_read_data_valid_in_1_s1),
      .cpu_1_data_master_requests_in_1_s1          (cpu_1_data_master_requests_in_1_s1),
      .cpu_1_data_master_write                     (cpu_1_data_master_write),
      .d1_in_1_s1_end_xfer                         (d1_in_1_s1_end_xfer),
      .in_1_s1_address                             (in_1_s1_address),
      .in_1_s1_readdata                            (in_1_s1_readdata),
      .in_1_s1_readdata_from_sa                    (in_1_s1_readdata_from_sa),
      .in_1_s1_reset_n                             (in_1_s1_reset_n),
      .reset_n                                     (clk_reset_n)
    );

  in_1 the_in_1
    (
      .address  (in_1_s1_address),
      .clk      (clk),
      .in_port  (in_port_to_the_in_1),
      .readdata (in_1_s1_readdata),
      .reset_n  (in_1_s1_reset_n)
    );

  mutex_0_s1_arbitrator the_mutex_0_s1
    (
      .clk                                            (clk),
      .cpu_0_data_master_address_to_slave             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_mutex_0_s1           (cpu_0_data_master_granted_mutex_0_s1),
      .cpu_0_data_master_qualified_request_mutex_0_s1 (cpu_0_data_master_qualified_request_mutex_0_s1),
      .cpu_0_data_master_read                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_mutex_0_s1   (cpu_0_data_master_read_data_valid_mutex_0_s1),
      .cpu_0_data_master_requests_mutex_0_s1          (cpu_0_data_master_requests_mutex_0_s1),
      .cpu_0_data_master_waitrequest                  (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                        (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                    (cpu_0_data_master_writedata),
      .cpu_1_data_master_address_to_slave             (cpu_1_data_master_address_to_slave),
      .cpu_1_data_master_granted_mutex_0_s1           (cpu_1_data_master_granted_mutex_0_s1),
      .cpu_1_data_master_qualified_request_mutex_0_s1 (cpu_1_data_master_qualified_request_mutex_0_s1),
      .cpu_1_data_master_read                         (cpu_1_data_master_read),
      .cpu_1_data_master_read_data_valid_mutex_0_s1   (cpu_1_data_master_read_data_valid_mutex_0_s1),
      .cpu_1_data_master_requests_mutex_0_s1          (cpu_1_data_master_requests_mutex_0_s1),
      .cpu_1_data_master_waitrequest                  (cpu_1_data_master_waitrequest),
      .cpu_1_data_master_write                        (cpu_1_data_master_write),
      .cpu_1_data_master_writedata                    (cpu_1_data_master_writedata),
      .d1_mutex_0_s1_end_xfer                         (d1_mutex_0_s1_end_xfer),
      .mutex_0_s1_address                             (mutex_0_s1_address),
      .mutex_0_s1_chipselect                          (mutex_0_s1_chipselect),
      .mutex_0_s1_read                                (mutex_0_s1_read),
      .mutex_0_s1_readdata                            (mutex_0_s1_readdata),
      .mutex_0_s1_readdata_from_sa                    (mutex_0_s1_readdata_from_sa),
      .mutex_0_s1_reset_n                             (mutex_0_s1_reset_n),
      .mutex_0_s1_write                               (mutex_0_s1_write),
      .mutex_0_s1_writedata                           (mutex_0_s1_writedata),
      .reset_n                                        (clk_reset_n)
    );

  mutex_0 the_mutex_0
    (
      .address       (mutex_0_s1_address),
      .chipselect    (mutex_0_s1_chipselect),
      .clk           (clk),
      .data_from_cpu (mutex_0_s1_writedata),
      .data_to_cpu   (mutex_0_s1_readdata),
      .read          (mutex_0_s1_read),
      .reset_n       (mutex_0_s1_reset_n),
      .write         (mutex_0_s1_write)
    );

  onchip_memory_0_s1_arbitrator the_onchip_memory_0_s1
    (
      .clk                                                             (clk),
      .cpu_0_data_master_address_to_slave                              (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                    (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_onchip_memory_0_s1                    (cpu_0_data_master_granted_onchip_memory_0_s1),
      .cpu_0_data_master_qualified_request_onchip_memory_0_s1          (cpu_0_data_master_qualified_request_onchip_memory_0_s1),
      .cpu_0_data_master_read                                          (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_onchip_memory_0_s1            (cpu_0_data_master_read_data_valid_onchip_memory_0_s1),
      .cpu_0_data_master_requests_onchip_memory_0_s1                   (cpu_0_data_master_requests_onchip_memory_0_s1),
      .cpu_0_data_master_waitrequest                                   (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                         (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                     (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                       (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_onchip_memory_0_s1             (cpu_0_instruction_master_granted_onchip_memory_0_s1),
      .cpu_0_instruction_master_latency_counter                        (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_onchip_memory_0_s1   (cpu_0_instruction_master_qualified_request_onchip_memory_0_s1),
      .cpu_0_instruction_master_read                                   (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1     (cpu_0_instruction_master_read_data_valid_onchip_memory_0_s1),
      .cpu_0_instruction_master_requests_onchip_memory_0_s1            (cpu_0_instruction_master_requests_onchip_memory_0_s1),
      .d1_onchip_memory_0_s1_end_xfer                                  (d1_onchip_memory_0_s1_end_xfer),
      .onchip_memory_0_s1_address                                      (onchip_memory_0_s1_address),
      .onchip_memory_0_s1_byteenable                                   (onchip_memory_0_s1_byteenable),
      .onchip_memory_0_s1_chipselect                                   (onchip_memory_0_s1_chipselect),
      .onchip_memory_0_s1_clken                                        (onchip_memory_0_s1_clken),
      .onchip_memory_0_s1_readdata                                     (onchip_memory_0_s1_readdata),
      .onchip_memory_0_s1_readdata_from_sa                             (onchip_memory_0_s1_readdata_from_sa),
      .onchip_memory_0_s1_reset                                        (onchip_memory_0_s1_reset),
      .onchip_memory_0_s1_write                                        (onchip_memory_0_s1_write),
      .onchip_memory_0_s1_writedata                                    (onchip_memory_0_s1_writedata),
      .registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1 (registered_cpu_0_data_master_read_data_valid_onchip_memory_0_s1),
      .reset_n                                                         (clk_reset_n)
    );

  onchip_memory_0 the_onchip_memory_0
    (
      .address    (onchip_memory_0_s1_address),
      .byteenable (onchip_memory_0_s1_byteenable),
      .chipselect (onchip_memory_0_s1_chipselect),
      .clk        (clk),
      .clken      (onchip_memory_0_s1_clken),
      .readdata   (onchip_memory_0_s1_readdata),
      .reset      (onchip_memory_0_s1_reset),
      .write      (onchip_memory_0_s1_write),
      .writedata  (onchip_memory_0_s1_writedata)
    );

  onchip_memory_1_s1_arbitrator the_onchip_memory_1_s1
    (
      .clk                                                             (clk),
      .cpu_1_data_master_address_to_slave                              (cpu_1_data_master_address_to_slave),
      .cpu_1_data_master_byteenable                                    (cpu_1_data_master_byteenable),
      .cpu_1_data_master_granted_onchip_memory_1_s1                    (cpu_1_data_master_granted_onchip_memory_1_s1),
      .cpu_1_data_master_qualified_request_onchip_memory_1_s1          (cpu_1_data_master_qualified_request_onchip_memory_1_s1),
      .cpu_1_data_master_read                                          (cpu_1_data_master_read),
      .cpu_1_data_master_read_data_valid_onchip_memory_1_s1            (cpu_1_data_master_read_data_valid_onchip_memory_1_s1),
      .cpu_1_data_master_requests_onchip_memory_1_s1                   (cpu_1_data_master_requests_onchip_memory_1_s1),
      .cpu_1_data_master_waitrequest                                   (cpu_1_data_master_waitrequest),
      .cpu_1_data_master_write                                         (cpu_1_data_master_write),
      .cpu_1_data_master_writedata                                     (cpu_1_data_master_writedata),
      .cpu_1_instruction_master_address_to_slave                       (cpu_1_instruction_master_address_to_slave),
      .cpu_1_instruction_master_granted_onchip_memory_1_s1             (cpu_1_instruction_master_granted_onchip_memory_1_s1),
      .cpu_1_instruction_master_latency_counter                        (cpu_1_instruction_master_latency_counter),
      .cpu_1_instruction_master_qualified_request_onchip_memory_1_s1   (cpu_1_instruction_master_qualified_request_onchip_memory_1_s1),
      .cpu_1_instruction_master_read                                   (cpu_1_instruction_master_read),
      .cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1     (cpu_1_instruction_master_read_data_valid_onchip_memory_1_s1),
      .cpu_1_instruction_master_requests_onchip_memory_1_s1            (cpu_1_instruction_master_requests_onchip_memory_1_s1),
      .d1_onchip_memory_1_s1_end_xfer                                  (d1_onchip_memory_1_s1_end_xfer),
      .onchip_memory_1_s1_address                                      (onchip_memory_1_s1_address),
      .onchip_memory_1_s1_byteenable                                   (onchip_memory_1_s1_byteenable),
      .onchip_memory_1_s1_chipselect                                   (onchip_memory_1_s1_chipselect),
      .onchip_memory_1_s1_clken                                        (onchip_memory_1_s1_clken),
      .onchip_memory_1_s1_readdata                                     (onchip_memory_1_s1_readdata),
      .onchip_memory_1_s1_readdata_from_sa                             (onchip_memory_1_s1_readdata_from_sa),
      .onchip_memory_1_s1_reset                                        (onchip_memory_1_s1_reset),
      .onchip_memory_1_s1_write                                        (onchip_memory_1_s1_write),
      .onchip_memory_1_s1_writedata                                    (onchip_memory_1_s1_writedata),
      .registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1 (registered_cpu_1_data_master_read_data_valid_onchip_memory_1_s1),
      .reset_n                                                         (clk_reset_n)
    );

  onchip_memory_1 the_onchip_memory_1
    (
      .address    (onchip_memory_1_s1_address),
      .byteenable (onchip_memory_1_s1_byteenable),
      .chipselect (onchip_memory_1_s1_chipselect),
      .clk        (clk),
      .clken      (onchip_memory_1_s1_clken),
      .readdata   (onchip_memory_1_s1_readdata),
      .reset      (onchip_memory_1_s1_reset),
      .write      (onchip_memory_1_s1_write),
      .writedata  (onchip_memory_1_s1_writedata)
    );

  out_0_s1_arbitrator the_out_0_s1
    (
      .clk                                          (clk),
      .cpu_0_data_master_address_to_slave           (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_out_0_s1           (cpu_0_data_master_granted_out_0_s1),
      .cpu_0_data_master_qualified_request_out_0_s1 (cpu_0_data_master_qualified_request_out_0_s1),
      .cpu_0_data_master_read                       (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_out_0_s1   (cpu_0_data_master_read_data_valid_out_0_s1),
      .cpu_0_data_master_requests_out_0_s1          (cpu_0_data_master_requests_out_0_s1),
      .cpu_0_data_master_waitrequest                (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                      (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                  (cpu_0_data_master_writedata),
      .d1_out_0_s1_end_xfer                         (d1_out_0_s1_end_xfer),
      .out_0_s1_address                             (out_0_s1_address),
      .out_0_s1_chipselect                          (out_0_s1_chipselect),
      .out_0_s1_readdata                            (out_0_s1_readdata),
      .out_0_s1_readdata_from_sa                    (out_0_s1_readdata_from_sa),
      .out_0_s1_reset_n                             (out_0_s1_reset_n),
      .out_0_s1_write_n                             (out_0_s1_write_n),
      .out_0_s1_writedata                           (out_0_s1_writedata),
      .reset_n                                      (clk_reset_n)
    );

  out_0 the_out_0
    (
      .address    (out_0_s1_address),
      .chipselect (out_0_s1_chipselect),
      .clk        (clk),
      .out_port   (out_port_from_the_out_0),
      .readdata   (out_0_s1_readdata),
      .reset_n    (out_0_s1_reset_n),
      .write_n    (out_0_s1_write_n),
      .writedata  (out_0_s1_writedata)
    );

  out_1_s1_arbitrator the_out_1_s1
    (
      .clk                                          (clk),
      .cpu_1_data_master_address_to_slave           (cpu_1_data_master_address_to_slave),
      .cpu_1_data_master_granted_out_1_s1           (cpu_1_data_master_granted_out_1_s1),
      .cpu_1_data_master_qualified_request_out_1_s1 (cpu_1_data_master_qualified_request_out_1_s1),
      .cpu_1_data_master_read                       (cpu_1_data_master_read),
      .cpu_1_data_master_read_data_valid_out_1_s1   (cpu_1_data_master_read_data_valid_out_1_s1),
      .cpu_1_data_master_requests_out_1_s1          (cpu_1_data_master_requests_out_1_s1),
      .cpu_1_data_master_waitrequest                (cpu_1_data_master_waitrequest),
      .cpu_1_data_master_write                      (cpu_1_data_master_write),
      .cpu_1_data_master_writedata                  (cpu_1_data_master_writedata),
      .d1_out_1_s1_end_xfer                         (d1_out_1_s1_end_xfer),
      .out_1_s1_address                             (out_1_s1_address),
      .out_1_s1_chipselect                          (out_1_s1_chipselect),
      .out_1_s1_readdata                            (out_1_s1_readdata),
      .out_1_s1_readdata_from_sa                    (out_1_s1_readdata_from_sa),
      .out_1_s1_reset_n                             (out_1_s1_reset_n),
      .out_1_s1_write_n                             (out_1_s1_write_n),
      .out_1_s1_writedata                           (out_1_s1_writedata),
      .reset_n                                      (clk_reset_n)
    );

  out_1 the_out_1
    (
      .address    (out_1_s1_address),
      .chipselect (out_1_s1_chipselect),
      .clk        (clk),
      .out_port   (out_port_from_the_out_1),
      .readdata   (out_1_s1_readdata),
      .reset_n    (out_1_s1_reset_n),
      .write_n    (out_1_s1_write_n),
      .writedata  (out_1_s1_writedata)
    );

  timer_0_s1_arbitrator the_timer_0_s1
    (
      .clk                                            (clk),
      .cpu_0_data_master_address_to_slave             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_timer_0_s1           (cpu_0_data_master_granted_timer_0_s1),
      .cpu_0_data_master_qualified_request_timer_0_s1 (cpu_0_data_master_qualified_request_timer_0_s1),
      .cpu_0_data_master_read                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_timer_0_s1   (cpu_0_data_master_read_data_valid_timer_0_s1),
      .cpu_0_data_master_requests_timer_0_s1          (cpu_0_data_master_requests_timer_0_s1),
      .cpu_0_data_master_waitrequest                  (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                        (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                    (cpu_0_data_master_writedata),
      .d1_timer_0_s1_end_xfer                         (d1_timer_0_s1_end_xfer),
      .reset_n                                        (clk_reset_n),
      .timer_0_s1_address                             (timer_0_s1_address),
      .timer_0_s1_chipselect                          (timer_0_s1_chipselect),
      .timer_0_s1_irq                                 (timer_0_s1_irq),
      .timer_0_s1_irq_from_sa                         (timer_0_s1_irq_from_sa),
      .timer_0_s1_readdata                            (timer_0_s1_readdata),
      .timer_0_s1_readdata_from_sa                    (timer_0_s1_readdata_from_sa),
      .timer_0_s1_reset_n                             (timer_0_s1_reset_n),
      .timer_0_s1_write_n                             (timer_0_s1_write_n),
      .timer_0_s1_writedata                           (timer_0_s1_writedata)
    );

  timer_0 the_timer_0
    (
      .address    (timer_0_s1_address),
      .chipselect (timer_0_s1_chipselect),
      .clk        (clk),
      .irq        (timer_0_s1_irq),
      .readdata   (timer_0_s1_readdata),
      .reset_n    (timer_0_s1_reset_n),
      .write_n    (timer_0_s1_write_n),
      .writedata  (timer_0_s1_writedata)
    );

  timer_1_s1_arbitrator the_timer_1_s1
    (
      .clk                                            (clk),
      .cpu_1_data_master_address_to_slave             (cpu_1_data_master_address_to_slave),
      .cpu_1_data_master_granted_timer_1_s1           (cpu_1_data_master_granted_timer_1_s1),
      .cpu_1_data_master_qualified_request_timer_1_s1 (cpu_1_data_master_qualified_request_timer_1_s1),
      .cpu_1_data_master_read                         (cpu_1_data_master_read),
      .cpu_1_data_master_read_data_valid_timer_1_s1   (cpu_1_data_master_read_data_valid_timer_1_s1),
      .cpu_1_data_master_requests_timer_1_s1          (cpu_1_data_master_requests_timer_1_s1),
      .cpu_1_data_master_waitrequest                  (cpu_1_data_master_waitrequest),
      .cpu_1_data_master_write                        (cpu_1_data_master_write),
      .cpu_1_data_master_writedata                    (cpu_1_data_master_writedata),
      .d1_timer_1_s1_end_xfer                         (d1_timer_1_s1_end_xfer),
      .reset_n                                        (clk_reset_n),
      .timer_1_s1_address                             (timer_1_s1_address),
      .timer_1_s1_chipselect                          (timer_1_s1_chipselect),
      .timer_1_s1_irq                                 (timer_1_s1_irq),
      .timer_1_s1_irq_from_sa                         (timer_1_s1_irq_from_sa),
      .timer_1_s1_readdata                            (timer_1_s1_readdata),
      .timer_1_s1_readdata_from_sa                    (timer_1_s1_readdata_from_sa),
      .timer_1_s1_reset_n                             (timer_1_s1_reset_n),
      .timer_1_s1_write_n                             (timer_1_s1_write_n),
      .timer_1_s1_writedata                           (timer_1_s1_writedata)
    );

  timer_1 the_timer_1
    (
      .address    (timer_1_s1_address),
      .chipselect (timer_1_s1_chipselect),
      .clk        (clk),
      .irq        (timer_1_s1_irq),
      .readdata   (timer_1_s1_readdata),
      .reset_n    (timer_1_s1_reset_n),
      .write_n    (timer_1_s1_write_n),
      .writedata  (timer_1_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  TwoProc_reset_clk_domain_synch_module TwoProc_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    cpu_1_jtag_debug_module_resetrequest_from_sa |
    cpu_1_jtag_debug_module_resetrequest_from_sa);


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/11.0/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/11.0/quartus/eda/sim_lib/220model.v"
`include "c:/altera/11.0/quartus/eda/sim_lib/sgate.v"
`include "in_1.v"
`include "onchip_memory_0.v"
`include "timer_0.v"
`include "out_0.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_mult_cell.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.v"
`include "timer_1.v"
`include "in_0.v"
`include "onchip_memory_1.v"
`include "mutex_0.v"
`include "cpu_1_test_bench.v"
`include "cpu_1_mult_cell.v"
`include "cpu_1_oci_test_bench.v"
`include "cpu_1_jtag_debug_module_tck.v"
`include "cpu_1_jtag_debug_module_sysclk.v"
`include "cpu_1_jtag_debug_module_wrapper.v"
`include "cpu_1.v"
`include "out_1.v"

`timescale 1ns / 1ps

module test_bench 
;


  reg              clk;
  wire    [  7: 0] in_port_to_the_in_0;
  wire    [  7: 0] in_port_to_the_in_1;
  wire    [ 31: 0] out_port_from_the_out_0;
  wire    [ 31: 0] out_port_from_the_out_1;
  reg              reset_n;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  TwoProc DUT
    (
      .clk                     (clk),
      .in_port_to_the_in_0     (in_port_to_the_in_0),
      .in_port_to_the_in_1     (in_port_to_the_in_1),
      .out_port_from_the_out_0 (out_port_from_the_out_0),
      .out_port_from_the_out_1 (out_port_from_the_out_1),
      .reset_n                 (reset_n)
    );

  initial
    clk = 1'b0;
  always
    #10 clk <= ~clk;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on