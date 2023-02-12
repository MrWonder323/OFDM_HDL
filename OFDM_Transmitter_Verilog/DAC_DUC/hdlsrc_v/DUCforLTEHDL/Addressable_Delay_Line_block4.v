// -------------------------------------------------------------
// 
// File Name: hdlsrc_v\DUCforLTEHDL\Addressable_Delay_Line_block4.v
// Created: 2023-02-09 10:49:26
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Addressable_Delay_Line_block4
// Source Path: DUCforLTEHDL/HDL_DUC/Lowpass Interpolator/DUCforLTEHDL/HDL_DUC/Lowpass Interpolator/FIRFilter1/Addressable 
// Delay Lin
// Hierarchy Level: 3
// 
// Addressable Delay Line
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Addressable_Delay_Line_block4
          (clk,
           reset,
           enb,
           dataIn,
           wrEn,
           wrAddr,
           rdAddr,
           delayLineEnd,
           dataOut);


  input   clk;
  input   reset;
  input   enb;
  input   signed [15:0] dataIn;  // sfix16_En15
  input   wrEn;
  input   [3:0] wrAddr;  // ufix4
  input   [3:0] rdAddr;  // ufix4
  output  signed [15:0] delayLineEnd;  // sfix16_En15
  output  signed [15:0] dataOut;  // sfix16_En15


  wire relop_relop1;
  reg  dataEndEn;
  wire wrEnN;
  wire dataEndEnS;
  wire signed [15:0] delayedSignals;  // sfix16_En15
  reg signed [15:0] delayLineEnd_1;  // sfix16_En15


  assign relop_relop1 = wrAddr == rdAddr;



  always @(posedge clk or posedge reset)
    begin : dataOutReg_process
      if (reset == 1'b1) begin
        dataEndEn <= 1'b0;
      end
      else begin
        if (enb) begin
          dataEndEn <= relop_relop1;
        end
      end
    end



  assign wrEnN =  ~ dataEndEn;



  assign dataEndEnS = relop_relop1 & wrEnN;



  SimpleDualPortRAM_generic #(.AddrWidth(4),
                              .DataWidth(16)
                              )
                            u_simpleDualPortRam (.clk(clk),
                                                 .enb(enb),
                                                 .wr_din(dataIn),
                                                 .wr_addr(wrAddr),
                                                 .wr_en(wrEn),
                                                 .rd_addr(rdAddr),
                                                 .rd_dout(delayedSignals)
                                                 );

  always @(posedge clk or posedge reset)
    begin : dataOutReg_1_process
      if (reset == 1'b1) begin
        delayLineEnd_1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && dataEndEnS) begin
          delayLineEnd_1 <= delayedSignals;
        end
      end
    end



  assign dataOut = delayedSignals;

  assign delayLineEnd = delayLineEnd_1;

endmodule  // Addressable_Delay_Line_block4

