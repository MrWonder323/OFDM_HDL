// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Data.v
// Created: 2023-02-23 11:56:51
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Data
// Source Path: whdlOFDMTx/Frame Generator/Data
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Data
          (clk,
           reset,
           enb,
           enb_1_2_0,
           dataSet,
           modTypeIndex,
           codeRateIndex,
           loadModulator,
           trBlkSize,
           dataIn,
           wrEnable,
           resetRAM,
           data_re,
           data_im,
           valid);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1_2_0;
  input   dataSet;
  input   [1:0] modTypeIndex;  // ufix2
  input   [1:0] codeRateIndex;  // ufix2
  input   loadModulator;
  input   [13:0] trBlkSize;  // ufix14
  input   dataIn;
  input   wrEnable;
  input   resetRAM;
  output  signed [15:0] data_re;  // sfix16_En14
  output  signed [15:0] data_im;  // sfix16_En14
  output  valid;


  wire Data_and_Control_Signal_Generation_out1;
  wire Data_and_Control_Signal_Generation_out2;
  wire Data_and_Control_Signal_Generation_out3;
  wire Data_and_Control_Signal_Generation_out4;
  wire puncVec_0;
  wire puncVec_1;
  wire puncVec_2;
  wire puncVec_3;
  wire puncVec_4;
  wire puncVec_5;
  wire puncVec_6;
  wire puncVec_7;
  wire puncVec_8;
  wire puncVec_9;
  wire [1:0] Data_and_Control_Signal_Generation_out6;  // ufix2
  wire Data_and_Control_Signal_Generation_out7;
  wire [0:9] puncVec;  // boolean [10]
  wire signed [15:0] Data_Chain_out1_re;  // sfix16_En14
  wire signed [15:0] Data_Chain_out1_im;  // sfix16_En14
  wire Data_Chain_out2;


  whdlOFDMTx_Data_and_Control_Signal_Generation u_Data_and_Control_Signal_Generation (.clk(clk),
                                                                                      .reset(reset),
                                                                                      .enb_1_2_0(enb_1_2_0),
                                                                                      .dataSet(dataSet),
                                                                                      .modTypeIndex(modTypeIndex),  // ufix2
                                                                                      .codeRateIndex(codeRateIndex),  // ufix2
                                                                                      .loadMod(loadModulator),
                                                                                      .trBlkSize(trBlkSize),  // ufix14
                                                                                      .dataIn(dataIn),
                                                                                      .wrEnable(wrEnable),
                                                                                      .resetRAM(resetRAM),
                                                                                      .data(Data_and_Control_Signal_Generation_out1),
                                                                                      .start(Data_and_Control_Signal_Generation_out2),
                                                                                      .end_rsvd(Data_and_Control_Signal_Generation_out3),
                                                                                      .valid(Data_and_Control_Signal_Generation_out4),
                                                                                      .puncVector_0(puncVec_0),  // boolean
                                                                                      .puncVector_1(puncVec_1),  // boolean
                                                                                      .puncVector_2(puncVec_2),  // boolean
                                                                                      .puncVector_3(puncVec_3),  // boolean
                                                                                      .puncVector_4(puncVec_4),  // boolean
                                                                                      .puncVector_5(puncVec_5),  // boolean
                                                                                      .puncVector_6(puncVec_6),  // boolean
                                                                                      .puncVector_7(puncVec_7),  // boolean
                                                                                      .puncVector_8(puncVec_8),  // boolean
                                                                                      .puncVector_9(puncVec_9),  // boolean
                                                                                      .modTypeInd(Data_and_Control_Signal_Generation_out6),  // ufix2
                                                                                      .loadModulator(Data_and_Control_Signal_Generation_out7)
                                                                                      );

  assign puncVec[0] = puncVec_0;
  assign puncVec[1] = puncVec_1;
  assign puncVec[2] = puncVec_2;
  assign puncVec[3] = puncVec_3;
  assign puncVec[4] = puncVec_4;
  assign puncVec[5] = puncVec_5;
  assign puncVec[6] = puncVec_6;
  assign puncVec[7] = puncVec_7;
  assign puncVec[8] = puncVec_8;
  assign puncVec[9] = puncVec_9;

  whdlOFDMTx_Data_Chain u_Data_Chain (.clk(clk),
                                      .reset(reset),
                                      .enb(enb),
                                      .enb_1_2_0(enb_1_2_0),
                                      .dataIn(Data_and_Control_Signal_Generation_out1),
                                      .startIn(Data_and_Control_Signal_Generation_out2),
                                      .endIn(Data_and_Control_Signal_Generation_out3),
                                      .validIn(Data_and_Control_Signal_Generation_out4),
                                      .puncVector_0(puncVec[0]),  // boolean
                                      .puncVector_1(puncVec[1]),  // boolean
                                      .puncVector_2(puncVec[2]),  // boolean
                                      .puncVector_3(puncVec[3]),  // boolean
                                      .puncVector_4(puncVec[4]),  // boolean
                                      .puncVector_5(puncVec[5]),  // boolean
                                      .puncVector_6(puncVec[6]),  // boolean
                                      .puncVector_7(puncVec[7]),  // boolean
                                      .puncVector_8(puncVec[8]),  // boolean
                                      .puncVector_9(puncVec[9]),  // boolean
                                      .modTypeInd(Data_and_Control_Signal_Generation_out6),  // ufix2
                                      .loadModulator(Data_and_Control_Signal_Generation_out7),
                                      .data_re(Data_Chain_out1_re),  // sfix16_En14
                                      .data_im(Data_Chain_out1_im),  // sfix16_En14
                                      .valid(Data_Chain_out2)
                                      );

  assign data_re = Data_Chain_out1_re;

  assign data_im = Data_Chain_out1_im;

  assign valid = Data_Chain_out2;

endmodule  // whdlOFDMTx_Data
