// -------------------------------------------------------------
// 
// File Name: hdlsrc_v\DUCforLTEHDL\rdySection.v
// Created: 2023-02-09 10:49:26
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: rdySection
// Source Path: DUCforLTEHDL/HDL_DUC/CICInterpolator/rdySection
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module rdySection
          (clk,
           reset,
           enb,
           dataInreg,
           validInreg,
           internalReset,
           upsampleVal,
           rdyout_re,
           rdyout_im,
           rdy_valid);


  input   clk;
  input   reset;
  input   enb;
  input   signed [17:0] dataInreg;  // sfix18_En14
  input   validInreg;
  input   internalReset;
  input   [11:0] upsampleVal;  // ufix12
  output  signed [18:0] rdyout_re;  // sfix19_En14
  output  signed [18:0] rdyout_im;  // sfix19_En14
  output  rdy_valid;


  wire signed [18:0] rdyIn_re;  // sfix19_En14
  wire signed [17:0] dtc_im;  // sfix18_En14
  wire signed [18:0] rdyIn_im;  // sfix19_En14
  reg [2:0] cicReadyData_state;  // ufix3
  reg  cicReadyData_count;  // ufix1
  reg  cicReadyData_resetReg;
  reg [2:0] cicReadyData_state_next;  // ufix3
  reg  cicReadyData_count_next;  // ufix1
  reg  cicReadyData_resetReg_next;
  reg signed [18:0] rdyout_re_1;  // sfix19_En14
  reg signed [18:0] rdyout_im_1;  // sfix19_En14
  reg  rdy_valid_1;
  reg  cicReadyData_out2_0;
  reg  cicReadyData_validInreg;
  reg [1:0] cicReadyData_add_temp;  // ufix2
  reg [1:0] cicReadyData_t_0_0;  // ufix2


  assign rdyIn_re = {dataInreg[17], dataInreg};



  assign dtc_im = 18'sb000000000000000000;



  assign rdyIn_im = {dtc_im[17], dtc_im};



  always @(posedge clk or posedge reset)
    begin : cicReadyData_process
      if (reset == 1'b1) begin
        cicReadyData_state <= 3'b000;
        cicReadyData_count <= 1'b0;
        cicReadyData_resetReg <= 1'b0;
      end
      else begin
        if (enb) begin
          cicReadyData_state <= cicReadyData_state_next;
          cicReadyData_count <= cicReadyData_count_next;
          cicReadyData_resetReg <= cicReadyData_resetReg_next;
        end
      end
    end

  always @(cicReadyData_count, cicReadyData_resetReg, cicReadyData_state, internalReset,
       rdyIn_im, rdyIn_re, validInreg) begin
    cicReadyData_add_temp = 2'b00;
    cicReadyData_t_0_0 = 2'b00;
    cicReadyData_state_next = cicReadyData_state;
    cicReadyData_count_next = cicReadyData_count;
    cicReadyData_validInreg = validInreg != 1'b0;
    case ( cicReadyData_state)
      3'b000 :
        begin
          rdyout_re_1 = rdyIn_re;
          rdyout_im_1 = rdyIn_im;
          cicReadyData_out2_0 = cicReadyData_validInreg;
          cicReadyData_state_next = 3'b000;
          if (cicReadyData_validInreg) begin
            cicReadyData_state_next = 3'b001;
          end
        end
      3'b001 :
        begin
          if (cicReadyData_count == 1'b0) begin
            cicReadyData_state_next = 3'b000;
            rdyout_re_1 = rdyIn_re;
            rdyout_im_1 = rdyIn_im;
            cicReadyData_out2_0 = 1'b0;
          end
          else begin
            rdyout_re_1 = 19'sb0000000000000000000;
            rdyout_im_1 = 19'sb0000000000000000000;
            cicReadyData_out2_0 = 1'b0;
          end
        end
      default :
        begin
          rdyout_re_1 = 19'sb0000000000000000000;
          rdyout_im_1 = 19'sb0000000000000000000;
          cicReadyData_out2_0 = 1'b0;
          cicReadyData_state_next = 3'b000;
        end
    endcase
    if ((cicReadyData_validInreg || (cicReadyData_count > 1'b0)) || cicReadyData_out2_0) begin
      if (cicReadyData_count == 1'b0) begin
        cicReadyData_count_next = 1'b0;
      end
      else begin
        cicReadyData_t_0_0 = {1'b0, cicReadyData_count};
        cicReadyData_add_temp = cicReadyData_t_0_0 + 2'b01;
        cicReadyData_count_next = cicReadyData_add_temp[0];
      end
    end
    if (cicReadyData_resetReg) begin
      cicReadyData_count_next = 1'b0;
      cicReadyData_state_next = 3'b001;
      rdyout_re_1 = 19'sb0000000000000000000;
      rdyout_im_1 = 19'sb0000000000000000000;
      cicReadyData_out2_0 = 1'b0;
    end
    cicReadyData_resetReg_next = internalReset != 1'b0;
    rdy_valid_1 = cicReadyData_out2_0;
  end



  assign rdyout_re = rdyout_re_1;

  assign rdyout_im = rdyout_im_1;

  assign rdy_valid = rdy_valid_1;

endmodule  // rdySection

