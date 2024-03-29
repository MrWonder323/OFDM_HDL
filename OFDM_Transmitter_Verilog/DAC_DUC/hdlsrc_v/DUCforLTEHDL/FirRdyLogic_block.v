// -------------------------------------------------------------
// 
// File Name: hdlsrc_v\DUCforLTEHDL\FirRdyLogic_block.v
// Created: 2023-02-09 10:49:26
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: FirRdyLogic_block
// Source Path: DUCforLTEHDL/HDL_DUC/CIC Compensation Interpolator/DUCforLTEHDL/HDL_DUC/CIC Compensation Interpolator/FIRFilter2/FirRdyLogic
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module FirRdyLogic_block
          (clk,
           reset,
           enb,
           dataIn,
           validIn,
           dinSM,
           dinVldSM);


  input   clk;
  input   reset;
  input   enb;
  input   signed [17:0] dataIn;  // sfix18_En14
  input   validIn;
  output  signed [17:0] dinSM;  // sfix18_En14
  output  dinVldSM;


  wire syncReset;
  reg signed [17:0] firRdy_xdin;  // sfix18
  reg  firRdy_xdinVld;
  reg [2:0] firRdy_state;  // ufix3
  reg  firRdy_readyReg;
  reg [1:0] firRdy_count;  // ufix2
  reg signed [17:0] firRdy_xdin_next;  // sfix18_En14
  reg  firRdy_xdinVld_next;
  reg [2:0] firRdy_state_next;  // ufix3
  reg  firRdy_readyReg_next;
  reg [1:0] firRdy_count_next;  // ufix2
  reg  readySM;
  reg signed [17:0] dinSM_1;  // sfix18_En14
  reg  dinVldSM_1;
  reg  firRdy_out2_0;
  reg [1:0] firRdy_count_temp;  // ufix2


  assign syncReset = 1'b0;



  // rdyLogic
  always @(posedge clk or posedge reset)
    begin : firRdy_process
      if (reset == 1'b1) begin
        firRdy_state <= 3'b000;
        firRdy_xdin <= 18'sb000000000000000000;
        firRdy_xdinVld <= 1'b0;
        firRdy_readyReg <= 1'b1;
        firRdy_count <= 2'b00;
      end
      else begin
        if (enb) begin
          firRdy_xdin <= firRdy_xdin_next;
          firRdy_xdinVld <= firRdy_xdinVld_next;
          firRdy_state <= firRdy_state_next;
          firRdy_readyReg <= firRdy_readyReg_next;
          firRdy_count <= firRdy_count_next;
        end
      end
    end

  always @(dataIn, firRdy_count, firRdy_readyReg, firRdy_state, firRdy_xdin,
       firRdy_xdinVld, syncReset, validIn) begin
    firRdy_count_temp = firRdy_count;
    firRdy_xdin_next = firRdy_xdin;
    firRdy_xdinVld_next = firRdy_xdinVld;
    firRdy_state_next = firRdy_state;
    firRdy_readyReg_next = firRdy_readyReg;
    if ( ! syncReset) begin
      case ( firRdy_state)
        3'b000 :
          begin
            dinSM_1 = dataIn;
            firRdy_out2_0 = validIn;
            firRdy_state_next = 3'b000;
            firRdy_readyReg_next = 1'b1;
            firRdy_xdin_next = 18'sb000000000000000000;
            firRdy_xdinVld_next = 1'b0;
            if (validIn) begin
              firRdy_state_next = 3'b001;
              firRdy_readyReg_next = 1'b0;
            end
          end
        3'b001 :
          begin
            dinSM_1 = 18'sb000000000000000000;
            firRdy_out2_0 = 1'b0;
            firRdy_state_next = 3'b011;
            if (validIn) begin
              firRdy_state_next = 3'b010;
              firRdy_xdin_next = dataIn;
              firRdy_xdinVld_next = 1'b1;
            end
          end
        3'b010 :
          begin
            dinSM_1 = 18'sb000000000000000000;
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
            dinSM_1 = 18'sb000000000000000000;
            firRdy_out2_0 = 1'b0;
          end
        3'b100 :
          begin
            firRdy_state_next = 3'b011;
            dinSM_1 = firRdy_xdin;
            firRdy_out2_0 = firRdy_xdinVld;
            firRdy_xdin_next = dataIn;
            firRdy_xdinVld_next = validIn;
          end
        default :
          begin
            dinSM_1 = 18'sb000000000000000000;
            firRdy_out2_0 = 1'b0;
            firRdy_state_next = 3'b000;
            firRdy_xdin_next = 18'sb000000000000000000;
            firRdy_xdinVld_next = 1'b0;
            firRdy_readyReg_next = 1'b1;
          end
      endcase
    end
    else begin
      firRdy_state_next = 3'b000;
      firRdy_xdin_next = 18'sb000000000000000000;
      firRdy_xdinVld_next = 1'b0;
      firRdy_readyReg_next = 1'b0;
      firRdy_count_temp = 2'b00;
      firRdy_out2_0 = 1'b0;
      dinSM_1 = dataIn;
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



  assign dinSM = dinSM_1;

  assign dinVldSM = dinVldSM_1;

endmodule  // FirRdyLogic_block

