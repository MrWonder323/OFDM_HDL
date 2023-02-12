// -------------------------------------------------------------
// 
// File Name: hdlsrc_v\DUCforLTEHDL\FilterTapSystolic_block.v
// Created: 2023-02-09 10:49:26
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: FilterTapSystolic_block
// Source Path: DUCforLTEHDL/HDL_DUC/CIC Compensation Interpolator/DUCforLTEHDL/HDL_DUC/CIC Compensation Interpolator/FIRFilter2/FilterTapSystolic
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module FilterTapSystolic_block
          (clk,
           enb,
           din_re,
           coeff,
           sumIn,
           sumOut);


  input   clk;
  input   enb;
  input   signed [17:0] din_re;  // sfix18_En14
  input   signed [17:0] coeff;  // sfix18_En16
  input   signed [35:0] sumIn;  // sfix36_En30
  output  signed [35:0] sumOut;  // sfix36_En30


  reg signed [17:0] fTap_din_reg1;  // sfix18
  reg signed [17:0] fTap_coef_reg1;  // sfix18
  reg signed [17:0] fTap_din_reg2;  // sfix18
  reg signed [17:0] fTap_coef_reg2;  // sfix18
  reg signed [35:0] fTap_mult_reg;  // sfix36
  reg signed [35:0] sumOut_1;  // sfix36_En30

  initial begin
    fTap_din_reg1 = 18'sb000000000000000000;
    fTap_coef_reg1 = 18'sb000000000000000000;
    fTap_din_reg2 = 18'sb000000000000000000;
    fTap_coef_reg2 = 18'sb000000000000000000;
    fTap_mult_reg = 36'sh000000000;
    sumOut_1 = 36'sh000000000;
  end

  // FilterTapSystolicS
  always @(posedge clk)
    begin : fTap_process
      if (enb) begin
        sumOut_1 <= fTap_mult_reg + sumIn;
        fTap_mult_reg <= fTap_din_reg2 * fTap_coef_reg2;
        fTap_din_reg2 <= fTap_din_reg1;
        fTap_coef_reg2 <= fTap_coef_reg1;
        fTap_din_reg1 <= din_re;
        fTap_coef_reg1 <= coeff;
      end
    end



  assign sumOut = sumOut_1;

endmodule  // FilterTapSystolic_block

