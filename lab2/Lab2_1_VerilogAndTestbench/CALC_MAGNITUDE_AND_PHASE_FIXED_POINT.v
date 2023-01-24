// -------------------------------------------------------------
// 
// File Name: D:\КЕОА\3 курс\Апараткі\Лаба №2\Lab2_1(second try)\Lab2_1\CALC_MAGNITUDE_AND_PHASE_FIXED_POINT.v
// Created: 2023-01-24 19:19:22
// 
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// O_MAGNITUDE                   ce_out        1
// O_PHASE                       ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: CALC_MAGNITUDE_AND_PHASE_FIXED_POINT
// Source Path: Lab2_1/CALC_MAGNITUDE_AND_PHASE_FIXED_POINT
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module CALC_MAGNITUDE_AND_PHASE_FIXED_POINT
          (clk,
           reset,
           clk_enable,
           I_COMPLEX_VALUE_re,
           I_COMPLEX_VALUE_im,
           ce_out,
           O_MAGNITUDE,
           O_PHASE);


  input   clk;
  input   reset;
  input   clk_enable;
  input   [31:0] I_COMPLEX_VALUE_re;  // ufix32_En12
  input   [31:0] I_COMPLEX_VALUE_im;  // ufix32_En12
  output  ce_out;
  output  [32:0] O_MAGNITUDE;  // ufix33_En12
  output  [15:0] O_PHASE;  // ufix16_En13


  wire enb;
  reg [31:0] Complex_to_Real_Imag_out1;  // ufix32_En12
  wire [63:0] Product_out1;  // ufix64_En24
  reg [63:0] Product_out1_1;  // ufix64_En24
  reg [31:0] Complex_to_Real_Imag_out2;  // ufix32_En12
  wire [63:0] Product1_out1;  // ufix64_En24
  reg [63:0] Product1_out1_1;  // ufix64_En24
  wire [64:0] Add_add_cast;  // ufix65_En24
  wire [64:0] Add_add_cast_1;  // ufix65_En24
  wire [64:0] Add_out1;  // ufix65_En24
  wire [32:0] Sqrt_out1;  // ufix33_En12
  wire signed [31:0] Data_Type_Conversion2_out1;  // sfix32_En12
  wire signed [31:0] Data_Type_Conversion3_out1;  // sfix32_En12
  wire signed [31:0] Atan2_out1;  // sfix32_En29
  wire [15:0] Data_Type_Conversion1_out1;  // ufix16_En13
  reg [15:0] delayMatch_reg [0:22];  // ufix16 [23]
  wire [15:0] delayMatch_reg_next [0:22];  // ufix16_En13 [23]
  wire [15:0] Data_Type_Conversion1_out1_1;  // ufix16_En13


  assign enb = clk_enable;

  always @(posedge clk or posedge reset)
    begin : reduced_process
      if (reset == 1'b1) begin
        Complex_to_Real_Imag_out1 <= 32'b00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          Complex_to_Real_Imag_out1 <= I_COMPLEX_VALUE_re;
        end
      end
    end



  assign Product_out1 = Complex_to_Real_Imag_out1 * Complex_to_Real_Imag_out1;



  always @(posedge clk or posedge reset)
    begin : PipelineRegister_process
      if (reset == 1'b1) begin
        Product_out1_1 <= 64'h0000000000000000;
      end
      else begin
        if (enb) begin
          Product_out1_1 <= Product_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reduced_1_process
      if (reset == 1'b1) begin
        Complex_to_Real_Imag_out2 <= 32'b00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          Complex_to_Real_Imag_out2 <= I_COMPLEX_VALUE_im;
        end
      end
    end



  assign Product1_out1 = Complex_to_Real_Imag_out2 * Complex_to_Real_Imag_out2;



  always @(posedge clk or posedge reset)
    begin : PipelineRegister1_process
      if (reset == 1'b1) begin
        Product1_out1_1 <= 64'h0000000000000000;
      end
      else begin
        if (enb) begin
          Product1_out1_1 <= Product1_out1;
        end
      end
    end



  assign Add_add_cast = {1'b0, Product_out1_1};
  assign Add_add_cast_1 = {1'b0, Product1_out1_1};
  assign Add_out1 = Add_add_cast + Add_add_cast_1;



  Sqrt u_Sqrt (.clk(clk),
               .reset(reset),
               .enb(clk_enable),
               .din(Add_out1),  // ufix65_En24
               .dout(Sqrt_out1)  // ufix33_En12
               );

  assign O_MAGNITUDE = Sqrt_out1;

  assign Data_Type_Conversion2_out1 = I_COMPLEX_VALUE_im;



  assign Data_Type_Conversion3_out1 = I_COMPLEX_VALUE_re;



  atan2_cordic_nw u_Atan2_inst (.clk(clk),
                                .reset(reset),
                                .enb(clk_enable),
                                .y_in(Data_Type_Conversion2_out1),  // sfix32_En12
                                .x_in(Data_Type_Conversion3_out1),  // sfix32_En12
                                .angle(Atan2_out1)  // sfix32_En29
                                );

  assign Data_Type_Conversion1_out1 = Atan2_out1[31:16] + (Atan2_out1[15] & (( ~ Atan2_out1[31]) | (|Atan2_out1[14:0])));



  always @(posedge clk or posedge reset)
    begin : delayMatch_process
      if (reset == 1'b1) begin
        delayMatch_reg[0] <= 16'b0000000000000000;
        delayMatch_reg[1] <= 16'b0000000000000000;
        delayMatch_reg[2] <= 16'b0000000000000000;
        delayMatch_reg[3] <= 16'b0000000000000000;
        delayMatch_reg[4] <= 16'b0000000000000000;
        delayMatch_reg[5] <= 16'b0000000000000000;
        delayMatch_reg[6] <= 16'b0000000000000000;
        delayMatch_reg[7] <= 16'b0000000000000000;
        delayMatch_reg[8] <= 16'b0000000000000000;
        delayMatch_reg[9] <= 16'b0000000000000000;
        delayMatch_reg[10] <= 16'b0000000000000000;
        delayMatch_reg[11] <= 16'b0000000000000000;
        delayMatch_reg[12] <= 16'b0000000000000000;
        delayMatch_reg[13] <= 16'b0000000000000000;
        delayMatch_reg[14] <= 16'b0000000000000000;
        delayMatch_reg[15] <= 16'b0000000000000000;
        delayMatch_reg[16] <= 16'b0000000000000000;
        delayMatch_reg[17] <= 16'b0000000000000000;
        delayMatch_reg[18] <= 16'b0000000000000000;
        delayMatch_reg[19] <= 16'b0000000000000000;
        delayMatch_reg[20] <= 16'b0000000000000000;
        delayMatch_reg[21] <= 16'b0000000000000000;
        delayMatch_reg[22] <= 16'b0000000000000000;
      end
      else begin
        if (enb) begin
          delayMatch_reg[0] <= delayMatch_reg_next[0];
          delayMatch_reg[1] <= delayMatch_reg_next[1];
          delayMatch_reg[2] <= delayMatch_reg_next[2];
          delayMatch_reg[3] <= delayMatch_reg_next[3];
          delayMatch_reg[4] <= delayMatch_reg_next[4];
          delayMatch_reg[5] <= delayMatch_reg_next[5];
          delayMatch_reg[6] <= delayMatch_reg_next[6];
          delayMatch_reg[7] <= delayMatch_reg_next[7];
          delayMatch_reg[8] <= delayMatch_reg_next[8];
          delayMatch_reg[9] <= delayMatch_reg_next[9];
          delayMatch_reg[10] <= delayMatch_reg_next[10];
          delayMatch_reg[11] <= delayMatch_reg_next[11];
          delayMatch_reg[12] <= delayMatch_reg_next[12];
          delayMatch_reg[13] <= delayMatch_reg_next[13];
          delayMatch_reg[14] <= delayMatch_reg_next[14];
          delayMatch_reg[15] <= delayMatch_reg_next[15];
          delayMatch_reg[16] <= delayMatch_reg_next[16];
          delayMatch_reg[17] <= delayMatch_reg_next[17];
          delayMatch_reg[18] <= delayMatch_reg_next[18];
          delayMatch_reg[19] <= delayMatch_reg_next[19];
          delayMatch_reg[20] <= delayMatch_reg_next[20];
          delayMatch_reg[21] <= delayMatch_reg_next[21];
          delayMatch_reg[22] <= delayMatch_reg_next[22];
        end
      end
    end

  assign Data_Type_Conversion1_out1_1 = delayMatch_reg[22];
  assign delayMatch_reg_next[0] = Data_Type_Conversion1_out1;
  assign delayMatch_reg_next[1] = delayMatch_reg[0];
  assign delayMatch_reg_next[2] = delayMatch_reg[1];
  assign delayMatch_reg_next[3] = delayMatch_reg[2];
  assign delayMatch_reg_next[4] = delayMatch_reg[3];
  assign delayMatch_reg_next[5] = delayMatch_reg[4];
  assign delayMatch_reg_next[6] = delayMatch_reg[5];
  assign delayMatch_reg_next[7] = delayMatch_reg[6];
  assign delayMatch_reg_next[8] = delayMatch_reg[7];
  assign delayMatch_reg_next[9] = delayMatch_reg[8];
  assign delayMatch_reg_next[10] = delayMatch_reg[9];
  assign delayMatch_reg_next[11] = delayMatch_reg[10];
  assign delayMatch_reg_next[12] = delayMatch_reg[11];
  assign delayMatch_reg_next[13] = delayMatch_reg[12];
  assign delayMatch_reg_next[14] = delayMatch_reg[13];
  assign delayMatch_reg_next[15] = delayMatch_reg[14];
  assign delayMatch_reg_next[16] = delayMatch_reg[15];
  assign delayMatch_reg_next[17] = delayMatch_reg[16];
  assign delayMatch_reg_next[18] = delayMatch_reg[17];
  assign delayMatch_reg_next[19] = delayMatch_reg[18];
  assign delayMatch_reg_next[20] = delayMatch_reg[19];
  assign delayMatch_reg_next[21] = delayMatch_reg[20];
  assign delayMatch_reg_next[22] = delayMatch_reg[21];



  assign O_PHASE = Data_Type_Conversion1_out1_1;

  assign ce_out = clk_enable;

endmodule  // CALC_MAGNITUDE_AND_PHASE_FIXED_POINT
