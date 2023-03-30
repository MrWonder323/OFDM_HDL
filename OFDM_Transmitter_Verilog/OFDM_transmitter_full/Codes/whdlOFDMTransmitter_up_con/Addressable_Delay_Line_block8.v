// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\whdlOFDMTransmitter_up_con\Addressable_Delay_Line_block8.v
// Created: 2023-03-08 15:37:28
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Addressable_Delay_Line_block8
// Source Path: whdlOFDMTransmitter_up_con/OFDM_UC/HDL_DUC/Halfband Interpolator/whdlOFDMTransmitter_up_con/OFDM_UC/HDL_DUC/Halfband 
// Interpolator/FIRFilter2/Addressable Delay Lin
// Hierarchy Level: 4
// 
// Addressable Delay Line
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Addressable_Delay_Line_block8
          (clk,
           enb_1_32_0,
           dataIn,
           wrEn,
           wrAddr,
           rdAddr,
           dataOut);


  input   clk;
  input   enb_1_32_0;
  input   signed [17:0] dataIn;  // sfix18_En14
  input   wrEn;
  input   [2:0] wrAddr;  // ufix3
  input   [2:0] rdAddr;  // ufix3
  output  signed [17:0] dataOut;  // sfix18_En14


  wire signed [17:0] delayedSignals;  // sfix18_En14


  SimpleDualPortRAM_generic #(.AddrWidth(3),
                              .DataWidth(18)
                              )
                            u_simpleDualPortRam (.clk(clk),
                                                 .enb_1_32_0(enb_1_32_0),
                                                 .wr_din(dataIn),
                                                 .wr_addr(wrAddr),
                                                 .wr_en(wrEn),
                                                 .rd_addr(rdAddr),
                                                 .rd_dout(delayedSignals)
                                                 );

  assign dataOut = delayedSignals;

endmodule  // Addressable_Delay_Line_block8
