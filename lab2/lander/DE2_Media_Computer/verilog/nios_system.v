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

module AV_Config_avalon_av_config_slave_arbitrator (
                                                     // inputs:
                                                      AV_Config_avalon_av_config_slave_readdata,
                                                      AV_Config_avalon_av_config_slave_waitrequest,
                                                      CPU_data_master_address_to_slave,
                                                      CPU_data_master_byteenable,
                                                      CPU_data_master_read,
                                                      CPU_data_master_waitrequest,
                                                      CPU_data_master_write,
                                                      CPU_data_master_writedata,
                                                      clk,
                                                      reset_n,

                                                     // outputs:
                                                      AV_Config_avalon_av_config_slave_address,
                                                      AV_Config_avalon_av_config_slave_byteenable,
                                                      AV_Config_avalon_av_config_slave_read,
                                                      AV_Config_avalon_av_config_slave_readdata_from_sa,
                                                      AV_Config_avalon_av_config_slave_reset,
                                                      AV_Config_avalon_av_config_slave_waitrequest_from_sa,
                                                      AV_Config_avalon_av_config_slave_write,
                                                      AV_Config_avalon_av_config_slave_writedata,
                                                      CPU_data_master_granted_AV_Config_avalon_av_config_slave,
                                                      CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave,
                                                      CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave,
                                                      CPU_data_master_requests_AV_Config_avalon_av_config_slave,
                                                      d1_AV_Config_avalon_av_config_slave_end_xfer,
                                                      registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave
                                                   )
;

  output  [  1: 0] AV_Config_avalon_av_config_slave_address;
  output  [  3: 0] AV_Config_avalon_av_config_slave_byteenable;
  output           AV_Config_avalon_av_config_slave_read;
  output  [ 31: 0] AV_Config_avalon_av_config_slave_readdata_from_sa;
  output           AV_Config_avalon_av_config_slave_reset;
  output           AV_Config_avalon_av_config_slave_waitrequest_from_sa;
  output           AV_Config_avalon_av_config_slave_write;
  output  [ 31: 0] AV_Config_avalon_av_config_slave_writedata;
  output           CPU_data_master_granted_AV_Config_avalon_av_config_slave;
  output           CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave;
  output           CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave;
  output           CPU_data_master_requests_AV_Config_avalon_av_config_slave;
  output           d1_AV_Config_avalon_av_config_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave;
  input   [ 31: 0] AV_Config_avalon_av_config_slave_readdata;
  input            AV_Config_avalon_av_config_slave_waitrequest;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            clk;
  input            reset_n;

  wire    [  1: 0] AV_Config_avalon_av_config_slave_address;
  wire             AV_Config_avalon_av_config_slave_allgrants;
  wire             AV_Config_avalon_av_config_slave_allow_new_arb_cycle;
  wire             AV_Config_avalon_av_config_slave_any_bursting_master_saved_grant;
  wire             AV_Config_avalon_av_config_slave_any_continuerequest;
  wire             AV_Config_avalon_av_config_slave_arb_counter_enable;
  reg     [  2: 0] AV_Config_avalon_av_config_slave_arb_share_counter;
  wire    [  2: 0] AV_Config_avalon_av_config_slave_arb_share_counter_next_value;
  wire    [  2: 0] AV_Config_avalon_av_config_slave_arb_share_set_values;
  wire             AV_Config_avalon_av_config_slave_beginbursttransfer_internal;
  wire             AV_Config_avalon_av_config_slave_begins_xfer;
  wire    [  3: 0] AV_Config_avalon_av_config_slave_byteenable;
  wire             AV_Config_avalon_av_config_slave_end_xfer;
  wire             AV_Config_avalon_av_config_slave_firsttransfer;
  wire             AV_Config_avalon_av_config_slave_grant_vector;
  wire             AV_Config_avalon_av_config_slave_in_a_read_cycle;
  wire             AV_Config_avalon_av_config_slave_in_a_write_cycle;
  wire             AV_Config_avalon_av_config_slave_master_qreq_vector;
  wire             AV_Config_avalon_av_config_slave_non_bursting_master_requests;
  wire             AV_Config_avalon_av_config_slave_read;
  wire    [ 31: 0] AV_Config_avalon_av_config_slave_readdata_from_sa;
  reg              AV_Config_avalon_av_config_slave_reg_firsttransfer;
  wire             AV_Config_avalon_av_config_slave_reset;
  reg              AV_Config_avalon_av_config_slave_slavearbiterlockenable;
  wire             AV_Config_avalon_av_config_slave_slavearbiterlockenable2;
  wire             AV_Config_avalon_av_config_slave_unreg_firsttransfer;
  wire             AV_Config_avalon_av_config_slave_waitrequest_from_sa;
  wire             AV_Config_avalon_av_config_slave_waits_for_read;
  wire             AV_Config_avalon_av_config_slave_waits_for_write;
  wire             AV_Config_avalon_av_config_slave_write;
  wire    [ 31: 0] AV_Config_avalon_av_config_slave_writedata;
  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_AV_Config_avalon_av_config_slave;
  wire             CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave;
  wire             CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave;
  reg              CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register;
  wire             CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register_in;
  wire             CPU_data_master_requests_AV_Config_avalon_av_config_slave;
  wire             CPU_data_master_saved_grant_AV_Config_avalon_av_config_slave;
  reg              d1_AV_Config_avalon_av_config_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_AV_Config_avalon_av_config_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave;
  wire    [ 28: 0] shifted_address_to_AV_Config_avalon_av_config_slave_from_CPU_data_master;
  wire             wait_for_AV_Config_avalon_av_config_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~AV_Config_avalon_av_config_slave_end_xfer;
    end


  assign AV_Config_avalon_av_config_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave));
  //assign AV_Config_avalon_av_config_slave_readdata_from_sa = AV_Config_avalon_av_config_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign AV_Config_avalon_av_config_slave_readdata_from_sa = AV_Config_avalon_av_config_slave_readdata;

  assign CPU_data_master_requests_AV_Config_avalon_av_config_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10003000) & (CPU_data_master_read | CPU_data_master_write);
  //assign AV_Config_avalon_av_config_slave_waitrequest_from_sa = AV_Config_avalon_av_config_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign AV_Config_avalon_av_config_slave_waitrequest_from_sa = AV_Config_avalon_av_config_slave_waitrequest;

  //registered rdv signal_name registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave = CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register_in;

  //AV_Config_avalon_av_config_slave_arb_share_counter set values, which is an e_mux
  assign AV_Config_avalon_av_config_slave_arb_share_set_values = 1;

  //AV_Config_avalon_av_config_slave_non_bursting_master_requests mux, which is an e_mux
  assign AV_Config_avalon_av_config_slave_non_bursting_master_requests = CPU_data_master_requests_AV_Config_avalon_av_config_slave;

  //AV_Config_avalon_av_config_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign AV_Config_avalon_av_config_slave_any_bursting_master_saved_grant = 0;

  //AV_Config_avalon_av_config_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign AV_Config_avalon_av_config_slave_arb_share_counter_next_value = AV_Config_avalon_av_config_slave_firsttransfer ? (AV_Config_avalon_av_config_slave_arb_share_set_values - 1) : |AV_Config_avalon_av_config_slave_arb_share_counter ? (AV_Config_avalon_av_config_slave_arb_share_counter - 1) : 0;

  //AV_Config_avalon_av_config_slave_allgrants all slave grants, which is an e_mux
  assign AV_Config_avalon_av_config_slave_allgrants = |AV_Config_avalon_av_config_slave_grant_vector;

  //AV_Config_avalon_av_config_slave_end_xfer assignment, which is an e_assign
  assign AV_Config_avalon_av_config_slave_end_xfer = ~(AV_Config_avalon_av_config_slave_waits_for_read | AV_Config_avalon_av_config_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_AV_Config_avalon_av_config_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_AV_Config_avalon_av_config_slave = AV_Config_avalon_av_config_slave_end_xfer & (~AV_Config_avalon_av_config_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //AV_Config_avalon_av_config_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign AV_Config_avalon_av_config_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_AV_Config_avalon_av_config_slave & AV_Config_avalon_av_config_slave_allgrants) | (end_xfer_arb_share_counter_term_AV_Config_avalon_av_config_slave & ~AV_Config_avalon_av_config_slave_non_bursting_master_requests);

  //AV_Config_avalon_av_config_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          AV_Config_avalon_av_config_slave_arb_share_counter <= 0;
      else if (AV_Config_avalon_av_config_slave_arb_counter_enable)
          AV_Config_avalon_av_config_slave_arb_share_counter <= AV_Config_avalon_av_config_slave_arb_share_counter_next_value;
    end


  //AV_Config_avalon_av_config_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          AV_Config_avalon_av_config_slave_slavearbiterlockenable <= 0;
      else if ((|AV_Config_avalon_av_config_slave_master_qreq_vector & end_xfer_arb_share_counter_term_AV_Config_avalon_av_config_slave) | (end_xfer_arb_share_counter_term_AV_Config_avalon_av_config_slave & ~AV_Config_avalon_av_config_slave_non_bursting_master_requests))
          AV_Config_avalon_av_config_slave_slavearbiterlockenable <= |AV_Config_avalon_av_config_slave_arb_share_counter_next_value;
    end


  //CPU/data_master AV_Config/avalon_av_config_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = AV_Config_avalon_av_config_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //AV_Config_avalon_av_config_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign AV_Config_avalon_av_config_slave_slavearbiterlockenable2 = |AV_Config_avalon_av_config_slave_arb_share_counter_next_value;

  //CPU/data_master AV_Config/avalon_av_config_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = AV_Config_avalon_av_config_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //AV_Config_avalon_av_config_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign AV_Config_avalon_av_config_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave = CPU_data_master_requests_AV_Config_avalon_av_config_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register_in = CPU_data_master_granted_AV_Config_avalon_av_config_slave & CPU_data_master_read & ~AV_Config_avalon_av_config_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register = {CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register, CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register_in};

  //CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register <= p1_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave = CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave_shift_register;

  //AV_Config_avalon_av_config_slave_writedata mux, which is an e_mux
  assign AV_Config_avalon_av_config_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_AV_Config_avalon_av_config_slave = CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave;

  //CPU/data_master saved-grant AV_Config/avalon_av_config_slave, which is an e_assign
  assign CPU_data_master_saved_grant_AV_Config_avalon_av_config_slave = CPU_data_master_requests_AV_Config_avalon_av_config_slave;

  //allow new arb cycle for AV_Config/avalon_av_config_slave, which is an e_assign
  assign AV_Config_avalon_av_config_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign AV_Config_avalon_av_config_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign AV_Config_avalon_av_config_slave_master_qreq_vector = 1;

  //~AV_Config_avalon_av_config_slave_reset assignment, which is an e_assign
  assign AV_Config_avalon_av_config_slave_reset = ~reset_n;

  //AV_Config_avalon_av_config_slave_firsttransfer first transaction, which is an e_assign
  assign AV_Config_avalon_av_config_slave_firsttransfer = AV_Config_avalon_av_config_slave_begins_xfer ? AV_Config_avalon_av_config_slave_unreg_firsttransfer : AV_Config_avalon_av_config_slave_reg_firsttransfer;

  //AV_Config_avalon_av_config_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign AV_Config_avalon_av_config_slave_unreg_firsttransfer = ~(AV_Config_avalon_av_config_slave_slavearbiterlockenable & AV_Config_avalon_av_config_slave_any_continuerequest);

  //AV_Config_avalon_av_config_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          AV_Config_avalon_av_config_slave_reg_firsttransfer <= 1'b1;
      else if (AV_Config_avalon_av_config_slave_begins_xfer)
          AV_Config_avalon_av_config_slave_reg_firsttransfer <= AV_Config_avalon_av_config_slave_unreg_firsttransfer;
    end


  //AV_Config_avalon_av_config_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign AV_Config_avalon_av_config_slave_beginbursttransfer_internal = AV_Config_avalon_av_config_slave_begins_xfer;

  //AV_Config_avalon_av_config_slave_read assignment, which is an e_mux
  assign AV_Config_avalon_av_config_slave_read = CPU_data_master_granted_AV_Config_avalon_av_config_slave & CPU_data_master_read;

  //AV_Config_avalon_av_config_slave_write assignment, which is an e_mux
  assign AV_Config_avalon_av_config_slave_write = CPU_data_master_granted_AV_Config_avalon_av_config_slave & CPU_data_master_write;

  assign shifted_address_to_AV_Config_avalon_av_config_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //AV_Config_avalon_av_config_slave_address mux, which is an e_mux
  assign AV_Config_avalon_av_config_slave_address = shifted_address_to_AV_Config_avalon_av_config_slave_from_CPU_data_master >> 2;

  //d1_AV_Config_avalon_av_config_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_AV_Config_avalon_av_config_slave_end_xfer <= 1;
      else 
        d1_AV_Config_avalon_av_config_slave_end_xfer <= AV_Config_avalon_av_config_slave_end_xfer;
    end


  //AV_Config_avalon_av_config_slave_waits_for_read in a cycle, which is an e_mux
  assign AV_Config_avalon_av_config_slave_waits_for_read = AV_Config_avalon_av_config_slave_in_a_read_cycle & AV_Config_avalon_av_config_slave_waitrequest_from_sa;

  //AV_Config_avalon_av_config_slave_in_a_read_cycle assignment, which is an e_assign
  assign AV_Config_avalon_av_config_slave_in_a_read_cycle = CPU_data_master_granted_AV_Config_avalon_av_config_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = AV_Config_avalon_av_config_slave_in_a_read_cycle;

  //AV_Config_avalon_av_config_slave_waits_for_write in a cycle, which is an e_mux
  assign AV_Config_avalon_av_config_slave_waits_for_write = AV_Config_avalon_av_config_slave_in_a_write_cycle & AV_Config_avalon_av_config_slave_waitrequest_from_sa;

  //AV_Config_avalon_av_config_slave_in_a_write_cycle assignment, which is an e_assign
  assign AV_Config_avalon_av_config_slave_in_a_write_cycle = CPU_data_master_granted_AV_Config_avalon_av_config_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = AV_Config_avalon_av_config_slave_in_a_write_cycle;

  assign wait_for_AV_Config_avalon_av_config_slave_counter = 0;
  //AV_Config_avalon_av_config_slave_byteenable byte enable port mux, which is an e_mux
  assign AV_Config_avalon_av_config_slave_byteenable = (CPU_data_master_granted_AV_Config_avalon_av_config_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //AV_Config/avalon_av_config_slave enable non-zero assertions, which is an e_register
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

module Alpha_Blending_avalon_background_sink_arbitrator (
                                                          // inputs:
                                                           Alpha_Blending_avalon_background_sink_ready,
                                                           VGA_Pixel_RGB_Resampler_avalon_rgb_source_data,
                                                           VGA_Pixel_RGB_Resampler_avalon_rgb_source_endofpacket,
                                                           VGA_Pixel_RGB_Resampler_avalon_rgb_source_startofpacket,
                                                           VGA_Pixel_RGB_Resampler_avalon_rgb_source_valid,
                                                           clk,
                                                           reset_n,

                                                          // outputs:
                                                           Alpha_Blending_avalon_background_sink_data,
                                                           Alpha_Blending_avalon_background_sink_endofpacket,
                                                           Alpha_Blending_avalon_background_sink_ready_from_sa,
                                                           Alpha_Blending_avalon_background_sink_startofpacket,
                                                           Alpha_Blending_avalon_background_sink_valid
                                                        )
;

  output  [ 29: 0] Alpha_Blending_avalon_background_sink_data;
  output           Alpha_Blending_avalon_background_sink_endofpacket;
  output           Alpha_Blending_avalon_background_sink_ready_from_sa;
  output           Alpha_Blending_avalon_background_sink_startofpacket;
  output           Alpha_Blending_avalon_background_sink_valid;
  input            Alpha_Blending_avalon_background_sink_ready;
  input   [ 29: 0] VGA_Pixel_RGB_Resampler_avalon_rgb_source_data;
  input            VGA_Pixel_RGB_Resampler_avalon_rgb_source_endofpacket;
  input            VGA_Pixel_RGB_Resampler_avalon_rgb_source_startofpacket;
  input            VGA_Pixel_RGB_Resampler_avalon_rgb_source_valid;
  input            clk;
  input            reset_n;

  wire    [ 29: 0] Alpha_Blending_avalon_background_sink_data;
  wire             Alpha_Blending_avalon_background_sink_endofpacket;
  wire             Alpha_Blending_avalon_background_sink_ready_from_sa;
  wire             Alpha_Blending_avalon_background_sink_startofpacket;
  wire             Alpha_Blending_avalon_background_sink_valid;
  //mux Alpha_Blending_avalon_background_sink_data, which is an e_mux
  assign Alpha_Blending_avalon_background_sink_data = VGA_Pixel_RGB_Resampler_avalon_rgb_source_data;

  //mux Alpha_Blending_avalon_background_sink_endofpacket, which is an e_mux
  assign Alpha_Blending_avalon_background_sink_endofpacket = VGA_Pixel_RGB_Resampler_avalon_rgb_source_endofpacket;

  //assign Alpha_Blending_avalon_background_sink_ready_from_sa = Alpha_Blending_avalon_background_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Alpha_Blending_avalon_background_sink_ready_from_sa = Alpha_Blending_avalon_background_sink_ready;

  //mux Alpha_Blending_avalon_background_sink_startofpacket, which is an e_mux
  assign Alpha_Blending_avalon_background_sink_startofpacket = VGA_Pixel_RGB_Resampler_avalon_rgb_source_startofpacket;

  //mux Alpha_Blending_avalon_background_sink_valid, which is an e_mux
  assign Alpha_Blending_avalon_background_sink_valid = VGA_Pixel_RGB_Resampler_avalon_rgb_source_valid;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Alpha_Blending_avalon_foreground_sink_arbitrator (
                                                          // inputs:
                                                           Alpha_Blending_avalon_foreground_sink_ready,
                                                           VGA_Char_Buffer_avalon_char_source_data,
                                                           VGA_Char_Buffer_avalon_char_source_endofpacket,
                                                           VGA_Char_Buffer_avalon_char_source_startofpacket,
                                                           VGA_Char_Buffer_avalon_char_source_valid,
                                                           clk,
                                                           reset_n,

                                                          // outputs:
                                                           Alpha_Blending_avalon_foreground_sink_data,
                                                           Alpha_Blending_avalon_foreground_sink_endofpacket,
                                                           Alpha_Blending_avalon_foreground_sink_ready_from_sa,
                                                           Alpha_Blending_avalon_foreground_sink_reset,
                                                           Alpha_Blending_avalon_foreground_sink_startofpacket,
                                                           Alpha_Blending_avalon_foreground_sink_valid
                                                        )
;

  output  [ 39: 0] Alpha_Blending_avalon_foreground_sink_data;
  output           Alpha_Blending_avalon_foreground_sink_endofpacket;
  output           Alpha_Blending_avalon_foreground_sink_ready_from_sa;
  output           Alpha_Blending_avalon_foreground_sink_reset;
  output           Alpha_Blending_avalon_foreground_sink_startofpacket;
  output           Alpha_Blending_avalon_foreground_sink_valid;
  input            Alpha_Blending_avalon_foreground_sink_ready;
  input   [ 39: 0] VGA_Char_Buffer_avalon_char_source_data;
  input            VGA_Char_Buffer_avalon_char_source_endofpacket;
  input            VGA_Char_Buffer_avalon_char_source_startofpacket;
  input            VGA_Char_Buffer_avalon_char_source_valid;
  input            clk;
  input            reset_n;

  wire    [ 39: 0] Alpha_Blending_avalon_foreground_sink_data;
  wire             Alpha_Blending_avalon_foreground_sink_endofpacket;
  wire             Alpha_Blending_avalon_foreground_sink_ready_from_sa;
  wire             Alpha_Blending_avalon_foreground_sink_reset;
  wire             Alpha_Blending_avalon_foreground_sink_startofpacket;
  wire             Alpha_Blending_avalon_foreground_sink_valid;
  //mux Alpha_Blending_avalon_foreground_sink_data, which is an e_mux
  assign Alpha_Blending_avalon_foreground_sink_data = VGA_Char_Buffer_avalon_char_source_data;

  //mux Alpha_Blending_avalon_foreground_sink_endofpacket, which is an e_mux
  assign Alpha_Blending_avalon_foreground_sink_endofpacket = VGA_Char_Buffer_avalon_char_source_endofpacket;

  //assign Alpha_Blending_avalon_foreground_sink_ready_from_sa = Alpha_Blending_avalon_foreground_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Alpha_Blending_avalon_foreground_sink_ready_from_sa = Alpha_Blending_avalon_foreground_sink_ready;

  //mux Alpha_Blending_avalon_foreground_sink_startofpacket, which is an e_mux
  assign Alpha_Blending_avalon_foreground_sink_startofpacket = VGA_Char_Buffer_avalon_char_source_startofpacket;

  //mux Alpha_Blending_avalon_foreground_sink_valid, which is an e_mux
  assign Alpha_Blending_avalon_foreground_sink_valid = VGA_Char_Buffer_avalon_char_source_valid;

  //~Alpha_Blending_avalon_foreground_sink_reset assignment, which is an e_assign
  assign Alpha_Blending_avalon_foreground_sink_reset = ~reset_n;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Alpha_Blending_avalon_blended_source_arbitrator (
                                                         // inputs:
                                                          Alpha_Blending_avalon_blended_source_data,
                                                          Alpha_Blending_avalon_blended_source_endofpacket,
                                                          Alpha_Blending_avalon_blended_source_startofpacket,
                                                          Alpha_Blending_avalon_blended_source_valid,
                                                          VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa,
                                                          clk,
                                                          reset_n,

                                                         // outputs:
                                                          Alpha_Blending_avalon_blended_source_ready
                                                       )
;

  output           Alpha_Blending_avalon_blended_source_ready;
  input   [ 29: 0] Alpha_Blending_avalon_blended_source_data;
  input            Alpha_Blending_avalon_blended_source_endofpacket;
  input            Alpha_Blending_avalon_blended_source_startofpacket;
  input            Alpha_Blending_avalon_blended_source_valid;
  input            VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa;
  input            clk;
  input            reset_n;

  wire             Alpha_Blending_avalon_blended_source_ready;
  //mux Alpha_Blending_avalon_blended_source_ready, which is an e_mux
  assign Alpha_Blending_avalon_blended_source_ready = VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Audio_avalon_audio_slave_arbitrator (
                                             // inputs:
                                              Audio_avalon_audio_slave_irq,
                                              Audio_avalon_audio_slave_readdata,
                                              CPU_data_master_address_to_slave,
                                              CPU_data_master_read,
                                              CPU_data_master_waitrequest,
                                              CPU_data_master_write,
                                              CPU_data_master_writedata,
                                              clk,
                                              reset_n,

                                             // outputs:
                                              Audio_avalon_audio_slave_address,
                                              Audio_avalon_audio_slave_chipselect,
                                              Audio_avalon_audio_slave_irq_from_sa,
                                              Audio_avalon_audio_slave_read,
                                              Audio_avalon_audio_slave_readdata_from_sa,
                                              Audio_avalon_audio_slave_reset,
                                              Audio_avalon_audio_slave_write,
                                              Audio_avalon_audio_slave_writedata,
                                              CPU_data_master_granted_Audio_avalon_audio_slave,
                                              CPU_data_master_qualified_request_Audio_avalon_audio_slave,
                                              CPU_data_master_read_data_valid_Audio_avalon_audio_slave,
                                              CPU_data_master_requests_Audio_avalon_audio_slave,
                                              d1_Audio_avalon_audio_slave_end_xfer,
                                              registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave
                                           )
;

  output  [  1: 0] Audio_avalon_audio_slave_address;
  output           Audio_avalon_audio_slave_chipselect;
  output           Audio_avalon_audio_slave_irq_from_sa;
  output           Audio_avalon_audio_slave_read;
  output  [ 31: 0] Audio_avalon_audio_slave_readdata_from_sa;
  output           Audio_avalon_audio_slave_reset;
  output           Audio_avalon_audio_slave_write;
  output  [ 31: 0] Audio_avalon_audio_slave_writedata;
  output           CPU_data_master_granted_Audio_avalon_audio_slave;
  output           CPU_data_master_qualified_request_Audio_avalon_audio_slave;
  output           CPU_data_master_read_data_valid_Audio_avalon_audio_slave;
  output           CPU_data_master_requests_Audio_avalon_audio_slave;
  output           d1_Audio_avalon_audio_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave;
  input            Audio_avalon_audio_slave_irq;
  input   [ 31: 0] Audio_avalon_audio_slave_readdata;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            clk;
  input            reset_n;

  wire    [  1: 0] Audio_avalon_audio_slave_address;
  wire             Audio_avalon_audio_slave_allgrants;
  wire             Audio_avalon_audio_slave_allow_new_arb_cycle;
  wire             Audio_avalon_audio_slave_any_bursting_master_saved_grant;
  wire             Audio_avalon_audio_slave_any_continuerequest;
  wire             Audio_avalon_audio_slave_arb_counter_enable;
  reg     [  2: 0] Audio_avalon_audio_slave_arb_share_counter;
  wire    [  2: 0] Audio_avalon_audio_slave_arb_share_counter_next_value;
  wire    [  2: 0] Audio_avalon_audio_slave_arb_share_set_values;
  wire             Audio_avalon_audio_slave_beginbursttransfer_internal;
  wire             Audio_avalon_audio_slave_begins_xfer;
  wire             Audio_avalon_audio_slave_chipselect;
  wire             Audio_avalon_audio_slave_end_xfer;
  wire             Audio_avalon_audio_slave_firsttransfer;
  wire             Audio_avalon_audio_slave_grant_vector;
  wire             Audio_avalon_audio_slave_in_a_read_cycle;
  wire             Audio_avalon_audio_slave_in_a_write_cycle;
  wire             Audio_avalon_audio_slave_irq_from_sa;
  wire             Audio_avalon_audio_slave_master_qreq_vector;
  wire             Audio_avalon_audio_slave_non_bursting_master_requests;
  wire             Audio_avalon_audio_slave_read;
  wire    [ 31: 0] Audio_avalon_audio_slave_readdata_from_sa;
  reg              Audio_avalon_audio_slave_reg_firsttransfer;
  wire             Audio_avalon_audio_slave_reset;
  reg              Audio_avalon_audio_slave_slavearbiterlockenable;
  wire             Audio_avalon_audio_slave_slavearbiterlockenable2;
  wire             Audio_avalon_audio_slave_unreg_firsttransfer;
  wire             Audio_avalon_audio_slave_waits_for_read;
  wire             Audio_avalon_audio_slave_waits_for_write;
  wire             Audio_avalon_audio_slave_write;
  wire    [ 31: 0] Audio_avalon_audio_slave_writedata;
  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Audio_avalon_audio_slave;
  wire             CPU_data_master_qualified_request_Audio_avalon_audio_slave;
  wire             CPU_data_master_read_data_valid_Audio_avalon_audio_slave;
  reg              CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register_in;
  wire             CPU_data_master_requests_Audio_avalon_audio_slave;
  wire             CPU_data_master_saved_grant_Audio_avalon_audio_slave;
  reg              d1_Audio_avalon_audio_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Audio_avalon_audio_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave;
  wire    [ 28: 0] shifted_address_to_Audio_avalon_audio_slave_from_CPU_data_master;
  wire             wait_for_Audio_avalon_audio_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Audio_avalon_audio_slave_end_xfer;
    end


  assign Audio_avalon_audio_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Audio_avalon_audio_slave));
  //assign Audio_avalon_audio_slave_readdata_from_sa = Audio_avalon_audio_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Audio_avalon_audio_slave_readdata_from_sa = Audio_avalon_audio_slave_readdata;

  assign CPU_data_master_requests_Audio_avalon_audio_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10003040) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave = CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register_in;

  //Audio_avalon_audio_slave_arb_share_counter set values, which is an e_mux
  assign Audio_avalon_audio_slave_arb_share_set_values = 1;

  //Audio_avalon_audio_slave_non_bursting_master_requests mux, which is an e_mux
  assign Audio_avalon_audio_slave_non_bursting_master_requests = CPU_data_master_requests_Audio_avalon_audio_slave;

  //Audio_avalon_audio_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Audio_avalon_audio_slave_any_bursting_master_saved_grant = 0;

  //Audio_avalon_audio_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Audio_avalon_audio_slave_arb_share_counter_next_value = Audio_avalon_audio_slave_firsttransfer ? (Audio_avalon_audio_slave_arb_share_set_values - 1) : |Audio_avalon_audio_slave_arb_share_counter ? (Audio_avalon_audio_slave_arb_share_counter - 1) : 0;

  //Audio_avalon_audio_slave_allgrants all slave grants, which is an e_mux
  assign Audio_avalon_audio_slave_allgrants = |Audio_avalon_audio_slave_grant_vector;

  //Audio_avalon_audio_slave_end_xfer assignment, which is an e_assign
  assign Audio_avalon_audio_slave_end_xfer = ~(Audio_avalon_audio_slave_waits_for_read | Audio_avalon_audio_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Audio_avalon_audio_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Audio_avalon_audio_slave = Audio_avalon_audio_slave_end_xfer & (~Audio_avalon_audio_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Audio_avalon_audio_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Audio_avalon_audio_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Audio_avalon_audio_slave & Audio_avalon_audio_slave_allgrants) | (end_xfer_arb_share_counter_term_Audio_avalon_audio_slave & ~Audio_avalon_audio_slave_non_bursting_master_requests);

  //Audio_avalon_audio_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Audio_avalon_audio_slave_arb_share_counter <= 0;
      else if (Audio_avalon_audio_slave_arb_counter_enable)
          Audio_avalon_audio_slave_arb_share_counter <= Audio_avalon_audio_slave_arb_share_counter_next_value;
    end


  //Audio_avalon_audio_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Audio_avalon_audio_slave_slavearbiterlockenable <= 0;
      else if ((|Audio_avalon_audio_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Audio_avalon_audio_slave) | (end_xfer_arb_share_counter_term_Audio_avalon_audio_slave & ~Audio_avalon_audio_slave_non_bursting_master_requests))
          Audio_avalon_audio_slave_slavearbiterlockenable <= |Audio_avalon_audio_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Audio/avalon_audio_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Audio_avalon_audio_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Audio_avalon_audio_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Audio_avalon_audio_slave_slavearbiterlockenable2 = |Audio_avalon_audio_slave_arb_share_counter_next_value;

  //CPU/data_master Audio/avalon_audio_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Audio_avalon_audio_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Audio_avalon_audio_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Audio_avalon_audio_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Audio_avalon_audio_slave = CPU_data_master_requests_Audio_avalon_audio_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register_in = CPU_data_master_granted_Audio_avalon_audio_slave & CPU_data_master_read & ~Audio_avalon_audio_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register = {CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register, CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register <= p1_CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Audio_avalon_audio_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Audio_avalon_audio_slave = CPU_data_master_read_data_valid_Audio_avalon_audio_slave_shift_register;

  //Audio_avalon_audio_slave_writedata mux, which is an e_mux
  assign Audio_avalon_audio_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Audio_avalon_audio_slave = CPU_data_master_qualified_request_Audio_avalon_audio_slave;

  //CPU/data_master saved-grant Audio/avalon_audio_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Audio_avalon_audio_slave = CPU_data_master_requests_Audio_avalon_audio_slave;

  //allow new arb cycle for Audio/avalon_audio_slave, which is an e_assign
  assign Audio_avalon_audio_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Audio_avalon_audio_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Audio_avalon_audio_slave_master_qreq_vector = 1;

  //~Audio_avalon_audio_slave_reset assignment, which is an e_assign
  assign Audio_avalon_audio_slave_reset = ~reset_n;

  assign Audio_avalon_audio_slave_chipselect = CPU_data_master_granted_Audio_avalon_audio_slave;
  //Audio_avalon_audio_slave_firsttransfer first transaction, which is an e_assign
  assign Audio_avalon_audio_slave_firsttransfer = Audio_avalon_audio_slave_begins_xfer ? Audio_avalon_audio_slave_unreg_firsttransfer : Audio_avalon_audio_slave_reg_firsttransfer;

  //Audio_avalon_audio_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Audio_avalon_audio_slave_unreg_firsttransfer = ~(Audio_avalon_audio_slave_slavearbiterlockenable & Audio_avalon_audio_slave_any_continuerequest);

  //Audio_avalon_audio_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Audio_avalon_audio_slave_reg_firsttransfer <= 1'b1;
      else if (Audio_avalon_audio_slave_begins_xfer)
          Audio_avalon_audio_slave_reg_firsttransfer <= Audio_avalon_audio_slave_unreg_firsttransfer;
    end


  //Audio_avalon_audio_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Audio_avalon_audio_slave_beginbursttransfer_internal = Audio_avalon_audio_slave_begins_xfer;

  //Audio_avalon_audio_slave_read assignment, which is an e_mux
  assign Audio_avalon_audio_slave_read = CPU_data_master_granted_Audio_avalon_audio_slave & CPU_data_master_read;

  //Audio_avalon_audio_slave_write assignment, which is an e_mux
  assign Audio_avalon_audio_slave_write = CPU_data_master_granted_Audio_avalon_audio_slave & CPU_data_master_write;

  assign shifted_address_to_Audio_avalon_audio_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Audio_avalon_audio_slave_address mux, which is an e_mux
  assign Audio_avalon_audio_slave_address = shifted_address_to_Audio_avalon_audio_slave_from_CPU_data_master >> 2;

  //d1_Audio_avalon_audio_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Audio_avalon_audio_slave_end_xfer <= 1;
      else 
        d1_Audio_avalon_audio_slave_end_xfer <= Audio_avalon_audio_slave_end_xfer;
    end


  //Audio_avalon_audio_slave_waits_for_read in a cycle, which is an e_mux
  assign Audio_avalon_audio_slave_waits_for_read = Audio_avalon_audio_slave_in_a_read_cycle & 0;

  //Audio_avalon_audio_slave_in_a_read_cycle assignment, which is an e_assign
  assign Audio_avalon_audio_slave_in_a_read_cycle = CPU_data_master_granted_Audio_avalon_audio_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Audio_avalon_audio_slave_in_a_read_cycle;

  //Audio_avalon_audio_slave_waits_for_write in a cycle, which is an e_mux
  assign Audio_avalon_audio_slave_waits_for_write = Audio_avalon_audio_slave_in_a_write_cycle & 0;

  //Audio_avalon_audio_slave_in_a_write_cycle assignment, which is an e_assign
  assign Audio_avalon_audio_slave_in_a_write_cycle = CPU_data_master_granted_Audio_avalon_audio_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Audio_avalon_audio_slave_in_a_write_cycle;

  assign wait_for_Audio_avalon_audio_slave_counter = 0;
  //assign Audio_avalon_audio_slave_irq_from_sa = Audio_avalon_audio_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Audio_avalon_audio_slave_irq_from_sa = Audio_avalon_audio_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Audio/avalon_audio_slave enable non-zero assertions, which is an e_register
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

module CPU_jtag_debug_module_arbitrator (
                                          // inputs:
                                           CPU_data_master_address_to_slave,
                                           CPU_data_master_byteenable,
                                           CPU_data_master_debugaccess,
                                           CPU_data_master_read,
                                           CPU_data_master_waitrequest,
                                           CPU_data_master_write,
                                           CPU_data_master_writedata,
                                           CPU_instruction_master_address_to_slave,
                                           CPU_instruction_master_latency_counter,
                                           CPU_instruction_master_read,
                                           CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register,
                                           CPU_jtag_debug_module_readdata,
                                           CPU_jtag_debug_module_resetrequest,
                                           clk,
                                           reset_n,

                                          // outputs:
                                           CPU_data_master_granted_CPU_jtag_debug_module,
                                           CPU_data_master_qualified_request_CPU_jtag_debug_module,
                                           CPU_data_master_read_data_valid_CPU_jtag_debug_module,
                                           CPU_data_master_requests_CPU_jtag_debug_module,
                                           CPU_instruction_master_granted_CPU_jtag_debug_module,
                                           CPU_instruction_master_qualified_request_CPU_jtag_debug_module,
                                           CPU_instruction_master_read_data_valid_CPU_jtag_debug_module,
                                           CPU_instruction_master_requests_CPU_jtag_debug_module,
                                           CPU_jtag_debug_module_address,
                                           CPU_jtag_debug_module_begintransfer,
                                           CPU_jtag_debug_module_byteenable,
                                           CPU_jtag_debug_module_chipselect,
                                           CPU_jtag_debug_module_debugaccess,
                                           CPU_jtag_debug_module_readdata_from_sa,
                                           CPU_jtag_debug_module_resetrequest_from_sa,
                                           CPU_jtag_debug_module_write,
                                           CPU_jtag_debug_module_writedata,
                                           d1_CPU_jtag_debug_module_end_xfer
                                        )
;

  output           CPU_data_master_granted_CPU_jtag_debug_module;
  output           CPU_data_master_qualified_request_CPU_jtag_debug_module;
  output           CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  output           CPU_data_master_requests_CPU_jtag_debug_module;
  output           CPU_instruction_master_granted_CPU_jtag_debug_module;
  output           CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  output           CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  output           CPU_instruction_master_requests_CPU_jtag_debug_module;
  output  [  8: 0] CPU_jtag_debug_module_address;
  output           CPU_jtag_debug_module_begintransfer;
  output  [  3: 0] CPU_jtag_debug_module_byteenable;
  output           CPU_jtag_debug_module_chipselect;
  output           CPU_jtag_debug_module_debugaccess;
  output  [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  output           CPU_jtag_debug_module_resetrequest_from_sa;
  output           CPU_jtag_debug_module_write;
  output  [ 31: 0] CPU_jtag_debug_module_writedata;
  output           d1_CPU_jtag_debug_module_end_xfer;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_debugaccess;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 27: 0] CPU_instruction_master_address_to_slave;
  input            CPU_instruction_master_latency_counter;
  input            CPU_instruction_master_read;
  input            CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register;
  input   [ 31: 0] CPU_jtag_debug_module_readdata;
  input            CPU_jtag_debug_module_resetrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_CPU_jtag_debug_module;
  wire             CPU_data_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_data_master_requests_CPU_jtag_debug_module;
  wire             CPU_data_master_saved_grant_CPU_jtag_debug_module;
  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_CPU_jtag_debug_module;
  wire             CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_instruction_master_requests_CPU_jtag_debug_module;
  wire             CPU_instruction_master_saved_grant_CPU_jtag_debug_module;
  wire    [  8: 0] CPU_jtag_debug_module_address;
  wire             CPU_jtag_debug_module_allgrants;
  wire             CPU_jtag_debug_module_allow_new_arb_cycle;
  wire             CPU_jtag_debug_module_any_bursting_master_saved_grant;
  wire             CPU_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] CPU_jtag_debug_module_arb_addend;
  wire             CPU_jtag_debug_module_arb_counter_enable;
  reg     [  2: 0] CPU_jtag_debug_module_arb_share_counter;
  wire    [  2: 0] CPU_jtag_debug_module_arb_share_counter_next_value;
  wire    [  2: 0] CPU_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] CPU_jtag_debug_module_arb_winner;
  wire             CPU_jtag_debug_module_arbitration_holdoff_internal;
  wire             CPU_jtag_debug_module_beginbursttransfer_internal;
  wire             CPU_jtag_debug_module_begins_xfer;
  wire             CPU_jtag_debug_module_begintransfer;
  wire    [  3: 0] CPU_jtag_debug_module_byteenable;
  wire             CPU_jtag_debug_module_chipselect;
  wire    [  3: 0] CPU_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] CPU_jtag_debug_module_chosen_master_rot_left;
  wire             CPU_jtag_debug_module_debugaccess;
  wire             CPU_jtag_debug_module_end_xfer;
  wire             CPU_jtag_debug_module_firsttransfer;
  wire    [  1: 0] CPU_jtag_debug_module_grant_vector;
  wire             CPU_jtag_debug_module_in_a_read_cycle;
  wire             CPU_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] CPU_jtag_debug_module_master_qreq_vector;
  wire             CPU_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  reg              CPU_jtag_debug_module_reg_firsttransfer;
  wire             CPU_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] CPU_jtag_debug_module_saved_chosen_master_vector;
  reg              CPU_jtag_debug_module_slavearbiterlockenable;
  wire             CPU_jtag_debug_module_slavearbiterlockenable2;
  wire             CPU_jtag_debug_module_unreg_firsttransfer;
  wire             CPU_jtag_debug_module_waits_for_read;
  wire             CPU_jtag_debug_module_waits_for_write;
  wire             CPU_jtag_debug_module_write;
  wire    [ 31: 0] CPU_jtag_debug_module_writedata;
  reg              d1_CPU_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_CPU_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module;
  reg              last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module;
  wire    [ 28: 0] shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master;
  wire    [ 27: 0] shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master;
  wire             wait_for_CPU_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~CPU_jtag_debug_module_end_xfer;
    end


  assign CPU_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_CPU_jtag_debug_module | CPU_instruction_master_qualified_request_CPU_jtag_debug_module));
  //assign CPU_jtag_debug_module_readdata_from_sa = CPU_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign CPU_jtag_debug_module_readdata_from_sa = CPU_jtag_debug_module_readdata;

  assign CPU_data_master_requests_CPU_jtag_debug_module = ({CPU_data_master_address_to_slave[28 : 11] , 11'b0} == 29'ha000000) & (CPU_data_master_read | CPU_data_master_write);
  //CPU_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign CPU_jtag_debug_module_arb_share_set_values = 1;

  //CPU_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign CPU_jtag_debug_module_non_bursting_master_requests = CPU_data_master_requests_CPU_jtag_debug_module |
    CPU_instruction_master_requests_CPU_jtag_debug_module |
    CPU_data_master_requests_CPU_jtag_debug_module |
    CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign CPU_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //CPU_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign CPU_jtag_debug_module_arb_share_counter_next_value = CPU_jtag_debug_module_firsttransfer ? (CPU_jtag_debug_module_arb_share_set_values - 1) : |CPU_jtag_debug_module_arb_share_counter ? (CPU_jtag_debug_module_arb_share_counter - 1) : 0;

  //CPU_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign CPU_jtag_debug_module_allgrants = (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector);

  //CPU_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign CPU_jtag_debug_module_end_xfer = ~(CPU_jtag_debug_module_waits_for_read | CPU_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_CPU_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_CPU_jtag_debug_module = CPU_jtag_debug_module_end_xfer & (~CPU_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //CPU_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign CPU_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & CPU_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & ~CPU_jtag_debug_module_non_bursting_master_requests);

  //CPU_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_arb_share_counter <= 0;
      else if (CPU_jtag_debug_module_arb_counter_enable)
          CPU_jtag_debug_module_arb_share_counter <= CPU_jtag_debug_module_arb_share_counter_next_value;
    end


  //CPU_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|CPU_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_CPU_jtag_debug_module) | (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & ~CPU_jtag_debug_module_non_bursting_master_requests))
          CPU_jtag_debug_module_slavearbiterlockenable <= |CPU_jtag_debug_module_arb_share_counter_next_value;
    end


  //CPU/data_master CPU/jtag_debug_module arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = CPU_jtag_debug_module_slavearbiterlockenable & CPU_data_master_continuerequest;

  //CPU_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign CPU_jtag_debug_module_slavearbiterlockenable2 = |CPU_jtag_debug_module_arb_share_counter_next_value;

  //CPU/data_master CPU/jtag_debug_module arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = CPU_jtag_debug_module_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //CPU/instruction_master CPU/jtag_debug_module arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = CPU_jtag_debug_module_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //CPU/instruction_master CPU/jtag_debug_module arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = CPU_jtag_debug_module_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //CPU/instruction_master granted CPU/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module <= 0;
      else 
        last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module <= CPU_instruction_master_saved_grant_CPU_jtag_debug_module ? 1 : (CPU_jtag_debug_module_arbitration_holdoff_internal | ~CPU_instruction_master_requests_CPU_jtag_debug_module) ? 0 : last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module;
    end


  //CPU_instruction_master_continuerequest continued request, which is an e_mux
  assign CPU_instruction_master_continuerequest = last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module & CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign CPU_jtag_debug_module_any_continuerequest = CPU_instruction_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_CPU_jtag_debug_module = CPU_data_master_requests_CPU_jtag_debug_module & ~(((~CPU_data_master_waitrequest) & CPU_data_master_write) | CPU_instruction_master_arbiterlock);
  //CPU_jtag_debug_module_writedata mux, which is an e_mux
  assign CPU_jtag_debug_module_writedata = CPU_data_master_writedata;

  assign CPU_instruction_master_requests_CPU_jtag_debug_module = (({CPU_instruction_master_address_to_slave[27 : 11] , 11'b0} == 28'ha000000) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //CPU/data_master granted CPU/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module <= CPU_data_master_saved_grant_CPU_jtag_debug_module ? 1 : (CPU_jtag_debug_module_arbitration_holdoff_internal | ~CPU_data_master_requests_CPU_jtag_debug_module) ? 0 : last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module & CPU_data_master_requests_CPU_jtag_debug_module;

  assign CPU_instruction_master_qualified_request_CPU_jtag_debug_module = CPU_instruction_master_requests_CPU_jtag_debug_module & ~((CPU_instruction_master_read & ((CPU_instruction_master_latency_counter != 0) | (|CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register))) | CPU_data_master_arbiterlock);
  //local readdatavalid CPU_instruction_master_read_data_valid_CPU_jtag_debug_module, which is an e_mux
  assign CPU_instruction_master_read_data_valid_CPU_jtag_debug_module = CPU_instruction_master_granted_CPU_jtag_debug_module & CPU_instruction_master_read & ~CPU_jtag_debug_module_waits_for_read;

  //allow new arb cycle for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~CPU_instruction_master_arbiterlock;

  //CPU/instruction_master assignment into master qualified-requests vector for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_master_qreq_vector[0] = CPU_instruction_master_qualified_request_CPU_jtag_debug_module;

  //CPU/instruction_master grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_instruction_master_granted_CPU_jtag_debug_module = CPU_jtag_debug_module_grant_vector[0];

  //CPU/instruction_master saved-grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_instruction_master_saved_grant_CPU_jtag_debug_module = CPU_jtag_debug_module_arb_winner[0] && CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU/data_master assignment into master qualified-requests vector for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_master_qreq_vector[1] = CPU_data_master_qualified_request_CPU_jtag_debug_module;

  //CPU/data_master grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_data_master_granted_CPU_jtag_debug_module = CPU_jtag_debug_module_grant_vector[1];

  //CPU/data_master saved-grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_data_master_saved_grant_CPU_jtag_debug_module = CPU_jtag_debug_module_arb_winner[1] && CPU_data_master_requests_CPU_jtag_debug_module;

  //CPU/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign CPU_jtag_debug_module_chosen_master_double_vector = {CPU_jtag_debug_module_master_qreq_vector, CPU_jtag_debug_module_master_qreq_vector} & ({~CPU_jtag_debug_module_master_qreq_vector, ~CPU_jtag_debug_module_master_qreq_vector} + CPU_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign CPU_jtag_debug_module_arb_winner = (CPU_jtag_debug_module_allow_new_arb_cycle & | CPU_jtag_debug_module_grant_vector) ? CPU_jtag_debug_module_grant_vector : CPU_jtag_debug_module_saved_chosen_master_vector;

  //saved CPU_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (CPU_jtag_debug_module_allow_new_arb_cycle)
          CPU_jtag_debug_module_saved_chosen_master_vector <= |CPU_jtag_debug_module_grant_vector ? CPU_jtag_debug_module_grant_vector : CPU_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign CPU_jtag_debug_module_grant_vector = {(CPU_jtag_debug_module_chosen_master_double_vector[1] | CPU_jtag_debug_module_chosen_master_double_vector[3]),
    (CPU_jtag_debug_module_chosen_master_double_vector[0] | CPU_jtag_debug_module_chosen_master_double_vector[2])};

  //CPU/jtag_debug_module chosen master rotated left, which is an e_assign
  assign CPU_jtag_debug_module_chosen_master_rot_left = (CPU_jtag_debug_module_arb_winner << 1) ? (CPU_jtag_debug_module_arb_winner << 1) : 1;

  //CPU/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_arb_addend <= 1;
      else if (|CPU_jtag_debug_module_grant_vector)
          CPU_jtag_debug_module_arb_addend <= CPU_jtag_debug_module_end_xfer? CPU_jtag_debug_module_chosen_master_rot_left : CPU_jtag_debug_module_grant_vector;
    end


  assign CPU_jtag_debug_module_begintransfer = CPU_jtag_debug_module_begins_xfer;
  //assign CPU_jtag_debug_module_resetrequest_from_sa = CPU_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign CPU_jtag_debug_module_resetrequest_from_sa = CPU_jtag_debug_module_resetrequest;

  assign CPU_jtag_debug_module_chipselect = CPU_data_master_granted_CPU_jtag_debug_module | CPU_instruction_master_granted_CPU_jtag_debug_module;
  //CPU_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign CPU_jtag_debug_module_firsttransfer = CPU_jtag_debug_module_begins_xfer ? CPU_jtag_debug_module_unreg_firsttransfer : CPU_jtag_debug_module_reg_firsttransfer;

  //CPU_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign CPU_jtag_debug_module_unreg_firsttransfer = ~(CPU_jtag_debug_module_slavearbiterlockenable & CPU_jtag_debug_module_any_continuerequest);

  //CPU_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (CPU_jtag_debug_module_begins_xfer)
          CPU_jtag_debug_module_reg_firsttransfer <= CPU_jtag_debug_module_unreg_firsttransfer;
    end


  //CPU_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign CPU_jtag_debug_module_beginbursttransfer_internal = CPU_jtag_debug_module_begins_xfer;

  //CPU_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign CPU_jtag_debug_module_arbitration_holdoff_internal = CPU_jtag_debug_module_begins_xfer & CPU_jtag_debug_module_firsttransfer;

  //CPU_jtag_debug_module_write assignment, which is an e_mux
  assign CPU_jtag_debug_module_write = CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_write;

  assign shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master = CPU_data_master_address_to_slave;
  //CPU_jtag_debug_module_address mux, which is an e_mux
  assign CPU_jtag_debug_module_address = (CPU_data_master_granted_CPU_jtag_debug_module)? (shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master >> 2) :
    (shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master >> 2);

  assign shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master = CPU_instruction_master_address_to_slave;
  //d1_CPU_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_CPU_jtag_debug_module_end_xfer <= 1;
      else 
        d1_CPU_jtag_debug_module_end_xfer <= CPU_jtag_debug_module_end_xfer;
    end


  //CPU_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign CPU_jtag_debug_module_waits_for_read = CPU_jtag_debug_module_in_a_read_cycle & CPU_jtag_debug_module_begins_xfer;

  //CPU_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign CPU_jtag_debug_module_in_a_read_cycle = (CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_read) | (CPU_instruction_master_granted_CPU_jtag_debug_module & CPU_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = CPU_jtag_debug_module_in_a_read_cycle;

  //CPU_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign CPU_jtag_debug_module_waits_for_write = CPU_jtag_debug_module_in_a_write_cycle & 0;

  //CPU_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign CPU_jtag_debug_module_in_a_write_cycle = CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = CPU_jtag_debug_module_in_a_write_cycle;

  assign wait_for_CPU_jtag_debug_module_counter = 0;
  //CPU_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign CPU_jtag_debug_module_byteenable = (CPU_data_master_granted_CPU_jtag_debug_module)? CPU_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign CPU_jtag_debug_module_debugaccess = (CPU_data_master_granted_CPU_jtag_debug_module)? CPU_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //CPU/jtag_debug_module enable non-zero assertions, which is an e_register
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
      if (CPU_data_master_granted_CPU_jtag_debug_module + CPU_instruction_master_granted_CPU_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_CPU_jtag_debug_module + CPU_instruction_master_saved_grant_CPU_jtag_debug_module > 1)
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

module CPU_custom_instruction_master_arbitrator (
                                                  // inputs:
                                                   CPU_custom_instruction_master_multi_start,
                                                   CPU_fpoint_s1_done_from_sa,
                                                   CPU_fpoint_s1_result_from_sa,
                                                   clk,
                                                   reset_n,

                                                  // outputs:
                                                   CPU_custom_instruction_master_multi_done,
                                                   CPU_custom_instruction_master_multi_result,
                                                   CPU_custom_instruction_master_reset_n,
                                                   CPU_custom_instruction_master_start_CPU_fpoint_s1,
                                                   CPU_fpoint_s1_select
                                                )
;

  output           CPU_custom_instruction_master_multi_done;
  output  [ 31: 0] CPU_custom_instruction_master_multi_result;
  output           CPU_custom_instruction_master_reset_n;
  output           CPU_custom_instruction_master_start_CPU_fpoint_s1;
  output           CPU_fpoint_s1_select;
  input            CPU_custom_instruction_master_multi_start;
  input            CPU_fpoint_s1_done_from_sa;
  input   [ 31: 0] CPU_fpoint_s1_result_from_sa;
  input            clk;
  input            reset_n;

  wire             CPU_custom_instruction_master_multi_done;
  wire    [ 31: 0] CPU_custom_instruction_master_multi_result;
  wire             CPU_custom_instruction_master_reset_n;
  wire             CPU_custom_instruction_master_start_CPU_fpoint_s1;
  wire             CPU_fpoint_s1_select;
  assign CPU_fpoint_s1_select = 1'b1;
  assign CPU_custom_instruction_master_start_CPU_fpoint_s1 = CPU_fpoint_s1_select & CPU_custom_instruction_master_multi_start;
  //CPU_custom_instruction_master_multi_result mux, which is an e_mux
  assign CPU_custom_instruction_master_multi_result = {32 {CPU_fpoint_s1_select}} & CPU_fpoint_s1_result_from_sa;

  //multi_done mux, which is an e_mux
  assign CPU_custom_instruction_master_multi_done = {1 {CPU_fpoint_s1_select}} & CPU_fpoint_s1_done_from_sa;

  //CPU_custom_instruction_master_reset_n local reset_n, which is an e_assign
  assign CPU_custom_instruction_master_reset_n = reset_n;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module CPU_data_master_arbitrator (
                                    // inputs:
                                     AV_Config_avalon_av_config_slave_readdata_from_sa,
                                     AV_Config_avalon_av_config_slave_waitrequest_from_sa,
                                     Audio_avalon_audio_slave_irq_from_sa,
                                     Audio_avalon_audio_slave_readdata_from_sa,
                                     CPU_data_master_address,
                                     CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave,
                                     CPU_data_master_byteenable_SDRAM_s1,
                                     CPU_data_master_byteenable_SRAM_avalon_sram_slave,
                                     CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave,
                                     CPU_data_master_byteenable_nios_system_clock_0_in,
                                     CPU_data_master_granted_AV_Config_avalon_av_config_slave,
                                     CPU_data_master_granted_Audio_avalon_audio_slave,
                                     CPU_data_master_granted_CPU_jtag_debug_module,
                                     CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave,
                                     CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave,
                                     CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave,
                                     CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave,
                                     CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave,
                                     CPU_data_master_granted_Interval_Timer_s1,
                                     CPU_data_master_granted_JTAG_UART_avalon_jtag_slave,
                                     CPU_data_master_granted_PS2_Port_avalon_ps2_slave,
                                     CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave,
                                     CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_granted_SDRAM_s1,
                                     CPU_data_master_granted_SRAM_avalon_sram_slave,
                                     CPU_data_master_granted_Serial_Port_avalon_rs232_slave,
                                     CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave,
                                     CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave,
                                     CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave,
                                     CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave,
                                     CPU_data_master_granted_nios_system_clock_0_in,
                                     CPU_data_master_granted_sysid_control_slave,
                                     CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave,
                                     CPU_data_master_qualified_request_Audio_avalon_audio_slave,
                                     CPU_data_master_qualified_request_CPU_jtag_debug_module,
                                     CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave,
                                     CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_Interval_Timer_s1,
                                     CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave,
                                     CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave,
                                     CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_SDRAM_s1,
                                     CPU_data_master_qualified_request_SRAM_avalon_sram_slave,
                                     CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave,
                                     CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave,
                                     CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave,
                                     CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave,
                                     CPU_data_master_qualified_request_nios_system_clock_0_in,
                                     CPU_data_master_qualified_request_sysid_control_slave,
                                     CPU_data_master_read,
                                     CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave,
                                     CPU_data_master_read_data_valid_Audio_avalon_audio_slave,
                                     CPU_data_master_read_data_valid_CPU_jtag_debug_module,
                                     CPU_data_master_read_data_valid_Char_LCD_16x2_avalon_lcd_slave,
                                     CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_Interval_Timer_s1,
                                     CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave,
                                     CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave,
                                     CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_SDRAM_s1,
                                     CPU_data_master_read_data_valid_SDRAM_s1_shift_register,
                                     CPU_data_master_read_data_valid_SRAM_avalon_sram_slave,
                                     CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register,
                                     CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave,
                                     CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave,
                                     CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave,
                                     CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave,
                                     CPU_data_master_read_data_valid_nios_system_clock_0_in,
                                     CPU_data_master_read_data_valid_sysid_control_slave,
                                     CPU_data_master_requests_AV_Config_avalon_av_config_slave,
                                     CPU_data_master_requests_Audio_avalon_audio_slave,
                                     CPU_data_master_requests_CPU_jtag_debug_module,
                                     CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave,
                                     CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave,
                                     CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave,
                                     CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave,
                                     CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave,
                                     CPU_data_master_requests_Interval_Timer_s1,
                                     CPU_data_master_requests_JTAG_UART_avalon_jtag_slave,
                                     CPU_data_master_requests_PS2_Port_avalon_ps2_slave,
                                     CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave,
                                     CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_requests_SDRAM_s1,
                                     CPU_data_master_requests_SRAM_avalon_sram_slave,
                                     CPU_data_master_requests_Serial_Port_avalon_rs232_slave,
                                     CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave,
                                     CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave,
                                     CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave,
                                     CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave,
                                     CPU_data_master_requests_nios_system_clock_0_in,
                                     CPU_data_master_requests_sysid_control_slave,
                                     CPU_data_master_write,
                                     CPU_data_master_writedata,
                                     CPU_jtag_debug_module_readdata_from_sa,
                                     Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa,
                                     Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa,
                                     Expansion_JP1_avalon_parallel_port_slave_irq_from_sa,
                                     Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa,
                                     Expansion_JP2_avalon_parallel_port_slave_irq_from_sa,
                                     Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa,
                                     Green_LEDs_avalon_parallel_port_slave_readdata_from_sa,
                                     HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa,
                                     HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa,
                                     Interval_Timer_s1_irq_from_sa,
                                     Interval_Timer_s1_readdata_from_sa,
                                     JTAG_UART_avalon_jtag_slave_irq_from_sa,
                                     JTAG_UART_avalon_jtag_slave_readdata_from_sa,
                                     JTAG_UART_avalon_jtag_slave_waitrequest_from_sa,
                                     PS2_Port_avalon_ps2_slave_irq_from_sa,
                                     PS2_Port_avalon_ps2_slave_readdata_from_sa,
                                     PS2_Port_avalon_ps2_slave_waitrequest_from_sa,
                                     Pushbuttons_avalon_parallel_port_slave_irq_from_sa,
                                     Pushbuttons_avalon_parallel_port_slave_readdata_from_sa,
                                     Red_LEDs_avalon_parallel_port_slave_readdata_from_sa,
                                     SDRAM_s1_readdata_from_sa,
                                     SDRAM_s1_waitrequest_from_sa,
                                     SRAM_avalon_sram_slave_readdata_from_sa,
                                     Serial_Port_avalon_rs232_slave_irq_from_sa,
                                     Serial_Port_avalon_rs232_slave_readdata_from_sa,
                                     Slider_Switches_avalon_parallel_port_slave_readdata_from_sa,
                                     VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa,
                                     VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa,
                                     VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa,
                                     VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa,
                                     clk,
                                     d1_AV_Config_avalon_av_config_slave_end_xfer,
                                     d1_Audio_avalon_audio_slave_end_xfer,
                                     d1_CPU_jtag_debug_module_end_xfer,
                                     d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer,
                                     d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer,
                                     d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer,
                                     d1_Green_LEDs_avalon_parallel_port_slave_end_xfer,
                                     d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer,
                                     d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer,
                                     d1_Interval_Timer_s1_end_xfer,
                                     d1_JTAG_UART_avalon_jtag_slave_end_xfer,
                                     d1_PS2_Port_avalon_ps2_slave_end_xfer,
                                     d1_Pushbuttons_avalon_parallel_port_slave_end_xfer,
                                     d1_Red_LEDs_avalon_parallel_port_slave_end_xfer,
                                     d1_SDRAM_s1_end_xfer,
                                     d1_SRAM_avalon_sram_slave_end_xfer,
                                     d1_Serial_Port_avalon_rs232_slave_end_xfer,
                                     d1_Slider_Switches_avalon_parallel_port_slave_end_xfer,
                                     d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer,
                                     d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer,
                                     d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer,
                                     d1_nios_system_clock_0_in_end_xfer,
                                     d1_sysid_control_slave_end_xfer,
                                     nios_system_clock_0_in_readdata_from_sa,
                                     nios_system_clock_0_in_waitrequest_from_sa,
                                     registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave,
                                     registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave,
                                     registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave,
                                     registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave,
                                     registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave,
                                     registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave,
                                     registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave,
                                     reset_n,
                                     sysid_control_slave_readdata_from_sa,

                                    // outputs:
                                     CPU_data_master_address_to_slave,
                                     CPU_data_master_dbs_address,
                                     CPU_data_master_dbs_write_16,
                                     CPU_data_master_dbs_write_8,
                                     CPU_data_master_irq,
                                     CPU_data_master_no_byte_enables_and_last_term,
                                     CPU_data_master_readdata,
                                     CPU_data_master_waitrequest
                                  )
;

  output  [ 28: 0] CPU_data_master_address_to_slave;
  output  [  1: 0] CPU_data_master_dbs_address;
  output  [ 15: 0] CPU_data_master_dbs_write_16;
  output  [  7: 0] CPU_data_master_dbs_write_8;
  output  [ 31: 0] CPU_data_master_irq;
  output           CPU_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] CPU_data_master_readdata;
  output           CPU_data_master_waitrequest;
  input   [ 31: 0] AV_Config_avalon_av_config_slave_readdata_from_sa;
  input            AV_Config_avalon_av_config_slave_waitrequest_from_sa;
  input            Audio_avalon_audio_slave_irq_from_sa;
  input   [ 31: 0] Audio_avalon_audio_slave_readdata_from_sa;
  input   [ 28: 0] CPU_data_master_address;
  input            CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave;
  input   [  1: 0] CPU_data_master_byteenable_SDRAM_s1;
  input   [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave;
  input            CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave;
  input            CPU_data_master_byteenable_nios_system_clock_0_in;
  input            CPU_data_master_granted_AV_Config_avalon_av_config_slave;
  input            CPU_data_master_granted_Audio_avalon_audio_slave;
  input            CPU_data_master_granted_CPU_jtag_debug_module;
  input            CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave;
  input            CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave;
  input            CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave;
  input            CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave;
  input            CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave;
  input            CPU_data_master_granted_Interval_Timer_s1;
  input            CPU_data_master_granted_JTAG_UART_avalon_jtag_slave;
  input            CPU_data_master_granted_PS2_Port_avalon_ps2_slave;
  input            CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave;
  input            CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_granted_SDRAM_s1;
  input            CPU_data_master_granted_SRAM_avalon_sram_slave;
  input            CPU_data_master_granted_Serial_Port_avalon_rs232_slave;
  input            CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave;
  input            CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave;
  input            CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave;
  input            CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave;
  input            CPU_data_master_granted_nios_system_clock_0_in;
  input            CPU_data_master_granted_sysid_control_slave;
  input            CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave;
  input            CPU_data_master_qualified_request_Audio_avalon_audio_slave;
  input            CPU_data_master_qualified_request_CPU_jtag_debug_module;
  input            CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave;
  input            CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_Interval_Timer_s1;
  input            CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave;
  input            CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave;
  input            CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_SDRAM_s1;
  input            CPU_data_master_qualified_request_SRAM_avalon_sram_slave;
  input            CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave;
  input            CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave;
  input            CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave;
  input            CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave;
  input            CPU_data_master_qualified_request_nios_system_clock_0_in;
  input            CPU_data_master_qualified_request_sysid_control_slave;
  input            CPU_data_master_read;
  input            CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave;
  input            CPU_data_master_read_data_valid_Audio_avalon_audio_slave;
  input            CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  input            CPU_data_master_read_data_valid_Char_LCD_16x2_avalon_lcd_slave;
  input            CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_Interval_Timer_s1;
  input            CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave;
  input            CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave;
  input            CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_SDRAM_s1;
  input            CPU_data_master_read_data_valid_SDRAM_s1_shift_register;
  input            CPU_data_master_read_data_valid_SRAM_avalon_sram_slave;
  input            CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  input            CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave;
  input            CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave;
  input            CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave;
  input            CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave;
  input            CPU_data_master_read_data_valid_nios_system_clock_0_in;
  input            CPU_data_master_read_data_valid_sysid_control_slave;
  input            CPU_data_master_requests_AV_Config_avalon_av_config_slave;
  input            CPU_data_master_requests_Audio_avalon_audio_slave;
  input            CPU_data_master_requests_CPU_jtag_debug_module;
  input            CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave;
  input            CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;
  input            CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;
  input            CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;
  input            CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;
  input            CPU_data_master_requests_Interval_Timer_s1;
  input            CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;
  input            CPU_data_master_requests_PS2_Port_avalon_ps2_slave;
  input            CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;
  input            CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_requests_SDRAM_s1;
  input            CPU_data_master_requests_SRAM_avalon_sram_slave;
  input            CPU_data_master_requests_Serial_Port_avalon_rs232_slave;
  input            CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave;
  input            CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave;
  input            CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave;
  input            CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave;
  input            CPU_data_master_requests_nios_system_clock_0_in;
  input            CPU_data_master_requests_sysid_control_slave;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  input   [  7: 0] Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa;
  input            Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa;
  input            Expansion_JP1_avalon_parallel_port_slave_irq_from_sa;
  input   [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa;
  input            Expansion_JP2_avalon_parallel_port_slave_irq_from_sa;
  input   [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa;
  input   [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  input   [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa;
  input   [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa;
  input            Interval_Timer_s1_irq_from_sa;
  input   [ 15: 0] Interval_Timer_s1_readdata_from_sa;
  input            JTAG_UART_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata_from_sa;
  input            JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;
  input            PS2_Port_avalon_ps2_slave_irq_from_sa;
  input   [ 31: 0] PS2_Port_avalon_ps2_slave_readdata_from_sa;
  input            PS2_Port_avalon_ps2_slave_waitrequest_from_sa;
  input            Pushbuttons_avalon_parallel_port_slave_irq_from_sa;
  input   [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata_from_sa;
  input   [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  input   [ 15: 0] SDRAM_s1_readdata_from_sa;
  input            SDRAM_s1_waitrequest_from_sa;
  input   [ 15: 0] SRAM_avalon_sram_slave_readdata_from_sa;
  input            Serial_Port_avalon_rs232_slave_irq_from_sa;
  input   [ 31: 0] Serial_Port_avalon_rs232_slave_readdata_from_sa;
  input   [ 31: 0] Slider_Switches_avalon_parallel_port_slave_readdata_from_sa;
  input   [  7: 0] VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa;
  input            VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa;
  input   [ 31: 0] VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa;
  input   [ 31: 0] VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa;
  input            clk;
  input            d1_AV_Config_avalon_av_config_slave_end_xfer;
  input            d1_Audio_avalon_audio_slave_end_xfer;
  input            d1_CPU_jtag_debug_module_end_xfer;
  input            d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer;
  input            d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer;
  input            d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer;
  input            d1_Green_LEDs_avalon_parallel_port_slave_end_xfer;
  input            d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
  input            d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
  input            d1_Interval_Timer_s1_end_xfer;
  input            d1_JTAG_UART_avalon_jtag_slave_end_xfer;
  input            d1_PS2_Port_avalon_ps2_slave_end_xfer;
  input            d1_Pushbuttons_avalon_parallel_port_slave_end_xfer;
  input            d1_Red_LEDs_avalon_parallel_port_slave_end_xfer;
  input            d1_SDRAM_s1_end_xfer;
  input            d1_SRAM_avalon_sram_slave_end_xfer;
  input            d1_Serial_Port_avalon_rs232_slave_end_xfer;
  input            d1_Slider_Switches_avalon_parallel_port_slave_end_xfer;
  input            d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer;
  input            d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer;
  input            d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer;
  input            d1_nios_system_clock_0_in_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input   [  7: 0] nios_system_clock_0_in_readdata_from_sa;
  input            nios_system_clock_0_in_waitrequest_from_sa;
  input            registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave;
  input            registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave;
  input            registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave;
  input            registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave;
  input            registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave;
  input            registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave;
  input            registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;

  wire    [ 28: 0] CPU_data_master_address_to_slave;
  reg     [  1: 0] CPU_data_master_dbs_address;
  wire    [  1: 0] CPU_data_master_dbs_increment;
  wire    [ 15: 0] CPU_data_master_dbs_write_16;
  wire    [  7: 0] CPU_data_master_dbs_write_8;
  wire    [ 31: 0] CPU_data_master_irq;
  reg              CPU_data_master_no_byte_enables_and_last_term;
  wire    [ 31: 0] CPU_data_master_readdata;
  wire             CPU_data_master_run;
  reg              CPU_data_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_1;
  reg     [  7: 0] dbs_8_reg_segment_2;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             last_dbs_term_and_run;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_8_reg_segment_2;
  wire    [ 31: 0] p1_registered_CPU_data_master_readdata;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  wire             r_4;
  reg     [ 31: 0] registered_CPU_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave | registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave | ~CPU_data_master_requests_AV_Config_avalon_av_config_slave) & ((~CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~AV_Config_avalon_av_config_slave_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Audio_avalon_audio_slave | registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave | ~CPU_data_master_requests_Audio_avalon_audio_slave) & ((~CPU_data_master_qualified_request_Audio_avalon_audio_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Audio_avalon_audio_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_requests_CPU_jtag_debug_module) & (CPU_data_master_granted_CPU_jtag_debug_module | ~CPU_data_master_qualified_request_CPU_jtag_debug_module) & ((~CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_read | (1 & 1 & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & ((CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave | ((CPU_data_master_write & !CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave & CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0])) | ~CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave)) & ((~CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave | ~CPU_data_master_read | (1 & ~Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa & (CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0]) & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave | ~CPU_data_master_write | (1 & ~Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa & (CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0]) & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave | ~CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign CPU_data_master_run = r_0 & r_1 & r_2 & r_3 & r_4;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave | ~CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave | ~CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave | ~CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave | ~CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Interval_Timer_s1 | ~CPU_data_master_requests_Interval_Timer_s1) & ((~CPU_data_master_qualified_request_Interval_Timer_s1 | ~CPU_data_master_read | (1 & 1 & CPU_data_master_read)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~CPU_data_master_qualified_request_Interval_Timer_s1 | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave | ~CPU_data_master_requests_JTAG_UART_avalon_jtag_slave) & ((~CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~JTAG_UART_avalon_jtag_slave_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & ((~CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~JTAG_UART_avalon_jtag_slave_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave | registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave | ~CPU_data_master_requests_PS2_Port_avalon_ps2_slave) & ((~CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~PS2_Port_avalon_ps2_slave_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave | ~CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave | ~CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_SDRAM_s1 | (CPU_data_master_read_data_valid_SDRAM_s1 & CPU_data_master_dbs_address[1]) | (CPU_data_master_write & !CPU_data_master_byteenable_SDRAM_s1 & CPU_data_master_dbs_address[1]) | ~CPU_data_master_requests_SDRAM_s1) & (CPU_data_master_granted_SDRAM_s1 | ~CPU_data_master_qualified_request_SDRAM_s1);

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = ((~CPU_data_master_qualified_request_SDRAM_s1 | ~CPU_data_master_read | (CPU_data_master_read_data_valid_SDRAM_s1 & (CPU_data_master_dbs_address[1]) & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_SDRAM_s1 | ~CPU_data_master_write | (1 & ~SDRAM_s1_waitrequest_from_sa & (CPU_data_master_dbs_address[1]) & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_SRAM_avalon_sram_slave | (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave & CPU_data_master_dbs_address[1]) | (CPU_data_master_write & !CPU_data_master_byteenable_SRAM_avalon_sram_slave & CPU_data_master_dbs_address[1]) | ~CPU_data_master_requests_SRAM_avalon_sram_slave) & (CPU_data_master_granted_SRAM_avalon_sram_slave | ~CPU_data_master_qualified_request_SRAM_avalon_sram_slave) & ((~CPU_data_master_qualified_request_SRAM_avalon_sram_slave | ~CPU_data_master_read | (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave & (CPU_data_master_dbs_address[1]) & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_SRAM_avalon_sram_slave | ~CPU_data_master_write | (1 & (CPU_data_master_dbs_address[1]) & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave | registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave | ~CPU_data_master_requests_Serial_Port_avalon_rs232_slave) & ((~CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave | ~CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & ((CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave | (registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave & CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0]) | ((CPU_data_master_write & !CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave & CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0])) | ~CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave)) & ((~CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave & (CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0]) & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave | ~CPU_data_master_write | (1 & ~VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa & (CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0]) & CPU_data_master_write))) & 1;

  //r_4 master_run cascaded wait assignment, which is an e_assign
  assign r_4 = (CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave | registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave | ~CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave) & ((~CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave | registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave | ~CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave) & ((~CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & ((CPU_data_master_qualified_request_nios_system_clock_0_in | ((CPU_data_master_write & !CPU_data_master_byteenable_nios_system_clock_0_in & CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0])) | ~CPU_data_master_requests_nios_system_clock_0_in)) & ((~CPU_data_master_qualified_request_nios_system_clock_0_in | ~CPU_data_master_read | (1 & ~nios_system_clock_0_in_waitrequest_from_sa & (CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0]) & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_nios_system_clock_0_in | ~CPU_data_master_write | (1 & ~nios_system_clock_0_in_waitrequest_from_sa & (CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0]) & CPU_data_master_write))) & 1 & ((~CPU_data_master_qualified_request_sysid_control_slave | ~CPU_data_master_read | (1 & 1 & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_sysid_control_slave | ~CPU_data_master_write | (1 & CPU_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign CPU_data_master_address_to_slave = {CPU_data_master_address[28 : 27],
    1'b0,
    CPU_data_master_address[25 : 24],
    1'b0,
    CPU_data_master_address[22 : 0]};

  //CPU/data_master readdata mux, which is an e_mux
  assign CPU_data_master_readdata = ({32 {~CPU_data_master_requests_AV_Config_avalon_av_config_slave}} | AV_Config_avalon_av_config_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Audio_avalon_audio_slave}} | Audio_avalon_audio_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_CPU_jtag_debug_module}} | CPU_jtag_debug_module_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave}} | registered_CPU_data_master_readdata) &
    ({32 {~CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave}} | Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave}} | Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave}} | Green_LEDs_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave}} | HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave}} | HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Interval_Timer_s1}} | Interval_Timer_s1_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_JTAG_UART_avalon_jtag_slave}} | registered_CPU_data_master_readdata) &
    ({32 {~CPU_data_master_requests_PS2_Port_avalon_ps2_slave}} | PS2_Port_avalon_ps2_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave}} | Pushbuttons_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave}} | Red_LEDs_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_SDRAM_s1}} | registered_CPU_data_master_readdata) &
    ({32 {~CPU_data_master_requests_SRAM_avalon_sram_slave}} | registered_CPU_data_master_readdata) &
    ({32 {~CPU_data_master_requests_Serial_Port_avalon_rs232_slave}} | Serial_Port_avalon_rs232_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave}} | Slider_Switches_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave}} | {VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa[7 : 0],
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0}) &
    ({32 {~CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave}} | VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave}} | VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_nios_system_clock_0_in}} | registered_CPU_data_master_readdata) &
    ({32 {~CPU_data_master_requests_sysid_control_slave}} | sysid_control_slave_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_waitrequest <= ~0;
      else 
        CPU_data_master_waitrequest <= ~((~(CPU_data_master_read | CPU_data_master_write))? 0: (CPU_data_master_run & CPU_data_master_waitrequest));
    end


  //irq assign, which is an e_assign
  assign CPU_data_master_irq = {1'b0,
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
    Expansion_JP2_avalon_parallel_port_slave_irq_from_sa,
    Expansion_JP1_avalon_parallel_port_slave_irq_from_sa,
    Serial_Port_avalon_rs232_slave_irq_from_sa,
    1'b0,
    JTAG_UART_avalon_jtag_slave_irq_from_sa,
    PS2_Port_avalon_ps2_slave_irq_from_sa,
    Audio_avalon_audio_slave_irq_from_sa,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    Pushbuttons_avalon_parallel_port_slave_irq_from_sa,
    Interval_Timer_s1_irq_from_sa};

  //no_byte_enables_and_last_term, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_no_byte_enables_and_last_term <= 0;
      else 
        CPU_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end


  //compute the last dbs term, which is an e_mux
  assign last_dbs_term_and_run = (CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave)? (((CPU_data_master_dbs_address == 2'b11) & CPU_data_master_write & !CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave)) :
    (CPU_data_master_requests_SDRAM_s1)? (((CPU_data_master_dbs_address == 2'b10) & CPU_data_master_write & !CPU_data_master_byteenable_SDRAM_s1)) :
    (CPU_data_master_requests_SRAM_avalon_sram_slave)? (((CPU_data_master_dbs_address == 2'b10) & CPU_data_master_write & !CPU_data_master_byteenable_SRAM_avalon_sram_slave)) :
    (CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave)? (((CPU_data_master_dbs_address == 2'b11) & CPU_data_master_write & !CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave)) :
    (((CPU_data_master_dbs_address == 2'b11) & CPU_data_master_write & !CPU_data_master_byteenable_nios_system_clock_0_in));

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~CPU_data_master_no_byte_enables_and_last_term) & CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave & CPU_data_master_write & !CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave)) |
    (CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave & CPU_data_master_read & 1 & 1 & ~Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa) |
    (CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave & CPU_data_master_write & 1 & 1 & ~Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa) |
    (((~CPU_data_master_no_byte_enables_and_last_term) & CPU_data_master_requests_SDRAM_s1 & CPU_data_master_write & !CPU_data_master_byteenable_SDRAM_s1)) |
    CPU_data_master_read_data_valid_SDRAM_s1 |
    (CPU_data_master_granted_SDRAM_s1 & CPU_data_master_write & 1 & 1 & ~SDRAM_s1_waitrequest_from_sa) |
    (((~CPU_data_master_no_byte_enables_and_last_term) & CPU_data_master_requests_SRAM_avalon_sram_slave & CPU_data_master_write & !CPU_data_master_byteenable_SRAM_avalon_sram_slave)) |
    CPU_data_master_read_data_valid_SRAM_avalon_sram_slave |
    (CPU_data_master_granted_SRAM_avalon_sram_slave & CPU_data_master_write & 1 & 1) |
    (((~CPU_data_master_no_byte_enables_and_last_term) & CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave & CPU_data_master_write & !CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave)) |
    CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave |
    (CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave & CPU_data_master_write & 1 & 1 & ~VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa) |
    (((~CPU_data_master_no_byte_enables_and_last_term) & CPU_data_master_requests_nios_system_clock_0_in & CPU_data_master_write & !CPU_data_master_byteenable_nios_system_clock_0_in)) |
    (CPU_data_master_granted_nios_system_clock_0_in & CPU_data_master_read & 1 & 1 & ~nios_system_clock_0_in_waitrequest_from_sa) |
    (CPU_data_master_granted_nios_system_clock_0_in & CPU_data_master_write & 1 & 1 & ~nios_system_clock_0_in_waitrequest_from_sa);

  //input to dbs-8 stored 0, which is an e_mux
  assign p1_dbs_8_reg_segment_0 = (CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave)? Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa :
    (CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave)? VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa :
    nios_system_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((CPU_data_master_dbs_address[1 : 0]) == 0))
          dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
    end


  //input to dbs-8 stored 1, which is an e_mux
  assign p1_dbs_8_reg_segment_1 = (CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave)? Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa :
    (CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave)? VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa :
    nios_system_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_1 <= 0;
      else if (dbs_count_enable & ((CPU_data_master_dbs_address[1 : 0]) == 1))
          dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
    end


  //input to dbs-8 stored 2, which is an e_mux
  assign p1_dbs_8_reg_segment_2 = (CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave)? Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa :
    (CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave)? VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa :
    nios_system_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_2 <= 0;
      else if (dbs_count_enable & ((CPU_data_master_dbs_address[1 : 0]) == 2))
          dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
    end


  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_CPU_data_master_readdata <= 0;
      else 
        registered_CPU_data_master_readdata <= p1_registered_CPU_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_CPU_data_master_readdata = ({32 {~CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave}} | {Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa[7 : 0],
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0}) &
    ({32 {~CPU_data_master_requests_JTAG_UART_avalon_jtag_slave}} | JTAG_UART_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_SDRAM_s1}} | {SDRAM_s1_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~CPU_data_master_requests_SRAM_avalon_sram_slave}} | {SRAM_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~CPU_data_master_requests_nios_system_clock_0_in}} | {nios_system_clock_0_in_readdata_from_sa[7 : 0],
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0});

  //mux write dbs 2, which is an e_mux
  assign CPU_data_master_dbs_write_8 = ((CPU_data_master_dbs_address[1 : 0] == 0))? CPU_data_master_writedata[7 : 0] :
    ((CPU_data_master_dbs_address[1 : 0] == 1))? CPU_data_master_writedata[15 : 8] :
    ((CPU_data_master_dbs_address[1 : 0] == 2))? CPU_data_master_writedata[23 : 16] :
    ((CPU_data_master_dbs_address[1 : 0] == 3))? CPU_data_master_writedata[31 : 24] :
    ((CPU_data_master_dbs_address[1 : 0] == 0))? CPU_data_master_writedata[7 : 0] :
    ((CPU_data_master_dbs_address[1 : 0] == 1))? CPU_data_master_writedata[15 : 8] :
    ((CPU_data_master_dbs_address[1 : 0] == 2))? CPU_data_master_writedata[23 : 16] :
    ((CPU_data_master_dbs_address[1 : 0] == 3))? CPU_data_master_writedata[31 : 24] :
    ((CPU_data_master_dbs_address[1 : 0] == 0))? CPU_data_master_writedata[7 : 0] :
    ((CPU_data_master_dbs_address[1 : 0] == 1))? CPU_data_master_writedata[15 : 8] :
    ((CPU_data_master_dbs_address[1 : 0] == 2))? CPU_data_master_writedata[23 : 16] :
    CPU_data_master_writedata[31 : 24];

  //dbs count increment, which is an e_mux
  assign CPU_data_master_dbs_increment = (CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave)? 1 :
    (CPU_data_master_requests_SDRAM_s1)? 2 :
    (CPU_data_master_requests_SRAM_avalon_sram_slave)? 2 :
    (CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave)? 1 :
    (CPU_data_master_requests_nios_system_clock_0_in)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = CPU_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = CPU_data_master_dbs_address + CPU_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable &
    (~(CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave & ~CPU_data_master_waitrequest)) &
    (~(CPU_data_master_requests_SDRAM_s1 & ~CPU_data_master_waitrequest)) &
    (~(CPU_data_master_requests_SRAM_avalon_sram_slave & ~CPU_data_master_waitrequest)) &
    (~(CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave & ~CPU_data_master_waitrequest & CPU_data_master_write)) &
    (~(CPU_data_master_requests_nios_system_clock_0_in & ~CPU_data_master_waitrequest));

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          CPU_data_master_dbs_address <= next_dbs_address;
    end


  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = (CPU_data_master_requests_SDRAM_s1)? SDRAM_s1_readdata_from_sa :
    SRAM_avalon_sram_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((CPU_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign CPU_data_master_dbs_write_16 = (CPU_data_master_dbs_address[1])? CPU_data_master_writedata[31 : 16] :
    (~(CPU_data_master_dbs_address[1]))? CPU_data_master_writedata[15 : 0] :
    (CPU_data_master_dbs_address[1])? CPU_data_master_writedata[31 : 16] :
    CPU_data_master_writedata[15 : 0];


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module CPU_instruction_master_arbitrator (
                                           // inputs:
                                            CPU_instruction_master_address,
                                            CPU_instruction_master_granted_CPU_jtag_debug_module,
                                            CPU_instruction_master_granted_SDRAM_s1,
                                            CPU_instruction_master_qualified_request_CPU_jtag_debug_module,
                                            CPU_instruction_master_qualified_request_SDRAM_s1,
                                            CPU_instruction_master_read,
                                            CPU_instruction_master_read_data_valid_CPU_jtag_debug_module,
                                            CPU_instruction_master_read_data_valid_SDRAM_s1,
                                            CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register,
                                            CPU_instruction_master_requests_CPU_jtag_debug_module,
                                            CPU_instruction_master_requests_SDRAM_s1,
                                            CPU_jtag_debug_module_readdata_from_sa,
                                            SDRAM_s1_readdata_from_sa,
                                            SDRAM_s1_waitrequest_from_sa,
                                            clk,
                                            d1_CPU_jtag_debug_module_end_xfer,
                                            d1_SDRAM_s1_end_xfer,
                                            reset_n,

                                           // outputs:
                                            CPU_instruction_master_address_to_slave,
                                            CPU_instruction_master_dbs_address,
                                            CPU_instruction_master_latency_counter,
                                            CPU_instruction_master_readdata,
                                            CPU_instruction_master_readdatavalid,
                                            CPU_instruction_master_waitrequest
                                         )
;

  output  [ 27: 0] CPU_instruction_master_address_to_slave;
  output  [  1: 0] CPU_instruction_master_dbs_address;
  output           CPU_instruction_master_latency_counter;
  output  [ 31: 0] CPU_instruction_master_readdata;
  output           CPU_instruction_master_readdatavalid;
  output           CPU_instruction_master_waitrequest;
  input   [ 27: 0] CPU_instruction_master_address;
  input            CPU_instruction_master_granted_CPU_jtag_debug_module;
  input            CPU_instruction_master_granted_SDRAM_s1;
  input            CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  input            CPU_instruction_master_qualified_request_SDRAM_s1;
  input            CPU_instruction_master_read;
  input            CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  input            CPU_instruction_master_read_data_valid_SDRAM_s1;
  input            CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register;
  input            CPU_instruction_master_requests_CPU_jtag_debug_module;
  input            CPU_instruction_master_requests_SDRAM_s1;
  input   [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  input   [ 15: 0] SDRAM_s1_readdata_from_sa;
  input            SDRAM_s1_waitrequest_from_sa;
  input            clk;
  input            d1_CPU_jtag_debug_module_end_xfer;
  input            d1_SDRAM_s1_end_xfer;
  input            reset_n;

  reg     [ 27: 0] CPU_instruction_master_address_last_time;
  wire    [ 27: 0] CPU_instruction_master_address_to_slave;
  reg     [  1: 0] CPU_instruction_master_dbs_address;
  wire    [  1: 0] CPU_instruction_master_dbs_increment;
  reg     [  1: 0] CPU_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] CPU_instruction_master_dbs_rdv_counter_inc;
  wire             CPU_instruction_master_is_granted_some_slave;
  reg              CPU_instruction_master_latency_counter;
  wire    [  1: 0] CPU_instruction_master_next_dbs_rdv_counter;
  reg              CPU_instruction_master_read_but_no_slave_selected;
  reg              CPU_instruction_master_read_last_time;
  wire    [ 31: 0] CPU_instruction_master_readdata;
  wire             CPU_instruction_master_readdatavalid;
  wire             CPU_instruction_master_run;
  wire             CPU_instruction_master_waitrequest;
  reg              active_and_waiting_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire             p1_CPU_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_CPU_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_2;
  wire             r_3;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (CPU_instruction_master_qualified_request_CPU_jtag_debug_module | ~CPU_instruction_master_requests_CPU_jtag_debug_module) & (CPU_instruction_master_granted_CPU_jtag_debug_module | ~CPU_instruction_master_qualified_request_CPU_jtag_debug_module) & ((~CPU_instruction_master_qualified_request_CPU_jtag_debug_module | ~CPU_instruction_master_read | (1 & ~d1_CPU_jtag_debug_module_end_xfer & CPU_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign CPU_instruction_master_run = r_0 & r_2 & r_3;

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (CPU_instruction_master_qualified_request_SDRAM_s1 | ~CPU_instruction_master_requests_SDRAM_s1);

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = (CPU_instruction_master_granted_SDRAM_s1 | ~CPU_instruction_master_qualified_request_SDRAM_s1) & ((~CPU_instruction_master_qualified_request_SDRAM_s1 | ~CPU_instruction_master_read | (1 & ~SDRAM_s1_waitrequest_from_sa & (CPU_instruction_master_dbs_address[1]) & CPU_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign CPU_instruction_master_address_to_slave = {CPU_instruction_master_address[27],
    1'b0,
    CPU_instruction_master_address[25],
    2'b0,
    CPU_instruction_master_address[22 : 0]};

  //CPU_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_read_but_no_slave_selected <= 0;
      else 
        CPU_instruction_master_read_but_no_slave_selected <= CPU_instruction_master_read & CPU_instruction_master_run & ~CPU_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign CPU_instruction_master_is_granted_some_slave = CPU_instruction_master_granted_CPU_jtag_debug_module |
    CPU_instruction_master_granted_SDRAM_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_CPU_instruction_master_readdatavalid = CPU_instruction_master_read_data_valid_SDRAM_s1 & dbs_rdv_counter_overflow;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign CPU_instruction_master_readdatavalid = CPU_instruction_master_read_but_no_slave_selected |
    pre_flush_CPU_instruction_master_readdatavalid |
    CPU_instruction_master_read_data_valid_CPU_jtag_debug_module |
    CPU_instruction_master_read_but_no_slave_selected |
    pre_flush_CPU_instruction_master_readdatavalid;

  //CPU/instruction_master readdata mux, which is an e_mux
  assign CPU_instruction_master_readdata = ({32 {~(CPU_instruction_master_qualified_request_CPU_jtag_debug_module & CPU_instruction_master_read)}} | CPU_jtag_debug_module_readdata_from_sa) &
    ({32 {~CPU_instruction_master_read_data_valid_SDRAM_s1}} | {SDRAM_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign CPU_instruction_master_waitrequest = ~CPU_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_latency_counter <= 0;
      else 
        CPU_instruction_master_latency_counter <= p1_CPU_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_CPU_instruction_master_latency_counter = ((CPU_instruction_master_run & CPU_instruction_master_read))? latency_load_value :
    (CPU_instruction_master_latency_counter)? CPU_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = SDRAM_s1_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((CPU_instruction_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign CPU_instruction_master_dbs_increment = (CPU_instruction_master_requests_SDRAM_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = CPU_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = CPU_instruction_master_dbs_address + CPU_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          CPU_instruction_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign CPU_instruction_master_next_dbs_rdv_counter = CPU_instruction_master_dbs_rdv_counter + CPU_instruction_master_dbs_rdv_counter_inc;

  //CPU_instruction_master_rdv_inc_mux, which is an e_mux
  assign CPU_instruction_master_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = CPU_instruction_master_read_data_valid_SDRAM_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          CPU_instruction_master_dbs_rdv_counter <= CPU_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = CPU_instruction_master_dbs_rdv_counter[1] & ~CPU_instruction_master_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = CPU_instruction_master_granted_SDRAM_s1 & CPU_instruction_master_read & 1 & 1 & ~SDRAM_s1_waitrequest_from_sa;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //CPU_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_address_last_time <= 0;
      else 
        CPU_instruction_master_address_last_time <= CPU_instruction_master_address;
    end


  //CPU/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= CPU_instruction_master_waitrequest & (CPU_instruction_master_read);
    end


  //CPU_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_instruction_master_address != CPU_instruction_master_address_last_time))
        begin
          $write("%0d ns: CPU_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //CPU_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_read_last_time <= 0;
      else 
        CPU_instruction_master_read_last_time <= CPU_instruction_master_read;
    end


  //CPU_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_instruction_master_read != CPU_instruction_master_read_last_time))
        begin
          $write("%0d ns: CPU_instruction_master_read did not heed wait!!!", $time);
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

module CPU_fpoint_s1_arbitrator (
                                  // inputs:
                                   CPU_custom_instruction_master_multi_clk_en,
                                   CPU_custom_instruction_master_multi_dataa,
                                   CPU_custom_instruction_master_multi_datab,
                                   CPU_custom_instruction_master_multi_n,
                                   CPU_custom_instruction_master_start_CPU_fpoint_s1,
                                   CPU_fpoint_s1_done,
                                   CPU_fpoint_s1_result,
                                   CPU_fpoint_s1_select,
                                   clk,
                                   reset_n,

                                  // outputs:
                                   CPU_fpoint_s1_clk_en,
                                   CPU_fpoint_s1_dataa,
                                   CPU_fpoint_s1_datab,
                                   CPU_fpoint_s1_done_from_sa,
                                   CPU_fpoint_s1_n,
                                   CPU_fpoint_s1_reset,
                                   CPU_fpoint_s1_result_from_sa,
                                   CPU_fpoint_s1_start
                                )
;

  output           CPU_fpoint_s1_clk_en;
  output  [ 31: 0] CPU_fpoint_s1_dataa;
  output  [ 31: 0] CPU_fpoint_s1_datab;
  output           CPU_fpoint_s1_done_from_sa;
  output  [  1: 0] CPU_fpoint_s1_n;
  output           CPU_fpoint_s1_reset;
  output  [ 31: 0] CPU_fpoint_s1_result_from_sa;
  output           CPU_fpoint_s1_start;
  input            CPU_custom_instruction_master_multi_clk_en;
  input   [ 31: 0] CPU_custom_instruction_master_multi_dataa;
  input   [ 31: 0] CPU_custom_instruction_master_multi_datab;
  input   [  7: 0] CPU_custom_instruction_master_multi_n;
  input            CPU_custom_instruction_master_start_CPU_fpoint_s1;
  input            CPU_fpoint_s1_done;
  input   [ 31: 0] CPU_fpoint_s1_result;
  input            CPU_fpoint_s1_select;
  input            clk;
  input            reset_n;

  wire             CPU_fpoint_s1_clk_en;
  wire    [ 31: 0] CPU_fpoint_s1_dataa;
  wire    [ 31: 0] CPU_fpoint_s1_datab;
  wire             CPU_fpoint_s1_done_from_sa;
  wire    [  1: 0] CPU_fpoint_s1_n;
  wire             CPU_fpoint_s1_reset;
  wire    [ 31: 0] CPU_fpoint_s1_result_from_sa;
  wire             CPU_fpoint_s1_start;
  assign CPU_fpoint_s1_clk_en = CPU_custom_instruction_master_multi_clk_en;
  assign CPU_fpoint_s1_dataa = CPU_custom_instruction_master_multi_dataa;
  assign CPU_fpoint_s1_datab = CPU_custom_instruction_master_multi_datab;
  assign CPU_fpoint_s1_n = CPU_custom_instruction_master_multi_n;
  assign CPU_fpoint_s1_start = CPU_custom_instruction_master_start_CPU_fpoint_s1;
  //assign CPU_fpoint_s1_result_from_sa = CPU_fpoint_s1_result so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign CPU_fpoint_s1_result_from_sa = CPU_fpoint_s1_result;

  //assign CPU_fpoint_s1_done_from_sa = CPU_fpoint_s1_done so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign CPU_fpoint_s1_done_from_sa = CPU_fpoint_s1_done;

  //CPU_fpoint/s1 local reset_n, which is an e_assign
  assign CPU_fpoint_s1_reset = ~reset_n;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Char_LCD_16x2_avalon_lcd_slave_arbitrator (
                                                   // inputs:
                                                    CPU_data_master_address_to_slave,
                                                    CPU_data_master_byteenable,
                                                    CPU_data_master_dbs_address,
                                                    CPU_data_master_dbs_write_8,
                                                    CPU_data_master_no_byte_enables_and_last_term,
                                                    CPU_data_master_read,
                                                    CPU_data_master_waitrequest,
                                                    CPU_data_master_write,
                                                    Char_LCD_16x2_avalon_lcd_slave_readdata,
                                                    Char_LCD_16x2_avalon_lcd_slave_waitrequest,
                                                    clk,
                                                    reset_n,

                                                   // outputs:
                                                    CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave,
                                                    CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave,
                                                    CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave,
                                                    CPU_data_master_read_data_valid_Char_LCD_16x2_avalon_lcd_slave,
                                                    CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave,
                                                    Char_LCD_16x2_avalon_lcd_slave_address,
                                                    Char_LCD_16x2_avalon_lcd_slave_chipselect,
                                                    Char_LCD_16x2_avalon_lcd_slave_read,
                                                    Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa,
                                                    Char_LCD_16x2_avalon_lcd_slave_reset,
                                                    Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa,
                                                    Char_LCD_16x2_avalon_lcd_slave_write,
                                                    Char_LCD_16x2_avalon_lcd_slave_writedata,
                                                    d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer
                                                 )
;

  output           CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave;
  output           CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave;
  output           CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave;
  output           CPU_data_master_read_data_valid_Char_LCD_16x2_avalon_lcd_slave;
  output           CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave;
  output           Char_LCD_16x2_avalon_lcd_slave_address;
  output           Char_LCD_16x2_avalon_lcd_slave_chipselect;
  output           Char_LCD_16x2_avalon_lcd_slave_read;
  output  [  7: 0] Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa;
  output           Char_LCD_16x2_avalon_lcd_slave_reset;
  output           Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa;
  output           Char_LCD_16x2_avalon_lcd_slave_write;
  output  [  7: 0] Char_LCD_16x2_avalon_lcd_slave_writedata;
  output           d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  1: 0] CPU_data_master_dbs_address;
  input   [  7: 0] CPU_data_master_dbs_write_8;
  input            CPU_data_master_no_byte_enables_and_last_term;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [  7: 0] Char_LCD_16x2_avalon_lcd_slave_readdata;
  input            Char_LCD_16x2_avalon_lcd_slave_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave;
  wire             CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_0;
  wire             CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_1;
  wire             CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_2;
  wire             CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_3;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave;
  wire             CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave;
  wire             CPU_data_master_read_data_valid_Char_LCD_16x2_avalon_lcd_slave;
  wire             CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave;
  wire             CPU_data_master_saved_grant_Char_LCD_16x2_avalon_lcd_slave;
  wire             Char_LCD_16x2_avalon_lcd_slave_address;
  wire             Char_LCD_16x2_avalon_lcd_slave_allgrants;
  wire             Char_LCD_16x2_avalon_lcd_slave_allow_new_arb_cycle;
  wire             Char_LCD_16x2_avalon_lcd_slave_any_bursting_master_saved_grant;
  wire             Char_LCD_16x2_avalon_lcd_slave_any_continuerequest;
  wire             Char_LCD_16x2_avalon_lcd_slave_arb_counter_enable;
  reg     [  2: 0] Char_LCD_16x2_avalon_lcd_slave_arb_share_counter;
  wire    [  2: 0] Char_LCD_16x2_avalon_lcd_slave_arb_share_counter_next_value;
  wire    [  2: 0] Char_LCD_16x2_avalon_lcd_slave_arb_share_set_values;
  wire             Char_LCD_16x2_avalon_lcd_slave_beginbursttransfer_internal;
  wire             Char_LCD_16x2_avalon_lcd_slave_begins_xfer;
  wire             Char_LCD_16x2_avalon_lcd_slave_chipselect;
  wire             Char_LCD_16x2_avalon_lcd_slave_end_xfer;
  wire             Char_LCD_16x2_avalon_lcd_slave_firsttransfer;
  wire             Char_LCD_16x2_avalon_lcd_slave_grant_vector;
  wire             Char_LCD_16x2_avalon_lcd_slave_in_a_read_cycle;
  wire             Char_LCD_16x2_avalon_lcd_slave_in_a_write_cycle;
  wire             Char_LCD_16x2_avalon_lcd_slave_master_qreq_vector;
  wire             Char_LCD_16x2_avalon_lcd_slave_non_bursting_master_requests;
  wire             Char_LCD_16x2_avalon_lcd_slave_pretend_byte_enable;
  wire             Char_LCD_16x2_avalon_lcd_slave_read;
  wire    [  7: 0] Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa;
  reg              Char_LCD_16x2_avalon_lcd_slave_reg_firsttransfer;
  wire             Char_LCD_16x2_avalon_lcd_slave_reset;
  reg              Char_LCD_16x2_avalon_lcd_slave_slavearbiterlockenable;
  wire             Char_LCD_16x2_avalon_lcd_slave_slavearbiterlockenable2;
  wire             Char_LCD_16x2_avalon_lcd_slave_unreg_firsttransfer;
  wire             Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa;
  wire             Char_LCD_16x2_avalon_lcd_slave_waits_for_read;
  wire             Char_LCD_16x2_avalon_lcd_slave_waits_for_write;
  wire             Char_LCD_16x2_avalon_lcd_slave_write;
  wire    [  7: 0] Char_LCD_16x2_avalon_lcd_slave_writedata;
  reg              d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Char_LCD_16x2_avalon_lcd_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_Char_LCD_16x2_avalon_lcd_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Char_LCD_16x2_avalon_lcd_slave_end_xfer;
    end


  assign Char_LCD_16x2_avalon_lcd_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave));
  //assign Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa = Char_LCD_16x2_avalon_lcd_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa = Char_LCD_16x2_avalon_lcd_slave_readdata;

  assign CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave = ({CPU_data_master_address_to_slave[28 : 1] , 1'b0} == 29'h10003050) & (CPU_data_master_read | CPU_data_master_write);
  //assign Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa = Char_LCD_16x2_avalon_lcd_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa = Char_LCD_16x2_avalon_lcd_slave_waitrequest;

  //Char_LCD_16x2_avalon_lcd_slave_arb_share_counter set values, which is an e_mux
  assign Char_LCD_16x2_avalon_lcd_slave_arb_share_set_values = (CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave)? 4 :
    1;

  //Char_LCD_16x2_avalon_lcd_slave_non_bursting_master_requests mux, which is an e_mux
  assign Char_LCD_16x2_avalon_lcd_slave_non_bursting_master_requests = CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave;

  //Char_LCD_16x2_avalon_lcd_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Char_LCD_16x2_avalon_lcd_slave_any_bursting_master_saved_grant = 0;

  //Char_LCD_16x2_avalon_lcd_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_arb_share_counter_next_value = Char_LCD_16x2_avalon_lcd_slave_firsttransfer ? (Char_LCD_16x2_avalon_lcd_slave_arb_share_set_values - 1) : |Char_LCD_16x2_avalon_lcd_slave_arb_share_counter ? (Char_LCD_16x2_avalon_lcd_slave_arb_share_counter - 1) : 0;

  //Char_LCD_16x2_avalon_lcd_slave_allgrants all slave grants, which is an e_mux
  assign Char_LCD_16x2_avalon_lcd_slave_allgrants = |Char_LCD_16x2_avalon_lcd_slave_grant_vector;

  //Char_LCD_16x2_avalon_lcd_slave_end_xfer assignment, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_end_xfer = ~(Char_LCD_16x2_avalon_lcd_slave_waits_for_read | Char_LCD_16x2_avalon_lcd_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Char_LCD_16x2_avalon_lcd_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Char_LCD_16x2_avalon_lcd_slave = Char_LCD_16x2_avalon_lcd_slave_end_xfer & (~Char_LCD_16x2_avalon_lcd_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Char_LCD_16x2_avalon_lcd_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Char_LCD_16x2_avalon_lcd_slave & Char_LCD_16x2_avalon_lcd_slave_allgrants) | (end_xfer_arb_share_counter_term_Char_LCD_16x2_avalon_lcd_slave & ~Char_LCD_16x2_avalon_lcd_slave_non_bursting_master_requests);

  //Char_LCD_16x2_avalon_lcd_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Char_LCD_16x2_avalon_lcd_slave_arb_share_counter <= 0;
      else if (Char_LCD_16x2_avalon_lcd_slave_arb_counter_enable)
          Char_LCD_16x2_avalon_lcd_slave_arb_share_counter <= Char_LCD_16x2_avalon_lcd_slave_arb_share_counter_next_value;
    end


  //Char_LCD_16x2_avalon_lcd_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Char_LCD_16x2_avalon_lcd_slave_slavearbiterlockenable <= 0;
      else if ((|Char_LCD_16x2_avalon_lcd_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Char_LCD_16x2_avalon_lcd_slave) | (end_xfer_arb_share_counter_term_Char_LCD_16x2_avalon_lcd_slave & ~Char_LCD_16x2_avalon_lcd_slave_non_bursting_master_requests))
          Char_LCD_16x2_avalon_lcd_slave_slavearbiterlockenable <= |Char_LCD_16x2_avalon_lcd_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Char_LCD_16x2/avalon_lcd_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Char_LCD_16x2_avalon_lcd_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Char_LCD_16x2_avalon_lcd_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_slavearbiterlockenable2 = |Char_LCD_16x2_avalon_lcd_slave_arb_share_counter_next_value;

  //CPU/data_master Char_LCD_16x2/avalon_lcd_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Char_LCD_16x2_avalon_lcd_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Char_LCD_16x2_avalon_lcd_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave = CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave & ~((CPU_data_master_read & (~CPU_data_master_waitrequest)) | ((~CPU_data_master_waitrequest | CPU_data_master_no_byte_enables_and_last_term | !CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave) & CPU_data_master_write));
  //Char_LCD_16x2_avalon_lcd_slave_writedata mux, which is an e_mux
  assign Char_LCD_16x2_avalon_lcd_slave_writedata = CPU_data_master_dbs_write_8;

  //master is always granted when requested
  assign CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave = CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave;

  //CPU/data_master saved-grant Char_LCD_16x2/avalon_lcd_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Char_LCD_16x2_avalon_lcd_slave = CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave;

  //allow new arb cycle for Char_LCD_16x2/avalon_lcd_slave, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Char_LCD_16x2_avalon_lcd_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Char_LCD_16x2_avalon_lcd_slave_master_qreq_vector = 1;

  //~Char_LCD_16x2_avalon_lcd_slave_reset assignment, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_reset = ~reset_n;

  assign Char_LCD_16x2_avalon_lcd_slave_chipselect = CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave;
  //Char_LCD_16x2_avalon_lcd_slave_firsttransfer first transaction, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_firsttransfer = Char_LCD_16x2_avalon_lcd_slave_begins_xfer ? Char_LCD_16x2_avalon_lcd_slave_unreg_firsttransfer : Char_LCD_16x2_avalon_lcd_slave_reg_firsttransfer;

  //Char_LCD_16x2_avalon_lcd_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_unreg_firsttransfer = ~(Char_LCD_16x2_avalon_lcd_slave_slavearbiterlockenable & Char_LCD_16x2_avalon_lcd_slave_any_continuerequest);

  //Char_LCD_16x2_avalon_lcd_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Char_LCD_16x2_avalon_lcd_slave_reg_firsttransfer <= 1'b1;
      else if (Char_LCD_16x2_avalon_lcd_slave_begins_xfer)
          Char_LCD_16x2_avalon_lcd_slave_reg_firsttransfer <= Char_LCD_16x2_avalon_lcd_slave_unreg_firsttransfer;
    end


  //Char_LCD_16x2_avalon_lcd_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_beginbursttransfer_internal = Char_LCD_16x2_avalon_lcd_slave_begins_xfer;

  //Char_LCD_16x2_avalon_lcd_slave_read assignment, which is an e_mux
  assign Char_LCD_16x2_avalon_lcd_slave_read = CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave & CPU_data_master_read;

  //Char_LCD_16x2_avalon_lcd_slave_write assignment, which is an e_mux
  assign Char_LCD_16x2_avalon_lcd_slave_write = ((CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave & CPU_data_master_write)) & Char_LCD_16x2_avalon_lcd_slave_pretend_byte_enable;

  //Char_LCD_16x2_avalon_lcd_slave_address mux, which is an e_mux
  assign Char_LCD_16x2_avalon_lcd_slave_address = {CPU_data_master_address_to_slave >> 2,
    CPU_data_master_dbs_address[1 : 0]};

  //d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer <= 1;
      else 
        d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer <= Char_LCD_16x2_avalon_lcd_slave_end_xfer;
    end


  //Char_LCD_16x2_avalon_lcd_slave_waits_for_read in a cycle, which is an e_mux
  assign Char_LCD_16x2_avalon_lcd_slave_waits_for_read = Char_LCD_16x2_avalon_lcd_slave_in_a_read_cycle & Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa;

  //Char_LCD_16x2_avalon_lcd_slave_in_a_read_cycle assignment, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_in_a_read_cycle = CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Char_LCD_16x2_avalon_lcd_slave_in_a_read_cycle;

  //Char_LCD_16x2_avalon_lcd_slave_waits_for_write in a cycle, which is an e_mux
  assign Char_LCD_16x2_avalon_lcd_slave_waits_for_write = Char_LCD_16x2_avalon_lcd_slave_in_a_write_cycle & Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa;

  //Char_LCD_16x2_avalon_lcd_slave_in_a_write_cycle assignment, which is an e_assign
  assign Char_LCD_16x2_avalon_lcd_slave_in_a_write_cycle = CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Char_LCD_16x2_avalon_lcd_slave_in_a_write_cycle;

  assign wait_for_Char_LCD_16x2_avalon_lcd_slave_counter = 0;
  //Char_LCD_16x2_avalon_lcd_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  assign Char_LCD_16x2_avalon_lcd_slave_pretend_byte_enable = (CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave)? CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave :
    -1;

  assign {CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_3,
CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_2,
CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_1,
CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_0} = CPU_data_master_byteenable;
  assign CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave = ((CPU_data_master_dbs_address[1 : 0] == 0))? CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_0 :
    ((CPU_data_master_dbs_address[1 : 0] == 1))? CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_1 :
    ((CPU_data_master_dbs_address[1 : 0] == 2))? CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_2 :
    CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Char_LCD_16x2/avalon_lcd_slave enable non-zero assertions, which is an e_register
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

module Expansion_JP1_avalon_parallel_port_slave_arbitrator (
                                                             // inputs:
                                                              CPU_data_master_address_to_slave,
                                                              CPU_data_master_byteenable,
                                                              CPU_data_master_read,
                                                              CPU_data_master_waitrequest,
                                                              CPU_data_master_write,
                                                              CPU_data_master_writedata,
                                                              Expansion_JP1_avalon_parallel_port_slave_irq,
                                                              Expansion_JP1_avalon_parallel_port_slave_readdata,
                                                              clk,
                                                              reset_n,

                                                             // outputs:
                                                              CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave,
                                                              CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave,
                                                              CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave,
                                                              CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave,
                                                              Expansion_JP1_avalon_parallel_port_slave_address,
                                                              Expansion_JP1_avalon_parallel_port_slave_byteenable,
                                                              Expansion_JP1_avalon_parallel_port_slave_chipselect,
                                                              Expansion_JP1_avalon_parallel_port_slave_irq_from_sa,
                                                              Expansion_JP1_avalon_parallel_port_slave_read,
                                                              Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa,
                                                              Expansion_JP1_avalon_parallel_port_slave_reset,
                                                              Expansion_JP1_avalon_parallel_port_slave_write,
                                                              Expansion_JP1_avalon_parallel_port_slave_writedata,
                                                              d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer,
                                                              registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave
                                                           )
;

  output           CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;
  output  [  1: 0] Expansion_JP1_avalon_parallel_port_slave_address;
  output  [  3: 0] Expansion_JP1_avalon_parallel_port_slave_byteenable;
  output           Expansion_JP1_avalon_parallel_port_slave_chipselect;
  output           Expansion_JP1_avalon_parallel_port_slave_irq_from_sa;
  output           Expansion_JP1_avalon_parallel_port_slave_read;
  output  [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa;
  output           Expansion_JP1_avalon_parallel_port_slave_reset;
  output           Expansion_JP1_avalon_parallel_port_slave_write;
  output  [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_writedata;
  output           d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Expansion_JP1_avalon_parallel_port_slave_irq;
  input   [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Expansion_JP1_avalon_parallel_port_slave;
  wire    [  1: 0] Expansion_JP1_avalon_parallel_port_slave_address;
  wire             Expansion_JP1_avalon_parallel_port_slave_allgrants;
  wire             Expansion_JP1_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Expansion_JP1_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Expansion_JP1_avalon_parallel_port_slave_any_continuerequest;
  wire             Expansion_JP1_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  2: 0] Expansion_JP1_avalon_parallel_port_slave_arb_share_counter;
  wire    [  2: 0] Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  2: 0] Expansion_JP1_avalon_parallel_port_slave_arb_share_set_values;
  wire             Expansion_JP1_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Expansion_JP1_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Expansion_JP1_avalon_parallel_port_slave_byteenable;
  wire             Expansion_JP1_avalon_parallel_port_slave_chipselect;
  wire             Expansion_JP1_avalon_parallel_port_slave_end_xfer;
  wire             Expansion_JP1_avalon_parallel_port_slave_firsttransfer;
  wire             Expansion_JP1_avalon_parallel_port_slave_grant_vector;
  wire             Expansion_JP1_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Expansion_JP1_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Expansion_JP1_avalon_parallel_port_slave_irq_from_sa;
  wire             Expansion_JP1_avalon_parallel_port_slave_master_qreq_vector;
  wire             Expansion_JP1_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Expansion_JP1_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa;
  reg              Expansion_JP1_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Expansion_JP1_avalon_parallel_port_slave_reset;
  reg              Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Expansion_JP1_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Expansion_JP1_avalon_parallel_port_slave_waits_for_read;
  wire             Expansion_JP1_avalon_parallel_port_slave_waits_for_write;
  wire             Expansion_JP1_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_writedata;
  reg              d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Expansion_JP1_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Expansion_JP1_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Expansion_JP1_avalon_parallel_port_slave_end_xfer;
    end


  assign Expansion_JP1_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave));
  //assign Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa = Expansion_JP1_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa = Expansion_JP1_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000060) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register_in;

  //Expansion_JP1_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Expansion_JP1_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;

  //Expansion_JP1_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value = Expansion_JP1_avalon_parallel_port_slave_firsttransfer ? (Expansion_JP1_avalon_parallel_port_slave_arb_share_set_values - 1) : |Expansion_JP1_avalon_parallel_port_slave_arb_share_counter ? (Expansion_JP1_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Expansion_JP1_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_allgrants = |Expansion_JP1_avalon_parallel_port_slave_grant_vector;

  //Expansion_JP1_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_end_xfer = ~(Expansion_JP1_avalon_parallel_port_slave_waits_for_read | Expansion_JP1_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave = Expansion_JP1_avalon_parallel_port_slave_end_xfer & (~Expansion_JP1_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Expansion_JP1_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave & Expansion_JP1_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave & ~Expansion_JP1_avalon_parallel_port_slave_non_bursting_master_requests);

  //Expansion_JP1_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP1_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Expansion_JP1_avalon_parallel_port_slave_arb_counter_enable)
          Expansion_JP1_avalon_parallel_port_slave_arb_share_counter <= Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Expansion_JP1_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave & ~Expansion_JP1_avalon_parallel_port_slave_non_bursting_master_requests))
          Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable <= |Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Expansion_JP1/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable2 = |Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Expansion_JP1/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Expansion_JP1_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave = CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_read & ~Expansion_JP1_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register;

  //Expansion_JP1_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave = CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Expansion_JP1/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Expansion_JP1_avalon_parallel_port_slave = CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;

  //allow new arb cycle for Expansion_JP1/avalon_parallel_port_slave, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Expansion_JP1_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Expansion_JP1_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Expansion_JP1_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_reset = ~reset_n;

  assign Expansion_JP1_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave;
  //Expansion_JP1_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_firsttransfer = Expansion_JP1_avalon_parallel_port_slave_begins_xfer ? Expansion_JP1_avalon_parallel_port_slave_unreg_firsttransfer : Expansion_JP1_avalon_parallel_port_slave_reg_firsttransfer;

  //Expansion_JP1_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_unreg_firsttransfer = ~(Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable & Expansion_JP1_avalon_parallel_port_slave_any_continuerequest);

  //Expansion_JP1_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP1_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Expansion_JP1_avalon_parallel_port_slave_begins_xfer)
          Expansion_JP1_avalon_parallel_port_slave_reg_firsttransfer <= Expansion_JP1_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Expansion_JP1_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_beginbursttransfer_internal = Expansion_JP1_avalon_parallel_port_slave_begins_xfer;

  //Expansion_JP1_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_read = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_read;

  //Expansion_JP1_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_write = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Expansion_JP1_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Expansion_JP1_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_address = shifted_address_to_Expansion_JP1_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer <= Expansion_JP1_avalon_parallel_port_slave_end_xfer;
    end


  //Expansion_JP1_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_waits_for_read = Expansion_JP1_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Expansion_JP1_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Expansion_JP1_avalon_parallel_port_slave_in_a_read_cycle;

  //Expansion_JP1_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_waits_for_write = Expansion_JP1_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Expansion_JP1_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Expansion_JP1_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Expansion_JP1_avalon_parallel_port_slave_counter = 0;
  //Expansion_JP1_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;

  //assign Expansion_JP1_avalon_parallel_port_slave_irq_from_sa = Expansion_JP1_avalon_parallel_port_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_irq_from_sa = Expansion_JP1_avalon_parallel_port_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Expansion_JP1/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
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

module Expansion_JP2_avalon_parallel_port_slave_arbitrator (
                                                             // inputs:
                                                              CPU_data_master_address_to_slave,
                                                              CPU_data_master_byteenable,
                                                              CPU_data_master_read,
                                                              CPU_data_master_waitrequest,
                                                              CPU_data_master_write,
                                                              CPU_data_master_writedata,
                                                              Expansion_JP2_avalon_parallel_port_slave_irq,
                                                              Expansion_JP2_avalon_parallel_port_slave_readdata,
                                                              clk,
                                                              reset_n,

                                                             // outputs:
                                                              CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave,
                                                              CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave,
                                                              CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave,
                                                              CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave,
                                                              Expansion_JP2_avalon_parallel_port_slave_address,
                                                              Expansion_JP2_avalon_parallel_port_slave_byteenable,
                                                              Expansion_JP2_avalon_parallel_port_slave_chipselect,
                                                              Expansion_JP2_avalon_parallel_port_slave_irq_from_sa,
                                                              Expansion_JP2_avalon_parallel_port_slave_read,
                                                              Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa,
                                                              Expansion_JP2_avalon_parallel_port_slave_reset,
                                                              Expansion_JP2_avalon_parallel_port_slave_write,
                                                              Expansion_JP2_avalon_parallel_port_slave_writedata,
                                                              d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer,
                                                              registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave
                                                           )
;

  output           CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;
  output  [  1: 0] Expansion_JP2_avalon_parallel_port_slave_address;
  output  [  3: 0] Expansion_JP2_avalon_parallel_port_slave_byteenable;
  output           Expansion_JP2_avalon_parallel_port_slave_chipselect;
  output           Expansion_JP2_avalon_parallel_port_slave_irq_from_sa;
  output           Expansion_JP2_avalon_parallel_port_slave_read;
  output  [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa;
  output           Expansion_JP2_avalon_parallel_port_slave_reset;
  output           Expansion_JP2_avalon_parallel_port_slave_write;
  output  [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_writedata;
  output           d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Expansion_JP2_avalon_parallel_port_slave_irq;
  input   [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Expansion_JP2_avalon_parallel_port_slave;
  wire    [  1: 0] Expansion_JP2_avalon_parallel_port_slave_address;
  wire             Expansion_JP2_avalon_parallel_port_slave_allgrants;
  wire             Expansion_JP2_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Expansion_JP2_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Expansion_JP2_avalon_parallel_port_slave_any_continuerequest;
  wire             Expansion_JP2_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  2: 0] Expansion_JP2_avalon_parallel_port_slave_arb_share_counter;
  wire    [  2: 0] Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  2: 0] Expansion_JP2_avalon_parallel_port_slave_arb_share_set_values;
  wire             Expansion_JP2_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Expansion_JP2_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Expansion_JP2_avalon_parallel_port_slave_byteenable;
  wire             Expansion_JP2_avalon_parallel_port_slave_chipselect;
  wire             Expansion_JP2_avalon_parallel_port_slave_end_xfer;
  wire             Expansion_JP2_avalon_parallel_port_slave_firsttransfer;
  wire             Expansion_JP2_avalon_parallel_port_slave_grant_vector;
  wire             Expansion_JP2_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Expansion_JP2_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Expansion_JP2_avalon_parallel_port_slave_irq_from_sa;
  wire             Expansion_JP2_avalon_parallel_port_slave_master_qreq_vector;
  wire             Expansion_JP2_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Expansion_JP2_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa;
  reg              Expansion_JP2_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Expansion_JP2_avalon_parallel_port_slave_reset;
  reg              Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Expansion_JP2_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Expansion_JP2_avalon_parallel_port_slave_waits_for_read;
  wire             Expansion_JP2_avalon_parallel_port_slave_waits_for_write;
  wire             Expansion_JP2_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_writedata;
  reg              d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Expansion_JP2_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Expansion_JP2_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Expansion_JP2_avalon_parallel_port_slave_end_xfer;
    end


  assign Expansion_JP2_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave));
  //assign Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa = Expansion_JP2_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa = Expansion_JP2_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000070) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register_in;

  //Expansion_JP2_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Expansion_JP2_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;

  //Expansion_JP2_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value = Expansion_JP2_avalon_parallel_port_slave_firsttransfer ? (Expansion_JP2_avalon_parallel_port_slave_arb_share_set_values - 1) : |Expansion_JP2_avalon_parallel_port_slave_arb_share_counter ? (Expansion_JP2_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Expansion_JP2_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_allgrants = |Expansion_JP2_avalon_parallel_port_slave_grant_vector;

  //Expansion_JP2_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_end_xfer = ~(Expansion_JP2_avalon_parallel_port_slave_waits_for_read | Expansion_JP2_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave = Expansion_JP2_avalon_parallel_port_slave_end_xfer & (~Expansion_JP2_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Expansion_JP2_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave & Expansion_JP2_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave & ~Expansion_JP2_avalon_parallel_port_slave_non_bursting_master_requests);

  //Expansion_JP2_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP2_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Expansion_JP2_avalon_parallel_port_slave_arb_counter_enable)
          Expansion_JP2_avalon_parallel_port_slave_arb_share_counter <= Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Expansion_JP2_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave & ~Expansion_JP2_avalon_parallel_port_slave_non_bursting_master_requests))
          Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable <= |Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Expansion_JP2/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable2 = |Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Expansion_JP2/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Expansion_JP2_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave = CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_read & ~Expansion_JP2_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register;

  //Expansion_JP2_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave = CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Expansion_JP2/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Expansion_JP2_avalon_parallel_port_slave = CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;

  //allow new arb cycle for Expansion_JP2/avalon_parallel_port_slave, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Expansion_JP2_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Expansion_JP2_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Expansion_JP2_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_reset = ~reset_n;

  assign Expansion_JP2_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave;
  //Expansion_JP2_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_firsttransfer = Expansion_JP2_avalon_parallel_port_slave_begins_xfer ? Expansion_JP2_avalon_parallel_port_slave_unreg_firsttransfer : Expansion_JP2_avalon_parallel_port_slave_reg_firsttransfer;

  //Expansion_JP2_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_unreg_firsttransfer = ~(Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable & Expansion_JP2_avalon_parallel_port_slave_any_continuerequest);

  //Expansion_JP2_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP2_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Expansion_JP2_avalon_parallel_port_slave_begins_xfer)
          Expansion_JP2_avalon_parallel_port_slave_reg_firsttransfer <= Expansion_JP2_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Expansion_JP2_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_beginbursttransfer_internal = Expansion_JP2_avalon_parallel_port_slave_begins_xfer;

  //Expansion_JP2_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_read = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_read;

  //Expansion_JP2_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_write = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Expansion_JP2_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Expansion_JP2_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_address = shifted_address_to_Expansion_JP2_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer <= Expansion_JP2_avalon_parallel_port_slave_end_xfer;
    end


  //Expansion_JP2_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_waits_for_read = Expansion_JP2_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Expansion_JP2_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Expansion_JP2_avalon_parallel_port_slave_in_a_read_cycle;

  //Expansion_JP2_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_waits_for_write = Expansion_JP2_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Expansion_JP2_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Expansion_JP2_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Expansion_JP2_avalon_parallel_port_slave_counter = 0;
  //Expansion_JP2_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;

  //assign Expansion_JP2_avalon_parallel_port_slave_irq_from_sa = Expansion_JP2_avalon_parallel_port_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_irq_from_sa = Expansion_JP2_avalon_parallel_port_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Expansion_JP2/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
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

module External_Clocks_avalon_clocks_slave_arbitrator (
                                                        // inputs:
                                                         External_Clocks_avalon_clocks_slave_readdata,
                                                         clk,
                                                         nios_system_clock_0_out_address_to_slave,
                                                         nios_system_clock_0_out_read,
                                                         nios_system_clock_0_out_write,
                                                         reset_n,

                                                        // outputs:
                                                         External_Clocks_avalon_clocks_slave_address,
                                                         External_Clocks_avalon_clocks_slave_readdata_from_sa,
                                                         d1_External_Clocks_avalon_clocks_slave_end_xfer,
                                                         nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave,
                                                         nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave,
                                                         nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave,
                                                         nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave
                                                      )
;

  output           External_Clocks_avalon_clocks_slave_address;
  output  [  7: 0] External_Clocks_avalon_clocks_slave_readdata_from_sa;
  output           d1_External_Clocks_avalon_clocks_slave_end_xfer;
  output           nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave;
  output           nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave;
  output           nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave;
  output           nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave;
  input   [  7: 0] External_Clocks_avalon_clocks_slave_readdata;
  input            clk;
  input            nios_system_clock_0_out_address_to_slave;
  input            nios_system_clock_0_out_read;
  input            nios_system_clock_0_out_write;
  input            reset_n;

  wire             External_Clocks_avalon_clocks_slave_address;
  wire             External_Clocks_avalon_clocks_slave_allgrants;
  wire             External_Clocks_avalon_clocks_slave_allow_new_arb_cycle;
  wire             External_Clocks_avalon_clocks_slave_any_bursting_master_saved_grant;
  wire             External_Clocks_avalon_clocks_slave_any_continuerequest;
  wire             External_Clocks_avalon_clocks_slave_arb_counter_enable;
  reg              External_Clocks_avalon_clocks_slave_arb_share_counter;
  wire             External_Clocks_avalon_clocks_slave_arb_share_counter_next_value;
  wire             External_Clocks_avalon_clocks_slave_arb_share_set_values;
  wire             External_Clocks_avalon_clocks_slave_beginbursttransfer_internal;
  wire             External_Clocks_avalon_clocks_slave_begins_xfer;
  wire             External_Clocks_avalon_clocks_slave_end_xfer;
  wire             External_Clocks_avalon_clocks_slave_firsttransfer;
  wire             External_Clocks_avalon_clocks_slave_grant_vector;
  wire             External_Clocks_avalon_clocks_slave_in_a_read_cycle;
  wire             External_Clocks_avalon_clocks_slave_in_a_write_cycle;
  wire             External_Clocks_avalon_clocks_slave_master_qreq_vector;
  wire             External_Clocks_avalon_clocks_slave_non_bursting_master_requests;
  wire    [  7: 0] External_Clocks_avalon_clocks_slave_readdata_from_sa;
  reg              External_Clocks_avalon_clocks_slave_reg_firsttransfer;
  reg              External_Clocks_avalon_clocks_slave_slavearbiterlockenable;
  wire             External_Clocks_avalon_clocks_slave_slavearbiterlockenable2;
  wire             External_Clocks_avalon_clocks_slave_unreg_firsttransfer;
  wire             External_Clocks_avalon_clocks_slave_waits_for_read;
  wire             External_Clocks_avalon_clocks_slave_waits_for_write;
  reg              d1_External_Clocks_avalon_clocks_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_External_Clocks_avalon_clocks_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             nios_system_clock_0_out_arbiterlock;
  wire             nios_system_clock_0_out_arbiterlock2;
  wire             nios_system_clock_0_out_continuerequest;
  wire             nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave;
  wire             nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave;
  wire             nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave;
  reg              nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register;
  wire             nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register_in;
  wire             nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave;
  wire             nios_system_clock_0_out_saved_grant_External_Clocks_avalon_clocks_slave;
  wire             p1_nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register;
  wire             wait_for_External_Clocks_avalon_clocks_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~External_Clocks_avalon_clocks_slave_end_xfer;
    end


  assign External_Clocks_avalon_clocks_slave_begins_xfer = ~d1_reasons_to_wait & ((nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave));
  //assign External_Clocks_avalon_clocks_slave_readdata_from_sa = External_Clocks_avalon_clocks_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_readdata_from_sa = External_Clocks_avalon_clocks_slave_readdata;

  assign nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave = ((1) & (nios_system_clock_0_out_read | nios_system_clock_0_out_write)) & nios_system_clock_0_out_read;
  //External_Clocks_avalon_clocks_slave_arb_share_counter set values, which is an e_mux
  assign External_Clocks_avalon_clocks_slave_arb_share_set_values = 1;

  //External_Clocks_avalon_clocks_slave_non_bursting_master_requests mux, which is an e_mux
  assign External_Clocks_avalon_clocks_slave_non_bursting_master_requests = nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave;

  //External_Clocks_avalon_clocks_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign External_Clocks_avalon_clocks_slave_any_bursting_master_saved_grant = 0;

  //External_Clocks_avalon_clocks_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_arb_share_counter_next_value = External_Clocks_avalon_clocks_slave_firsttransfer ? (External_Clocks_avalon_clocks_slave_arb_share_set_values - 1) : |External_Clocks_avalon_clocks_slave_arb_share_counter ? (External_Clocks_avalon_clocks_slave_arb_share_counter - 1) : 0;

  //External_Clocks_avalon_clocks_slave_allgrants all slave grants, which is an e_mux
  assign External_Clocks_avalon_clocks_slave_allgrants = |External_Clocks_avalon_clocks_slave_grant_vector;

  //External_Clocks_avalon_clocks_slave_end_xfer assignment, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_end_xfer = ~(External_Clocks_avalon_clocks_slave_waits_for_read | External_Clocks_avalon_clocks_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_External_Clocks_avalon_clocks_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_External_Clocks_avalon_clocks_slave = External_Clocks_avalon_clocks_slave_end_xfer & (~External_Clocks_avalon_clocks_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //External_Clocks_avalon_clocks_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_External_Clocks_avalon_clocks_slave & External_Clocks_avalon_clocks_slave_allgrants) | (end_xfer_arb_share_counter_term_External_Clocks_avalon_clocks_slave & ~External_Clocks_avalon_clocks_slave_non_bursting_master_requests);

  //External_Clocks_avalon_clocks_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          External_Clocks_avalon_clocks_slave_arb_share_counter <= 0;
      else if (External_Clocks_avalon_clocks_slave_arb_counter_enable)
          External_Clocks_avalon_clocks_slave_arb_share_counter <= External_Clocks_avalon_clocks_slave_arb_share_counter_next_value;
    end


  //External_Clocks_avalon_clocks_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          External_Clocks_avalon_clocks_slave_slavearbiterlockenable <= 0;
      else if ((|External_Clocks_avalon_clocks_slave_master_qreq_vector & end_xfer_arb_share_counter_term_External_Clocks_avalon_clocks_slave) | (end_xfer_arb_share_counter_term_External_Clocks_avalon_clocks_slave & ~External_Clocks_avalon_clocks_slave_non_bursting_master_requests))
          External_Clocks_avalon_clocks_slave_slavearbiterlockenable <= |External_Clocks_avalon_clocks_slave_arb_share_counter_next_value;
    end


  //nios_system_clock_0/out External_Clocks/avalon_clocks_slave arbiterlock, which is an e_assign
  assign nios_system_clock_0_out_arbiterlock = External_Clocks_avalon_clocks_slave_slavearbiterlockenable & nios_system_clock_0_out_continuerequest;

  //External_Clocks_avalon_clocks_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_slavearbiterlockenable2 = |External_Clocks_avalon_clocks_slave_arb_share_counter_next_value;

  //nios_system_clock_0/out External_Clocks/avalon_clocks_slave arbiterlock2, which is an e_assign
  assign nios_system_clock_0_out_arbiterlock2 = External_Clocks_avalon_clocks_slave_slavearbiterlockenable2 & nios_system_clock_0_out_continuerequest;

  //External_Clocks_avalon_clocks_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_any_continuerequest = 1;

  //nios_system_clock_0_out_continuerequest continued request, which is an e_assign
  assign nios_system_clock_0_out_continuerequest = 1;

  assign nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave = nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave & ~((nios_system_clock_0_out_read & ((|nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register))));
  //nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register_in = nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave & nios_system_clock_0_out_read & ~External_Clocks_avalon_clocks_slave_waits_for_read & ~(|nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register);

  //shift register p1 nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register = {nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register, nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register_in};

  //nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register <= 0;
      else 
        nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register <= p1_nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register;
    end


  //local readdatavalid nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave, which is an e_mux
  assign nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave = nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave_shift_register;

  //master is always granted when requested
  assign nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave = nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave;

  //nios_system_clock_0/out saved-grant External_Clocks/avalon_clocks_slave, which is an e_assign
  assign nios_system_clock_0_out_saved_grant_External_Clocks_avalon_clocks_slave = nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave;

  //allow new arb cycle for External_Clocks/avalon_clocks_slave, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign External_Clocks_avalon_clocks_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign External_Clocks_avalon_clocks_slave_master_qreq_vector = 1;

  //External_Clocks_avalon_clocks_slave_firsttransfer first transaction, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_firsttransfer = External_Clocks_avalon_clocks_slave_begins_xfer ? External_Clocks_avalon_clocks_slave_unreg_firsttransfer : External_Clocks_avalon_clocks_slave_reg_firsttransfer;

  //External_Clocks_avalon_clocks_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_unreg_firsttransfer = ~(External_Clocks_avalon_clocks_slave_slavearbiterlockenable & External_Clocks_avalon_clocks_slave_any_continuerequest);

  //External_Clocks_avalon_clocks_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          External_Clocks_avalon_clocks_slave_reg_firsttransfer <= 1'b1;
      else if (External_Clocks_avalon_clocks_slave_begins_xfer)
          External_Clocks_avalon_clocks_slave_reg_firsttransfer <= External_Clocks_avalon_clocks_slave_unreg_firsttransfer;
    end


  //External_Clocks_avalon_clocks_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_beginbursttransfer_internal = External_Clocks_avalon_clocks_slave_begins_xfer;

  //External_Clocks_avalon_clocks_slave_address mux, which is an e_mux
  assign External_Clocks_avalon_clocks_slave_address = nios_system_clock_0_out_address_to_slave;

  //d1_External_Clocks_avalon_clocks_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_External_Clocks_avalon_clocks_slave_end_xfer <= 1;
      else 
        d1_External_Clocks_avalon_clocks_slave_end_xfer <= External_Clocks_avalon_clocks_slave_end_xfer;
    end


  //External_Clocks_avalon_clocks_slave_waits_for_read in a cycle, which is an e_mux
  assign External_Clocks_avalon_clocks_slave_waits_for_read = External_Clocks_avalon_clocks_slave_in_a_read_cycle & 0;

  //External_Clocks_avalon_clocks_slave_in_a_read_cycle assignment, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_in_a_read_cycle = nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave & nios_system_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = External_Clocks_avalon_clocks_slave_in_a_read_cycle;

  //External_Clocks_avalon_clocks_slave_waits_for_write in a cycle, which is an e_mux
  assign External_Clocks_avalon_clocks_slave_waits_for_write = External_Clocks_avalon_clocks_slave_in_a_write_cycle & 0;

  //External_Clocks_avalon_clocks_slave_in_a_write_cycle assignment, which is an e_assign
  assign External_Clocks_avalon_clocks_slave_in_a_write_cycle = nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave & nios_system_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = External_Clocks_avalon_clocks_slave_in_a_write_cycle;

  assign wait_for_External_Clocks_avalon_clocks_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //External_Clocks/avalon_clocks_slave enable non-zero assertions, which is an e_register
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

module Green_LEDs_avalon_parallel_port_slave_arbitrator (
                                                          // inputs:
                                                           CPU_data_master_address_to_slave,
                                                           CPU_data_master_byteenable,
                                                           CPU_data_master_read,
                                                           CPU_data_master_waitrequest,
                                                           CPU_data_master_write,
                                                           CPU_data_master_writedata,
                                                           Green_LEDs_avalon_parallel_port_slave_readdata,
                                                           clk,
                                                           reset_n,

                                                          // outputs:
                                                           CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave,
                                                           CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave,
                                                           CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave,
                                                           CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave,
                                                           Green_LEDs_avalon_parallel_port_slave_address,
                                                           Green_LEDs_avalon_parallel_port_slave_byteenable,
                                                           Green_LEDs_avalon_parallel_port_slave_chipselect,
                                                           Green_LEDs_avalon_parallel_port_slave_read,
                                                           Green_LEDs_avalon_parallel_port_slave_readdata_from_sa,
                                                           Green_LEDs_avalon_parallel_port_slave_reset,
                                                           Green_LEDs_avalon_parallel_port_slave_write,
                                                           Green_LEDs_avalon_parallel_port_slave_writedata,
                                                           d1_Green_LEDs_avalon_parallel_port_slave_end_xfer,
                                                           registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave
                                                        )
;

  output           CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;
  output  [  1: 0] Green_LEDs_avalon_parallel_port_slave_address;
  output  [  3: 0] Green_LEDs_avalon_parallel_port_slave_byteenable;
  output           Green_LEDs_avalon_parallel_port_slave_chipselect;
  output           Green_LEDs_avalon_parallel_port_slave_read;
  output  [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  output           Green_LEDs_avalon_parallel_port_slave_reset;
  output           Green_LEDs_avalon_parallel_port_slave_write;
  output  [ 31: 0] Green_LEDs_avalon_parallel_port_slave_writedata;
  output           d1_Green_LEDs_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Green_LEDs_avalon_parallel_port_slave;
  wire    [  1: 0] Green_LEDs_avalon_parallel_port_slave_address;
  wire             Green_LEDs_avalon_parallel_port_slave_allgrants;
  wire             Green_LEDs_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Green_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Green_LEDs_avalon_parallel_port_slave_any_continuerequest;
  wire             Green_LEDs_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  2: 0] Green_LEDs_avalon_parallel_port_slave_arb_share_counter;
  wire    [  2: 0] Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  2: 0] Green_LEDs_avalon_parallel_port_slave_arb_share_set_values;
  wire             Green_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Green_LEDs_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Green_LEDs_avalon_parallel_port_slave_byteenable;
  wire             Green_LEDs_avalon_parallel_port_slave_chipselect;
  wire             Green_LEDs_avalon_parallel_port_slave_end_xfer;
  wire             Green_LEDs_avalon_parallel_port_slave_firsttransfer;
  wire             Green_LEDs_avalon_parallel_port_slave_grant_vector;
  wire             Green_LEDs_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Green_LEDs_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Green_LEDs_avalon_parallel_port_slave_master_qreq_vector;
  wire             Green_LEDs_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Green_LEDs_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  reg              Green_LEDs_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Green_LEDs_avalon_parallel_port_slave_reset;
  reg              Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Green_LEDs_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Green_LEDs_avalon_parallel_port_slave_waits_for_read;
  wire             Green_LEDs_avalon_parallel_port_slave_waits_for_write;
  wire             Green_LEDs_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Green_LEDs_avalon_parallel_port_slave_writedata;
  reg              d1_Green_LEDs_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Green_LEDs_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Green_LEDs_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Green_LEDs_avalon_parallel_port_slave_end_xfer;
    end


  assign Green_LEDs_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave));
  //assign Green_LEDs_avalon_parallel_port_slave_readdata_from_sa = Green_LEDs_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_readdata_from_sa = Green_LEDs_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000010) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register_in;

  //Green_LEDs_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Green_LEDs_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;

  //Green_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value = Green_LEDs_avalon_parallel_port_slave_firsttransfer ? (Green_LEDs_avalon_parallel_port_slave_arb_share_set_values - 1) : |Green_LEDs_avalon_parallel_port_slave_arb_share_counter ? (Green_LEDs_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Green_LEDs_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_allgrants = |Green_LEDs_avalon_parallel_port_slave_grant_vector;

  //Green_LEDs_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_end_xfer = ~(Green_LEDs_avalon_parallel_port_slave_waits_for_read | Green_LEDs_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave = Green_LEDs_avalon_parallel_port_slave_end_xfer & (~Green_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Green_LEDs_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave & Green_LEDs_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave & ~Green_LEDs_avalon_parallel_port_slave_non_bursting_master_requests);

  //Green_LEDs_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Green_LEDs_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Green_LEDs_avalon_parallel_port_slave_arb_counter_enable)
          Green_LEDs_avalon_parallel_port_slave_arb_share_counter <= Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Green_LEDs_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave & ~Green_LEDs_avalon_parallel_port_slave_non_bursting_master_requests))
          Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable <= |Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Green_LEDs/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 = |Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Green_LEDs/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Green_LEDs_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave = CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_read & ~Green_LEDs_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register;

  //Green_LEDs_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave = CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Green_LEDs/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Green_LEDs_avalon_parallel_port_slave = CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;

  //allow new arb cycle for Green_LEDs/avalon_parallel_port_slave, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Green_LEDs_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Green_LEDs_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Green_LEDs_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_reset = ~reset_n;

  assign Green_LEDs_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave;
  //Green_LEDs_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_firsttransfer = Green_LEDs_avalon_parallel_port_slave_begins_xfer ? Green_LEDs_avalon_parallel_port_slave_unreg_firsttransfer : Green_LEDs_avalon_parallel_port_slave_reg_firsttransfer;

  //Green_LEDs_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_unreg_firsttransfer = ~(Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable & Green_LEDs_avalon_parallel_port_slave_any_continuerequest);

  //Green_LEDs_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Green_LEDs_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Green_LEDs_avalon_parallel_port_slave_begins_xfer)
          Green_LEDs_avalon_parallel_port_slave_reg_firsttransfer <= Green_LEDs_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Green_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal = Green_LEDs_avalon_parallel_port_slave_begins_xfer;

  //Green_LEDs_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_read = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_read;

  //Green_LEDs_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_write = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Green_LEDs_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Green_LEDs_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_address = shifted_address_to_Green_LEDs_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Green_LEDs_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Green_LEDs_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Green_LEDs_avalon_parallel_port_slave_end_xfer <= Green_LEDs_avalon_parallel_port_slave_end_xfer;
    end


  //Green_LEDs_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_waits_for_read = Green_LEDs_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Green_LEDs_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Green_LEDs_avalon_parallel_port_slave_in_a_read_cycle;

  //Green_LEDs_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_waits_for_write = Green_LEDs_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Green_LEDs_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Green_LEDs_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Green_LEDs_avalon_parallel_port_slave_counter = 0;
  //Green_LEDs_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Green_LEDs/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
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

module HEX3_HEX0_avalon_parallel_port_slave_arbitrator (
                                                         // inputs:
                                                          CPU_data_master_address_to_slave,
                                                          CPU_data_master_byteenable,
                                                          CPU_data_master_read,
                                                          CPU_data_master_waitrequest,
                                                          CPU_data_master_write,
                                                          CPU_data_master_writedata,
                                                          HEX3_HEX0_avalon_parallel_port_slave_readdata,
                                                          clk,
                                                          reset_n,

                                                         // outputs:
                                                          CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave,
                                                          CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave,
                                                          CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave,
                                                          CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave,
                                                          HEX3_HEX0_avalon_parallel_port_slave_address,
                                                          HEX3_HEX0_avalon_parallel_port_slave_byteenable,
                                                          HEX3_HEX0_avalon_parallel_port_slave_chipselect,
                                                          HEX3_HEX0_avalon_parallel_port_slave_read,
                                                          HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa,
                                                          HEX3_HEX0_avalon_parallel_port_slave_reset,
                                                          HEX3_HEX0_avalon_parallel_port_slave_write,
                                                          HEX3_HEX0_avalon_parallel_port_slave_writedata,
                                                          d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer,
                                                          registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave
                                                       )
;

  output           CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  output           CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;
  output  [  1: 0] HEX3_HEX0_avalon_parallel_port_slave_address;
  output  [  3: 0] HEX3_HEX0_avalon_parallel_port_slave_byteenable;
  output           HEX3_HEX0_avalon_parallel_port_slave_chipselect;
  output           HEX3_HEX0_avalon_parallel_port_slave_read;
  output  [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa;
  output           HEX3_HEX0_avalon_parallel_port_slave_reset;
  output           HEX3_HEX0_avalon_parallel_port_slave_write;
  output  [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_writedata;
  output           d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_HEX3_HEX0_avalon_parallel_port_slave;
  wire    [  1: 0] HEX3_HEX0_avalon_parallel_port_slave_address;
  wire             HEX3_HEX0_avalon_parallel_port_slave_allgrants;
  wire             HEX3_HEX0_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             HEX3_HEX0_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             HEX3_HEX0_avalon_parallel_port_slave_any_continuerequest;
  wire             HEX3_HEX0_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  2: 0] HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter;
  wire    [  2: 0] HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  2: 0] HEX3_HEX0_avalon_parallel_port_slave_arb_share_set_values;
  wire             HEX3_HEX0_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             HEX3_HEX0_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] HEX3_HEX0_avalon_parallel_port_slave_byteenable;
  wire             HEX3_HEX0_avalon_parallel_port_slave_chipselect;
  wire             HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
  wire             HEX3_HEX0_avalon_parallel_port_slave_firsttransfer;
  wire             HEX3_HEX0_avalon_parallel_port_slave_grant_vector;
  wire             HEX3_HEX0_avalon_parallel_port_slave_in_a_read_cycle;
  wire             HEX3_HEX0_avalon_parallel_port_slave_in_a_write_cycle;
  wire             HEX3_HEX0_avalon_parallel_port_slave_master_qreq_vector;
  wire             HEX3_HEX0_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             HEX3_HEX0_avalon_parallel_port_slave_read;
  wire    [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa;
  reg              HEX3_HEX0_avalon_parallel_port_slave_reg_firsttransfer;
  wire             HEX3_HEX0_avalon_parallel_port_slave_reset;
  reg              HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             HEX3_HEX0_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             HEX3_HEX0_avalon_parallel_port_slave_waits_for_read;
  wire             HEX3_HEX0_avalon_parallel_port_slave_waits_for_write;
  wire             HEX3_HEX0_avalon_parallel_port_slave_write;
  wire    [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_writedata;
  reg              d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_HEX3_HEX0_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_HEX3_HEX0_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
    end


  assign HEX3_HEX0_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave));
  //assign HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa = HEX3_HEX0_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa = HEX3_HEX0_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000020) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave = CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register_in;

  //HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_arb_share_set_values = 1;

  //HEX3_HEX0_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;

  //HEX3_HEX0_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value = HEX3_HEX0_avalon_parallel_port_slave_firsttransfer ? (HEX3_HEX0_avalon_parallel_port_slave_arb_share_set_values - 1) : |HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter ? (HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //HEX3_HEX0_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_allgrants = |HEX3_HEX0_avalon_parallel_port_slave_grant_vector;

  //HEX3_HEX0_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_end_xfer = ~(HEX3_HEX0_avalon_parallel_port_slave_waits_for_read | HEX3_HEX0_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave = HEX3_HEX0_avalon_parallel_port_slave_end_xfer & (~HEX3_HEX0_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave & HEX3_HEX0_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave & ~HEX3_HEX0_avalon_parallel_port_slave_non_bursting_master_requests);

  //HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (HEX3_HEX0_avalon_parallel_port_slave_arb_counter_enable)
          HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter <= HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|HEX3_HEX0_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave & ~HEX3_HEX0_avalon_parallel_port_slave_non_bursting_master_requests))
          HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable <= |HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master HEX3_HEX0/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable2 = |HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master HEX3_HEX0/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //HEX3_HEX0_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave = CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_read & ~HEX3_HEX0_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave = CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register;

  //HEX3_HEX0_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave = CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave;

  //CPU/data_master saved-grant HEX3_HEX0/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_HEX3_HEX0_avalon_parallel_port_slave = CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;

  //allow new arb cycle for HEX3_HEX0/avalon_parallel_port_slave, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign HEX3_HEX0_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign HEX3_HEX0_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~HEX3_HEX0_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_reset = ~reset_n;

  assign HEX3_HEX0_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave;
  //HEX3_HEX0_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_firsttransfer = HEX3_HEX0_avalon_parallel_port_slave_begins_xfer ? HEX3_HEX0_avalon_parallel_port_slave_unreg_firsttransfer : HEX3_HEX0_avalon_parallel_port_slave_reg_firsttransfer;

  //HEX3_HEX0_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_unreg_firsttransfer = ~(HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable & HEX3_HEX0_avalon_parallel_port_slave_any_continuerequest);

  //HEX3_HEX0_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX3_HEX0_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (HEX3_HEX0_avalon_parallel_port_slave_begins_xfer)
          HEX3_HEX0_avalon_parallel_port_slave_reg_firsttransfer <= HEX3_HEX0_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //HEX3_HEX0_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_beginbursttransfer_internal = HEX3_HEX0_avalon_parallel_port_slave_begins_xfer;

  //HEX3_HEX0_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_read = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_read;

  //HEX3_HEX0_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_write = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_HEX3_HEX0_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //HEX3_HEX0_avalon_parallel_port_slave_address mux, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_address = shifted_address_to_HEX3_HEX0_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer <= HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
    end


  //HEX3_HEX0_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_waits_for_read = HEX3_HEX0_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //HEX3_HEX0_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = HEX3_HEX0_avalon_parallel_port_slave_in_a_read_cycle;

  //HEX3_HEX0_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_waits_for_write = HEX3_HEX0_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //HEX3_HEX0_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = HEX3_HEX0_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_HEX3_HEX0_avalon_parallel_port_slave_counter = 0;
  //HEX3_HEX0_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //HEX3_HEX0/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
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

module HEX7_HEX4_avalon_parallel_port_slave_arbitrator (
                                                         // inputs:
                                                          CPU_data_master_address_to_slave,
                                                          CPU_data_master_byteenable,
                                                          CPU_data_master_read,
                                                          CPU_data_master_waitrequest,
                                                          CPU_data_master_write,
                                                          CPU_data_master_writedata,
                                                          HEX7_HEX4_avalon_parallel_port_slave_readdata,
                                                          clk,
                                                          reset_n,

                                                         // outputs:
                                                          CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave,
                                                          CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave,
                                                          CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave,
                                                          CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave,
                                                          HEX7_HEX4_avalon_parallel_port_slave_address,
                                                          HEX7_HEX4_avalon_parallel_port_slave_byteenable,
                                                          HEX7_HEX4_avalon_parallel_port_slave_chipselect,
                                                          HEX7_HEX4_avalon_parallel_port_slave_read,
                                                          HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa,
                                                          HEX7_HEX4_avalon_parallel_port_slave_reset,
                                                          HEX7_HEX4_avalon_parallel_port_slave_write,
                                                          HEX7_HEX4_avalon_parallel_port_slave_writedata,
                                                          d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer,
                                                          registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave
                                                       )
;

  output           CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  output           CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;
  output  [  1: 0] HEX7_HEX4_avalon_parallel_port_slave_address;
  output  [  3: 0] HEX7_HEX4_avalon_parallel_port_slave_byteenable;
  output           HEX7_HEX4_avalon_parallel_port_slave_chipselect;
  output           HEX7_HEX4_avalon_parallel_port_slave_read;
  output  [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa;
  output           HEX7_HEX4_avalon_parallel_port_slave_reset;
  output           HEX7_HEX4_avalon_parallel_port_slave_write;
  output  [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_writedata;
  output           d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_HEX7_HEX4_avalon_parallel_port_slave;
  wire    [  1: 0] HEX7_HEX4_avalon_parallel_port_slave_address;
  wire             HEX7_HEX4_avalon_parallel_port_slave_allgrants;
  wire             HEX7_HEX4_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             HEX7_HEX4_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             HEX7_HEX4_avalon_parallel_port_slave_any_continuerequest;
  wire             HEX7_HEX4_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  2: 0] HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter;
  wire    [  2: 0] HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  2: 0] HEX7_HEX4_avalon_parallel_port_slave_arb_share_set_values;
  wire             HEX7_HEX4_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             HEX7_HEX4_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] HEX7_HEX4_avalon_parallel_port_slave_byteenable;
  wire             HEX7_HEX4_avalon_parallel_port_slave_chipselect;
  wire             HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
  wire             HEX7_HEX4_avalon_parallel_port_slave_firsttransfer;
  wire             HEX7_HEX4_avalon_parallel_port_slave_grant_vector;
  wire             HEX7_HEX4_avalon_parallel_port_slave_in_a_read_cycle;
  wire             HEX7_HEX4_avalon_parallel_port_slave_in_a_write_cycle;
  wire             HEX7_HEX4_avalon_parallel_port_slave_master_qreq_vector;
  wire             HEX7_HEX4_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             HEX7_HEX4_avalon_parallel_port_slave_read;
  wire    [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa;
  reg              HEX7_HEX4_avalon_parallel_port_slave_reg_firsttransfer;
  wire             HEX7_HEX4_avalon_parallel_port_slave_reset;
  reg              HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             HEX7_HEX4_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             HEX7_HEX4_avalon_parallel_port_slave_waits_for_read;
  wire             HEX7_HEX4_avalon_parallel_port_slave_waits_for_write;
  wire             HEX7_HEX4_avalon_parallel_port_slave_write;
  wire    [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_writedata;
  reg              d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_HEX7_HEX4_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_HEX7_HEX4_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
    end


  assign HEX7_HEX4_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave));
  //assign HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa = HEX7_HEX4_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa = HEX7_HEX4_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000030) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave = CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register_in;

  //HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_arb_share_set_values = 1;

  //HEX7_HEX4_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;

  //HEX7_HEX4_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value = HEX7_HEX4_avalon_parallel_port_slave_firsttransfer ? (HEX7_HEX4_avalon_parallel_port_slave_arb_share_set_values - 1) : |HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter ? (HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //HEX7_HEX4_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_allgrants = |HEX7_HEX4_avalon_parallel_port_slave_grant_vector;

  //HEX7_HEX4_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_end_xfer = ~(HEX7_HEX4_avalon_parallel_port_slave_waits_for_read | HEX7_HEX4_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave = HEX7_HEX4_avalon_parallel_port_slave_end_xfer & (~HEX7_HEX4_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave & HEX7_HEX4_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave & ~HEX7_HEX4_avalon_parallel_port_slave_non_bursting_master_requests);

  //HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (HEX7_HEX4_avalon_parallel_port_slave_arb_counter_enable)
          HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter <= HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|HEX7_HEX4_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave & ~HEX7_HEX4_avalon_parallel_port_slave_non_bursting_master_requests))
          HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable <= |HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master HEX7_HEX4/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable2 = |HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master HEX7_HEX4/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //HEX7_HEX4_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave = CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_read & ~HEX7_HEX4_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave = CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register;

  //HEX7_HEX4_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave = CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave;

  //CPU/data_master saved-grant HEX7_HEX4/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_HEX7_HEX4_avalon_parallel_port_slave = CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;

  //allow new arb cycle for HEX7_HEX4/avalon_parallel_port_slave, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign HEX7_HEX4_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign HEX7_HEX4_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~HEX7_HEX4_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_reset = ~reset_n;

  assign HEX7_HEX4_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave;
  //HEX7_HEX4_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_firsttransfer = HEX7_HEX4_avalon_parallel_port_slave_begins_xfer ? HEX7_HEX4_avalon_parallel_port_slave_unreg_firsttransfer : HEX7_HEX4_avalon_parallel_port_slave_reg_firsttransfer;

  //HEX7_HEX4_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_unreg_firsttransfer = ~(HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable & HEX7_HEX4_avalon_parallel_port_slave_any_continuerequest);

  //HEX7_HEX4_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX7_HEX4_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (HEX7_HEX4_avalon_parallel_port_slave_begins_xfer)
          HEX7_HEX4_avalon_parallel_port_slave_reg_firsttransfer <= HEX7_HEX4_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //HEX7_HEX4_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_beginbursttransfer_internal = HEX7_HEX4_avalon_parallel_port_slave_begins_xfer;

  //HEX7_HEX4_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_read = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_read;

  //HEX7_HEX4_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_write = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_HEX7_HEX4_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //HEX7_HEX4_avalon_parallel_port_slave_address mux, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_address = shifted_address_to_HEX7_HEX4_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer <= HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
    end


  //HEX7_HEX4_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_waits_for_read = HEX7_HEX4_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //HEX7_HEX4_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = HEX7_HEX4_avalon_parallel_port_slave_in_a_read_cycle;

  //HEX7_HEX4_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_waits_for_write = HEX7_HEX4_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //HEX7_HEX4_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = HEX7_HEX4_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_HEX7_HEX4_avalon_parallel_port_slave_counter = 0;
  //HEX7_HEX4_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //HEX7_HEX4/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
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

module Interval_Timer_s1_arbitrator (
                                      // inputs:
                                       CPU_data_master_address_to_slave,
                                       CPU_data_master_read,
                                       CPU_data_master_waitrequest,
                                       CPU_data_master_write,
                                       CPU_data_master_writedata,
                                       Interval_Timer_s1_irq,
                                       Interval_Timer_s1_readdata,
                                       clk,
                                       reset_n,

                                      // outputs:
                                       CPU_data_master_granted_Interval_Timer_s1,
                                       CPU_data_master_qualified_request_Interval_Timer_s1,
                                       CPU_data_master_read_data_valid_Interval_Timer_s1,
                                       CPU_data_master_requests_Interval_Timer_s1,
                                       Interval_Timer_s1_address,
                                       Interval_Timer_s1_chipselect,
                                       Interval_Timer_s1_irq_from_sa,
                                       Interval_Timer_s1_readdata_from_sa,
                                       Interval_Timer_s1_reset_n,
                                       Interval_Timer_s1_write_n,
                                       Interval_Timer_s1_writedata,
                                       d1_Interval_Timer_s1_end_xfer
                                    )
;

  output           CPU_data_master_granted_Interval_Timer_s1;
  output           CPU_data_master_qualified_request_Interval_Timer_s1;
  output           CPU_data_master_read_data_valid_Interval_Timer_s1;
  output           CPU_data_master_requests_Interval_Timer_s1;
  output  [  2: 0] Interval_Timer_s1_address;
  output           Interval_Timer_s1_chipselect;
  output           Interval_Timer_s1_irq_from_sa;
  output  [ 15: 0] Interval_Timer_s1_readdata_from_sa;
  output           Interval_Timer_s1_reset_n;
  output           Interval_Timer_s1_write_n;
  output  [ 15: 0] Interval_Timer_s1_writedata;
  output           d1_Interval_Timer_s1_end_xfer;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Interval_Timer_s1_irq;
  input   [ 15: 0] Interval_Timer_s1_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Interval_Timer_s1;
  wire             CPU_data_master_qualified_request_Interval_Timer_s1;
  wire             CPU_data_master_read_data_valid_Interval_Timer_s1;
  wire             CPU_data_master_requests_Interval_Timer_s1;
  wire             CPU_data_master_saved_grant_Interval_Timer_s1;
  wire    [  2: 0] Interval_Timer_s1_address;
  wire             Interval_Timer_s1_allgrants;
  wire             Interval_Timer_s1_allow_new_arb_cycle;
  wire             Interval_Timer_s1_any_bursting_master_saved_grant;
  wire             Interval_Timer_s1_any_continuerequest;
  wire             Interval_Timer_s1_arb_counter_enable;
  reg     [  2: 0] Interval_Timer_s1_arb_share_counter;
  wire    [  2: 0] Interval_Timer_s1_arb_share_counter_next_value;
  wire    [  2: 0] Interval_Timer_s1_arb_share_set_values;
  wire             Interval_Timer_s1_beginbursttransfer_internal;
  wire             Interval_Timer_s1_begins_xfer;
  wire             Interval_Timer_s1_chipselect;
  wire             Interval_Timer_s1_end_xfer;
  wire             Interval_Timer_s1_firsttransfer;
  wire             Interval_Timer_s1_grant_vector;
  wire             Interval_Timer_s1_in_a_read_cycle;
  wire             Interval_Timer_s1_in_a_write_cycle;
  wire             Interval_Timer_s1_irq_from_sa;
  wire             Interval_Timer_s1_master_qreq_vector;
  wire             Interval_Timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] Interval_Timer_s1_readdata_from_sa;
  reg              Interval_Timer_s1_reg_firsttransfer;
  wire             Interval_Timer_s1_reset_n;
  reg              Interval_Timer_s1_slavearbiterlockenable;
  wire             Interval_Timer_s1_slavearbiterlockenable2;
  wire             Interval_Timer_s1_unreg_firsttransfer;
  wire             Interval_Timer_s1_waits_for_read;
  wire             Interval_Timer_s1_waits_for_write;
  wire             Interval_Timer_s1_write_n;
  wire    [ 15: 0] Interval_Timer_s1_writedata;
  reg              d1_Interval_Timer_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Interval_Timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_Interval_Timer_s1_from_CPU_data_master;
  wire             wait_for_Interval_Timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Interval_Timer_s1_end_xfer;
    end


  assign Interval_Timer_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Interval_Timer_s1));
  //assign Interval_Timer_s1_readdata_from_sa = Interval_Timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Interval_Timer_s1_readdata_from_sa = Interval_Timer_s1_readdata;

  assign CPU_data_master_requests_Interval_Timer_s1 = ({CPU_data_master_address_to_slave[28 : 5] , 5'b0} == 29'h10002000) & (CPU_data_master_read | CPU_data_master_write);
  //Interval_Timer_s1_arb_share_counter set values, which is an e_mux
  assign Interval_Timer_s1_arb_share_set_values = 1;

  //Interval_Timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign Interval_Timer_s1_non_bursting_master_requests = CPU_data_master_requests_Interval_Timer_s1;

  //Interval_Timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign Interval_Timer_s1_any_bursting_master_saved_grant = 0;

  //Interval_Timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign Interval_Timer_s1_arb_share_counter_next_value = Interval_Timer_s1_firsttransfer ? (Interval_Timer_s1_arb_share_set_values - 1) : |Interval_Timer_s1_arb_share_counter ? (Interval_Timer_s1_arb_share_counter - 1) : 0;

  //Interval_Timer_s1_allgrants all slave grants, which is an e_mux
  assign Interval_Timer_s1_allgrants = |Interval_Timer_s1_grant_vector;

  //Interval_Timer_s1_end_xfer assignment, which is an e_assign
  assign Interval_Timer_s1_end_xfer = ~(Interval_Timer_s1_waits_for_read | Interval_Timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_Interval_Timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Interval_Timer_s1 = Interval_Timer_s1_end_xfer & (~Interval_Timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Interval_Timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign Interval_Timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_Interval_Timer_s1 & Interval_Timer_s1_allgrants) | (end_xfer_arb_share_counter_term_Interval_Timer_s1 & ~Interval_Timer_s1_non_bursting_master_requests);

  //Interval_Timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Interval_Timer_s1_arb_share_counter <= 0;
      else if (Interval_Timer_s1_arb_counter_enable)
          Interval_Timer_s1_arb_share_counter <= Interval_Timer_s1_arb_share_counter_next_value;
    end


  //Interval_Timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Interval_Timer_s1_slavearbiterlockenable <= 0;
      else if ((|Interval_Timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_Interval_Timer_s1) | (end_xfer_arb_share_counter_term_Interval_Timer_s1 & ~Interval_Timer_s1_non_bursting_master_requests))
          Interval_Timer_s1_slavearbiterlockenable <= |Interval_Timer_s1_arb_share_counter_next_value;
    end


  //CPU/data_master Interval_Timer/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Interval_Timer_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Interval_Timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Interval_Timer_s1_slavearbiterlockenable2 = |Interval_Timer_s1_arb_share_counter_next_value;

  //CPU/data_master Interval_Timer/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Interval_Timer_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Interval_Timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Interval_Timer_s1_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Interval_Timer_s1 = CPU_data_master_requests_Interval_Timer_s1 & ~(((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //Interval_Timer_s1_writedata mux, which is an e_mux
  assign Interval_Timer_s1_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Interval_Timer_s1 = CPU_data_master_qualified_request_Interval_Timer_s1;

  //CPU/data_master saved-grant Interval_Timer/s1, which is an e_assign
  assign CPU_data_master_saved_grant_Interval_Timer_s1 = CPU_data_master_requests_Interval_Timer_s1;

  //allow new arb cycle for Interval_Timer/s1, which is an e_assign
  assign Interval_Timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Interval_Timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Interval_Timer_s1_master_qreq_vector = 1;

  //Interval_Timer_s1_reset_n assignment, which is an e_assign
  assign Interval_Timer_s1_reset_n = reset_n;

  assign Interval_Timer_s1_chipselect = CPU_data_master_granted_Interval_Timer_s1;
  //Interval_Timer_s1_firsttransfer first transaction, which is an e_assign
  assign Interval_Timer_s1_firsttransfer = Interval_Timer_s1_begins_xfer ? Interval_Timer_s1_unreg_firsttransfer : Interval_Timer_s1_reg_firsttransfer;

  //Interval_Timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign Interval_Timer_s1_unreg_firsttransfer = ~(Interval_Timer_s1_slavearbiterlockenable & Interval_Timer_s1_any_continuerequest);

  //Interval_Timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Interval_Timer_s1_reg_firsttransfer <= 1'b1;
      else if (Interval_Timer_s1_begins_xfer)
          Interval_Timer_s1_reg_firsttransfer <= Interval_Timer_s1_unreg_firsttransfer;
    end


  //Interval_Timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Interval_Timer_s1_beginbursttransfer_internal = Interval_Timer_s1_begins_xfer;

  //~Interval_Timer_s1_write_n assignment, which is an e_mux
  assign Interval_Timer_s1_write_n = ~(CPU_data_master_granted_Interval_Timer_s1 & CPU_data_master_write);

  assign shifted_address_to_Interval_Timer_s1_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Interval_Timer_s1_address mux, which is an e_mux
  assign Interval_Timer_s1_address = shifted_address_to_Interval_Timer_s1_from_CPU_data_master >> 2;

  //d1_Interval_Timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Interval_Timer_s1_end_xfer <= 1;
      else 
        d1_Interval_Timer_s1_end_xfer <= Interval_Timer_s1_end_xfer;
    end


  //Interval_Timer_s1_waits_for_read in a cycle, which is an e_mux
  assign Interval_Timer_s1_waits_for_read = Interval_Timer_s1_in_a_read_cycle & Interval_Timer_s1_begins_xfer;

  //Interval_Timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign Interval_Timer_s1_in_a_read_cycle = CPU_data_master_granted_Interval_Timer_s1 & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Interval_Timer_s1_in_a_read_cycle;

  //Interval_Timer_s1_waits_for_write in a cycle, which is an e_mux
  assign Interval_Timer_s1_waits_for_write = Interval_Timer_s1_in_a_write_cycle & 0;

  //Interval_Timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign Interval_Timer_s1_in_a_write_cycle = CPU_data_master_granted_Interval_Timer_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Interval_Timer_s1_in_a_write_cycle;

  assign wait_for_Interval_Timer_s1_counter = 0;
  //assign Interval_Timer_s1_irq_from_sa = Interval_Timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Interval_Timer_s1_irq_from_sa = Interval_Timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Interval_Timer/s1 enable non-zero assertions, which is an e_register
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

module JTAG_UART_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 CPU_data_master_address_to_slave,
                                                 CPU_data_master_read,
                                                 CPU_data_master_waitrequest,
                                                 CPU_data_master_write,
                                                 CPU_data_master_writedata,
                                                 JTAG_UART_avalon_jtag_slave_dataavailable,
                                                 JTAG_UART_avalon_jtag_slave_irq,
                                                 JTAG_UART_avalon_jtag_slave_readdata,
                                                 JTAG_UART_avalon_jtag_slave_readyfordata,
                                                 JTAG_UART_avalon_jtag_slave_waitrequest,
                                                 clk,
                                                 reset_n,

                                                // outputs:
                                                 CPU_data_master_granted_JTAG_UART_avalon_jtag_slave,
                                                 CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave,
                                                 CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave,
                                                 CPU_data_master_requests_JTAG_UART_avalon_jtag_slave,
                                                 JTAG_UART_avalon_jtag_slave_address,
                                                 JTAG_UART_avalon_jtag_slave_chipselect,
                                                 JTAG_UART_avalon_jtag_slave_dataavailable_from_sa,
                                                 JTAG_UART_avalon_jtag_slave_irq_from_sa,
                                                 JTAG_UART_avalon_jtag_slave_read_n,
                                                 JTAG_UART_avalon_jtag_slave_readdata_from_sa,
                                                 JTAG_UART_avalon_jtag_slave_readyfordata_from_sa,
                                                 JTAG_UART_avalon_jtag_slave_reset_n,
                                                 JTAG_UART_avalon_jtag_slave_waitrequest_from_sa,
                                                 JTAG_UART_avalon_jtag_slave_write_n,
                                                 JTAG_UART_avalon_jtag_slave_writedata,
                                                 d1_JTAG_UART_avalon_jtag_slave_end_xfer
                                              )
;

  output           CPU_data_master_granted_JTAG_UART_avalon_jtag_slave;
  output           CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave;
  output           CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave;
  output           CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;
  output           JTAG_UART_avalon_jtag_slave_address;
  output           JTAG_UART_avalon_jtag_slave_chipselect;
  output           JTAG_UART_avalon_jtag_slave_dataavailable_from_sa;
  output           JTAG_UART_avalon_jtag_slave_irq_from_sa;
  output           JTAG_UART_avalon_jtag_slave_read_n;
  output  [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata_from_sa;
  output           JTAG_UART_avalon_jtag_slave_readyfordata_from_sa;
  output           JTAG_UART_avalon_jtag_slave_reset_n;
  output           JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;
  output           JTAG_UART_avalon_jtag_slave_write_n;
  output  [ 31: 0] JTAG_UART_avalon_jtag_slave_writedata;
  output           d1_JTAG_UART_avalon_jtag_slave_end_xfer;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            JTAG_UART_avalon_jtag_slave_dataavailable;
  input            JTAG_UART_avalon_jtag_slave_irq;
  input   [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata;
  input            JTAG_UART_avalon_jtag_slave_readyfordata;
  input            JTAG_UART_avalon_jtag_slave_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_saved_grant_JTAG_UART_avalon_jtag_slave;
  wire             JTAG_UART_avalon_jtag_slave_address;
  wire             JTAG_UART_avalon_jtag_slave_allgrants;
  wire             JTAG_UART_avalon_jtag_slave_allow_new_arb_cycle;
  wire             JTAG_UART_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             JTAG_UART_avalon_jtag_slave_any_continuerequest;
  wire             JTAG_UART_avalon_jtag_slave_arb_counter_enable;
  reg     [  2: 0] JTAG_UART_avalon_jtag_slave_arb_share_counter;
  wire    [  2: 0] JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  2: 0] JTAG_UART_avalon_jtag_slave_arb_share_set_values;
  wire             JTAG_UART_avalon_jtag_slave_beginbursttransfer_internal;
  wire             JTAG_UART_avalon_jtag_slave_begins_xfer;
  wire             JTAG_UART_avalon_jtag_slave_chipselect;
  wire             JTAG_UART_avalon_jtag_slave_dataavailable_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_end_xfer;
  wire             JTAG_UART_avalon_jtag_slave_firsttransfer;
  wire             JTAG_UART_avalon_jtag_slave_grant_vector;
  wire             JTAG_UART_avalon_jtag_slave_in_a_read_cycle;
  wire             JTAG_UART_avalon_jtag_slave_in_a_write_cycle;
  wire             JTAG_UART_avalon_jtag_slave_irq_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_master_qreq_vector;
  wire             JTAG_UART_avalon_jtag_slave_non_bursting_master_requests;
  wire             JTAG_UART_avalon_jtag_slave_read_n;
  wire    [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_readyfordata_from_sa;
  reg              JTAG_UART_avalon_jtag_slave_reg_firsttransfer;
  wire             JTAG_UART_avalon_jtag_slave_reset_n;
  reg              JTAG_UART_avalon_jtag_slave_slavearbiterlockenable;
  wire             JTAG_UART_avalon_jtag_slave_slavearbiterlockenable2;
  wire             JTAG_UART_avalon_jtag_slave_unreg_firsttransfer;
  wire             JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_waits_for_read;
  wire             JTAG_UART_avalon_jtag_slave_waits_for_write;
  wire             JTAG_UART_avalon_jtag_slave_write_n;
  wire    [ 31: 0] JTAG_UART_avalon_jtag_slave_writedata;
  reg              d1_JTAG_UART_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_JTAG_UART_avalon_jtag_slave_from_CPU_data_master;
  wire             wait_for_JTAG_UART_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~JTAG_UART_avalon_jtag_slave_end_xfer;
    end


  assign JTAG_UART_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave));
  //assign JTAG_UART_avalon_jtag_slave_readdata_from_sa = JTAG_UART_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_readdata_from_sa = JTAG_UART_avalon_jtag_slave_readdata;

  assign CPU_data_master_requests_JTAG_UART_avalon_jtag_slave = ({CPU_data_master_address_to_slave[28 : 3] , 3'b0} == 29'h10001000) & (CPU_data_master_read | CPU_data_master_write);
  //assign JTAG_UART_avalon_jtag_slave_dataavailable_from_sa = JTAG_UART_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_dataavailable_from_sa = JTAG_UART_avalon_jtag_slave_dataavailable;

  //assign JTAG_UART_avalon_jtag_slave_readyfordata_from_sa = JTAG_UART_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_readyfordata_from_sa = JTAG_UART_avalon_jtag_slave_readyfordata;

  //assign JTAG_UART_avalon_jtag_slave_waitrequest_from_sa = JTAG_UART_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_waitrequest_from_sa = JTAG_UART_avalon_jtag_slave_waitrequest;

  //JTAG_UART_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_arb_share_set_values = 1;

  //JTAG_UART_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_non_bursting_master_requests = CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;

  //JTAG_UART_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value = JTAG_UART_avalon_jtag_slave_firsttransfer ? (JTAG_UART_avalon_jtag_slave_arb_share_set_values - 1) : |JTAG_UART_avalon_jtag_slave_arb_share_counter ? (JTAG_UART_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //JTAG_UART_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_allgrants = |JTAG_UART_avalon_jtag_slave_grant_vector;

  //JTAG_UART_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_end_xfer = ~(JTAG_UART_avalon_jtag_slave_waits_for_read | JTAG_UART_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave = JTAG_UART_avalon_jtag_slave_end_xfer & (~JTAG_UART_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //JTAG_UART_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave & JTAG_UART_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave & ~JTAG_UART_avalon_jtag_slave_non_bursting_master_requests);

  //JTAG_UART_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          JTAG_UART_avalon_jtag_slave_arb_share_counter <= 0;
      else if (JTAG_UART_avalon_jtag_slave_arb_counter_enable)
          JTAG_UART_avalon_jtag_slave_arb_share_counter <= JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //JTAG_UART_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          JTAG_UART_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|JTAG_UART_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave & ~JTAG_UART_avalon_jtag_slave_non_bursting_master_requests))
          JTAG_UART_avalon_jtag_slave_slavearbiterlockenable <= |JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //CPU/data_master JTAG_UART/avalon_jtag_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = JTAG_UART_avalon_jtag_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //JTAG_UART_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_slavearbiterlockenable2 = |JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value;

  //CPU/data_master JTAG_UART/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = JTAG_UART_avalon_jtag_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //JTAG_UART_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave = CPU_data_master_requests_JTAG_UART_avalon_jtag_slave & ~((CPU_data_master_read & (~CPU_data_master_waitrequest)) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //JTAG_UART_avalon_jtag_slave_writedata mux, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_JTAG_UART_avalon_jtag_slave = CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave;

  //CPU/data_master saved-grant JTAG_UART/avalon_jtag_slave, which is an e_assign
  assign CPU_data_master_saved_grant_JTAG_UART_avalon_jtag_slave = CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;

  //allow new arb cycle for JTAG_UART/avalon_jtag_slave, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign JTAG_UART_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign JTAG_UART_avalon_jtag_slave_master_qreq_vector = 1;

  //JTAG_UART_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_reset_n = reset_n;

  assign JTAG_UART_avalon_jtag_slave_chipselect = CPU_data_master_granted_JTAG_UART_avalon_jtag_slave;
  //JTAG_UART_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_firsttransfer = JTAG_UART_avalon_jtag_slave_begins_xfer ? JTAG_UART_avalon_jtag_slave_unreg_firsttransfer : JTAG_UART_avalon_jtag_slave_reg_firsttransfer;

  //JTAG_UART_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_unreg_firsttransfer = ~(JTAG_UART_avalon_jtag_slave_slavearbiterlockenable & JTAG_UART_avalon_jtag_slave_any_continuerequest);

  //JTAG_UART_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          JTAG_UART_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (JTAG_UART_avalon_jtag_slave_begins_xfer)
          JTAG_UART_avalon_jtag_slave_reg_firsttransfer <= JTAG_UART_avalon_jtag_slave_unreg_firsttransfer;
    end


  //JTAG_UART_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_beginbursttransfer_internal = JTAG_UART_avalon_jtag_slave_begins_xfer;

  //~JTAG_UART_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_read_n = ~(CPU_data_master_granted_JTAG_UART_avalon_jtag_slave & CPU_data_master_read);

  //~JTAG_UART_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_write_n = ~(CPU_data_master_granted_JTAG_UART_avalon_jtag_slave & CPU_data_master_write);

  assign shifted_address_to_JTAG_UART_avalon_jtag_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //JTAG_UART_avalon_jtag_slave_address mux, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_address = shifted_address_to_JTAG_UART_avalon_jtag_slave_from_CPU_data_master >> 2;

  //d1_JTAG_UART_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_JTAG_UART_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_JTAG_UART_avalon_jtag_slave_end_xfer <= JTAG_UART_avalon_jtag_slave_end_xfer;
    end


  //JTAG_UART_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_waits_for_read = JTAG_UART_avalon_jtag_slave_in_a_read_cycle & JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;

  //JTAG_UART_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_in_a_read_cycle = CPU_data_master_granted_JTAG_UART_avalon_jtag_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = JTAG_UART_avalon_jtag_slave_in_a_read_cycle;

  //JTAG_UART_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_waits_for_write = JTAG_UART_avalon_jtag_slave_in_a_write_cycle & JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;

  //JTAG_UART_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_in_a_write_cycle = CPU_data_master_granted_JTAG_UART_avalon_jtag_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = JTAG_UART_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_JTAG_UART_avalon_jtag_slave_counter = 0;
  //assign JTAG_UART_avalon_jtag_slave_irq_from_sa = JTAG_UART_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_irq_from_sa = JTAG_UART_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //JTAG_UART/avalon_jtag_slave enable non-zero assertions, which is an e_register
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

module PS2_Port_avalon_ps2_slave_arbitrator (
                                              // inputs:
                                               CPU_data_master_address_to_slave,
                                               CPU_data_master_byteenable,
                                               CPU_data_master_read,
                                               CPU_data_master_waitrequest,
                                               CPU_data_master_write,
                                               CPU_data_master_writedata,
                                               PS2_Port_avalon_ps2_slave_irq,
                                               PS2_Port_avalon_ps2_slave_readdata,
                                               PS2_Port_avalon_ps2_slave_waitrequest,
                                               clk,
                                               reset_n,

                                              // outputs:
                                               CPU_data_master_granted_PS2_Port_avalon_ps2_slave,
                                               CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave,
                                               CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave,
                                               CPU_data_master_requests_PS2_Port_avalon_ps2_slave,
                                               PS2_Port_avalon_ps2_slave_address,
                                               PS2_Port_avalon_ps2_slave_byteenable,
                                               PS2_Port_avalon_ps2_slave_chipselect,
                                               PS2_Port_avalon_ps2_slave_irq_from_sa,
                                               PS2_Port_avalon_ps2_slave_read,
                                               PS2_Port_avalon_ps2_slave_readdata_from_sa,
                                               PS2_Port_avalon_ps2_slave_reset,
                                               PS2_Port_avalon_ps2_slave_waitrequest_from_sa,
                                               PS2_Port_avalon_ps2_slave_write,
                                               PS2_Port_avalon_ps2_slave_writedata,
                                               d1_PS2_Port_avalon_ps2_slave_end_xfer,
                                               registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave
                                            )
;

  output           CPU_data_master_granted_PS2_Port_avalon_ps2_slave;
  output           CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave;
  output           CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave;
  output           CPU_data_master_requests_PS2_Port_avalon_ps2_slave;
  output           PS2_Port_avalon_ps2_slave_address;
  output  [  3: 0] PS2_Port_avalon_ps2_slave_byteenable;
  output           PS2_Port_avalon_ps2_slave_chipselect;
  output           PS2_Port_avalon_ps2_slave_irq_from_sa;
  output           PS2_Port_avalon_ps2_slave_read;
  output  [ 31: 0] PS2_Port_avalon_ps2_slave_readdata_from_sa;
  output           PS2_Port_avalon_ps2_slave_reset;
  output           PS2_Port_avalon_ps2_slave_waitrequest_from_sa;
  output           PS2_Port_avalon_ps2_slave_write;
  output  [ 31: 0] PS2_Port_avalon_ps2_slave_writedata;
  output           d1_PS2_Port_avalon_ps2_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            PS2_Port_avalon_ps2_slave_irq;
  input   [ 31: 0] PS2_Port_avalon_ps2_slave_readdata;
  input            PS2_Port_avalon_ps2_slave_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_PS2_Port_avalon_ps2_slave;
  wire             CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave;
  wire             CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave;
  reg              CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register;
  wire             CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register_in;
  wire             CPU_data_master_requests_PS2_Port_avalon_ps2_slave;
  wire             CPU_data_master_saved_grant_PS2_Port_avalon_ps2_slave;
  wire             PS2_Port_avalon_ps2_slave_address;
  wire             PS2_Port_avalon_ps2_slave_allgrants;
  wire             PS2_Port_avalon_ps2_slave_allow_new_arb_cycle;
  wire             PS2_Port_avalon_ps2_slave_any_bursting_master_saved_grant;
  wire             PS2_Port_avalon_ps2_slave_any_continuerequest;
  wire             PS2_Port_avalon_ps2_slave_arb_counter_enable;
  reg     [  2: 0] PS2_Port_avalon_ps2_slave_arb_share_counter;
  wire    [  2: 0] PS2_Port_avalon_ps2_slave_arb_share_counter_next_value;
  wire    [  2: 0] PS2_Port_avalon_ps2_slave_arb_share_set_values;
  wire             PS2_Port_avalon_ps2_slave_beginbursttransfer_internal;
  wire             PS2_Port_avalon_ps2_slave_begins_xfer;
  wire    [  3: 0] PS2_Port_avalon_ps2_slave_byteenable;
  wire             PS2_Port_avalon_ps2_slave_chipselect;
  wire             PS2_Port_avalon_ps2_slave_end_xfer;
  wire             PS2_Port_avalon_ps2_slave_firsttransfer;
  wire             PS2_Port_avalon_ps2_slave_grant_vector;
  wire             PS2_Port_avalon_ps2_slave_in_a_read_cycle;
  wire             PS2_Port_avalon_ps2_slave_in_a_write_cycle;
  wire             PS2_Port_avalon_ps2_slave_irq_from_sa;
  wire             PS2_Port_avalon_ps2_slave_master_qreq_vector;
  wire             PS2_Port_avalon_ps2_slave_non_bursting_master_requests;
  wire             PS2_Port_avalon_ps2_slave_read;
  wire    [ 31: 0] PS2_Port_avalon_ps2_slave_readdata_from_sa;
  reg              PS2_Port_avalon_ps2_slave_reg_firsttransfer;
  wire             PS2_Port_avalon_ps2_slave_reset;
  reg              PS2_Port_avalon_ps2_slave_slavearbiterlockenable;
  wire             PS2_Port_avalon_ps2_slave_slavearbiterlockenable2;
  wire             PS2_Port_avalon_ps2_slave_unreg_firsttransfer;
  wire             PS2_Port_avalon_ps2_slave_waitrequest_from_sa;
  wire             PS2_Port_avalon_ps2_slave_waits_for_read;
  wire             PS2_Port_avalon_ps2_slave_waits_for_write;
  wire             PS2_Port_avalon_ps2_slave_write;
  wire    [ 31: 0] PS2_Port_avalon_ps2_slave_writedata;
  reg              d1_PS2_Port_avalon_ps2_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_PS2_Port_avalon_ps2_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave;
  wire    [ 28: 0] shifted_address_to_PS2_Port_avalon_ps2_slave_from_CPU_data_master;
  wire             wait_for_PS2_Port_avalon_ps2_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~PS2_Port_avalon_ps2_slave_end_xfer;
    end


  assign PS2_Port_avalon_ps2_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave));
  //assign PS2_Port_avalon_ps2_slave_readdata_from_sa = PS2_Port_avalon_ps2_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_readdata_from_sa = PS2_Port_avalon_ps2_slave_readdata;

  assign CPU_data_master_requests_PS2_Port_avalon_ps2_slave = ({CPU_data_master_address_to_slave[28 : 3] , 3'b0} == 29'h10000100) & (CPU_data_master_read | CPU_data_master_write);
  //assign PS2_Port_avalon_ps2_slave_waitrequest_from_sa = PS2_Port_avalon_ps2_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_waitrequest_from_sa = PS2_Port_avalon_ps2_slave_waitrequest;

  //registered rdv signal_name registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave = CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register_in;

  //PS2_Port_avalon_ps2_slave_arb_share_counter set values, which is an e_mux
  assign PS2_Port_avalon_ps2_slave_arb_share_set_values = 1;

  //PS2_Port_avalon_ps2_slave_non_bursting_master_requests mux, which is an e_mux
  assign PS2_Port_avalon_ps2_slave_non_bursting_master_requests = CPU_data_master_requests_PS2_Port_avalon_ps2_slave;

  //PS2_Port_avalon_ps2_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign PS2_Port_avalon_ps2_slave_any_bursting_master_saved_grant = 0;

  //PS2_Port_avalon_ps2_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_arb_share_counter_next_value = PS2_Port_avalon_ps2_slave_firsttransfer ? (PS2_Port_avalon_ps2_slave_arb_share_set_values - 1) : |PS2_Port_avalon_ps2_slave_arb_share_counter ? (PS2_Port_avalon_ps2_slave_arb_share_counter - 1) : 0;

  //PS2_Port_avalon_ps2_slave_allgrants all slave grants, which is an e_mux
  assign PS2_Port_avalon_ps2_slave_allgrants = |PS2_Port_avalon_ps2_slave_grant_vector;

  //PS2_Port_avalon_ps2_slave_end_xfer assignment, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_end_xfer = ~(PS2_Port_avalon_ps2_slave_waits_for_read | PS2_Port_avalon_ps2_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_PS2_Port_avalon_ps2_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_PS2_Port_avalon_ps2_slave = PS2_Port_avalon_ps2_slave_end_xfer & (~PS2_Port_avalon_ps2_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //PS2_Port_avalon_ps2_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_PS2_Port_avalon_ps2_slave & PS2_Port_avalon_ps2_slave_allgrants) | (end_xfer_arb_share_counter_term_PS2_Port_avalon_ps2_slave & ~PS2_Port_avalon_ps2_slave_non_bursting_master_requests);

  //PS2_Port_avalon_ps2_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          PS2_Port_avalon_ps2_slave_arb_share_counter <= 0;
      else if (PS2_Port_avalon_ps2_slave_arb_counter_enable)
          PS2_Port_avalon_ps2_slave_arb_share_counter <= PS2_Port_avalon_ps2_slave_arb_share_counter_next_value;
    end


  //PS2_Port_avalon_ps2_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          PS2_Port_avalon_ps2_slave_slavearbiterlockenable <= 0;
      else if ((|PS2_Port_avalon_ps2_slave_master_qreq_vector & end_xfer_arb_share_counter_term_PS2_Port_avalon_ps2_slave) | (end_xfer_arb_share_counter_term_PS2_Port_avalon_ps2_slave & ~PS2_Port_avalon_ps2_slave_non_bursting_master_requests))
          PS2_Port_avalon_ps2_slave_slavearbiterlockenable <= |PS2_Port_avalon_ps2_slave_arb_share_counter_next_value;
    end


  //CPU/data_master PS2_Port/avalon_ps2_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = PS2_Port_avalon_ps2_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //PS2_Port_avalon_ps2_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_slavearbiterlockenable2 = |PS2_Port_avalon_ps2_slave_arb_share_counter_next_value;

  //CPU/data_master PS2_Port/avalon_ps2_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = PS2_Port_avalon_ps2_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //PS2_Port_avalon_ps2_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave = CPU_data_master_requests_PS2_Port_avalon_ps2_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register_in = CPU_data_master_granted_PS2_Port_avalon_ps2_slave & CPU_data_master_read & ~PS2_Port_avalon_ps2_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register = {CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register, CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register_in};

  //CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register <= p1_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave = CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave_shift_register;

  //PS2_Port_avalon_ps2_slave_writedata mux, which is an e_mux
  assign PS2_Port_avalon_ps2_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_PS2_Port_avalon_ps2_slave = CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave;

  //CPU/data_master saved-grant PS2_Port/avalon_ps2_slave, which is an e_assign
  assign CPU_data_master_saved_grant_PS2_Port_avalon_ps2_slave = CPU_data_master_requests_PS2_Port_avalon_ps2_slave;

  //allow new arb cycle for PS2_Port/avalon_ps2_slave, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign PS2_Port_avalon_ps2_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign PS2_Port_avalon_ps2_slave_master_qreq_vector = 1;

  //~PS2_Port_avalon_ps2_slave_reset assignment, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_reset = ~reset_n;

  assign PS2_Port_avalon_ps2_slave_chipselect = CPU_data_master_granted_PS2_Port_avalon_ps2_slave;
  //PS2_Port_avalon_ps2_slave_firsttransfer first transaction, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_firsttransfer = PS2_Port_avalon_ps2_slave_begins_xfer ? PS2_Port_avalon_ps2_slave_unreg_firsttransfer : PS2_Port_avalon_ps2_slave_reg_firsttransfer;

  //PS2_Port_avalon_ps2_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_unreg_firsttransfer = ~(PS2_Port_avalon_ps2_slave_slavearbiterlockenable & PS2_Port_avalon_ps2_slave_any_continuerequest);

  //PS2_Port_avalon_ps2_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          PS2_Port_avalon_ps2_slave_reg_firsttransfer <= 1'b1;
      else if (PS2_Port_avalon_ps2_slave_begins_xfer)
          PS2_Port_avalon_ps2_slave_reg_firsttransfer <= PS2_Port_avalon_ps2_slave_unreg_firsttransfer;
    end


  //PS2_Port_avalon_ps2_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_beginbursttransfer_internal = PS2_Port_avalon_ps2_slave_begins_xfer;

  //PS2_Port_avalon_ps2_slave_read assignment, which is an e_mux
  assign PS2_Port_avalon_ps2_slave_read = CPU_data_master_granted_PS2_Port_avalon_ps2_slave & CPU_data_master_read;

  //PS2_Port_avalon_ps2_slave_write assignment, which is an e_mux
  assign PS2_Port_avalon_ps2_slave_write = CPU_data_master_granted_PS2_Port_avalon_ps2_slave & CPU_data_master_write;

  assign shifted_address_to_PS2_Port_avalon_ps2_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //PS2_Port_avalon_ps2_slave_address mux, which is an e_mux
  assign PS2_Port_avalon_ps2_slave_address = shifted_address_to_PS2_Port_avalon_ps2_slave_from_CPU_data_master >> 2;

  //d1_PS2_Port_avalon_ps2_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_PS2_Port_avalon_ps2_slave_end_xfer <= 1;
      else 
        d1_PS2_Port_avalon_ps2_slave_end_xfer <= PS2_Port_avalon_ps2_slave_end_xfer;
    end


  //PS2_Port_avalon_ps2_slave_waits_for_read in a cycle, which is an e_mux
  assign PS2_Port_avalon_ps2_slave_waits_for_read = PS2_Port_avalon_ps2_slave_in_a_read_cycle & PS2_Port_avalon_ps2_slave_waitrequest_from_sa;

  //PS2_Port_avalon_ps2_slave_in_a_read_cycle assignment, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_in_a_read_cycle = CPU_data_master_granted_PS2_Port_avalon_ps2_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = PS2_Port_avalon_ps2_slave_in_a_read_cycle;

  //PS2_Port_avalon_ps2_slave_waits_for_write in a cycle, which is an e_mux
  assign PS2_Port_avalon_ps2_slave_waits_for_write = PS2_Port_avalon_ps2_slave_in_a_write_cycle & PS2_Port_avalon_ps2_slave_waitrequest_from_sa;

  //PS2_Port_avalon_ps2_slave_in_a_write_cycle assignment, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_in_a_write_cycle = CPU_data_master_granted_PS2_Port_avalon_ps2_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = PS2_Port_avalon_ps2_slave_in_a_write_cycle;

  assign wait_for_PS2_Port_avalon_ps2_slave_counter = 0;
  //PS2_Port_avalon_ps2_slave_byteenable byte enable port mux, which is an e_mux
  assign PS2_Port_avalon_ps2_slave_byteenable = (CPU_data_master_granted_PS2_Port_avalon_ps2_slave)? CPU_data_master_byteenable :
    -1;

  //assign PS2_Port_avalon_ps2_slave_irq_from_sa = PS2_Port_avalon_ps2_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign PS2_Port_avalon_ps2_slave_irq_from_sa = PS2_Port_avalon_ps2_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //PS2_Port/avalon_ps2_slave enable non-zero assertions, which is an e_register
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

module Pushbuttons_avalon_parallel_port_slave_arbitrator (
                                                           // inputs:
                                                            CPU_data_master_address_to_slave,
                                                            CPU_data_master_byteenable,
                                                            CPU_data_master_read,
                                                            CPU_data_master_waitrequest,
                                                            CPU_data_master_write,
                                                            CPU_data_master_writedata,
                                                            Pushbuttons_avalon_parallel_port_slave_irq,
                                                            Pushbuttons_avalon_parallel_port_slave_readdata,
                                                            clk,
                                                            reset_n,

                                                           // outputs:
                                                            CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave,
                                                            CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave,
                                                            CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave,
                                                            CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave,
                                                            Pushbuttons_avalon_parallel_port_slave_address,
                                                            Pushbuttons_avalon_parallel_port_slave_byteenable,
                                                            Pushbuttons_avalon_parallel_port_slave_chipselect,
                                                            Pushbuttons_avalon_parallel_port_slave_irq_from_sa,
                                                            Pushbuttons_avalon_parallel_port_slave_read,
                                                            Pushbuttons_avalon_parallel_port_slave_readdata_from_sa,
                                                            Pushbuttons_avalon_parallel_port_slave_reset,
                                                            Pushbuttons_avalon_parallel_port_slave_write,
                                                            Pushbuttons_avalon_parallel_port_slave_writedata,
                                                            d1_Pushbuttons_avalon_parallel_port_slave_end_xfer,
                                                            registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave
                                                         )
;

  output           CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;
  output  [  1: 0] Pushbuttons_avalon_parallel_port_slave_address;
  output  [  3: 0] Pushbuttons_avalon_parallel_port_slave_byteenable;
  output           Pushbuttons_avalon_parallel_port_slave_chipselect;
  output           Pushbuttons_avalon_parallel_port_slave_irq_from_sa;
  output           Pushbuttons_avalon_parallel_port_slave_read;
  output  [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata_from_sa;
  output           Pushbuttons_avalon_parallel_port_slave_reset;
  output           Pushbuttons_avalon_parallel_port_slave_write;
  output  [ 31: 0] Pushbuttons_avalon_parallel_port_slave_writedata;
  output           d1_Pushbuttons_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Pushbuttons_avalon_parallel_port_slave_irq;
  input   [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Pushbuttons_avalon_parallel_port_slave;
  wire    [  1: 0] Pushbuttons_avalon_parallel_port_slave_address;
  wire             Pushbuttons_avalon_parallel_port_slave_allgrants;
  wire             Pushbuttons_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Pushbuttons_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Pushbuttons_avalon_parallel_port_slave_any_continuerequest;
  wire             Pushbuttons_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  2: 0] Pushbuttons_avalon_parallel_port_slave_arb_share_counter;
  wire    [  2: 0] Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  2: 0] Pushbuttons_avalon_parallel_port_slave_arb_share_set_values;
  wire             Pushbuttons_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Pushbuttons_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Pushbuttons_avalon_parallel_port_slave_byteenable;
  wire             Pushbuttons_avalon_parallel_port_slave_chipselect;
  wire             Pushbuttons_avalon_parallel_port_slave_end_xfer;
  wire             Pushbuttons_avalon_parallel_port_slave_firsttransfer;
  wire             Pushbuttons_avalon_parallel_port_slave_grant_vector;
  wire             Pushbuttons_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Pushbuttons_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Pushbuttons_avalon_parallel_port_slave_irq_from_sa;
  wire             Pushbuttons_avalon_parallel_port_slave_master_qreq_vector;
  wire             Pushbuttons_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Pushbuttons_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata_from_sa;
  reg              Pushbuttons_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Pushbuttons_avalon_parallel_port_slave_reset;
  reg              Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Pushbuttons_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Pushbuttons_avalon_parallel_port_slave_waits_for_read;
  wire             Pushbuttons_avalon_parallel_port_slave_waits_for_write;
  wire             Pushbuttons_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Pushbuttons_avalon_parallel_port_slave_writedata;
  reg              d1_Pushbuttons_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Pushbuttons_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Pushbuttons_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Pushbuttons_avalon_parallel_port_slave_end_xfer;
    end


  assign Pushbuttons_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave));
  //assign Pushbuttons_avalon_parallel_port_slave_readdata_from_sa = Pushbuttons_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_readdata_from_sa = Pushbuttons_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000050) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register_in;

  //Pushbuttons_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Pushbuttons_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;

  //Pushbuttons_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value = Pushbuttons_avalon_parallel_port_slave_firsttransfer ? (Pushbuttons_avalon_parallel_port_slave_arb_share_set_values - 1) : |Pushbuttons_avalon_parallel_port_slave_arb_share_counter ? (Pushbuttons_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Pushbuttons_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_allgrants = |Pushbuttons_avalon_parallel_port_slave_grant_vector;

  //Pushbuttons_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_end_xfer = ~(Pushbuttons_avalon_parallel_port_slave_waits_for_read | Pushbuttons_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave = Pushbuttons_avalon_parallel_port_slave_end_xfer & (~Pushbuttons_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Pushbuttons_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave & Pushbuttons_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave & ~Pushbuttons_avalon_parallel_port_slave_non_bursting_master_requests);

  //Pushbuttons_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pushbuttons_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Pushbuttons_avalon_parallel_port_slave_arb_counter_enable)
          Pushbuttons_avalon_parallel_port_slave_arb_share_counter <= Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Pushbuttons_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave & ~Pushbuttons_avalon_parallel_port_slave_non_bursting_master_requests))
          Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable <= |Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Pushbuttons/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable2 = |Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Pushbuttons/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Pushbuttons_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave = CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_read & ~Pushbuttons_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register;

  //Pushbuttons_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave = CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Pushbuttons/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Pushbuttons_avalon_parallel_port_slave = CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;

  //allow new arb cycle for Pushbuttons/avalon_parallel_port_slave, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Pushbuttons_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Pushbuttons_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Pushbuttons_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_reset = ~reset_n;

  assign Pushbuttons_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave;
  //Pushbuttons_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_firsttransfer = Pushbuttons_avalon_parallel_port_slave_begins_xfer ? Pushbuttons_avalon_parallel_port_slave_unreg_firsttransfer : Pushbuttons_avalon_parallel_port_slave_reg_firsttransfer;

  //Pushbuttons_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_unreg_firsttransfer = ~(Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable & Pushbuttons_avalon_parallel_port_slave_any_continuerequest);

  //Pushbuttons_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pushbuttons_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Pushbuttons_avalon_parallel_port_slave_begins_xfer)
          Pushbuttons_avalon_parallel_port_slave_reg_firsttransfer <= Pushbuttons_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Pushbuttons_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_beginbursttransfer_internal = Pushbuttons_avalon_parallel_port_slave_begins_xfer;

  //Pushbuttons_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_read = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_read;

  //Pushbuttons_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_write = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Pushbuttons_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Pushbuttons_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_address = shifted_address_to_Pushbuttons_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Pushbuttons_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Pushbuttons_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Pushbuttons_avalon_parallel_port_slave_end_xfer <= Pushbuttons_avalon_parallel_port_slave_end_xfer;
    end


  //Pushbuttons_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_waits_for_read = Pushbuttons_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Pushbuttons_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Pushbuttons_avalon_parallel_port_slave_in_a_read_cycle;

  //Pushbuttons_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_waits_for_write = Pushbuttons_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Pushbuttons_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Pushbuttons_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Pushbuttons_avalon_parallel_port_slave_counter = 0;
  //Pushbuttons_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;

  //assign Pushbuttons_avalon_parallel_port_slave_irq_from_sa = Pushbuttons_avalon_parallel_port_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_irq_from_sa = Pushbuttons_avalon_parallel_port_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Pushbuttons/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
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

module Red_LEDs_avalon_parallel_port_slave_arbitrator (
                                                        // inputs:
                                                         CPU_data_master_address_to_slave,
                                                         CPU_data_master_byteenable,
                                                         CPU_data_master_read,
                                                         CPU_data_master_waitrequest,
                                                         CPU_data_master_write,
                                                         CPU_data_master_writedata,
                                                         Red_LEDs_avalon_parallel_port_slave_readdata,
                                                         clk,
                                                         reset_n,

                                                        // outputs:
                                                         CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave,
                                                         CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave,
                                                         CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave,
                                                         CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave,
                                                         Red_LEDs_avalon_parallel_port_slave_address,
                                                         Red_LEDs_avalon_parallel_port_slave_byteenable,
                                                         Red_LEDs_avalon_parallel_port_slave_chipselect,
                                                         Red_LEDs_avalon_parallel_port_slave_read,
                                                         Red_LEDs_avalon_parallel_port_slave_readdata_from_sa,
                                                         Red_LEDs_avalon_parallel_port_slave_reset,
                                                         Red_LEDs_avalon_parallel_port_slave_write,
                                                         Red_LEDs_avalon_parallel_port_slave_writedata,
                                                         d1_Red_LEDs_avalon_parallel_port_slave_end_xfer,
                                                         registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave
                                                      )
;

  output           CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;
  output  [  1: 0] Red_LEDs_avalon_parallel_port_slave_address;
  output  [  3: 0] Red_LEDs_avalon_parallel_port_slave_byteenable;
  output           Red_LEDs_avalon_parallel_port_slave_chipselect;
  output           Red_LEDs_avalon_parallel_port_slave_read;
  output  [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  output           Red_LEDs_avalon_parallel_port_slave_reset;
  output           Red_LEDs_avalon_parallel_port_slave_write;
  output  [ 31: 0] Red_LEDs_avalon_parallel_port_slave_writedata;
  output           d1_Red_LEDs_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Red_LEDs_avalon_parallel_port_slave;
  wire    [  1: 0] Red_LEDs_avalon_parallel_port_slave_address;
  wire             Red_LEDs_avalon_parallel_port_slave_allgrants;
  wire             Red_LEDs_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Red_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Red_LEDs_avalon_parallel_port_slave_any_continuerequest;
  wire             Red_LEDs_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  2: 0] Red_LEDs_avalon_parallel_port_slave_arb_share_counter;
  wire    [  2: 0] Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  2: 0] Red_LEDs_avalon_parallel_port_slave_arb_share_set_values;
  wire             Red_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Red_LEDs_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Red_LEDs_avalon_parallel_port_slave_byteenable;
  wire             Red_LEDs_avalon_parallel_port_slave_chipselect;
  wire             Red_LEDs_avalon_parallel_port_slave_end_xfer;
  wire             Red_LEDs_avalon_parallel_port_slave_firsttransfer;
  wire             Red_LEDs_avalon_parallel_port_slave_grant_vector;
  wire             Red_LEDs_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Red_LEDs_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Red_LEDs_avalon_parallel_port_slave_master_qreq_vector;
  wire             Red_LEDs_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Red_LEDs_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  reg              Red_LEDs_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Red_LEDs_avalon_parallel_port_slave_reset;
  reg              Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Red_LEDs_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Red_LEDs_avalon_parallel_port_slave_waits_for_read;
  wire             Red_LEDs_avalon_parallel_port_slave_waits_for_write;
  wire             Red_LEDs_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Red_LEDs_avalon_parallel_port_slave_writedata;
  reg              d1_Red_LEDs_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Red_LEDs_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Red_LEDs_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Red_LEDs_avalon_parallel_port_slave_end_xfer;
    end


  assign Red_LEDs_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave));
  //assign Red_LEDs_avalon_parallel_port_slave_readdata_from_sa = Red_LEDs_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_readdata_from_sa = Red_LEDs_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000000) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register_in;

  //Red_LEDs_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Red_LEDs_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;

  //Red_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value = Red_LEDs_avalon_parallel_port_slave_firsttransfer ? (Red_LEDs_avalon_parallel_port_slave_arb_share_set_values - 1) : |Red_LEDs_avalon_parallel_port_slave_arb_share_counter ? (Red_LEDs_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Red_LEDs_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_allgrants = |Red_LEDs_avalon_parallel_port_slave_grant_vector;

  //Red_LEDs_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_end_xfer = ~(Red_LEDs_avalon_parallel_port_slave_waits_for_read | Red_LEDs_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave = Red_LEDs_avalon_parallel_port_slave_end_xfer & (~Red_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Red_LEDs_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave & Red_LEDs_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave & ~Red_LEDs_avalon_parallel_port_slave_non_bursting_master_requests);

  //Red_LEDs_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Red_LEDs_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Red_LEDs_avalon_parallel_port_slave_arb_counter_enable)
          Red_LEDs_avalon_parallel_port_slave_arb_share_counter <= Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Red_LEDs_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave & ~Red_LEDs_avalon_parallel_port_slave_non_bursting_master_requests))
          Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable <= |Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Red_LEDs/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 = |Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Red_LEDs/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Red_LEDs_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave = CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_read & ~Red_LEDs_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register;

  //Red_LEDs_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave = CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Red_LEDs/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Red_LEDs_avalon_parallel_port_slave = CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;

  //allow new arb cycle for Red_LEDs/avalon_parallel_port_slave, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Red_LEDs_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Red_LEDs_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Red_LEDs_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_reset = ~reset_n;

  assign Red_LEDs_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave;
  //Red_LEDs_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_firsttransfer = Red_LEDs_avalon_parallel_port_slave_begins_xfer ? Red_LEDs_avalon_parallel_port_slave_unreg_firsttransfer : Red_LEDs_avalon_parallel_port_slave_reg_firsttransfer;

  //Red_LEDs_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_unreg_firsttransfer = ~(Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable & Red_LEDs_avalon_parallel_port_slave_any_continuerequest);

  //Red_LEDs_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Red_LEDs_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Red_LEDs_avalon_parallel_port_slave_begins_xfer)
          Red_LEDs_avalon_parallel_port_slave_reg_firsttransfer <= Red_LEDs_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Red_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal = Red_LEDs_avalon_parallel_port_slave_begins_xfer;

  //Red_LEDs_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_read = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_read;

  //Red_LEDs_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_write = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Red_LEDs_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Red_LEDs_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_address = shifted_address_to_Red_LEDs_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Red_LEDs_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Red_LEDs_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Red_LEDs_avalon_parallel_port_slave_end_xfer <= Red_LEDs_avalon_parallel_port_slave_end_xfer;
    end


  //Red_LEDs_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_waits_for_read = Red_LEDs_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Red_LEDs_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Red_LEDs_avalon_parallel_port_slave_in_a_read_cycle;

  //Red_LEDs_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_waits_for_write = Red_LEDs_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Red_LEDs_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Red_LEDs_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Red_LEDs_avalon_parallel_port_slave_counter = 0;
  //Red_LEDs_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Red_LEDs/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
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

module rdv_fifo_for_CPU_data_master_to_SDRAM_s1_module (
                                                         // inputs:
                                                          clear_fifo,
                                                          clk,
                                                          data_in,
                                                          read,
                                                          reset_n,
                                                          sync_reset,
                                                          write,

                                                         // outputs:
                                                          data_out,
                                                          empty,
                                                          fifo_contains_ones_n,
                                                          full
                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_CPU_instruction_master_to_SDRAM_s1_module (
                                                                // inputs:
                                                                 clear_fifo,
                                                                 clk,
                                                                 data_in,
                                                                 read,
                                                                 reset_n,
                                                                 sync_reset,
                                                                 write,

                                                                // outputs:
                                                                 data_out,
                                                                 empty,
                                                                 fifo_contains_ones_n,
                                                                 full
                                                              )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SDRAM_s1_arbitrator (
                             // inputs:
                              CPU_data_master_address_to_slave,
                              CPU_data_master_byteenable,
                              CPU_data_master_dbs_address,
                              CPU_data_master_dbs_write_16,
                              CPU_data_master_no_byte_enables_and_last_term,
                              CPU_data_master_read,
                              CPU_data_master_waitrequest,
                              CPU_data_master_write,
                              CPU_instruction_master_address_to_slave,
                              CPU_instruction_master_dbs_address,
                              CPU_instruction_master_latency_counter,
                              CPU_instruction_master_read,
                              SDRAM_s1_readdata,
                              SDRAM_s1_readdatavalid,
                              SDRAM_s1_waitrequest,
                              clk,
                              reset_n,

                             // outputs:
                              CPU_data_master_byteenable_SDRAM_s1,
                              CPU_data_master_granted_SDRAM_s1,
                              CPU_data_master_qualified_request_SDRAM_s1,
                              CPU_data_master_read_data_valid_SDRAM_s1,
                              CPU_data_master_read_data_valid_SDRAM_s1_shift_register,
                              CPU_data_master_requests_SDRAM_s1,
                              CPU_instruction_master_granted_SDRAM_s1,
                              CPU_instruction_master_qualified_request_SDRAM_s1,
                              CPU_instruction_master_read_data_valid_SDRAM_s1,
                              CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register,
                              CPU_instruction_master_requests_SDRAM_s1,
                              SDRAM_s1_address,
                              SDRAM_s1_byteenable_n,
                              SDRAM_s1_chipselect,
                              SDRAM_s1_read_n,
                              SDRAM_s1_readdata_from_sa,
                              SDRAM_s1_reset_n,
                              SDRAM_s1_waitrequest_from_sa,
                              SDRAM_s1_write_n,
                              SDRAM_s1_writedata,
                              d1_SDRAM_s1_end_xfer
                           )
;

  output  [  1: 0] CPU_data_master_byteenable_SDRAM_s1;
  output           CPU_data_master_granted_SDRAM_s1;
  output           CPU_data_master_qualified_request_SDRAM_s1;
  output           CPU_data_master_read_data_valid_SDRAM_s1;
  output           CPU_data_master_read_data_valid_SDRAM_s1_shift_register;
  output           CPU_data_master_requests_SDRAM_s1;
  output           CPU_instruction_master_granted_SDRAM_s1;
  output           CPU_instruction_master_qualified_request_SDRAM_s1;
  output           CPU_instruction_master_read_data_valid_SDRAM_s1;
  output           CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register;
  output           CPU_instruction_master_requests_SDRAM_s1;
  output  [ 21: 0] SDRAM_s1_address;
  output  [  1: 0] SDRAM_s1_byteenable_n;
  output           SDRAM_s1_chipselect;
  output           SDRAM_s1_read_n;
  output  [ 15: 0] SDRAM_s1_readdata_from_sa;
  output           SDRAM_s1_reset_n;
  output           SDRAM_s1_waitrequest_from_sa;
  output           SDRAM_s1_write_n;
  output  [ 15: 0] SDRAM_s1_writedata;
  output           d1_SDRAM_s1_end_xfer;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  1: 0] CPU_data_master_dbs_address;
  input   [ 15: 0] CPU_data_master_dbs_write_16;
  input            CPU_data_master_no_byte_enables_and_last_term;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 27: 0] CPU_instruction_master_address_to_slave;
  input   [  1: 0] CPU_instruction_master_dbs_address;
  input            CPU_instruction_master_latency_counter;
  input            CPU_instruction_master_read;
  input   [ 15: 0] SDRAM_s1_readdata;
  input            SDRAM_s1_readdatavalid;
  input            SDRAM_s1_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire    [  1: 0] CPU_data_master_byteenable_SDRAM_s1;
  wire    [  1: 0] CPU_data_master_byteenable_SDRAM_s1_segment_0;
  wire    [  1: 0] CPU_data_master_byteenable_SDRAM_s1_segment_1;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_SDRAM_s1;
  wire             CPU_data_master_qualified_request_SDRAM_s1;
  wire             CPU_data_master_rdv_fifo_empty_SDRAM_s1;
  wire             CPU_data_master_rdv_fifo_output_from_SDRAM_s1;
  wire             CPU_data_master_read_data_valid_SDRAM_s1;
  wire             CPU_data_master_read_data_valid_SDRAM_s1_shift_register;
  wire             CPU_data_master_requests_SDRAM_s1;
  wire             CPU_data_master_saved_grant_SDRAM_s1;
  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_SDRAM_s1;
  wire             CPU_instruction_master_qualified_request_SDRAM_s1;
  wire             CPU_instruction_master_rdv_fifo_empty_SDRAM_s1;
  wire             CPU_instruction_master_rdv_fifo_output_from_SDRAM_s1;
  wire             CPU_instruction_master_read_data_valid_SDRAM_s1;
  wire             CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register;
  wire             CPU_instruction_master_requests_SDRAM_s1;
  wire             CPU_instruction_master_saved_grant_SDRAM_s1;
  wire    [ 21: 0] SDRAM_s1_address;
  wire             SDRAM_s1_allgrants;
  wire             SDRAM_s1_allow_new_arb_cycle;
  wire             SDRAM_s1_any_bursting_master_saved_grant;
  wire             SDRAM_s1_any_continuerequest;
  reg     [  1: 0] SDRAM_s1_arb_addend;
  wire             SDRAM_s1_arb_counter_enable;
  reg     [  2: 0] SDRAM_s1_arb_share_counter;
  wire    [  2: 0] SDRAM_s1_arb_share_counter_next_value;
  wire    [  2: 0] SDRAM_s1_arb_share_set_values;
  wire    [  1: 0] SDRAM_s1_arb_winner;
  wire             SDRAM_s1_arbitration_holdoff_internal;
  wire             SDRAM_s1_beginbursttransfer_internal;
  wire             SDRAM_s1_begins_xfer;
  wire    [  1: 0] SDRAM_s1_byteenable_n;
  wire             SDRAM_s1_chipselect;
  wire    [  3: 0] SDRAM_s1_chosen_master_double_vector;
  wire    [  1: 0] SDRAM_s1_chosen_master_rot_left;
  wire             SDRAM_s1_end_xfer;
  wire             SDRAM_s1_firsttransfer;
  wire    [  1: 0] SDRAM_s1_grant_vector;
  wire             SDRAM_s1_in_a_read_cycle;
  wire             SDRAM_s1_in_a_write_cycle;
  wire    [  1: 0] SDRAM_s1_master_qreq_vector;
  wire             SDRAM_s1_move_on_to_next_transaction;
  wire             SDRAM_s1_non_bursting_master_requests;
  wire             SDRAM_s1_read_n;
  wire    [ 15: 0] SDRAM_s1_readdata_from_sa;
  wire             SDRAM_s1_readdatavalid_from_sa;
  reg              SDRAM_s1_reg_firsttransfer;
  wire             SDRAM_s1_reset_n;
  reg     [  1: 0] SDRAM_s1_saved_chosen_master_vector;
  reg              SDRAM_s1_slavearbiterlockenable;
  wire             SDRAM_s1_slavearbiterlockenable2;
  wire             SDRAM_s1_unreg_firsttransfer;
  wire             SDRAM_s1_waitrequest_from_sa;
  wire             SDRAM_s1_waits_for_read;
  wire             SDRAM_s1_waits_for_write;
  wire             SDRAM_s1_write_n;
  wire    [ 15: 0] SDRAM_s1_writedata;
  reg              d1_SDRAM_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_SDRAM_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_CPU_data_master_granted_slave_SDRAM_s1;
  reg              last_cycle_CPU_instruction_master_granted_slave_SDRAM_s1;
  wire    [ 28: 0] shifted_address_to_SDRAM_s1_from_CPU_data_master;
  wire    [ 27: 0] shifted_address_to_SDRAM_s1_from_CPU_instruction_master;
  wire             wait_for_SDRAM_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~SDRAM_s1_end_xfer;
    end


  assign SDRAM_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_SDRAM_s1 | CPU_instruction_master_qualified_request_SDRAM_s1));
  //assign SDRAM_s1_readdatavalid_from_sa = SDRAM_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SDRAM_s1_readdatavalid_from_sa = SDRAM_s1_readdatavalid;

  //assign SDRAM_s1_readdata_from_sa = SDRAM_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SDRAM_s1_readdata_from_sa = SDRAM_s1_readdata;

  assign CPU_data_master_requests_SDRAM_s1 = ({CPU_data_master_address_to_slave[28 : 23] , 23'b0} == 29'h0) & (CPU_data_master_read | CPU_data_master_write);
  //assign SDRAM_s1_waitrequest_from_sa = SDRAM_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SDRAM_s1_waitrequest_from_sa = SDRAM_s1_waitrequest;

  //SDRAM_s1_arb_share_counter set values, which is an e_mux
  assign SDRAM_s1_arb_share_set_values = (CPU_data_master_granted_SDRAM_s1)? 2 :
    (CPU_instruction_master_granted_SDRAM_s1)? 2 :
    (CPU_data_master_granted_SDRAM_s1)? 2 :
    (CPU_instruction_master_granted_SDRAM_s1)? 2 :
    1;

  //SDRAM_s1_non_bursting_master_requests mux, which is an e_mux
  assign SDRAM_s1_non_bursting_master_requests = CPU_data_master_requests_SDRAM_s1 |
    CPU_instruction_master_requests_SDRAM_s1 |
    CPU_data_master_requests_SDRAM_s1 |
    CPU_instruction_master_requests_SDRAM_s1;

  //SDRAM_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign SDRAM_s1_any_bursting_master_saved_grant = 0;

  //SDRAM_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign SDRAM_s1_arb_share_counter_next_value = SDRAM_s1_firsttransfer ? (SDRAM_s1_arb_share_set_values - 1) : |SDRAM_s1_arb_share_counter ? (SDRAM_s1_arb_share_counter - 1) : 0;

  //SDRAM_s1_allgrants all slave grants, which is an e_mux
  assign SDRAM_s1_allgrants = (|SDRAM_s1_grant_vector) |
    (|SDRAM_s1_grant_vector) |
    (|SDRAM_s1_grant_vector) |
    (|SDRAM_s1_grant_vector);

  //SDRAM_s1_end_xfer assignment, which is an e_assign
  assign SDRAM_s1_end_xfer = ~(SDRAM_s1_waits_for_read | SDRAM_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_SDRAM_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_SDRAM_s1 = SDRAM_s1_end_xfer & (~SDRAM_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //SDRAM_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign SDRAM_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_SDRAM_s1 & SDRAM_s1_allgrants) | (end_xfer_arb_share_counter_term_SDRAM_s1 & ~SDRAM_s1_non_bursting_master_requests);

  //SDRAM_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_s1_arb_share_counter <= 0;
      else if (SDRAM_s1_arb_counter_enable)
          SDRAM_s1_arb_share_counter <= SDRAM_s1_arb_share_counter_next_value;
    end


  //SDRAM_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_s1_slavearbiterlockenable <= 0;
      else if ((|SDRAM_s1_master_qreq_vector & end_xfer_arb_share_counter_term_SDRAM_s1) | (end_xfer_arb_share_counter_term_SDRAM_s1 & ~SDRAM_s1_non_bursting_master_requests))
          SDRAM_s1_slavearbiterlockenable <= |SDRAM_s1_arb_share_counter_next_value;
    end


  //CPU/data_master SDRAM/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = SDRAM_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //SDRAM_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign SDRAM_s1_slavearbiterlockenable2 = |SDRAM_s1_arb_share_counter_next_value;

  //CPU/data_master SDRAM/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = SDRAM_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //CPU/instruction_master SDRAM/s1 arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = SDRAM_s1_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //CPU/instruction_master SDRAM/s1 arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = SDRAM_s1_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //CPU/instruction_master granted SDRAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_instruction_master_granted_slave_SDRAM_s1 <= 0;
      else 
        last_cycle_CPU_instruction_master_granted_slave_SDRAM_s1 <= CPU_instruction_master_saved_grant_SDRAM_s1 ? 1 : (SDRAM_s1_arbitration_holdoff_internal | ~CPU_instruction_master_requests_SDRAM_s1) ? 0 : last_cycle_CPU_instruction_master_granted_slave_SDRAM_s1;
    end


  //CPU_instruction_master_continuerequest continued request, which is an e_mux
  assign CPU_instruction_master_continuerequest = last_cycle_CPU_instruction_master_granted_slave_SDRAM_s1 & CPU_instruction_master_requests_SDRAM_s1;

  //SDRAM_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign SDRAM_s1_any_continuerequest = CPU_instruction_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_SDRAM_s1 = CPU_data_master_requests_SDRAM_s1 & ~((CPU_data_master_read & (~CPU_data_master_waitrequest | (|CPU_data_master_read_data_valid_SDRAM_s1_shift_register))) | ((~CPU_data_master_waitrequest | CPU_data_master_no_byte_enables_and_last_term | !CPU_data_master_byteenable_SDRAM_s1) & CPU_data_master_write) | CPU_instruction_master_arbiterlock);
  //unique name for SDRAM_s1_move_on_to_next_transaction, which is an e_assign
  assign SDRAM_s1_move_on_to_next_transaction = SDRAM_s1_readdatavalid_from_sa;

  //rdv_fifo_for_CPU_data_master_to_SDRAM_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_CPU_data_master_to_SDRAM_s1_module rdv_fifo_for_CPU_data_master_to_SDRAM_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (CPU_data_master_granted_SDRAM_s1),
      .data_out             (CPU_data_master_rdv_fifo_output_from_SDRAM_s1),
      .empty                (),
      .fifo_contains_ones_n (CPU_data_master_rdv_fifo_empty_SDRAM_s1),
      .full                 (),
      .read                 (SDRAM_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~SDRAM_s1_waits_for_read)
    );

  assign CPU_data_master_read_data_valid_SDRAM_s1_shift_register = ~CPU_data_master_rdv_fifo_empty_SDRAM_s1;
  //local readdatavalid CPU_data_master_read_data_valid_SDRAM_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_SDRAM_s1 = (SDRAM_s1_readdatavalid_from_sa & CPU_data_master_rdv_fifo_output_from_SDRAM_s1) & ~ CPU_data_master_rdv_fifo_empty_SDRAM_s1;

  //SDRAM_s1_writedata mux, which is an e_mux
  assign SDRAM_s1_writedata = CPU_data_master_dbs_write_16;

  assign CPU_instruction_master_requests_SDRAM_s1 = (({CPU_instruction_master_address_to_slave[27 : 23] , 23'b0} == 28'h0) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //CPU/data_master granted SDRAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_SDRAM_s1 <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_SDRAM_s1 <= CPU_data_master_saved_grant_SDRAM_s1 ? 1 : (SDRAM_s1_arbitration_holdoff_internal | ~CPU_data_master_requests_SDRAM_s1) ? 0 : last_cycle_CPU_data_master_granted_slave_SDRAM_s1;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_SDRAM_s1 & CPU_data_master_requests_SDRAM_s1;

  assign CPU_instruction_master_qualified_request_SDRAM_s1 = CPU_instruction_master_requests_SDRAM_s1 & ~((CPU_instruction_master_read & ((CPU_instruction_master_latency_counter != 0) | (1 < CPU_instruction_master_latency_counter))) | CPU_data_master_arbiterlock);
  //rdv_fifo_for_CPU_instruction_master_to_SDRAM_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_CPU_instruction_master_to_SDRAM_s1_module rdv_fifo_for_CPU_instruction_master_to_SDRAM_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (CPU_instruction_master_granted_SDRAM_s1),
      .data_out             (CPU_instruction_master_rdv_fifo_output_from_SDRAM_s1),
      .empty                (),
      .fifo_contains_ones_n (CPU_instruction_master_rdv_fifo_empty_SDRAM_s1),
      .full                 (),
      .read                 (SDRAM_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~SDRAM_s1_waits_for_read)
    );

  assign CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register = ~CPU_instruction_master_rdv_fifo_empty_SDRAM_s1;
  //local readdatavalid CPU_instruction_master_read_data_valid_SDRAM_s1, which is an e_mux
  assign CPU_instruction_master_read_data_valid_SDRAM_s1 = (SDRAM_s1_readdatavalid_from_sa & CPU_instruction_master_rdv_fifo_output_from_SDRAM_s1) & ~ CPU_instruction_master_rdv_fifo_empty_SDRAM_s1;

  //allow new arb cycle for SDRAM/s1, which is an e_assign
  assign SDRAM_s1_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~CPU_instruction_master_arbiterlock;

  //CPU/instruction_master assignment into master qualified-requests vector for SDRAM/s1, which is an e_assign
  assign SDRAM_s1_master_qreq_vector[0] = CPU_instruction_master_qualified_request_SDRAM_s1;

  //CPU/instruction_master grant SDRAM/s1, which is an e_assign
  assign CPU_instruction_master_granted_SDRAM_s1 = SDRAM_s1_grant_vector[0];

  //CPU/instruction_master saved-grant SDRAM/s1, which is an e_assign
  assign CPU_instruction_master_saved_grant_SDRAM_s1 = SDRAM_s1_arb_winner[0] && CPU_instruction_master_requests_SDRAM_s1;

  //CPU/data_master assignment into master qualified-requests vector for SDRAM/s1, which is an e_assign
  assign SDRAM_s1_master_qreq_vector[1] = CPU_data_master_qualified_request_SDRAM_s1;

  //CPU/data_master grant SDRAM/s1, which is an e_assign
  assign CPU_data_master_granted_SDRAM_s1 = SDRAM_s1_grant_vector[1];

  //CPU/data_master saved-grant SDRAM/s1, which is an e_assign
  assign CPU_data_master_saved_grant_SDRAM_s1 = SDRAM_s1_arb_winner[1] && CPU_data_master_requests_SDRAM_s1;

  //SDRAM/s1 chosen-master double-vector, which is an e_assign
  assign SDRAM_s1_chosen_master_double_vector = {SDRAM_s1_master_qreq_vector, SDRAM_s1_master_qreq_vector} & ({~SDRAM_s1_master_qreq_vector, ~SDRAM_s1_master_qreq_vector} + SDRAM_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign SDRAM_s1_arb_winner = (SDRAM_s1_allow_new_arb_cycle & | SDRAM_s1_grant_vector) ? SDRAM_s1_grant_vector : SDRAM_s1_saved_chosen_master_vector;

  //saved SDRAM_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_s1_saved_chosen_master_vector <= 0;
      else if (SDRAM_s1_allow_new_arb_cycle)
          SDRAM_s1_saved_chosen_master_vector <= |SDRAM_s1_grant_vector ? SDRAM_s1_grant_vector : SDRAM_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign SDRAM_s1_grant_vector = {(SDRAM_s1_chosen_master_double_vector[1] | SDRAM_s1_chosen_master_double_vector[3]),
    (SDRAM_s1_chosen_master_double_vector[0] | SDRAM_s1_chosen_master_double_vector[2])};

  //SDRAM/s1 chosen master rotated left, which is an e_assign
  assign SDRAM_s1_chosen_master_rot_left = (SDRAM_s1_arb_winner << 1) ? (SDRAM_s1_arb_winner << 1) : 1;

  //SDRAM/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_s1_arb_addend <= 1;
      else if (|SDRAM_s1_grant_vector)
          SDRAM_s1_arb_addend <= SDRAM_s1_end_xfer? SDRAM_s1_chosen_master_rot_left : SDRAM_s1_grant_vector;
    end


  //SDRAM_s1_reset_n assignment, which is an e_assign
  assign SDRAM_s1_reset_n = reset_n;

  assign SDRAM_s1_chipselect = CPU_data_master_granted_SDRAM_s1 | CPU_instruction_master_granted_SDRAM_s1;
  //SDRAM_s1_firsttransfer first transaction, which is an e_assign
  assign SDRAM_s1_firsttransfer = SDRAM_s1_begins_xfer ? SDRAM_s1_unreg_firsttransfer : SDRAM_s1_reg_firsttransfer;

  //SDRAM_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign SDRAM_s1_unreg_firsttransfer = ~(SDRAM_s1_slavearbiterlockenable & SDRAM_s1_any_continuerequest);

  //SDRAM_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_s1_reg_firsttransfer <= 1'b1;
      else if (SDRAM_s1_begins_xfer)
          SDRAM_s1_reg_firsttransfer <= SDRAM_s1_unreg_firsttransfer;
    end


  //SDRAM_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign SDRAM_s1_beginbursttransfer_internal = SDRAM_s1_begins_xfer;

  //SDRAM_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign SDRAM_s1_arbitration_holdoff_internal = SDRAM_s1_begins_xfer & SDRAM_s1_firsttransfer;

  //~SDRAM_s1_read_n assignment, which is an e_mux
  assign SDRAM_s1_read_n = ~((CPU_data_master_granted_SDRAM_s1 & CPU_data_master_read) | (CPU_instruction_master_granted_SDRAM_s1 & CPU_instruction_master_read));

  //~SDRAM_s1_write_n assignment, which is an e_mux
  assign SDRAM_s1_write_n = ~(CPU_data_master_granted_SDRAM_s1 & CPU_data_master_write);

  assign shifted_address_to_SDRAM_s1_from_CPU_data_master = {CPU_data_master_address_to_slave >> 2,
    CPU_data_master_dbs_address[1],
    {1 {1'b0}}};

  //SDRAM_s1_address mux, which is an e_mux
  assign SDRAM_s1_address = (CPU_data_master_granted_SDRAM_s1)? (shifted_address_to_SDRAM_s1_from_CPU_data_master >> 1) :
    (shifted_address_to_SDRAM_s1_from_CPU_instruction_master >> 1);

  assign shifted_address_to_SDRAM_s1_from_CPU_instruction_master = {CPU_instruction_master_address_to_slave >> 2,
    CPU_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_SDRAM_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_SDRAM_s1_end_xfer <= 1;
      else 
        d1_SDRAM_s1_end_xfer <= SDRAM_s1_end_xfer;
    end


  //SDRAM_s1_waits_for_read in a cycle, which is an e_mux
  assign SDRAM_s1_waits_for_read = SDRAM_s1_in_a_read_cycle & SDRAM_s1_waitrequest_from_sa;

  //SDRAM_s1_in_a_read_cycle assignment, which is an e_assign
  assign SDRAM_s1_in_a_read_cycle = (CPU_data_master_granted_SDRAM_s1 & CPU_data_master_read) | (CPU_instruction_master_granted_SDRAM_s1 & CPU_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = SDRAM_s1_in_a_read_cycle;

  //SDRAM_s1_waits_for_write in a cycle, which is an e_mux
  assign SDRAM_s1_waits_for_write = SDRAM_s1_in_a_write_cycle & SDRAM_s1_waitrequest_from_sa;

  //SDRAM_s1_in_a_write_cycle assignment, which is an e_assign
  assign SDRAM_s1_in_a_write_cycle = CPU_data_master_granted_SDRAM_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = SDRAM_s1_in_a_write_cycle;

  assign wait_for_SDRAM_s1_counter = 0;
  //~SDRAM_s1_byteenable_n byte enable port mux, which is an e_mux
  assign SDRAM_s1_byteenable_n = ~((CPU_data_master_granted_SDRAM_s1)? CPU_data_master_byteenable_SDRAM_s1 :
    -1);

  assign {CPU_data_master_byteenable_SDRAM_s1_segment_1,
CPU_data_master_byteenable_SDRAM_s1_segment_0} = CPU_data_master_byteenable;
  assign CPU_data_master_byteenable_SDRAM_s1 = ((CPU_data_master_dbs_address[1] == 0))? CPU_data_master_byteenable_SDRAM_s1_segment_0 :
    CPU_data_master_byteenable_SDRAM_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //SDRAM/s1 enable non-zero assertions, which is an e_register
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
      if (CPU_data_master_granted_SDRAM_s1 + CPU_instruction_master_granted_SDRAM_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_SDRAM_s1 + CPU_instruction_master_saved_grant_SDRAM_s1 > 1)
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

module rdv_fifo_for_CPU_data_master_to_SRAM_avalon_sram_slave_module (
                                                                       // inputs:
                                                                        clear_fifo,
                                                                        clk,
                                                                        data_in,
                                                                        read,
                                                                        reset_n,
                                                                        sync_reset,
                                                                        write,

                                                                       // outputs:
                                                                        data_out,
                                                                        empty,
                                                                        fifo_contains_ones_n,
                                                                        full
                                                                     )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_VGA_Pixel_Buffer_avalon_pixel_dma_master_to_SRAM_avalon_sram_slave_module (
                                                                                                // inputs:
                                                                                                 clear_fifo,
                                                                                                 clk,
                                                                                                 data_in,
                                                                                                 read,
                                                                                                 reset_n,
                                                                                                 sync_reset,
                                                                                                 write,

                                                                                                // outputs:
                                                                                                 data_out,
                                                                                                 empty,
                                                                                                 fifo_contains_ones_n,
                                                                                                 full
                                                                                              )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SRAM_avalon_sram_slave_arbitrator (
                                           // inputs:
                                            CPU_data_master_address_to_slave,
                                            CPU_data_master_byteenable,
                                            CPU_data_master_dbs_address,
                                            CPU_data_master_dbs_write_16,
                                            CPU_data_master_no_byte_enables_and_last_term,
                                            CPU_data_master_read,
                                            CPU_data_master_waitrequest,
                                            CPU_data_master_write,
                                            SRAM_avalon_sram_slave_readdata,
                                            SRAM_avalon_sram_slave_readdatavalid,
                                            VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave,
                                            VGA_Pixel_Buffer_avalon_pixel_dma_master_arbiterlock,
                                            VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter,
                                            VGA_Pixel_Buffer_avalon_pixel_dma_master_read,
                                            clk,
                                            reset_n,

                                           // outputs:
                                            CPU_data_master_byteenable_SRAM_avalon_sram_slave,
                                            CPU_data_master_granted_SRAM_avalon_sram_slave,
                                            CPU_data_master_qualified_request_SRAM_avalon_sram_slave,
                                            CPU_data_master_read_data_valid_SRAM_avalon_sram_slave,
                                            CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register,
                                            CPU_data_master_requests_SRAM_avalon_sram_slave,
                                            SRAM_avalon_sram_slave_address,
                                            SRAM_avalon_sram_slave_byteenable,
                                            SRAM_avalon_sram_slave_read,
                                            SRAM_avalon_sram_slave_readdata_from_sa,
                                            SRAM_avalon_sram_slave_reset,
                                            SRAM_avalon_sram_slave_write,
                                            SRAM_avalon_sram_slave_writedata,
                                            VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave,
                                            VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave,
                                            VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave,
                                            VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave_shift_register,
                                            VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave,
                                            d1_SRAM_avalon_sram_slave_end_xfer
                                         )
;

  output  [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave;
  output           CPU_data_master_granted_SRAM_avalon_sram_slave;
  output           CPU_data_master_qualified_request_SRAM_avalon_sram_slave;
  output           CPU_data_master_read_data_valid_SRAM_avalon_sram_slave;
  output           CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  output           CPU_data_master_requests_SRAM_avalon_sram_slave;
  output  [ 17: 0] SRAM_avalon_sram_slave_address;
  output  [  1: 0] SRAM_avalon_sram_slave_byteenable;
  output           SRAM_avalon_sram_slave_read;
  output  [ 15: 0] SRAM_avalon_sram_slave_readdata_from_sa;
  output           SRAM_avalon_sram_slave_reset;
  output           SRAM_avalon_sram_slave_write;
  output  [ 15: 0] SRAM_avalon_sram_slave_writedata;
  output           VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave;
  output           VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave;
  output           VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave;
  output           VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  output           VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave;
  output           d1_SRAM_avalon_sram_slave_end_xfer;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  1: 0] CPU_data_master_dbs_address;
  input   [ 15: 0] CPU_data_master_dbs_write_16;
  input            CPU_data_master_no_byte_enables_and_last_term;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 15: 0] SRAM_avalon_sram_slave_readdata;
  input            SRAM_avalon_sram_slave_readdatavalid;
  input   [ 31: 0] VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave;
  input            VGA_Pixel_Buffer_avalon_pixel_dma_master_arbiterlock;
  input            VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter;
  input            VGA_Pixel_Buffer_avalon_pixel_dma_master_read;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire    [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave;
  wire    [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_0;
  wire    [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_1;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_SRAM_avalon_sram_slave;
  wire             CPU_data_master_qualified_request_SRAM_avalon_sram_slave;
  wire             CPU_data_master_rdv_fifo_empty_SRAM_avalon_sram_slave;
  wire             CPU_data_master_rdv_fifo_output_from_SRAM_avalon_sram_slave;
  wire             CPU_data_master_read_data_valid_SRAM_avalon_sram_slave;
  wire             CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  wire             CPU_data_master_requests_SRAM_avalon_sram_slave;
  wire             CPU_data_master_saved_grant_SRAM_avalon_sram_slave;
  wire    [ 17: 0] SRAM_avalon_sram_slave_address;
  wire             SRAM_avalon_sram_slave_allgrants;
  wire             SRAM_avalon_sram_slave_allow_new_arb_cycle;
  wire             SRAM_avalon_sram_slave_any_bursting_master_saved_grant;
  wire             SRAM_avalon_sram_slave_any_continuerequest;
  reg     [  1: 0] SRAM_avalon_sram_slave_arb_addend;
  wire             SRAM_avalon_sram_slave_arb_counter_enable;
  reg     [  2: 0] SRAM_avalon_sram_slave_arb_share_counter;
  wire    [  2: 0] SRAM_avalon_sram_slave_arb_share_counter_next_value;
  wire    [  2: 0] SRAM_avalon_sram_slave_arb_share_set_values;
  wire    [  1: 0] SRAM_avalon_sram_slave_arb_winner;
  wire             SRAM_avalon_sram_slave_arbitration_holdoff_internal;
  wire             SRAM_avalon_sram_slave_beginbursttransfer_internal;
  wire             SRAM_avalon_sram_slave_begins_xfer;
  wire    [  1: 0] SRAM_avalon_sram_slave_byteenable;
  wire    [  3: 0] SRAM_avalon_sram_slave_chosen_master_double_vector;
  wire    [  1: 0] SRAM_avalon_sram_slave_chosen_master_rot_left;
  wire             SRAM_avalon_sram_slave_end_xfer;
  wire             SRAM_avalon_sram_slave_firsttransfer;
  wire    [  1: 0] SRAM_avalon_sram_slave_grant_vector;
  wire             SRAM_avalon_sram_slave_in_a_read_cycle;
  wire             SRAM_avalon_sram_slave_in_a_write_cycle;
  wire    [  1: 0] SRAM_avalon_sram_slave_master_qreq_vector;
  wire             SRAM_avalon_sram_slave_move_on_to_next_transaction;
  wire             SRAM_avalon_sram_slave_non_bursting_master_requests;
  wire             SRAM_avalon_sram_slave_read;
  wire    [ 15: 0] SRAM_avalon_sram_slave_readdata_from_sa;
  wire             SRAM_avalon_sram_slave_readdatavalid_from_sa;
  reg              SRAM_avalon_sram_slave_reg_firsttransfer;
  wire             SRAM_avalon_sram_slave_reset;
  reg     [  1: 0] SRAM_avalon_sram_slave_saved_chosen_master_vector;
  reg              SRAM_avalon_sram_slave_slavearbiterlockenable;
  wire             SRAM_avalon_sram_slave_slavearbiterlockenable2;
  wire             SRAM_avalon_sram_slave_unreg_firsttransfer;
  wire             SRAM_avalon_sram_slave_waits_for_read;
  wire             SRAM_avalon_sram_slave_waits_for_write;
  wire             SRAM_avalon_sram_slave_write;
  wire    [ 15: 0] SRAM_avalon_sram_slave_writedata;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_arbiterlock2;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_continuerequest;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_rdv_fifo_empty_SRAM_avalon_sram_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_rdv_fifo_output_from_SRAM_avalon_sram_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_saved_grant_SRAM_avalon_sram_slave;
  reg              d1_SRAM_avalon_sram_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_CPU_data_master_granted_slave_SRAM_avalon_sram_slave;
  reg              last_cycle_VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_slave_SRAM_avalon_sram_slave;
  wire             saved_chosen_master_btw_VGA_Pixel_Buffer_avalon_pixel_dma_master_and_SRAM_avalon_sram_slave;
  wire    [ 28: 0] shifted_address_to_SRAM_avalon_sram_slave_from_CPU_data_master;
  wire    [ 31: 0] shifted_address_to_SRAM_avalon_sram_slave_from_VGA_Pixel_Buffer_avalon_pixel_dma_master;
  wire             wait_for_SRAM_avalon_sram_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~SRAM_avalon_sram_slave_end_xfer;
    end


  assign SRAM_avalon_sram_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_SRAM_avalon_sram_slave | VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave));
  //assign SRAM_avalon_sram_slave_readdata_from_sa = SRAM_avalon_sram_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SRAM_avalon_sram_slave_readdata_from_sa = SRAM_avalon_sram_slave_readdata;

  assign CPU_data_master_requests_SRAM_avalon_sram_slave = ({CPU_data_master_address_to_slave[28 : 19] , 19'b0} == 29'h8000000) & (CPU_data_master_read | CPU_data_master_write);
  //assign SRAM_avalon_sram_slave_readdatavalid_from_sa = SRAM_avalon_sram_slave_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SRAM_avalon_sram_slave_readdatavalid_from_sa = SRAM_avalon_sram_slave_readdatavalid;

  //SRAM_avalon_sram_slave_arb_share_counter set values, which is an e_mux
  assign SRAM_avalon_sram_slave_arb_share_set_values = (CPU_data_master_granted_SRAM_avalon_sram_slave)? 2 :
    (CPU_data_master_granted_SRAM_avalon_sram_slave)? 2 :
    1;

  //SRAM_avalon_sram_slave_non_bursting_master_requests mux, which is an e_mux
  assign SRAM_avalon_sram_slave_non_bursting_master_requests = CPU_data_master_requests_SRAM_avalon_sram_slave |
    VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave |
    CPU_data_master_requests_SRAM_avalon_sram_slave |
    VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave;

  //SRAM_avalon_sram_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign SRAM_avalon_sram_slave_any_bursting_master_saved_grant = 0;

  //SRAM_avalon_sram_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign SRAM_avalon_sram_slave_arb_share_counter_next_value = SRAM_avalon_sram_slave_firsttransfer ? (SRAM_avalon_sram_slave_arb_share_set_values - 1) : |SRAM_avalon_sram_slave_arb_share_counter ? (SRAM_avalon_sram_slave_arb_share_counter - 1) : 0;

  //SRAM_avalon_sram_slave_allgrants all slave grants, which is an e_mux
  assign SRAM_avalon_sram_slave_allgrants = (|SRAM_avalon_sram_slave_grant_vector) |
    (|SRAM_avalon_sram_slave_grant_vector) |
    (|SRAM_avalon_sram_slave_grant_vector) |
    (|SRAM_avalon_sram_slave_grant_vector);

  //SRAM_avalon_sram_slave_end_xfer assignment, which is an e_assign
  assign SRAM_avalon_sram_slave_end_xfer = ~(SRAM_avalon_sram_slave_waits_for_read | SRAM_avalon_sram_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave = SRAM_avalon_sram_slave_end_xfer & (~SRAM_avalon_sram_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //SRAM_avalon_sram_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign SRAM_avalon_sram_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave & SRAM_avalon_sram_slave_allgrants) | (end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave & ~SRAM_avalon_sram_slave_non_bursting_master_requests);

  //SRAM_avalon_sram_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SRAM_avalon_sram_slave_arb_share_counter <= 0;
      else if (SRAM_avalon_sram_slave_arb_counter_enable)
          SRAM_avalon_sram_slave_arb_share_counter <= SRAM_avalon_sram_slave_arb_share_counter_next_value;
    end


  //SRAM_avalon_sram_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SRAM_avalon_sram_slave_slavearbiterlockenable <= 0;
      else if ((|SRAM_avalon_sram_slave_master_qreq_vector & end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave) | (end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave & ~SRAM_avalon_sram_slave_non_bursting_master_requests))
          SRAM_avalon_sram_slave_slavearbiterlockenable <= |SRAM_avalon_sram_slave_arb_share_counter_next_value;
    end


  //CPU/data_master SRAM/avalon_sram_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = SRAM_avalon_sram_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //SRAM_avalon_sram_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign SRAM_avalon_sram_slave_slavearbiterlockenable2 = |SRAM_avalon_sram_slave_arb_share_counter_next_value;

  //CPU/data_master SRAM/avalon_sram_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = SRAM_avalon_sram_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //VGA_Pixel_Buffer/avalon_pixel_dma_master SRAM/avalon_sram_slave arbiterlock2, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_arbiterlock2 = SRAM_avalon_sram_slave_slavearbiterlockenable2 & VGA_Pixel_Buffer_avalon_pixel_dma_master_continuerequest;

  //VGA_Pixel_Buffer/avalon_pixel_dma_master granted SRAM/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_slave_SRAM_avalon_sram_slave <= 0;
      else 
        last_cycle_VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_slave_SRAM_avalon_sram_slave <= VGA_Pixel_Buffer_avalon_pixel_dma_master_saved_grant_SRAM_avalon_sram_slave ? 1 : (SRAM_avalon_sram_slave_arbitration_holdoff_internal | ~VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave) ? 0 : last_cycle_VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_slave_SRAM_avalon_sram_slave;
    end


  //VGA_Pixel_Buffer_avalon_pixel_dma_master_continuerequest continued request, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_continuerequest = last_cycle_VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_slave_SRAM_avalon_sram_slave & VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave;

  //SRAM_avalon_sram_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign SRAM_avalon_sram_slave_any_continuerequest = VGA_Pixel_Buffer_avalon_pixel_dma_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_SRAM_avalon_sram_slave = CPU_data_master_requests_SRAM_avalon_sram_slave & ~((CPU_data_master_read & (~CPU_data_master_waitrequest | (|CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register))) | ((~CPU_data_master_waitrequest | CPU_data_master_no_byte_enables_and_last_term | !CPU_data_master_byteenable_SRAM_avalon_sram_slave) & CPU_data_master_write) | (VGA_Pixel_Buffer_avalon_pixel_dma_master_arbiterlock & (saved_chosen_master_btw_VGA_Pixel_Buffer_avalon_pixel_dma_master_and_SRAM_avalon_sram_slave)));
  //unique name for SRAM_avalon_sram_slave_move_on_to_next_transaction, which is an e_assign
  assign SRAM_avalon_sram_slave_move_on_to_next_transaction = SRAM_avalon_sram_slave_readdatavalid_from_sa;

  //rdv_fifo_for_CPU_data_master_to_SRAM_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_CPU_data_master_to_SRAM_avalon_sram_slave_module rdv_fifo_for_CPU_data_master_to_SRAM_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (CPU_data_master_granted_SRAM_avalon_sram_slave),
      .data_out             (CPU_data_master_rdv_fifo_output_from_SRAM_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (CPU_data_master_rdv_fifo_empty_SRAM_avalon_sram_slave),
      .full                 (),
      .read                 (SRAM_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~SRAM_avalon_sram_slave_waits_for_read)
    );

  assign CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register = ~CPU_data_master_rdv_fifo_empty_SRAM_avalon_sram_slave;
  //local readdatavalid CPU_data_master_read_data_valid_SRAM_avalon_sram_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_SRAM_avalon_sram_slave = (SRAM_avalon_sram_slave_readdatavalid_from_sa & CPU_data_master_rdv_fifo_output_from_SRAM_avalon_sram_slave) & ~ CPU_data_master_rdv_fifo_empty_SRAM_avalon_sram_slave;

  //SRAM_avalon_sram_slave_writedata mux, which is an e_mux
  assign SRAM_avalon_sram_slave_writedata = CPU_data_master_dbs_write_16;

  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave = (({VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave[31 : 19] , 19'b0} == 32'h8000000) & (VGA_Pixel_Buffer_avalon_pixel_dma_master_read)) & VGA_Pixel_Buffer_avalon_pixel_dma_master_read;
  //CPU/data_master granted SRAM/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_SRAM_avalon_sram_slave <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_SRAM_avalon_sram_slave <= CPU_data_master_saved_grant_SRAM_avalon_sram_slave ? 1 : (SRAM_avalon_sram_slave_arbitration_holdoff_internal | ~CPU_data_master_requests_SRAM_avalon_sram_slave) ? 0 : last_cycle_CPU_data_master_granted_slave_SRAM_avalon_sram_slave;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_SRAM_avalon_sram_slave & CPU_data_master_requests_SRAM_avalon_sram_slave;

  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave = VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave & ~((VGA_Pixel_Buffer_avalon_pixel_dma_master_read & ((VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter != 0) | (1 < VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter))) | CPU_data_master_arbiterlock);
  //rdv_fifo_for_VGA_Pixel_Buffer_avalon_pixel_dma_master_to_SRAM_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_VGA_Pixel_Buffer_avalon_pixel_dma_master_to_SRAM_avalon_sram_slave_module rdv_fifo_for_VGA_Pixel_Buffer_avalon_pixel_dma_master_to_SRAM_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave),
      .data_out             (VGA_Pixel_Buffer_avalon_pixel_dma_master_rdv_fifo_output_from_SRAM_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (VGA_Pixel_Buffer_avalon_pixel_dma_master_rdv_fifo_empty_SRAM_avalon_sram_slave),
      .full                 (),
      .read                 (SRAM_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~SRAM_avalon_sram_slave_waits_for_read)
    );

  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave_shift_register = ~VGA_Pixel_Buffer_avalon_pixel_dma_master_rdv_fifo_empty_SRAM_avalon_sram_slave;
  //local readdatavalid VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave = (SRAM_avalon_sram_slave_readdatavalid_from_sa & VGA_Pixel_Buffer_avalon_pixel_dma_master_rdv_fifo_output_from_SRAM_avalon_sram_slave) & ~ VGA_Pixel_Buffer_avalon_pixel_dma_master_rdv_fifo_empty_SRAM_avalon_sram_slave;

  //allow new arb cycle for SRAM/avalon_sram_slave, which is an e_assign
  assign SRAM_avalon_sram_slave_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~(VGA_Pixel_Buffer_avalon_pixel_dma_master_arbiterlock & (saved_chosen_master_btw_VGA_Pixel_Buffer_avalon_pixel_dma_master_and_SRAM_avalon_sram_slave));

  //VGA_Pixel_Buffer/avalon_pixel_dma_master assignment into master qualified-requests vector for SRAM/avalon_sram_slave, which is an e_assign
  assign SRAM_avalon_sram_slave_master_qreq_vector[0] = VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave;

  //VGA_Pixel_Buffer/avalon_pixel_dma_master grant SRAM/avalon_sram_slave, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave = SRAM_avalon_sram_slave_grant_vector[0];

  //VGA_Pixel_Buffer/avalon_pixel_dma_master saved-grant SRAM/avalon_sram_slave, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_saved_grant_SRAM_avalon_sram_slave = SRAM_avalon_sram_slave_arb_winner[0] && VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave;

  //saved chosen master btw VGA_Pixel_Buffer/avalon_pixel_dma_master and SRAM/avalon_sram_slave, which is an e_assign
  assign saved_chosen_master_btw_VGA_Pixel_Buffer_avalon_pixel_dma_master_and_SRAM_avalon_sram_slave = SRAM_avalon_sram_slave_saved_chosen_master_vector[0];

  //CPU/data_master assignment into master qualified-requests vector for SRAM/avalon_sram_slave, which is an e_assign
  assign SRAM_avalon_sram_slave_master_qreq_vector[1] = CPU_data_master_qualified_request_SRAM_avalon_sram_slave;

  //CPU/data_master grant SRAM/avalon_sram_slave, which is an e_assign
  assign CPU_data_master_granted_SRAM_avalon_sram_slave = SRAM_avalon_sram_slave_grant_vector[1];

  //CPU/data_master saved-grant SRAM/avalon_sram_slave, which is an e_assign
  assign CPU_data_master_saved_grant_SRAM_avalon_sram_slave = SRAM_avalon_sram_slave_arb_winner[1] && CPU_data_master_requests_SRAM_avalon_sram_slave;

  //SRAM/avalon_sram_slave chosen-master double-vector, which is an e_assign
  assign SRAM_avalon_sram_slave_chosen_master_double_vector = {SRAM_avalon_sram_slave_master_qreq_vector, SRAM_avalon_sram_slave_master_qreq_vector} & ({~SRAM_avalon_sram_slave_master_qreq_vector, ~SRAM_avalon_sram_slave_master_qreq_vector} + SRAM_avalon_sram_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign SRAM_avalon_sram_slave_arb_winner = (SRAM_avalon_sram_slave_allow_new_arb_cycle & | SRAM_avalon_sram_slave_grant_vector) ? SRAM_avalon_sram_slave_grant_vector : SRAM_avalon_sram_slave_saved_chosen_master_vector;

  //saved SRAM_avalon_sram_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SRAM_avalon_sram_slave_saved_chosen_master_vector <= 0;
      else if (SRAM_avalon_sram_slave_allow_new_arb_cycle)
          SRAM_avalon_sram_slave_saved_chosen_master_vector <= |SRAM_avalon_sram_slave_grant_vector ? SRAM_avalon_sram_slave_grant_vector : SRAM_avalon_sram_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign SRAM_avalon_sram_slave_grant_vector = {(SRAM_avalon_sram_slave_chosen_master_double_vector[1] | SRAM_avalon_sram_slave_chosen_master_double_vector[3]),
    (SRAM_avalon_sram_slave_chosen_master_double_vector[0] | SRAM_avalon_sram_slave_chosen_master_double_vector[2])};

  //SRAM/avalon_sram_slave chosen master rotated left, which is an e_assign
  assign SRAM_avalon_sram_slave_chosen_master_rot_left = (SRAM_avalon_sram_slave_arb_winner << 1) ? (SRAM_avalon_sram_slave_arb_winner << 1) : 1;

  //SRAM/avalon_sram_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SRAM_avalon_sram_slave_arb_addend <= 1;
      else if (|SRAM_avalon_sram_slave_grant_vector)
          SRAM_avalon_sram_slave_arb_addend <= SRAM_avalon_sram_slave_end_xfer? SRAM_avalon_sram_slave_chosen_master_rot_left : SRAM_avalon_sram_slave_grant_vector;
    end


  //~SRAM_avalon_sram_slave_reset assignment, which is an e_assign
  assign SRAM_avalon_sram_slave_reset = ~reset_n;

  //SRAM_avalon_sram_slave_firsttransfer first transaction, which is an e_assign
  assign SRAM_avalon_sram_slave_firsttransfer = SRAM_avalon_sram_slave_begins_xfer ? SRAM_avalon_sram_slave_unreg_firsttransfer : SRAM_avalon_sram_slave_reg_firsttransfer;

  //SRAM_avalon_sram_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign SRAM_avalon_sram_slave_unreg_firsttransfer = ~(SRAM_avalon_sram_slave_slavearbiterlockenable & SRAM_avalon_sram_slave_any_continuerequest);

  //SRAM_avalon_sram_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SRAM_avalon_sram_slave_reg_firsttransfer <= 1'b1;
      else if (SRAM_avalon_sram_slave_begins_xfer)
          SRAM_avalon_sram_slave_reg_firsttransfer <= SRAM_avalon_sram_slave_unreg_firsttransfer;
    end


  //SRAM_avalon_sram_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign SRAM_avalon_sram_slave_beginbursttransfer_internal = SRAM_avalon_sram_slave_begins_xfer;

  //SRAM_avalon_sram_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign SRAM_avalon_sram_slave_arbitration_holdoff_internal = SRAM_avalon_sram_slave_begins_xfer & SRAM_avalon_sram_slave_firsttransfer;

  //SRAM_avalon_sram_slave_read assignment, which is an e_mux
  assign SRAM_avalon_sram_slave_read = (CPU_data_master_granted_SRAM_avalon_sram_slave & CPU_data_master_read) | (VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave & VGA_Pixel_Buffer_avalon_pixel_dma_master_read);

  //SRAM_avalon_sram_slave_write assignment, which is an e_mux
  assign SRAM_avalon_sram_slave_write = CPU_data_master_granted_SRAM_avalon_sram_slave & CPU_data_master_write;

  assign shifted_address_to_SRAM_avalon_sram_slave_from_CPU_data_master = {CPU_data_master_address_to_slave >> 2,
    CPU_data_master_dbs_address[1],
    {1 {1'b0}}};

  //SRAM_avalon_sram_slave_address mux, which is an e_mux
  assign SRAM_avalon_sram_slave_address = (CPU_data_master_granted_SRAM_avalon_sram_slave)? (shifted_address_to_SRAM_avalon_sram_slave_from_CPU_data_master >> 1) :
    (shifted_address_to_SRAM_avalon_sram_slave_from_VGA_Pixel_Buffer_avalon_pixel_dma_master >> 1);

  assign shifted_address_to_SRAM_avalon_sram_slave_from_VGA_Pixel_Buffer_avalon_pixel_dma_master = VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave;
  //d1_SRAM_avalon_sram_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_SRAM_avalon_sram_slave_end_xfer <= 1;
      else 
        d1_SRAM_avalon_sram_slave_end_xfer <= SRAM_avalon_sram_slave_end_xfer;
    end


  //SRAM_avalon_sram_slave_waits_for_read in a cycle, which is an e_mux
  assign SRAM_avalon_sram_slave_waits_for_read = SRAM_avalon_sram_slave_in_a_read_cycle & 0;

  //SRAM_avalon_sram_slave_in_a_read_cycle assignment, which is an e_assign
  assign SRAM_avalon_sram_slave_in_a_read_cycle = (CPU_data_master_granted_SRAM_avalon_sram_slave & CPU_data_master_read) | (VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave & VGA_Pixel_Buffer_avalon_pixel_dma_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = SRAM_avalon_sram_slave_in_a_read_cycle;

  //SRAM_avalon_sram_slave_waits_for_write in a cycle, which is an e_mux
  assign SRAM_avalon_sram_slave_waits_for_write = SRAM_avalon_sram_slave_in_a_write_cycle & 0;

  //SRAM_avalon_sram_slave_in_a_write_cycle assignment, which is an e_assign
  assign SRAM_avalon_sram_slave_in_a_write_cycle = CPU_data_master_granted_SRAM_avalon_sram_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = SRAM_avalon_sram_slave_in_a_write_cycle;

  assign wait_for_SRAM_avalon_sram_slave_counter = 0;
  //SRAM_avalon_sram_slave_byteenable byte enable port mux, which is an e_mux
  assign SRAM_avalon_sram_slave_byteenable = (CPU_data_master_granted_SRAM_avalon_sram_slave)? CPU_data_master_byteenable_SRAM_avalon_sram_slave :
    -1;

  assign {CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_1,
CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_0} = CPU_data_master_byteenable;
  assign CPU_data_master_byteenable_SRAM_avalon_sram_slave = ((CPU_data_master_dbs_address[1] == 0))? CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_0 :
    CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //SRAM/avalon_sram_slave enable non-zero assertions, which is an e_register
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
      if (CPU_data_master_granted_SRAM_avalon_sram_slave + VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_SRAM_avalon_sram_slave + VGA_Pixel_Buffer_avalon_pixel_dma_master_saved_grant_SRAM_avalon_sram_slave > 1)
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

module Serial_Port_avalon_rs232_slave_arbitrator (
                                                   // inputs:
                                                    CPU_data_master_address_to_slave,
                                                    CPU_data_master_byteenable,
                                                    CPU_data_master_read,
                                                    CPU_data_master_waitrequest,
                                                    CPU_data_master_write,
                                                    CPU_data_master_writedata,
                                                    Serial_Port_avalon_rs232_slave_irq,
                                                    Serial_Port_avalon_rs232_slave_readdata,
                                                    clk,
                                                    reset_n,

                                                   // outputs:
                                                    CPU_data_master_granted_Serial_Port_avalon_rs232_slave,
                                                    CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave,
                                                    CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave,
                                                    CPU_data_master_requests_Serial_Port_avalon_rs232_slave,
                                                    Serial_Port_avalon_rs232_slave_address,
                                                    Serial_Port_avalon_rs232_slave_byteenable,
                                                    Serial_Port_avalon_rs232_slave_chipselect,
                                                    Serial_Port_avalon_rs232_slave_irq_from_sa,
                                                    Serial_Port_avalon_rs232_slave_read,
                                                    Serial_Port_avalon_rs232_slave_readdata_from_sa,
                                                    Serial_Port_avalon_rs232_slave_reset,
                                                    Serial_Port_avalon_rs232_slave_write,
                                                    Serial_Port_avalon_rs232_slave_writedata,
                                                    d1_Serial_Port_avalon_rs232_slave_end_xfer,
                                                    registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave
                                                 )
;

  output           CPU_data_master_granted_Serial_Port_avalon_rs232_slave;
  output           CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave;
  output           CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave;
  output           CPU_data_master_requests_Serial_Port_avalon_rs232_slave;
  output           Serial_Port_avalon_rs232_slave_address;
  output  [  3: 0] Serial_Port_avalon_rs232_slave_byteenable;
  output           Serial_Port_avalon_rs232_slave_chipselect;
  output           Serial_Port_avalon_rs232_slave_irq_from_sa;
  output           Serial_Port_avalon_rs232_slave_read;
  output  [ 31: 0] Serial_Port_avalon_rs232_slave_readdata_from_sa;
  output           Serial_Port_avalon_rs232_slave_reset;
  output           Serial_Port_avalon_rs232_slave_write;
  output  [ 31: 0] Serial_Port_avalon_rs232_slave_writedata;
  output           d1_Serial_Port_avalon_rs232_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Serial_Port_avalon_rs232_slave_irq;
  input   [ 31: 0] Serial_Port_avalon_rs232_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Serial_Port_avalon_rs232_slave;
  wire             CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave;
  wire             CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave;
  reg              CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register_in;
  wire             CPU_data_master_requests_Serial_Port_avalon_rs232_slave;
  wire             CPU_data_master_saved_grant_Serial_Port_avalon_rs232_slave;
  wire             Serial_Port_avalon_rs232_slave_address;
  wire             Serial_Port_avalon_rs232_slave_allgrants;
  wire             Serial_Port_avalon_rs232_slave_allow_new_arb_cycle;
  wire             Serial_Port_avalon_rs232_slave_any_bursting_master_saved_grant;
  wire             Serial_Port_avalon_rs232_slave_any_continuerequest;
  wire             Serial_Port_avalon_rs232_slave_arb_counter_enable;
  reg     [  2: 0] Serial_Port_avalon_rs232_slave_arb_share_counter;
  wire    [  2: 0] Serial_Port_avalon_rs232_slave_arb_share_counter_next_value;
  wire    [  2: 0] Serial_Port_avalon_rs232_slave_arb_share_set_values;
  wire             Serial_Port_avalon_rs232_slave_beginbursttransfer_internal;
  wire             Serial_Port_avalon_rs232_slave_begins_xfer;
  wire    [  3: 0] Serial_Port_avalon_rs232_slave_byteenable;
  wire             Serial_Port_avalon_rs232_slave_chipselect;
  wire             Serial_Port_avalon_rs232_slave_end_xfer;
  wire             Serial_Port_avalon_rs232_slave_firsttransfer;
  wire             Serial_Port_avalon_rs232_slave_grant_vector;
  wire             Serial_Port_avalon_rs232_slave_in_a_read_cycle;
  wire             Serial_Port_avalon_rs232_slave_in_a_write_cycle;
  wire             Serial_Port_avalon_rs232_slave_irq_from_sa;
  wire             Serial_Port_avalon_rs232_slave_master_qreq_vector;
  wire             Serial_Port_avalon_rs232_slave_non_bursting_master_requests;
  wire             Serial_Port_avalon_rs232_slave_read;
  wire    [ 31: 0] Serial_Port_avalon_rs232_slave_readdata_from_sa;
  reg              Serial_Port_avalon_rs232_slave_reg_firsttransfer;
  wire             Serial_Port_avalon_rs232_slave_reset;
  reg              Serial_Port_avalon_rs232_slave_slavearbiterlockenable;
  wire             Serial_Port_avalon_rs232_slave_slavearbiterlockenable2;
  wire             Serial_Port_avalon_rs232_slave_unreg_firsttransfer;
  wire             Serial_Port_avalon_rs232_slave_waits_for_read;
  wire             Serial_Port_avalon_rs232_slave_waits_for_write;
  wire             Serial_Port_avalon_rs232_slave_write;
  wire    [ 31: 0] Serial_Port_avalon_rs232_slave_writedata;
  reg              d1_Serial_Port_avalon_rs232_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Serial_Port_avalon_rs232_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave;
  wire    [ 28: 0] shifted_address_to_Serial_Port_avalon_rs232_slave_from_CPU_data_master;
  wire             wait_for_Serial_Port_avalon_rs232_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Serial_Port_avalon_rs232_slave_end_xfer;
    end


  assign Serial_Port_avalon_rs232_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave));
  //assign Serial_Port_avalon_rs232_slave_readdata_from_sa = Serial_Port_avalon_rs232_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_readdata_from_sa = Serial_Port_avalon_rs232_slave_readdata;

  assign CPU_data_master_requests_Serial_Port_avalon_rs232_slave = ({CPU_data_master_address_to_slave[28 : 3] , 3'b0} == 29'h10001010) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave = CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register_in;

  //Serial_Port_avalon_rs232_slave_arb_share_counter set values, which is an e_mux
  assign Serial_Port_avalon_rs232_slave_arb_share_set_values = 1;

  //Serial_Port_avalon_rs232_slave_non_bursting_master_requests mux, which is an e_mux
  assign Serial_Port_avalon_rs232_slave_non_bursting_master_requests = CPU_data_master_requests_Serial_Port_avalon_rs232_slave;

  //Serial_Port_avalon_rs232_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Serial_Port_avalon_rs232_slave_any_bursting_master_saved_grant = 0;

  //Serial_Port_avalon_rs232_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_arb_share_counter_next_value = Serial_Port_avalon_rs232_slave_firsttransfer ? (Serial_Port_avalon_rs232_slave_arb_share_set_values - 1) : |Serial_Port_avalon_rs232_slave_arb_share_counter ? (Serial_Port_avalon_rs232_slave_arb_share_counter - 1) : 0;

  //Serial_Port_avalon_rs232_slave_allgrants all slave grants, which is an e_mux
  assign Serial_Port_avalon_rs232_slave_allgrants = |Serial_Port_avalon_rs232_slave_grant_vector;

  //Serial_Port_avalon_rs232_slave_end_xfer assignment, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_end_xfer = ~(Serial_Port_avalon_rs232_slave_waits_for_read | Serial_Port_avalon_rs232_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Serial_Port_avalon_rs232_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Serial_Port_avalon_rs232_slave = Serial_Port_avalon_rs232_slave_end_xfer & (~Serial_Port_avalon_rs232_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Serial_Port_avalon_rs232_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Serial_Port_avalon_rs232_slave & Serial_Port_avalon_rs232_slave_allgrants) | (end_xfer_arb_share_counter_term_Serial_Port_avalon_rs232_slave & ~Serial_Port_avalon_rs232_slave_non_bursting_master_requests);

  //Serial_Port_avalon_rs232_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Serial_Port_avalon_rs232_slave_arb_share_counter <= 0;
      else if (Serial_Port_avalon_rs232_slave_arb_counter_enable)
          Serial_Port_avalon_rs232_slave_arb_share_counter <= Serial_Port_avalon_rs232_slave_arb_share_counter_next_value;
    end


  //Serial_Port_avalon_rs232_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Serial_Port_avalon_rs232_slave_slavearbiterlockenable <= 0;
      else if ((|Serial_Port_avalon_rs232_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Serial_Port_avalon_rs232_slave) | (end_xfer_arb_share_counter_term_Serial_Port_avalon_rs232_slave & ~Serial_Port_avalon_rs232_slave_non_bursting_master_requests))
          Serial_Port_avalon_rs232_slave_slavearbiterlockenable <= |Serial_Port_avalon_rs232_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Serial_Port/avalon_rs232_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Serial_Port_avalon_rs232_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Serial_Port_avalon_rs232_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_slavearbiterlockenable2 = |Serial_Port_avalon_rs232_slave_arb_share_counter_next_value;

  //CPU/data_master Serial_Port/avalon_rs232_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Serial_Port_avalon_rs232_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Serial_Port_avalon_rs232_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave = CPU_data_master_requests_Serial_Port_avalon_rs232_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register_in = CPU_data_master_granted_Serial_Port_avalon_rs232_slave & CPU_data_master_read & ~Serial_Port_avalon_rs232_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register = {CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register, CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register <= p1_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave = CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave_shift_register;

  //Serial_Port_avalon_rs232_slave_writedata mux, which is an e_mux
  assign Serial_Port_avalon_rs232_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Serial_Port_avalon_rs232_slave = CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave;

  //CPU/data_master saved-grant Serial_Port/avalon_rs232_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Serial_Port_avalon_rs232_slave = CPU_data_master_requests_Serial_Port_avalon_rs232_slave;

  //allow new arb cycle for Serial_Port/avalon_rs232_slave, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Serial_Port_avalon_rs232_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Serial_Port_avalon_rs232_slave_master_qreq_vector = 1;

  //~Serial_Port_avalon_rs232_slave_reset assignment, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_reset = ~reset_n;

  assign Serial_Port_avalon_rs232_slave_chipselect = CPU_data_master_granted_Serial_Port_avalon_rs232_slave;
  //Serial_Port_avalon_rs232_slave_firsttransfer first transaction, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_firsttransfer = Serial_Port_avalon_rs232_slave_begins_xfer ? Serial_Port_avalon_rs232_slave_unreg_firsttransfer : Serial_Port_avalon_rs232_slave_reg_firsttransfer;

  //Serial_Port_avalon_rs232_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_unreg_firsttransfer = ~(Serial_Port_avalon_rs232_slave_slavearbiterlockenable & Serial_Port_avalon_rs232_slave_any_continuerequest);

  //Serial_Port_avalon_rs232_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Serial_Port_avalon_rs232_slave_reg_firsttransfer <= 1'b1;
      else if (Serial_Port_avalon_rs232_slave_begins_xfer)
          Serial_Port_avalon_rs232_slave_reg_firsttransfer <= Serial_Port_avalon_rs232_slave_unreg_firsttransfer;
    end


  //Serial_Port_avalon_rs232_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_beginbursttransfer_internal = Serial_Port_avalon_rs232_slave_begins_xfer;

  //Serial_Port_avalon_rs232_slave_read assignment, which is an e_mux
  assign Serial_Port_avalon_rs232_slave_read = CPU_data_master_granted_Serial_Port_avalon_rs232_slave & CPU_data_master_read;

  //Serial_Port_avalon_rs232_slave_write assignment, which is an e_mux
  assign Serial_Port_avalon_rs232_slave_write = CPU_data_master_granted_Serial_Port_avalon_rs232_slave & CPU_data_master_write;

  assign shifted_address_to_Serial_Port_avalon_rs232_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Serial_Port_avalon_rs232_slave_address mux, which is an e_mux
  assign Serial_Port_avalon_rs232_slave_address = shifted_address_to_Serial_Port_avalon_rs232_slave_from_CPU_data_master >> 2;

  //d1_Serial_Port_avalon_rs232_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Serial_Port_avalon_rs232_slave_end_xfer <= 1;
      else 
        d1_Serial_Port_avalon_rs232_slave_end_xfer <= Serial_Port_avalon_rs232_slave_end_xfer;
    end


  //Serial_Port_avalon_rs232_slave_waits_for_read in a cycle, which is an e_mux
  assign Serial_Port_avalon_rs232_slave_waits_for_read = Serial_Port_avalon_rs232_slave_in_a_read_cycle & 0;

  //Serial_Port_avalon_rs232_slave_in_a_read_cycle assignment, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_in_a_read_cycle = CPU_data_master_granted_Serial_Port_avalon_rs232_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Serial_Port_avalon_rs232_slave_in_a_read_cycle;

  //Serial_Port_avalon_rs232_slave_waits_for_write in a cycle, which is an e_mux
  assign Serial_Port_avalon_rs232_slave_waits_for_write = Serial_Port_avalon_rs232_slave_in_a_write_cycle & 0;

  //Serial_Port_avalon_rs232_slave_in_a_write_cycle assignment, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_in_a_write_cycle = CPU_data_master_granted_Serial_Port_avalon_rs232_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Serial_Port_avalon_rs232_slave_in_a_write_cycle;

  assign wait_for_Serial_Port_avalon_rs232_slave_counter = 0;
  //Serial_Port_avalon_rs232_slave_byteenable byte enable port mux, which is an e_mux
  assign Serial_Port_avalon_rs232_slave_byteenable = (CPU_data_master_granted_Serial_Port_avalon_rs232_slave)? CPU_data_master_byteenable :
    -1;

  //assign Serial_Port_avalon_rs232_slave_irq_from_sa = Serial_Port_avalon_rs232_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Serial_Port_avalon_rs232_slave_irq_from_sa = Serial_Port_avalon_rs232_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Serial_Port/avalon_rs232_slave enable non-zero assertions, which is an e_register
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

module Slider_Switches_avalon_parallel_port_slave_arbitrator (
                                                               // inputs:
                                                                CPU_data_master_address_to_slave,
                                                                CPU_data_master_byteenable,
                                                                CPU_data_master_read,
                                                                CPU_data_master_waitrequest,
                                                                CPU_data_master_write,
                                                                CPU_data_master_writedata,
                                                                Slider_Switches_avalon_parallel_port_slave_readdata,
                                                                clk,
                                                                reset_n,

                                                               // outputs:
                                                                CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave,
                                                                CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave,
                                                                CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave,
                                                                CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave,
                                                                Slider_Switches_avalon_parallel_port_slave_address,
                                                                Slider_Switches_avalon_parallel_port_slave_byteenable,
                                                                Slider_Switches_avalon_parallel_port_slave_chipselect,
                                                                Slider_Switches_avalon_parallel_port_slave_read,
                                                                Slider_Switches_avalon_parallel_port_slave_readdata_from_sa,
                                                                Slider_Switches_avalon_parallel_port_slave_reset,
                                                                Slider_Switches_avalon_parallel_port_slave_write,
                                                                Slider_Switches_avalon_parallel_port_slave_writedata,
                                                                d1_Slider_Switches_avalon_parallel_port_slave_end_xfer,
                                                                registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave
                                                             )
;

  output           CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave;
  output  [  1: 0] Slider_Switches_avalon_parallel_port_slave_address;
  output  [  3: 0] Slider_Switches_avalon_parallel_port_slave_byteenable;
  output           Slider_Switches_avalon_parallel_port_slave_chipselect;
  output           Slider_Switches_avalon_parallel_port_slave_read;
  output  [ 31: 0] Slider_Switches_avalon_parallel_port_slave_readdata_from_sa;
  output           Slider_Switches_avalon_parallel_port_slave_reset;
  output           Slider_Switches_avalon_parallel_port_slave_write;
  output  [ 31: 0] Slider_Switches_avalon_parallel_port_slave_writedata;
  output           d1_Slider_Switches_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] Slider_Switches_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Slider_Switches_avalon_parallel_port_slave;
  wire    [  1: 0] Slider_Switches_avalon_parallel_port_slave_address;
  wire             Slider_Switches_avalon_parallel_port_slave_allgrants;
  wire             Slider_Switches_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Slider_Switches_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Slider_Switches_avalon_parallel_port_slave_any_continuerequest;
  wire             Slider_Switches_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  2: 0] Slider_Switches_avalon_parallel_port_slave_arb_share_counter;
  wire    [  2: 0] Slider_Switches_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  2: 0] Slider_Switches_avalon_parallel_port_slave_arb_share_set_values;
  wire             Slider_Switches_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Slider_Switches_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Slider_Switches_avalon_parallel_port_slave_byteenable;
  wire             Slider_Switches_avalon_parallel_port_slave_chipselect;
  wire             Slider_Switches_avalon_parallel_port_slave_end_xfer;
  wire             Slider_Switches_avalon_parallel_port_slave_firsttransfer;
  wire             Slider_Switches_avalon_parallel_port_slave_grant_vector;
  wire             Slider_Switches_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Slider_Switches_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Slider_Switches_avalon_parallel_port_slave_master_qreq_vector;
  wire             Slider_Switches_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Slider_Switches_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Slider_Switches_avalon_parallel_port_slave_readdata_from_sa;
  reg              Slider_Switches_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Slider_Switches_avalon_parallel_port_slave_reset;
  reg              Slider_Switches_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Slider_Switches_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Slider_Switches_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Slider_Switches_avalon_parallel_port_slave_waits_for_read;
  wire             Slider_Switches_avalon_parallel_port_slave_waits_for_write;
  wire             Slider_Switches_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Slider_Switches_avalon_parallel_port_slave_writedata;
  reg              d1_Slider_Switches_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Slider_Switches_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Slider_Switches_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Slider_Switches_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Slider_Switches_avalon_parallel_port_slave_end_xfer;
    end


  assign Slider_Switches_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave));
  //assign Slider_Switches_avalon_parallel_port_slave_readdata_from_sa = Slider_Switches_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_readdata_from_sa = Slider_Switches_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000040) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register_in;

  //Slider_Switches_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Slider_Switches_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Slider_Switches_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Slider_Switches_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave;

  //Slider_Switches_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Slider_Switches_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Slider_Switches_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_arb_share_counter_next_value = Slider_Switches_avalon_parallel_port_slave_firsttransfer ? (Slider_Switches_avalon_parallel_port_slave_arb_share_set_values - 1) : |Slider_Switches_avalon_parallel_port_slave_arb_share_counter ? (Slider_Switches_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Slider_Switches_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Slider_Switches_avalon_parallel_port_slave_allgrants = |Slider_Switches_avalon_parallel_port_slave_grant_vector;

  //Slider_Switches_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_end_xfer = ~(Slider_Switches_avalon_parallel_port_slave_waits_for_read | Slider_Switches_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Slider_Switches_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Slider_Switches_avalon_parallel_port_slave = Slider_Switches_avalon_parallel_port_slave_end_xfer & (~Slider_Switches_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Slider_Switches_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Slider_Switches_avalon_parallel_port_slave & Slider_Switches_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Slider_Switches_avalon_parallel_port_slave & ~Slider_Switches_avalon_parallel_port_slave_non_bursting_master_requests);

  //Slider_Switches_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Slider_Switches_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Slider_Switches_avalon_parallel_port_slave_arb_counter_enable)
          Slider_Switches_avalon_parallel_port_slave_arb_share_counter <= Slider_Switches_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Slider_Switches_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Slider_Switches_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Slider_Switches_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Slider_Switches_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Slider_Switches_avalon_parallel_port_slave & ~Slider_Switches_avalon_parallel_port_slave_non_bursting_master_requests))
          Slider_Switches_avalon_parallel_port_slave_slavearbiterlockenable <= |Slider_Switches_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Slider_Switches/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Slider_Switches_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Slider_Switches_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_slavearbiterlockenable2 = |Slider_Switches_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Slider_Switches/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Slider_Switches_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Slider_Switches_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave = CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave & CPU_data_master_read & ~Slider_Switches_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave_shift_register;

  //Slider_Switches_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Slider_Switches_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave = CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Slider_Switches/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Slider_Switches_avalon_parallel_port_slave = CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave;

  //allow new arb cycle for Slider_Switches/avalon_parallel_port_slave, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Slider_Switches_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Slider_Switches_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Slider_Switches_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_reset = ~reset_n;

  assign Slider_Switches_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave;
  //Slider_Switches_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_firsttransfer = Slider_Switches_avalon_parallel_port_slave_begins_xfer ? Slider_Switches_avalon_parallel_port_slave_unreg_firsttransfer : Slider_Switches_avalon_parallel_port_slave_reg_firsttransfer;

  //Slider_Switches_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_unreg_firsttransfer = ~(Slider_Switches_avalon_parallel_port_slave_slavearbiterlockenable & Slider_Switches_avalon_parallel_port_slave_any_continuerequest);

  //Slider_Switches_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Slider_Switches_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Slider_Switches_avalon_parallel_port_slave_begins_xfer)
          Slider_Switches_avalon_parallel_port_slave_reg_firsttransfer <= Slider_Switches_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Slider_Switches_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_beginbursttransfer_internal = Slider_Switches_avalon_parallel_port_slave_begins_xfer;

  //Slider_Switches_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Slider_Switches_avalon_parallel_port_slave_read = CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave & CPU_data_master_read;

  //Slider_Switches_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Slider_Switches_avalon_parallel_port_slave_write = CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Slider_Switches_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Slider_Switches_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Slider_Switches_avalon_parallel_port_slave_address = shifted_address_to_Slider_Switches_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Slider_Switches_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Slider_Switches_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Slider_Switches_avalon_parallel_port_slave_end_xfer <= Slider_Switches_avalon_parallel_port_slave_end_xfer;
    end


  //Slider_Switches_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Slider_Switches_avalon_parallel_port_slave_waits_for_read = Slider_Switches_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Slider_Switches_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Slider_Switches_avalon_parallel_port_slave_in_a_read_cycle;

  //Slider_Switches_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Slider_Switches_avalon_parallel_port_slave_waits_for_write = Slider_Switches_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Slider_Switches_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Slider_Switches_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Slider_Switches_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Slider_Switches_avalon_parallel_port_slave_counter = 0;
  //Slider_Switches_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Slider_Switches_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Slider_Switches/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
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

module VGA_Char_Buffer_avalon_char_buffer_slave_arbitrator (
                                                             // inputs:
                                                              CPU_data_master_address_to_slave,
                                                              CPU_data_master_byteenable,
                                                              CPU_data_master_dbs_address,
                                                              CPU_data_master_dbs_write_8,
                                                              CPU_data_master_no_byte_enables_and_last_term,
                                                              CPU_data_master_read,
                                                              CPU_data_master_waitrequest,
                                                              CPU_data_master_write,
                                                              VGA_Char_Buffer_avalon_char_buffer_slave_readdata,
                                                              VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest,
                                                              clk,
                                                              reset_n,

                                                             // outputs:
                                                              CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave,
                                                              CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave,
                                                              CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave,
                                                              CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave,
                                                              CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave,
                                                              VGA_Char_Buffer_avalon_char_buffer_slave_address,
                                                              VGA_Char_Buffer_avalon_char_buffer_slave_byteenable,
                                                              VGA_Char_Buffer_avalon_char_buffer_slave_chipselect,
                                                              VGA_Char_Buffer_avalon_char_buffer_slave_read,
                                                              VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa,
                                                              VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa,
                                                              VGA_Char_Buffer_avalon_char_buffer_slave_write,
                                                              VGA_Char_Buffer_avalon_char_buffer_slave_writedata,
                                                              d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer,
                                                              registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave
                                                           )
;

  output           CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave;
  output           CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave;
  output           CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave;
  output           CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave;
  output           CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave;
  output  [ 12: 0] VGA_Char_Buffer_avalon_char_buffer_slave_address;
  output           VGA_Char_Buffer_avalon_char_buffer_slave_byteenable;
  output           VGA_Char_Buffer_avalon_char_buffer_slave_chipselect;
  output           VGA_Char_Buffer_avalon_char_buffer_slave_read;
  output  [  7: 0] VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa;
  output           VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa;
  output           VGA_Char_Buffer_avalon_char_buffer_slave_write;
  output  [  7: 0] VGA_Char_Buffer_avalon_char_buffer_slave_writedata;
  output           d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  1: 0] CPU_data_master_dbs_address;
  input   [  7: 0] CPU_data_master_dbs_write_8;
  input            CPU_data_master_no_byte_enables_and_last_term;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [  7: 0] VGA_Char_Buffer_avalon_char_buffer_slave_readdata;
  input            VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_0;
  wire             CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_1;
  wire             CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_2;
  wire             CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_3;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave;
  reg              CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register;
  wire             CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register_in;
  wire             CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             CPU_data_master_saved_grant_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire    [ 12: 0] VGA_Char_Buffer_avalon_char_buffer_slave_address;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_allgrants;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_allow_new_arb_cycle;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_any_bursting_master_saved_grant;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_any_continuerequest;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_arb_counter_enable;
  reg     [  2: 0] VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter;
  wire    [  2: 0] VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter_next_value;
  wire    [  2: 0] VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_set_values;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_beginbursttransfer_internal;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_begins_xfer;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_byteenable;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_chipselect;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_firsttransfer;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_grant_vector;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_in_a_read_cycle;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_in_a_write_cycle;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_master_qreq_vector;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_non_bursting_master_requests;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_read;
  wire    [  7: 0] VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa;
  reg              VGA_Char_Buffer_avalon_char_buffer_slave_reg_firsttransfer;
  reg              VGA_Char_Buffer_avalon_char_buffer_slave_slavearbiterlockenable;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_slavearbiterlockenable2;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_unreg_firsttransfer;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_waits_for_read;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_waits_for_write;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_write;
  wire    [  7: 0] VGA_Char_Buffer_avalon_char_buffer_slave_writedata;
  reg              d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             wait_for_VGA_Char_Buffer_avalon_char_buffer_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer;
    end


  assign VGA_Char_Buffer_avalon_char_buffer_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave));
  //assign VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa = VGA_Char_Buffer_avalon_char_buffer_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa = VGA_Char_Buffer_avalon_char_buffer_slave_readdata;

  assign CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave = ({CPU_data_master_address_to_slave[28 : 13] , 13'b0} == 29'h9000000) & (CPU_data_master_read | CPU_data_master_write);
  //assign VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa = VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa = VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest;

  //registered rdv signal_name registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave = CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register_in;

  //VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter set values, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_set_values = (CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave)? 4 :
    1;

  //VGA_Char_Buffer_avalon_char_buffer_slave_non_bursting_master_requests mux, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_buffer_slave_non_bursting_master_requests = CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave;

  //VGA_Char_Buffer_avalon_char_buffer_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_buffer_slave_any_bursting_master_saved_grant = 0;

  //VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter_next_value = VGA_Char_Buffer_avalon_char_buffer_slave_firsttransfer ? (VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_set_values - 1) : |VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter ? (VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter - 1) : 0;

  //VGA_Char_Buffer_avalon_char_buffer_slave_allgrants all slave grants, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_buffer_slave_allgrants = |VGA_Char_Buffer_avalon_char_buffer_slave_grant_vector;

  //VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer assignment, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer = ~(VGA_Char_Buffer_avalon_char_buffer_slave_waits_for_read | VGA_Char_Buffer_avalon_char_buffer_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_buffer_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_buffer_slave = VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer & (~VGA_Char_Buffer_avalon_char_buffer_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_buffer_slave & VGA_Char_Buffer_avalon_char_buffer_slave_allgrants) | (end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_buffer_slave & ~VGA_Char_Buffer_avalon_char_buffer_slave_non_bursting_master_requests);

  //VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter <= 0;
      else if (VGA_Char_Buffer_avalon_char_buffer_slave_arb_counter_enable)
          VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter <= VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter_next_value;
    end


  //VGA_Char_Buffer_avalon_char_buffer_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Char_Buffer_avalon_char_buffer_slave_slavearbiterlockenable <= 0;
      else if ((|VGA_Char_Buffer_avalon_char_buffer_slave_master_qreq_vector & end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_buffer_slave) | (end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_buffer_slave & ~VGA_Char_Buffer_avalon_char_buffer_slave_non_bursting_master_requests))
          VGA_Char_Buffer_avalon_char_buffer_slave_slavearbiterlockenable <= |VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter_next_value;
    end


  //CPU/data_master VGA_Char_Buffer/avalon_char_buffer_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = VGA_Char_Buffer_avalon_char_buffer_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //VGA_Char_Buffer_avalon_char_buffer_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_slavearbiterlockenable2 = |VGA_Char_Buffer_avalon_char_buffer_slave_arb_share_counter_next_value;

  //CPU/data_master VGA_Char_Buffer/avalon_char_buffer_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = VGA_Char_Buffer_avalon_char_buffer_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //VGA_Char_Buffer_avalon_char_buffer_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave = CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register))) | ((~CPU_data_master_waitrequest | CPU_data_master_no_byte_enables_and_last_term | !CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register_in = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave & CPU_data_master_read & ~VGA_Char_Buffer_avalon_char_buffer_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register = {CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register, CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register_in};

  //CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register <= p1_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave = CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave_shift_register;

  //VGA_Char_Buffer_avalon_char_buffer_slave_writedata mux, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_buffer_slave_writedata = CPU_data_master_dbs_write_8;

  //master is always granted when requested
  assign CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave = CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave;

  //CPU/data_master saved-grant VGA_Char_Buffer/avalon_char_buffer_slave, which is an e_assign
  assign CPU_data_master_saved_grant_VGA_Char_Buffer_avalon_char_buffer_slave = CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave;

  //allow new arb cycle for VGA_Char_Buffer/avalon_char_buffer_slave, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign VGA_Char_Buffer_avalon_char_buffer_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign VGA_Char_Buffer_avalon_char_buffer_slave_master_qreq_vector = 1;

  assign VGA_Char_Buffer_avalon_char_buffer_slave_chipselect = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave;
  //VGA_Char_Buffer_avalon_char_buffer_slave_firsttransfer first transaction, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_firsttransfer = VGA_Char_Buffer_avalon_char_buffer_slave_begins_xfer ? VGA_Char_Buffer_avalon_char_buffer_slave_unreg_firsttransfer : VGA_Char_Buffer_avalon_char_buffer_slave_reg_firsttransfer;

  //VGA_Char_Buffer_avalon_char_buffer_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_unreg_firsttransfer = ~(VGA_Char_Buffer_avalon_char_buffer_slave_slavearbiterlockenable & VGA_Char_Buffer_avalon_char_buffer_slave_any_continuerequest);

  //VGA_Char_Buffer_avalon_char_buffer_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Char_Buffer_avalon_char_buffer_slave_reg_firsttransfer <= 1'b1;
      else if (VGA_Char_Buffer_avalon_char_buffer_slave_begins_xfer)
          VGA_Char_Buffer_avalon_char_buffer_slave_reg_firsttransfer <= VGA_Char_Buffer_avalon_char_buffer_slave_unreg_firsttransfer;
    end


  //VGA_Char_Buffer_avalon_char_buffer_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_beginbursttransfer_internal = VGA_Char_Buffer_avalon_char_buffer_slave_begins_xfer;

  //VGA_Char_Buffer_avalon_char_buffer_slave_read assignment, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_buffer_slave_read = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave & CPU_data_master_read;

  //VGA_Char_Buffer_avalon_char_buffer_slave_write assignment, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_buffer_slave_write = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave & CPU_data_master_write;

  //VGA_Char_Buffer_avalon_char_buffer_slave_address mux, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_buffer_slave_address = {CPU_data_master_address_to_slave >> 2,
    CPU_data_master_dbs_address[1 : 0]};

  //d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer <= 1;
      else 
        d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer <= VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer;
    end


  //VGA_Char_Buffer_avalon_char_buffer_slave_waits_for_read in a cycle, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_buffer_slave_waits_for_read = VGA_Char_Buffer_avalon_char_buffer_slave_in_a_read_cycle & VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa;

  //VGA_Char_Buffer_avalon_char_buffer_slave_in_a_read_cycle assignment, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_in_a_read_cycle = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = VGA_Char_Buffer_avalon_char_buffer_slave_in_a_read_cycle;

  //VGA_Char_Buffer_avalon_char_buffer_slave_waits_for_write in a cycle, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_buffer_slave_waits_for_write = VGA_Char_Buffer_avalon_char_buffer_slave_in_a_write_cycle & VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa;

  //VGA_Char_Buffer_avalon_char_buffer_slave_in_a_write_cycle assignment, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_buffer_slave_in_a_write_cycle = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = VGA_Char_Buffer_avalon_char_buffer_slave_in_a_write_cycle;

  assign wait_for_VGA_Char_Buffer_avalon_char_buffer_slave_counter = 0;
  //VGA_Char_Buffer_avalon_char_buffer_slave_byteenable byte enable port mux, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_buffer_slave_byteenable = (CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave)? CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave :
    -1;

  assign {CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_3,
CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_2,
CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_1,
CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_0} = CPU_data_master_byteenable;
  assign CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave = ((CPU_data_master_dbs_address[1 : 0] == 0))? CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_0 :
    ((CPU_data_master_dbs_address[1 : 0] == 1))? CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_1 :
    ((CPU_data_master_dbs_address[1 : 0] == 2))? CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_2 :
    CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //VGA_Char_Buffer/avalon_char_buffer_slave enable non-zero assertions, which is an e_register
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

module VGA_Char_Buffer_avalon_char_control_slave_arbitrator (
                                                              // inputs:
                                                               CPU_data_master_address_to_slave,
                                                               CPU_data_master_byteenable,
                                                               CPU_data_master_read,
                                                               CPU_data_master_waitrequest,
                                                               CPU_data_master_write,
                                                               CPU_data_master_writedata,
                                                               VGA_Char_Buffer_avalon_char_control_slave_readdata,
                                                               clk,
                                                               reset_n,

                                                              // outputs:
                                                               CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave,
                                                               CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave,
                                                               CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave,
                                                               CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave,
                                                               VGA_Char_Buffer_avalon_char_control_slave_address,
                                                               VGA_Char_Buffer_avalon_char_control_slave_byteenable,
                                                               VGA_Char_Buffer_avalon_char_control_slave_chipselect,
                                                               VGA_Char_Buffer_avalon_char_control_slave_read,
                                                               VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa,
                                                               VGA_Char_Buffer_avalon_char_control_slave_reset,
                                                               VGA_Char_Buffer_avalon_char_control_slave_write,
                                                               VGA_Char_Buffer_avalon_char_control_slave_writedata,
                                                               d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer,
                                                               registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave
                                                            )
;

  output           CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave;
  output           CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave;
  output           CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave;
  output           CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave;
  output           VGA_Char_Buffer_avalon_char_control_slave_address;
  output  [  3: 0] VGA_Char_Buffer_avalon_char_control_slave_byteenable;
  output           VGA_Char_Buffer_avalon_char_control_slave_chipselect;
  output           VGA_Char_Buffer_avalon_char_control_slave_read;
  output  [ 31: 0] VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa;
  output           VGA_Char_Buffer_avalon_char_control_slave_reset;
  output           VGA_Char_Buffer_avalon_char_control_slave_write;
  output  [ 31: 0] VGA_Char_Buffer_avalon_char_control_slave_writedata;
  output           d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] VGA_Char_Buffer_avalon_char_control_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave;
  wire             CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave;
  wire             CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave;
  reg              CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register;
  wire             CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register_in;
  wire             CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave;
  wire             CPU_data_master_saved_grant_VGA_Char_Buffer_avalon_char_control_slave;
  wire             VGA_Char_Buffer_avalon_char_control_slave_address;
  wire             VGA_Char_Buffer_avalon_char_control_slave_allgrants;
  wire             VGA_Char_Buffer_avalon_char_control_slave_allow_new_arb_cycle;
  wire             VGA_Char_Buffer_avalon_char_control_slave_any_bursting_master_saved_grant;
  wire             VGA_Char_Buffer_avalon_char_control_slave_any_continuerequest;
  wire             VGA_Char_Buffer_avalon_char_control_slave_arb_counter_enable;
  reg     [  2: 0] VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter;
  wire    [  2: 0] VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] VGA_Char_Buffer_avalon_char_control_slave_arb_share_set_values;
  wire             VGA_Char_Buffer_avalon_char_control_slave_beginbursttransfer_internal;
  wire             VGA_Char_Buffer_avalon_char_control_slave_begins_xfer;
  wire    [  3: 0] VGA_Char_Buffer_avalon_char_control_slave_byteenable;
  wire             VGA_Char_Buffer_avalon_char_control_slave_chipselect;
  wire             VGA_Char_Buffer_avalon_char_control_slave_end_xfer;
  wire             VGA_Char_Buffer_avalon_char_control_slave_firsttransfer;
  wire             VGA_Char_Buffer_avalon_char_control_slave_grant_vector;
  wire             VGA_Char_Buffer_avalon_char_control_slave_in_a_read_cycle;
  wire             VGA_Char_Buffer_avalon_char_control_slave_in_a_write_cycle;
  wire             VGA_Char_Buffer_avalon_char_control_slave_master_qreq_vector;
  wire             VGA_Char_Buffer_avalon_char_control_slave_non_bursting_master_requests;
  wire             VGA_Char_Buffer_avalon_char_control_slave_read;
  wire    [ 31: 0] VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa;
  reg              VGA_Char_Buffer_avalon_char_control_slave_reg_firsttransfer;
  wire             VGA_Char_Buffer_avalon_char_control_slave_reset;
  reg              VGA_Char_Buffer_avalon_char_control_slave_slavearbiterlockenable;
  wire             VGA_Char_Buffer_avalon_char_control_slave_slavearbiterlockenable2;
  wire             VGA_Char_Buffer_avalon_char_control_slave_unreg_firsttransfer;
  wire             VGA_Char_Buffer_avalon_char_control_slave_waits_for_read;
  wire             VGA_Char_Buffer_avalon_char_control_slave_waits_for_write;
  wire             VGA_Char_Buffer_avalon_char_control_slave_write;
  wire    [ 31: 0] VGA_Char_Buffer_avalon_char_control_slave_writedata;
  reg              d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave;
  wire    [ 28: 0] shifted_address_to_VGA_Char_Buffer_avalon_char_control_slave_from_CPU_data_master;
  wire             wait_for_VGA_Char_Buffer_avalon_char_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~VGA_Char_Buffer_avalon_char_control_slave_end_xfer;
    end


  assign VGA_Char_Buffer_avalon_char_control_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave));
  //assign VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa = VGA_Char_Buffer_avalon_char_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa = VGA_Char_Buffer_avalon_char_control_slave_readdata;

  assign CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave = ({CPU_data_master_address_to_slave[28 : 3] , 3'b0} == 29'h10003030) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave = CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register_in;

  //VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter set values, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_control_slave_arb_share_set_values = 1;

  //VGA_Char_Buffer_avalon_char_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_control_slave_non_bursting_master_requests = CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave;

  //VGA_Char_Buffer_avalon_char_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_control_slave_any_bursting_master_saved_grant = 0;

  //VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter_next_value = VGA_Char_Buffer_avalon_char_control_slave_firsttransfer ? (VGA_Char_Buffer_avalon_char_control_slave_arb_share_set_values - 1) : |VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter ? (VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter - 1) : 0;

  //VGA_Char_Buffer_avalon_char_control_slave_allgrants all slave grants, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_control_slave_allgrants = |VGA_Char_Buffer_avalon_char_control_slave_grant_vector;

  //VGA_Char_Buffer_avalon_char_control_slave_end_xfer assignment, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_end_xfer = ~(VGA_Char_Buffer_avalon_char_control_slave_waits_for_read | VGA_Char_Buffer_avalon_char_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_control_slave = VGA_Char_Buffer_avalon_char_control_slave_end_xfer & (~VGA_Char_Buffer_avalon_char_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_control_slave & VGA_Char_Buffer_avalon_char_control_slave_allgrants) | (end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_control_slave & ~VGA_Char_Buffer_avalon_char_control_slave_non_bursting_master_requests);

  //VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter <= 0;
      else if (VGA_Char_Buffer_avalon_char_control_slave_arb_counter_enable)
          VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter <= VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter_next_value;
    end


  //VGA_Char_Buffer_avalon_char_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Char_Buffer_avalon_char_control_slave_slavearbiterlockenable <= 0;
      else if ((|VGA_Char_Buffer_avalon_char_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_control_slave) | (end_xfer_arb_share_counter_term_VGA_Char_Buffer_avalon_char_control_slave & ~VGA_Char_Buffer_avalon_char_control_slave_non_bursting_master_requests))
          VGA_Char_Buffer_avalon_char_control_slave_slavearbiterlockenable <= |VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter_next_value;
    end


  //CPU/data_master VGA_Char_Buffer/avalon_char_control_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = VGA_Char_Buffer_avalon_char_control_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //VGA_Char_Buffer_avalon_char_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_slavearbiterlockenable2 = |VGA_Char_Buffer_avalon_char_control_slave_arb_share_counter_next_value;

  //CPU/data_master VGA_Char_Buffer/avalon_char_control_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = VGA_Char_Buffer_avalon_char_control_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //VGA_Char_Buffer_avalon_char_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave = CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register_in = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave & CPU_data_master_read & ~VGA_Char_Buffer_avalon_char_control_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register = {CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register, CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register_in};

  //CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register <= p1_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave = CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave_shift_register;

  //VGA_Char_Buffer_avalon_char_control_slave_writedata mux, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_control_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave = CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave;

  //CPU/data_master saved-grant VGA_Char_Buffer/avalon_char_control_slave, which is an e_assign
  assign CPU_data_master_saved_grant_VGA_Char_Buffer_avalon_char_control_slave = CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave;

  //allow new arb cycle for VGA_Char_Buffer/avalon_char_control_slave, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign VGA_Char_Buffer_avalon_char_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign VGA_Char_Buffer_avalon_char_control_slave_master_qreq_vector = 1;

  //~VGA_Char_Buffer_avalon_char_control_slave_reset assignment, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_reset = ~reset_n;

  assign VGA_Char_Buffer_avalon_char_control_slave_chipselect = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave;
  //VGA_Char_Buffer_avalon_char_control_slave_firsttransfer first transaction, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_firsttransfer = VGA_Char_Buffer_avalon_char_control_slave_begins_xfer ? VGA_Char_Buffer_avalon_char_control_slave_unreg_firsttransfer : VGA_Char_Buffer_avalon_char_control_slave_reg_firsttransfer;

  //VGA_Char_Buffer_avalon_char_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_unreg_firsttransfer = ~(VGA_Char_Buffer_avalon_char_control_slave_slavearbiterlockenable & VGA_Char_Buffer_avalon_char_control_slave_any_continuerequest);

  //VGA_Char_Buffer_avalon_char_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Char_Buffer_avalon_char_control_slave_reg_firsttransfer <= 1'b1;
      else if (VGA_Char_Buffer_avalon_char_control_slave_begins_xfer)
          VGA_Char_Buffer_avalon_char_control_slave_reg_firsttransfer <= VGA_Char_Buffer_avalon_char_control_slave_unreg_firsttransfer;
    end


  //VGA_Char_Buffer_avalon_char_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_beginbursttransfer_internal = VGA_Char_Buffer_avalon_char_control_slave_begins_xfer;

  //VGA_Char_Buffer_avalon_char_control_slave_read assignment, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_control_slave_read = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave & CPU_data_master_read;

  //VGA_Char_Buffer_avalon_char_control_slave_write assignment, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_control_slave_write = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave & CPU_data_master_write;

  assign shifted_address_to_VGA_Char_Buffer_avalon_char_control_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //VGA_Char_Buffer_avalon_char_control_slave_address mux, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_control_slave_address = shifted_address_to_VGA_Char_Buffer_avalon_char_control_slave_from_CPU_data_master >> 2;

  //d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer <= 1;
      else 
        d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer <= VGA_Char_Buffer_avalon_char_control_slave_end_xfer;
    end


  //VGA_Char_Buffer_avalon_char_control_slave_waits_for_read in a cycle, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_control_slave_waits_for_read = VGA_Char_Buffer_avalon_char_control_slave_in_a_read_cycle & 0;

  //VGA_Char_Buffer_avalon_char_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_in_a_read_cycle = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = VGA_Char_Buffer_avalon_char_control_slave_in_a_read_cycle;

  //VGA_Char_Buffer_avalon_char_control_slave_waits_for_write in a cycle, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_control_slave_waits_for_write = VGA_Char_Buffer_avalon_char_control_slave_in_a_write_cycle & 0;

  //VGA_Char_Buffer_avalon_char_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign VGA_Char_Buffer_avalon_char_control_slave_in_a_write_cycle = CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = VGA_Char_Buffer_avalon_char_control_slave_in_a_write_cycle;

  assign wait_for_VGA_Char_Buffer_avalon_char_control_slave_counter = 0;
  //VGA_Char_Buffer_avalon_char_control_slave_byteenable byte enable port mux, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_control_slave_byteenable = (CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //VGA_Char_Buffer/avalon_char_control_slave enable non-zero assertions, which is an e_register
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

module VGA_Char_Buffer_avalon_char_source_arbitrator (
                                                       // inputs:
                                                        Alpha_Blending_avalon_foreground_sink_ready_from_sa,
                                                        VGA_Char_Buffer_avalon_char_source_data,
                                                        VGA_Char_Buffer_avalon_char_source_endofpacket,
                                                        VGA_Char_Buffer_avalon_char_source_startofpacket,
                                                        VGA_Char_Buffer_avalon_char_source_valid,
                                                        clk,
                                                        reset_n,

                                                       // outputs:
                                                        VGA_Char_Buffer_avalon_char_source_ready
                                                     )
;

  output           VGA_Char_Buffer_avalon_char_source_ready;
  input            Alpha_Blending_avalon_foreground_sink_ready_from_sa;
  input   [ 39: 0] VGA_Char_Buffer_avalon_char_source_data;
  input            VGA_Char_Buffer_avalon_char_source_endofpacket;
  input            VGA_Char_Buffer_avalon_char_source_startofpacket;
  input            VGA_Char_Buffer_avalon_char_source_valid;
  input            clk;
  input            reset_n;

  wire             VGA_Char_Buffer_avalon_char_source_ready;
  //mux VGA_Char_Buffer_avalon_char_source_ready, which is an e_mux
  assign VGA_Char_Buffer_avalon_char_source_ready = Alpha_Blending_avalon_foreground_sink_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module VGA_Controller_avalon_vga_sink_arbitrator (
                                                   // inputs:
                                                    VGA_Controller_avalon_vga_sink_ready,
                                                    VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_data,
                                                    VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket,
                                                    VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket,
                                                    VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_valid,
                                                    clk,
                                                    reset_n,

                                                   // outputs:
                                                    VGA_Controller_avalon_vga_sink_data,
                                                    VGA_Controller_avalon_vga_sink_endofpacket,
                                                    VGA_Controller_avalon_vga_sink_ready_from_sa,
                                                    VGA_Controller_avalon_vga_sink_reset,
                                                    VGA_Controller_avalon_vga_sink_startofpacket,
                                                    VGA_Controller_avalon_vga_sink_valid
                                                 )
;

  output  [ 29: 0] VGA_Controller_avalon_vga_sink_data;
  output           VGA_Controller_avalon_vga_sink_endofpacket;
  output           VGA_Controller_avalon_vga_sink_ready_from_sa;
  output           VGA_Controller_avalon_vga_sink_reset;
  output           VGA_Controller_avalon_vga_sink_startofpacket;
  output           VGA_Controller_avalon_vga_sink_valid;
  input            VGA_Controller_avalon_vga_sink_ready;
  input   [ 29: 0] VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_data;
  input            VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket;
  input            VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket;
  input            VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_valid;
  input            clk;
  input            reset_n;

  wire    [ 29: 0] VGA_Controller_avalon_vga_sink_data;
  wire             VGA_Controller_avalon_vga_sink_endofpacket;
  wire             VGA_Controller_avalon_vga_sink_ready_from_sa;
  wire             VGA_Controller_avalon_vga_sink_reset;
  wire             VGA_Controller_avalon_vga_sink_startofpacket;
  wire             VGA_Controller_avalon_vga_sink_valid;
  //mux VGA_Controller_avalon_vga_sink_data, which is an e_mux
  assign VGA_Controller_avalon_vga_sink_data = VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_data;

  //mux VGA_Controller_avalon_vga_sink_endofpacket, which is an e_mux
  assign VGA_Controller_avalon_vga_sink_endofpacket = VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket;

  //assign VGA_Controller_avalon_vga_sink_ready_from_sa = VGA_Controller_avalon_vga_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign VGA_Controller_avalon_vga_sink_ready_from_sa = VGA_Controller_avalon_vga_sink_ready;

  //mux VGA_Controller_avalon_vga_sink_startofpacket, which is an e_mux
  assign VGA_Controller_avalon_vga_sink_startofpacket = VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket;

  //mux VGA_Controller_avalon_vga_sink_valid, which is an e_mux
  assign VGA_Controller_avalon_vga_sink_valid = VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_valid;

  //~VGA_Controller_avalon_vga_sink_reset assignment, which is an e_assign
  assign VGA_Controller_avalon_vga_sink_reset = ~reset_n;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_arbitrator (
                                                              // inputs:
                                                               Alpha_Blending_avalon_blended_source_data,
                                                               Alpha_Blending_avalon_blended_source_endofpacket,
                                                               Alpha_Blending_avalon_blended_source_startofpacket,
                                                               Alpha_Blending_avalon_blended_source_valid,
                                                               VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready,
                                                               clk,
                                                               reset_n,

                                                              // outputs:
                                                               VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_data,
                                                               VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket,
                                                               VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa,
                                                               VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket,
                                                               VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_valid
                                                            )
;

  output  [ 29: 0] VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_data;
  output           VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket;
  output           VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa;
  output           VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket;
  output           VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_valid;
  input   [ 29: 0] Alpha_Blending_avalon_blended_source_data;
  input            Alpha_Blending_avalon_blended_source_endofpacket;
  input            Alpha_Blending_avalon_blended_source_startofpacket;
  input            Alpha_Blending_avalon_blended_source_valid;
  input            VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready;
  input            clk;
  input            reset_n;

  wire    [ 29: 0] VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_data;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_valid;
  //mux VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_data, which is an e_mux
  assign VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_data = Alpha_Blending_avalon_blended_source_data;

  //mux VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket, which is an e_mux
  assign VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket = Alpha_Blending_avalon_blended_source_endofpacket;

  //assign VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa = VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa = VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready;

  //mux VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket, which is an e_mux
  assign VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket = Alpha_Blending_avalon_blended_source_startofpacket;

  //mux VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_valid, which is an e_mux
  assign VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_valid = Alpha_Blending_avalon_blended_source_valid;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_arbitrator (
                                                                // inputs:
                                                                 VGA_Controller_avalon_vga_sink_ready_from_sa,
                                                                 VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_data,
                                                                 VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket,
                                                                 VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket,
                                                                 VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_valid,
                                                                 clk,
                                                                 reset_n,

                                                                // outputs:
                                                                 VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_ready
                                                              )
;

  output           VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_ready;
  input            VGA_Controller_avalon_vga_sink_ready_from_sa;
  input   [ 29: 0] VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_data;
  input            VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket;
  input            VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket;
  input            VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_valid;
  input            clk;
  input            reset_n;

  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_ready;
  //mux VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_ready, which is an e_mux
  assign VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_ready = VGA_Controller_avalon_vga_sink_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module VGA_Pixel_Buffer_avalon_control_slave_arbitrator (
                                                          // inputs:
                                                           CPU_data_master_address_to_slave,
                                                           CPU_data_master_byteenable,
                                                           CPU_data_master_read,
                                                           CPU_data_master_waitrequest,
                                                           CPU_data_master_write,
                                                           CPU_data_master_writedata,
                                                           VGA_Pixel_Buffer_avalon_control_slave_readdata,
                                                           clk,
                                                           reset_n,

                                                          // outputs:
                                                           CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave,
                                                           CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave,
                                                           CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave,
                                                           CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave,
                                                           VGA_Pixel_Buffer_avalon_control_slave_address,
                                                           VGA_Pixel_Buffer_avalon_control_slave_byteenable,
                                                           VGA_Pixel_Buffer_avalon_control_slave_read,
                                                           VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa,
                                                           VGA_Pixel_Buffer_avalon_control_slave_write,
                                                           VGA_Pixel_Buffer_avalon_control_slave_writedata,
                                                           d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer,
                                                           registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave
                                                        )
;

  output           CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave;
  output           CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave;
  output           CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave;
  output           CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave;
  output  [  1: 0] VGA_Pixel_Buffer_avalon_control_slave_address;
  output  [  3: 0] VGA_Pixel_Buffer_avalon_control_slave_byteenable;
  output           VGA_Pixel_Buffer_avalon_control_slave_read;
  output  [ 31: 0] VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa;
  output           VGA_Pixel_Buffer_avalon_control_slave_write;
  output  [ 31: 0] VGA_Pixel_Buffer_avalon_control_slave_writedata;
  output           d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] VGA_Pixel_Buffer_avalon_control_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave;
  wire             CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave;
  wire             CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave;
  reg              CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register;
  wire             CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register_in;
  wire             CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave;
  wire             CPU_data_master_saved_grant_VGA_Pixel_Buffer_avalon_control_slave;
  wire    [  1: 0] VGA_Pixel_Buffer_avalon_control_slave_address;
  wire             VGA_Pixel_Buffer_avalon_control_slave_allgrants;
  wire             VGA_Pixel_Buffer_avalon_control_slave_allow_new_arb_cycle;
  wire             VGA_Pixel_Buffer_avalon_control_slave_any_bursting_master_saved_grant;
  wire             VGA_Pixel_Buffer_avalon_control_slave_any_continuerequest;
  wire             VGA_Pixel_Buffer_avalon_control_slave_arb_counter_enable;
  reg     [  2: 0] VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter;
  wire    [  2: 0] VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] VGA_Pixel_Buffer_avalon_control_slave_arb_share_set_values;
  wire             VGA_Pixel_Buffer_avalon_control_slave_beginbursttransfer_internal;
  wire             VGA_Pixel_Buffer_avalon_control_slave_begins_xfer;
  wire    [  3: 0] VGA_Pixel_Buffer_avalon_control_slave_byteenable;
  wire             VGA_Pixel_Buffer_avalon_control_slave_end_xfer;
  wire             VGA_Pixel_Buffer_avalon_control_slave_firsttransfer;
  wire             VGA_Pixel_Buffer_avalon_control_slave_grant_vector;
  wire             VGA_Pixel_Buffer_avalon_control_slave_in_a_read_cycle;
  wire             VGA_Pixel_Buffer_avalon_control_slave_in_a_write_cycle;
  wire             VGA_Pixel_Buffer_avalon_control_slave_master_qreq_vector;
  wire             VGA_Pixel_Buffer_avalon_control_slave_non_bursting_master_requests;
  wire             VGA_Pixel_Buffer_avalon_control_slave_read;
  wire    [ 31: 0] VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa;
  reg              VGA_Pixel_Buffer_avalon_control_slave_reg_firsttransfer;
  reg              VGA_Pixel_Buffer_avalon_control_slave_slavearbiterlockenable;
  wire             VGA_Pixel_Buffer_avalon_control_slave_slavearbiterlockenable2;
  wire             VGA_Pixel_Buffer_avalon_control_slave_unreg_firsttransfer;
  wire             VGA_Pixel_Buffer_avalon_control_slave_waits_for_read;
  wire             VGA_Pixel_Buffer_avalon_control_slave_waits_for_write;
  wire             VGA_Pixel_Buffer_avalon_control_slave_write;
  wire    [ 31: 0] VGA_Pixel_Buffer_avalon_control_slave_writedata;
  reg              d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_VGA_Pixel_Buffer_avalon_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave;
  wire    [ 28: 0] shifted_address_to_VGA_Pixel_Buffer_avalon_control_slave_from_CPU_data_master;
  wire             wait_for_VGA_Pixel_Buffer_avalon_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~VGA_Pixel_Buffer_avalon_control_slave_end_xfer;
    end


  assign VGA_Pixel_Buffer_avalon_control_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave));
  //assign VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa = VGA_Pixel_Buffer_avalon_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa = VGA_Pixel_Buffer_avalon_control_slave_readdata;

  assign CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10003020) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave = CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register_in;

  //VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter set values, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_control_slave_arb_share_set_values = 1;

  //VGA_Pixel_Buffer_avalon_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_control_slave_non_bursting_master_requests = CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave;

  //VGA_Pixel_Buffer_avalon_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_control_slave_any_bursting_master_saved_grant = 0;

  //VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter_next_value = VGA_Pixel_Buffer_avalon_control_slave_firsttransfer ? (VGA_Pixel_Buffer_avalon_control_slave_arb_share_set_values - 1) : |VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter ? (VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter - 1) : 0;

  //VGA_Pixel_Buffer_avalon_control_slave_allgrants all slave grants, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_control_slave_allgrants = |VGA_Pixel_Buffer_avalon_control_slave_grant_vector;

  //VGA_Pixel_Buffer_avalon_control_slave_end_xfer assignment, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_end_xfer = ~(VGA_Pixel_Buffer_avalon_control_slave_waits_for_read | VGA_Pixel_Buffer_avalon_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_VGA_Pixel_Buffer_avalon_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_VGA_Pixel_Buffer_avalon_control_slave = VGA_Pixel_Buffer_avalon_control_slave_end_xfer & (~VGA_Pixel_Buffer_avalon_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_VGA_Pixel_Buffer_avalon_control_slave & VGA_Pixel_Buffer_avalon_control_slave_allgrants) | (end_xfer_arb_share_counter_term_VGA_Pixel_Buffer_avalon_control_slave & ~VGA_Pixel_Buffer_avalon_control_slave_non_bursting_master_requests);

  //VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter <= 0;
      else if (VGA_Pixel_Buffer_avalon_control_slave_arb_counter_enable)
          VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter <= VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter_next_value;
    end


  //VGA_Pixel_Buffer_avalon_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Pixel_Buffer_avalon_control_slave_slavearbiterlockenable <= 0;
      else if ((|VGA_Pixel_Buffer_avalon_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_VGA_Pixel_Buffer_avalon_control_slave) | (end_xfer_arb_share_counter_term_VGA_Pixel_Buffer_avalon_control_slave & ~VGA_Pixel_Buffer_avalon_control_slave_non_bursting_master_requests))
          VGA_Pixel_Buffer_avalon_control_slave_slavearbiterlockenable <= |VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter_next_value;
    end


  //CPU/data_master VGA_Pixel_Buffer/avalon_control_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = VGA_Pixel_Buffer_avalon_control_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //VGA_Pixel_Buffer_avalon_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_slavearbiterlockenable2 = |VGA_Pixel_Buffer_avalon_control_slave_arb_share_counter_next_value;

  //CPU/data_master VGA_Pixel_Buffer/avalon_control_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = VGA_Pixel_Buffer_avalon_control_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //VGA_Pixel_Buffer_avalon_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave = CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register_in = CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave & CPU_data_master_read & ~VGA_Pixel_Buffer_avalon_control_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register = {CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register, CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register_in};

  //CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register <= p1_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave = CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave_shift_register;

  //VGA_Pixel_Buffer_avalon_control_slave_writedata mux, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_control_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave = CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave;

  //CPU/data_master saved-grant VGA_Pixel_Buffer/avalon_control_slave, which is an e_assign
  assign CPU_data_master_saved_grant_VGA_Pixel_Buffer_avalon_control_slave = CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave;

  //allow new arb cycle for VGA_Pixel_Buffer/avalon_control_slave, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign VGA_Pixel_Buffer_avalon_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign VGA_Pixel_Buffer_avalon_control_slave_master_qreq_vector = 1;

  //VGA_Pixel_Buffer_avalon_control_slave_firsttransfer first transaction, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_firsttransfer = VGA_Pixel_Buffer_avalon_control_slave_begins_xfer ? VGA_Pixel_Buffer_avalon_control_slave_unreg_firsttransfer : VGA_Pixel_Buffer_avalon_control_slave_reg_firsttransfer;

  //VGA_Pixel_Buffer_avalon_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_unreg_firsttransfer = ~(VGA_Pixel_Buffer_avalon_control_slave_slavearbiterlockenable & VGA_Pixel_Buffer_avalon_control_slave_any_continuerequest);

  //VGA_Pixel_Buffer_avalon_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Pixel_Buffer_avalon_control_slave_reg_firsttransfer <= 1'b1;
      else if (VGA_Pixel_Buffer_avalon_control_slave_begins_xfer)
          VGA_Pixel_Buffer_avalon_control_slave_reg_firsttransfer <= VGA_Pixel_Buffer_avalon_control_slave_unreg_firsttransfer;
    end


  //VGA_Pixel_Buffer_avalon_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_beginbursttransfer_internal = VGA_Pixel_Buffer_avalon_control_slave_begins_xfer;

  //VGA_Pixel_Buffer_avalon_control_slave_read assignment, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_control_slave_read = CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave & CPU_data_master_read;

  //VGA_Pixel_Buffer_avalon_control_slave_write assignment, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_control_slave_write = CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave & CPU_data_master_write;

  assign shifted_address_to_VGA_Pixel_Buffer_avalon_control_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //VGA_Pixel_Buffer_avalon_control_slave_address mux, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_control_slave_address = shifted_address_to_VGA_Pixel_Buffer_avalon_control_slave_from_CPU_data_master >> 2;

  //d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer <= 1;
      else 
        d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer <= VGA_Pixel_Buffer_avalon_control_slave_end_xfer;
    end


  //VGA_Pixel_Buffer_avalon_control_slave_waits_for_read in a cycle, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_control_slave_waits_for_read = VGA_Pixel_Buffer_avalon_control_slave_in_a_read_cycle & 0;

  //VGA_Pixel_Buffer_avalon_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_in_a_read_cycle = CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = VGA_Pixel_Buffer_avalon_control_slave_in_a_read_cycle;

  //VGA_Pixel_Buffer_avalon_control_slave_waits_for_write in a cycle, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_control_slave_waits_for_write = VGA_Pixel_Buffer_avalon_control_slave_in_a_write_cycle & 0;

  //VGA_Pixel_Buffer_avalon_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_control_slave_in_a_write_cycle = CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = VGA_Pixel_Buffer_avalon_control_slave_in_a_write_cycle;

  assign wait_for_VGA_Pixel_Buffer_avalon_control_slave_counter = 0;
  //VGA_Pixel_Buffer_avalon_control_slave_byteenable byte enable port mux, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_control_slave_byteenable = (CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //VGA_Pixel_Buffer/avalon_control_slave enable non-zero assertions, which is an e_register
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

module selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo_module (
                                                                                                    // inputs:
                                                                                                     clear_fifo,
                                                                                                     clk,
                                                                                                     data_in,
                                                                                                     read,
                                                                                                     reset_n,
                                                                                                     sync_reset,
                                                                                                     write,

                                                                                                    // outputs:
                                                                                                     data_out,
                                                                                                     empty,
                                                                                                     fifo_contains_ones_n,
                                                                                                     full
                                                                                                  )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module VGA_Pixel_Buffer_avalon_pixel_dma_master_arbitrator (
                                                             // inputs:
                                                              SRAM_avalon_sram_slave_readdata_from_sa,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_address,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_read,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave_shift_register,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave,
                                                              clk,
                                                              d1_SRAM_avalon_sram_slave_end_xfer,
                                                              reset_n,

                                                             // outputs:
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_readdata,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_readdatavalid,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_reset,
                                                              VGA_Pixel_Buffer_avalon_pixel_dma_master_waitrequest
                                                           )
;

  output  [ 31: 0] VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave;
  output           VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter;
  output  [  7: 0] VGA_Pixel_Buffer_avalon_pixel_dma_master_readdata;
  output           VGA_Pixel_Buffer_avalon_pixel_dma_master_readdatavalid;
  output           VGA_Pixel_Buffer_avalon_pixel_dma_master_reset;
  output           VGA_Pixel_Buffer_avalon_pixel_dma_master_waitrequest;
  input   [ 15: 0] SRAM_avalon_sram_slave_readdata_from_sa;
  input   [ 31: 0] VGA_Pixel_Buffer_avalon_pixel_dma_master_address;
  input            VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave;
  input            VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave;
  input            VGA_Pixel_Buffer_avalon_pixel_dma_master_read;
  input            VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave;
  input            VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  input            VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave;
  input            clk;
  input            d1_SRAM_avalon_sram_slave_end_xfer;
  input            reset_n;

  wire    [  7: 0] SRAM_avalon_sram_slave_readdata_from_sa_part_selected_by_negative_dbs;
  reg     [ 31: 0] VGA_Pixel_Buffer_avalon_pixel_dma_master_address_last_time;
  wire    [ 31: 0] VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_is_granted_some_slave;
  reg              VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter;
  reg              VGA_Pixel_Buffer_avalon_pixel_dma_master_read_but_no_slave_selected;
  reg              VGA_Pixel_Buffer_avalon_pixel_dma_master_read_last_time;
  wire    [  7: 0] VGA_Pixel_Buffer_avalon_pixel_dma_master_readdata;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_readdatavalid;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_reset;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_run;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_waitrequest;
  reg              active_and_waiting_last_time;
  wire             empty_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo;
  wire             full_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo;
  wire             latency_load_value;
  wire             p1_VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter;
  wire             pre_flush_VGA_Pixel_Buffer_avalon_pixel_dma_master_readdatavalid;
  wire             r_3;
  wire             read_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo;
  wire             selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo_output;
  wire             selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo_output_SRAM_avalon_sram_slave;
  wire             write_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo;
  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = 1 & (VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave | ~VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave) & (VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave | ~VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave) & ((~VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave | ~VGA_Pixel_Buffer_avalon_pixel_dma_master_read | (1 & VGA_Pixel_Buffer_avalon_pixel_dma_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_run = r_3;

  //optimize select-logic by passing only those address bits which matter.
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave = {13'b100000000,
    VGA_Pixel_Buffer_avalon_pixel_dma_master_address[18 : 0]};

  //VGA_Pixel_Buffer_avalon_pixel_dma_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Pixel_Buffer_avalon_pixel_dma_master_read_but_no_slave_selected <= 0;
      else 
        VGA_Pixel_Buffer_avalon_pixel_dma_master_read_but_no_slave_selected <= VGA_Pixel_Buffer_avalon_pixel_dma_master_read & VGA_Pixel_Buffer_avalon_pixel_dma_master_run & ~VGA_Pixel_Buffer_avalon_pixel_dma_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_is_granted_some_slave = VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_VGA_Pixel_Buffer_avalon_pixel_dma_master_readdatavalid = VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_readdatavalid = VGA_Pixel_Buffer_avalon_pixel_dma_master_read_but_no_slave_selected |
    pre_flush_VGA_Pixel_Buffer_avalon_pixel_dma_master_readdatavalid;

  //Negative Dynamic Bus-sizing mux.
  //this mux selects the correct half of the 
  //wide data coming from the slave SRAM/avalon_sram_slave 
  assign SRAM_avalon_sram_slave_readdata_from_sa_part_selected_by_negative_dbs = ((selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo_output_SRAM_avalon_sram_slave == 0))? SRAM_avalon_sram_slave_readdata_from_sa[7 : 0] :
    SRAM_avalon_sram_slave_readdata_from_sa[15 : 8];

  //read_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo fifo read, which is an e_mux
  assign read_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo = VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave;

  //write_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo fifo write, which is an e_mux
  assign write_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo = VGA_Pixel_Buffer_avalon_pixel_dma_master_read & VGA_Pixel_Buffer_avalon_pixel_dma_master_run & VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave;

  assign selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo_output_SRAM_avalon_sram_slave = selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo_output;
  //selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo, which is an e_fifo_with_registered_outputs
  selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo_module selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave[0]),
      .data_out             (selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo_output),
      .empty                (empty_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo),
      .fifo_contains_ones_n (),
      .full                 (full_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo),
      .read                 (read_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (write_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo)
    );

  //VGA_Pixel_Buffer/avalon_pixel_dma_master readdata mux, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_readdata = SRAM_avalon_sram_slave_readdata_from_sa_part_selected_by_negative_dbs;

  //actual waitrequest port, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_waitrequest = ~VGA_Pixel_Buffer_avalon_pixel_dma_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter <= 0;
      else 
        VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter <= p1_VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter = ((VGA_Pixel_Buffer_avalon_pixel_dma_master_run & VGA_Pixel_Buffer_avalon_pixel_dma_master_read))? latency_load_value :
    (VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter)? VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //~VGA_Pixel_Buffer_avalon_pixel_dma_master_reset assignment, which is an e_assign
  assign VGA_Pixel_Buffer_avalon_pixel_dma_master_reset = ~reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //VGA_Pixel_Buffer_avalon_pixel_dma_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Pixel_Buffer_avalon_pixel_dma_master_address_last_time <= 0;
      else 
        VGA_Pixel_Buffer_avalon_pixel_dma_master_address_last_time <= VGA_Pixel_Buffer_avalon_pixel_dma_master_address;
    end


  //VGA_Pixel_Buffer/avalon_pixel_dma_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= VGA_Pixel_Buffer_avalon_pixel_dma_master_waitrequest & (VGA_Pixel_Buffer_avalon_pixel_dma_master_read);
    end


  //VGA_Pixel_Buffer_avalon_pixel_dma_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (VGA_Pixel_Buffer_avalon_pixel_dma_master_address != VGA_Pixel_Buffer_avalon_pixel_dma_master_address_last_time))
        begin
          $write("%0d ns: VGA_Pixel_Buffer_avalon_pixel_dma_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //VGA_Pixel_Buffer_avalon_pixel_dma_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          VGA_Pixel_Buffer_avalon_pixel_dma_master_read_last_time <= 0;
      else 
        VGA_Pixel_Buffer_avalon_pixel_dma_master_read_last_time <= VGA_Pixel_Buffer_avalon_pixel_dma_master_read;
    end


  //VGA_Pixel_Buffer_avalon_pixel_dma_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (VGA_Pixel_Buffer_avalon_pixel_dma_master_read != VGA_Pixel_Buffer_avalon_pixel_dma_master_read_last_time))
        begin
          $write("%0d ns: VGA_Pixel_Buffer_avalon_pixel_dma_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo read when empty, which is an e_process
  always @(posedge clk)
    begin
      if (empty_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo & read_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo)
        begin
          $write("%0d ns: VGA_Pixel_Buffer/avalon_pixel_dma_master negative rdv fifo selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo: read AND empty.\n", $time);
          $stop;
        end
    end


  //selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo write when full, which is an e_process
  always @(posedge clk)
    begin
      if (full_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo & write_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo & ~read_selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo)
        begin
          $write("%0d ns: VGA_Pixel_Buffer/avalon_pixel_dma_master negative rdv fifo selecto_nrdv_VGA_Pixel_Buffer_avalon_pixel_dma_master_1_SRAM_avalon_sram_slave_fifo: write AND full.\n", $time);
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

module VGA_Pixel_Buffer_avalon_pixel_source_arbitrator (
                                                         // inputs:
                                                          VGA_Pixel_Buffer_avalon_pixel_source_data,
                                                          VGA_Pixel_Buffer_avalon_pixel_source_endofpacket,
                                                          VGA_Pixel_Buffer_avalon_pixel_source_startofpacket,
                                                          VGA_Pixel_Buffer_avalon_pixel_source_valid,
                                                          VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa,
                                                          clk,
                                                          reset_n,

                                                         // outputs:
                                                          VGA_Pixel_Buffer_avalon_pixel_source_ready
                                                       )
;

  output           VGA_Pixel_Buffer_avalon_pixel_source_ready;
  input   [  7: 0] VGA_Pixel_Buffer_avalon_pixel_source_data;
  input            VGA_Pixel_Buffer_avalon_pixel_source_endofpacket;
  input            VGA_Pixel_Buffer_avalon_pixel_source_startofpacket;
  input            VGA_Pixel_Buffer_avalon_pixel_source_valid;
  input            VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa;
  input            clk;
  input            reset_n;

  wire             VGA_Pixel_Buffer_avalon_pixel_source_ready;
  //mux VGA_Pixel_Buffer_avalon_pixel_source_ready, which is an e_mux
  assign VGA_Pixel_Buffer_avalon_pixel_source_ready = VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module VGA_Pixel_RGB_Resampler_avalon_rgb_sink_arbitrator (
                                                            // inputs:
                                                             VGA_Pixel_Buffer_avalon_pixel_source_data,
                                                             VGA_Pixel_Buffer_avalon_pixel_source_endofpacket,
                                                             VGA_Pixel_Buffer_avalon_pixel_source_startofpacket,
                                                             VGA_Pixel_Buffer_avalon_pixel_source_valid,
                                                             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready,
                                                             clk,
                                                             reset_n,

                                                            // outputs:
                                                             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_data,
                                                             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket,
                                                             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa,
                                                             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_reset,
                                                             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket,
                                                             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_valid
                                                          )
;

  output  [  7: 0] VGA_Pixel_RGB_Resampler_avalon_rgb_sink_data;
  output           VGA_Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket;
  output           VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa;
  output           VGA_Pixel_RGB_Resampler_avalon_rgb_sink_reset;
  output           VGA_Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket;
  output           VGA_Pixel_RGB_Resampler_avalon_rgb_sink_valid;
  input   [  7: 0] VGA_Pixel_Buffer_avalon_pixel_source_data;
  input            VGA_Pixel_Buffer_avalon_pixel_source_endofpacket;
  input            VGA_Pixel_Buffer_avalon_pixel_source_startofpacket;
  input            VGA_Pixel_Buffer_avalon_pixel_source_valid;
  input            VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready;
  input            clk;
  input            reset_n;

  wire    [  7: 0] VGA_Pixel_RGB_Resampler_avalon_rgb_sink_data;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_reset;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_valid;
  //mux VGA_Pixel_RGB_Resampler_avalon_rgb_sink_data, which is an e_mux
  assign VGA_Pixel_RGB_Resampler_avalon_rgb_sink_data = VGA_Pixel_Buffer_avalon_pixel_source_data;

  //mux VGA_Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket, which is an e_mux
  assign VGA_Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket = VGA_Pixel_Buffer_avalon_pixel_source_endofpacket;

  //assign VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa = VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa = VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready;

  //mux VGA_Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket, which is an e_mux
  assign VGA_Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket = VGA_Pixel_Buffer_avalon_pixel_source_startofpacket;

  //mux VGA_Pixel_RGB_Resampler_avalon_rgb_sink_valid, which is an e_mux
  assign VGA_Pixel_RGB_Resampler_avalon_rgb_sink_valid = VGA_Pixel_Buffer_avalon_pixel_source_valid;

  //~VGA_Pixel_RGB_Resampler_avalon_rgb_sink_reset assignment, which is an e_assign
  assign VGA_Pixel_RGB_Resampler_avalon_rgb_sink_reset = ~reset_n;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module VGA_Pixel_RGB_Resampler_avalon_rgb_source_arbitrator (
                                                              // inputs:
                                                               Alpha_Blending_avalon_background_sink_ready_from_sa,
                                                               VGA_Pixel_RGB_Resampler_avalon_rgb_source_data,
                                                               VGA_Pixel_RGB_Resampler_avalon_rgb_source_endofpacket,
                                                               VGA_Pixel_RGB_Resampler_avalon_rgb_source_startofpacket,
                                                               VGA_Pixel_RGB_Resampler_avalon_rgb_source_valid,
                                                               clk,
                                                               reset_n,

                                                              // outputs:
                                                               VGA_Pixel_RGB_Resampler_avalon_rgb_source_ready
                                                            )
;

  output           VGA_Pixel_RGB_Resampler_avalon_rgb_source_ready;
  input            Alpha_Blending_avalon_background_sink_ready_from_sa;
  input   [ 29: 0] VGA_Pixel_RGB_Resampler_avalon_rgb_source_data;
  input            VGA_Pixel_RGB_Resampler_avalon_rgb_source_endofpacket;
  input            VGA_Pixel_RGB_Resampler_avalon_rgb_source_startofpacket;
  input            VGA_Pixel_RGB_Resampler_avalon_rgb_source_valid;
  input            clk;
  input            reset_n;

  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_source_ready;
  //mux VGA_Pixel_RGB_Resampler_avalon_rgb_source_ready, which is an e_mux
  assign VGA_Pixel_RGB_Resampler_avalon_rgb_source_ready = Alpha_Blending_avalon_background_sink_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_system_clock_0_in_arbitrator (
                                           // inputs:
                                            CPU_data_master_address_to_slave,
                                            CPU_data_master_byteenable,
                                            CPU_data_master_dbs_address,
                                            CPU_data_master_dbs_write_8,
                                            CPU_data_master_no_byte_enables_and_last_term,
                                            CPU_data_master_read,
                                            CPU_data_master_waitrequest,
                                            CPU_data_master_write,
                                            clk,
                                            nios_system_clock_0_in_endofpacket,
                                            nios_system_clock_0_in_readdata,
                                            nios_system_clock_0_in_waitrequest,
                                            reset_n,

                                           // outputs:
                                            CPU_data_master_byteenable_nios_system_clock_0_in,
                                            CPU_data_master_granted_nios_system_clock_0_in,
                                            CPU_data_master_qualified_request_nios_system_clock_0_in,
                                            CPU_data_master_read_data_valid_nios_system_clock_0_in,
                                            CPU_data_master_requests_nios_system_clock_0_in,
                                            d1_nios_system_clock_0_in_end_xfer,
                                            nios_system_clock_0_in_address,
                                            nios_system_clock_0_in_endofpacket_from_sa,
                                            nios_system_clock_0_in_nativeaddress,
                                            nios_system_clock_0_in_read,
                                            nios_system_clock_0_in_readdata_from_sa,
                                            nios_system_clock_0_in_reset_n,
                                            nios_system_clock_0_in_waitrequest_from_sa,
                                            nios_system_clock_0_in_write,
                                            nios_system_clock_0_in_writedata
                                         )
;

  output           CPU_data_master_byteenable_nios_system_clock_0_in;
  output           CPU_data_master_granted_nios_system_clock_0_in;
  output           CPU_data_master_qualified_request_nios_system_clock_0_in;
  output           CPU_data_master_read_data_valid_nios_system_clock_0_in;
  output           CPU_data_master_requests_nios_system_clock_0_in;
  output           d1_nios_system_clock_0_in_end_xfer;
  output           nios_system_clock_0_in_address;
  output           nios_system_clock_0_in_endofpacket_from_sa;
  output           nios_system_clock_0_in_nativeaddress;
  output           nios_system_clock_0_in_read;
  output  [  7: 0] nios_system_clock_0_in_readdata_from_sa;
  output           nios_system_clock_0_in_reset_n;
  output           nios_system_clock_0_in_waitrequest_from_sa;
  output           nios_system_clock_0_in_write;
  output  [  7: 0] nios_system_clock_0_in_writedata;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  1: 0] CPU_data_master_dbs_address;
  input   [  7: 0] CPU_data_master_dbs_write_8;
  input            CPU_data_master_no_byte_enables_and_last_term;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input            clk;
  input            nios_system_clock_0_in_endofpacket;
  input   [  7: 0] nios_system_clock_0_in_readdata;
  input            nios_system_clock_0_in_waitrequest;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_byteenable_nios_system_clock_0_in;
  wire             CPU_data_master_byteenable_nios_system_clock_0_in_segment_0;
  wire             CPU_data_master_byteenable_nios_system_clock_0_in_segment_1;
  wire             CPU_data_master_byteenable_nios_system_clock_0_in_segment_2;
  wire             CPU_data_master_byteenable_nios_system_clock_0_in_segment_3;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_nios_system_clock_0_in;
  wire             CPU_data_master_qualified_request_nios_system_clock_0_in;
  wire             CPU_data_master_read_data_valid_nios_system_clock_0_in;
  wire             CPU_data_master_requests_nios_system_clock_0_in;
  wire             CPU_data_master_saved_grant_nios_system_clock_0_in;
  reg              d1_nios_system_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_nios_system_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             nios_system_clock_0_in_address;
  wire             nios_system_clock_0_in_allgrants;
  wire             nios_system_clock_0_in_allow_new_arb_cycle;
  wire             nios_system_clock_0_in_any_bursting_master_saved_grant;
  wire             nios_system_clock_0_in_any_continuerequest;
  wire             nios_system_clock_0_in_arb_counter_enable;
  reg     [  2: 0] nios_system_clock_0_in_arb_share_counter;
  wire    [  2: 0] nios_system_clock_0_in_arb_share_counter_next_value;
  wire    [  2: 0] nios_system_clock_0_in_arb_share_set_values;
  wire             nios_system_clock_0_in_beginbursttransfer_internal;
  wire             nios_system_clock_0_in_begins_xfer;
  wire             nios_system_clock_0_in_end_xfer;
  wire             nios_system_clock_0_in_endofpacket_from_sa;
  wire             nios_system_clock_0_in_firsttransfer;
  wire             nios_system_clock_0_in_grant_vector;
  wire             nios_system_clock_0_in_in_a_read_cycle;
  wire             nios_system_clock_0_in_in_a_write_cycle;
  wire             nios_system_clock_0_in_master_qreq_vector;
  wire             nios_system_clock_0_in_nativeaddress;
  wire             nios_system_clock_0_in_non_bursting_master_requests;
  wire             nios_system_clock_0_in_pretend_byte_enable;
  wire             nios_system_clock_0_in_read;
  wire    [  7: 0] nios_system_clock_0_in_readdata_from_sa;
  reg              nios_system_clock_0_in_reg_firsttransfer;
  wire             nios_system_clock_0_in_reset_n;
  reg              nios_system_clock_0_in_slavearbiterlockenable;
  wire             nios_system_clock_0_in_slavearbiterlockenable2;
  wire             nios_system_clock_0_in_unreg_firsttransfer;
  wire             nios_system_clock_0_in_waitrequest_from_sa;
  wire             nios_system_clock_0_in_waits_for_read;
  wire             nios_system_clock_0_in_waits_for_write;
  wire             nios_system_clock_0_in_write;
  wire    [  7: 0] nios_system_clock_0_in_writedata;
  wire             wait_for_nios_system_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~nios_system_clock_0_in_end_xfer;
    end


  assign nios_system_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_nios_system_clock_0_in));
  //assign nios_system_clock_0_in_readdata_from_sa = nios_system_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_system_clock_0_in_readdata_from_sa = nios_system_clock_0_in_readdata;

  assign CPU_data_master_requests_nios_system_clock_0_in = ({CPU_data_master_address_to_slave[28 : 1] , 1'b0} == 29'h10002030) & (CPU_data_master_read | CPU_data_master_write);
  //assign nios_system_clock_0_in_waitrequest_from_sa = nios_system_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_system_clock_0_in_waitrequest_from_sa = nios_system_clock_0_in_waitrequest;

  //nios_system_clock_0_in_arb_share_counter set values, which is an e_mux
  assign nios_system_clock_0_in_arb_share_set_values = (CPU_data_master_granted_nios_system_clock_0_in)? 4 :
    1;

  //nios_system_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign nios_system_clock_0_in_non_bursting_master_requests = CPU_data_master_requests_nios_system_clock_0_in;

  //nios_system_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign nios_system_clock_0_in_any_bursting_master_saved_grant = 0;

  //nios_system_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign nios_system_clock_0_in_arb_share_counter_next_value = nios_system_clock_0_in_firsttransfer ? (nios_system_clock_0_in_arb_share_set_values - 1) : |nios_system_clock_0_in_arb_share_counter ? (nios_system_clock_0_in_arb_share_counter - 1) : 0;

  //nios_system_clock_0_in_allgrants all slave grants, which is an e_mux
  assign nios_system_clock_0_in_allgrants = |nios_system_clock_0_in_grant_vector;

  //nios_system_clock_0_in_end_xfer assignment, which is an e_assign
  assign nios_system_clock_0_in_end_xfer = ~(nios_system_clock_0_in_waits_for_read | nios_system_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_nios_system_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_nios_system_clock_0_in = nios_system_clock_0_in_end_xfer & (~nios_system_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //nios_system_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign nios_system_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_nios_system_clock_0_in & nios_system_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_nios_system_clock_0_in & ~nios_system_clock_0_in_non_bursting_master_requests);

  //nios_system_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_system_clock_0_in_arb_share_counter <= 0;
      else if (nios_system_clock_0_in_arb_counter_enable)
          nios_system_clock_0_in_arb_share_counter <= nios_system_clock_0_in_arb_share_counter_next_value;
    end


  //nios_system_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_system_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|nios_system_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_nios_system_clock_0_in) | (end_xfer_arb_share_counter_term_nios_system_clock_0_in & ~nios_system_clock_0_in_non_bursting_master_requests))
          nios_system_clock_0_in_slavearbiterlockenable <= |nios_system_clock_0_in_arb_share_counter_next_value;
    end


  //CPU/data_master nios_system_clock_0/in arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = nios_system_clock_0_in_slavearbiterlockenable & CPU_data_master_continuerequest;

  //nios_system_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign nios_system_clock_0_in_slavearbiterlockenable2 = |nios_system_clock_0_in_arb_share_counter_next_value;

  //CPU/data_master nios_system_clock_0/in arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = nios_system_clock_0_in_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //nios_system_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign nios_system_clock_0_in_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_nios_system_clock_0_in = CPU_data_master_requests_nios_system_clock_0_in & ~((CPU_data_master_read & (~CPU_data_master_waitrequest)) | ((~CPU_data_master_waitrequest | CPU_data_master_no_byte_enables_and_last_term | !CPU_data_master_byteenable_nios_system_clock_0_in) & CPU_data_master_write));
  //nios_system_clock_0_in_writedata mux, which is an e_mux
  assign nios_system_clock_0_in_writedata = CPU_data_master_dbs_write_8;

  //assign nios_system_clock_0_in_endofpacket_from_sa = nios_system_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_system_clock_0_in_endofpacket_from_sa = nios_system_clock_0_in_endofpacket;

  //master is always granted when requested
  assign CPU_data_master_granted_nios_system_clock_0_in = CPU_data_master_qualified_request_nios_system_clock_0_in;

  //CPU/data_master saved-grant nios_system_clock_0/in, which is an e_assign
  assign CPU_data_master_saved_grant_nios_system_clock_0_in = CPU_data_master_requests_nios_system_clock_0_in;

  //allow new arb cycle for nios_system_clock_0/in, which is an e_assign
  assign nios_system_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign nios_system_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign nios_system_clock_0_in_master_qreq_vector = 1;

  //nios_system_clock_0_in_reset_n assignment, which is an e_assign
  assign nios_system_clock_0_in_reset_n = reset_n;

  //nios_system_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign nios_system_clock_0_in_firsttransfer = nios_system_clock_0_in_begins_xfer ? nios_system_clock_0_in_unreg_firsttransfer : nios_system_clock_0_in_reg_firsttransfer;

  //nios_system_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign nios_system_clock_0_in_unreg_firsttransfer = ~(nios_system_clock_0_in_slavearbiterlockenable & nios_system_clock_0_in_any_continuerequest);

  //nios_system_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_system_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (nios_system_clock_0_in_begins_xfer)
          nios_system_clock_0_in_reg_firsttransfer <= nios_system_clock_0_in_unreg_firsttransfer;
    end


  //nios_system_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign nios_system_clock_0_in_beginbursttransfer_internal = nios_system_clock_0_in_begins_xfer;

  //nios_system_clock_0_in_read assignment, which is an e_mux
  assign nios_system_clock_0_in_read = CPU_data_master_granted_nios_system_clock_0_in & CPU_data_master_read;

  //nios_system_clock_0_in_write assignment, which is an e_mux
  assign nios_system_clock_0_in_write = ((CPU_data_master_granted_nios_system_clock_0_in & CPU_data_master_write)) & nios_system_clock_0_in_pretend_byte_enable;

  //nios_system_clock_0_in_address mux, which is an e_mux
  assign nios_system_clock_0_in_address = {CPU_data_master_address_to_slave >> 2,
    CPU_data_master_dbs_address[1 : 0]};

  //slaveid nios_system_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign nios_system_clock_0_in_nativeaddress = CPU_data_master_address_to_slave >> 2;

  //d1_nios_system_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_nios_system_clock_0_in_end_xfer <= 1;
      else 
        d1_nios_system_clock_0_in_end_xfer <= nios_system_clock_0_in_end_xfer;
    end


  //nios_system_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign nios_system_clock_0_in_waits_for_read = nios_system_clock_0_in_in_a_read_cycle & nios_system_clock_0_in_waitrequest_from_sa;

  //nios_system_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign nios_system_clock_0_in_in_a_read_cycle = CPU_data_master_granted_nios_system_clock_0_in & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = nios_system_clock_0_in_in_a_read_cycle;

  //nios_system_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign nios_system_clock_0_in_waits_for_write = nios_system_clock_0_in_in_a_write_cycle & nios_system_clock_0_in_waitrequest_from_sa;

  //nios_system_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign nios_system_clock_0_in_in_a_write_cycle = CPU_data_master_granted_nios_system_clock_0_in & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = nios_system_clock_0_in_in_a_write_cycle;

  assign wait_for_nios_system_clock_0_in_counter = 0;
  //nios_system_clock_0_in_pretend_byte_enable byte enable port mux, which is an e_mux
  assign nios_system_clock_0_in_pretend_byte_enable = (CPU_data_master_granted_nios_system_clock_0_in)? CPU_data_master_byteenable_nios_system_clock_0_in :
    -1;

  assign {CPU_data_master_byteenable_nios_system_clock_0_in_segment_3,
CPU_data_master_byteenable_nios_system_clock_0_in_segment_2,
CPU_data_master_byteenable_nios_system_clock_0_in_segment_1,
CPU_data_master_byteenable_nios_system_clock_0_in_segment_0} = CPU_data_master_byteenable;
  assign CPU_data_master_byteenable_nios_system_clock_0_in = ((CPU_data_master_dbs_address[1 : 0] == 0))? CPU_data_master_byteenable_nios_system_clock_0_in_segment_0 :
    ((CPU_data_master_dbs_address[1 : 0] == 1))? CPU_data_master_byteenable_nios_system_clock_0_in_segment_1 :
    ((CPU_data_master_dbs_address[1 : 0] == 2))? CPU_data_master_byteenable_nios_system_clock_0_in_segment_2 :
    CPU_data_master_byteenable_nios_system_clock_0_in_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_system_clock_0/in enable non-zero assertions, which is an e_register
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

module nios_system_clock_0_out_arbitrator (
                                            // inputs:
                                             External_Clocks_avalon_clocks_slave_readdata_from_sa,
                                             clk,
                                             d1_External_Clocks_avalon_clocks_slave_end_xfer,
                                             nios_system_clock_0_out_address,
                                             nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave,
                                             nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave,
                                             nios_system_clock_0_out_read,
                                             nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave,
                                             nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave,
                                             nios_system_clock_0_out_write,
                                             nios_system_clock_0_out_writedata,
                                             reset_n,

                                            // outputs:
                                             nios_system_clock_0_out_address_to_slave,
                                             nios_system_clock_0_out_readdata,
                                             nios_system_clock_0_out_reset_n,
                                             nios_system_clock_0_out_waitrequest
                                          )
;

  output           nios_system_clock_0_out_address_to_slave;
  output  [  7: 0] nios_system_clock_0_out_readdata;
  output           nios_system_clock_0_out_reset_n;
  output           nios_system_clock_0_out_waitrequest;
  input   [  7: 0] External_Clocks_avalon_clocks_slave_readdata_from_sa;
  input            clk;
  input            d1_External_Clocks_avalon_clocks_slave_end_xfer;
  input            nios_system_clock_0_out_address;
  input            nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave;
  input            nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave;
  input            nios_system_clock_0_out_read;
  input            nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave;
  input            nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave;
  input            nios_system_clock_0_out_write;
  input   [  7: 0] nios_system_clock_0_out_writedata;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg              nios_system_clock_0_out_address_last_time;
  wire             nios_system_clock_0_out_address_to_slave;
  reg              nios_system_clock_0_out_read_last_time;
  wire    [  7: 0] nios_system_clock_0_out_readdata;
  wire             nios_system_clock_0_out_reset_n;
  wire             nios_system_clock_0_out_run;
  wire             nios_system_clock_0_out_waitrequest;
  reg              nios_system_clock_0_out_write_last_time;
  reg     [  7: 0] nios_system_clock_0_out_writedata_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave | nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave | ~nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave) & ((~nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave | ~nios_system_clock_0_out_read | (nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave & nios_system_clock_0_out_read))) & ((~nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave | ~(nios_system_clock_0_out_read | nios_system_clock_0_out_write) | (1 & (nios_system_clock_0_out_read | nios_system_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign nios_system_clock_0_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign nios_system_clock_0_out_address_to_slave = nios_system_clock_0_out_address;

  //nios_system_clock_0/out readdata mux, which is an e_mux
  assign nios_system_clock_0_out_readdata = External_Clocks_avalon_clocks_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign nios_system_clock_0_out_waitrequest = ~nios_system_clock_0_out_run;

  //nios_system_clock_0_out_reset_n assignment, which is an e_assign
  assign nios_system_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_system_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_system_clock_0_out_address_last_time <= 0;
      else 
        nios_system_clock_0_out_address_last_time <= nios_system_clock_0_out_address;
    end


  //nios_system_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= nios_system_clock_0_out_waitrequest & (nios_system_clock_0_out_read | nios_system_clock_0_out_write);
    end


  //nios_system_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_system_clock_0_out_address != nios_system_clock_0_out_address_last_time))
        begin
          $write("%0d ns: nios_system_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_system_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_system_clock_0_out_read_last_time <= 0;
      else 
        nios_system_clock_0_out_read_last_time <= nios_system_clock_0_out_read;
    end


  //nios_system_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_system_clock_0_out_read != nios_system_clock_0_out_read_last_time))
        begin
          $write("%0d ns: nios_system_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_system_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_system_clock_0_out_write_last_time <= 0;
      else 
        nios_system_clock_0_out_write_last_time <= nios_system_clock_0_out_write;
    end


  //nios_system_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_system_clock_0_out_write != nios_system_clock_0_out_write_last_time))
        begin
          $write("%0d ns: nios_system_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_system_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_system_clock_0_out_writedata_last_time <= 0;
      else 
        nios_system_clock_0_out_writedata_last_time <= nios_system_clock_0_out_writedata;
    end


  //nios_system_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_system_clock_0_out_writedata != nios_system_clock_0_out_writedata_last_time) & nios_system_clock_0_out_write)
        begin
          $write("%0d ns: nios_system_clock_0_out_writedata did not heed wait!!!", $time);
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

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         CPU_data_master_address_to_slave,
                                         CPU_data_master_read,
                                         CPU_data_master_write,
                                         clk,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         CPU_data_master_granted_sysid_control_slave,
                                         CPU_data_master_qualified_request_sysid_control_slave,
                                         CPU_data_master_read_data_valid_sysid_control_slave,
                                         CPU_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           CPU_data_master_granted_sysid_control_slave;
  output           CPU_data_master_qualified_request_sysid_control_slave;
  output           CPU_data_master_read_data_valid_sysid_control_slave;
  output           CPU_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input            clk;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_sysid_control_slave;
  wire             CPU_data_master_qualified_request_sysid_control_slave;
  wire             CPU_data_master_read_data_valid_sysid_control_slave;
  wire             CPU_data_master_requests_sysid_control_slave;
  wire             CPU_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_sysid_control_slave_from_CPU_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  2: 0] sysid_control_slave_arb_share_counter;
  wire    [  2: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign CPU_data_master_requests_sysid_control_slave = (({CPU_data_master_address_to_slave[28 : 3] , 3'b0} == 29'h10002020) & (CPU_data_master_read | CPU_data_master_write)) & CPU_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = CPU_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //CPU/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //CPU/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_sysid_control_slave = CPU_data_master_requests_sysid_control_slave;
  //master is always granted when requested
  assign CPU_data_master_granted_sysid_control_slave = CPU_data_master_qualified_request_sysid_control_slave;

  //CPU/data_master saved-grant sysid/control_slave, which is an e_assign
  assign CPU_data_master_saved_grant_sysid_control_slave = CPU_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_CPU_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = CPU_data_master_granted_sysid_control_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = CPU_data_master_granted_sysid_control_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
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

module nios_system_reset_sys_clk_domain_synch_module (
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

module nios_system_reset_clk_domain_synch_module (
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

module nios_system_reset_vga_clk_domain_synch_module (
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

module nios_system (
                     // 1) global signals:
                      audio_clk,
                      clk,
                      clk_27,
                      reset_n,
                      sdram_clk,
                      sys_clk,
                      vga_clk,

                     // the_AV_Config
                      I2C_SCLK_from_the_AV_Config,
                      I2C_SDAT_to_and_from_the_AV_Config,

                     // the_Audio
                      AUD_ADCDAT_to_the_Audio,
                      AUD_ADCLRCK_to_and_from_the_Audio,
                      AUD_BCLK_to_and_from_the_Audio,
                      AUD_DACDAT_from_the_Audio,
                      AUD_DACLRCK_to_and_from_the_Audio,

                     // the_CPU
                      A_ci_multi_clock_from_the_CPU,
                      A_ci_multi_reset_from_the_CPU,

                     // the_Char_LCD_16x2
                      LCD_BLON_from_the_Char_LCD_16x2,
                      LCD_DATA_to_and_from_the_Char_LCD_16x2,
                      LCD_EN_from_the_Char_LCD_16x2,
                      LCD_ON_from_the_Char_LCD_16x2,
                      LCD_RS_from_the_Char_LCD_16x2,
                      LCD_RW_from_the_Char_LCD_16x2,

                     // the_Expansion_JP1
                      GPIO_0_to_and_from_the_Expansion_JP1,

                     // the_Expansion_JP2
                      GPIO_1_to_and_from_the_Expansion_JP2,

                     // the_Green_LEDs
                      LEDG_from_the_Green_LEDs,

                     // the_HEX3_HEX0
                      HEX0_from_the_HEX3_HEX0,
                      HEX1_from_the_HEX3_HEX0,
                      HEX2_from_the_HEX3_HEX0,
                      HEX3_from_the_HEX3_HEX0,

                     // the_HEX7_HEX4
                      HEX4_from_the_HEX7_HEX4,
                      HEX5_from_the_HEX7_HEX4,
                      HEX6_from_the_HEX7_HEX4,
                      HEX7_from_the_HEX7_HEX4,

                     // the_PS2_Port
                      PS2_CLK_to_and_from_the_PS2_Port,
                      PS2_DAT_to_and_from_the_PS2_Port,

                     // the_Pushbuttons
                      KEY_to_the_Pushbuttons,

                     // the_Red_LEDs
                      LEDR_from_the_Red_LEDs,

                     // the_SDRAM
                      zs_addr_from_the_SDRAM,
                      zs_ba_from_the_SDRAM,
                      zs_cas_n_from_the_SDRAM,
                      zs_cke_from_the_SDRAM,
                      zs_cs_n_from_the_SDRAM,
                      zs_dq_to_and_from_the_SDRAM,
                      zs_dqm_from_the_SDRAM,
                      zs_ras_n_from_the_SDRAM,
                      zs_we_n_from_the_SDRAM,

                     // the_SRAM
                      SRAM_ADDR_from_the_SRAM,
                      SRAM_CE_N_from_the_SRAM,
                      SRAM_DQ_to_and_from_the_SRAM,
                      SRAM_LB_N_from_the_SRAM,
                      SRAM_OE_N_from_the_SRAM,
                      SRAM_UB_N_from_the_SRAM,
                      SRAM_WE_N_from_the_SRAM,

                     // the_Serial_Port
                      UART_RXD_to_the_Serial_Port,
                      UART_TXD_from_the_Serial_Port,

                     // the_Slider_Switches
                      SW_to_the_Slider_Switches,

                     // the_VGA_Controller
                      VGA_BLANK_from_the_VGA_Controller,
                      VGA_B_from_the_VGA_Controller,
                      VGA_CLK_from_the_VGA_Controller,
                      VGA_G_from_the_VGA_Controller,
                      VGA_HS_from_the_VGA_Controller,
                      VGA_R_from_the_VGA_Controller,
                      VGA_SYNC_from_the_VGA_Controller,
                      VGA_VS_from_the_VGA_Controller
                   )
;

  inout            AUD_ADCLRCK_to_and_from_the_Audio;
  inout            AUD_BCLK_to_and_from_the_Audio;
  output           AUD_DACDAT_from_the_Audio;
  inout            AUD_DACLRCK_to_and_from_the_Audio;
  output           A_ci_multi_clock_from_the_CPU;
  output           A_ci_multi_reset_from_the_CPU;
  inout   [ 31: 0] GPIO_0_to_and_from_the_Expansion_JP1;
  inout   [ 31: 0] GPIO_1_to_and_from_the_Expansion_JP2;
  output  [  6: 0] HEX0_from_the_HEX3_HEX0;
  output  [  6: 0] HEX1_from_the_HEX3_HEX0;
  output  [  6: 0] HEX2_from_the_HEX3_HEX0;
  output  [  6: 0] HEX3_from_the_HEX3_HEX0;
  output  [  6: 0] HEX4_from_the_HEX7_HEX4;
  output  [  6: 0] HEX5_from_the_HEX7_HEX4;
  output  [  6: 0] HEX6_from_the_HEX7_HEX4;
  output  [  6: 0] HEX7_from_the_HEX7_HEX4;
  output           I2C_SCLK_from_the_AV_Config;
  inout            I2C_SDAT_to_and_from_the_AV_Config;
  output           LCD_BLON_from_the_Char_LCD_16x2;
  inout   [  7: 0] LCD_DATA_to_and_from_the_Char_LCD_16x2;
  output           LCD_EN_from_the_Char_LCD_16x2;
  output           LCD_ON_from_the_Char_LCD_16x2;
  output           LCD_RS_from_the_Char_LCD_16x2;
  output           LCD_RW_from_the_Char_LCD_16x2;
  output  [  8: 0] LEDG_from_the_Green_LEDs;
  output  [ 17: 0] LEDR_from_the_Red_LEDs;
  inout            PS2_CLK_to_and_from_the_PS2_Port;
  inout            PS2_DAT_to_and_from_the_PS2_Port;
  output  [ 17: 0] SRAM_ADDR_from_the_SRAM;
  output           SRAM_CE_N_from_the_SRAM;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_SRAM;
  output           SRAM_LB_N_from_the_SRAM;
  output           SRAM_OE_N_from_the_SRAM;
  output           SRAM_UB_N_from_the_SRAM;
  output           SRAM_WE_N_from_the_SRAM;
  output           UART_TXD_from_the_Serial_Port;
  output           VGA_BLANK_from_the_VGA_Controller;
  output  [  9: 0] VGA_B_from_the_VGA_Controller;
  output           VGA_CLK_from_the_VGA_Controller;
  output  [  9: 0] VGA_G_from_the_VGA_Controller;
  output           VGA_HS_from_the_VGA_Controller;
  output  [  9: 0] VGA_R_from_the_VGA_Controller;
  output           VGA_SYNC_from_the_VGA_Controller;
  output           VGA_VS_from_the_VGA_Controller;
  output           audio_clk;
  output           sdram_clk;
  output           sys_clk;
  output           vga_clk;
  output  [ 11: 0] zs_addr_from_the_SDRAM;
  output  [  1: 0] zs_ba_from_the_SDRAM;
  output           zs_cas_n_from_the_SDRAM;
  output           zs_cke_from_the_SDRAM;
  output           zs_cs_n_from_the_SDRAM;
  inout   [ 15: 0] zs_dq_to_and_from_the_SDRAM;
  output  [  1: 0] zs_dqm_from_the_SDRAM;
  output           zs_ras_n_from_the_SDRAM;
  output           zs_we_n_from_the_SDRAM;
  input            AUD_ADCDAT_to_the_Audio;
  input   [  3: 0] KEY_to_the_Pushbuttons;
  input   [ 17: 0] SW_to_the_Slider_Switches;
  input            UART_RXD_to_the_Serial_Port;
  input            clk;
  input            clk_27;
  input            reset_n;

  wire             AUD_ADCLRCK_to_and_from_the_Audio;
  wire             AUD_BCLK_to_and_from_the_Audio;
  wire             AUD_DACDAT_from_the_Audio;
  wire             AUD_DACLRCK_to_and_from_the_Audio;
  wire    [  1: 0] AV_Config_avalon_av_config_slave_address;
  wire    [  3: 0] AV_Config_avalon_av_config_slave_byteenable;
  wire             AV_Config_avalon_av_config_slave_read;
  wire    [ 31: 0] AV_Config_avalon_av_config_slave_readdata;
  wire    [ 31: 0] AV_Config_avalon_av_config_slave_readdata_from_sa;
  wire             AV_Config_avalon_av_config_slave_reset;
  wire             AV_Config_avalon_av_config_slave_waitrequest;
  wire             AV_Config_avalon_av_config_slave_waitrequest_from_sa;
  wire             AV_Config_avalon_av_config_slave_write;
  wire    [ 31: 0] AV_Config_avalon_av_config_slave_writedata;
  wire             A_ci_multi_clock_from_the_CPU;
  wire             A_ci_multi_reset_from_the_CPU;
  wire    [ 29: 0] Alpha_Blending_avalon_background_sink_data;
  wire             Alpha_Blending_avalon_background_sink_endofpacket;
  wire             Alpha_Blending_avalon_background_sink_ready;
  wire             Alpha_Blending_avalon_background_sink_ready_from_sa;
  wire             Alpha_Blending_avalon_background_sink_startofpacket;
  wire             Alpha_Blending_avalon_background_sink_valid;
  wire    [ 29: 0] Alpha_Blending_avalon_blended_source_data;
  wire             Alpha_Blending_avalon_blended_source_endofpacket;
  wire             Alpha_Blending_avalon_blended_source_ready;
  wire             Alpha_Blending_avalon_blended_source_startofpacket;
  wire             Alpha_Blending_avalon_blended_source_valid;
  wire    [ 39: 0] Alpha_Blending_avalon_foreground_sink_data;
  wire             Alpha_Blending_avalon_foreground_sink_endofpacket;
  wire             Alpha_Blending_avalon_foreground_sink_ready;
  wire             Alpha_Blending_avalon_foreground_sink_ready_from_sa;
  wire             Alpha_Blending_avalon_foreground_sink_reset;
  wire             Alpha_Blending_avalon_foreground_sink_startofpacket;
  wire             Alpha_Blending_avalon_foreground_sink_valid;
  wire    [  1: 0] Audio_avalon_audio_slave_address;
  wire             Audio_avalon_audio_slave_chipselect;
  wire             Audio_avalon_audio_slave_irq;
  wire             Audio_avalon_audio_slave_irq_from_sa;
  wire             Audio_avalon_audio_slave_read;
  wire    [ 31: 0] Audio_avalon_audio_slave_readdata;
  wire    [ 31: 0] Audio_avalon_audio_slave_readdata_from_sa;
  wire             Audio_avalon_audio_slave_reset;
  wire             Audio_avalon_audio_slave_write;
  wire    [ 31: 0] Audio_avalon_audio_slave_writedata;
  wire    [  4: 0] CPU_custom_instruction_master_multi_a;
  wire    [  4: 0] CPU_custom_instruction_master_multi_b;
  wire    [  4: 0] CPU_custom_instruction_master_multi_c;
  wire             CPU_custom_instruction_master_multi_clk_en;
  wire    [ 31: 0] CPU_custom_instruction_master_multi_dataa;
  wire    [ 31: 0] CPU_custom_instruction_master_multi_datab;
  wire             CPU_custom_instruction_master_multi_done;
  wire             CPU_custom_instruction_master_multi_estatus;
  wire    [ 31: 0] CPU_custom_instruction_master_multi_ipending;
  wire    [  7: 0] CPU_custom_instruction_master_multi_n;
  wire             CPU_custom_instruction_master_multi_readra;
  wire             CPU_custom_instruction_master_multi_readrb;
  wire    [ 31: 0] CPU_custom_instruction_master_multi_result;
  wire             CPU_custom_instruction_master_multi_start;
  wire             CPU_custom_instruction_master_multi_status;
  wire             CPU_custom_instruction_master_multi_writerc;
  wire             CPU_custom_instruction_master_reset_n;
  wire             CPU_custom_instruction_master_start_CPU_fpoint_s1;
  wire    [ 28: 0] CPU_data_master_address;
  wire    [ 28: 0] CPU_data_master_address_to_slave;
  wire    [  3: 0] CPU_data_master_byteenable;
  wire             CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave;
  wire    [  1: 0] CPU_data_master_byteenable_SDRAM_s1;
  wire    [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave;
  wire             CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             CPU_data_master_byteenable_nios_system_clock_0_in;
  wire    [  1: 0] CPU_data_master_dbs_address;
  wire    [ 15: 0] CPU_data_master_dbs_write_16;
  wire    [  7: 0] CPU_data_master_dbs_write_8;
  wire             CPU_data_master_debugaccess;
  wire             CPU_data_master_granted_AV_Config_avalon_av_config_slave;
  wire             CPU_data_master_granted_Audio_avalon_audio_slave;
  wire             CPU_data_master_granted_CPU_jtag_debug_module;
  wire             CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave;
  wire             CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_Interval_Timer_s1;
  wire             CPU_data_master_granted_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_granted_PS2_Port_avalon_ps2_slave;
  wire             CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_SDRAM_s1;
  wire             CPU_data_master_granted_SRAM_avalon_sram_slave;
  wire             CPU_data_master_granted_Serial_Port_avalon_rs232_slave;
  wire             CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave;
  wire             CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave;
  wire             CPU_data_master_granted_nios_system_clock_0_in;
  wire             CPU_data_master_granted_sysid_control_slave;
  wire    [ 31: 0] CPU_data_master_irq;
  wire             CPU_data_master_no_byte_enables_and_last_term;
  wire             CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave;
  wire             CPU_data_master_qualified_request_Audio_avalon_audio_slave;
  wire             CPU_data_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave;
  wire             CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Interval_Timer_s1;
  wire             CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave;
  wire             CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_SDRAM_s1;
  wire             CPU_data_master_qualified_request_SRAM_avalon_sram_slave;
  wire             CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave;
  wire             CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave;
  wire             CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave;
  wire             CPU_data_master_qualified_request_nios_system_clock_0_in;
  wire             CPU_data_master_qualified_request_sysid_control_slave;
  wire             CPU_data_master_read;
  wire             CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave;
  wire             CPU_data_master_read_data_valid_Audio_avalon_audio_slave;
  wire             CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_data_master_read_data_valid_Char_LCD_16x2_avalon_lcd_slave;
  wire             CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Interval_Timer_s1;
  wire             CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave;
  wire             CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_SDRAM_s1;
  wire             CPU_data_master_read_data_valid_SDRAM_s1_shift_register;
  wire             CPU_data_master_read_data_valid_SRAM_avalon_sram_slave;
  wire             CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave;
  wire             CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave;
  wire             CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave;
  wire             CPU_data_master_read_data_valid_nios_system_clock_0_in;
  wire             CPU_data_master_read_data_valid_sysid_control_slave;
  wire    [ 31: 0] CPU_data_master_readdata;
  wire             CPU_data_master_requests_AV_Config_avalon_av_config_slave;
  wire             CPU_data_master_requests_Audio_avalon_audio_slave;
  wire             CPU_data_master_requests_CPU_jtag_debug_module;
  wire             CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave;
  wire             CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_Interval_Timer_s1;
  wire             CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_requests_PS2_Port_avalon_ps2_slave;
  wire             CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_SDRAM_s1;
  wire             CPU_data_master_requests_SRAM_avalon_sram_slave;
  wire             CPU_data_master_requests_Serial_Port_avalon_rs232_slave;
  wire             CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave;
  wire             CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave;
  wire             CPU_data_master_requests_nios_system_clock_0_in;
  wire             CPU_data_master_requests_sysid_control_slave;
  wire             CPU_data_master_waitrequest;
  wire             CPU_data_master_write;
  wire    [ 31: 0] CPU_data_master_writedata;
  wire             CPU_fpoint_s1_clk_en;
  wire    [ 31: 0] CPU_fpoint_s1_dataa;
  wire    [ 31: 0] CPU_fpoint_s1_datab;
  wire             CPU_fpoint_s1_done;
  wire             CPU_fpoint_s1_done_from_sa;
  wire    [  1: 0] CPU_fpoint_s1_n;
  wire             CPU_fpoint_s1_reset;
  wire    [ 31: 0] CPU_fpoint_s1_result;
  wire    [ 31: 0] CPU_fpoint_s1_result_from_sa;
  wire             CPU_fpoint_s1_select;
  wire             CPU_fpoint_s1_start;
  wire    [ 27: 0] CPU_instruction_master_address;
  wire    [ 27: 0] CPU_instruction_master_address_to_slave;
  wire    [  1: 0] CPU_instruction_master_dbs_address;
  wire             CPU_instruction_master_granted_CPU_jtag_debug_module;
  wire             CPU_instruction_master_granted_SDRAM_s1;
  wire             CPU_instruction_master_latency_counter;
  wire             CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_instruction_master_qualified_request_SDRAM_s1;
  wire             CPU_instruction_master_read;
  wire             CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_instruction_master_read_data_valid_SDRAM_s1;
  wire             CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register;
  wire    [ 31: 0] CPU_instruction_master_readdata;
  wire             CPU_instruction_master_readdatavalid;
  wire             CPU_instruction_master_requests_CPU_jtag_debug_module;
  wire             CPU_instruction_master_requests_SDRAM_s1;
  wire             CPU_instruction_master_waitrequest;
  wire    [  8: 0] CPU_jtag_debug_module_address;
  wire             CPU_jtag_debug_module_begintransfer;
  wire    [  3: 0] CPU_jtag_debug_module_byteenable;
  wire             CPU_jtag_debug_module_chipselect;
  wire             CPU_jtag_debug_module_debugaccess;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  wire             CPU_jtag_debug_module_resetrequest;
  wire             CPU_jtag_debug_module_resetrequest_from_sa;
  wire             CPU_jtag_debug_module_write;
  wire    [ 31: 0] CPU_jtag_debug_module_writedata;
  wire             Char_LCD_16x2_avalon_lcd_slave_address;
  wire             Char_LCD_16x2_avalon_lcd_slave_chipselect;
  wire             Char_LCD_16x2_avalon_lcd_slave_read;
  wire    [  7: 0] Char_LCD_16x2_avalon_lcd_slave_readdata;
  wire    [  7: 0] Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa;
  wire             Char_LCD_16x2_avalon_lcd_slave_reset;
  wire             Char_LCD_16x2_avalon_lcd_slave_waitrequest;
  wire             Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa;
  wire             Char_LCD_16x2_avalon_lcd_slave_write;
  wire    [  7: 0] Char_LCD_16x2_avalon_lcd_slave_writedata;
  wire    [  1: 0] Expansion_JP1_avalon_parallel_port_slave_address;
  wire    [  3: 0] Expansion_JP1_avalon_parallel_port_slave_byteenable;
  wire             Expansion_JP1_avalon_parallel_port_slave_chipselect;
  wire             Expansion_JP1_avalon_parallel_port_slave_irq;
  wire             Expansion_JP1_avalon_parallel_port_slave_irq_from_sa;
  wire             Expansion_JP1_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa;
  wire             Expansion_JP1_avalon_parallel_port_slave_reset;
  wire             Expansion_JP1_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_writedata;
  wire    [  1: 0] Expansion_JP2_avalon_parallel_port_slave_address;
  wire    [  3: 0] Expansion_JP2_avalon_parallel_port_slave_byteenable;
  wire             Expansion_JP2_avalon_parallel_port_slave_chipselect;
  wire             Expansion_JP2_avalon_parallel_port_slave_irq;
  wire             Expansion_JP2_avalon_parallel_port_slave_irq_from_sa;
  wire             Expansion_JP2_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa;
  wire             Expansion_JP2_avalon_parallel_port_slave_reset;
  wire             Expansion_JP2_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_writedata;
  wire             External_Clocks_avalon_clocks_slave_address;
  wire    [  7: 0] External_Clocks_avalon_clocks_slave_readdata;
  wire    [  7: 0] External_Clocks_avalon_clocks_slave_readdata_from_sa;
  wire    [ 31: 0] GPIO_0_to_and_from_the_Expansion_JP1;
  wire    [ 31: 0] GPIO_1_to_and_from_the_Expansion_JP2;
  wire    [  1: 0] Green_LEDs_avalon_parallel_port_slave_address;
  wire    [  3: 0] Green_LEDs_avalon_parallel_port_slave_byteenable;
  wire             Green_LEDs_avalon_parallel_port_slave_chipselect;
  wire             Green_LEDs_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  wire             Green_LEDs_avalon_parallel_port_slave_reset;
  wire             Green_LEDs_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Green_LEDs_avalon_parallel_port_slave_writedata;
  wire    [  6: 0] HEX0_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX1_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX2_from_the_HEX3_HEX0;
  wire    [  1: 0] HEX3_HEX0_avalon_parallel_port_slave_address;
  wire    [  3: 0] HEX3_HEX0_avalon_parallel_port_slave_byteenable;
  wire             HEX3_HEX0_avalon_parallel_port_slave_chipselect;
  wire             HEX3_HEX0_avalon_parallel_port_slave_read;
  wire    [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa;
  wire             HEX3_HEX0_avalon_parallel_port_slave_reset;
  wire             HEX3_HEX0_avalon_parallel_port_slave_write;
  wire    [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_writedata;
  wire    [  6: 0] HEX3_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX4_from_the_HEX7_HEX4;
  wire    [  6: 0] HEX5_from_the_HEX7_HEX4;
  wire    [  6: 0] HEX6_from_the_HEX7_HEX4;
  wire    [  1: 0] HEX7_HEX4_avalon_parallel_port_slave_address;
  wire    [  3: 0] HEX7_HEX4_avalon_parallel_port_slave_byteenable;
  wire             HEX7_HEX4_avalon_parallel_port_slave_chipselect;
  wire             HEX7_HEX4_avalon_parallel_port_slave_read;
  wire    [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa;
  wire             HEX7_HEX4_avalon_parallel_port_slave_reset;
  wire             HEX7_HEX4_avalon_parallel_port_slave_write;
  wire    [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_writedata;
  wire    [  6: 0] HEX7_from_the_HEX7_HEX4;
  wire             I2C_SCLK_from_the_AV_Config;
  wire             I2C_SDAT_to_and_from_the_AV_Config;
  wire    [  2: 0] Interval_Timer_s1_address;
  wire             Interval_Timer_s1_chipselect;
  wire             Interval_Timer_s1_irq;
  wire             Interval_Timer_s1_irq_from_sa;
  wire    [ 15: 0] Interval_Timer_s1_readdata;
  wire    [ 15: 0] Interval_Timer_s1_readdata_from_sa;
  wire             Interval_Timer_s1_reset_n;
  wire             Interval_Timer_s1_write_n;
  wire    [ 15: 0] Interval_Timer_s1_writedata;
  wire             JTAG_UART_avalon_jtag_slave_address;
  wire             JTAG_UART_avalon_jtag_slave_chipselect;
  wire             JTAG_UART_avalon_jtag_slave_dataavailable;
  wire             JTAG_UART_avalon_jtag_slave_dataavailable_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_irq;
  wire             JTAG_UART_avalon_jtag_slave_irq_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_read_n;
  wire    [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata;
  wire    [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_readyfordata;
  wire             JTAG_UART_avalon_jtag_slave_readyfordata_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_reset_n;
  wire             JTAG_UART_avalon_jtag_slave_waitrequest;
  wire             JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_write_n;
  wire    [ 31: 0] JTAG_UART_avalon_jtag_slave_writedata;
  wire             LCD_BLON_from_the_Char_LCD_16x2;
  wire    [  7: 0] LCD_DATA_to_and_from_the_Char_LCD_16x2;
  wire             LCD_EN_from_the_Char_LCD_16x2;
  wire             LCD_ON_from_the_Char_LCD_16x2;
  wire             LCD_RS_from_the_Char_LCD_16x2;
  wire             LCD_RW_from_the_Char_LCD_16x2;
  wire    [  8: 0] LEDG_from_the_Green_LEDs;
  wire    [ 17: 0] LEDR_from_the_Red_LEDs;
  wire             PS2_CLK_to_and_from_the_PS2_Port;
  wire             PS2_DAT_to_and_from_the_PS2_Port;
  wire             PS2_Port_avalon_ps2_slave_address;
  wire    [  3: 0] PS2_Port_avalon_ps2_slave_byteenable;
  wire             PS2_Port_avalon_ps2_slave_chipselect;
  wire             PS2_Port_avalon_ps2_slave_irq;
  wire             PS2_Port_avalon_ps2_slave_irq_from_sa;
  wire             PS2_Port_avalon_ps2_slave_read;
  wire    [ 31: 0] PS2_Port_avalon_ps2_slave_readdata;
  wire    [ 31: 0] PS2_Port_avalon_ps2_slave_readdata_from_sa;
  wire             PS2_Port_avalon_ps2_slave_reset;
  wire             PS2_Port_avalon_ps2_slave_waitrequest;
  wire             PS2_Port_avalon_ps2_slave_waitrequest_from_sa;
  wire             PS2_Port_avalon_ps2_slave_write;
  wire    [ 31: 0] PS2_Port_avalon_ps2_slave_writedata;
  wire    [  1: 0] Pushbuttons_avalon_parallel_port_slave_address;
  wire    [  3: 0] Pushbuttons_avalon_parallel_port_slave_byteenable;
  wire             Pushbuttons_avalon_parallel_port_slave_chipselect;
  wire             Pushbuttons_avalon_parallel_port_slave_irq;
  wire             Pushbuttons_avalon_parallel_port_slave_irq_from_sa;
  wire             Pushbuttons_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata_from_sa;
  wire             Pushbuttons_avalon_parallel_port_slave_reset;
  wire             Pushbuttons_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Pushbuttons_avalon_parallel_port_slave_writedata;
  wire    [  1: 0] Red_LEDs_avalon_parallel_port_slave_address;
  wire    [  3: 0] Red_LEDs_avalon_parallel_port_slave_byteenable;
  wire             Red_LEDs_avalon_parallel_port_slave_chipselect;
  wire             Red_LEDs_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  wire             Red_LEDs_avalon_parallel_port_slave_reset;
  wire             Red_LEDs_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Red_LEDs_avalon_parallel_port_slave_writedata;
  wire    [ 21: 0] SDRAM_s1_address;
  wire    [  1: 0] SDRAM_s1_byteenable_n;
  wire             SDRAM_s1_chipselect;
  wire             SDRAM_s1_read_n;
  wire    [ 15: 0] SDRAM_s1_readdata;
  wire    [ 15: 0] SDRAM_s1_readdata_from_sa;
  wire             SDRAM_s1_readdatavalid;
  wire             SDRAM_s1_reset_n;
  wire             SDRAM_s1_waitrequest;
  wire             SDRAM_s1_waitrequest_from_sa;
  wire             SDRAM_s1_write_n;
  wire    [ 15: 0] SDRAM_s1_writedata;
  wire    [ 17: 0] SRAM_ADDR_from_the_SRAM;
  wire             SRAM_CE_N_from_the_SRAM;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_SRAM;
  wire             SRAM_LB_N_from_the_SRAM;
  wire             SRAM_OE_N_from_the_SRAM;
  wire             SRAM_UB_N_from_the_SRAM;
  wire             SRAM_WE_N_from_the_SRAM;
  wire    [ 17: 0] SRAM_avalon_sram_slave_address;
  wire    [  1: 0] SRAM_avalon_sram_slave_byteenable;
  wire             SRAM_avalon_sram_slave_read;
  wire    [ 15: 0] SRAM_avalon_sram_slave_readdata;
  wire    [ 15: 0] SRAM_avalon_sram_slave_readdata_from_sa;
  wire             SRAM_avalon_sram_slave_readdatavalid;
  wire             SRAM_avalon_sram_slave_reset;
  wire             SRAM_avalon_sram_slave_write;
  wire    [ 15: 0] SRAM_avalon_sram_slave_writedata;
  wire             Serial_Port_avalon_rs232_slave_address;
  wire    [  3: 0] Serial_Port_avalon_rs232_slave_byteenable;
  wire             Serial_Port_avalon_rs232_slave_chipselect;
  wire             Serial_Port_avalon_rs232_slave_irq;
  wire             Serial_Port_avalon_rs232_slave_irq_from_sa;
  wire             Serial_Port_avalon_rs232_slave_read;
  wire    [ 31: 0] Serial_Port_avalon_rs232_slave_readdata;
  wire    [ 31: 0] Serial_Port_avalon_rs232_slave_readdata_from_sa;
  wire             Serial_Port_avalon_rs232_slave_reset;
  wire             Serial_Port_avalon_rs232_slave_write;
  wire    [ 31: 0] Serial_Port_avalon_rs232_slave_writedata;
  wire    [  1: 0] Slider_Switches_avalon_parallel_port_slave_address;
  wire    [  3: 0] Slider_Switches_avalon_parallel_port_slave_byteenable;
  wire             Slider_Switches_avalon_parallel_port_slave_chipselect;
  wire             Slider_Switches_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Slider_Switches_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Slider_Switches_avalon_parallel_port_slave_readdata_from_sa;
  wire             Slider_Switches_avalon_parallel_port_slave_reset;
  wire             Slider_Switches_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Slider_Switches_avalon_parallel_port_slave_writedata;
  wire             UART_TXD_from_the_Serial_Port;
  wire             VGA_BLANK_from_the_VGA_Controller;
  wire    [  9: 0] VGA_B_from_the_VGA_Controller;
  wire             VGA_CLK_from_the_VGA_Controller;
  wire    [ 12: 0] VGA_Char_Buffer_avalon_char_buffer_slave_address;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_byteenable;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_chipselect;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_read;
  wire    [  7: 0] VGA_Char_Buffer_avalon_char_buffer_slave_readdata;
  wire    [  7: 0] VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa;
  wire             VGA_Char_Buffer_avalon_char_buffer_slave_write;
  wire    [  7: 0] VGA_Char_Buffer_avalon_char_buffer_slave_writedata;
  wire             VGA_Char_Buffer_avalon_char_control_slave_address;
  wire    [  3: 0] VGA_Char_Buffer_avalon_char_control_slave_byteenable;
  wire             VGA_Char_Buffer_avalon_char_control_slave_chipselect;
  wire             VGA_Char_Buffer_avalon_char_control_slave_read;
  wire    [ 31: 0] VGA_Char_Buffer_avalon_char_control_slave_readdata;
  wire    [ 31: 0] VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa;
  wire             VGA_Char_Buffer_avalon_char_control_slave_reset;
  wire             VGA_Char_Buffer_avalon_char_control_slave_write;
  wire    [ 31: 0] VGA_Char_Buffer_avalon_char_control_slave_writedata;
  wire    [ 39: 0] VGA_Char_Buffer_avalon_char_source_data;
  wire             VGA_Char_Buffer_avalon_char_source_endofpacket;
  wire             VGA_Char_Buffer_avalon_char_source_ready;
  wire             VGA_Char_Buffer_avalon_char_source_startofpacket;
  wire             VGA_Char_Buffer_avalon_char_source_valid;
  wire    [ 29: 0] VGA_Controller_avalon_vga_sink_data;
  wire             VGA_Controller_avalon_vga_sink_endofpacket;
  wire             VGA_Controller_avalon_vga_sink_ready;
  wire             VGA_Controller_avalon_vga_sink_ready_from_sa;
  wire             VGA_Controller_avalon_vga_sink_reset;
  wire             VGA_Controller_avalon_vga_sink_startofpacket;
  wire             VGA_Controller_avalon_vga_sink_valid;
  wire    [ 29: 0] VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_data;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_valid;
  wire    [ 29: 0] VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_data;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_ready;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket;
  wire             VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_valid;
  wire    [  9: 0] VGA_G_from_the_VGA_Controller;
  wire             VGA_HS_from_the_VGA_Controller;
  wire    [  1: 0] VGA_Pixel_Buffer_avalon_control_slave_address;
  wire    [  3: 0] VGA_Pixel_Buffer_avalon_control_slave_byteenable;
  wire             VGA_Pixel_Buffer_avalon_control_slave_read;
  wire    [ 31: 0] VGA_Pixel_Buffer_avalon_control_slave_readdata;
  wire    [ 31: 0] VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa;
  wire             VGA_Pixel_Buffer_avalon_control_slave_write;
  wire    [ 31: 0] VGA_Pixel_Buffer_avalon_control_slave_writedata;
  wire    [ 31: 0] VGA_Pixel_Buffer_avalon_pixel_dma_master_address;
  wire    [ 31: 0] VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_arbiterlock;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_read;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  wire    [  7: 0] VGA_Pixel_Buffer_avalon_pixel_dma_master_readdata;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_readdatavalid;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_reset;
  wire             VGA_Pixel_Buffer_avalon_pixel_dma_master_waitrequest;
  wire    [  7: 0] VGA_Pixel_Buffer_avalon_pixel_source_data;
  wire             VGA_Pixel_Buffer_avalon_pixel_source_endofpacket;
  wire             VGA_Pixel_Buffer_avalon_pixel_source_ready;
  wire             VGA_Pixel_Buffer_avalon_pixel_source_startofpacket;
  wire             VGA_Pixel_Buffer_avalon_pixel_source_valid;
  wire    [  7: 0] VGA_Pixel_RGB_Resampler_avalon_rgb_sink_data;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_reset;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_sink_valid;
  wire    [ 29: 0] VGA_Pixel_RGB_Resampler_avalon_rgb_source_data;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_source_endofpacket;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_source_ready;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_source_startofpacket;
  wire             VGA_Pixel_RGB_Resampler_avalon_rgb_source_valid;
  wire    [  9: 0] VGA_R_from_the_VGA_Controller;
  wire             VGA_SYNC_from_the_VGA_Controller;
  wire             VGA_VS_from_the_VGA_Controller;
  wire             audio_clk;
  wire             clk_reset_n;
  wire             d1_AV_Config_avalon_av_config_slave_end_xfer;
  wire             d1_Audio_avalon_audio_slave_end_xfer;
  wire             d1_CPU_jtag_debug_module_end_xfer;
  wire             d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer;
  wire             d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer;
  wire             d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer;
  wire             d1_External_Clocks_avalon_clocks_slave_end_xfer;
  wire             d1_Green_LEDs_avalon_parallel_port_slave_end_xfer;
  wire             d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
  wire             d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
  wire             d1_Interval_Timer_s1_end_xfer;
  wire             d1_JTAG_UART_avalon_jtag_slave_end_xfer;
  wire             d1_PS2_Port_avalon_ps2_slave_end_xfer;
  wire             d1_Pushbuttons_avalon_parallel_port_slave_end_xfer;
  wire             d1_Red_LEDs_avalon_parallel_port_slave_end_xfer;
  wire             d1_SDRAM_s1_end_xfer;
  wire             d1_SRAM_avalon_sram_slave_end_xfer;
  wire             d1_Serial_Port_avalon_rs232_slave_end_xfer;
  wire             d1_Slider_Switches_avalon_parallel_port_slave_end_xfer;
  wire             d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer;
  wire             d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer;
  wire             d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer;
  wire             d1_nios_system_clock_0_in_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             nios_system_clock_0_in_address;
  wire             nios_system_clock_0_in_endofpacket;
  wire             nios_system_clock_0_in_endofpacket_from_sa;
  wire             nios_system_clock_0_in_nativeaddress;
  wire             nios_system_clock_0_in_read;
  wire    [  7: 0] nios_system_clock_0_in_readdata;
  wire    [  7: 0] nios_system_clock_0_in_readdata_from_sa;
  wire             nios_system_clock_0_in_reset_n;
  wire             nios_system_clock_0_in_waitrequest;
  wire             nios_system_clock_0_in_waitrequest_from_sa;
  wire             nios_system_clock_0_in_write;
  wire    [  7: 0] nios_system_clock_0_in_writedata;
  wire             nios_system_clock_0_out_address;
  wire             nios_system_clock_0_out_address_to_slave;
  wire             nios_system_clock_0_out_endofpacket;
  wire             nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave;
  wire             nios_system_clock_0_out_nativeaddress;
  wire             nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave;
  wire             nios_system_clock_0_out_read;
  wire             nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave;
  wire    [  7: 0] nios_system_clock_0_out_readdata;
  wire             nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave;
  wire             nios_system_clock_0_out_reset_n;
  wire             nios_system_clock_0_out_waitrequest;
  wire             nios_system_clock_0_out_write;
  wire    [  7: 0] nios_system_clock_0_out_writedata;
  wire             out_clk_External_Clocks_AUD_CLK;
  wire             out_clk_External_Clocks_SDRAM_CLK;
  wire             out_clk_External_Clocks_VGA_CLK;
  wire             out_clk_External_Clocks_sys_clk;
  wire             registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave;
  wire             registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave;
  wire             registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave;
  wire             registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave;
  wire             registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave;
  wire             registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave;
  wire             registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave;
  wire             reset_n_sources;
  wire             sdram_clk;
  wire             sys_clk;
  wire             sys_clk_reset_n;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire             vga_clk;
  wire             vga_clk_reset_n;
  wire    [ 11: 0] zs_addr_from_the_SDRAM;
  wire    [  1: 0] zs_ba_from_the_SDRAM;
  wire             zs_cas_n_from_the_SDRAM;
  wire             zs_cke_from_the_SDRAM;
  wire             zs_cs_n_from_the_SDRAM;
  wire    [ 15: 0] zs_dq_to_and_from_the_SDRAM;
  wire    [  1: 0] zs_dqm_from_the_SDRAM;
  wire             zs_ras_n_from_the_SDRAM;
  wire             zs_we_n_from_the_SDRAM;
  AV_Config_avalon_av_config_slave_arbitrator the_AV_Config_avalon_av_config_slave
    (
      .AV_Config_avalon_av_config_slave_address                                    (AV_Config_avalon_av_config_slave_address),
      .AV_Config_avalon_av_config_slave_byteenable                                 (AV_Config_avalon_av_config_slave_byteenable),
      .AV_Config_avalon_av_config_slave_read                                       (AV_Config_avalon_av_config_slave_read),
      .AV_Config_avalon_av_config_slave_readdata                                   (AV_Config_avalon_av_config_slave_readdata),
      .AV_Config_avalon_av_config_slave_readdata_from_sa                           (AV_Config_avalon_av_config_slave_readdata_from_sa),
      .AV_Config_avalon_av_config_slave_reset                                      (AV_Config_avalon_av_config_slave_reset),
      .AV_Config_avalon_av_config_slave_waitrequest                                (AV_Config_avalon_av_config_slave_waitrequest),
      .AV_Config_avalon_av_config_slave_waitrequest_from_sa                        (AV_Config_avalon_av_config_slave_waitrequest_from_sa),
      .AV_Config_avalon_av_config_slave_write                                      (AV_Config_avalon_av_config_slave_write),
      .AV_Config_avalon_av_config_slave_writedata                                  (AV_Config_avalon_av_config_slave_writedata),
      .CPU_data_master_address_to_slave                                            (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                  (CPU_data_master_byteenable),
      .CPU_data_master_granted_AV_Config_avalon_av_config_slave                    (CPU_data_master_granted_AV_Config_avalon_av_config_slave),
      .CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave          (CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave),
      .CPU_data_master_read                                                        (CPU_data_master_read),
      .CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave            (CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave),
      .CPU_data_master_requests_AV_Config_avalon_av_config_slave                   (CPU_data_master_requests_AV_Config_avalon_av_config_slave),
      .CPU_data_master_waitrequest                                                 (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                       (CPU_data_master_write),
      .CPU_data_master_writedata                                                   (CPU_data_master_writedata),
      .clk                                                                         (sys_clk),
      .d1_AV_Config_avalon_av_config_slave_end_xfer                                (d1_AV_Config_avalon_av_config_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave (registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave),
      .reset_n                                                                     (sys_clk_reset_n)
    );

  AV_Config the_AV_Config
    (
      .I2C_SCLK    (I2C_SCLK_from_the_AV_Config),
      .I2C_SDAT    (I2C_SDAT_to_and_from_the_AV_Config),
      .address     (AV_Config_avalon_av_config_slave_address),
      .byteenable  (AV_Config_avalon_av_config_slave_byteenable),
      .clk         (sys_clk),
      .read        (AV_Config_avalon_av_config_slave_read),
      .readdata    (AV_Config_avalon_av_config_slave_readdata),
      .reset       (AV_Config_avalon_av_config_slave_reset),
      .waitrequest (AV_Config_avalon_av_config_slave_waitrequest),
      .write       (AV_Config_avalon_av_config_slave_write),
      .writedata   (AV_Config_avalon_av_config_slave_writedata)
    );

  Alpha_Blending_avalon_background_sink_arbitrator the_Alpha_Blending_avalon_background_sink
    (
      .Alpha_Blending_avalon_background_sink_data              (Alpha_Blending_avalon_background_sink_data),
      .Alpha_Blending_avalon_background_sink_endofpacket       (Alpha_Blending_avalon_background_sink_endofpacket),
      .Alpha_Blending_avalon_background_sink_ready             (Alpha_Blending_avalon_background_sink_ready),
      .Alpha_Blending_avalon_background_sink_ready_from_sa     (Alpha_Blending_avalon_background_sink_ready_from_sa),
      .Alpha_Blending_avalon_background_sink_startofpacket     (Alpha_Blending_avalon_background_sink_startofpacket),
      .Alpha_Blending_avalon_background_sink_valid             (Alpha_Blending_avalon_background_sink_valid),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_source_data          (VGA_Pixel_RGB_Resampler_avalon_rgb_source_data),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_source_endofpacket   (VGA_Pixel_RGB_Resampler_avalon_rgb_source_endofpacket),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_source_startofpacket (VGA_Pixel_RGB_Resampler_avalon_rgb_source_startofpacket),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_source_valid         (VGA_Pixel_RGB_Resampler_avalon_rgb_source_valid),
      .clk                                                     (sys_clk),
      .reset_n                                                 (sys_clk_reset_n)
    );

  Alpha_Blending_avalon_foreground_sink_arbitrator the_Alpha_Blending_avalon_foreground_sink
    (
      .Alpha_Blending_avalon_foreground_sink_data          (Alpha_Blending_avalon_foreground_sink_data),
      .Alpha_Blending_avalon_foreground_sink_endofpacket   (Alpha_Blending_avalon_foreground_sink_endofpacket),
      .Alpha_Blending_avalon_foreground_sink_ready         (Alpha_Blending_avalon_foreground_sink_ready),
      .Alpha_Blending_avalon_foreground_sink_ready_from_sa (Alpha_Blending_avalon_foreground_sink_ready_from_sa),
      .Alpha_Blending_avalon_foreground_sink_reset         (Alpha_Blending_avalon_foreground_sink_reset),
      .Alpha_Blending_avalon_foreground_sink_startofpacket (Alpha_Blending_avalon_foreground_sink_startofpacket),
      .Alpha_Blending_avalon_foreground_sink_valid         (Alpha_Blending_avalon_foreground_sink_valid),
      .VGA_Char_Buffer_avalon_char_source_data             (VGA_Char_Buffer_avalon_char_source_data),
      .VGA_Char_Buffer_avalon_char_source_endofpacket      (VGA_Char_Buffer_avalon_char_source_endofpacket),
      .VGA_Char_Buffer_avalon_char_source_startofpacket    (VGA_Char_Buffer_avalon_char_source_startofpacket),
      .VGA_Char_Buffer_avalon_char_source_valid            (VGA_Char_Buffer_avalon_char_source_valid),
      .clk                                                 (sys_clk),
      .reset_n                                             (sys_clk_reset_n)
    );

  Alpha_Blending_avalon_blended_source_arbitrator the_Alpha_Blending_avalon_blended_source
    (
      .Alpha_Blending_avalon_blended_source_data               (Alpha_Blending_avalon_blended_source_data),
      .Alpha_Blending_avalon_blended_source_endofpacket        (Alpha_Blending_avalon_blended_source_endofpacket),
      .Alpha_Blending_avalon_blended_source_ready              (Alpha_Blending_avalon_blended_source_ready),
      .Alpha_Blending_avalon_blended_source_startofpacket      (Alpha_Blending_avalon_blended_source_startofpacket),
      .Alpha_Blending_avalon_blended_source_valid              (Alpha_Blending_avalon_blended_source_valid),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa),
      .clk                                                     (sys_clk),
      .reset_n                                                 (sys_clk_reset_n)
    );

  Alpha_Blending the_Alpha_Blending
    (
      .background_data          (Alpha_Blending_avalon_background_sink_data),
      .background_endofpacket   (Alpha_Blending_avalon_background_sink_endofpacket),
      .background_ready         (Alpha_Blending_avalon_background_sink_ready),
      .background_startofpacket (Alpha_Blending_avalon_background_sink_startofpacket),
      .background_valid         (Alpha_Blending_avalon_background_sink_valid),
      .clk                      (sys_clk),
      .foreground_data          (Alpha_Blending_avalon_foreground_sink_data),
      .foreground_endofpacket   (Alpha_Blending_avalon_foreground_sink_endofpacket),
      .foreground_ready         (Alpha_Blending_avalon_foreground_sink_ready),
      .foreground_startofpacket (Alpha_Blending_avalon_foreground_sink_startofpacket),
      .foreground_valid         (Alpha_Blending_avalon_foreground_sink_valid),
      .output_data              (Alpha_Blending_avalon_blended_source_data),
      .output_endofpacket       (Alpha_Blending_avalon_blended_source_endofpacket),
      .output_ready             (Alpha_Blending_avalon_blended_source_ready),
      .output_startofpacket     (Alpha_Blending_avalon_blended_source_startofpacket),
      .output_valid             (Alpha_Blending_avalon_blended_source_valid),
      .reset                    (Alpha_Blending_avalon_foreground_sink_reset)
    );

  Audio_avalon_audio_slave_arbitrator the_Audio_avalon_audio_slave
    (
      .Audio_avalon_audio_slave_address                                    (Audio_avalon_audio_slave_address),
      .Audio_avalon_audio_slave_chipselect                                 (Audio_avalon_audio_slave_chipselect),
      .Audio_avalon_audio_slave_irq                                        (Audio_avalon_audio_slave_irq),
      .Audio_avalon_audio_slave_irq_from_sa                                (Audio_avalon_audio_slave_irq_from_sa),
      .Audio_avalon_audio_slave_read                                       (Audio_avalon_audio_slave_read),
      .Audio_avalon_audio_slave_readdata                                   (Audio_avalon_audio_slave_readdata),
      .Audio_avalon_audio_slave_readdata_from_sa                           (Audio_avalon_audio_slave_readdata_from_sa),
      .Audio_avalon_audio_slave_reset                                      (Audio_avalon_audio_slave_reset),
      .Audio_avalon_audio_slave_write                                      (Audio_avalon_audio_slave_write),
      .Audio_avalon_audio_slave_writedata                                  (Audio_avalon_audio_slave_writedata),
      .CPU_data_master_address_to_slave                                    (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_Audio_avalon_audio_slave                    (CPU_data_master_granted_Audio_avalon_audio_slave),
      .CPU_data_master_qualified_request_Audio_avalon_audio_slave          (CPU_data_master_qualified_request_Audio_avalon_audio_slave),
      .CPU_data_master_read                                                (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Audio_avalon_audio_slave            (CPU_data_master_read_data_valid_Audio_avalon_audio_slave),
      .CPU_data_master_requests_Audio_avalon_audio_slave                   (CPU_data_master_requests_Audio_avalon_audio_slave),
      .CPU_data_master_waitrequest                                         (CPU_data_master_waitrequest),
      .CPU_data_master_write                                               (CPU_data_master_write),
      .CPU_data_master_writedata                                           (CPU_data_master_writedata),
      .clk                                                                 (sys_clk),
      .d1_Audio_avalon_audio_slave_end_xfer                                (d1_Audio_avalon_audio_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave (registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave),
      .reset_n                                                             (sys_clk_reset_n)
    );

  Audio the_Audio
    (
      .AUD_ADCDAT  (AUD_ADCDAT_to_the_Audio),
      .AUD_ADCLRCK (AUD_ADCLRCK_to_and_from_the_Audio),
      .AUD_BCLK    (AUD_BCLK_to_and_from_the_Audio),
      .AUD_DACDAT  (AUD_DACDAT_from_the_Audio),
      .AUD_DACLRCK (AUD_DACLRCK_to_and_from_the_Audio),
      .address     (Audio_avalon_audio_slave_address),
      .chipselect  (Audio_avalon_audio_slave_chipselect),
      .clk         (sys_clk),
      .irq         (Audio_avalon_audio_slave_irq),
      .read        (Audio_avalon_audio_slave_read),
      .readdata    (Audio_avalon_audio_slave_readdata),
      .reset       (Audio_avalon_audio_slave_reset),
      .write       (Audio_avalon_audio_slave_write),
      .writedata   (Audio_avalon_audio_slave_writedata)
    );

  CPU_jtag_debug_module_arbitrator the_CPU_jtag_debug_module
    (
      .CPU_data_master_address_to_slave                               (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                     (CPU_data_master_byteenable),
      .CPU_data_master_debugaccess                                    (CPU_data_master_debugaccess),
      .CPU_data_master_granted_CPU_jtag_debug_module                  (CPU_data_master_granted_CPU_jtag_debug_module),
      .CPU_data_master_qualified_request_CPU_jtag_debug_module        (CPU_data_master_qualified_request_CPU_jtag_debug_module),
      .CPU_data_master_read                                           (CPU_data_master_read),
      .CPU_data_master_read_data_valid_CPU_jtag_debug_module          (CPU_data_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_data_master_requests_CPU_jtag_debug_module                 (CPU_data_master_requests_CPU_jtag_debug_module),
      .CPU_data_master_waitrequest                                    (CPU_data_master_waitrequest),
      .CPU_data_master_write                                          (CPU_data_master_write),
      .CPU_data_master_writedata                                      (CPU_data_master_writedata),
      .CPU_instruction_master_address_to_slave                        (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_granted_CPU_jtag_debug_module           (CPU_instruction_master_granted_CPU_jtag_debug_module),
      .CPU_instruction_master_latency_counter                         (CPU_instruction_master_latency_counter),
      .CPU_instruction_master_qualified_request_CPU_jtag_debug_module (CPU_instruction_master_qualified_request_CPU_jtag_debug_module),
      .CPU_instruction_master_read                                    (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_CPU_jtag_debug_module   (CPU_instruction_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register (CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register),
      .CPU_instruction_master_requests_CPU_jtag_debug_module          (CPU_instruction_master_requests_CPU_jtag_debug_module),
      .CPU_jtag_debug_module_address                                  (CPU_jtag_debug_module_address),
      .CPU_jtag_debug_module_begintransfer                            (CPU_jtag_debug_module_begintransfer),
      .CPU_jtag_debug_module_byteenable                               (CPU_jtag_debug_module_byteenable),
      .CPU_jtag_debug_module_chipselect                               (CPU_jtag_debug_module_chipselect),
      .CPU_jtag_debug_module_debugaccess                              (CPU_jtag_debug_module_debugaccess),
      .CPU_jtag_debug_module_readdata                                 (CPU_jtag_debug_module_readdata),
      .CPU_jtag_debug_module_readdata_from_sa                         (CPU_jtag_debug_module_readdata_from_sa),
      .CPU_jtag_debug_module_resetrequest                             (CPU_jtag_debug_module_resetrequest),
      .CPU_jtag_debug_module_resetrequest_from_sa                     (CPU_jtag_debug_module_resetrequest_from_sa),
      .CPU_jtag_debug_module_write                                    (CPU_jtag_debug_module_write),
      .CPU_jtag_debug_module_writedata                                (CPU_jtag_debug_module_writedata),
      .clk                                                            (sys_clk),
      .d1_CPU_jtag_debug_module_end_xfer                              (d1_CPU_jtag_debug_module_end_xfer),
      .reset_n                                                        (sys_clk_reset_n)
    );

  CPU_custom_instruction_master_arbitrator the_CPU_custom_instruction_master
    (
      .CPU_custom_instruction_master_multi_done          (CPU_custom_instruction_master_multi_done),
      .CPU_custom_instruction_master_multi_result        (CPU_custom_instruction_master_multi_result),
      .CPU_custom_instruction_master_multi_start         (CPU_custom_instruction_master_multi_start),
      .CPU_custom_instruction_master_reset_n             (CPU_custom_instruction_master_reset_n),
      .CPU_custom_instruction_master_start_CPU_fpoint_s1 (CPU_custom_instruction_master_start_CPU_fpoint_s1),
      .CPU_fpoint_s1_done_from_sa                        (CPU_fpoint_s1_done_from_sa),
      .CPU_fpoint_s1_result_from_sa                      (CPU_fpoint_s1_result_from_sa),
      .CPU_fpoint_s1_select                              (CPU_fpoint_s1_select),
      .clk                                               (sys_clk),
      .reset_n                                           (sys_clk_reset_n)
    );

  CPU_data_master_arbitrator the_CPU_data_master
    (
      .AV_Config_avalon_av_config_slave_readdata_from_sa                                     (AV_Config_avalon_av_config_slave_readdata_from_sa),
      .AV_Config_avalon_av_config_slave_waitrequest_from_sa                                  (AV_Config_avalon_av_config_slave_waitrequest_from_sa),
      .Audio_avalon_audio_slave_irq_from_sa                                                  (Audio_avalon_audio_slave_irq_from_sa),
      .Audio_avalon_audio_slave_readdata_from_sa                                             (Audio_avalon_audio_slave_readdata_from_sa),
      .CPU_data_master_address                                                               (CPU_data_master_address),
      .CPU_data_master_address_to_slave                                                      (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave                             (CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave),
      .CPU_data_master_byteenable_SDRAM_s1                                                   (CPU_data_master_byteenable_SDRAM_s1),
      .CPU_data_master_byteenable_SRAM_avalon_sram_slave                                     (CPU_data_master_byteenable_SRAM_avalon_sram_slave),
      .CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave                   (CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave),
      .CPU_data_master_byteenable_nios_system_clock_0_in                                     (CPU_data_master_byteenable_nios_system_clock_0_in),
      .CPU_data_master_dbs_address                                                           (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_16                                                          (CPU_data_master_dbs_write_16),
      .CPU_data_master_dbs_write_8                                                           (CPU_data_master_dbs_write_8),
      .CPU_data_master_granted_AV_Config_avalon_av_config_slave                              (CPU_data_master_granted_AV_Config_avalon_av_config_slave),
      .CPU_data_master_granted_Audio_avalon_audio_slave                                      (CPU_data_master_granted_Audio_avalon_audio_slave),
      .CPU_data_master_granted_CPU_jtag_debug_module                                         (CPU_data_master_granted_CPU_jtag_debug_module),
      .CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave                                (CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave),
      .CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave                      (CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave                      (CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave                         (CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave                          (CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave                          (CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_granted_Interval_Timer_s1                                             (CPU_data_master_granted_Interval_Timer_s1),
      .CPU_data_master_granted_JTAG_UART_avalon_jtag_slave                                   (CPU_data_master_granted_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_granted_PS2_Port_avalon_ps2_slave                                     (CPU_data_master_granted_PS2_Port_avalon_ps2_slave),
      .CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave                        (CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave                           (CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_granted_SDRAM_s1                                                      (CPU_data_master_granted_SDRAM_s1),
      .CPU_data_master_granted_SRAM_avalon_sram_slave                                        (CPU_data_master_granted_SRAM_avalon_sram_slave),
      .CPU_data_master_granted_Serial_Port_avalon_rs232_slave                                (CPU_data_master_granted_Serial_Port_avalon_rs232_slave),
      .CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave                    (CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave),
      .CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave                      (CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave),
      .CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave                     (CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave),
      .CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave                         (CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave),
      .CPU_data_master_granted_nios_system_clock_0_in                                        (CPU_data_master_granted_nios_system_clock_0_in),
      .CPU_data_master_granted_sysid_control_slave                                           (CPU_data_master_granted_sysid_control_slave),
      .CPU_data_master_irq                                                                   (CPU_data_master_irq),
      .CPU_data_master_no_byte_enables_and_last_term                                         (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave                    (CPU_data_master_qualified_request_AV_Config_avalon_av_config_slave),
      .CPU_data_master_qualified_request_Audio_avalon_audio_slave                            (CPU_data_master_qualified_request_Audio_avalon_audio_slave),
      .CPU_data_master_qualified_request_CPU_jtag_debug_module                               (CPU_data_master_qualified_request_CPU_jtag_debug_module),
      .CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave                      (CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave),
      .CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave            (CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave            (CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave               (CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave                (CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave                (CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Interval_Timer_s1                                   (CPU_data_master_qualified_request_Interval_Timer_s1),
      .CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave                         (CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave                           (CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave),
      .CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave              (CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave                 (CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_SDRAM_s1                                            (CPU_data_master_qualified_request_SDRAM_s1),
      .CPU_data_master_qualified_request_SRAM_avalon_sram_slave                              (CPU_data_master_qualified_request_SRAM_avalon_sram_slave),
      .CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave                      (CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave),
      .CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave            (CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave),
      .CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave           (CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave),
      .CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave               (CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave),
      .CPU_data_master_qualified_request_nios_system_clock_0_in                              (CPU_data_master_qualified_request_nios_system_clock_0_in),
      .CPU_data_master_qualified_request_sysid_control_slave                                 (CPU_data_master_qualified_request_sysid_control_slave),
      .CPU_data_master_read                                                                  (CPU_data_master_read),
      .CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave                      (CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave),
      .CPU_data_master_read_data_valid_Audio_avalon_audio_slave                              (CPU_data_master_read_data_valid_Audio_avalon_audio_slave),
      .CPU_data_master_read_data_valid_CPU_jtag_debug_module                                 (CPU_data_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_data_master_read_data_valid_Char_LCD_16x2_avalon_lcd_slave                        (CPU_data_master_read_data_valid_Char_LCD_16x2_avalon_lcd_slave),
      .CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave              (CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave              (CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave                 (CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave                  (CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave                  (CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_Interval_Timer_s1                                     (CPU_data_master_read_data_valid_Interval_Timer_s1),
      .CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave                           (CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave                             (CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave),
      .CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave                (CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave                   (CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_SDRAM_s1                                              (CPU_data_master_read_data_valid_SDRAM_s1),
      .CPU_data_master_read_data_valid_SDRAM_s1_shift_register                               (CPU_data_master_read_data_valid_SDRAM_s1_shift_register),
      .CPU_data_master_read_data_valid_SRAM_avalon_sram_slave                                (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave),
      .CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register                 (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register),
      .CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave                        (CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave),
      .CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave              (CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave),
      .CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave             (CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave),
      .CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave                 (CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave),
      .CPU_data_master_read_data_valid_nios_system_clock_0_in                                (CPU_data_master_read_data_valid_nios_system_clock_0_in),
      .CPU_data_master_read_data_valid_sysid_control_slave                                   (CPU_data_master_read_data_valid_sysid_control_slave),
      .CPU_data_master_readdata                                                              (CPU_data_master_readdata),
      .CPU_data_master_requests_AV_Config_avalon_av_config_slave                             (CPU_data_master_requests_AV_Config_avalon_av_config_slave),
      .CPU_data_master_requests_Audio_avalon_audio_slave                                     (CPU_data_master_requests_Audio_avalon_audio_slave),
      .CPU_data_master_requests_CPU_jtag_debug_module                                        (CPU_data_master_requests_CPU_jtag_debug_module),
      .CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave                               (CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave),
      .CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave                     (CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave                     (CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave                        (CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave                         (CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave                         (CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_requests_Interval_Timer_s1                                            (CPU_data_master_requests_Interval_Timer_s1),
      .CPU_data_master_requests_JTAG_UART_avalon_jtag_slave                                  (CPU_data_master_requests_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_requests_PS2_Port_avalon_ps2_slave                                    (CPU_data_master_requests_PS2_Port_avalon_ps2_slave),
      .CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave                       (CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave                          (CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_requests_SDRAM_s1                                                     (CPU_data_master_requests_SDRAM_s1),
      .CPU_data_master_requests_SRAM_avalon_sram_slave                                       (CPU_data_master_requests_SRAM_avalon_sram_slave),
      .CPU_data_master_requests_Serial_Port_avalon_rs232_slave                               (CPU_data_master_requests_Serial_Port_avalon_rs232_slave),
      .CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave                   (CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave),
      .CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave                     (CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave),
      .CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave                    (CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave),
      .CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave                        (CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave),
      .CPU_data_master_requests_nios_system_clock_0_in                                       (CPU_data_master_requests_nios_system_clock_0_in),
      .CPU_data_master_requests_sysid_control_slave                                          (CPU_data_master_requests_sysid_control_slave),
      .CPU_data_master_waitrequest                                                           (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                                 (CPU_data_master_write),
      .CPU_data_master_writedata                                                             (CPU_data_master_writedata),
      .CPU_jtag_debug_module_readdata_from_sa                                                (CPU_jtag_debug_module_readdata_from_sa),
      .Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa                                       (Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa),
      .Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa                                    (Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa),
      .Expansion_JP1_avalon_parallel_port_slave_irq_from_sa                                  (Expansion_JP1_avalon_parallel_port_slave_irq_from_sa),
      .Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa                             (Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa),
      .Expansion_JP2_avalon_parallel_port_slave_irq_from_sa                                  (Expansion_JP2_avalon_parallel_port_slave_irq_from_sa),
      .Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa                             (Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa),
      .Green_LEDs_avalon_parallel_port_slave_readdata_from_sa                                (Green_LEDs_avalon_parallel_port_slave_readdata_from_sa),
      .HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa                                 (HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa),
      .HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa                                 (HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa),
      .Interval_Timer_s1_irq_from_sa                                                         (Interval_Timer_s1_irq_from_sa),
      .Interval_Timer_s1_readdata_from_sa                                                    (Interval_Timer_s1_readdata_from_sa),
      .JTAG_UART_avalon_jtag_slave_irq_from_sa                                               (JTAG_UART_avalon_jtag_slave_irq_from_sa),
      .JTAG_UART_avalon_jtag_slave_readdata_from_sa                                          (JTAG_UART_avalon_jtag_slave_readdata_from_sa),
      .JTAG_UART_avalon_jtag_slave_waitrequest_from_sa                                       (JTAG_UART_avalon_jtag_slave_waitrequest_from_sa),
      .PS2_Port_avalon_ps2_slave_irq_from_sa                                                 (PS2_Port_avalon_ps2_slave_irq_from_sa),
      .PS2_Port_avalon_ps2_slave_readdata_from_sa                                            (PS2_Port_avalon_ps2_slave_readdata_from_sa),
      .PS2_Port_avalon_ps2_slave_waitrequest_from_sa                                         (PS2_Port_avalon_ps2_slave_waitrequest_from_sa),
      .Pushbuttons_avalon_parallel_port_slave_irq_from_sa                                    (Pushbuttons_avalon_parallel_port_slave_irq_from_sa),
      .Pushbuttons_avalon_parallel_port_slave_readdata_from_sa                               (Pushbuttons_avalon_parallel_port_slave_readdata_from_sa),
      .Red_LEDs_avalon_parallel_port_slave_readdata_from_sa                                  (Red_LEDs_avalon_parallel_port_slave_readdata_from_sa),
      .SDRAM_s1_readdata_from_sa                                                             (SDRAM_s1_readdata_from_sa),
      .SDRAM_s1_waitrequest_from_sa                                                          (SDRAM_s1_waitrequest_from_sa),
      .SRAM_avalon_sram_slave_readdata_from_sa                                               (SRAM_avalon_sram_slave_readdata_from_sa),
      .Serial_Port_avalon_rs232_slave_irq_from_sa                                            (Serial_Port_avalon_rs232_slave_irq_from_sa),
      .Serial_Port_avalon_rs232_slave_readdata_from_sa                                       (Serial_Port_avalon_rs232_slave_readdata_from_sa),
      .Slider_Switches_avalon_parallel_port_slave_readdata_from_sa                           (Slider_Switches_avalon_parallel_port_slave_readdata_from_sa),
      .VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa                             (VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa),
      .VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa                          (VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa),
      .VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa                            (VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa),
      .VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa                                (VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa),
      .clk                                                                                   (sys_clk),
      .d1_AV_Config_avalon_av_config_slave_end_xfer                                          (d1_AV_Config_avalon_av_config_slave_end_xfer),
      .d1_Audio_avalon_audio_slave_end_xfer                                                  (d1_Audio_avalon_audio_slave_end_xfer),
      .d1_CPU_jtag_debug_module_end_xfer                                                     (d1_CPU_jtag_debug_module_end_xfer),
      .d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer                                            (d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer),
      .d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer                                  (d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer),
      .d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer                                  (d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer),
      .d1_Green_LEDs_avalon_parallel_port_slave_end_xfer                                     (d1_Green_LEDs_avalon_parallel_port_slave_end_xfer),
      .d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer                                      (d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer),
      .d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer                                      (d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer),
      .d1_Interval_Timer_s1_end_xfer                                                         (d1_Interval_Timer_s1_end_xfer),
      .d1_JTAG_UART_avalon_jtag_slave_end_xfer                                               (d1_JTAG_UART_avalon_jtag_slave_end_xfer),
      .d1_PS2_Port_avalon_ps2_slave_end_xfer                                                 (d1_PS2_Port_avalon_ps2_slave_end_xfer),
      .d1_Pushbuttons_avalon_parallel_port_slave_end_xfer                                    (d1_Pushbuttons_avalon_parallel_port_slave_end_xfer),
      .d1_Red_LEDs_avalon_parallel_port_slave_end_xfer                                       (d1_Red_LEDs_avalon_parallel_port_slave_end_xfer),
      .d1_SDRAM_s1_end_xfer                                                                  (d1_SDRAM_s1_end_xfer),
      .d1_SRAM_avalon_sram_slave_end_xfer                                                    (d1_SRAM_avalon_sram_slave_end_xfer),
      .d1_Serial_Port_avalon_rs232_slave_end_xfer                                            (d1_Serial_Port_avalon_rs232_slave_end_xfer),
      .d1_Slider_Switches_avalon_parallel_port_slave_end_xfer                                (d1_Slider_Switches_avalon_parallel_port_slave_end_xfer),
      .d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer                                  (d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer),
      .d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer                                 (d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer),
      .d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer                                     (d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer),
      .d1_nios_system_clock_0_in_end_xfer                                                    (d1_nios_system_clock_0_in_end_xfer),
      .d1_sysid_control_slave_end_xfer                                                       (d1_sysid_control_slave_end_xfer),
      .nios_system_clock_0_in_readdata_from_sa                                               (nios_system_clock_0_in_readdata_from_sa),
      .nios_system_clock_0_in_waitrequest_from_sa                                            (nios_system_clock_0_in_waitrequest_from_sa),
      .registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave           (registered_CPU_data_master_read_data_valid_AV_Config_avalon_av_config_slave),
      .registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave                   (registered_CPU_data_master_read_data_valid_Audio_avalon_audio_slave),
      .registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave   (registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave   (registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave      (registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave       (registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave       (registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave                  (registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave),
      .registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave     (registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave        (registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave             (registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave),
      .registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave   (registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave),
      .registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave  (registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave),
      .registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave      (registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave),
      .reset_n                                                                               (sys_clk_reset_n),
      .sysid_control_slave_readdata_from_sa                                                  (sysid_control_slave_readdata_from_sa)
    );

  CPU_instruction_master_arbitrator the_CPU_instruction_master
    (
      .CPU_instruction_master_address                                 (CPU_instruction_master_address),
      .CPU_instruction_master_address_to_slave                        (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_dbs_address                             (CPU_instruction_master_dbs_address),
      .CPU_instruction_master_granted_CPU_jtag_debug_module           (CPU_instruction_master_granted_CPU_jtag_debug_module),
      .CPU_instruction_master_granted_SDRAM_s1                        (CPU_instruction_master_granted_SDRAM_s1),
      .CPU_instruction_master_latency_counter                         (CPU_instruction_master_latency_counter),
      .CPU_instruction_master_qualified_request_CPU_jtag_debug_module (CPU_instruction_master_qualified_request_CPU_jtag_debug_module),
      .CPU_instruction_master_qualified_request_SDRAM_s1              (CPU_instruction_master_qualified_request_SDRAM_s1),
      .CPU_instruction_master_read                                    (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_CPU_jtag_debug_module   (CPU_instruction_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_instruction_master_read_data_valid_SDRAM_s1                (CPU_instruction_master_read_data_valid_SDRAM_s1),
      .CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register (CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register),
      .CPU_instruction_master_readdata                                (CPU_instruction_master_readdata),
      .CPU_instruction_master_readdatavalid                           (CPU_instruction_master_readdatavalid),
      .CPU_instruction_master_requests_CPU_jtag_debug_module          (CPU_instruction_master_requests_CPU_jtag_debug_module),
      .CPU_instruction_master_requests_SDRAM_s1                       (CPU_instruction_master_requests_SDRAM_s1),
      .CPU_instruction_master_waitrequest                             (CPU_instruction_master_waitrequest),
      .CPU_jtag_debug_module_readdata_from_sa                         (CPU_jtag_debug_module_readdata_from_sa),
      .SDRAM_s1_readdata_from_sa                                      (SDRAM_s1_readdata_from_sa),
      .SDRAM_s1_waitrequest_from_sa                                   (SDRAM_s1_waitrequest_from_sa),
      .clk                                                            (sys_clk),
      .d1_CPU_jtag_debug_module_end_xfer                              (d1_CPU_jtag_debug_module_end_xfer),
      .d1_SDRAM_s1_end_xfer                                           (d1_SDRAM_s1_end_xfer),
      .reset_n                                                        (sys_clk_reset_n)
    );

  CPU the_CPU
    (
      .A_ci_multi_clock                      (A_ci_multi_clock_from_the_CPU),
      .A_ci_multi_reset                      (A_ci_multi_reset_from_the_CPU),
      .M_ci_multi_a                          (CPU_custom_instruction_master_multi_a),
      .M_ci_multi_b                          (CPU_custom_instruction_master_multi_b),
      .M_ci_multi_c                          (CPU_custom_instruction_master_multi_c),
      .M_ci_multi_clk_en                     (CPU_custom_instruction_master_multi_clk_en),
      .M_ci_multi_dataa                      (CPU_custom_instruction_master_multi_dataa),
      .M_ci_multi_datab                      (CPU_custom_instruction_master_multi_datab),
      .M_ci_multi_done                       (CPU_custom_instruction_master_multi_done),
      .M_ci_multi_estatus                    (CPU_custom_instruction_master_multi_estatus),
      .M_ci_multi_ipending                   (CPU_custom_instruction_master_multi_ipending),
      .M_ci_multi_n                          (CPU_custom_instruction_master_multi_n),
      .M_ci_multi_readra                     (CPU_custom_instruction_master_multi_readra),
      .M_ci_multi_readrb                     (CPU_custom_instruction_master_multi_readrb),
      .M_ci_multi_result                     (CPU_custom_instruction_master_multi_result),
      .M_ci_multi_start                      (CPU_custom_instruction_master_multi_start),
      .M_ci_multi_status                     (CPU_custom_instruction_master_multi_status),
      .M_ci_multi_writerc                    (CPU_custom_instruction_master_multi_writerc),
      .clk                                   (sys_clk),
      .d_address                             (CPU_data_master_address),
      .d_byteenable                          (CPU_data_master_byteenable),
      .d_irq                                 (CPU_data_master_irq),
      .d_read                                (CPU_data_master_read),
      .d_readdata                            (CPU_data_master_readdata),
      .d_waitrequest                         (CPU_data_master_waitrequest),
      .d_write                               (CPU_data_master_write),
      .d_writedata                           (CPU_data_master_writedata),
      .i_address                             (CPU_instruction_master_address),
      .i_read                                (CPU_instruction_master_read),
      .i_readdata                            (CPU_instruction_master_readdata),
      .i_readdatavalid                       (CPU_instruction_master_readdatavalid),
      .i_waitrequest                         (CPU_instruction_master_waitrequest),
      .jtag_debug_module_address             (CPU_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (CPU_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (CPU_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (CPU_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (CPU_data_master_debugaccess),
      .jtag_debug_module_readdata            (CPU_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (CPU_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (CPU_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (CPU_jtag_debug_module_write),
      .jtag_debug_module_writedata           (CPU_jtag_debug_module_writedata),
      .reset_n                               (CPU_custom_instruction_master_reset_n)
    );

  CPU_fpoint_s1_arbitrator the_CPU_fpoint_s1
    (
      .CPU_custom_instruction_master_multi_clk_en        (CPU_custom_instruction_master_multi_clk_en),
      .CPU_custom_instruction_master_multi_dataa         (CPU_custom_instruction_master_multi_dataa),
      .CPU_custom_instruction_master_multi_datab         (CPU_custom_instruction_master_multi_datab),
      .CPU_custom_instruction_master_multi_n             (CPU_custom_instruction_master_multi_n),
      .CPU_custom_instruction_master_start_CPU_fpoint_s1 (CPU_custom_instruction_master_start_CPU_fpoint_s1),
      .CPU_fpoint_s1_clk_en                              (CPU_fpoint_s1_clk_en),
      .CPU_fpoint_s1_dataa                               (CPU_fpoint_s1_dataa),
      .CPU_fpoint_s1_datab                               (CPU_fpoint_s1_datab),
      .CPU_fpoint_s1_done                                (CPU_fpoint_s1_done),
      .CPU_fpoint_s1_done_from_sa                        (CPU_fpoint_s1_done_from_sa),
      .CPU_fpoint_s1_n                                   (CPU_fpoint_s1_n),
      .CPU_fpoint_s1_reset                               (CPU_fpoint_s1_reset),
      .CPU_fpoint_s1_result                              (CPU_fpoint_s1_result),
      .CPU_fpoint_s1_result_from_sa                      (CPU_fpoint_s1_result_from_sa),
      .CPU_fpoint_s1_select                              (CPU_fpoint_s1_select),
      .CPU_fpoint_s1_start                               (CPU_fpoint_s1_start),
      .clk                                               (sys_clk),
      .reset_n                                           (sys_clk_reset_n)
    );

  CPU_fpoint the_CPU_fpoint
    (
      .clk    (sys_clk),
      .clk_en (CPU_fpoint_s1_clk_en),
      .dataa  (CPU_fpoint_s1_dataa),
      .datab  (CPU_fpoint_s1_datab),
      .done   (CPU_fpoint_s1_done),
      .n      (CPU_fpoint_s1_n),
      .reset  (CPU_fpoint_s1_reset),
      .result (CPU_fpoint_s1_result),
      .start  (CPU_fpoint_s1_start)
    );

  Char_LCD_16x2_avalon_lcd_slave_arbitrator the_Char_LCD_16x2_avalon_lcd_slave
    (
      .CPU_data_master_address_to_slave                                 (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                       (CPU_data_master_byteenable),
      .CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave        (CPU_data_master_byteenable_Char_LCD_16x2_avalon_lcd_slave),
      .CPU_data_master_dbs_address                                      (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_8                                      (CPU_data_master_dbs_write_8),
      .CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave           (CPU_data_master_granted_Char_LCD_16x2_avalon_lcd_slave),
      .CPU_data_master_no_byte_enables_and_last_term                    (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave (CPU_data_master_qualified_request_Char_LCD_16x2_avalon_lcd_slave),
      .CPU_data_master_read                                             (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Char_LCD_16x2_avalon_lcd_slave   (CPU_data_master_read_data_valid_Char_LCD_16x2_avalon_lcd_slave),
      .CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave          (CPU_data_master_requests_Char_LCD_16x2_avalon_lcd_slave),
      .CPU_data_master_waitrequest                                      (CPU_data_master_waitrequest),
      .CPU_data_master_write                                            (CPU_data_master_write),
      .Char_LCD_16x2_avalon_lcd_slave_address                           (Char_LCD_16x2_avalon_lcd_slave_address),
      .Char_LCD_16x2_avalon_lcd_slave_chipselect                        (Char_LCD_16x2_avalon_lcd_slave_chipselect),
      .Char_LCD_16x2_avalon_lcd_slave_read                              (Char_LCD_16x2_avalon_lcd_slave_read),
      .Char_LCD_16x2_avalon_lcd_slave_readdata                          (Char_LCD_16x2_avalon_lcd_slave_readdata),
      .Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa                  (Char_LCD_16x2_avalon_lcd_slave_readdata_from_sa),
      .Char_LCD_16x2_avalon_lcd_slave_reset                             (Char_LCD_16x2_avalon_lcd_slave_reset),
      .Char_LCD_16x2_avalon_lcd_slave_waitrequest                       (Char_LCD_16x2_avalon_lcd_slave_waitrequest),
      .Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa               (Char_LCD_16x2_avalon_lcd_slave_waitrequest_from_sa),
      .Char_LCD_16x2_avalon_lcd_slave_write                             (Char_LCD_16x2_avalon_lcd_slave_write),
      .Char_LCD_16x2_avalon_lcd_slave_writedata                         (Char_LCD_16x2_avalon_lcd_slave_writedata),
      .clk                                                              (sys_clk),
      .d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer                       (d1_Char_LCD_16x2_avalon_lcd_slave_end_xfer),
      .reset_n                                                          (sys_clk_reset_n)
    );

  Char_LCD_16x2 the_Char_LCD_16x2
    (
      .LCD_BLON    (LCD_BLON_from_the_Char_LCD_16x2),
      .LCD_DATA    (LCD_DATA_to_and_from_the_Char_LCD_16x2),
      .LCD_EN      (LCD_EN_from_the_Char_LCD_16x2),
      .LCD_ON      (LCD_ON_from_the_Char_LCD_16x2),
      .LCD_RS      (LCD_RS_from_the_Char_LCD_16x2),
      .LCD_RW      (LCD_RW_from_the_Char_LCD_16x2),
      .address     (Char_LCD_16x2_avalon_lcd_slave_address),
      .chipselect  (Char_LCD_16x2_avalon_lcd_slave_chipselect),
      .clk         (sys_clk),
      .read        (Char_LCD_16x2_avalon_lcd_slave_read),
      .readdata    (Char_LCD_16x2_avalon_lcd_slave_readdata),
      .reset       (Char_LCD_16x2_avalon_lcd_slave_reset),
      .waitrequest (Char_LCD_16x2_avalon_lcd_slave_waitrequest),
      .write       (Char_LCD_16x2_avalon_lcd_slave_write),
      .writedata   (Char_LCD_16x2_avalon_lcd_slave_writedata)
    );

  Expansion_JP1_avalon_parallel_port_slave_arbitrator the_Expansion_JP1_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                    (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                          (CPU_data_master_byteenable),
      .CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave                    (CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_read                                                                (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave                   (CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                         (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                               (CPU_data_master_write),
      .CPU_data_master_writedata                                                           (CPU_data_master_writedata),
      .Expansion_JP1_avalon_parallel_port_slave_address                                    (Expansion_JP1_avalon_parallel_port_slave_address),
      .Expansion_JP1_avalon_parallel_port_slave_byteenable                                 (Expansion_JP1_avalon_parallel_port_slave_byteenable),
      .Expansion_JP1_avalon_parallel_port_slave_chipselect                                 (Expansion_JP1_avalon_parallel_port_slave_chipselect),
      .Expansion_JP1_avalon_parallel_port_slave_irq                                        (Expansion_JP1_avalon_parallel_port_slave_irq),
      .Expansion_JP1_avalon_parallel_port_slave_irq_from_sa                                (Expansion_JP1_avalon_parallel_port_slave_irq_from_sa),
      .Expansion_JP1_avalon_parallel_port_slave_read                                       (Expansion_JP1_avalon_parallel_port_slave_read),
      .Expansion_JP1_avalon_parallel_port_slave_readdata                                   (Expansion_JP1_avalon_parallel_port_slave_readdata),
      .Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa                           (Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa),
      .Expansion_JP1_avalon_parallel_port_slave_reset                                      (Expansion_JP1_avalon_parallel_port_slave_reset),
      .Expansion_JP1_avalon_parallel_port_slave_write                                      (Expansion_JP1_avalon_parallel_port_slave_write),
      .Expansion_JP1_avalon_parallel_port_slave_writedata                                  (Expansion_JP1_avalon_parallel_port_slave_writedata),
      .clk                                                                                 (sys_clk),
      .d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer                                (d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave),
      .reset_n                                                                             (sys_clk_reset_n)
    );

  Expansion_JP1 the_Expansion_JP1
    (
      .GPIO_0     (GPIO_0_to_and_from_the_Expansion_JP1),
      .address    (Expansion_JP1_avalon_parallel_port_slave_address),
      .byteenable (Expansion_JP1_avalon_parallel_port_slave_byteenable),
      .chipselect (Expansion_JP1_avalon_parallel_port_slave_chipselect),
      .clk        (sys_clk),
      .irq        (Expansion_JP1_avalon_parallel_port_slave_irq),
      .read       (Expansion_JP1_avalon_parallel_port_slave_read),
      .readdata   (Expansion_JP1_avalon_parallel_port_slave_readdata),
      .reset      (Expansion_JP1_avalon_parallel_port_slave_reset),
      .write      (Expansion_JP1_avalon_parallel_port_slave_write),
      .writedata  (Expansion_JP1_avalon_parallel_port_slave_writedata)
    );

  Expansion_JP2_avalon_parallel_port_slave_arbitrator the_Expansion_JP2_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                    (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                          (CPU_data_master_byteenable),
      .CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave                    (CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_read                                                                (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave                   (CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                         (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                               (CPU_data_master_write),
      .CPU_data_master_writedata                                                           (CPU_data_master_writedata),
      .Expansion_JP2_avalon_parallel_port_slave_address                                    (Expansion_JP2_avalon_parallel_port_slave_address),
      .Expansion_JP2_avalon_parallel_port_slave_byteenable                                 (Expansion_JP2_avalon_parallel_port_slave_byteenable),
      .Expansion_JP2_avalon_parallel_port_slave_chipselect                                 (Expansion_JP2_avalon_parallel_port_slave_chipselect),
      .Expansion_JP2_avalon_parallel_port_slave_irq                                        (Expansion_JP2_avalon_parallel_port_slave_irq),
      .Expansion_JP2_avalon_parallel_port_slave_irq_from_sa                                (Expansion_JP2_avalon_parallel_port_slave_irq_from_sa),
      .Expansion_JP2_avalon_parallel_port_slave_read                                       (Expansion_JP2_avalon_parallel_port_slave_read),
      .Expansion_JP2_avalon_parallel_port_slave_readdata                                   (Expansion_JP2_avalon_parallel_port_slave_readdata),
      .Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa                           (Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa),
      .Expansion_JP2_avalon_parallel_port_slave_reset                                      (Expansion_JP2_avalon_parallel_port_slave_reset),
      .Expansion_JP2_avalon_parallel_port_slave_write                                      (Expansion_JP2_avalon_parallel_port_slave_write),
      .Expansion_JP2_avalon_parallel_port_slave_writedata                                  (Expansion_JP2_avalon_parallel_port_slave_writedata),
      .clk                                                                                 (sys_clk),
      .d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer                                (d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave),
      .reset_n                                                                             (sys_clk_reset_n)
    );

  Expansion_JP2 the_Expansion_JP2
    (
      .GPIO_1     (GPIO_1_to_and_from_the_Expansion_JP2),
      .address    (Expansion_JP2_avalon_parallel_port_slave_address),
      .byteenable (Expansion_JP2_avalon_parallel_port_slave_byteenable),
      .chipselect (Expansion_JP2_avalon_parallel_port_slave_chipselect),
      .clk        (sys_clk),
      .irq        (Expansion_JP2_avalon_parallel_port_slave_irq),
      .read       (Expansion_JP2_avalon_parallel_port_slave_read),
      .readdata   (Expansion_JP2_avalon_parallel_port_slave_readdata),
      .reset      (Expansion_JP2_avalon_parallel_port_slave_reset),
      .write      (Expansion_JP2_avalon_parallel_port_slave_write),
      .writedata  (Expansion_JP2_avalon_parallel_port_slave_writedata)
    );

  External_Clocks_avalon_clocks_slave_arbitrator the_External_Clocks_avalon_clocks_slave
    (
      .External_Clocks_avalon_clocks_slave_address                                   (External_Clocks_avalon_clocks_slave_address),
      .External_Clocks_avalon_clocks_slave_readdata                                  (External_Clocks_avalon_clocks_slave_readdata),
      .External_Clocks_avalon_clocks_slave_readdata_from_sa                          (External_Clocks_avalon_clocks_slave_readdata_from_sa),
      .clk                                                                           (clk),
      .d1_External_Clocks_avalon_clocks_slave_end_xfer                               (d1_External_Clocks_avalon_clocks_slave_end_xfer),
      .nios_system_clock_0_out_address_to_slave                                      (nios_system_clock_0_out_address_to_slave),
      .nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave           (nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave),
      .nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave (nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave),
      .nios_system_clock_0_out_read                                                  (nios_system_clock_0_out_read),
      .nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave   (nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave),
      .nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave          (nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave),
      .nios_system_clock_0_out_write                                                 (nios_system_clock_0_out_write),
      .reset_n                                                                       (clk_reset_n)
    );

  //audio_clk out_clk assignment, which is an e_assign
  assign audio_clk = out_clk_External_Clocks_AUD_CLK;

  //sdram_clk out_clk assignment, which is an e_assign
  assign sdram_clk = out_clk_External_Clocks_SDRAM_CLK;

  //vga_clk out_clk assignment, which is an e_assign
  assign vga_clk = out_clk_External_Clocks_VGA_CLK;

  //sys_clk out_clk assignment, which is an e_assign
  assign sys_clk = out_clk_External_Clocks_sys_clk;

  External_Clocks the_External_Clocks
    (
      .AUD_CLK   (out_clk_External_Clocks_AUD_CLK),
      .CLOCK_27  (clk_27),
      .CLOCK_50  (clk),
      .SDRAM_CLK (out_clk_External_Clocks_SDRAM_CLK),
      .VGA_CLK   (out_clk_External_Clocks_VGA_CLK),
      .address   (External_Clocks_avalon_clocks_slave_address),
      .readdata  (External_Clocks_avalon_clocks_slave_readdata),
      .sys_clk   (out_clk_External_Clocks_sys_clk)
    );

  Green_LEDs_avalon_parallel_port_slave_arbitrator the_Green_LEDs_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                 (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                       (CPU_data_master_byteenable),
      .CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave                    (CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_read                                                             (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave                   (CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                      (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                            (CPU_data_master_write),
      .CPU_data_master_writedata                                                        (CPU_data_master_writedata),
      .Green_LEDs_avalon_parallel_port_slave_address                                    (Green_LEDs_avalon_parallel_port_slave_address),
      .Green_LEDs_avalon_parallel_port_slave_byteenable                                 (Green_LEDs_avalon_parallel_port_slave_byteenable),
      .Green_LEDs_avalon_parallel_port_slave_chipselect                                 (Green_LEDs_avalon_parallel_port_slave_chipselect),
      .Green_LEDs_avalon_parallel_port_slave_read                                       (Green_LEDs_avalon_parallel_port_slave_read),
      .Green_LEDs_avalon_parallel_port_slave_readdata                                   (Green_LEDs_avalon_parallel_port_slave_readdata),
      .Green_LEDs_avalon_parallel_port_slave_readdata_from_sa                           (Green_LEDs_avalon_parallel_port_slave_readdata_from_sa),
      .Green_LEDs_avalon_parallel_port_slave_reset                                      (Green_LEDs_avalon_parallel_port_slave_reset),
      .Green_LEDs_avalon_parallel_port_slave_write                                      (Green_LEDs_avalon_parallel_port_slave_write),
      .Green_LEDs_avalon_parallel_port_slave_writedata                                  (Green_LEDs_avalon_parallel_port_slave_writedata),
      .clk                                                                              (sys_clk),
      .d1_Green_LEDs_avalon_parallel_port_slave_end_xfer                                (d1_Green_LEDs_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave),
      .reset_n                                                                          (sys_clk_reset_n)
    );

  Green_LEDs the_Green_LEDs
    (
      .LEDG       (LEDG_from_the_Green_LEDs),
      .address    (Green_LEDs_avalon_parallel_port_slave_address),
      .byteenable (Green_LEDs_avalon_parallel_port_slave_byteenable),
      .chipselect (Green_LEDs_avalon_parallel_port_slave_chipselect),
      .clk        (sys_clk),
      .read       (Green_LEDs_avalon_parallel_port_slave_read),
      .readdata   (Green_LEDs_avalon_parallel_port_slave_readdata),
      .reset      (Green_LEDs_avalon_parallel_port_slave_reset),
      .write      (Green_LEDs_avalon_parallel_port_slave_write),
      .writedata  (Green_LEDs_avalon_parallel_port_slave_writedata)
    );

  HEX3_HEX0_avalon_parallel_port_slave_arbitrator the_HEX3_HEX0_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                      (CPU_data_master_byteenable),
      .CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave                    (CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave          (CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_read                                                            (CPU_data_master_read),
      .CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave                   (CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                     (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                           (CPU_data_master_write),
      .CPU_data_master_writedata                                                       (CPU_data_master_writedata),
      .HEX3_HEX0_avalon_parallel_port_slave_address                                    (HEX3_HEX0_avalon_parallel_port_slave_address),
      .HEX3_HEX0_avalon_parallel_port_slave_byteenable                                 (HEX3_HEX0_avalon_parallel_port_slave_byteenable),
      .HEX3_HEX0_avalon_parallel_port_slave_chipselect                                 (HEX3_HEX0_avalon_parallel_port_slave_chipselect),
      .HEX3_HEX0_avalon_parallel_port_slave_read                                       (HEX3_HEX0_avalon_parallel_port_slave_read),
      .HEX3_HEX0_avalon_parallel_port_slave_readdata                                   (HEX3_HEX0_avalon_parallel_port_slave_readdata),
      .HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa                           (HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa),
      .HEX3_HEX0_avalon_parallel_port_slave_reset                                      (HEX3_HEX0_avalon_parallel_port_slave_reset),
      .HEX3_HEX0_avalon_parallel_port_slave_write                                      (HEX3_HEX0_avalon_parallel_port_slave_write),
      .HEX3_HEX0_avalon_parallel_port_slave_writedata                                  (HEX3_HEX0_avalon_parallel_port_slave_writedata),
      .clk                                                                             (sys_clk),
      .d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer                                (d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave),
      .reset_n                                                                         (sys_clk_reset_n)
    );

  HEX3_HEX0 the_HEX3_HEX0
    (
      .HEX0       (HEX0_from_the_HEX3_HEX0),
      .HEX1       (HEX1_from_the_HEX3_HEX0),
      .HEX2       (HEX2_from_the_HEX3_HEX0),
      .HEX3       (HEX3_from_the_HEX3_HEX0),
      .address    (HEX3_HEX0_avalon_parallel_port_slave_address),
      .byteenable (HEX3_HEX0_avalon_parallel_port_slave_byteenable),
      .chipselect (HEX3_HEX0_avalon_parallel_port_slave_chipselect),
      .clk        (sys_clk),
      .read       (HEX3_HEX0_avalon_parallel_port_slave_read),
      .readdata   (HEX3_HEX0_avalon_parallel_port_slave_readdata),
      .reset      (HEX3_HEX0_avalon_parallel_port_slave_reset),
      .write      (HEX3_HEX0_avalon_parallel_port_slave_write),
      .writedata  (HEX3_HEX0_avalon_parallel_port_slave_writedata)
    );

  HEX7_HEX4_avalon_parallel_port_slave_arbitrator the_HEX7_HEX4_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                      (CPU_data_master_byteenable),
      .CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave                    (CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave          (CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_read                                                            (CPU_data_master_read),
      .CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave                   (CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                     (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                           (CPU_data_master_write),
      .CPU_data_master_writedata                                                       (CPU_data_master_writedata),
      .HEX7_HEX4_avalon_parallel_port_slave_address                                    (HEX7_HEX4_avalon_parallel_port_slave_address),
      .HEX7_HEX4_avalon_parallel_port_slave_byteenable                                 (HEX7_HEX4_avalon_parallel_port_slave_byteenable),
      .HEX7_HEX4_avalon_parallel_port_slave_chipselect                                 (HEX7_HEX4_avalon_parallel_port_slave_chipselect),
      .HEX7_HEX4_avalon_parallel_port_slave_read                                       (HEX7_HEX4_avalon_parallel_port_slave_read),
      .HEX7_HEX4_avalon_parallel_port_slave_readdata                                   (HEX7_HEX4_avalon_parallel_port_slave_readdata),
      .HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa                           (HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa),
      .HEX7_HEX4_avalon_parallel_port_slave_reset                                      (HEX7_HEX4_avalon_parallel_port_slave_reset),
      .HEX7_HEX4_avalon_parallel_port_slave_write                                      (HEX7_HEX4_avalon_parallel_port_slave_write),
      .HEX7_HEX4_avalon_parallel_port_slave_writedata                                  (HEX7_HEX4_avalon_parallel_port_slave_writedata),
      .clk                                                                             (sys_clk),
      .d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer                                (d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave),
      .reset_n                                                                         (sys_clk_reset_n)
    );

  HEX7_HEX4 the_HEX7_HEX4
    (
      .HEX4       (HEX4_from_the_HEX7_HEX4),
      .HEX5       (HEX5_from_the_HEX7_HEX4),
      .HEX6       (HEX6_from_the_HEX7_HEX4),
      .HEX7       (HEX7_from_the_HEX7_HEX4),
      .address    (HEX7_HEX4_avalon_parallel_port_slave_address),
      .byteenable (HEX7_HEX4_avalon_parallel_port_slave_byteenable),
      .chipselect (HEX7_HEX4_avalon_parallel_port_slave_chipselect),
      .clk        (sys_clk),
      .read       (HEX7_HEX4_avalon_parallel_port_slave_read),
      .readdata   (HEX7_HEX4_avalon_parallel_port_slave_readdata),
      .reset      (HEX7_HEX4_avalon_parallel_port_slave_reset),
      .write      (HEX7_HEX4_avalon_parallel_port_slave_write),
      .writedata  (HEX7_HEX4_avalon_parallel_port_slave_writedata)
    );

  Interval_Timer_s1_arbitrator the_Interval_Timer_s1
    (
      .CPU_data_master_address_to_slave                    (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_Interval_Timer_s1           (CPU_data_master_granted_Interval_Timer_s1),
      .CPU_data_master_qualified_request_Interval_Timer_s1 (CPU_data_master_qualified_request_Interval_Timer_s1),
      .CPU_data_master_read                                (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Interval_Timer_s1   (CPU_data_master_read_data_valid_Interval_Timer_s1),
      .CPU_data_master_requests_Interval_Timer_s1          (CPU_data_master_requests_Interval_Timer_s1),
      .CPU_data_master_waitrequest                         (CPU_data_master_waitrequest),
      .CPU_data_master_write                               (CPU_data_master_write),
      .CPU_data_master_writedata                           (CPU_data_master_writedata),
      .Interval_Timer_s1_address                           (Interval_Timer_s1_address),
      .Interval_Timer_s1_chipselect                        (Interval_Timer_s1_chipselect),
      .Interval_Timer_s1_irq                               (Interval_Timer_s1_irq),
      .Interval_Timer_s1_irq_from_sa                       (Interval_Timer_s1_irq_from_sa),
      .Interval_Timer_s1_readdata                          (Interval_Timer_s1_readdata),
      .Interval_Timer_s1_readdata_from_sa                  (Interval_Timer_s1_readdata_from_sa),
      .Interval_Timer_s1_reset_n                           (Interval_Timer_s1_reset_n),
      .Interval_Timer_s1_write_n                           (Interval_Timer_s1_write_n),
      .Interval_Timer_s1_writedata                         (Interval_Timer_s1_writedata),
      .clk                                                 (sys_clk),
      .d1_Interval_Timer_s1_end_xfer                       (d1_Interval_Timer_s1_end_xfer),
      .reset_n                                             (sys_clk_reset_n)
    );

  Interval_Timer the_Interval_Timer
    (
      .address    (Interval_Timer_s1_address),
      .chipselect (Interval_Timer_s1_chipselect),
      .clk        (sys_clk),
      .irq        (Interval_Timer_s1_irq),
      .readdata   (Interval_Timer_s1_readdata),
      .reset_n    (Interval_Timer_s1_reset_n),
      .write_n    (Interval_Timer_s1_write_n),
      .writedata  (Interval_Timer_s1_writedata)
    );

  JTAG_UART_avalon_jtag_slave_arbitrator the_JTAG_UART_avalon_jtag_slave
    (
      .CPU_data_master_address_to_slave                              (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_JTAG_UART_avalon_jtag_slave           (CPU_data_master_granted_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave (CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_read                                          (CPU_data_master_read),
      .CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave   (CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_requests_JTAG_UART_avalon_jtag_slave          (CPU_data_master_requests_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_waitrequest                                   (CPU_data_master_waitrequest),
      .CPU_data_master_write                                         (CPU_data_master_write),
      .CPU_data_master_writedata                                     (CPU_data_master_writedata),
      .JTAG_UART_avalon_jtag_slave_address                           (JTAG_UART_avalon_jtag_slave_address),
      .JTAG_UART_avalon_jtag_slave_chipselect                        (JTAG_UART_avalon_jtag_slave_chipselect),
      .JTAG_UART_avalon_jtag_slave_dataavailable                     (JTAG_UART_avalon_jtag_slave_dataavailable),
      .JTAG_UART_avalon_jtag_slave_dataavailable_from_sa             (JTAG_UART_avalon_jtag_slave_dataavailable_from_sa),
      .JTAG_UART_avalon_jtag_slave_irq                               (JTAG_UART_avalon_jtag_slave_irq),
      .JTAG_UART_avalon_jtag_slave_irq_from_sa                       (JTAG_UART_avalon_jtag_slave_irq_from_sa),
      .JTAG_UART_avalon_jtag_slave_read_n                            (JTAG_UART_avalon_jtag_slave_read_n),
      .JTAG_UART_avalon_jtag_slave_readdata                          (JTAG_UART_avalon_jtag_slave_readdata),
      .JTAG_UART_avalon_jtag_slave_readdata_from_sa                  (JTAG_UART_avalon_jtag_slave_readdata_from_sa),
      .JTAG_UART_avalon_jtag_slave_readyfordata                      (JTAG_UART_avalon_jtag_slave_readyfordata),
      .JTAG_UART_avalon_jtag_slave_readyfordata_from_sa              (JTAG_UART_avalon_jtag_slave_readyfordata_from_sa),
      .JTAG_UART_avalon_jtag_slave_reset_n                           (JTAG_UART_avalon_jtag_slave_reset_n),
      .JTAG_UART_avalon_jtag_slave_waitrequest                       (JTAG_UART_avalon_jtag_slave_waitrequest),
      .JTAG_UART_avalon_jtag_slave_waitrequest_from_sa               (JTAG_UART_avalon_jtag_slave_waitrequest_from_sa),
      .JTAG_UART_avalon_jtag_slave_write_n                           (JTAG_UART_avalon_jtag_slave_write_n),
      .JTAG_UART_avalon_jtag_slave_writedata                         (JTAG_UART_avalon_jtag_slave_writedata),
      .clk                                                           (sys_clk),
      .d1_JTAG_UART_avalon_jtag_slave_end_xfer                       (d1_JTAG_UART_avalon_jtag_slave_end_xfer),
      .reset_n                                                       (sys_clk_reset_n)
    );

  JTAG_UART the_JTAG_UART
    (
      .av_address     (JTAG_UART_avalon_jtag_slave_address),
      .av_chipselect  (JTAG_UART_avalon_jtag_slave_chipselect),
      .av_irq         (JTAG_UART_avalon_jtag_slave_irq),
      .av_read_n      (JTAG_UART_avalon_jtag_slave_read_n),
      .av_readdata    (JTAG_UART_avalon_jtag_slave_readdata),
      .av_waitrequest (JTAG_UART_avalon_jtag_slave_waitrequest),
      .av_write_n     (JTAG_UART_avalon_jtag_slave_write_n),
      .av_writedata   (JTAG_UART_avalon_jtag_slave_writedata),
      .clk            (sys_clk),
      .dataavailable  (JTAG_UART_avalon_jtag_slave_dataavailable),
      .readyfordata   (JTAG_UART_avalon_jtag_slave_readyfordata),
      .rst_n          (JTAG_UART_avalon_jtag_slave_reset_n)
    );

  PS2_Port_avalon_ps2_slave_arbitrator the_PS2_Port_avalon_ps2_slave
    (
      .CPU_data_master_address_to_slave                                     (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                           (CPU_data_master_byteenable),
      .CPU_data_master_granted_PS2_Port_avalon_ps2_slave                    (CPU_data_master_granted_PS2_Port_avalon_ps2_slave),
      .CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave          (CPU_data_master_qualified_request_PS2_Port_avalon_ps2_slave),
      .CPU_data_master_read                                                 (CPU_data_master_read),
      .CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave            (CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave),
      .CPU_data_master_requests_PS2_Port_avalon_ps2_slave                   (CPU_data_master_requests_PS2_Port_avalon_ps2_slave),
      .CPU_data_master_waitrequest                                          (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                (CPU_data_master_write),
      .CPU_data_master_writedata                                            (CPU_data_master_writedata),
      .PS2_Port_avalon_ps2_slave_address                                    (PS2_Port_avalon_ps2_slave_address),
      .PS2_Port_avalon_ps2_slave_byteenable                                 (PS2_Port_avalon_ps2_slave_byteenable),
      .PS2_Port_avalon_ps2_slave_chipselect                                 (PS2_Port_avalon_ps2_slave_chipselect),
      .PS2_Port_avalon_ps2_slave_irq                                        (PS2_Port_avalon_ps2_slave_irq),
      .PS2_Port_avalon_ps2_slave_irq_from_sa                                (PS2_Port_avalon_ps2_slave_irq_from_sa),
      .PS2_Port_avalon_ps2_slave_read                                       (PS2_Port_avalon_ps2_slave_read),
      .PS2_Port_avalon_ps2_slave_readdata                                   (PS2_Port_avalon_ps2_slave_readdata),
      .PS2_Port_avalon_ps2_slave_readdata_from_sa                           (PS2_Port_avalon_ps2_slave_readdata_from_sa),
      .PS2_Port_avalon_ps2_slave_reset                                      (PS2_Port_avalon_ps2_slave_reset),
      .PS2_Port_avalon_ps2_slave_waitrequest                                (PS2_Port_avalon_ps2_slave_waitrequest),
      .PS2_Port_avalon_ps2_slave_waitrequest_from_sa                        (PS2_Port_avalon_ps2_slave_waitrequest_from_sa),
      .PS2_Port_avalon_ps2_slave_write                                      (PS2_Port_avalon_ps2_slave_write),
      .PS2_Port_avalon_ps2_slave_writedata                                  (PS2_Port_avalon_ps2_slave_writedata),
      .clk                                                                  (sys_clk),
      .d1_PS2_Port_avalon_ps2_slave_end_xfer                                (d1_PS2_Port_avalon_ps2_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave (registered_CPU_data_master_read_data_valid_PS2_Port_avalon_ps2_slave),
      .reset_n                                                              (sys_clk_reset_n)
    );

  PS2_Port the_PS2_Port
    (
      .PS2_CLK     (PS2_CLK_to_and_from_the_PS2_Port),
      .PS2_DAT     (PS2_DAT_to_and_from_the_PS2_Port),
      .address     (PS2_Port_avalon_ps2_slave_address),
      .byteenable  (PS2_Port_avalon_ps2_slave_byteenable),
      .chipselect  (PS2_Port_avalon_ps2_slave_chipselect),
      .clk         (sys_clk),
      .irq         (PS2_Port_avalon_ps2_slave_irq),
      .read        (PS2_Port_avalon_ps2_slave_read),
      .readdata    (PS2_Port_avalon_ps2_slave_readdata),
      .reset       (PS2_Port_avalon_ps2_slave_reset),
      .waitrequest (PS2_Port_avalon_ps2_slave_waitrequest),
      .write       (PS2_Port_avalon_ps2_slave_write),
      .writedata   (PS2_Port_avalon_ps2_slave_writedata)
    );

  Pushbuttons_avalon_parallel_port_slave_arbitrator the_Pushbuttons_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                  (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                        (CPU_data_master_byteenable),
      .CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave                    (CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_read                                                              (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave                   (CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                       (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                             (CPU_data_master_write),
      .CPU_data_master_writedata                                                         (CPU_data_master_writedata),
      .Pushbuttons_avalon_parallel_port_slave_address                                    (Pushbuttons_avalon_parallel_port_slave_address),
      .Pushbuttons_avalon_parallel_port_slave_byteenable                                 (Pushbuttons_avalon_parallel_port_slave_byteenable),
      .Pushbuttons_avalon_parallel_port_slave_chipselect                                 (Pushbuttons_avalon_parallel_port_slave_chipselect),
      .Pushbuttons_avalon_parallel_port_slave_irq                                        (Pushbuttons_avalon_parallel_port_slave_irq),
      .Pushbuttons_avalon_parallel_port_slave_irq_from_sa                                (Pushbuttons_avalon_parallel_port_slave_irq_from_sa),
      .Pushbuttons_avalon_parallel_port_slave_read                                       (Pushbuttons_avalon_parallel_port_slave_read),
      .Pushbuttons_avalon_parallel_port_slave_readdata                                   (Pushbuttons_avalon_parallel_port_slave_readdata),
      .Pushbuttons_avalon_parallel_port_slave_readdata_from_sa                           (Pushbuttons_avalon_parallel_port_slave_readdata_from_sa),
      .Pushbuttons_avalon_parallel_port_slave_reset                                      (Pushbuttons_avalon_parallel_port_slave_reset),
      .Pushbuttons_avalon_parallel_port_slave_write                                      (Pushbuttons_avalon_parallel_port_slave_write),
      .Pushbuttons_avalon_parallel_port_slave_writedata                                  (Pushbuttons_avalon_parallel_port_slave_writedata),
      .clk                                                                               (sys_clk),
      .d1_Pushbuttons_avalon_parallel_port_slave_end_xfer                                (d1_Pushbuttons_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave),
      .reset_n                                                                           (sys_clk_reset_n)
    );

  Pushbuttons the_Pushbuttons
    (
      .KEY        (KEY_to_the_Pushbuttons),
      .address    (Pushbuttons_avalon_parallel_port_slave_address),
      .byteenable (Pushbuttons_avalon_parallel_port_slave_byteenable),
      .chipselect (Pushbuttons_avalon_parallel_port_slave_chipselect),
      .clk        (sys_clk),
      .irq        (Pushbuttons_avalon_parallel_port_slave_irq),
      .read       (Pushbuttons_avalon_parallel_port_slave_read),
      .readdata   (Pushbuttons_avalon_parallel_port_slave_readdata),
      .reset      (Pushbuttons_avalon_parallel_port_slave_reset),
      .write      (Pushbuttons_avalon_parallel_port_slave_write),
      .writedata  (Pushbuttons_avalon_parallel_port_slave_writedata)
    );

  Red_LEDs_avalon_parallel_port_slave_arbitrator the_Red_LEDs_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                               (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                     (CPU_data_master_byteenable),
      .CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave                    (CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_read                                                           (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave                   (CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                    (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                          (CPU_data_master_write),
      .CPU_data_master_writedata                                                      (CPU_data_master_writedata),
      .Red_LEDs_avalon_parallel_port_slave_address                                    (Red_LEDs_avalon_parallel_port_slave_address),
      .Red_LEDs_avalon_parallel_port_slave_byteenable                                 (Red_LEDs_avalon_parallel_port_slave_byteenable),
      .Red_LEDs_avalon_parallel_port_slave_chipselect                                 (Red_LEDs_avalon_parallel_port_slave_chipselect),
      .Red_LEDs_avalon_parallel_port_slave_read                                       (Red_LEDs_avalon_parallel_port_slave_read),
      .Red_LEDs_avalon_parallel_port_slave_readdata                                   (Red_LEDs_avalon_parallel_port_slave_readdata),
      .Red_LEDs_avalon_parallel_port_slave_readdata_from_sa                           (Red_LEDs_avalon_parallel_port_slave_readdata_from_sa),
      .Red_LEDs_avalon_parallel_port_slave_reset                                      (Red_LEDs_avalon_parallel_port_slave_reset),
      .Red_LEDs_avalon_parallel_port_slave_write                                      (Red_LEDs_avalon_parallel_port_slave_write),
      .Red_LEDs_avalon_parallel_port_slave_writedata                                  (Red_LEDs_avalon_parallel_port_slave_writedata),
      .clk                                                                            (sys_clk),
      .d1_Red_LEDs_avalon_parallel_port_slave_end_xfer                                (d1_Red_LEDs_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave),
      .reset_n                                                                        (sys_clk_reset_n)
    );

  Red_LEDs the_Red_LEDs
    (
      .LEDR       (LEDR_from_the_Red_LEDs),
      .address    (Red_LEDs_avalon_parallel_port_slave_address),
      .byteenable (Red_LEDs_avalon_parallel_port_slave_byteenable),
      .chipselect (Red_LEDs_avalon_parallel_port_slave_chipselect),
      .clk        (sys_clk),
      .read       (Red_LEDs_avalon_parallel_port_slave_read),
      .readdata   (Red_LEDs_avalon_parallel_port_slave_readdata),
      .reset      (Red_LEDs_avalon_parallel_port_slave_reset),
      .write      (Red_LEDs_avalon_parallel_port_slave_write),
      .writedata  (Red_LEDs_avalon_parallel_port_slave_writedata)
    );

  SDRAM_s1_arbitrator the_SDRAM_s1
    (
      .CPU_data_master_address_to_slave                               (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                     (CPU_data_master_byteenable),
      .CPU_data_master_byteenable_SDRAM_s1                            (CPU_data_master_byteenable_SDRAM_s1),
      .CPU_data_master_dbs_address                                    (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_16                                   (CPU_data_master_dbs_write_16),
      .CPU_data_master_granted_SDRAM_s1                               (CPU_data_master_granted_SDRAM_s1),
      .CPU_data_master_no_byte_enables_and_last_term                  (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_SDRAM_s1                     (CPU_data_master_qualified_request_SDRAM_s1),
      .CPU_data_master_read                                           (CPU_data_master_read),
      .CPU_data_master_read_data_valid_SDRAM_s1                       (CPU_data_master_read_data_valid_SDRAM_s1),
      .CPU_data_master_read_data_valid_SDRAM_s1_shift_register        (CPU_data_master_read_data_valid_SDRAM_s1_shift_register),
      .CPU_data_master_requests_SDRAM_s1                              (CPU_data_master_requests_SDRAM_s1),
      .CPU_data_master_waitrequest                                    (CPU_data_master_waitrequest),
      .CPU_data_master_write                                          (CPU_data_master_write),
      .CPU_instruction_master_address_to_slave                        (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_dbs_address                             (CPU_instruction_master_dbs_address),
      .CPU_instruction_master_granted_SDRAM_s1                        (CPU_instruction_master_granted_SDRAM_s1),
      .CPU_instruction_master_latency_counter                         (CPU_instruction_master_latency_counter),
      .CPU_instruction_master_qualified_request_SDRAM_s1              (CPU_instruction_master_qualified_request_SDRAM_s1),
      .CPU_instruction_master_read                                    (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_SDRAM_s1                (CPU_instruction_master_read_data_valid_SDRAM_s1),
      .CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register (CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register),
      .CPU_instruction_master_requests_SDRAM_s1                       (CPU_instruction_master_requests_SDRAM_s1),
      .SDRAM_s1_address                                               (SDRAM_s1_address),
      .SDRAM_s1_byteenable_n                                          (SDRAM_s1_byteenable_n),
      .SDRAM_s1_chipselect                                            (SDRAM_s1_chipselect),
      .SDRAM_s1_read_n                                                (SDRAM_s1_read_n),
      .SDRAM_s1_readdata                                              (SDRAM_s1_readdata),
      .SDRAM_s1_readdata_from_sa                                      (SDRAM_s1_readdata_from_sa),
      .SDRAM_s1_readdatavalid                                         (SDRAM_s1_readdatavalid),
      .SDRAM_s1_reset_n                                               (SDRAM_s1_reset_n),
      .SDRAM_s1_waitrequest                                           (SDRAM_s1_waitrequest),
      .SDRAM_s1_waitrequest_from_sa                                   (SDRAM_s1_waitrequest_from_sa),
      .SDRAM_s1_write_n                                               (SDRAM_s1_write_n),
      .SDRAM_s1_writedata                                             (SDRAM_s1_writedata),
      .clk                                                            (sys_clk),
      .d1_SDRAM_s1_end_xfer                                           (d1_SDRAM_s1_end_xfer),
      .reset_n                                                        (sys_clk_reset_n)
    );

  SDRAM the_SDRAM
    (
      .az_addr        (SDRAM_s1_address),
      .az_be_n        (SDRAM_s1_byteenable_n),
      .az_cs          (SDRAM_s1_chipselect),
      .az_data        (SDRAM_s1_writedata),
      .az_rd_n        (SDRAM_s1_read_n),
      .az_wr_n        (SDRAM_s1_write_n),
      .clk            (sys_clk),
      .reset_n        (SDRAM_s1_reset_n),
      .za_data        (SDRAM_s1_readdata),
      .za_valid       (SDRAM_s1_readdatavalid),
      .za_waitrequest (SDRAM_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_SDRAM),
      .zs_ba          (zs_ba_from_the_SDRAM),
      .zs_cas_n       (zs_cas_n_from_the_SDRAM),
      .zs_cke         (zs_cke_from_the_SDRAM),
      .zs_cs_n        (zs_cs_n_from_the_SDRAM),
      .zs_dq          (zs_dq_to_and_from_the_SDRAM),
      .zs_dqm         (zs_dqm_from_the_SDRAM),
      .zs_ras_n       (zs_ras_n_from_the_SDRAM),
      .zs_we_n        (zs_we_n_from_the_SDRAM)
    );

  SRAM_avalon_sram_slave_arbitrator the_SRAM_avalon_sram_slave
    (
      .CPU_data_master_address_to_slave                                                               (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                                     (CPU_data_master_byteenable),
      .CPU_data_master_byteenable_SRAM_avalon_sram_slave                                              (CPU_data_master_byteenable_SRAM_avalon_sram_slave),
      .CPU_data_master_dbs_address                                                                    (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_16                                                                   (CPU_data_master_dbs_write_16),
      .CPU_data_master_granted_SRAM_avalon_sram_slave                                                 (CPU_data_master_granted_SRAM_avalon_sram_slave),
      .CPU_data_master_no_byte_enables_and_last_term                                                  (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_SRAM_avalon_sram_slave                                       (CPU_data_master_qualified_request_SRAM_avalon_sram_slave),
      .CPU_data_master_read                                                                           (CPU_data_master_read),
      .CPU_data_master_read_data_valid_SRAM_avalon_sram_slave                                         (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave),
      .CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register                          (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register),
      .CPU_data_master_requests_SRAM_avalon_sram_slave                                                (CPU_data_master_requests_SRAM_avalon_sram_slave),
      .CPU_data_master_waitrequest                                                                    (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                                          (CPU_data_master_write),
      .SRAM_avalon_sram_slave_address                                                                 (SRAM_avalon_sram_slave_address),
      .SRAM_avalon_sram_slave_byteenable                                                              (SRAM_avalon_sram_slave_byteenable),
      .SRAM_avalon_sram_slave_read                                                                    (SRAM_avalon_sram_slave_read),
      .SRAM_avalon_sram_slave_readdata                                                                (SRAM_avalon_sram_slave_readdata),
      .SRAM_avalon_sram_slave_readdata_from_sa                                                        (SRAM_avalon_sram_slave_readdata_from_sa),
      .SRAM_avalon_sram_slave_readdatavalid                                                           (SRAM_avalon_sram_slave_readdatavalid),
      .SRAM_avalon_sram_slave_reset                                                                   (SRAM_avalon_sram_slave_reset),
      .SRAM_avalon_sram_slave_write                                                                   (SRAM_avalon_sram_slave_write),
      .SRAM_avalon_sram_slave_writedata                                                               (SRAM_avalon_sram_slave_writedata),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave                                      (VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_arbiterlock                                           (VGA_Pixel_Buffer_avalon_pixel_dma_master_arbiterlock),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave                        (VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter                                       (VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave              (VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_read                                                  (VGA_Pixel_Buffer_avalon_pixel_dma_master_read),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave                (VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave_shift_register (VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave_shift_register),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave                       (VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave),
      .clk                                                                                            (sys_clk),
      .d1_SRAM_avalon_sram_slave_end_xfer                                                             (d1_SRAM_avalon_sram_slave_end_xfer),
      .reset_n                                                                                        (sys_clk_reset_n)
    );

  SRAM the_SRAM
    (
      .SRAM_ADDR     (SRAM_ADDR_from_the_SRAM),
      .SRAM_CE_N     (SRAM_CE_N_from_the_SRAM),
      .SRAM_DQ       (SRAM_DQ_to_and_from_the_SRAM),
      .SRAM_LB_N     (SRAM_LB_N_from_the_SRAM),
      .SRAM_OE_N     (SRAM_OE_N_from_the_SRAM),
      .SRAM_UB_N     (SRAM_UB_N_from_the_SRAM),
      .SRAM_WE_N     (SRAM_WE_N_from_the_SRAM),
      .address       (SRAM_avalon_sram_slave_address),
      .byteenable    (SRAM_avalon_sram_slave_byteenable),
      .clk           (sys_clk),
      .read          (SRAM_avalon_sram_slave_read),
      .readdata      (SRAM_avalon_sram_slave_readdata),
      .readdatavalid (SRAM_avalon_sram_slave_readdatavalid),
      .reset         (SRAM_avalon_sram_slave_reset),
      .write         (SRAM_avalon_sram_slave_write),
      .writedata     (SRAM_avalon_sram_slave_writedata)
    );

  Serial_Port_avalon_rs232_slave_arbitrator the_Serial_Port_avalon_rs232_slave
    (
      .CPU_data_master_address_to_slave                                          (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                (CPU_data_master_byteenable),
      .CPU_data_master_granted_Serial_Port_avalon_rs232_slave                    (CPU_data_master_granted_Serial_Port_avalon_rs232_slave),
      .CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave          (CPU_data_master_qualified_request_Serial_Port_avalon_rs232_slave),
      .CPU_data_master_read                                                      (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave            (CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave),
      .CPU_data_master_requests_Serial_Port_avalon_rs232_slave                   (CPU_data_master_requests_Serial_Port_avalon_rs232_slave),
      .CPU_data_master_waitrequest                                               (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                     (CPU_data_master_write),
      .CPU_data_master_writedata                                                 (CPU_data_master_writedata),
      .Serial_Port_avalon_rs232_slave_address                                    (Serial_Port_avalon_rs232_slave_address),
      .Serial_Port_avalon_rs232_slave_byteenable                                 (Serial_Port_avalon_rs232_slave_byteenable),
      .Serial_Port_avalon_rs232_slave_chipselect                                 (Serial_Port_avalon_rs232_slave_chipselect),
      .Serial_Port_avalon_rs232_slave_irq                                        (Serial_Port_avalon_rs232_slave_irq),
      .Serial_Port_avalon_rs232_slave_irq_from_sa                                (Serial_Port_avalon_rs232_slave_irq_from_sa),
      .Serial_Port_avalon_rs232_slave_read                                       (Serial_Port_avalon_rs232_slave_read),
      .Serial_Port_avalon_rs232_slave_readdata                                   (Serial_Port_avalon_rs232_slave_readdata),
      .Serial_Port_avalon_rs232_slave_readdata_from_sa                           (Serial_Port_avalon_rs232_slave_readdata_from_sa),
      .Serial_Port_avalon_rs232_slave_reset                                      (Serial_Port_avalon_rs232_slave_reset),
      .Serial_Port_avalon_rs232_slave_write                                      (Serial_Port_avalon_rs232_slave_write),
      .Serial_Port_avalon_rs232_slave_writedata                                  (Serial_Port_avalon_rs232_slave_writedata),
      .clk                                                                       (sys_clk),
      .d1_Serial_Port_avalon_rs232_slave_end_xfer                                (d1_Serial_Port_avalon_rs232_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave (registered_CPU_data_master_read_data_valid_Serial_Port_avalon_rs232_slave),
      .reset_n                                                                   (sys_clk_reset_n)
    );

  Serial_Port the_Serial_Port
    (
      .UART_RXD   (UART_RXD_to_the_Serial_Port),
      .UART_TXD   (UART_TXD_from_the_Serial_Port),
      .address    (Serial_Port_avalon_rs232_slave_address),
      .byteenable (Serial_Port_avalon_rs232_slave_byteenable),
      .chipselect (Serial_Port_avalon_rs232_slave_chipselect),
      .clk        (sys_clk),
      .irq        (Serial_Port_avalon_rs232_slave_irq),
      .read       (Serial_Port_avalon_rs232_slave_read),
      .readdata   (Serial_Port_avalon_rs232_slave_readdata),
      .reset      (Serial_Port_avalon_rs232_slave_reset),
      .write      (Serial_Port_avalon_rs232_slave_write),
      .writedata  (Serial_Port_avalon_rs232_slave_writedata)
    );

  Slider_Switches_avalon_parallel_port_slave_arbitrator the_Slider_Switches_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                      (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                            (CPU_data_master_byteenable),
      .CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave                    (CPU_data_master_granted_Slider_Switches_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Slider_Switches_avalon_parallel_port_slave),
      .CPU_data_master_read                                                                  (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave),
      .CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave                   (CPU_data_master_requests_Slider_Switches_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                           (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                                 (CPU_data_master_write),
      .CPU_data_master_writedata                                                             (CPU_data_master_writedata),
      .Slider_Switches_avalon_parallel_port_slave_address                                    (Slider_Switches_avalon_parallel_port_slave_address),
      .Slider_Switches_avalon_parallel_port_slave_byteenable                                 (Slider_Switches_avalon_parallel_port_slave_byteenable),
      .Slider_Switches_avalon_parallel_port_slave_chipselect                                 (Slider_Switches_avalon_parallel_port_slave_chipselect),
      .Slider_Switches_avalon_parallel_port_slave_read                                       (Slider_Switches_avalon_parallel_port_slave_read),
      .Slider_Switches_avalon_parallel_port_slave_readdata                                   (Slider_Switches_avalon_parallel_port_slave_readdata),
      .Slider_Switches_avalon_parallel_port_slave_readdata_from_sa                           (Slider_Switches_avalon_parallel_port_slave_readdata_from_sa),
      .Slider_Switches_avalon_parallel_port_slave_reset                                      (Slider_Switches_avalon_parallel_port_slave_reset),
      .Slider_Switches_avalon_parallel_port_slave_write                                      (Slider_Switches_avalon_parallel_port_slave_write),
      .Slider_Switches_avalon_parallel_port_slave_writedata                                  (Slider_Switches_avalon_parallel_port_slave_writedata),
      .clk                                                                                   (sys_clk),
      .d1_Slider_Switches_avalon_parallel_port_slave_end_xfer                                (d1_Slider_Switches_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Slider_Switches_avalon_parallel_port_slave),
      .reset_n                                                                               (sys_clk_reset_n)
    );

  Slider_Switches the_Slider_Switches
    (
      .SW         (SW_to_the_Slider_Switches),
      .address    (Slider_Switches_avalon_parallel_port_slave_address),
      .byteenable (Slider_Switches_avalon_parallel_port_slave_byteenable),
      .chipselect (Slider_Switches_avalon_parallel_port_slave_chipselect),
      .clk        (sys_clk),
      .read       (Slider_Switches_avalon_parallel_port_slave_read),
      .readdata   (Slider_Switches_avalon_parallel_port_slave_readdata),
      .reset      (Slider_Switches_avalon_parallel_port_slave_reset),
      .write      (Slider_Switches_avalon_parallel_port_slave_write),
      .writedata  (Slider_Switches_avalon_parallel_port_slave_writedata)
    );

  VGA_Char_Buffer_avalon_char_buffer_slave_arbitrator the_VGA_Char_Buffer_avalon_char_buffer_slave
    (
      .CPU_data_master_address_to_slave                                                    (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                          (CPU_data_master_byteenable),
      .CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave                 (CPU_data_master_byteenable_VGA_Char_Buffer_avalon_char_buffer_slave),
      .CPU_data_master_dbs_address                                                         (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_8                                                         (CPU_data_master_dbs_write_8),
      .CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave                    (CPU_data_master_granted_VGA_Char_Buffer_avalon_char_buffer_slave),
      .CPU_data_master_no_byte_enables_and_last_term                                       (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave          (CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_buffer_slave),
      .CPU_data_master_read                                                                (CPU_data_master_read),
      .CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave            (CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave),
      .CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave                   (CPU_data_master_requests_VGA_Char_Buffer_avalon_char_buffer_slave),
      .CPU_data_master_waitrequest                                                         (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                               (CPU_data_master_write),
      .VGA_Char_Buffer_avalon_char_buffer_slave_address                                    (VGA_Char_Buffer_avalon_char_buffer_slave_address),
      .VGA_Char_Buffer_avalon_char_buffer_slave_byteenable                                 (VGA_Char_Buffer_avalon_char_buffer_slave_byteenable),
      .VGA_Char_Buffer_avalon_char_buffer_slave_chipselect                                 (VGA_Char_Buffer_avalon_char_buffer_slave_chipselect),
      .VGA_Char_Buffer_avalon_char_buffer_slave_read                                       (VGA_Char_Buffer_avalon_char_buffer_slave_read),
      .VGA_Char_Buffer_avalon_char_buffer_slave_readdata                                   (VGA_Char_Buffer_avalon_char_buffer_slave_readdata),
      .VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa                           (VGA_Char_Buffer_avalon_char_buffer_slave_readdata_from_sa),
      .VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest                                (VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest),
      .VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa                        (VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest_from_sa),
      .VGA_Char_Buffer_avalon_char_buffer_slave_write                                      (VGA_Char_Buffer_avalon_char_buffer_slave_write),
      .VGA_Char_Buffer_avalon_char_buffer_slave_writedata                                  (VGA_Char_Buffer_avalon_char_buffer_slave_writedata),
      .clk                                                                                 (sys_clk),
      .d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer                                (d1_VGA_Char_Buffer_avalon_char_buffer_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave (registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_buffer_slave),
      .reset_n                                                                             (sys_clk_reset_n)
    );

  VGA_Char_Buffer_avalon_char_control_slave_arbitrator the_VGA_Char_Buffer_avalon_char_control_slave
    (
      .CPU_data_master_address_to_slave                                                     (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                           (CPU_data_master_byteenable),
      .CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave                    (CPU_data_master_granted_VGA_Char_Buffer_avalon_char_control_slave),
      .CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave          (CPU_data_master_qualified_request_VGA_Char_Buffer_avalon_char_control_slave),
      .CPU_data_master_read                                                                 (CPU_data_master_read),
      .CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave            (CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave),
      .CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave                   (CPU_data_master_requests_VGA_Char_Buffer_avalon_char_control_slave),
      .CPU_data_master_waitrequest                                                          (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                                (CPU_data_master_write),
      .CPU_data_master_writedata                                                            (CPU_data_master_writedata),
      .VGA_Char_Buffer_avalon_char_control_slave_address                                    (VGA_Char_Buffer_avalon_char_control_slave_address),
      .VGA_Char_Buffer_avalon_char_control_slave_byteenable                                 (VGA_Char_Buffer_avalon_char_control_slave_byteenable),
      .VGA_Char_Buffer_avalon_char_control_slave_chipselect                                 (VGA_Char_Buffer_avalon_char_control_slave_chipselect),
      .VGA_Char_Buffer_avalon_char_control_slave_read                                       (VGA_Char_Buffer_avalon_char_control_slave_read),
      .VGA_Char_Buffer_avalon_char_control_slave_readdata                                   (VGA_Char_Buffer_avalon_char_control_slave_readdata),
      .VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa                           (VGA_Char_Buffer_avalon_char_control_slave_readdata_from_sa),
      .VGA_Char_Buffer_avalon_char_control_slave_reset                                      (VGA_Char_Buffer_avalon_char_control_slave_reset),
      .VGA_Char_Buffer_avalon_char_control_slave_write                                      (VGA_Char_Buffer_avalon_char_control_slave_write),
      .VGA_Char_Buffer_avalon_char_control_slave_writedata                                  (VGA_Char_Buffer_avalon_char_control_slave_writedata),
      .clk                                                                                  (sys_clk),
      .d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer                                (d1_VGA_Char_Buffer_avalon_char_control_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave (registered_CPU_data_master_read_data_valid_VGA_Char_Buffer_avalon_char_control_slave),
      .reset_n                                                                              (sys_clk_reset_n)
    );

  VGA_Char_Buffer_avalon_char_source_arbitrator the_VGA_Char_Buffer_avalon_char_source
    (
      .Alpha_Blending_avalon_foreground_sink_ready_from_sa (Alpha_Blending_avalon_foreground_sink_ready_from_sa),
      .VGA_Char_Buffer_avalon_char_source_data             (VGA_Char_Buffer_avalon_char_source_data),
      .VGA_Char_Buffer_avalon_char_source_endofpacket      (VGA_Char_Buffer_avalon_char_source_endofpacket),
      .VGA_Char_Buffer_avalon_char_source_ready            (VGA_Char_Buffer_avalon_char_source_ready),
      .VGA_Char_Buffer_avalon_char_source_startofpacket    (VGA_Char_Buffer_avalon_char_source_startofpacket),
      .VGA_Char_Buffer_avalon_char_source_valid            (VGA_Char_Buffer_avalon_char_source_valid),
      .clk                                                 (sys_clk),
      .reset_n                                             (sys_clk_reset_n)
    );

  VGA_Char_Buffer the_VGA_Char_Buffer
    (
      .buf_address          (VGA_Char_Buffer_avalon_char_buffer_slave_address),
      .buf_byteenable       (VGA_Char_Buffer_avalon_char_buffer_slave_byteenable),
      .buf_chipselect       (VGA_Char_Buffer_avalon_char_buffer_slave_chipselect),
      .buf_read             (VGA_Char_Buffer_avalon_char_buffer_slave_read),
      .buf_readdata         (VGA_Char_Buffer_avalon_char_buffer_slave_readdata),
      .buf_waitrequest      (VGA_Char_Buffer_avalon_char_buffer_slave_waitrequest),
      .buf_write            (VGA_Char_Buffer_avalon_char_buffer_slave_write),
      .buf_writedata        (VGA_Char_Buffer_avalon_char_buffer_slave_writedata),
      .clk                  (sys_clk),
      .ctrl_address         (VGA_Char_Buffer_avalon_char_control_slave_address),
      .ctrl_byteenable      (VGA_Char_Buffer_avalon_char_control_slave_byteenable),
      .ctrl_chipselect      (VGA_Char_Buffer_avalon_char_control_slave_chipselect),
      .ctrl_read            (VGA_Char_Buffer_avalon_char_control_slave_read),
      .ctrl_readdata        (VGA_Char_Buffer_avalon_char_control_slave_readdata),
      .ctrl_write           (VGA_Char_Buffer_avalon_char_control_slave_write),
      .ctrl_writedata       (VGA_Char_Buffer_avalon_char_control_slave_writedata),
      .reset                (VGA_Char_Buffer_avalon_char_control_slave_reset),
      .stream_data          (VGA_Char_Buffer_avalon_char_source_data),
      .stream_endofpacket   (VGA_Char_Buffer_avalon_char_source_endofpacket),
      .stream_ready         (VGA_Char_Buffer_avalon_char_source_ready),
      .stream_startofpacket (VGA_Char_Buffer_avalon_char_source_startofpacket),
      .stream_valid         (VGA_Char_Buffer_avalon_char_source_valid)
    );

  VGA_Controller_avalon_vga_sink_arbitrator the_VGA_Controller_avalon_vga_sink
    (
      .VGA_Controller_avalon_vga_sink_data                       (VGA_Controller_avalon_vga_sink_data),
      .VGA_Controller_avalon_vga_sink_endofpacket                (VGA_Controller_avalon_vga_sink_endofpacket),
      .VGA_Controller_avalon_vga_sink_ready                      (VGA_Controller_avalon_vga_sink_ready),
      .VGA_Controller_avalon_vga_sink_ready_from_sa              (VGA_Controller_avalon_vga_sink_ready_from_sa),
      .VGA_Controller_avalon_vga_sink_reset                      (VGA_Controller_avalon_vga_sink_reset),
      .VGA_Controller_avalon_vga_sink_startofpacket              (VGA_Controller_avalon_vga_sink_startofpacket),
      .VGA_Controller_avalon_vga_sink_valid                      (VGA_Controller_avalon_vga_sink_valid),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_data          (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_data),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket   (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_valid         (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_valid),
      .clk                                                       (vga_clk),
      .reset_n                                                   (vga_clk_reset_n)
    );

  VGA_Controller the_VGA_Controller
    (
      .VGA_B         (VGA_B_from_the_VGA_Controller),
      .VGA_BLANK     (VGA_BLANK_from_the_VGA_Controller),
      .VGA_CLK       (VGA_CLK_from_the_VGA_Controller),
      .VGA_G         (VGA_G_from_the_VGA_Controller),
      .VGA_HS        (VGA_HS_from_the_VGA_Controller),
      .VGA_R         (VGA_R_from_the_VGA_Controller),
      .VGA_SYNC      (VGA_SYNC_from_the_VGA_Controller),
      .VGA_VS        (VGA_VS_from_the_VGA_Controller),
      .clk           (vga_clk),
      .data          (VGA_Controller_avalon_vga_sink_data),
      .endofpacket   (VGA_Controller_avalon_vga_sink_endofpacket),
      .ready         (VGA_Controller_avalon_vga_sink_ready),
      .reset         (VGA_Controller_avalon_vga_sink_reset),
      .startofpacket (VGA_Controller_avalon_vga_sink_startofpacket),
      .valid         (VGA_Controller_avalon_vga_sink_valid)
    );

  VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_arbitrator the_VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink
    (
      .Alpha_Blending_avalon_blended_source_data               (Alpha_Blending_avalon_blended_source_data),
      .Alpha_Blending_avalon_blended_source_endofpacket        (Alpha_Blending_avalon_blended_source_endofpacket),
      .Alpha_Blending_avalon_blended_source_startofpacket      (Alpha_Blending_avalon_blended_source_startofpacket),
      .Alpha_Blending_avalon_blended_source_valid              (Alpha_Blending_avalon_blended_source_valid),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_data          (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_data),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket   (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready         (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_valid         (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_valid),
      .clk                                                     (sys_clk),
      .reset_n                                                 (sys_clk_reset_n)
    );

  VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_arbitrator the_VGA_Dual_Clock_FIFO_avalon_dc_buffer_source
    (
      .VGA_Controller_avalon_vga_sink_ready_from_sa              (VGA_Controller_avalon_vga_sink_ready_from_sa),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_data          (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_data),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket   (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_ready         (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_ready),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket),
      .VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_valid         (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_valid),
      .clk                                                       (vga_clk),
      .reset_n                                                   (vga_clk_reset_n)
    );

  VGA_Dual_Clock_FIFO the_VGA_Dual_Clock_FIFO
    (
      .clk_stream_in            (sys_clk),
      .clk_stream_out           (vga_clk),
      .stream_in_data           (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_data),
      .stream_in_endofpacket    (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket),
      .stream_in_ready          (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_ready),
      .stream_in_startofpacket  (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket),
      .stream_in_valid          (VGA_Dual_Clock_FIFO_avalon_dc_buffer_sink_valid),
      .stream_out_data          (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_data),
      .stream_out_endofpacket   (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket),
      .stream_out_ready         (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_ready),
      .stream_out_startofpacket (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket),
      .stream_out_valid         (VGA_Dual_Clock_FIFO_avalon_dc_buffer_source_valid)
    );

  VGA_Pixel_Buffer_avalon_control_slave_arbitrator the_VGA_Pixel_Buffer_avalon_control_slave
    (
      .CPU_data_master_address_to_slave                                                 (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                       (CPU_data_master_byteenable),
      .CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave                    (CPU_data_master_granted_VGA_Pixel_Buffer_avalon_control_slave),
      .CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave          (CPU_data_master_qualified_request_VGA_Pixel_Buffer_avalon_control_slave),
      .CPU_data_master_read                                                             (CPU_data_master_read),
      .CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave            (CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave),
      .CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave                   (CPU_data_master_requests_VGA_Pixel_Buffer_avalon_control_slave),
      .CPU_data_master_waitrequest                                                      (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                            (CPU_data_master_write),
      .CPU_data_master_writedata                                                        (CPU_data_master_writedata),
      .VGA_Pixel_Buffer_avalon_control_slave_address                                    (VGA_Pixel_Buffer_avalon_control_slave_address),
      .VGA_Pixel_Buffer_avalon_control_slave_byteenable                                 (VGA_Pixel_Buffer_avalon_control_slave_byteenable),
      .VGA_Pixel_Buffer_avalon_control_slave_read                                       (VGA_Pixel_Buffer_avalon_control_slave_read),
      .VGA_Pixel_Buffer_avalon_control_slave_readdata                                   (VGA_Pixel_Buffer_avalon_control_slave_readdata),
      .VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa                           (VGA_Pixel_Buffer_avalon_control_slave_readdata_from_sa),
      .VGA_Pixel_Buffer_avalon_control_slave_write                                      (VGA_Pixel_Buffer_avalon_control_slave_write),
      .VGA_Pixel_Buffer_avalon_control_slave_writedata                                  (VGA_Pixel_Buffer_avalon_control_slave_writedata),
      .clk                                                                              (sys_clk),
      .d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer                                (d1_VGA_Pixel_Buffer_avalon_control_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave (registered_CPU_data_master_read_data_valid_VGA_Pixel_Buffer_avalon_control_slave),
      .reset_n                                                                          (sys_clk_reset_n)
    );

  VGA_Pixel_Buffer_avalon_pixel_dma_master_arbitrator the_VGA_Pixel_Buffer_avalon_pixel_dma_master
    (
      .SRAM_avalon_sram_slave_readdata_from_sa                                                        (SRAM_avalon_sram_slave_readdata_from_sa),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_address                                               (VGA_Pixel_Buffer_avalon_pixel_dma_master_address),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave                                      (VGA_Pixel_Buffer_avalon_pixel_dma_master_address_to_slave),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave                        (VGA_Pixel_Buffer_avalon_pixel_dma_master_granted_SRAM_avalon_sram_slave),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter                                       (VGA_Pixel_Buffer_avalon_pixel_dma_master_latency_counter),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave              (VGA_Pixel_Buffer_avalon_pixel_dma_master_qualified_request_SRAM_avalon_sram_slave),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_read                                                  (VGA_Pixel_Buffer_avalon_pixel_dma_master_read),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave                (VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave_shift_register (VGA_Pixel_Buffer_avalon_pixel_dma_master_read_data_valid_SRAM_avalon_sram_slave_shift_register),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_readdata                                              (VGA_Pixel_Buffer_avalon_pixel_dma_master_readdata),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_readdatavalid                                         (VGA_Pixel_Buffer_avalon_pixel_dma_master_readdatavalid),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave                       (VGA_Pixel_Buffer_avalon_pixel_dma_master_requests_SRAM_avalon_sram_slave),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_reset                                                 (VGA_Pixel_Buffer_avalon_pixel_dma_master_reset),
      .VGA_Pixel_Buffer_avalon_pixel_dma_master_waitrequest                                           (VGA_Pixel_Buffer_avalon_pixel_dma_master_waitrequest),
      .clk                                                                                            (sys_clk),
      .d1_SRAM_avalon_sram_slave_end_xfer                                                             (d1_SRAM_avalon_sram_slave_end_xfer),
      .reset_n                                                                                        (sys_clk_reset_n)
    );

  VGA_Pixel_Buffer_avalon_pixel_source_arbitrator the_VGA_Pixel_Buffer_avalon_pixel_source
    (
      .VGA_Pixel_Buffer_avalon_pixel_source_data             (VGA_Pixel_Buffer_avalon_pixel_source_data),
      .VGA_Pixel_Buffer_avalon_pixel_source_endofpacket      (VGA_Pixel_Buffer_avalon_pixel_source_endofpacket),
      .VGA_Pixel_Buffer_avalon_pixel_source_ready            (VGA_Pixel_Buffer_avalon_pixel_source_ready),
      .VGA_Pixel_Buffer_avalon_pixel_source_startofpacket    (VGA_Pixel_Buffer_avalon_pixel_source_startofpacket),
      .VGA_Pixel_Buffer_avalon_pixel_source_valid            (VGA_Pixel_Buffer_avalon_pixel_source_valid),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa),
      .clk                                                   (sys_clk),
      .reset_n                                               (sys_clk_reset_n)
    );

  VGA_Pixel_Buffer the_VGA_Pixel_Buffer
    (
      .clk                  (sys_clk),
      .master_address       (VGA_Pixel_Buffer_avalon_pixel_dma_master_address),
      .master_arbiterlock   (VGA_Pixel_Buffer_avalon_pixel_dma_master_arbiterlock),
      .master_read          (VGA_Pixel_Buffer_avalon_pixel_dma_master_read),
      .master_readdata      (VGA_Pixel_Buffer_avalon_pixel_dma_master_readdata),
      .master_readdatavalid (VGA_Pixel_Buffer_avalon_pixel_dma_master_readdatavalid),
      .master_waitrequest   (VGA_Pixel_Buffer_avalon_pixel_dma_master_waitrequest),
      .reset                (VGA_Pixel_Buffer_avalon_pixel_dma_master_reset),
      .slave_address        (VGA_Pixel_Buffer_avalon_control_slave_address),
      .slave_byteenable     (VGA_Pixel_Buffer_avalon_control_slave_byteenable),
      .slave_read           (VGA_Pixel_Buffer_avalon_control_slave_read),
      .slave_readdata       (VGA_Pixel_Buffer_avalon_control_slave_readdata),
      .slave_write          (VGA_Pixel_Buffer_avalon_control_slave_write),
      .slave_writedata      (VGA_Pixel_Buffer_avalon_control_slave_writedata),
      .stream_data          (VGA_Pixel_Buffer_avalon_pixel_source_data),
      .stream_endofpacket   (VGA_Pixel_Buffer_avalon_pixel_source_endofpacket),
      .stream_ready         (VGA_Pixel_Buffer_avalon_pixel_source_ready),
      .stream_startofpacket (VGA_Pixel_Buffer_avalon_pixel_source_startofpacket),
      .stream_valid         (VGA_Pixel_Buffer_avalon_pixel_source_valid)
    );

  VGA_Pixel_RGB_Resampler_avalon_rgb_sink_arbitrator the_VGA_Pixel_RGB_Resampler_avalon_rgb_sink
    (
      .VGA_Pixel_Buffer_avalon_pixel_source_data             (VGA_Pixel_Buffer_avalon_pixel_source_data),
      .VGA_Pixel_Buffer_avalon_pixel_source_endofpacket      (VGA_Pixel_Buffer_avalon_pixel_source_endofpacket),
      .VGA_Pixel_Buffer_avalon_pixel_source_startofpacket    (VGA_Pixel_Buffer_avalon_pixel_source_startofpacket),
      .VGA_Pixel_Buffer_avalon_pixel_source_valid            (VGA_Pixel_Buffer_avalon_pixel_source_valid),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_sink_data          (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_data),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket   (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready         (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_sink_reset         (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_reset),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_sink_valid         (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_valid),
      .clk                                                   (sys_clk),
      .reset_n                                               (sys_clk_reset_n)
    );

  VGA_Pixel_RGB_Resampler_avalon_rgb_source_arbitrator the_VGA_Pixel_RGB_Resampler_avalon_rgb_source
    (
      .Alpha_Blending_avalon_background_sink_ready_from_sa     (Alpha_Blending_avalon_background_sink_ready_from_sa),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_source_data          (VGA_Pixel_RGB_Resampler_avalon_rgb_source_data),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_source_endofpacket   (VGA_Pixel_RGB_Resampler_avalon_rgb_source_endofpacket),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_source_ready         (VGA_Pixel_RGB_Resampler_avalon_rgb_source_ready),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_source_startofpacket (VGA_Pixel_RGB_Resampler_avalon_rgb_source_startofpacket),
      .VGA_Pixel_RGB_Resampler_avalon_rgb_source_valid         (VGA_Pixel_RGB_Resampler_avalon_rgb_source_valid),
      .clk                                                     (sys_clk),
      .reset_n                                                 (sys_clk_reset_n)
    );

  VGA_Pixel_RGB_Resampler the_VGA_Pixel_RGB_Resampler
    (
      .clk                      (sys_clk),
      .reset                    (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_reset),
      .stream_in_data           (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_data),
      .stream_in_endofpacket    (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket),
      .stream_in_ready          (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_ready),
      .stream_in_startofpacket  (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket),
      .stream_in_valid          (VGA_Pixel_RGB_Resampler_avalon_rgb_sink_valid),
      .stream_out_data          (VGA_Pixel_RGB_Resampler_avalon_rgb_source_data),
      .stream_out_endofpacket   (VGA_Pixel_RGB_Resampler_avalon_rgb_source_endofpacket),
      .stream_out_ready         (VGA_Pixel_RGB_Resampler_avalon_rgb_source_ready),
      .stream_out_startofpacket (VGA_Pixel_RGB_Resampler_avalon_rgb_source_startofpacket),
      .stream_out_valid         (VGA_Pixel_RGB_Resampler_avalon_rgb_source_valid)
    );

  nios_system_clock_0_in_arbitrator the_nios_system_clock_0_in
    (
      .CPU_data_master_address_to_slave                         (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                               (CPU_data_master_byteenable),
      .CPU_data_master_byteenable_nios_system_clock_0_in        (CPU_data_master_byteenable_nios_system_clock_0_in),
      .CPU_data_master_dbs_address                              (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_8                              (CPU_data_master_dbs_write_8),
      .CPU_data_master_granted_nios_system_clock_0_in           (CPU_data_master_granted_nios_system_clock_0_in),
      .CPU_data_master_no_byte_enables_and_last_term            (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_nios_system_clock_0_in (CPU_data_master_qualified_request_nios_system_clock_0_in),
      .CPU_data_master_read                                     (CPU_data_master_read),
      .CPU_data_master_read_data_valid_nios_system_clock_0_in   (CPU_data_master_read_data_valid_nios_system_clock_0_in),
      .CPU_data_master_requests_nios_system_clock_0_in          (CPU_data_master_requests_nios_system_clock_0_in),
      .CPU_data_master_waitrequest                              (CPU_data_master_waitrequest),
      .CPU_data_master_write                                    (CPU_data_master_write),
      .clk                                                      (sys_clk),
      .d1_nios_system_clock_0_in_end_xfer                       (d1_nios_system_clock_0_in_end_xfer),
      .nios_system_clock_0_in_address                           (nios_system_clock_0_in_address),
      .nios_system_clock_0_in_endofpacket                       (nios_system_clock_0_in_endofpacket),
      .nios_system_clock_0_in_endofpacket_from_sa               (nios_system_clock_0_in_endofpacket_from_sa),
      .nios_system_clock_0_in_nativeaddress                     (nios_system_clock_0_in_nativeaddress),
      .nios_system_clock_0_in_read                              (nios_system_clock_0_in_read),
      .nios_system_clock_0_in_readdata                          (nios_system_clock_0_in_readdata),
      .nios_system_clock_0_in_readdata_from_sa                  (nios_system_clock_0_in_readdata_from_sa),
      .nios_system_clock_0_in_reset_n                           (nios_system_clock_0_in_reset_n),
      .nios_system_clock_0_in_waitrequest                       (nios_system_clock_0_in_waitrequest),
      .nios_system_clock_0_in_waitrequest_from_sa               (nios_system_clock_0_in_waitrequest_from_sa),
      .nios_system_clock_0_in_write                             (nios_system_clock_0_in_write),
      .nios_system_clock_0_in_writedata                         (nios_system_clock_0_in_writedata),
      .reset_n                                                  (sys_clk_reset_n)
    );

  nios_system_clock_0_out_arbitrator the_nios_system_clock_0_out
    (
      .External_Clocks_avalon_clocks_slave_readdata_from_sa                          (External_Clocks_avalon_clocks_slave_readdata_from_sa),
      .clk                                                                           (clk),
      .d1_External_Clocks_avalon_clocks_slave_end_xfer                               (d1_External_Clocks_avalon_clocks_slave_end_xfer),
      .nios_system_clock_0_out_address                                               (nios_system_clock_0_out_address),
      .nios_system_clock_0_out_address_to_slave                                      (nios_system_clock_0_out_address_to_slave),
      .nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave           (nios_system_clock_0_out_granted_External_Clocks_avalon_clocks_slave),
      .nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave (nios_system_clock_0_out_qualified_request_External_Clocks_avalon_clocks_slave),
      .nios_system_clock_0_out_read                                                  (nios_system_clock_0_out_read),
      .nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave   (nios_system_clock_0_out_read_data_valid_External_Clocks_avalon_clocks_slave),
      .nios_system_clock_0_out_readdata                                              (nios_system_clock_0_out_readdata),
      .nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave          (nios_system_clock_0_out_requests_External_Clocks_avalon_clocks_slave),
      .nios_system_clock_0_out_reset_n                                               (nios_system_clock_0_out_reset_n),
      .nios_system_clock_0_out_waitrequest                                           (nios_system_clock_0_out_waitrequest),
      .nios_system_clock_0_out_write                                                 (nios_system_clock_0_out_write),
      .nios_system_clock_0_out_writedata                                             (nios_system_clock_0_out_writedata),
      .reset_n                                                                       (clk_reset_n)
    );

  nios_system_clock_0 the_nios_system_clock_0
    (
      .master_address       (nios_system_clock_0_out_address),
      .master_clk           (clk),
      .master_endofpacket   (nios_system_clock_0_out_endofpacket),
      .master_nativeaddress (nios_system_clock_0_out_nativeaddress),
      .master_read          (nios_system_clock_0_out_read),
      .master_readdata      (nios_system_clock_0_out_readdata),
      .master_reset_n       (nios_system_clock_0_out_reset_n),
      .master_waitrequest   (nios_system_clock_0_out_waitrequest),
      .master_write         (nios_system_clock_0_out_write),
      .master_writedata     (nios_system_clock_0_out_writedata),
      .slave_address        (nios_system_clock_0_in_address),
      .slave_clk            (sys_clk),
      .slave_endofpacket    (nios_system_clock_0_in_endofpacket),
      .slave_nativeaddress  (nios_system_clock_0_in_nativeaddress),
      .slave_read           (nios_system_clock_0_in_read),
      .slave_readdata       (nios_system_clock_0_in_readdata),
      .slave_reset_n        (nios_system_clock_0_in_reset_n),
      .slave_waitrequest    (nios_system_clock_0_in_waitrequest),
      .slave_write          (nios_system_clock_0_in_write),
      .slave_writedata      (nios_system_clock_0_in_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .CPU_data_master_address_to_slave                      (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_sysid_control_slave           (CPU_data_master_granted_sysid_control_slave),
      .CPU_data_master_qualified_request_sysid_control_slave (CPU_data_master_qualified_request_sysid_control_slave),
      .CPU_data_master_read                                  (CPU_data_master_read),
      .CPU_data_master_read_data_valid_sysid_control_slave   (CPU_data_master_read_data_valid_sysid_control_slave),
      .CPU_data_master_requests_sysid_control_slave          (CPU_data_master_requests_sysid_control_slave),
      .CPU_data_master_write                                 (CPU_data_master_write),
      .clk                                                   (sys_clk),
      .d1_sysid_control_slave_end_xfer                       (d1_sysid_control_slave_end_xfer),
      .reset_n                                               (sys_clk_reset_n),
      .sysid_control_slave_address                           (sysid_control_slave_address),
      .sysid_control_slave_readdata                          (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                  (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                           (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_system_reset_sys_clk_domain_synch_module nios_system_reset_sys_clk_domain_synch
    (
      .clk      (sys_clk),
      .data_in  (1'b1),
      .data_out (sys_clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    CPU_jtag_debug_module_resetrequest_from_sa |
    CPU_jtag_debug_module_resetrequest_from_sa |
    0 |
    0);

  //reset is asserted asynchronously and deasserted synchronously
  nios_system_reset_clk_domain_synch_module nios_system_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_system_reset_vga_clk_domain_synch_module nios_system_reset_vga_clk_domain_synch
    (
      .clk      (vga_clk),
      .data_in  (1'b1),
      .data_out (vga_clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //nios_system_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign nios_system_clock_0_out_endofpacket = 0;

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


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
`include "VGA_Pixel_RGB_Resampler.v"
`include "Expansion_JP2.v"
`include "Slider_Switches.v"
`include "Alpha_Blending.v"
`include "VGA_Dual_Clock_FIFO.v"
`include "Green_LEDs.v"
`include "AV_Config.v"
`include "PS2_Port.v"
`include "VGA_Char_Buffer.v"
`include "Red_LEDs.v"
`include "HEX3_HEX0.v"
`include "Pushbuttons.v"
`include "VGA_Pixel_Buffer.v"
`include "VGA_Controller.v"
`include "Expansion_JP1.v"
`include "C:/altera/11.0/ip/altera/nios2_ip/altera_nios_custom_instr_floating_point_qsys/fpoint_wrapper.v"
`include "C:/altera/11.0/ip/altera/nios2_ip/altera_nios_custom_instr_floating_point_qsys/fpoint_qsys.v"
`include "C:/altera/11.0/ip/altera/nios2_ip/altera_nios_custom_instr_floating_point_qsys/fpoint_hw_qsys.v"
`include "CPU_fpoint.v"
`include "SRAM.v"
`include "Serial_Port.v"
`include "HEX7_HEX4.v"
`include "External_Clocks.v"
`include "Audio.v"
`include "Char_LCD_16x2.v"
`include "Interval_Timer.v"
`include "sysid.v"
`include "SDRAM.v"
`include "JTAG_UART.v"
`include "CPU_test_bench.v"
`include "CPU_mult_cell.v"
`include "CPU_oci_test_bench.v"
`include "CPU_jtag_debug_module_tck.v"
`include "CPU_jtag_debug_module_sysclk.v"
`include "CPU_jtag_debug_module_wrapper.v"
`include "CPU.v"
`include "nios_system_clock_0.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             AUD_ADCDAT_to_the_Audio;
  wire             AUD_ADCLRCK_to_and_from_the_Audio;
  wire             AUD_BCLK_to_and_from_the_Audio;
  wire             AUD_DACDAT_from_the_Audio;
  wire             AUD_DACLRCK_to_and_from_the_Audio;
  wire             A_ci_multi_clock_from_the_CPU;
  wire             A_ci_multi_reset_from_the_CPU;
  wire    [  4: 0] CPU_custom_instruction_master_multi_a;
  wire    [  4: 0] CPU_custom_instruction_master_multi_b;
  wire    [  4: 0] CPU_custom_instruction_master_multi_c;
  wire             CPU_custom_instruction_master_multi_estatus;
  wire    [ 31: 0] CPU_custom_instruction_master_multi_ipending;
  wire             CPU_custom_instruction_master_multi_readra;
  wire             CPU_custom_instruction_master_multi_readrb;
  wire             CPU_custom_instruction_master_multi_status;
  wire             CPU_custom_instruction_master_multi_writerc;
  wire    [ 31: 0] GPIO_0_to_and_from_the_Expansion_JP1;
  wire    [ 31: 0] GPIO_1_to_and_from_the_Expansion_JP2;
  wire    [  6: 0] HEX0_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX1_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX2_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX3_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX4_from_the_HEX7_HEX4;
  wire    [  6: 0] HEX5_from_the_HEX7_HEX4;
  wire    [  6: 0] HEX6_from_the_HEX7_HEX4;
  wire    [  6: 0] HEX7_from_the_HEX7_HEX4;
  wire             I2C_SCLK_from_the_AV_Config;
  wire             I2C_SDAT_to_and_from_the_AV_Config;
  wire             JTAG_UART_avalon_jtag_slave_dataavailable_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_readyfordata_from_sa;
  wire    [  3: 0] KEY_to_the_Pushbuttons;
  wire             LCD_BLON_from_the_Char_LCD_16x2;
  wire    [  7: 0] LCD_DATA_to_and_from_the_Char_LCD_16x2;
  wire             LCD_EN_from_the_Char_LCD_16x2;
  wire             LCD_ON_from_the_Char_LCD_16x2;
  wire             LCD_RS_from_the_Char_LCD_16x2;
  wire             LCD_RW_from_the_Char_LCD_16x2;
  wire    [  8: 0] LEDG_from_the_Green_LEDs;
  wire    [ 17: 0] LEDR_from_the_Red_LEDs;
  wire             PS2_CLK_to_and_from_the_PS2_Port;
  wire             PS2_DAT_to_and_from_the_PS2_Port;
  wire    [ 17: 0] SRAM_ADDR_from_the_SRAM;
  wire             SRAM_CE_N_from_the_SRAM;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_SRAM;
  wire             SRAM_LB_N_from_the_SRAM;
  wire             SRAM_OE_N_from_the_SRAM;
  wire             SRAM_UB_N_from_the_SRAM;
  wire             SRAM_WE_N_from_the_SRAM;
  wire    [ 17: 0] SW_to_the_Slider_Switches;
  wire             UART_RXD_to_the_Serial_Port;
  wire             UART_TXD_from_the_Serial_Port;
  wire             VGA_BLANK_from_the_VGA_Controller;
  wire    [  9: 0] VGA_B_from_the_VGA_Controller;
  wire             VGA_CLK_from_the_VGA_Controller;
  wire    [  9: 0] VGA_G_from_the_VGA_Controller;
  wire             VGA_HS_from_the_VGA_Controller;
  wire    [  9: 0] VGA_R_from_the_VGA_Controller;
  wire             VGA_SYNC_from_the_VGA_Controller;
  wire             VGA_VS_from_the_VGA_Controller;
  wire             audio_clk;
  reg              clk;
  reg              clk_27;
  wire             nios_system_clock_0_in_endofpacket_from_sa;
  wire             nios_system_clock_0_out_endofpacket;
  wire             nios_system_clock_0_out_nativeaddress;
  reg              reset_n;
  wire             sdram_clk;
  wire             sys_clk;
  wire             sysid_control_slave_clock;
  wire             vga_clk;
  wire    [ 11: 0] zs_addr_from_the_SDRAM;
  wire    [  1: 0] zs_ba_from_the_SDRAM;
  wire             zs_cas_n_from_the_SDRAM;
  wire             zs_cke_from_the_SDRAM;
  wire             zs_cs_n_from_the_SDRAM;
  wire    [ 15: 0] zs_dq_to_and_from_the_SDRAM;
  wire    [  1: 0] zs_dqm_from_the_SDRAM;
  wire             zs_ras_n_from_the_SDRAM;
  wire             zs_we_n_from_the_SDRAM;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  nios_system DUT
    (
      .AUD_ADCDAT_to_the_Audio                (AUD_ADCDAT_to_the_Audio),
      .AUD_ADCLRCK_to_and_from_the_Audio      (AUD_ADCLRCK_to_and_from_the_Audio),
      .AUD_BCLK_to_and_from_the_Audio         (AUD_BCLK_to_and_from_the_Audio),
      .AUD_DACDAT_from_the_Audio              (AUD_DACDAT_from_the_Audio),
      .AUD_DACLRCK_to_and_from_the_Audio      (AUD_DACLRCK_to_and_from_the_Audio),
      .A_ci_multi_clock_from_the_CPU          (A_ci_multi_clock_from_the_CPU),
      .A_ci_multi_reset_from_the_CPU          (A_ci_multi_reset_from_the_CPU),
      .GPIO_0_to_and_from_the_Expansion_JP1   (GPIO_0_to_and_from_the_Expansion_JP1),
      .GPIO_1_to_and_from_the_Expansion_JP2   (GPIO_1_to_and_from_the_Expansion_JP2),
      .HEX0_from_the_HEX3_HEX0                (HEX0_from_the_HEX3_HEX0),
      .HEX1_from_the_HEX3_HEX0                (HEX1_from_the_HEX3_HEX0),
      .HEX2_from_the_HEX3_HEX0                (HEX2_from_the_HEX3_HEX0),
      .HEX3_from_the_HEX3_HEX0                (HEX3_from_the_HEX3_HEX0),
      .HEX4_from_the_HEX7_HEX4                (HEX4_from_the_HEX7_HEX4),
      .HEX5_from_the_HEX7_HEX4                (HEX5_from_the_HEX7_HEX4),
      .HEX6_from_the_HEX7_HEX4                (HEX6_from_the_HEX7_HEX4),
      .HEX7_from_the_HEX7_HEX4                (HEX7_from_the_HEX7_HEX4),
      .I2C_SCLK_from_the_AV_Config            (I2C_SCLK_from_the_AV_Config),
      .I2C_SDAT_to_and_from_the_AV_Config     (I2C_SDAT_to_and_from_the_AV_Config),
      .KEY_to_the_Pushbuttons                 (KEY_to_the_Pushbuttons),
      .LCD_BLON_from_the_Char_LCD_16x2        (LCD_BLON_from_the_Char_LCD_16x2),
      .LCD_DATA_to_and_from_the_Char_LCD_16x2 (LCD_DATA_to_and_from_the_Char_LCD_16x2),
      .LCD_EN_from_the_Char_LCD_16x2          (LCD_EN_from_the_Char_LCD_16x2),
      .LCD_ON_from_the_Char_LCD_16x2          (LCD_ON_from_the_Char_LCD_16x2),
      .LCD_RS_from_the_Char_LCD_16x2          (LCD_RS_from_the_Char_LCD_16x2),
      .LCD_RW_from_the_Char_LCD_16x2          (LCD_RW_from_the_Char_LCD_16x2),
      .LEDG_from_the_Green_LEDs               (LEDG_from_the_Green_LEDs),
      .LEDR_from_the_Red_LEDs                 (LEDR_from_the_Red_LEDs),
      .PS2_CLK_to_and_from_the_PS2_Port       (PS2_CLK_to_and_from_the_PS2_Port),
      .PS2_DAT_to_and_from_the_PS2_Port       (PS2_DAT_to_and_from_the_PS2_Port),
      .SRAM_ADDR_from_the_SRAM                (SRAM_ADDR_from_the_SRAM),
      .SRAM_CE_N_from_the_SRAM                (SRAM_CE_N_from_the_SRAM),
      .SRAM_DQ_to_and_from_the_SRAM           (SRAM_DQ_to_and_from_the_SRAM),
      .SRAM_LB_N_from_the_SRAM                (SRAM_LB_N_from_the_SRAM),
      .SRAM_OE_N_from_the_SRAM                (SRAM_OE_N_from_the_SRAM),
      .SRAM_UB_N_from_the_SRAM                (SRAM_UB_N_from_the_SRAM),
      .SRAM_WE_N_from_the_SRAM                (SRAM_WE_N_from_the_SRAM),
      .SW_to_the_Slider_Switches              (SW_to_the_Slider_Switches),
      .UART_RXD_to_the_Serial_Port            (UART_RXD_to_the_Serial_Port),
      .UART_TXD_from_the_Serial_Port          (UART_TXD_from_the_Serial_Port),
      .VGA_BLANK_from_the_VGA_Controller      (VGA_BLANK_from_the_VGA_Controller),
      .VGA_B_from_the_VGA_Controller          (VGA_B_from_the_VGA_Controller),
      .VGA_CLK_from_the_VGA_Controller        (VGA_CLK_from_the_VGA_Controller),
      .VGA_G_from_the_VGA_Controller          (VGA_G_from_the_VGA_Controller),
      .VGA_HS_from_the_VGA_Controller         (VGA_HS_from_the_VGA_Controller),
      .VGA_R_from_the_VGA_Controller          (VGA_R_from_the_VGA_Controller),
      .VGA_SYNC_from_the_VGA_Controller       (VGA_SYNC_from_the_VGA_Controller),
      .VGA_VS_from_the_VGA_Controller         (VGA_VS_from_the_VGA_Controller),
      .audio_clk                              (audio_clk),
      .clk                                    (clk),
      .clk_27                                 (clk_27),
      .reset_n                                (reset_n),
      .sdram_clk                              (sdram_clk),
      .sys_clk                                (sys_clk),
      .vga_clk                                (vga_clk),
      .zs_addr_from_the_SDRAM                 (zs_addr_from_the_SDRAM),
      .zs_ba_from_the_SDRAM                   (zs_ba_from_the_SDRAM),
      .zs_cas_n_from_the_SDRAM                (zs_cas_n_from_the_SDRAM),
      .zs_cke_from_the_SDRAM                  (zs_cke_from_the_SDRAM),
      .zs_cs_n_from_the_SDRAM                 (zs_cs_n_from_the_SDRAM),
      .zs_dq_to_and_from_the_SDRAM            (zs_dq_to_and_from_the_SDRAM),
      .zs_dqm_from_the_SDRAM                  (zs_dqm_from_the_SDRAM),
      .zs_ras_n_from_the_SDRAM                (zs_ras_n_from_the_SDRAM),
      .zs_we_n_from_the_SDRAM                 (zs_we_n_from_the_SDRAM)
    );

  initial
    clk = 1'b0;
  always
    #10 clk <= ~clk;
  
  initial
    clk_27 = 1'b0;
  always
     if (clk_27 == 1'b1) 
    #18 clk_27 <= ~clk_27;
     else 
    #19 clk_27 <= ~clk_27;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on