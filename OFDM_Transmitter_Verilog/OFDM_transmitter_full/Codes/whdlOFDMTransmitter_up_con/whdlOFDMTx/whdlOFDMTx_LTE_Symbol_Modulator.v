// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_LTE_Symbol_Modulator.v
// Created: 2023-02-23 11:56:51
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_LTE_Symbol_Modulator
// Source Path: whdlOFDMTx/Frame Generator/Data/Data Chain/LTE Symbol Modulator
// Hierarchy Level: 6
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_LTE_Symbol_Modulator
          (clk,
           reset,
           enb,
           data,
           valid,
           modSel,
           load,
           data1_re,
           data1_im,
           valid1);


  input   clk;
  input   reset;
  input   enb;
  input   data;
  input   valid;
  input   [2:0] modSel;  // ufix3
  input   load;
  output  signed [15:0] data1_re;  // sfix16_En14
  output  signed [15:0] data1_im;  // sfix16_En14
  output  valid1;


  reg  obj_enbReg;
  wire tmp;
  wire [2:0] obj_modSelReg;  // ufix3
  wire [2:0] tmp_1;  // ufix3
  reg [2:0] obj_modSelReg_1;  // ufix3
  wire [2:0] tmp_2;  // ufix3
  reg [2:0] tmp_3;  // ufix3
  wire [2:0] obj_count;  // ufix3
  wire [2:0] obj_count_1;  // ufix3
  reg [2:0] obj_count_2;  // ufix3
  wire [2:0] tmp_4;  // ufix3
  wire tmp_5;
  wire [2:0] tmp_6;  // ufix3
  wire [2:0] tmp_7;  // ufix3
  wire [2:0] tmp_8;  // ufix3
  wire tmp_9;
  wire out;
  wire out_1;
  wire tmp_10;
  reg  [0:1] obj_validReg_reg_reg;  // ufix1 [2]
  wire [0:1] obj_validReg_reg_reg_next;  // ufix1 [2]
  wire obj_validReg;
  reg [2:0] obj_modSelRegReg;  // ufix3
  reg  obj_dataInReg;
  wire [0:7] obj_shiftReg;  // boolean [8]
  reg  [0:7] obj_shiftReg_1;  // boolean [8]
  reg  [0:7] obj_shiftReg_2;  // boolean [8]
  wire [0:7] tmp_11;  // boolean [8]
  reg  [0:7] obj_shiftReg_reg_reg;  // ufix1 [8]
  wire [0:7] obj_shiftReg_reg_reg_next;  // ufix1 [8]
  wire [0:7] buffBits;  // boolean [8]
  wire [0:7] buffBits_1;  // boolean [8]
  wire b6;
  wire tmp_12;  // ufix1
  reg  tmp_13;  // ufix1
  wire tmp_14;  // ufix1
  wire b4;
  wire tmp_15;  // ufix1
  reg  tmp_16;  // ufix1
  wire tmp_17;  // ufix1
  wire tmp_18;  // ufix1
  wire b2;
  wire tmp_19;  // ufix1
  reg  tmp_20;  // ufix1
  wire tmp_21;  // ufix1
  wire b7;
  wire tmp_22;  // ufix1
  wire tmp_23;  // ufix1
  wire tmp_24;  // ufix1
  wire tmp_25;  // ufix1
  wire tmp_26;  // ufix1
  reg  tmp_27;  // ufix1
  reg [4:0] tmp_28;  // ufix5
  reg [4:0] obj_offsetReg;  // ufix5
  wire [4:0] tmp_29;  // ufix5
  wire [3:0] p26tmp_1;  // ufix4
  wire [4:0] p26tmp_2;  // ufix5
  reg [4:0] obj_Iaddr;  // ufix5
  wire signed [15:0] Iout;  // sfix16_En14
  wire signed [15:0] p0Iout_tmp [0:29];  // sfix16_En14 [30]
  reg signed [15:0] obj_Ireg;  // sfix16_En14
  wire signed [15:0] tmp_30;  // sfix16_En14
  wire tmp_31;  // ufix1
  reg  tmp_32;  // ufix1
  wire tmp_33;  // ufix1
  wire b5;
  wire tmp_34;  // ufix1
  reg  tmp_35;  // ufix1
  wire tmp_36;  // ufix1
  wire tmp_37;  // ufix1
  wire b3;
  wire tmp_38;  // ufix1
  reg  tmp_39;  // ufix1
  wire tmp_40;  // ufix1
  wire tmp_41;  // ufix1
  wire tmp_42;  // ufix1
  wire tmp_43;  // ufix1
  wire tmp_44;  // ufix1
  wire tmp_45;  // ufix1
  reg  tmp_46;  // ufix1
  wire [4:0] tmp_47;  // ufix5
  wire [3:0] p24tmp_1;  // ufix4
  wire [4:0] p24tmp_2;  // ufix5
  reg [4:0] obj_Qaddr;  // ufix5
  wire signed [15:0] Qout;  // sfix16_En14
  wire signed [15:0] p0Qout_tmp [0:29];  // sfix16_En14 [30]
  reg signed [15:0] obj_Qreg;  // sfix16_En14
  wire signed [15:0] tmp_48;  // sfix16_En14
  wire signed [15:0] data_re;  // sfix16_En14
  wire signed [15:0] data_im;  // sfix16_En14
  reg  valid_1;
  reg [2:0] p92_tmp;  // ufix3
  reg signed [31:0] p1_i;  // int32
  reg  [0:7] p1_obj_shiftReg;  // boolean [8]
  reg  p37_tmp;  // ufix1
  reg  p39_tmp;  // ufix1
  reg  p41_tmp;  // ufix1
  reg  p29_tmp;  // ufix1
  reg [4:0] p44_tmp;  // ufix5
  reg  p31_tmp;  // ufix1
  reg  p33_tmp;  // ufix1
  reg  p35_tmp;  // ufix1
  reg  p27_tmp;  // ufix1


  always @(posedge clk or posedge reset)
    begin : obj_enbReg_reg_process
      if (reset == 1'b1) begin
        obj_enbReg <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_enbReg <= valid;
        end
      end
    end



  assign tmp = modSel > 3'b100;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp97
  assign obj_modSelReg = 3'b001;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp95
  assign tmp_1 = (tmp == 1'b0 ? modSel :
              obj_modSelReg);



  assign tmp_2 = (load == 1'b0 ? obj_modSelReg_1 :
              tmp_1);



  always @(posedge clk or posedge reset)
    begin : obj_modSelReg_reg_process
      if (reset == 1'b1) begin
        obj_modSelReg_1 <= 3'b001;
      end
      else begin
        if (enb) begin
          obj_modSelReg_1 <= tmp_2;
        end
      end
    end



  always @(obj_modSelReg_1) begin
    case ( obj_modSelReg_1)
      3'b000 :
        begin
          p92_tmp = 3'b000;
        end
      3'b001 :
        begin
          p92_tmp = 3'b001;
        end
      3'b010 :
        begin
          p92_tmp = 3'b011;
        end
      3'b011 :
        begin
          p92_tmp = 3'b101;
        end
      3'b100 :
        begin
          p92_tmp = 3'b111;
        end
      default :
        begin
          p92_tmp = 3'b001;
        end
    endcase
    tmp_3 = p92_tmp;
  end



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp88
  assign obj_count = 3'b000;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp77
  assign obj_count_1 = 3'b000;



  // HDL code generation from MATLAB function: SystemCore_stepImpl
  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp88
  assign tmp_4 = obj_count_2 + 3'b001;



  assign tmp_5 = obj_count_2 == tmp_3;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp85
  assign tmp_6 = (tmp_5 == 1'b0 ? tmp_4 :
              obj_count);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp77
  assign tmp_7 = (obj_enbReg == 1'b0 ? obj_count_2 :
              tmp_6);



  assign tmp_8 = (load == 1'b0 ? tmp_7 :
              obj_count_1);



  always @(posedge clk or posedge reset)
    begin : obj_count_reg_process
      if (reset == 1'b1) begin
        obj_count_2 <= 3'b000;
      end
      else begin
        if (enb) begin
          obj_count_2 <= tmp_8;
        end
      end
    end



  assign tmp_9 = (obj_count_2 == tmp_3) && obj_enbReg;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp81
  assign out = 1'b0;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp81
  assign out_1 = 1'b1;



  assign tmp_10 = (tmp_9 == 1'b0 ? out :
              out_1);



  always @(posedge clk or posedge reset)
    begin : obj_validReg_reg_process
      if (reset == 1'b1) begin
        obj_validReg_reg_reg[0] <= 1'b0;
        obj_validReg_reg_reg[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_validReg_reg_reg[0] <= obj_validReg_reg_reg_next[0];
          obj_validReg_reg_reg[1] <= obj_validReg_reg_reg_next[1];
        end
      end
    end

  assign obj_validReg = obj_validReg_reg_reg[1];
  assign obj_validReg_reg_reg_next[0] = tmp_10;
  assign obj_validReg_reg_reg_next[1] = obj_validReg_reg_reg[0];



  always @(posedge clk or posedge reset)
    begin : obj_modSelRegReg_reg_process
      if (reset == 1'b1) begin
        obj_modSelRegReg <= 3'b001;
      end
      else begin
        if (enb) begin
          obj_modSelRegReg <= obj_modSelReg_1;
        end
      end
    end



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp97
  always @(posedge clk or posedge reset)
    begin : obj_dataInReg_reg_process
      if (reset == 1'b1) begin
        obj_dataInReg <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_dataInReg <= data;
        end
      end
    end



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp102
  always @* begin
    p1_obj_shiftReg = obj_shiftReg;

    for(p1_i = 32'sd0; p1_i <= 32'sd6; p1_i = p1_i + 32'sd1) begin
      p1_obj_shiftReg[32'sd7 - p1_i] = p1_obj_shiftReg[32'sd6 - p1_i];
    end

    obj_shiftReg_1 = p1_obj_shiftReg;
  end



  always @* begin
    obj_shiftReg_2 = obj_shiftReg_1;
    obj_shiftReg_2[0] = obj_dataInReg;
  end



  assign tmp_11[0] = (obj_enbReg == 1'b0 ? obj_shiftReg[0] :
              obj_shiftReg_2[0]);
  assign tmp_11[1] = (obj_enbReg == 1'b0 ? obj_shiftReg[1] :
              obj_shiftReg_2[1]);
  assign tmp_11[2] = (obj_enbReg == 1'b0 ? obj_shiftReg[2] :
              obj_shiftReg_2[2]);
  assign tmp_11[3] = (obj_enbReg == 1'b0 ? obj_shiftReg[3] :
              obj_shiftReg_2[3]);
  assign tmp_11[4] = (obj_enbReg == 1'b0 ? obj_shiftReg[4] :
              obj_shiftReg_2[4]);
  assign tmp_11[5] = (obj_enbReg == 1'b0 ? obj_shiftReg[5] :
              obj_shiftReg_2[5]);
  assign tmp_11[6] = (obj_enbReg == 1'b0 ? obj_shiftReg[6] :
              obj_shiftReg_2[6]);
  assign tmp_11[7] = (obj_enbReg == 1'b0 ? obj_shiftReg[7] :
              obj_shiftReg_2[7]);



  always @(posedge clk or posedge reset)
    begin : obj_shiftReg_reg_process
      if (reset == 1'b1) begin
        obj_shiftReg_reg_reg[0] <= 1'b0;
        obj_shiftReg_reg_reg[1] <= 1'b0;
        obj_shiftReg_reg_reg[2] <= 1'b0;
        obj_shiftReg_reg_reg[3] <= 1'b0;
        obj_shiftReg_reg_reg[4] <= 1'b0;
        obj_shiftReg_reg_reg[5] <= 1'b0;
        obj_shiftReg_reg_reg[6] <= 1'b0;
        obj_shiftReg_reg_reg[7] <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_shiftReg_reg_reg[0] <= obj_shiftReg_reg_reg_next[0];
          obj_shiftReg_reg_reg[1] <= obj_shiftReg_reg_reg_next[1];
          obj_shiftReg_reg_reg[2] <= obj_shiftReg_reg_reg_next[2];
          obj_shiftReg_reg_reg[3] <= obj_shiftReg_reg_reg_next[3];
          obj_shiftReg_reg_reg[4] <= obj_shiftReg_reg_reg_next[4];
          obj_shiftReg_reg_reg[5] <= obj_shiftReg_reg_reg_next[5];
          obj_shiftReg_reg_reg[6] <= obj_shiftReg_reg_reg_next[6];
          obj_shiftReg_reg_reg[7] <= obj_shiftReg_reg_reg_next[7];
        end
      end
    end

  assign obj_shiftReg[0] = obj_shiftReg_reg_reg[0];
  assign obj_shiftReg[1] = obj_shiftReg_reg_reg[1];
  assign obj_shiftReg[2] = obj_shiftReg_reg_reg[2];
  assign obj_shiftReg[3] = obj_shiftReg_reg_reg[3];
  assign obj_shiftReg[4] = obj_shiftReg_reg_reg[4];
  assign obj_shiftReg[5] = obj_shiftReg_reg_reg[5];
  assign obj_shiftReg[6] = obj_shiftReg_reg_reg[6];
  assign obj_shiftReg[7] = obj_shiftReg_reg_reg[7];
  assign obj_shiftReg_reg_reg_next[0] = tmp_11[0];
  assign obj_shiftReg_reg_reg_next[1] = tmp_11[1];
  assign obj_shiftReg_reg_reg_next[2] = tmp_11[2];
  assign obj_shiftReg_reg_reg_next[3] = tmp_11[3];
  assign obj_shiftReg_reg_reg_next[4] = tmp_11[4];
  assign obj_shiftReg_reg_reg_next[5] = tmp_11[5];
  assign obj_shiftReg_reg_reg_next[6] = tmp_11[6];
  assign obj_shiftReg_reg_reg_next[7] = tmp_11[7];



  assign buffBits = {8{1'b0}};



  assign buffBits_1[0] = obj_shiftReg[7];
  assign buffBits_1[1] = obj_shiftReg[6];
  assign buffBits_1[2] = obj_shiftReg[5];
  assign buffBits_1[3] = obj_shiftReg[4];
  assign buffBits_1[4] = obj_shiftReg[3];
  assign buffBits_1[5] = obj_shiftReg[2];
  assign buffBits_1[6] = obj_shiftReg[1];
  assign buffBits_1[7] = obj_shiftReg[0];



  assign b6 = buffBits_1[6];



  assign tmp_12 = b6;



  always @(obj_modSelRegReg, tmp_12) begin
    case ( obj_modSelRegReg)
      3'b000 :
        begin
          p37_tmp = 1'b0;
        end
      3'b001 :
        begin
          p37_tmp = 1'b0;
        end
      3'b010 :
        begin
          p37_tmp = 1'b0;
        end
      3'b011 :
        begin
          p37_tmp = 1'b0;
        end
      3'b100 :
        begin
          p37_tmp = tmp_12;
        end
      default :
        begin
          p37_tmp = 1'b0;
        end
    endcase
    tmp_13 = p37_tmp;
  end



  assign tmp_14 = b6;



  assign b4 = buffBits_1[4];



  assign tmp_15 = b4;



  always @(obj_modSelRegReg, tmp_14, tmp_15) begin
    case ( obj_modSelRegReg)
      3'b000 :
        begin
          p39_tmp = 1'b0;
        end
      3'b001 :
        begin
          p39_tmp = 1'b0;
        end
      3'b010 :
        begin
          p39_tmp = 1'b0;
        end
      3'b011 :
        begin
          p39_tmp = tmp_14;
        end
      3'b100 :
        begin
          p39_tmp = tmp_15;
        end
      default :
        begin
          p39_tmp = 1'b0;
        end
    endcase
    tmp_16 = p39_tmp;
  end



  assign tmp_17 = b6;



  assign tmp_18 = b4;



  assign b2 = buffBits_1[2];



  assign tmp_19 = b2;



  always @(obj_modSelRegReg, tmp_17, tmp_18, tmp_19) begin
    case ( obj_modSelRegReg)
      3'b000 :
        begin
          p41_tmp = 1'b0;
        end
      3'b001 :
        begin
          p41_tmp = 1'b0;
        end
      3'b010 :
        begin
          p41_tmp = tmp_17;
        end
      3'b011 :
        begin
          p41_tmp = tmp_18;
        end
      3'b100 :
        begin
          p41_tmp = tmp_19;
        end
      default :
        begin
          p41_tmp = 1'b0;
        end
    endcase
    tmp_20 = p41_tmp;
  end



  assign tmp_21 = b6;



  assign b7 = buffBits_1[7];



  assign tmp_22 = b7;



  assign tmp_23 = b6;



  assign tmp_24 = b4;



  assign tmp_25 = b2;



  assign tmp_26 = buffBits_1[0];



  always @(obj_modSelRegReg, tmp_21, tmp_22, tmp_23, tmp_24, tmp_25, tmp_26) begin
    case ( obj_modSelRegReg)
      3'b000 :
        begin
          p29_tmp = tmp_22;
        end
      3'b001 :
        begin
          p29_tmp = tmp_23;
        end
      3'b010 :
        begin
          p29_tmp = tmp_24;
        end
      3'b011 :
        begin
          p29_tmp = tmp_25;
        end
      3'b100 :
        begin
          p29_tmp = tmp_26;
        end
      default :
        begin
          p29_tmp = tmp_21;
        end
    endcase
    tmp_27 = p29_tmp;
  end



  always @(obj_modSelReg_1) begin
    case ( obj_modSelReg_1)
      3'b000 :
        begin
          p44_tmp = 5'b00000;
        end
      3'b001 :
        begin
          p44_tmp = 5'b00000;
        end
      3'b010 :
        begin
          p44_tmp = 5'b00010;
        end
      3'b011 :
        begin
          p44_tmp = 5'b00110;
        end
      3'b100 :
        begin
          p44_tmp = 5'b01110;
        end
      default :
        begin
          p44_tmp = 5'b00000;
        end
    endcase
    tmp_28 = p44_tmp;
  end



  always @(posedge clk or posedge reset)
    begin : obj_offsetReg_reg_process
      if (reset == 1'b1) begin
        obj_offsetReg <= 5'b00000;
      end
      else begin
        if (enb) begin
          obj_offsetReg <= tmp_28;
        end
      end
    end



  assign p26tmp_1 = {tmp_13, tmp_16, tmp_20, tmp_27};
  assign p26tmp_2 = {1'b0, p26tmp_1};
  assign tmp_29 = p26tmp_2 + obj_offsetReg;



  always @(posedge clk or posedge reset)
    begin : obj_Iaddr_reg_process
      if (reset == 1'b1) begin
        obj_Iaddr <= 5'b00000;
      end
      else begin
        if (enb) begin
          obj_Iaddr <= tmp_29;
        end
      end
    end



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp19
  assign p0Iout_tmp[0] = 16'sb0010110101000001;
  assign p0Iout_tmp[1] = 16'sb1101001010111111;
  assign p0Iout_tmp[2] = 16'sb0001010000111101;
  assign p0Iout_tmp[3] = 16'sb1110101111000011;
  assign p0Iout_tmp[4] = 16'sb0011110010110111;
  assign p0Iout_tmp[5] = 16'sb1100001101001001;
  assign p0Iout_tmp[6] = 16'sb0001110110100000;
  assign p0Iout_tmp[7] = 16'sb1110001001100000;
  assign p0Iout_tmp[8] = 16'sb0011000101100001;
  assign p0Iout_tmp[9] = 16'sb1100111010011111;
  assign p0Iout_tmp[10] = 16'sb0000100111100000;
  assign p0Iout_tmp[11] = 16'sb1111011000100000;
  assign p0Iout_tmp[12] = 16'sb0100010100100001;
  assign p0Iout_tmp[13] = 16'sb1011101011011111;
  assign p0Iout_tmp[14] = 16'sb0001100010001011;
  assign p0Iout_tmp[15] = 16'sb1110011101110101;
  assign p0Iout_tmp[16] = 16'sb0011010111111111;
  assign p0Iout_tmp[17] = 16'sb1100101000000001;
  assign p0Iout_tmp[18] = 16'sb0000111010111010;
  assign p0Iout_tmp[19] = 16'sb1111000101000110;
  assign p0Iout_tmp[20] = 16'sb0011111111010000;
  assign p0Iout_tmp[21] = 16'sb1100000000110000;
  assign p0Iout_tmp[22] = 16'sb0010001001011100;
  assign p0Iout_tmp[23] = 16'sb1101110110100100;
  assign p0Iout_tmp[24] = 16'sb0010110000101101;
  assign p0Iout_tmp[25] = 16'sb1101001111010011;
  assign p0Iout_tmp[26] = 16'sb0000010011101001;
  assign p0Iout_tmp[27] = 16'sb1111101100010111;
  assign p0Iout_tmp[28] = 16'sb0100100110100001;
  assign p0Iout_tmp[29] = 16'sb1011011001011111;
  assign Iout = p0Iout_tmp[obj_Iaddr];



  assign tmp_30 = (obj_validReg == 1'b0 ? obj_Ireg :
              Iout);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp19
  always @(posedge clk or posedge reset)
    begin : obj_Ireg_reg_process
      if (reset == 1'b1) begin
        obj_Ireg <= 16'sb0000000000000000;
      end
      else begin
        if (enb) begin
          obj_Ireg <= tmp_30;
        end
      end
    end



  assign tmp_31 = b7;



  always @(obj_modSelRegReg, tmp_31) begin
    case ( obj_modSelRegReg)
      3'b000 :
        begin
          p31_tmp = 1'b0;
        end
      3'b001 :
        begin
          p31_tmp = 1'b0;
        end
      3'b010 :
        begin
          p31_tmp = 1'b0;
        end
      3'b011 :
        begin
          p31_tmp = 1'b0;
        end
      3'b100 :
        begin
          p31_tmp = tmp_31;
        end
      default :
        begin
          p31_tmp = 1'b0;
        end
    endcase
    tmp_32 = p31_tmp;
  end



  assign tmp_33 = b7;



  assign b5 = buffBits_1[5];



  assign tmp_34 = b5;



  always @(obj_modSelRegReg, tmp_33, tmp_34) begin
    case ( obj_modSelRegReg)
      3'b000 :
        begin
          p33_tmp = 1'b0;
        end
      3'b001 :
        begin
          p33_tmp = 1'b0;
        end
      3'b010 :
        begin
          p33_tmp = 1'b0;
        end
      3'b011 :
        begin
          p33_tmp = tmp_33;
        end
      3'b100 :
        begin
          p33_tmp = tmp_34;
        end
      default :
        begin
          p33_tmp = 1'b0;
        end
    endcase
    tmp_35 = p33_tmp;
  end



  assign tmp_36 = b7;



  assign tmp_37 = b5;



  assign b3 = buffBits_1[3];



  assign tmp_38 = b3;



  always @(obj_modSelRegReg, tmp_36, tmp_37, tmp_38) begin
    case ( obj_modSelRegReg)
      3'b000 :
        begin
          p35_tmp = 1'b0;
        end
      3'b001 :
        begin
          p35_tmp = 1'b0;
        end
      3'b010 :
        begin
          p35_tmp = tmp_36;
        end
      3'b011 :
        begin
          p35_tmp = tmp_37;
        end
      3'b100 :
        begin
          p35_tmp = tmp_38;
        end
      default :
        begin
          p35_tmp = 1'b0;
        end
    endcase
    tmp_39 = p35_tmp;
  end



  assign tmp_40 = b7;



  assign tmp_41 = b7;



  assign tmp_42 = b7;



  assign tmp_43 = b5;



  assign tmp_44 = b3;



  assign tmp_45 = buffBits_1[1];



  always @(obj_modSelRegReg, tmp_40, tmp_41, tmp_42, tmp_43, tmp_44, tmp_45) begin
    case ( obj_modSelRegReg)
      3'b000 :
        begin
          p27_tmp = tmp_41;
        end
      3'b001 :
        begin
          p27_tmp = tmp_42;
        end
      3'b010 :
        begin
          p27_tmp = tmp_43;
        end
      3'b011 :
        begin
          p27_tmp = tmp_44;
        end
      3'b100 :
        begin
          p27_tmp = tmp_45;
        end
      default :
        begin
          p27_tmp = tmp_40;
        end
    endcase
    tmp_46 = p27_tmp;
  end



  assign p24tmp_1 = {tmp_32, tmp_35, tmp_39, tmp_46};
  assign p24tmp_2 = {1'b0, p24tmp_1};
  assign tmp_47 = p24tmp_2 + obj_offsetReg;



  always @(posedge clk or posedge reset)
    begin : obj_Qaddr_reg_process
      if (reset == 1'b1) begin
        obj_Qaddr <= 5'b00000;
      end
      else begin
        if (enb) begin
          obj_Qaddr <= tmp_47;
        end
      end
    end



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp14
  assign p0Qout_tmp[0] = 16'sb0010110101000001;
  assign p0Qout_tmp[1] = 16'sb1101001010111111;
  assign p0Qout_tmp[2] = 16'sb0001010000111101;
  assign p0Qout_tmp[3] = 16'sb1110101111000011;
  assign p0Qout_tmp[4] = 16'sb0011110010110111;
  assign p0Qout_tmp[5] = 16'sb1100001101001001;
  assign p0Qout_tmp[6] = 16'sb0001110110100000;
  assign p0Qout_tmp[7] = 16'sb1110001001100000;
  assign p0Qout_tmp[8] = 16'sb0011000101100001;
  assign p0Qout_tmp[9] = 16'sb1100111010011111;
  assign p0Qout_tmp[10] = 16'sb0000100111100000;
  assign p0Qout_tmp[11] = 16'sb1111011000100000;
  assign p0Qout_tmp[12] = 16'sb0100010100100001;
  assign p0Qout_tmp[13] = 16'sb1011101011011111;
  assign p0Qout_tmp[14] = 16'sb0001100010001011;
  assign p0Qout_tmp[15] = 16'sb1110011101110101;
  assign p0Qout_tmp[16] = 16'sb0011010111111111;
  assign p0Qout_tmp[17] = 16'sb1100101000000001;
  assign p0Qout_tmp[18] = 16'sb0000111010111010;
  assign p0Qout_tmp[19] = 16'sb1111000101000110;
  assign p0Qout_tmp[20] = 16'sb0011111111010000;
  assign p0Qout_tmp[21] = 16'sb1100000000110000;
  assign p0Qout_tmp[22] = 16'sb0010001001011100;
  assign p0Qout_tmp[23] = 16'sb1101110110100100;
  assign p0Qout_tmp[24] = 16'sb0010110000101101;
  assign p0Qout_tmp[25] = 16'sb1101001111010011;
  assign p0Qout_tmp[26] = 16'sb0000010011101001;
  assign p0Qout_tmp[27] = 16'sb1111101100010111;
  assign p0Qout_tmp[28] = 16'sb0100100110100001;
  assign p0Qout_tmp[29] = 16'sb1011011001011111;
  assign Qout = p0Qout_tmp[obj_Qaddr];



  assign tmp_48 = (obj_validReg == 1'b0 ? obj_Qreg :
              Qout);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp14
  always @(posedge clk or posedge reset)
    begin : obj_Qreg_reg_process
      if (reset == 1'b1) begin
        obj_Qreg <= 16'sb0000000000000000;
      end
      else begin
        if (enb) begin
          obj_Qreg <= tmp_48;
        end
      end
    end



  assign data_re = obj_Ireg;
  assign data_im = obj_Qreg;



  assign data1_re = data_re;

  assign data1_im = data_im;

  always @(posedge clk or posedge reset)
    begin : obj_validRegReg_reg_process
      if (reset == 1'b1) begin
        valid_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          valid_1 <= obj_validReg;
        end
      end
    end



  assign valid1 = valid_1;

endmodule  // whdlOFDMTx_LTE_Symbol_Modulator
