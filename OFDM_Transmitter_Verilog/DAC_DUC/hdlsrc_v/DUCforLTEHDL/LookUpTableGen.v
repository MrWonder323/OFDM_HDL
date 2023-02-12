// -------------------------------------------------------------
// 
// File Name: hdlsrc_v\DUCforLTEHDL\LookUpTableGen.v
// Created: 2023-02-09 10:49:26
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: LookUpTableGen
// Source Path: DUCforLTEHDL/HDL_DUC/NCO/WaveformGen/LookUpTableGen
// Hierarchy Level: 3
// 
// Look Up Table Generation Component
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module LookUpTableGen
          (clk,
           enb,
           lutaddr,
           lutoutput);


  input   clk;
  input   enb;
  input   [9:0] lutaddr;  // ufix10
  output  signed [17:0] lutoutput;  // sfix18_En16


  reg [9:0] lutaddrInReg;  // ufix10
  wire [7:0] lut1addr;  // ufix8
  wire [7:0] Lookup_Table1_k;  // ufix8
  wire signed [17:0] Lookup_Table1_table_data [0:255];  // sfix18_En16 [256]
  wire signed [17:0] lut1out;  // sfix18_En16
  wire [3:0] lut2addrp1;  // ufix4
  wire [1:0] lut2addrp2;  // ufix2
  wire [5:0] lut2addr;  // ufix6
  wire [5:0] Lookup_Table2_k;  // ufix6
  wire [4:0] Lookup_Table2_table_data [0:63];  // ufix5_En5 [64]
  wire [4:0] lut2out;  // ufix5_En5
  reg signed [17:0] lut1out_reg;  // sfix18_En16
  reg [4:0] lut2out_reg;  // ufix5_En5
  wire signed [17:0] lut2out_extend;  // sfix18_En16
  wire signed [17:0] lut2out_sf;  // sfix18_En16
  wire signed [18:0] adder_add_cast;  // sfix19_En16
  wire signed [18:0] adder_add_cast_1;  // sfix19_En16
  wire signed [18:0] addlutouts;  // sfix19_En16
  reg signed [18:0] addlutoutreg;  // sfix19_En16

  initial begin
    lutaddrInReg = 10'b0000000000;
    lut1out_reg = 18'sb000000000000000000;
    lut2out_reg = 5'b00000;
    addlutoutreg = 19'sb0000000000000000000;
  end

  // Look up table address input register
  always @(posedge clk)
    begin : LUTaddrRegister_process
      if (enb) begin
        lutaddrInReg <= lutaddr;
      end
    end



  // Lookup table 1 address
  assign lut1addr = lutaddrInReg[9:2];



  // Quarter sine wave table-Part1
  assign Lookup_Table1_table_data[0] = 18'sb000000000000000000;
  assign Lookup_Table1_table_data[1] = 18'sb000000000110010010;
  assign Lookup_Table1_table_data[2] = 18'sb000000001100100100;
  assign Lookup_Table1_table_data[3] = 18'sb000000010010110110;
  assign Lookup_Table1_table_data[4] = 18'sb000000011001001000;
  assign Lookup_Table1_table_data[5] = 18'sb000000011111011010;
  assign Lookup_Table1_table_data[6] = 18'sb000000100101101100;
  assign Lookup_Table1_table_data[7] = 18'sb000000101011111110;
  assign Lookup_Table1_table_data[8] = 18'sb000000110010010000;
  assign Lookup_Table1_table_data[9] = 18'sb000000111000100001;
  assign Lookup_Table1_table_data[10] = 18'sb000000111110110011;
  assign Lookup_Table1_table_data[11] = 18'sb000001000101000100;
  assign Lookup_Table1_table_data[12] = 18'sb000001001011010101;
  assign Lookup_Table1_table_data[13] = 18'sb000001010001100110;
  assign Lookup_Table1_table_data[14] = 18'sb000001010111110111;
  assign Lookup_Table1_table_data[15] = 18'sb000001011110000111;
  assign Lookup_Table1_table_data[16] = 18'sb000001100100011000;
  assign Lookup_Table1_table_data[17] = 18'sb000001101010101000;
  assign Lookup_Table1_table_data[18] = 18'sb000001110000111000;
  assign Lookup_Table1_table_data[19] = 18'sb000001110111000111;
  assign Lookup_Table1_table_data[20] = 18'sb000001111101010110;
  assign Lookup_Table1_table_data[21] = 18'sb000010000011100101;
  assign Lookup_Table1_table_data[22] = 18'sb000010001001110100;
  assign Lookup_Table1_table_data[23] = 18'sb000010010000000010;
  assign Lookup_Table1_table_data[24] = 18'sb000010010110010000;
  assign Lookup_Table1_table_data[25] = 18'sb000010011100011110;
  assign Lookup_Table1_table_data[26] = 18'sb000010100010101011;
  assign Lookup_Table1_table_data[27] = 18'sb000010101000111000;
  assign Lookup_Table1_table_data[28] = 18'sb000010101111000100;
  assign Lookup_Table1_table_data[29] = 18'sb000010110101010000;
  assign Lookup_Table1_table_data[30] = 18'sb000010111011011100;
  assign Lookup_Table1_table_data[31] = 18'sb000011000001100111;
  assign Lookup_Table1_table_data[32] = 18'sb000011000111110001;
  assign Lookup_Table1_table_data[33] = 18'sb000011001101111100;
  assign Lookup_Table1_table_data[34] = 18'sb000011010100000101;
  assign Lookup_Table1_table_data[35] = 18'sb000011011010001110;
  assign Lookup_Table1_table_data[36] = 18'sb000011100000010111;
  assign Lookup_Table1_table_data[37] = 18'sb000011100110011111;
  assign Lookup_Table1_table_data[38] = 18'sb000011101100100111;
  assign Lookup_Table1_table_data[39] = 18'sb000011110010101110;
  assign Lookup_Table1_table_data[40] = 18'sb000011111000110100;
  assign Lookup_Table1_table_data[41] = 18'sb000011111110111010;
  assign Lookup_Table1_table_data[42] = 18'sb000100000100111111;
  assign Lookup_Table1_table_data[43] = 18'sb000100001011000011;
  assign Lookup_Table1_table_data[44] = 18'sb000100010001000111;
  assign Lookup_Table1_table_data[45] = 18'sb000100010111001011;
  assign Lookup_Table1_table_data[46] = 18'sb000100011101001101;
  assign Lookup_Table1_table_data[47] = 18'sb000100100011001111;
  assign Lookup_Table1_table_data[48] = 18'sb000100101001010000;
  assign Lookup_Table1_table_data[49] = 18'sb000100101111010001;
  assign Lookup_Table1_table_data[50] = 18'sb000100110101010000;
  assign Lookup_Table1_table_data[51] = 18'sb000100111011001111;
  assign Lookup_Table1_table_data[52] = 18'sb000101000001001101;
  assign Lookup_Table1_table_data[53] = 18'sb000101000111001011;
  assign Lookup_Table1_table_data[54] = 18'sb000101001101001000;
  assign Lookup_Table1_table_data[55] = 18'sb000101010011000011;
  assign Lookup_Table1_table_data[56] = 18'sb000101011000111110;
  assign Lookup_Table1_table_data[57] = 18'sb000101011110111001;
  assign Lookup_Table1_table_data[58] = 18'sb000101100100110010;
  assign Lookup_Table1_table_data[59] = 18'sb000101101010101010;
  assign Lookup_Table1_table_data[60] = 18'sb000101110000100010;
  assign Lookup_Table1_table_data[61] = 18'sb000101110110011001;
  assign Lookup_Table1_table_data[62] = 18'sb000101111100001111;
  assign Lookup_Table1_table_data[63] = 18'sb000110000010000100;
  assign Lookup_Table1_table_data[64] = 18'sb000110000111111000;
  assign Lookup_Table1_table_data[65] = 18'sb000110001101101011;
  assign Lookup_Table1_table_data[66] = 18'sb000110010011011101;
  assign Lookup_Table1_table_data[67] = 18'sb000110011001001110;
  assign Lookup_Table1_table_data[68] = 18'sb000110011110111110;
  assign Lookup_Table1_table_data[69] = 18'sb000110100100101101;
  assign Lookup_Table1_table_data[70] = 18'sb000110101010011011;
  assign Lookup_Table1_table_data[71] = 18'sb000110110000001000;
  assign Lookup_Table1_table_data[72] = 18'sb000110110101110100;
  assign Lookup_Table1_table_data[73] = 18'sb000110111011011111;
  assign Lookup_Table1_table_data[74] = 18'sb000111000001001001;
  assign Lookup_Table1_table_data[75] = 18'sb000111000110110010;
  assign Lookup_Table1_table_data[76] = 18'sb000111001100011010;
  assign Lookup_Table1_table_data[77] = 18'sb000111010010000000;
  assign Lookup_Table1_table_data[78] = 18'sb000111010111100110;
  assign Lookup_Table1_table_data[79] = 18'sb000111011101001010;
  assign Lookup_Table1_table_data[80] = 18'sb000111100010101101;
  assign Lookup_Table1_table_data[81] = 18'sb000111101000010000;
  assign Lookup_Table1_table_data[82] = 18'sb000111101101110000;
  assign Lookup_Table1_table_data[83] = 18'sb000111110011010000;
  assign Lookup_Table1_table_data[84] = 18'sb000111111000101111;
  assign Lookup_Table1_table_data[85] = 18'sb000111111110001100;
  assign Lookup_Table1_table_data[86] = 18'sb001000000011101000;
  assign Lookup_Table1_table_data[87] = 18'sb001000001001000011;
  assign Lookup_Table1_table_data[88] = 18'sb001000001110011100;
  assign Lookup_Table1_table_data[89] = 18'sb001000010011110101;
  assign Lookup_Table1_table_data[90] = 18'sb001000011001001100;
  assign Lookup_Table1_table_data[91] = 18'sb001000011110100001;
  assign Lookup_Table1_table_data[92] = 18'sb001000100011110110;
  assign Lookup_Table1_table_data[93] = 18'sb001000101001001001;
  assign Lookup_Table1_table_data[94] = 18'sb001000101110011010;
  assign Lookup_Table1_table_data[95] = 18'sb001000110011101011;
  assign Lookup_Table1_table_data[96] = 18'sb001000111000111010;
  assign Lookup_Table1_table_data[97] = 18'sb001000111110001000;
  assign Lookup_Table1_table_data[98] = 18'sb001001000011010100;
  assign Lookup_Table1_table_data[99] = 18'sb001001001000011111;
  assign Lookup_Table1_table_data[100] = 18'sb001001001101101000;
  assign Lookup_Table1_table_data[101] = 18'sb001001010010110000;
  assign Lookup_Table1_table_data[102] = 18'sb001001010111110111;
  assign Lookup_Table1_table_data[103] = 18'sb001001011100111100;
  assign Lookup_Table1_table_data[104] = 18'sb001001100010000000;
  assign Lookup_Table1_table_data[105] = 18'sb001001100111000010;
  assign Lookup_Table1_table_data[106] = 18'sb001001101100000011;
  assign Lookup_Table1_table_data[107] = 18'sb001001110001000010;
  assign Lookup_Table1_table_data[108] = 18'sb001001110110000000;
  assign Lookup_Table1_table_data[109] = 18'sb001001111010111100;
  assign Lookup_Table1_table_data[110] = 18'sb001001111111110111;
  assign Lookup_Table1_table_data[111] = 18'sb001010000100110000;
  assign Lookup_Table1_table_data[112] = 18'sb001010001001101000;
  assign Lookup_Table1_table_data[113] = 18'sb001010001110011110;
  assign Lookup_Table1_table_data[114] = 18'sb001010010011010010;
  assign Lookup_Table1_table_data[115] = 18'sb001010011000000101;
  assign Lookup_Table1_table_data[116] = 18'sb001010011100110110;
  assign Lookup_Table1_table_data[117] = 18'sb001010100001100110;
  assign Lookup_Table1_table_data[118] = 18'sb001010100110010100;
  assign Lookup_Table1_table_data[119] = 18'sb001010101011000001;
  assign Lookup_Table1_table_data[120] = 18'sb001010101111101011;
  assign Lookup_Table1_table_data[121] = 18'sb001010110100010100;
  assign Lookup_Table1_table_data[122] = 18'sb001010111000111100;
  assign Lookup_Table1_table_data[123] = 18'sb001010111101100010;
  assign Lookup_Table1_table_data[124] = 18'sb001011000010000110;
  assign Lookup_Table1_table_data[125] = 18'sb001011000110101000;
  assign Lookup_Table1_table_data[126] = 18'sb001011001011001001;
  assign Lookup_Table1_table_data[127] = 18'sb001011001111101000;
  assign Lookup_Table1_table_data[128] = 18'sb001011010100000101;
  assign Lookup_Table1_table_data[129] = 18'sb001011011000100000;
  assign Lookup_Table1_table_data[130] = 18'sb001011011100111010;
  assign Lookup_Table1_table_data[131] = 18'sb001011100001010010;
  assign Lookup_Table1_table_data[132] = 18'sb001011100101101000;
  assign Lookup_Table1_table_data[133] = 18'sb001011101001111101;
  assign Lookup_Table1_table_data[134] = 18'sb001011101110001111;
  assign Lookup_Table1_table_data[135] = 18'sb001011110010100000;
  assign Lookup_Table1_table_data[136] = 18'sb001011110110101111;
  assign Lookup_Table1_table_data[137] = 18'sb001011111010111100;
  assign Lookup_Table1_table_data[138] = 18'sb001011111111000111;
  assign Lookup_Table1_table_data[139] = 18'sb001100000011010001;
  assign Lookup_Table1_table_data[140] = 18'sb001100000111011000;
  assign Lookup_Table1_table_data[141] = 18'sb001100001011011110;
  assign Lookup_Table1_table_data[142] = 18'sb001100001111100010;
  assign Lookup_Table1_table_data[143] = 18'sb001100010011100100;
  assign Lookup_Table1_table_data[144] = 18'sb001100010111100100;
  assign Lookup_Table1_table_data[145] = 18'sb001100011011100010;
  assign Lookup_Table1_table_data[146] = 18'sb001100011111011110;
  assign Lookup_Table1_table_data[147] = 18'sb001100100011011001;
  assign Lookup_Table1_table_data[148] = 18'sb001100100111010001;
  assign Lookup_Table1_table_data[149] = 18'sb001100101011000111;
  assign Lookup_Table1_table_data[150] = 18'sb001100101110111100;
  assign Lookup_Table1_table_data[151] = 18'sb001100110010101110;
  assign Lookup_Table1_table_data[152] = 18'sb001100110110011111;
  assign Lookup_Table1_table_data[153] = 18'sb001100111010001110;
  assign Lookup_Table1_table_data[154] = 18'sb001100111101111010;
  assign Lookup_Table1_table_data[155] = 18'sb001101000001100101;
  assign Lookup_Table1_table_data[156] = 18'sb001101000101001101;
  assign Lookup_Table1_table_data[157] = 18'sb001101001000110100;
  assign Lookup_Table1_table_data[158] = 18'sb001101001100011000;
  assign Lookup_Table1_table_data[159] = 18'sb001101001111111011;
  assign Lookup_Table1_table_data[160] = 18'sb001101010011011011;
  assign Lookup_Table1_table_data[161] = 18'sb001101010110111010;
  assign Lookup_Table1_table_data[162] = 18'sb001101011010010110;
  assign Lookup_Table1_table_data[163] = 18'sb001101011101110000;
  assign Lookup_Table1_table_data[164] = 18'sb001101100001001000;
  assign Lookup_Table1_table_data[165] = 18'sb001101100100011110;
  assign Lookup_Table1_table_data[166] = 18'sb001101100111110010;
  assign Lookup_Table1_table_data[167] = 18'sb001101101011000100;
  assign Lookup_Table1_table_data[168] = 18'sb001101101110010100;
  assign Lookup_Table1_table_data[169] = 18'sb001101110001100010;
  assign Lookup_Table1_table_data[170] = 18'sb001101110100101101;
  assign Lookup_Table1_table_data[171] = 18'sb001101110111110111;
  assign Lookup_Table1_table_data[172] = 18'sb001101111010111110;
  assign Lookup_Table1_table_data[173] = 18'sb001101111110000011;
  assign Lookup_Table1_table_data[174] = 18'sb001110000001000110;
  assign Lookup_Table1_table_data[175] = 18'sb001110000100000111;
  assign Lookup_Table1_table_data[176] = 18'sb001110000111000110;
  assign Lookup_Table1_table_data[177] = 18'sb001110001010000010;
  assign Lookup_Table1_table_data[178] = 18'sb001110001100111100;
  assign Lookup_Table1_table_data[179] = 18'sb001110001111110100;
  assign Lookup_Table1_table_data[180] = 18'sb001110010010101010;
  assign Lookup_Table1_table_data[181] = 18'sb001110010101011110;
  assign Lookup_Table1_table_data[182] = 18'sb001110011000010000;
  assign Lookup_Table1_table_data[183] = 18'sb001110011010111111;
  assign Lookup_Table1_table_data[184] = 18'sb001110011101101100;
  assign Lookup_Table1_table_data[185] = 18'sb001110100000010111;
  assign Lookup_Table1_table_data[186] = 18'sb001110100010111111;
  assign Lookup_Table1_table_data[187] = 18'sb001110100101100110;
  assign Lookup_Table1_table_data[188] = 18'sb001110101000001010;
  assign Lookup_Table1_table_data[189] = 18'sb001110101010101011;
  assign Lookup_Table1_table_data[190] = 18'sb001110101101001011;
  assign Lookup_Table1_table_data[191] = 18'sb001110101111101000;
  assign Lookup_Table1_table_data[192] = 18'sb001110110010000011;
  assign Lookup_Table1_table_data[193] = 18'sb001110110100011100;
  assign Lookup_Table1_table_data[194] = 18'sb001110110110110011;
  assign Lookup_Table1_table_data[195] = 18'sb001110111001000111;
  assign Lookup_Table1_table_data[196] = 18'sb001110111011011001;
  assign Lookup_Table1_table_data[197] = 18'sb001110111101101000;
  assign Lookup_Table1_table_data[198] = 18'sb001110111111110101;
  assign Lookup_Table1_table_data[199] = 18'sb001111000010000000;
  assign Lookup_Table1_table_data[200] = 18'sb001111000100001001;
  assign Lookup_Table1_table_data[201] = 18'sb001111000110001111;
  assign Lookup_Table1_table_data[202] = 18'sb001111001000010011;
  assign Lookup_Table1_table_data[203] = 18'sb001111001010010101;
  assign Lookup_Table1_table_data[204] = 18'sb001111001100010100;
  assign Lookup_Table1_table_data[205] = 18'sb001111001110010001;
  assign Lookup_Table1_table_data[206] = 18'sb001111010000001100;
  assign Lookup_Table1_table_data[207] = 18'sb001111010010000100;
  assign Lookup_Table1_table_data[208] = 18'sb001111010011111010;
  assign Lookup_Table1_table_data[209] = 18'sb001111010101101110;
  assign Lookup_Table1_table_data[210] = 18'sb001111010111011111;
  assign Lookup_Table1_table_data[211] = 18'sb001111011001001110;
  assign Lookup_Table1_table_data[212] = 18'sb001111011010111010;
  assign Lookup_Table1_table_data[213] = 18'sb001111011100100100;
  assign Lookup_Table1_table_data[214] = 18'sb001111011110001100;
  assign Lookup_Table1_table_data[215] = 18'sb001111011111110001;
  assign Lookup_Table1_table_data[216] = 18'sb001111100001010100;
  assign Lookup_Table1_table_data[217] = 18'sb001111100010110100;
  assign Lookup_Table1_table_data[218] = 18'sb001111100100010011;
  assign Lookup_Table1_table_data[219] = 18'sb001111100101101110;
  assign Lookup_Table1_table_data[220] = 18'sb001111100111001000;
  assign Lookup_Table1_table_data[221] = 18'sb001111101000011111;
  assign Lookup_Table1_table_data[222] = 18'sb001111101001110011;
  assign Lookup_Table1_table_data[223] = 18'sb001111101011000101;
  assign Lookup_Table1_table_data[224] = 18'sb001111101100010101;
  assign Lookup_Table1_table_data[225] = 18'sb001111101101100010;
  assign Lookup_Table1_table_data[226] = 18'sb001111101110101101;
  assign Lookup_Table1_table_data[227] = 18'sb001111101111110101;
  assign Lookup_Table1_table_data[228] = 18'sb001111110000111011;
  assign Lookup_Table1_table_data[229] = 18'sb001111110001111111;
  assign Lookup_Table1_table_data[230] = 18'sb001111110011000000;
  assign Lookup_Table1_table_data[231] = 18'sb001111110011111110;
  assign Lookup_Table1_table_data[232] = 18'sb001111110100111011;
  assign Lookup_Table1_table_data[233] = 18'sb001111110101110100;
  assign Lookup_Table1_table_data[234] = 18'sb001111110110101100;
  assign Lookup_Table1_table_data[235] = 18'sb001111110111100001;
  assign Lookup_Table1_table_data[236] = 18'sb001111111000010011;
  assign Lookup_Table1_table_data[237] = 18'sb001111111001000011;
  assign Lookup_Table1_table_data[238] = 18'sb001111111001110001;
  assign Lookup_Table1_table_data[239] = 18'sb001111111010011100;
  assign Lookup_Table1_table_data[240] = 18'sb001111111011000100;
  assign Lookup_Table1_table_data[241] = 18'sb001111111011101011;
  assign Lookup_Table1_table_data[242] = 18'sb001111111100001110;
  assign Lookup_Table1_table_data[243] = 18'sb001111111100110000;
  assign Lookup_Table1_table_data[244] = 18'sb001111111101001110;
  assign Lookup_Table1_table_data[245] = 18'sb001111111101101011;
  assign Lookup_Table1_table_data[246] = 18'sb001111111110000101;
  assign Lookup_Table1_table_data[247] = 18'sb001111111110011100;
  assign Lookup_Table1_table_data[248] = 18'sb001111111110110001;
  assign Lookup_Table1_table_data[249] = 18'sb001111111111000100;
  assign Lookup_Table1_table_data[250] = 18'sb001111111111010100;
  assign Lookup_Table1_table_data[251] = 18'sb001111111111100001;
  assign Lookup_Table1_table_data[252] = 18'sb001111111111101100;
  assign Lookup_Table1_table_data[253] = 18'sb001111111111110101;
  assign Lookup_Table1_table_data[254] = 18'sb001111111111111011;
  assign Lookup_Table1_table_data[255] = 18'sb001111111111111111;
  assign Lookup_Table1_k = (lut1addr == 8'b00000000 ? 8'b00000000 :
              (lut1addr == 8'b11111111 ? 8'b11111111 :
              lut1addr));
  assign lut1out = Lookup_Table1_table_data[Lookup_Table1_k];



  assign lut2addrp1 = lutaddrInReg[9:6];



  assign lut2addrp2 = lutaddrInReg[1:0];



  // Lookup table 2 address
  assign lut2addr = {lut2addrp1, lut2addrp2};



  // Quarter Sine Wave Table-Part2
  assign Lookup_Table2_table_data[0] = 5'b00000;
  assign Lookup_Table2_table_data[1] = 5'b00110;
  assign Lookup_Table2_table_data[2] = 5'b01101;
  assign Lookup_Table2_table_data[3] = 5'b10011;
  assign Lookup_Table2_table_data[4] = 5'b00000;
  assign Lookup_Table2_table_data[5] = 5'b00110;
  assign Lookup_Table2_table_data[6] = 5'b01101;
  assign Lookup_Table2_table_data[7] = 5'b10011;
  assign Lookup_Table2_table_data[8] = 5'b00000;
  assign Lookup_Table2_table_data[9] = 5'b00110;
  assign Lookup_Table2_table_data[10] = 5'b01100;
  assign Lookup_Table2_table_data[11] = 5'b10010;
  assign Lookup_Table2_table_data[12] = 5'b00000;
  assign Lookup_Table2_table_data[13] = 5'b00110;
  assign Lookup_Table2_table_data[14] = 5'b01100;
  assign Lookup_Table2_table_data[15] = 5'b10010;
  assign Lookup_Table2_table_data[16] = 5'b00000;
  assign Lookup_Table2_table_data[17] = 5'b00110;
  assign Lookup_Table2_table_data[18] = 5'b01100;
  assign Lookup_Table2_table_data[19] = 5'b10001;
  assign Lookup_Table2_table_data[20] = 5'b00000;
  assign Lookup_Table2_table_data[21] = 5'b00110;
  assign Lookup_Table2_table_data[22] = 5'b01011;
  assign Lookup_Table2_table_data[23] = 5'b10001;
  assign Lookup_Table2_table_data[24] = 5'b00000;
  assign Lookup_Table2_table_data[25] = 5'b00101;
  assign Lookup_Table2_table_data[26] = 5'b01010;
  assign Lookup_Table2_table_data[27] = 5'b10000;
  assign Lookup_Table2_table_data[28] = 5'b00000;
  assign Lookup_Table2_table_data[29] = 5'b00101;
  assign Lookup_Table2_table_data[30] = 5'b01010;
  assign Lookup_Table2_table_data[31] = 5'b01111;
  assign Lookup_Table2_table_data[32] = 5'b00000;
  assign Lookup_Table2_table_data[33] = 5'b00100;
  assign Lookup_Table2_table_data[34] = 5'b01001;
  assign Lookup_Table2_table_data[35] = 5'b01101;
  assign Lookup_Table2_table_data[36] = 5'b00000;
  assign Lookup_Table2_table_data[37] = 5'b00100;
  assign Lookup_Table2_table_data[38] = 5'b01000;
  assign Lookup_Table2_table_data[39] = 5'b01100;
  assign Lookup_Table2_table_data[40] = 5'b00000;
  assign Lookup_Table2_table_data[41] = 5'b00011;
  assign Lookup_Table2_table_data[42] = 5'b00111;
  assign Lookup_Table2_table_data[43] = 5'b01010;
  assign Lookup_Table2_table_data[44] = 5'b00000;
  assign Lookup_Table2_table_data[45] = 5'b00011;
  assign Lookup_Table2_table_data[46] = 5'b00110;
  assign Lookup_Table2_table_data[47] = 5'b01001;
  assign Lookup_Table2_table_data[48] = 5'b00000;
  assign Lookup_Table2_table_data[49] = 5'b00010;
  assign Lookup_Table2_table_data[50] = 5'b00101;
  assign Lookup_Table2_table_data[51] = 5'b00111;
  assign Lookup_Table2_table_data[52] = 5'b00000;
  assign Lookup_Table2_table_data[53] = 5'b00010;
  assign Lookup_Table2_table_data[54] = 5'b00100;
  assign Lookup_Table2_table_data[55] = 5'b00101;
  assign Lookup_Table2_table_data[56] = 5'b00000;
  assign Lookup_Table2_table_data[57] = 5'b00001;
  assign Lookup_Table2_table_data[58] = 5'b00010;
  assign Lookup_Table2_table_data[59] = 5'b00100;
  assign Lookup_Table2_table_data[60] = 5'b00000;
  assign Lookup_Table2_table_data[61] = 5'b00001;
  assign Lookup_Table2_table_data[62] = 5'b00001;
  assign Lookup_Table2_table_data[63] = 5'b00010;
  assign Lookup_Table2_k = (lut2addr == 6'b000000 ? 6'b000000 :
              (lut2addr == 6'b111111 ? 6'b111111 :
              lut2addr));
  assign lut2out = Lookup_Table2_table_data[Lookup_Table2_k];



  // Lookup table1 output register
  always @(posedge clk)
    begin : LUT1outRegister_process
      if (enb) begin
        lut1out_reg <= lut1out;
      end
    end



  // Lookup table2 output register
  always @(posedge clk)
    begin : LUT2outRegister_process
      if (enb) begin
        lut2out_reg <= lut2out;
      end
    end



  assign lut2out_extend = {2'b0, {lut2out_reg, 11'b00000000000}};



  // Shift look up table 2 outputs
  assign lut2out_sf = lut2out_extend >> 8'd7;



  // Compute look up table output
  assign adder_add_cast = {lut1out_reg[17], lut1out_reg};
  assign adder_add_cast_1 = {lut2out_sf[17], lut2out_sf};
  assign addlutouts = adder_add_cast + adder_add_cast_1;



  // Look up table output register
  always @(posedge clk)
    begin : LUTAddoutRegister_process
      if (enb) begin
        addlutoutreg <= addlutouts;
      end
    end



  assign lutoutput = ((addlutoutreg[18] == 1'b0) && (addlutoutreg[17] != 1'b0) ? 18'sb011111111111111111 :
              ((addlutoutreg[18] == 1'b1) && (addlutoutreg[17] != 1'b1) ? 18'sb100000000000000000 :
              $signed(addlutoutreg[17:0])));



endmodule  // LookUpTableGen
