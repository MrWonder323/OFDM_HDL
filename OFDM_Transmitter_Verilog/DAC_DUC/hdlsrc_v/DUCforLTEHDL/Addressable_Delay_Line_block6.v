// -------------------------------------------------------------
// 
// File Name: hdlsrc_v\DUCforLTEHDL\Addressable_Delay_Line_block6.v
// Created: 2023-02-09 10:49:26
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Addressable_Delay_Line_block6
// Source Path: DUCforLTEHDL/HDL_DUC/Lowpass Interpolator/DUCforLTEHDL/HDL_DUC/Lowpass Interpolator/FIRFilter1/Addressable 
// Delay Lin
// Hierarchy Level: 3
// 
// Addressable Delay Line
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Addressable_Delay_Line_block6
          (clk,
           reset,
           enb,
           dataIn,
           validIn,
           lutaddr,
           delayLineEnd,
           dataOut);


  input   clk;
  input   reset;
  input   enb;
  input   signed [15:0] dataIn;  // sfix16_En15
  input   validIn;
  input   [3:0] lutaddr;  // ufix4
  output  signed [15:0] delayLineEnd;  // sfix16_En15
  output  signed [15:0] dataOut;  // sfix16_En15


  reg signed [15:0] delayedSignals0;  // sfix16_En15
  reg signed [15:0] delayedSignals1;  // sfix16_En15
  reg signed [15:0] delayedSignals2;  // sfix16_En15
  reg signed [15:0] delayedSignals3;  // sfix16_En15
  reg signed [15:0] delayedSignals4;  // sfix16_En15
  reg signed [15:0] delayedSignals5;  // sfix16_En15
  reg signed [15:0] delayedSignals6;  // sfix16_En15
  reg signed [15:0] delayedSignals7;  // sfix16_En15
  reg signed [15:0] delayedSignals8;  // sfix16_En15
  reg signed [15:0] delayedSignals9;  // sfix16_En15
  reg signed [15:0] delayedSignals10;  // sfix16_En15
  wire signed [15:0] ZEROCONST;  // sfix16_En15
  wire signed [15:0] switchDataOut;  // sfix16_En15
  reg signed [15:0] dataOut_1;  // sfix16_En15


  always @(posedge clk or posedge reset)
    begin : delay0_process
      if (reset == 1'b1) begin
        delayedSignals0 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals0 <= dataIn;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : delay1_process
      if (reset == 1'b1) begin
        delayedSignals1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals1 <= delayedSignals0;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : delay2_process
      if (reset == 1'b1) begin
        delayedSignals2 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals2 <= delayedSignals1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : delay3_process
      if (reset == 1'b1) begin
        delayedSignals3 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals3 <= delayedSignals2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : delay4_process
      if (reset == 1'b1) begin
        delayedSignals4 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals4 <= delayedSignals3;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : delay5_process
      if (reset == 1'b1) begin
        delayedSignals5 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals5 <= delayedSignals4;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : delay6_process
      if (reset == 1'b1) begin
        delayedSignals6 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals6 <= delayedSignals5;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : delay7_process
      if (reset == 1'b1) begin
        delayedSignals7 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals7 <= delayedSignals6;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : delay8_process
      if (reset == 1'b1) begin
        delayedSignals8 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals8 <= delayedSignals7;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : delay9_process
      if (reset == 1'b1) begin
        delayedSignals9 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals9 <= delayedSignals8;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : delay10_process
      if (reset == 1'b1) begin
        delayedSignals10 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals10 <= delayedSignals9;
        end
      end
    end



  assign delayLineEnd = delayedSignals10;

  assign ZEROCONST = 16'sb0000000000000000;



  assign switchDataOut = (lutaddr == 4'b0000 ? delayedSignals10 :
              (lutaddr == 4'b0001 ? delayedSignals9 :
              (lutaddr == 4'b0010 ? delayedSignals8 :
              (lutaddr == 4'b0011 ? delayedSignals7 :
              (lutaddr == 4'b0100 ? delayedSignals6 :
              (lutaddr == 4'b0101 ? delayedSignals5 :
              (lutaddr == 4'b0110 ? delayedSignals4 :
              (lutaddr == 4'b0111 ? delayedSignals3 :
              (lutaddr == 4'b1000 ? delayedSignals2 :
              (lutaddr == 4'b1001 ? delayedSignals1 :
              (lutaddr == 4'b1010 ? delayedSignals0 :
              (lutaddr == 4'b1011 ? ZEROCONST :
              (lutaddr == 4'b1100 ? ZEROCONST :
              (lutaddr == 4'b1101 ? ZEROCONST :
              ZEROCONST))))))))))))));



  always @(posedge clk or posedge reset)
    begin : dataOutReg_process
      if (reset == 1'b1) begin
        dataOut_1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb) begin
          dataOut_1 <= switchDataOut;
        end
      end
    end



  assign dataOut = dataOut_1;

endmodule  // Addressable_Delay_Line_block6

