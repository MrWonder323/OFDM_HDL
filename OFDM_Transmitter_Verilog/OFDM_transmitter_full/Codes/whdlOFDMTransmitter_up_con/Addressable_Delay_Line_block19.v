// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\whdlOFDMTransmitter_up_con\Addressable_Delay_Line_block19.v
// Created: 2023-02-23 11:56:52
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Addressable_Delay_Line_block19
// Source Path: whdlOFDMTransmitter_up_con/OFDM_UC/HDL_DUC/Lowpass Interpolator/whdlOFDMTransmitter_up_con/OFDM_UC/HDL_DUC/Lowpass 
// Interpolator/FIRFilter1/Addressable Delay Lin
// Hierarchy Level: 4
// 
// Addressable Delay Line
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Addressable_Delay_Line_block19
          (clk,
           reset,
           enb_1_32_0,
           dataIn,
           validIn,
           rdAddr,
           delayLineEnd,
           dataOut);


  input   clk;
  input   reset;
  input   enb_1_32_0;
  input   signed [15:0] dataIn;  // sfix16_En13
  input   validIn;
  input   [3:0] rdAddr;  // ufix4
  output  signed [15:0] delayLineEnd;  // sfix16_En13
  output  signed [15:0] dataOut;  // sfix16_En13


  reg signed [15:0] delayedSignals0;  // sfix16_En13
  wire rdCompare;
  wire signed [15:0] ZEROCONST;  // sfix16_En13
  wire signed [15:0] switchDataOut;  // sfix16_En13
  reg signed [15:0] dataOut_1;  // sfix16_En13


  always @(posedge clk or posedge reset)
    begin : delay0_process
      if (reset == 1'b1) begin
        delayedSignals0 <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0 && validIn) begin
          delayedSignals0 <= dataIn;
        end
      end
    end



  assign delayLineEnd = delayedSignals0;

  assign rdCompare = rdAddr > 4'b0000;



  assign ZEROCONST = 16'sb0000000000000000;



  assign switchDataOut = (rdCompare == 1'b0 ? delayedSignals0 :
              ZEROCONST);



  always @(posedge clk or posedge reset)
    begin : dataOutReg_process
      if (reset == 1'b1) begin
        dataOut_1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0) begin
          dataOut_1 <= switchDataOut;
        end
      end
    end



  assign dataOut = dataOut_1;

endmodule  // Addressable_Delay_Line_block19
