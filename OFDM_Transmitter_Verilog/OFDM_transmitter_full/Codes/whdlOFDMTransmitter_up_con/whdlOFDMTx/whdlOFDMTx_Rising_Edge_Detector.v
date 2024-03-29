// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Rising_Edge_Detector.v
// Created: 2023-02-23 11:56:50
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Rising_Edge_Detector
// Source Path: whdlOFDMTx/Frame Controller and Input Sampler/Frame Controller/Generate OFDM Modulator Ready/Rising 
// Edge Detecto
// Hierarchy Level: 6
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Rising_Edge_Detector
          (clk,
           reset,
           enb_1_2_0,
           in,
           out);


  input   clk;
  input   reset;
  input   enb_1_2_0;
  input   in;
  output  out;


  wire Logical_Operator2_out1;
  reg  Delay_out1;
  wire Logical_Operator1_out1;


  assign Logical_Operator2_out1 =  ~ in;



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay_out1 <= Logical_Operator2_out1;
        end
      end
    end



  assign Logical_Operator1_out1 = Delay_out1 & in;



  assign out = Logical_Operator1_out1;

endmodule  // whdlOFDMTx_Rising_Edge_Detector

