`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marwan Ahmed Elsayed
// 
// Create Date: 02/05/2023 09:14:00 AM
// Design Name: DUC to DAC Connection
// Module Name: DUC_DAC
// Project Name: OFDM
// Target Devices: Zedboard 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DUC_DAC(
  input clk_in,
  input   rst,
  input   clk_enable,
  input   [1:0] modTypeIndex,  // ufix2
  input   [1:0] codeRateIndex,  // ufix2
  input   data,
  input   valid,
  
  output  ce_out_0,
  output  ce_out_1,
  output  txValid,
//  output  signed [15:0] txData_re,  // sfix16_En13
//  output  signed [15:0] txData_im,  // sfix16_En13
  output  Out3,
  output  signed [15:0] Out4_re_out,  // sfix18_En16
//  output  signed [15:0] Out4_im_out,  // sfix18_En16
  output  ready
  );

  ///////////////////////
  // Wires And Registers
  //////////////////////

  wire signed [17:0] txData_re;
  wire signed [17:0] txData_im;
  
  wire signed [17:0] Out4_re;
  wire signed [17:0] Out4_im;

//  assign Out4_im_out = {!Out4_im[17], Out4_im[16:2]};
  assign Out4_re_out = {!Out4_re[17], Out4_re[16:2]};


//  wire clk_out1;
//  reg [1:0] clk;
//  wire clk;
  

  ///////////////////////
  // Clock Logic
  //////////////////////

//  always @(posedge clk_out1 or posedge rst) begin
//    if (rst == 1'b1) begin
//      clk <= 0;
//    end
//    else begin
//      clk <= clk+1;
//    end
//  end
    

  ///////////////////////
  // Instantiations
  //////////////////////    
    
  OFDM_UC OFDM_UC1(.clk_in(clk_in),
           .reset(rst),  // Positive Edge Reset
           .clk_enable(clk_enable),
           .modTypeIndex(modTypeIndex),
           .codeRateIndex(codeRateIndex),
           .data(data),
           .valid(valid),
           .ce_out_0(ce_out_0),
           .ce_out_1(ce_out_1),
           .txValid(txValid),
           .txData_re(txData_re),
           .txData_im(txData_im),
           .Out3(Out3),
           .Out4_re(Out4_re),
           .Out4_im(Out4_im),
           .ready(ready));
        
          
//  clk_wiz_0 clk_wiz_inst(
//    // Clock out ports
//    .clk_out1(clk), // DAC Clock 
//    // Clock in ports
//    .clk_in1(clk_in)
//    );
    
endmodule
