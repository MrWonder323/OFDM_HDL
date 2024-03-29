// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\whdlOFDMTransmitter_up_con\OFDM_UC.v
// Created: 2023-03-08 15:37:28
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 2.44141e-07
// Target subsystem base rate: 2.44141e-07
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out_1      4.88281e-07
// ce_out_0      7.8125e-06
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// txValid                       ce_out_0      7.8125e-06
// txData_re                     ce_out_0      7.8125e-06
// txData_im                     ce_out_0      7.8125e-06
// Out3                          ce_out_0      7.8125e-06
// Out4_re                       ce_out_0      7.8125e-06
// Out4_im                       ce_out_0      7.8125e-06
// ready                         ce_out_1      4.88281e-07
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: OFDM_UC
// Source Path: whdlOFDMTransmitter_up_con/OFDM_UC
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module OFDM_UC
          (clk,
           reset,
           clk_enable,
           modTypeIndex,
           codeRateIndex,
           data,
           valid,
           ce_out_0,
           ce_out_1,
           txValid,
           txData_re,
           txData_im,
           Out3,
           Out4_re,
           Out4_im,
           ready);


  input   clk;
  input   reset;
  input   clk_enable;
  input   [1:0] modTypeIndex;  // ufix2
  input   [1:0] codeRateIndex;  // ufix2
  input   data;
  input   valid;
  output  ce_out_0;
  output  ce_out_1;
  output  txValid;
  output  signed [15:0] txData_re;  // sfix16_En13
  output  signed [15:0] txData_im;  // sfix16_En13
  output  Out3;
  output  signed [17:0] Out4_re;  // sfix18_En16
  output  signed [17:0] Out4_im;  // sfix18_En16
  output  ready;


  wire enb_1_32_0;
  wire enb;
  wire enb_1_2_0;
  wire enb_1_32_1;
  wire enb_1_2_1;
  wire signed [15:0] OFDM_Transmitter_out1_re;  // sfix16_En13
  wire signed [15:0] OFDM_Transmitter_out1_im;  // sfix16_En13
  wire OFDM_Transmitter_out2;
  wire OFDM_Transmitter_out3;
  wire signed [17:0] HDL_DUC_out1_re;  // sfix18_En16
  wire signed [17:0] HDL_DUC_out1_im;  // sfix18_En16
  wire HDL_DUC_out2;


  OFDM_UC_tc u_OFDM_UC_tc (.clk(clk),
                           .reset(reset),
                           .clk_enable(clk_enable),
                           .enb(enb),
                           .enb_1_2_0(enb_1_2_0),
                           .enb_1_2_1(enb_1_2_1),
                           .enb_1_32_0(enb_1_32_0),
                           .enb_1_32_1(enb_1_32_1)
                           );

  OFDM_Transmitter u_OFDM_Transmitter (.clk(clk),
                                       .reset(reset),
                                       .enb_1_32_0(enb_1_32_0),
                                       .enb(enb),
                                       .enb_1_2_0(enb_1_2_0),
                                       .enb_1_32_1(enb_1_32_1),
                                       .modTypeIndex(modTypeIndex),  // ufix2
                                       .codeRateIndex(codeRateIndex),  // ufix2
                                       .data(data),
                                       .valid(valid),
                                       .txData_re(OFDM_Transmitter_out1_re),  // sfix16_En13
                                       .txData_im(OFDM_Transmitter_out1_im),  // sfix16_En13
                                       .txValid(OFDM_Transmitter_out2),
                                       .ready(OFDM_Transmitter_out3)
                                       );

  assign txValid = OFDM_Transmitter_out2;

  assign txData_re = OFDM_Transmitter_out1_re;

  assign txData_im = OFDM_Transmitter_out1_im;

  HDL_DUC u_HDL_DUC (.clk(clk),
                     .reset(reset),
                     .enb_1_32_0(enb_1_32_0),
                     .dataIn_re(OFDM_Transmitter_out1_re),  // sfix16_En13
                     .dataIn_im(OFDM_Transmitter_out1_im),  // sfix16_En13
                     .ValidIn(OFDM_Transmitter_out2),
                     .Out1_re(HDL_DUC_out1_re),  // sfix18_En16
                     .Out1_im(HDL_DUC_out1_im),  // sfix18_En16
                     .Out2(HDL_DUC_out2)
                     );

  assign Out3 = HDL_DUC_out2;

  assign Out4_re = HDL_DUC_out1_re;

  assign Out4_im = HDL_DUC_out1_im;

  assign ready = OFDM_Transmitter_out3;

  assign ce_out_0 = enb_1_32_1;

  assign ce_out_1 = enb_1_2_1;

endmodule  // OFDM_UC

