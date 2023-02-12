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
//  input   sysclk_p, sysclk_n,
  input clk_in,
  input   rst,

  // DAC
  // input   [11:0] DATA1, DATA2,
//  output  D1,
//  output  D2,
//  output  CLK_OUT,
//  output  nSYNC,
//  output  DONE

  // DUC
//  input   clk_enable,
//  input   ValidIn,

//  output  ce_out,
  // output  signed [17:0] Out1_re,  // sfix18_En16
  // output  signed [17:0] Out1_im,  // sfix18_En16
  
//  output  Out2,
//  output  test_o
 
  // Sine
   output [7:0] phase,
//   output clk_output,
   output [7:0] count_o
  );

  ///////////////////////
  // Wires And Registers
  //////////////////////

  // DAC
//  wire START;
  
//  wire [7:0] phase;

  // DUC
//  wire signed [15:0] dataIn_re = 16'h1000; // sfix16_En13
//  wire signed [15:0] dataIn_im = 16'h1000; // sfix16_En13
//  wire signed [17:0] Out1_re;
//  wire signed [17:0] Out1_im;

  // assign Out1_im_out = Out1_im[17:6];
  // assign Out1_re_out = Out1_re[17:6];
  
//  wire ValidIn;
  wire  ce_out;

  // Clk
//  wire clk_inter1;
  wire clk_out1;
//  reg clk_inter2;
  reg [1:0] clk;
  
//  assign clk_output = clk[1];

  ///////////////////////
  // Clock Logic
  //////////////////////

  always @(posedge clk_out1 or posedge rst) begin
    if (rst == 1'b1) begin
      clk <= 0;
    end
    else begin
      clk <= clk+1;
    end
  end
    
//  always @(posedge clk_inter2 or posedge rst) begin
//    if (rst == 1'b1) begin
//      clk <= 0;
//    end
//    else begin
//      clk <= !clk;
//    end
//  end
    



  ///////////////////////
  // Instantiations
  //////////////////////    
    
//  DA2RefComp DAC( 
//    //General usage
//    .CLK(clk),    // System Clock (50MHz)     
//    .RST(rst),    // Positive Edge Reset
//    //Pmod interface signals
//    .D1(D1),
//    .D2(D2),
//    .CLK_OUT(CLK_OUT),
//    .nSYNC(nSYNC),
//    //User interface signals
////    .DATA1(Out1_re[17:6]),
////    .DATA2(Out1_im[17:6]),
//    .DATA1({phase,4'b0}),
//    .DATA2(0),
//    .START(1'b1),
//    .DONE(DONE)   
//    );
        
//  HDL_DUC DUC(
//    .clk(clk),
//    .reset(rst),  // Positive Edge Reset
//    .clk_enable(clk_enable),
//    .dataIn_re(dataIn_re),
//    .dataIn_im(dataIn_im),
//    .ValidIn(ValidIn), // check
//    .ce_out(ce_out),
//    .Out1_re(Out1_re),
//    .Out1_im(Out1_im),
//    .Out2(Out2),
//    .test_o(test_o)
//    );
          
  clk_wiz_0 clk_wiz_inst(
    // Clock out ports
    .clk_out1(clk_out1), // DAC Clock 
//    .clk_out2(clk_inter1),
    // Status and control signals               
    //  .reset(reset), 
    //  .locked(locked),
    // Clock in ports
    .clk_in1(clk_in)
    );
    
//    clk_wiz_1 clk_wiz_inst
// (
//  // Clock out ports
//  .clk_out1(clk_out1), // DAC Clock 
////  .clk_out2(clk_inter1),
// // Clock in ports
//  .clk_in1_n(sysclk_n),
//  .clk_in1_p(sysclk_p)
// );
    
    Sine_LUT sin(
    .clk(clk[1]),
    .rst(rst),
    .phase(phase),
    .count_o(count_o)
    ); 
endmodule
