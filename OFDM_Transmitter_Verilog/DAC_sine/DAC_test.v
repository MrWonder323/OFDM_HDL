`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2023 11:59:17 AM
// Design Name: 
// Module Name: DAC_test
// Project Name: 
// Target Devices: 
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


module DAC_test(

    );

    reg clk_in, rst; 
//    wire D1, D2, CLK_OUT, nSYNC, DONE;
wire [7:0] phase;
//    reg clk_enable, ValidIn;
//    wire Out2, test_o;

    DUC_DAC DUT1(
        .clk_in(clk_in),
        .rst(rst),
        // DAC
//        .D1(D1),
//        .D2(D2),
//        .CLK_OUT(CLK_OUT),
//        .nSYNC(nSYNC),
//        .DONE(DONE)
        // DUC
//        .clk_enable(clk_enable),
//        .ValidIn(ValidIn),
//        .Out2(Out2),
//        .test_o(test_o)
        .phase(phase)  
    );

//    reg clk_in,rst;
//    reg clk_16;
//    wire [7:0] phase;
//    wire D1, D2, CLK_OUT, nSYNC, DONE;
//    reg START;
    
//    Sine_LUT DUT2(
//    .clk(clk_16),
//    .rst(rst),
//    .phase(phase)
//    );   
    
//    DA2RefComp DAC( 
//    //General usage
//    .CLK(clk_in),    // System Clock (50MHz)     
//    .RST(rst),    // Positive Edge Reset
//    //Pmod interface signals
//    .D1(D1),
//    .D2(D2),
//    .CLK_OUT(CLK_OUT),
//    .nSYNC(nSYNC),
//    //User interface signals
//    .DATA1({1'b0,phase,3'b0}),
//    .DATA2(0),
//    .START(START),
//    .DONE(DONE)   
//    );            
    
    always begin
        #5 clk_in = ~clk_in; 
    end
    
//    always begin
//        #80 clk_16 = ~clk_16; 
//    end

    initial begin
        clk_in = 0;
//        clk_16 = 0;
//        START = 0;
//        ValidIn = 1;
        rst = 1;
//        clk_enable = 1;
        #17 rst = 0;
//        START = 1;
//        #10 START = 0;
//        #170 START = 1;
//        #10 START = 0;
//        #170 START = 1;
//        #10 START = 0;
    end
endmodule
