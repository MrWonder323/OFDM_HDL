// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_TWDLROM_3_1.v
// Created: 2023-02-23 11:56:50
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_TWDLROM_3_1
// Source Path: dsphdl.IFFT/TWDLROM_3_1
// Hierarchy Level: 6
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_TWDLROM_3_1
          (clk,
           reset,
           enb_1_32_0,
           dout_2_1_vld,
           twdl_3_1_re,
           twdl_3_1_im);


  input   clk;
  input   reset;
  input   enb_1_32_0;
  input   dout_2_1_vld;
  output  signed [15:0] twdl_3_1_re;  // sfix16_En14
  output  signed [15:0] twdl_3_1_im;  // sfix16_En14


  reg [4:0] Radix22TwdlMapping_cnt;  // ufix5
  reg [1:0] Radix22TwdlMapping_phase;  // ufix2
  reg [2:0] Radix22TwdlMapping_octantReg1;  // ufix3
  reg [6:0] Radix22TwdlMapping_twdlAddr_raw;  // ufix7
  reg [3:0] Radix22TwdlMapping_twdlAddrMap;  // ufix4
  reg  Radix22TwdlMapping_twdl45Reg;
  reg  Radix22TwdlMapping_dvldReg1;
  reg  Radix22TwdlMapping_dvldReg2;
  reg [4:0] Radix22TwdlMapping_cnt_next;  // ufix5
  reg [1:0] Radix22TwdlMapping_phase_next;  // ufix2
  reg [2:0] Radix22TwdlMapping_octantReg1_next;  // ufix3
  reg [6:0] Radix22TwdlMapping_twdlAddr_raw_next;  // ufix7
  reg [3:0] Radix22TwdlMapping_twdlAddrMap_next;  // ufix4
  reg  Radix22TwdlMapping_twdl45Reg_next;
  reg  Radix22TwdlMapping_dvldReg1_next;
  reg  Radix22TwdlMapping_dvldReg2_next;
  reg [3:0] twdlAddr;  // ufix4
  reg  twdlAddrVld;
  reg [2:0] twdlOctant;  // ufix3
  reg  twdl45;
  wire signed [15:0] Twiddle_re_table_data [0:15];  // sfix16_En14 [16]
  wire signed [15:0] twiddleS_re;  // sfix16_En14
  reg signed [15:0] twiddleReg_re;  // sfix16_En14
  wire signed [15:0] Twiddle_im_table_data [0:15];  // sfix16_En14 [16]
  wire signed [15:0] twiddleS_im;  // sfix16_En14
  reg signed [15:0] twiddleReg_im;  // sfix16_En14
  reg [2:0] twdlOctantReg;  // ufix3
  reg  twdl45Reg;
  reg signed [15:0] twdl_3_1_re_1;  // sfix16_En14
  reg signed [15:0] twdl_3_1_im_1;  // sfix16_En14
  reg [2:0] Radix22TwdlMapping_octant;  // ufix3
  reg [6:0] Radix22TwdlMapping_cnt_cast;  // ufix7
  reg signed [15:0] Radix22TwdlMapping_sub_cast;  // sfix16_En4
  reg signed [15:0] Radix22TwdlMapping_sub_temp;  // sfix16_En4
  reg signed [8:0] Radix22TwdlMapping_sub_temp_0;  // sfix9
  reg signed [8:0] Radix22TwdlMapping_sub_temp_1;  // sfix9
  reg signed [15:0] Radix22TwdlMapping_sub_cast_0;  // sfix16_En4
  reg signed [15:0] Radix22TwdlMapping_sub_temp_2;  // sfix16_En4
  reg signed [15:0] Radix22TwdlMapping_sub_cast_1;  // sfix16_En4
  reg signed [15:0] Radix22TwdlMapping_sub_temp_3;  // sfix16_En4
  reg [6:0] Radix22TwdlMapping_t_0_0;  // ufix7
  reg signed [8:0] Radix22TwdlMapping_t_1;  // sfix9
  reg signed [8:0] Radix22TwdlMapping_t_2_0;  // sfix9
  reg signed [15:0] Radix22TwdlOctCorr_twdlIn_re;  // sfix16_En14
  reg signed [15:0] Radix22TwdlOctCorr_twdlIn_im;  // sfix16_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_0;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_1;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_2;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_3;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_4;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_5;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_6;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_7;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_8;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_9;  // sfix17_En14
  reg signed [16:0] Radix22TwdlOctCorr_cast_10;  // sfix17_En14


  // Radix22TwdlMapping
  always @(posedge clk or posedge reset)
    begin : Radix22TwdlMapping_process
      if (reset == 1'b1) begin
        Radix22TwdlMapping_octantReg1 <= 3'b000;
        Radix22TwdlMapping_twdlAddr_raw <= 7'b0000000;
        Radix22TwdlMapping_twdlAddrMap <= 4'b0000;
        Radix22TwdlMapping_twdl45Reg <= 1'b0;
        Radix22TwdlMapping_dvldReg1 <= 1'b0;
        Radix22TwdlMapping_dvldReg2 <= 1'b0;
        Radix22TwdlMapping_cnt <= 5'b00000;
        Radix22TwdlMapping_phase <= 2'b00;
      end
      else begin
        if (enb_1_32_0) begin
          Radix22TwdlMapping_cnt <= Radix22TwdlMapping_cnt_next;
          Radix22TwdlMapping_phase <= Radix22TwdlMapping_phase_next;
          Radix22TwdlMapping_octantReg1 <= Radix22TwdlMapping_octantReg1_next;
          Radix22TwdlMapping_twdlAddr_raw <= Radix22TwdlMapping_twdlAddr_raw_next;
          Radix22TwdlMapping_twdlAddrMap <= Radix22TwdlMapping_twdlAddrMap_next;
          Radix22TwdlMapping_twdl45Reg <= Radix22TwdlMapping_twdl45Reg_next;
          Radix22TwdlMapping_dvldReg1 <= Radix22TwdlMapping_dvldReg1_next;
          Radix22TwdlMapping_dvldReg2 <= Radix22TwdlMapping_dvldReg2_next;
        end
      end
    end

  always @(Radix22TwdlMapping_cnt, Radix22TwdlMapping_dvldReg1,
       Radix22TwdlMapping_dvldReg2, Radix22TwdlMapping_octantReg1,
       Radix22TwdlMapping_phase, Radix22TwdlMapping_twdl45Reg,
       Radix22TwdlMapping_twdlAddrMap, Radix22TwdlMapping_twdlAddr_raw,
       dout_2_1_vld) begin
    Radix22TwdlMapping_sub_temp = 16'sb0000000000000000;
    Radix22TwdlMapping_sub_temp_0 = 9'sb000000000;
    Radix22TwdlMapping_sub_temp_1 = 9'sb000000000;
    Radix22TwdlMapping_sub_temp_2 = 16'sb0000000000000000;
    Radix22TwdlMapping_sub_temp_3 = 16'sb0000000000000000;
    Radix22TwdlMapping_cnt_cast = 7'b0000000;
    Radix22TwdlMapping_sub_cast = 16'sb0000000000000000;
    Radix22TwdlMapping_sub_cast_0 = 16'sb0000000000000000;
    Radix22TwdlMapping_sub_cast_1 = 16'sb0000000000000000;
    Radix22TwdlMapping_t_0_0 = 7'b0000000;
    Radix22TwdlMapping_t_1 = 9'sb000000000;
    Radix22TwdlMapping_t_2_0 = 9'sb000000000;
    Radix22TwdlMapping_cnt_next = Radix22TwdlMapping_cnt;
    Radix22TwdlMapping_phase_next = Radix22TwdlMapping_phase;
    Radix22TwdlMapping_twdlAddr_raw_next = Radix22TwdlMapping_twdlAddr_raw;
    Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_twdlAddrMap;
    Radix22TwdlMapping_twdl45Reg_next = Radix22TwdlMapping_twdl45Reg;
    Radix22TwdlMapping_dvldReg2_next = Radix22TwdlMapping_dvldReg1;
    Radix22TwdlMapping_dvldReg1_next = dout_2_1_vld;
    case ( Radix22TwdlMapping_twdlAddr_raw)
      7'b0010000 :
        begin
          Radix22TwdlMapping_octant = 3'b000;
          Radix22TwdlMapping_twdl45Reg_next = 1'b1;
        end
      7'b0100000 :
        begin
          Radix22TwdlMapping_octant = 3'b001;
          Radix22TwdlMapping_twdl45Reg_next = 1'b0;
        end
      7'b0110000 :
        begin
          Radix22TwdlMapping_octant = 3'b010;
          Radix22TwdlMapping_twdl45Reg_next = 1'b1;
        end
      7'b1000000 :
        begin
          Radix22TwdlMapping_octant = 3'b011;
          Radix22TwdlMapping_twdl45Reg_next = 1'b0;
        end
      7'b1010000 :
        begin
          Radix22TwdlMapping_octant = 3'b100;
          Radix22TwdlMapping_twdl45Reg_next = 1'b1;
        end
      default :
        begin
          Radix22TwdlMapping_octant = Radix22TwdlMapping_twdlAddr_raw[6:4];
          Radix22TwdlMapping_twdl45Reg_next = 1'b0;
        end
    endcase
    Radix22TwdlMapping_octantReg1_next = Radix22TwdlMapping_octant;
    case ( Radix22TwdlMapping_octant)
      3'b000 :
        begin
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_twdlAddr_raw[3:0];
        end
      3'b001 :
        begin
          Radix22TwdlMapping_t_1 = {2'b0, Radix22TwdlMapping_twdlAddr_raw};
          Radix22TwdlMapping_sub_temp_0 = 9'sb000100000 - Radix22TwdlMapping_t_1;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_0[3:0];
        end
      3'b010 :
        begin
          Radix22TwdlMapping_t_2_0 = {2'b0, Radix22TwdlMapping_twdlAddr_raw};
          Radix22TwdlMapping_sub_temp_1 = Radix22TwdlMapping_t_2_0 - 9'sb000100000;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_1[3:0];
        end
      3'b011 :
        begin
          Radix22TwdlMapping_sub_cast_0 = {5'b0, {Radix22TwdlMapping_twdlAddr_raw, 4'b0000}};
          Radix22TwdlMapping_sub_temp_2 = 16'sb0000010000000000 - Radix22TwdlMapping_sub_cast_0;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_2[7:4];
        end
      3'b100 :
        begin
          Radix22TwdlMapping_sub_cast_1 = {5'b0, {Radix22TwdlMapping_twdlAddr_raw, 4'b0000}};
          Radix22TwdlMapping_sub_temp_3 = Radix22TwdlMapping_sub_cast_1 - 16'sb0000010000000000;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_3[7:4];
        end
      default :
        begin
          Radix22TwdlMapping_sub_cast = {5'b0, {Radix22TwdlMapping_twdlAddr_raw, 4'b0000}};
          Radix22TwdlMapping_sub_temp = 16'sb0000011000000000 - Radix22TwdlMapping_sub_cast;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp[7:4];
        end
    endcase
    if (Radix22TwdlMapping_phase == 2'b00) begin
      Radix22TwdlMapping_twdlAddr_raw_next = 7'b0000000;
    end
    else if (Radix22TwdlMapping_phase == 2'b01) begin
      Radix22TwdlMapping_t_0_0 = {2'b0, Radix22TwdlMapping_cnt};
      Radix22TwdlMapping_twdlAddr_raw_next = Radix22TwdlMapping_t_0_0 <<< 8'd1;
    end
    else if (Radix22TwdlMapping_phase == 2'b10) begin
      Radix22TwdlMapping_twdlAddr_raw_next = {2'b0, Radix22TwdlMapping_cnt};
    end
    else begin
      Radix22TwdlMapping_cnt_cast = {2'b0, Radix22TwdlMapping_cnt};
      Radix22TwdlMapping_twdlAddr_raw_next = (Radix22TwdlMapping_cnt_cast <<< 8'd1) + Radix22TwdlMapping_cnt_cast;
    end
    if (dout_2_1_vld && (Radix22TwdlMapping_cnt > 5'b11110)) begin
      Radix22TwdlMapping_phase_next = Radix22TwdlMapping_phase + 2'b01;
    end
    if (dout_2_1_vld) begin
      Radix22TwdlMapping_cnt_next = Radix22TwdlMapping_cnt + 5'b00001;
    end
    twdlAddr = Radix22TwdlMapping_twdlAddrMap;
    twdlAddrVld = Radix22TwdlMapping_dvldReg2;
    twdlOctant = Radix22TwdlMapping_octantReg1;
    twdl45 = Radix22TwdlMapping_twdl45Reg;
  end



  // Twiddle ROM1
  assign Twiddle_re_table_data[0] = 16'sb0100000000000000;
  assign Twiddle_re_table_data[1] = 16'sb0011111111101100;
  assign Twiddle_re_table_data[2] = 16'sb0011111110110001;
  assign Twiddle_re_table_data[3] = 16'sb0011111101001111;
  assign Twiddle_re_table_data[4] = 16'sb0011111011000101;
  assign Twiddle_re_table_data[5] = 16'sb0011111000010101;
  assign Twiddle_re_table_data[6] = 16'sb0011110100111111;
  assign Twiddle_re_table_data[7] = 16'sb0011110001000010;
  assign Twiddle_re_table_data[8] = 16'sb0011101100100001;
  assign Twiddle_re_table_data[9] = 16'sb0011100111011011;
  assign Twiddle_re_table_data[10] = 16'sb0011100001110001;
  assign Twiddle_re_table_data[11] = 16'sb0011011011100101;
  assign Twiddle_re_table_data[12] = 16'sb0011010100110111;
  assign Twiddle_re_table_data[13] = 16'sb0011001101101000;
  assign Twiddle_re_table_data[14] = 16'sb0011000101111001;
  assign Twiddle_re_table_data[15] = 16'sb0010111101101100;
  assign twiddleS_re = Twiddle_re_table_data[twdlAddr];



  always @(posedge clk or posedge reset)
    begin : TWIDDLEROM_RE_process
      if (reset == 1'b1) begin
        twiddleReg_re <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0) begin
          twiddleReg_re <= twiddleS_re;
        end
      end
    end



  // Twiddle ROM2
  assign Twiddle_im_table_data[0] = 16'sb0000000000000000;
  assign Twiddle_im_table_data[1] = 16'sb1111110011011100;
  assign Twiddle_im_table_data[2] = 16'sb1111100110111010;
  assign Twiddle_im_table_data[3] = 16'sb1111011010011100;
  assign Twiddle_im_table_data[4] = 16'sb1111001110000100;
  assign Twiddle_im_table_data[5] = 16'sb1111000001110011;
  assign Twiddle_im_table_data[6] = 16'sb1110110101101100;
  assign Twiddle_im_table_data[7] = 16'sb1110101001110000;
  assign Twiddle_im_table_data[8] = 16'sb1110011110000010;
  assign Twiddle_im_table_data[9] = 16'sb1110010010100011;
  assign Twiddle_im_table_data[10] = 16'sb1110000111010101;
  assign Twiddle_im_table_data[11] = 16'sb1101111100011001;
  assign Twiddle_im_table_data[12] = 16'sb1101110001110010;
  assign Twiddle_im_table_data[13] = 16'sb1101100111100000;
  assign Twiddle_im_table_data[14] = 16'sb1101011101100110;
  assign Twiddle_im_table_data[15] = 16'sb1101010100000101;
  assign twiddleS_im = Twiddle_im_table_data[twdlAddr];



  always @(posedge clk or posedge reset)
    begin : TWIDDLEROM_IM_process
      if (reset == 1'b1) begin
        twiddleReg_im <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0) begin
          twiddleReg_im <= twiddleS_im;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        twdlOctantReg <= 3'b000;
      end
      else begin
        if (enb_1_32_0) begin
          twdlOctantReg <= twdlOctant;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        twdl45Reg <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          twdl45Reg <= twdl45;
        end
      end
    end



  // Radix22TwdlOctCorr
  always @(twdl45Reg, twdlOctantReg, twiddleReg_im, twiddleReg_re) begin
    Radix22TwdlOctCorr_cast_0 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_2 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_4 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_6 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_8 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_10 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_1 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_3 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_5 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_7 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_cast_9 = 17'sb00000000000000000;
    Radix22TwdlOctCorr_twdlIn_re = twiddleReg_re;
    Radix22TwdlOctCorr_twdlIn_im = twiddleReg_im;
    if (twdl45Reg) begin
      case ( twdlOctantReg)
        3'b000 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 16'sb0010110101000001;
            Radix22TwdlOctCorr_twdlIn_im = 16'sb1101001010111111;
          end
        3'b010 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 16'sb1101001010111111;
            Radix22TwdlOctCorr_twdlIn_im = 16'sb1101001010111111;
          end
        3'b100 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 16'sb1101001010111111;
            Radix22TwdlOctCorr_twdlIn_im = 16'sb0010110101000001;
          end
        default :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 16'sb0010110101000001;
            Radix22TwdlOctCorr_twdlIn_im = 16'sb1101001010111111;
          end
      endcase
    end
    else begin
      case ( twdlOctantReg)
        3'b000 :
          begin
          end
        3'b001 :
          begin
            Radix22TwdlOctCorr_cast = {twiddleReg_im[15], twiddleReg_im};
            Radix22TwdlOctCorr_cast_0 =  - (Radix22TwdlOctCorr_cast);
            Radix22TwdlOctCorr_twdlIn_re = Radix22TwdlOctCorr_cast_0[15:0];
            Radix22TwdlOctCorr_cast_5 = {twiddleReg_re[15], twiddleReg_re};
            Radix22TwdlOctCorr_cast_6 =  - (Radix22TwdlOctCorr_cast_5);
            Radix22TwdlOctCorr_twdlIn_im = Radix22TwdlOctCorr_cast_6[15:0];
          end
        3'b010 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = twiddleReg_im;
            Radix22TwdlOctCorr_cast_7 = {twiddleReg_re[15], twiddleReg_re};
            Radix22TwdlOctCorr_cast_8 =  - (Radix22TwdlOctCorr_cast_7);
            Radix22TwdlOctCorr_twdlIn_im = Radix22TwdlOctCorr_cast_8[15:0];
          end
        3'b011 :
          begin
            Radix22TwdlOctCorr_cast_1 = {twiddleReg_re[15], twiddleReg_re};
            Radix22TwdlOctCorr_cast_2 =  - (Radix22TwdlOctCorr_cast_1);
            Radix22TwdlOctCorr_twdlIn_re = Radix22TwdlOctCorr_cast_2[15:0];
            Radix22TwdlOctCorr_twdlIn_im = twiddleReg_im;
          end
        3'b100 :
          begin
            Radix22TwdlOctCorr_cast_3 = {twiddleReg_re[15], twiddleReg_re};
            Radix22TwdlOctCorr_cast_4 =  - (Radix22TwdlOctCorr_cast_3);
            Radix22TwdlOctCorr_twdlIn_re = Radix22TwdlOctCorr_cast_4[15:0];
            Radix22TwdlOctCorr_cast_9 = {twiddleReg_im[15], twiddleReg_im};
            Radix22TwdlOctCorr_cast_10 =  - (Radix22TwdlOctCorr_cast_9);
            Radix22TwdlOctCorr_twdlIn_im = Radix22TwdlOctCorr_cast_10[15:0];
          end
        default :
          begin
            Radix22TwdlOctCorr_twdlIn_re = twiddleReg_im;
            Radix22TwdlOctCorr_twdlIn_im = twiddleReg_re;
          end
      endcase
    end
    twdl_3_1_re_1 = Radix22TwdlOctCorr_twdlIn_re;
    twdl_3_1_im_1 = Radix22TwdlOctCorr_twdlIn_im;
  end



  assign twdl_3_1_re = twdl_3_1_re_1;

  assign twdl_3_1_im = twdl_3_1_im_1;

endmodule  // whdlOFDMTx_TWDLROM_3_1

