// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\whdlOFDMTransmitter_up_con\FirRdyLogic.v
// Created: 2023-03-08 15:37:28
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: FirRdyLogic
// Source Path: whdlOFDMTransmitter_up_con/OFDM_UC/HDL_DUC/CIC Compensation Interpolator/whdlOFDMTransmitter_up_con/OFDM_UC/HDL_DUC/CIC 
// Compensation Interpolator/FIRFilter1/FirRdyLogi
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module FirRdyLogic
          (clk,
           reset,
           enb_1_32_0,
           dataIn_re,
           dataIn_im,
           validIn,
           dinSM_re,
           dinSM_im,
           dinVldSM);


  input   clk;
  input   reset;
  input   enb_1_32_0;
  input   signed [17:0] dataIn_re;  // sfix18_En14
  input   signed [17:0] dataIn_im;  // sfix18_En14
  input   validIn;
  output  signed [17:0] dinSM_re;  // sfix18_En14
  output  signed [17:0] dinSM_im;  // sfix18_En14
  output  dinVldSM;


  wire syncReset;
  reg signed [17:0] firRdy_xdin_re;  // sfix18_En14
  reg signed [17:0] firRdy_xdin_im;  // sfix18_En14
  reg  firRdy_xdinVld;
  reg [2:0] firRdy_state;  // ufix3
  reg  firRdy_readyReg;
  reg [1:0] firRdy_count;  // ufix2
  reg signed [17:0] firRdy_xdin_next_re;  // sfix18_En14
  reg signed [17:0] firRdy_xdin_next_im;  // sfix18_En14
  reg  firRdy_xdinVld_next;
  reg [2:0] firRdy_state_next;  // ufix3
  reg  firRdy_readyReg_next;
  reg [1:0] firRdy_count_next;  // ufix2
  reg  readySM;
  reg signed [17:0] dinSM_re_1;  // sfix18_En14
  reg signed [17:0] dinSM_im_1;  // sfix18_En14
  reg  dinVldSM_1;
  reg  firRdy_out2_0;
  reg [1:0] firRdy_count_temp;  // ufix2


  assign syncReset = 1'b0;



  // rdyLogic
  always @(posedge clk or posedge reset)
    begin : firRdy_process
      if (reset == 1'b1) begin
        firRdy_state <= 3'b000;
        firRdy_xdin_re <= 18'sb000000000000000000;
        firRdy_xdin_im <= 18'sb000000000000000000;
        firRdy_xdinVld <= 1'b0;
        firRdy_readyReg <= 1'b1;
        firRdy_count <= 2'b00;
      end
      else begin
        if (enb_1_32_0) begin
          firRdy_xdin_re <= firRdy_xdin_next_re;
          firRdy_xdin_im <= firRdy_xdin_next_im;
          firRdy_xdinVld <= firRdy_xdinVld_next;
          firRdy_state <= firRdy_state_next;
          firRdy_readyReg <= firRdy_readyReg_next;
          firRdy_count <= firRdy_count_next;
        end
      end
    end

  always @(dataIn_im, dataIn_re, firRdy_count, firRdy_readyReg, firRdy_state,
       firRdy_xdinVld, firRdy_xdin_im, firRdy_xdin_re, syncReset, validIn) begin
    firRdy_count_temp = firRdy_count;
    firRdy_xdin_next_re = firRdy_xdin_re;
    firRdy_xdin_next_im = firRdy_xdin_im;
    firRdy_xdinVld_next = firRdy_xdinVld;
    firRdy_state_next = firRdy_state;
    firRdy_readyReg_next = firRdy_readyReg;
    if ( ! syncReset) begin
      case ( firRdy_state)
        3'b000 :
          begin
            dinSM_re_1 = dataIn_re;
            dinSM_im_1 = dataIn_im;
            firRdy_out2_0 = validIn;
            firRdy_state_next = 3'b000;
            firRdy_readyReg_next = 1'b1;
            firRdy_xdin_next_re = 18'sb000000000000000000;
            firRdy_xdin_next_im = 18'sb000000000000000000;
            firRdy_xdinVld_next = 1'b0;
            if (validIn) begin
              firRdy_state_next = 3'b001;
              firRdy_readyReg_next = 1'b0;
            end
          end
        3'b001 :
          begin
            dinSM_re_1 = 18'sb000000000000000000;
            dinSM_im_1 = 18'sb000000000000000000;
            firRdy_out2_0 = 1'b0;
            firRdy_state_next = 3'b011;
            if (validIn) begin
              firRdy_state_next = 3'b010;
              firRdy_xdin_next_re = dataIn_re;
              firRdy_xdin_next_im = dataIn_im;
              firRdy_xdinVld_next = 1'b1;
            end
          end
        3'b010 :
          begin
            dinSM_re_1 = 18'sb000000000000000000;
            dinSM_im_1 = 18'sb000000000000000000;
            firRdy_out2_0 = 1'b0;
            firRdy_state_next = 3'b010;
            if (firRdy_count == 2'b11) begin
              firRdy_state_next = 3'b100;
            end
            firRdy_readyReg_next = 1'b0;
          end
        3'b011 :
          begin
            if (firRdy_count == 2'b11) begin
              firRdy_readyReg_next = 1'b1;
              firRdy_state_next = 3'b000;
            end
            dinSM_re_1 = 18'sb000000000000000000;
            dinSM_im_1 = 18'sb000000000000000000;
            firRdy_out2_0 = 1'b0;
          end
        3'b100 :
          begin
            firRdy_state_next = 3'b011;
            dinSM_re_1 = firRdy_xdin_re;
            dinSM_im_1 = firRdy_xdin_im;
            firRdy_out2_0 = firRdy_xdinVld;
            firRdy_xdin_next_re = dataIn_re;
            firRdy_xdin_next_im = dataIn_im;
            firRdy_xdinVld_next = validIn;
          end
        default :
          begin
            dinSM_re_1 = 18'sb000000000000000000;
            dinSM_im_1 = 18'sb000000000000000000;
            firRdy_out2_0 = 1'b0;
            firRdy_state_next = 3'b000;
            firRdy_xdin_next_re = 18'sb000000000000000000;
            firRdy_xdin_next_im = 18'sb000000000000000000;
            firRdy_xdinVld_next = 1'b0;
            firRdy_readyReg_next = 1'b1;
          end
      endcase
    end
    else begin
      firRdy_state_next = 3'b000;
      firRdy_xdin_next_re = 18'sb000000000000000000;
      firRdy_xdin_next_im = 18'sb000000000000000000;
      firRdy_xdinVld_next = 1'b0;
      firRdy_readyReg_next = 1'b0;
      firRdy_count_temp = 2'b00;
      firRdy_out2_0 = 1'b0;
      dinSM_re_1 = dataIn_re;
      dinSM_im_1 = dataIn_im;
    end
    if ((validIn || (firRdy_count_temp > 2'b00)) || firRdy_out2_0) begin
      if (firRdy_count_temp == 2'b11) begin
        firRdy_count_temp = 2'b00;
      end
      else begin
        firRdy_count_temp = firRdy_count_temp + 2'b01;
      end
    end
    readySM = firRdy_readyReg;
    dinVldSM_1 = firRdy_out2_0;
    firRdy_count_next = firRdy_count_temp;
  end



  assign dinSM_re = dinSM_re_1;

  assign dinSM_im = dinSM_im_1;

  assign dinVldSM = dinVldSM_1;

endmodule  // FirRdyLogic

