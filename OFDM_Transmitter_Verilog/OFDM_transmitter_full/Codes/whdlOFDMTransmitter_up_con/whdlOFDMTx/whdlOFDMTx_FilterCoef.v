// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_FilterCoef.v
// Created: 2023-02-23 11:56:51
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_FilterCoef
// Source Path: whdlOFDMTx/Discrete FIR Filter/Filter/FilterCoef
// Hierarchy Level: 5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_FilterCoef
          (CoefOut_0,
           CoefOut_1,
           CoefOut_2,
           CoefOut_3,
           CoefOut_4,
           CoefOut_5,
           CoefOut_6,
           CoefOut_7,
           CoefOut_8,
           CoefOut_9,
           CoefOut_10);


  output  signed [15:0] CoefOut_0;  // sfix16_En15
  output  signed [15:0] CoefOut_1;  // sfix16_En15
  output  signed [15:0] CoefOut_2;  // sfix16_En15
  output  signed [15:0] CoefOut_3;  // sfix16_En15
  output  signed [15:0] CoefOut_4;  // sfix16_En15
  output  signed [15:0] CoefOut_5;  // sfix16_En15
  output  signed [15:0] CoefOut_6;  // sfix16_En15
  output  signed [15:0] CoefOut_7;  // sfix16_En15
  output  signed [15:0] CoefOut_8;  // sfix16_En15
  output  signed [15:0] CoefOut_9;  // sfix16_En15
  output  signed [15:0] CoefOut_10;  // sfix16_En15


  wire signed [15:0] CoefData;  // sfix16_En15
  wire signed [15:0] CoefData_1;  // sfix16_En15
  wire signed [15:0] CoefData_2;  // sfix16_En15
  wire signed [15:0] CoefData_3;  // sfix16_En15
  wire signed [15:0] CoefData_4;  // sfix16_En15
  wire signed [15:0] CoefData_5;  // sfix16_En15
  wire signed [15:0] CoefData_6;  // sfix16_En15
  wire signed [15:0] CoefData_7;  // sfix16_En15
  wire signed [15:0] CoefData_8;  // sfix16_En15
  wire signed [15:0] CoefData_9;  // sfix16_En15
  wire signed [15:0] CoefData_10;  // sfix16_En15


  // CoefReg_1
  assign CoefData = 16'sb0000000000010010;



  assign CoefOut_0 = CoefData;

  // CoefReg_2
  assign CoefData_1 = 16'sb1111111111011001;



  assign CoefOut_1 = CoefData_1;

  // CoefReg_3
  assign CoefData_2 = 16'sb0000000001000101;



  assign CoefOut_2 = CoefData_2;

  // CoefReg_4
  assign CoefData_3 = 16'sb1111111110011101;



  assign CoefOut_3 = CoefData_3;

  // CoefReg_5
  assign CoefData_4 = 16'sb0000000001111010;



  assign CoefOut_4 = CoefData_4;

  // CoefReg_6
  assign CoefData_5 = 16'sb0111111101111110;



  assign CoefOut_5 = CoefData_5;

  // CoefReg_7
  assign CoefData_6 = 16'sb0000000001111010;



  assign CoefOut_6 = CoefData_6;

  // CoefReg_8
  assign CoefData_7 = 16'sb1111111110011101;



  assign CoefOut_7 = CoefData_7;

  // CoefReg_9
  assign CoefData_8 = 16'sb0000000001000101;



  assign CoefOut_8 = CoefData_8;

  // CoefReg_10
  assign CoefData_9 = 16'sb1111111111011001;



  assign CoefOut_9 = CoefData_9;

  // CoefReg_11
  assign CoefData_10 = 16'sb0000000000010010;



  assign CoefOut_10 = CoefData_10;

endmodule  // whdlOFDMTx_FilterCoef
