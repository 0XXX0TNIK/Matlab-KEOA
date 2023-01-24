// -------------------------------------------------------------
// 
// File Name: D:\КЕОА\3 курс\Апараткі\Лаба №2\Lab2_1(second try)\Lab2_1\atan2_cordic_nw.v
// Created: 2023-01-24 19:19:22
// 
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: atan2_cordic_nw
// Source Path: Lab2_1/CALC_MAGNITUDE_AND_PHASE_FIXED_POINT/atan2_cordic_nw
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module atan2_cordic_nw
          (clk,
           reset,
           enb,
           y_in,
           x_in,
           angle);


  input   clk;
  input   reset;
  input   enb;
  input   signed [31:0] y_in;  // sfix32_En12
  input   signed [31:0] x_in;  // sfix32_En12
  output  signed [31:0] angle;  // sfix32_En29


  wire signed [33:0] y_in_ext;  // sfix34_En12
  reg signed [33:0] y_in_reg_out_1;  // sfix34_En12
  wire y_in_msb;  // ufix1
  wire switch_compare_1;
  wire comp_zero;  // ufix1
  wire y_non_zero;  // ufix1
  reg  [0:11] y_non_zero_reg_reg;  // ufix1 [12]
  wire [0:11] y_non_zero_reg_reg_next;  // ufix1 [12]
  wire y_non_zero_p;  // ufix1
  wire signed [33:0] x_in_ext;  // sfix34_En12
  reg signed [33:0] x_in_reg_out_1;  // sfix34_En12
  wire x_in_msb;  // ufix1
  reg  [0:11] x_quad_adjust_reg_reg;  // ufix1 [12]
  wire [0:11] x_quad_adjust_reg_reg_next;  // ufix1 [12]
  wire x_quad_adjust_p;  // ufix1
  reg  [0:11] y_quad_adjust_reg_reg;  // ufix1 [12]
  wire [0:11] y_quad_adjust_reg_reg_next;  // ufix1 [12]
  wire y_quad_adjust_p;  // ufix1
  wire [2:0] x_y_adjust;  // ufix3
  wire signed [31:0] zero;  // sfix32_En29
  wire signed [31:0] onePi_1;  // sfix32_En29
  wire switch_compare_1_1;
  wire signed [34:0] y_in_reg_neg_cast;  // sfix35_En12
  wire signed [34:0] y_in_reg_neg_cast_1;  // sfix35_En12
  wire signed [33:0] y_in_reg_neg_1;  // sfix34_En12
  wire signed [33:0] y_pre_quadcorr_out;  // sfix34_En12
  reg signed [33:0] y0_p;  // sfix34_En12
  wire y0_p_msb;  // ufix1
  wire switch_compare_1_2;
  wire switch_compare_1_3;
  wire signed [34:0] x_in_reg_neg_cast;  // sfix35_En12
  wire signed [34:0] x_in_reg_neg_cast_1;  // sfix35_En12
  wire signed [33:0] x_in_reg_neg_1;  // sfix34_En12
  wire signed [33:0] x_pre_quadcorr_out;  // sfix34_En12
  reg signed [33:0] x0_p;  // sfix34_En12
  wire signed [33:0] y_temp1;  // sfix34_En12
  wire signed [33:0] y_temp_0_1_1;  // sfix34_En12
  wire signed [33:0] y1;  // sfix34_En12
  reg signed [33:0] y1_p;  // sfix34_En12
  wire y1_p_msb;  // ufix1
  wire switch_compare_1_4;
  wire switch_compare_1_5;
  wire signed [33:0] x_temp1;  // sfix34_En12
  wire signed [33:0] x_temp_0_1_1;  // sfix34_En12
  wire signed [33:0] x1;  // sfix34_En12
  reg signed [33:0] x1_p;  // sfix34_En12
  wire signed [33:0] x_shift2;  // sfix34_En12
  wire signed [33:0] y_temp2;  // sfix34_En12
  wire signed [33:0] y_temp_0_2_1;  // sfix34_En12
  wire signed [33:0] y2;  // sfix34_En12
  reg signed [33:0] y2_p;  // sfix34_En12
  wire y2_p_msb;  // ufix1
  wire switch_compare_1_6;
  wire switch_compare_1_7;
  wire signed [33:0] y_shift2;  // sfix34_En12
  wire signed [33:0] x_temp2;  // sfix34_En12
  wire signed [33:0] x_temp_0_2_1;  // sfix34_En12
  wire signed [33:0] x2;  // sfix34_En12
  reg signed [33:0] x2_p;  // sfix34_En12
  wire signed [33:0] x_shift3;  // sfix34_En12
  wire signed [33:0] y_temp3;  // sfix34_En12
  wire signed [33:0] y_temp_0_3_1;  // sfix34_En12
  wire signed [33:0] y3;  // sfix34_En12
  reg signed [33:0] y3_p;  // sfix34_En12
  wire y3_p_msb;  // ufix1
  wire switch_compare_1_8;
  wire switch_compare_1_9;
  wire signed [33:0] y_shift3;  // sfix34_En12
  wire signed [33:0] x_temp3;  // sfix34_En12
  wire signed [33:0] x_temp_0_3_1;  // sfix34_En12
  wire signed [33:0] x3;  // sfix34_En12
  reg signed [33:0] x3_p;  // sfix34_En12
  wire signed [33:0] x_shift4;  // sfix34_En12
  wire signed [33:0] y_temp4;  // sfix34_En12
  wire signed [33:0] y_temp_0_4_1;  // sfix34_En12
  wire signed [33:0] y4;  // sfix34_En12
  reg signed [33:0] y4_p;  // sfix34_En12
  wire y4_p_msb;  // ufix1
  wire switch_compare_1_10;
  wire switch_compare_1_11;
  wire signed [33:0] y_shift4;  // sfix34_En12
  wire signed [33:0] x_temp4;  // sfix34_En12
  wire signed [33:0] x_temp_0_4_1;  // sfix34_En12
  wire signed [33:0] x4;  // sfix34_En12
  reg signed [33:0] x4_p;  // sfix34_En12
  wire signed [33:0] x_shift5;  // sfix34_En12
  wire signed [33:0] y_temp5;  // sfix34_En12
  wire signed [33:0] y_temp_0_5_1;  // sfix34_En12
  wire signed [33:0] y5;  // sfix34_En12
  reg signed [33:0] y5_p;  // sfix34_En12
  wire y5_p_msb;  // ufix1
  wire switch_compare_1_12;
  wire switch_compare_1_13;
  wire signed [33:0] y_shift5;  // sfix34_En12
  wire signed [33:0] x_temp5;  // sfix34_En12
  wire signed [33:0] x_temp_0_5_1;  // sfix34_En12
  wire signed [33:0] x5;  // sfix34_En12
  reg signed [33:0] x5_p;  // sfix34_En12
  wire signed [33:0] x_shift6;  // sfix34_En12
  wire signed [33:0] y_temp6;  // sfix34_En12
  wire signed [33:0] y_temp_0_6_1;  // sfix34_En12
  wire signed [33:0] y6;  // sfix34_En12
  reg signed [33:0] y6_p;  // sfix34_En12
  wire y6_p_msb;  // ufix1
  wire switch_compare_1_14;
  wire switch_compare_1_15;
  wire signed [33:0] y_shift6;  // sfix34_En12
  wire signed [33:0] x_temp6;  // sfix34_En12
  wire signed [33:0] x_temp_0_6_1;  // sfix34_En12
  wire signed [33:0] x6;  // sfix34_En12
  reg signed [33:0] x6_p;  // sfix34_En12
  wire signed [33:0] x_shift7;  // sfix34_En12
  wire signed [33:0] y_temp7;  // sfix34_En12
  wire signed [33:0] y_temp_0_7_1;  // sfix34_En12
  wire signed [33:0] y7;  // sfix34_En12
  reg signed [33:0] y7_p;  // sfix34_En12
  wire y7_p_msb;  // ufix1
  wire switch_compare_1_16;
  wire switch_compare_1_17;
  wire signed [33:0] y_shift7;  // sfix34_En12
  wire signed [33:0] x_temp7;  // sfix34_En12
  wire signed [33:0] x_temp_0_7_1;  // sfix34_En12
  wire signed [33:0] x7;  // sfix34_En12
  reg signed [33:0] x7_p;  // sfix34_En12
  wire signed [33:0] x_shift8;  // sfix34_En12
  wire signed [33:0] y_temp8;  // sfix34_En12
  wire signed [33:0] y_temp_0_8_1;  // sfix34_En12
  wire signed [33:0] y8;  // sfix34_En12
  reg signed [33:0] y8_p;  // sfix34_En12
  wire y8_p_msb;  // ufix1
  wire switch_compare_1_18;
  wire switch_compare_1_19;
  wire signed [33:0] y_shift8;  // sfix34_En12
  wire signed [33:0] x_temp8;  // sfix34_En12
  wire signed [33:0] x_temp_0_8_1;  // sfix34_En12
  wire signed [33:0] x8;  // sfix34_En12
  reg signed [33:0] x8_p;  // sfix34_En12
  wire signed [33:0] x_shift9;  // sfix34_En12
  wire signed [33:0] y_temp9;  // sfix34_En12
  wire signed [33:0] y_temp_0_9_1;  // sfix34_En12
  wire signed [33:0] y9;  // sfix34_En12
  reg signed [33:0] y9_p;  // sfix34_En12
  wire y9_p_msb;  // ufix1
  wire switch_compare_1_20;
  wire switch_compare_1_21;
  wire signed [33:0] y_shift9;  // sfix34_En12
  wire signed [33:0] x_temp9;  // sfix34_En12
  wire signed [33:0] x_temp_0_9_1;  // sfix34_En12
  wire signed [33:0] x9;  // sfix34_En12
  reg signed [33:0] x9_p;  // sfix34_En12
  wire signed [33:0] x_shift10;  // sfix34_En12
  wire signed [33:0] y_temp10;  // sfix34_En12
  wire signed [33:0] y_temp_0_10_1;  // sfix34_En12
  wire signed [33:0] y10;  // sfix34_En12
  reg signed [33:0] y10_p;  // sfix34_En12
  wire y10_p_msb;  // ufix1
  wire switch_compare_1_22;
  wire switch_compare_1_23;
  wire switch_compare_1_24;
  wire switch_compare_1_25;
  wire switch_compare_1_26;
  wire switch_compare_1_27;
  wire switch_compare_1_28;
  wire switch_compare_1_29;
  wire switch_compare_1_30;
  wire switch_compare_1_31;
  wire switch_compare_1_32;
  wire signed [33:0] z0;  // sfix34_En29
  wire signed [33:0] lut_value_s1;  // sfix34_En29
  wire signed [33:0] lut_value_temp1;  // sfix34_En29
  wire signed [33:0] y_temp_0_1_2;  // sfix34_En29
  wire signed [33:0] z1;  // sfix34_En29
  reg signed [33:0] z1_p;  // sfix34_En29
  wire signed [33:0] lut_value_s2;  // sfix34_En29
  wire signed [33:0] lut_value_temp2;  // sfix34_En29
  wire signed [33:0] y_temp_0_2_2;  // sfix34_En29
  wire signed [33:0] z2;  // sfix34_En29
  reg signed [33:0] z2_p;  // sfix34_En29
  wire signed [33:0] lut_value_s3;  // sfix34_En29
  wire signed [33:0] lut_value_temp3;  // sfix34_En29
  wire signed [33:0] y_temp_0_3_2;  // sfix34_En29
  wire signed [33:0] z3;  // sfix34_En29
  reg signed [33:0] z3_p;  // sfix34_En29
  wire signed [33:0] lut_value_s4;  // sfix34_En29
  wire signed [33:0] lut_value_temp4;  // sfix34_En29
  wire signed [33:0] y_temp_0_4_2;  // sfix34_En29
  wire signed [33:0] z4;  // sfix34_En29
  reg signed [33:0] z4_p;  // sfix34_En29
  wire signed [33:0] lut_value_s5;  // sfix34_En29
  wire signed [33:0] lut_value_temp5;  // sfix34_En29
  wire signed [33:0] y_temp_0_5_2;  // sfix34_En29
  wire signed [33:0] z5;  // sfix34_En29
  reg signed [33:0] z5_p;  // sfix34_En29
  wire signed [33:0] lut_value_s6;  // sfix34_En29
  wire signed [33:0] lut_value_temp6;  // sfix34_En29
  wire signed [33:0] y_temp_0_6_2;  // sfix34_En29
  wire signed [33:0] z6;  // sfix34_En29
  reg signed [33:0] z6_p;  // sfix34_En29
  wire signed [33:0] lut_value_s7;  // sfix34_En29
  wire signed [33:0] lut_value_temp7;  // sfix34_En29
  wire signed [33:0] y_temp_0_7_2;  // sfix34_En29
  wire signed [33:0] z7;  // sfix34_En29
  reg signed [33:0] z7_p;  // sfix34_En29
  wire signed [33:0] lut_value_s8;  // sfix34_En29
  wire signed [33:0] lut_value_temp8;  // sfix34_En29
  wire signed [33:0] y_temp_0_8_2;  // sfix34_En29
  wire signed [33:0] z8;  // sfix34_En29
  reg signed [33:0] z8_p;  // sfix34_En29
  wire signed [33:0] lut_value_s9;  // sfix34_En29
  wire signed [33:0] lut_value_temp9;  // sfix34_En29
  wire signed [33:0] y_temp_0_9_2;  // sfix34_En29
  wire signed [33:0] z9;  // sfix34_En29
  reg signed [33:0] z9_p;  // sfix34_En29
  wire signed [33:0] lut_value_s10;  // sfix34_En29
  wire signed [33:0] lut_value_temp10;  // sfix34_En29
  wire signed [33:0] y_temp_0_10_2;  // sfix34_En29
  wire signed [33:0] z10;  // sfix34_En29
  reg signed [33:0] z10_p;  // sfix34_En29
  wire signed [33:0] lut_value_s11;  // sfix34_En29
  wire signed [33:0] lut_value_temp11;  // sfix34_En29
  wire signed [33:0] y_temp_0_11;  // sfix34_En29
  wire signed [33:0] z11;  // sfix34_En29
  reg signed [33:0] z11_p;  // sfix34_En29
  wire signed [31:0] z_out;  // sfix32_En29
  wire signed [32:0] z_temp3_cast;  // sfix33_En29
  wire signed [32:0] z_temp3_cast_1;  // sfix33_En29
  wire signed [31:0] z_temp3_1;  // sfix32_En29
  wire signed [31:0] z_temp2_1;  // sfix32_En29
  wire signed [31:0] z_temp1_1;  // sfix32_En29
  reg signed [31:0] z_out_adjust;  // sfix32_En29
  reg signed [31:0] angle_1;  // sfix32_En29


  assign y_in_ext = {{2{y_in[31]}}, y_in};



  always @(posedge clk or posedge reset)
    begin : y_in_reg_out_process
      if (reset == 1'b1) begin
        y_in_reg_out_1 <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y_in_reg_out_1 <= y_in_ext;
        end
      end
    end



  assign y_in_msb = y_in_reg_out_1[33];



  assign switch_compare_1 = y_in_msb > 1'b0;



  assign comp_zero = y_in_reg_out_1 > 34'sh000000000;



  assign y_non_zero = (switch_compare_1 == 1'b0 ? comp_zero :
              y_in_msb);



  always @(posedge clk or posedge reset)
    begin : y_non_zero_reg_process
      if (reset == 1'b1) begin
        y_non_zero_reg_reg[0] <= 1'b0;
        y_non_zero_reg_reg[1] <= 1'b0;
        y_non_zero_reg_reg[2] <= 1'b0;
        y_non_zero_reg_reg[3] <= 1'b0;
        y_non_zero_reg_reg[4] <= 1'b0;
        y_non_zero_reg_reg[5] <= 1'b0;
        y_non_zero_reg_reg[6] <= 1'b0;
        y_non_zero_reg_reg[7] <= 1'b0;
        y_non_zero_reg_reg[8] <= 1'b0;
        y_non_zero_reg_reg[9] <= 1'b0;
        y_non_zero_reg_reg[10] <= 1'b0;
        y_non_zero_reg_reg[11] <= 1'b0;
      end
      else begin
        if (enb) begin
          y_non_zero_reg_reg[0] <= y_non_zero_reg_reg_next[0];
          y_non_zero_reg_reg[1] <= y_non_zero_reg_reg_next[1];
          y_non_zero_reg_reg[2] <= y_non_zero_reg_reg_next[2];
          y_non_zero_reg_reg[3] <= y_non_zero_reg_reg_next[3];
          y_non_zero_reg_reg[4] <= y_non_zero_reg_reg_next[4];
          y_non_zero_reg_reg[5] <= y_non_zero_reg_reg_next[5];
          y_non_zero_reg_reg[6] <= y_non_zero_reg_reg_next[6];
          y_non_zero_reg_reg[7] <= y_non_zero_reg_reg_next[7];
          y_non_zero_reg_reg[8] <= y_non_zero_reg_reg_next[8];
          y_non_zero_reg_reg[9] <= y_non_zero_reg_reg_next[9];
          y_non_zero_reg_reg[10] <= y_non_zero_reg_reg_next[10];
          y_non_zero_reg_reg[11] <= y_non_zero_reg_reg_next[11];
        end
      end
    end

  assign y_non_zero_p = y_non_zero_reg_reg[11];
  assign y_non_zero_reg_reg_next[0] = y_non_zero;
  assign y_non_zero_reg_reg_next[1] = y_non_zero_reg_reg[0];
  assign y_non_zero_reg_reg_next[2] = y_non_zero_reg_reg[1];
  assign y_non_zero_reg_reg_next[3] = y_non_zero_reg_reg[2];
  assign y_non_zero_reg_reg_next[4] = y_non_zero_reg_reg[3];
  assign y_non_zero_reg_reg_next[5] = y_non_zero_reg_reg[4];
  assign y_non_zero_reg_reg_next[6] = y_non_zero_reg_reg[5];
  assign y_non_zero_reg_reg_next[7] = y_non_zero_reg_reg[6];
  assign y_non_zero_reg_reg_next[8] = y_non_zero_reg_reg[7];
  assign y_non_zero_reg_reg_next[9] = y_non_zero_reg_reg[8];
  assign y_non_zero_reg_reg_next[10] = y_non_zero_reg_reg[9];
  assign y_non_zero_reg_reg_next[11] = y_non_zero_reg_reg[10];



  assign x_in_ext = {{2{x_in[31]}}, x_in};



  always @(posedge clk or posedge reset)
    begin : x_in_reg_out_process
      if (reset == 1'b1) begin
        x_in_reg_out_1 <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          x_in_reg_out_1 <= x_in_ext;
        end
      end
    end



  assign x_in_msb = x_in_reg_out_1[33];



  always @(posedge clk or posedge reset)
    begin : x_quad_adjust_reg_process
      if (reset == 1'b1) begin
        x_quad_adjust_reg_reg[0] <= 1'b0;
        x_quad_adjust_reg_reg[1] <= 1'b0;
        x_quad_adjust_reg_reg[2] <= 1'b0;
        x_quad_adjust_reg_reg[3] <= 1'b0;
        x_quad_adjust_reg_reg[4] <= 1'b0;
        x_quad_adjust_reg_reg[5] <= 1'b0;
        x_quad_adjust_reg_reg[6] <= 1'b0;
        x_quad_adjust_reg_reg[7] <= 1'b0;
        x_quad_adjust_reg_reg[8] <= 1'b0;
        x_quad_adjust_reg_reg[9] <= 1'b0;
        x_quad_adjust_reg_reg[10] <= 1'b0;
        x_quad_adjust_reg_reg[11] <= 1'b0;
      end
      else begin
        if (enb) begin
          x_quad_adjust_reg_reg[0] <= x_quad_adjust_reg_reg_next[0];
          x_quad_adjust_reg_reg[1] <= x_quad_adjust_reg_reg_next[1];
          x_quad_adjust_reg_reg[2] <= x_quad_adjust_reg_reg_next[2];
          x_quad_adjust_reg_reg[3] <= x_quad_adjust_reg_reg_next[3];
          x_quad_adjust_reg_reg[4] <= x_quad_adjust_reg_reg_next[4];
          x_quad_adjust_reg_reg[5] <= x_quad_adjust_reg_reg_next[5];
          x_quad_adjust_reg_reg[6] <= x_quad_adjust_reg_reg_next[6];
          x_quad_adjust_reg_reg[7] <= x_quad_adjust_reg_reg_next[7];
          x_quad_adjust_reg_reg[8] <= x_quad_adjust_reg_reg_next[8];
          x_quad_adjust_reg_reg[9] <= x_quad_adjust_reg_reg_next[9];
          x_quad_adjust_reg_reg[10] <= x_quad_adjust_reg_reg_next[10];
          x_quad_adjust_reg_reg[11] <= x_quad_adjust_reg_reg_next[11];
        end
      end
    end

  assign x_quad_adjust_p = x_quad_adjust_reg_reg[11];
  assign x_quad_adjust_reg_reg_next[0] = x_in_msb;
  assign x_quad_adjust_reg_reg_next[1] = x_quad_adjust_reg_reg[0];
  assign x_quad_adjust_reg_reg_next[2] = x_quad_adjust_reg_reg[1];
  assign x_quad_adjust_reg_reg_next[3] = x_quad_adjust_reg_reg[2];
  assign x_quad_adjust_reg_reg_next[4] = x_quad_adjust_reg_reg[3];
  assign x_quad_adjust_reg_reg_next[5] = x_quad_adjust_reg_reg[4];
  assign x_quad_adjust_reg_reg_next[6] = x_quad_adjust_reg_reg[5];
  assign x_quad_adjust_reg_reg_next[7] = x_quad_adjust_reg_reg[6];
  assign x_quad_adjust_reg_reg_next[8] = x_quad_adjust_reg_reg[7];
  assign x_quad_adjust_reg_reg_next[9] = x_quad_adjust_reg_reg[8];
  assign x_quad_adjust_reg_reg_next[10] = x_quad_adjust_reg_reg[9];
  assign x_quad_adjust_reg_reg_next[11] = x_quad_adjust_reg_reg[10];



  always @(posedge clk or posedge reset)
    begin : y_quad_adjust_reg_process
      if (reset == 1'b1) begin
        y_quad_adjust_reg_reg[0] <= 1'b0;
        y_quad_adjust_reg_reg[1] <= 1'b0;
        y_quad_adjust_reg_reg[2] <= 1'b0;
        y_quad_adjust_reg_reg[3] <= 1'b0;
        y_quad_adjust_reg_reg[4] <= 1'b0;
        y_quad_adjust_reg_reg[5] <= 1'b0;
        y_quad_adjust_reg_reg[6] <= 1'b0;
        y_quad_adjust_reg_reg[7] <= 1'b0;
        y_quad_adjust_reg_reg[8] <= 1'b0;
        y_quad_adjust_reg_reg[9] <= 1'b0;
        y_quad_adjust_reg_reg[10] <= 1'b0;
        y_quad_adjust_reg_reg[11] <= 1'b0;
      end
      else begin
        if (enb) begin
          y_quad_adjust_reg_reg[0] <= y_quad_adjust_reg_reg_next[0];
          y_quad_adjust_reg_reg[1] <= y_quad_adjust_reg_reg_next[1];
          y_quad_adjust_reg_reg[2] <= y_quad_adjust_reg_reg_next[2];
          y_quad_adjust_reg_reg[3] <= y_quad_adjust_reg_reg_next[3];
          y_quad_adjust_reg_reg[4] <= y_quad_adjust_reg_reg_next[4];
          y_quad_adjust_reg_reg[5] <= y_quad_adjust_reg_reg_next[5];
          y_quad_adjust_reg_reg[6] <= y_quad_adjust_reg_reg_next[6];
          y_quad_adjust_reg_reg[7] <= y_quad_adjust_reg_reg_next[7];
          y_quad_adjust_reg_reg[8] <= y_quad_adjust_reg_reg_next[8];
          y_quad_adjust_reg_reg[9] <= y_quad_adjust_reg_reg_next[9];
          y_quad_adjust_reg_reg[10] <= y_quad_adjust_reg_reg_next[10];
          y_quad_adjust_reg_reg[11] <= y_quad_adjust_reg_reg_next[11];
        end
      end
    end

  assign y_quad_adjust_p = y_quad_adjust_reg_reg[11];
  assign y_quad_adjust_reg_reg_next[0] = y_in_msb;
  assign y_quad_adjust_reg_reg_next[1] = y_quad_adjust_reg_reg[0];
  assign y_quad_adjust_reg_reg_next[2] = y_quad_adjust_reg_reg[1];
  assign y_quad_adjust_reg_reg_next[3] = y_quad_adjust_reg_reg[2];
  assign y_quad_adjust_reg_reg_next[4] = y_quad_adjust_reg_reg[3];
  assign y_quad_adjust_reg_reg_next[5] = y_quad_adjust_reg_reg[4];
  assign y_quad_adjust_reg_reg_next[6] = y_quad_adjust_reg_reg[5];
  assign y_quad_adjust_reg_reg_next[7] = y_quad_adjust_reg_reg[6];
  assign y_quad_adjust_reg_reg_next[8] = y_quad_adjust_reg_reg[7];
  assign y_quad_adjust_reg_reg_next[9] = y_quad_adjust_reg_reg[8];
  assign y_quad_adjust_reg_reg_next[10] = y_quad_adjust_reg_reg[9];
  assign y_quad_adjust_reg_reg_next[11] = y_quad_adjust_reg_reg[10];



  assign x_y_adjust = {y_non_zero_p, x_quad_adjust_p, y_quad_adjust_p};



  assign zero = 32'sb00000000000000000000000000000000;



  assign onePi_1 = 32'sb01100100100001111110110101010001;



  assign switch_compare_1_1 = y_in_msb > 1'b0;



  assign y_in_reg_neg_cast = {y_in_reg_out_1[33], y_in_reg_out_1};
  assign y_in_reg_neg_cast_1 =  - (y_in_reg_neg_cast);
  assign y_in_reg_neg_1 = y_in_reg_neg_cast_1[33:0];



  assign y_pre_quadcorr_out = (switch_compare_1_1 == 1'b0 ? y_in_reg_out_1 :
              y_in_reg_neg_1);



  // Pipeline registers
  always @(posedge clk or posedge reset)
    begin : y_pre_quadcorr_out_reg_process
      if (reset == 1'b1) begin
        y0_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y0_p <= y_pre_quadcorr_out;
        end
      end
    end



  assign y0_p_msb = y0_p[33];



  assign switch_compare_1_2 = y0_p_msb > 1'b0;



  assign switch_compare_1_3 = x_in_msb > 1'b0;



  assign x_in_reg_neg_cast = {x_in_reg_out_1[33], x_in_reg_out_1};
  assign x_in_reg_neg_cast_1 =  - (x_in_reg_neg_cast);
  assign x_in_reg_neg_1 = x_in_reg_neg_cast_1[33:0];



  assign x_pre_quadcorr_out = (switch_compare_1_3 == 1'b0 ? x_in_reg_out_1 :
              x_in_reg_neg_1);



  // Pipeline registers
  always @(posedge clk or posedge reset)
    begin : x_pre_quadcorr_out_reg_process
      if (reset == 1'b1) begin
        x0_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          x0_p <= x_pre_quadcorr_out;
        end
      end
    end



  assign y_temp1 = y0_p - x0_p;



  assign y_temp_0_1_1 = y0_p + x0_p;



  assign y1 = (switch_compare_1_2 == 1'b0 ? y_temp1 :
              y_temp_0_1_1);



  always @(posedge clk or posedge reset)
    begin : y_reg_process
      if (reset == 1'b1) begin
        y1_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y1_p <= y1;
        end
      end
    end



  assign y1_p_msb = y1_p[33];



  assign switch_compare_1_4 = y1_p_msb > 1'b0;



  assign switch_compare_1_5 = y0_p_msb > 1'b0;



  assign x_temp1 = x0_p + y0_p;



  assign x_temp_0_1_1 = x0_p - y0_p;



  assign x1 = (switch_compare_1_5 == 1'b0 ? x_temp1 :
              x_temp_0_1_1);



  // Pipeline registers
  always @(posedge clk or posedge reset)
    begin : x_reg_process
      if (reset == 1'b1) begin
        x1_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          x1_p <= x1;
        end
      end
    end



  assign x_shift2 = x1_p >>> 8'd1;



  assign y_temp2 = y1_p - x_shift2;



  assign y_temp_0_2_1 = y1_p + x_shift2;



  assign y2 = (switch_compare_1_4 == 1'b0 ? y_temp2 :
              y_temp_0_2_1);



  always @(posedge clk or posedge reset)
    begin : y_reg_1_process
      if (reset == 1'b1) begin
        y2_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y2_p <= y2;
        end
      end
    end



  assign y2_p_msb = y2_p[33];



  assign switch_compare_1_6 = y2_p_msb > 1'b0;



  assign switch_compare_1_7 = y1_p_msb > 1'b0;



  assign y_shift2 = y1_p >>> 8'd1;



  assign x_temp2 = x1_p + y_shift2;



  assign x_temp_0_2_1 = x1_p - y_shift2;



  assign x2 = (switch_compare_1_7 == 1'b0 ? x_temp2 :
              x_temp_0_2_1);



  // Pipeline registers
  always @(posedge clk or posedge reset)
    begin : x_reg_1_process
      if (reset == 1'b1) begin
        x2_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          x2_p <= x2;
        end
      end
    end



  assign x_shift3 = x2_p >>> 8'd2;



  assign y_temp3 = y2_p - x_shift3;



  assign y_temp_0_3_1 = y2_p + x_shift3;



  assign y3 = (switch_compare_1_6 == 1'b0 ? y_temp3 :
              y_temp_0_3_1);



  always @(posedge clk or posedge reset)
    begin : y_reg_2_process
      if (reset == 1'b1) begin
        y3_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y3_p <= y3;
        end
      end
    end



  assign y3_p_msb = y3_p[33];



  assign switch_compare_1_8 = y3_p_msb > 1'b0;



  assign switch_compare_1_9 = y2_p_msb > 1'b0;



  assign y_shift3 = y2_p >>> 8'd2;



  assign x_temp3 = x2_p + y_shift3;



  assign x_temp_0_3_1 = x2_p - y_shift3;



  assign x3 = (switch_compare_1_9 == 1'b0 ? x_temp3 :
              x_temp_0_3_1);



  // Pipeline registers
  always @(posedge clk or posedge reset)
    begin : x_reg_2_process
      if (reset == 1'b1) begin
        x3_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          x3_p <= x3;
        end
      end
    end



  assign x_shift4 = x3_p >>> 8'd3;



  assign y_temp4 = y3_p - x_shift4;



  assign y_temp_0_4_1 = y3_p + x_shift4;



  assign y4 = (switch_compare_1_8 == 1'b0 ? y_temp4 :
              y_temp_0_4_1);



  always @(posedge clk or posedge reset)
    begin : y_reg_3_process
      if (reset == 1'b1) begin
        y4_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y4_p <= y4;
        end
      end
    end



  assign y4_p_msb = y4_p[33];



  assign switch_compare_1_10 = y4_p_msb > 1'b0;



  assign switch_compare_1_11 = y3_p_msb > 1'b0;



  assign y_shift4 = y3_p >>> 8'd3;



  assign x_temp4 = x3_p + y_shift4;



  assign x_temp_0_4_1 = x3_p - y_shift4;



  assign x4 = (switch_compare_1_11 == 1'b0 ? x_temp4 :
              x_temp_0_4_1);



  // Pipeline registers
  always @(posedge clk or posedge reset)
    begin : x_reg_3_process
      if (reset == 1'b1) begin
        x4_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          x4_p <= x4;
        end
      end
    end



  assign x_shift5 = x4_p >>> 8'd4;



  assign y_temp5 = y4_p - x_shift5;



  assign y_temp_0_5_1 = y4_p + x_shift5;



  assign y5 = (switch_compare_1_10 == 1'b0 ? y_temp5 :
              y_temp_0_5_1);



  always @(posedge clk or posedge reset)
    begin : y_reg_4_process
      if (reset == 1'b1) begin
        y5_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y5_p <= y5;
        end
      end
    end



  assign y5_p_msb = y5_p[33];



  assign switch_compare_1_12 = y5_p_msb > 1'b0;



  assign switch_compare_1_13 = y4_p_msb > 1'b0;



  assign y_shift5 = y4_p >>> 8'd4;



  assign x_temp5 = x4_p + y_shift5;



  assign x_temp_0_5_1 = x4_p - y_shift5;



  assign x5 = (switch_compare_1_13 == 1'b0 ? x_temp5 :
              x_temp_0_5_1);



  // Pipeline registers
  always @(posedge clk or posedge reset)
    begin : x_reg_4_process
      if (reset == 1'b1) begin
        x5_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          x5_p <= x5;
        end
      end
    end



  assign x_shift6 = x5_p >>> 8'd5;



  assign y_temp6 = y5_p - x_shift6;



  assign y_temp_0_6_1 = y5_p + x_shift6;



  assign y6 = (switch_compare_1_12 == 1'b0 ? y_temp6 :
              y_temp_0_6_1);



  always @(posedge clk or posedge reset)
    begin : y_reg_5_process
      if (reset == 1'b1) begin
        y6_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y6_p <= y6;
        end
      end
    end



  assign y6_p_msb = y6_p[33];



  assign switch_compare_1_14 = y6_p_msb > 1'b0;



  assign switch_compare_1_15 = y5_p_msb > 1'b0;



  assign y_shift6 = y5_p >>> 8'd5;



  assign x_temp6 = x5_p + y_shift6;



  assign x_temp_0_6_1 = x5_p - y_shift6;



  assign x6 = (switch_compare_1_15 == 1'b0 ? x_temp6 :
              x_temp_0_6_1);



  // Pipeline registers
  always @(posedge clk or posedge reset)
    begin : x_reg_5_process
      if (reset == 1'b1) begin
        x6_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          x6_p <= x6;
        end
      end
    end



  assign x_shift7 = x6_p >>> 8'd6;



  assign y_temp7 = y6_p - x_shift7;



  assign y_temp_0_7_1 = y6_p + x_shift7;



  assign y7 = (switch_compare_1_14 == 1'b0 ? y_temp7 :
              y_temp_0_7_1);



  always @(posedge clk or posedge reset)
    begin : y_reg_6_process
      if (reset == 1'b1) begin
        y7_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y7_p <= y7;
        end
      end
    end



  assign y7_p_msb = y7_p[33];



  assign switch_compare_1_16 = y7_p_msb > 1'b0;



  assign switch_compare_1_17 = y6_p_msb > 1'b0;



  assign y_shift7 = y6_p >>> 8'd6;



  assign x_temp7 = x6_p + y_shift7;



  assign x_temp_0_7_1 = x6_p - y_shift7;



  assign x7 = (switch_compare_1_17 == 1'b0 ? x_temp7 :
              x_temp_0_7_1);



  // Pipeline registers
  always @(posedge clk or posedge reset)
    begin : x_reg_6_process
      if (reset == 1'b1) begin
        x7_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          x7_p <= x7;
        end
      end
    end



  assign x_shift8 = x7_p >>> 8'd7;



  assign y_temp8 = y7_p - x_shift8;



  assign y_temp_0_8_1 = y7_p + x_shift8;



  assign y8 = (switch_compare_1_16 == 1'b0 ? y_temp8 :
              y_temp_0_8_1);



  always @(posedge clk or posedge reset)
    begin : y_reg_7_process
      if (reset == 1'b1) begin
        y8_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y8_p <= y8;
        end
      end
    end



  assign y8_p_msb = y8_p[33];



  assign switch_compare_1_18 = y8_p_msb > 1'b0;



  assign switch_compare_1_19 = y7_p_msb > 1'b0;



  assign y_shift8 = y7_p >>> 8'd7;



  assign x_temp8 = x7_p + y_shift8;



  assign x_temp_0_8_1 = x7_p - y_shift8;



  assign x8 = (switch_compare_1_19 == 1'b0 ? x_temp8 :
              x_temp_0_8_1);



  // Pipeline registers
  always @(posedge clk or posedge reset)
    begin : x_reg_7_process
      if (reset == 1'b1) begin
        x8_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          x8_p <= x8;
        end
      end
    end



  assign x_shift9 = x8_p >>> 8'd8;



  assign y_temp9 = y8_p - x_shift9;



  assign y_temp_0_9_1 = y8_p + x_shift9;



  assign y9 = (switch_compare_1_18 == 1'b0 ? y_temp9 :
              y_temp_0_9_1);



  always @(posedge clk or posedge reset)
    begin : y_reg_8_process
      if (reset == 1'b1) begin
        y9_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y9_p <= y9;
        end
      end
    end



  assign y9_p_msb = y9_p[33];



  assign switch_compare_1_20 = y9_p_msb > 1'b0;



  assign switch_compare_1_21 = y8_p_msb > 1'b0;



  assign y_shift9 = y8_p >>> 8'd8;



  assign x_temp9 = x8_p + y_shift9;



  assign x_temp_0_9_1 = x8_p - y_shift9;



  assign x9 = (switch_compare_1_21 == 1'b0 ? x_temp9 :
              x_temp_0_9_1);



  // Pipeline registers
  always @(posedge clk or posedge reset)
    begin : x_reg_8_process
      if (reset == 1'b1) begin
        x9_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          x9_p <= x9;
        end
      end
    end



  assign x_shift10 = x9_p >>> 8'd9;



  assign y_temp10 = y9_p - x_shift10;



  assign y_temp_0_10_1 = y9_p + x_shift10;



  assign y10 = (switch_compare_1_20 == 1'b0 ? y_temp10 :
              y_temp_0_10_1);



  always @(posedge clk or posedge reset)
    begin : y_reg_9_process
      if (reset == 1'b1) begin
        y10_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          y10_p <= y10;
        end
      end
    end



  assign y10_p_msb = y10_p[33];



  assign switch_compare_1_22 = y10_p_msb > 1'b0;



  assign switch_compare_1_23 = y9_p_msb > 1'b0;



  assign switch_compare_1_24 = y8_p_msb > 1'b0;



  assign switch_compare_1_25 = y7_p_msb > 1'b0;



  assign switch_compare_1_26 = y6_p_msb > 1'b0;



  assign switch_compare_1_27 = y5_p_msb > 1'b0;



  assign switch_compare_1_28 = y4_p_msb > 1'b0;



  assign switch_compare_1_29 = y3_p_msb > 1'b0;



  assign switch_compare_1_30 = y2_p_msb > 1'b0;



  assign switch_compare_1_31 = y1_p_msb > 1'b0;



  assign switch_compare_1_32 = y0_p_msb > 1'b0;



  assign z0 = 34'sh000000000;



  assign lut_value_s1 = 34'sh01921FB54;



  assign lut_value_temp1 = z0 + lut_value_s1;



  assign y_temp_0_1_2 = z0 - lut_value_s1;



  assign z1 = (switch_compare_1_32 == 1'b0 ? lut_value_temp1 :
              y_temp_0_1_2);



  always @(posedge clk or posedge reset)
    begin : z_reg_process
      if (reset == 1'b1) begin
        z1_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          z1_p <= z1;
        end
      end
    end



  assign lut_value_s2 = 34'sh00ED63383;



  assign lut_value_temp2 = z1_p + lut_value_s2;



  assign y_temp_0_2_2 = z1_p - lut_value_s2;



  assign z2 = (switch_compare_1_31 == 1'b0 ? lut_value_temp2 :
              y_temp_0_2_2);



  always @(posedge clk or posedge reset)
    begin : z_reg_1_process
      if (reset == 1'b1) begin
        z2_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          z2_p <= z2;
        end
      end
    end



  assign lut_value_s3 = 34'sh007D6DD7E;



  assign lut_value_temp3 = z2_p + lut_value_s3;



  assign y_temp_0_3_2 = z2_p - lut_value_s3;



  assign z3 = (switch_compare_1_30 == 1'b0 ? lut_value_temp3 :
              y_temp_0_3_2);



  always @(posedge clk or posedge reset)
    begin : z_reg_2_process
      if (reset == 1'b1) begin
        z3_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          z3_p <= z3;
        end
      end
    end



  assign lut_value_s4 = 34'sh003FAB753;



  assign lut_value_temp4 = z3_p + lut_value_s4;



  assign y_temp_0_4_2 = z3_p - lut_value_s4;



  assign z4 = (switch_compare_1_29 == 1'b0 ? lut_value_temp4 :
              y_temp_0_4_2);



  always @(posedge clk or posedge reset)
    begin : z_reg_3_process
      if (reset == 1'b1) begin
        z4_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          z4_p <= z4;
        end
      end
    end



  assign lut_value_s5 = 34'sh001FF55BB;



  assign lut_value_temp5 = z4_p + lut_value_s5;



  assign y_temp_0_5_2 = z4_p - lut_value_s5;



  assign z5 = (switch_compare_1_28 == 1'b0 ? lut_value_temp5 :
              y_temp_0_5_2);



  always @(posedge clk or posedge reset)
    begin : z_reg_4_process
      if (reset == 1'b1) begin
        z5_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          z5_p <= z5;
        end
      end
    end



  assign lut_value_s6 = 34'sh000FFEAAE;



  assign lut_value_temp6 = z5_p + lut_value_s6;



  assign y_temp_0_6_2 = z5_p - lut_value_s6;



  assign z6 = (switch_compare_1_27 == 1'b0 ? lut_value_temp6 :
              y_temp_0_6_2);



  always @(posedge clk or posedge reset)
    begin : z_reg_5_process
      if (reset == 1'b1) begin
        z6_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          z6_p <= z6;
        end
      end
    end



  assign lut_value_s7 = 34'sh0007FFD55;



  assign lut_value_temp7 = z6_p + lut_value_s7;



  assign y_temp_0_7_2 = z6_p - lut_value_s7;



  assign z7 = (switch_compare_1_26 == 1'b0 ? lut_value_temp7 :
              y_temp_0_7_2);



  always @(posedge clk or posedge reset)
    begin : z_reg_6_process
      if (reset == 1'b1) begin
        z7_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          z7_p <= z7;
        end
      end
    end



  assign lut_value_s8 = 34'sh0003FFFAB;



  assign lut_value_temp8 = z7_p + lut_value_s8;



  assign y_temp_0_8_2 = z7_p - lut_value_s8;



  assign z8 = (switch_compare_1_25 == 1'b0 ? lut_value_temp8 :
              y_temp_0_8_2);



  always @(posedge clk or posedge reset)
    begin : z_reg_7_process
      if (reset == 1'b1) begin
        z8_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          z8_p <= z8;
        end
      end
    end



  assign lut_value_s9 = 34'sh0001FFFF5;



  assign lut_value_temp9 = z8_p + lut_value_s9;



  assign y_temp_0_9_2 = z8_p - lut_value_s9;



  assign z9 = (switch_compare_1_24 == 1'b0 ? lut_value_temp9 :
              y_temp_0_9_2);



  always @(posedge clk or posedge reset)
    begin : z_reg_8_process
      if (reset == 1'b1) begin
        z9_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          z9_p <= z9;
        end
      end
    end



  assign lut_value_s10 = 34'sh0000FFFFF;



  assign lut_value_temp10 = z9_p + lut_value_s10;



  assign y_temp_0_10_2 = z9_p - lut_value_s10;



  assign z10 = (switch_compare_1_23 == 1'b0 ? lut_value_temp10 :
              y_temp_0_10_2);



  always @(posedge clk or posedge reset)
    begin : z_reg_9_process
      if (reset == 1'b1) begin
        z10_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          z10_p <= z10;
        end
      end
    end



  assign lut_value_s11 = 34'sh000080000;



  assign lut_value_temp11 = z10_p + lut_value_s11;



  assign y_temp_0_11 = z10_p - lut_value_s11;



  assign z11 = (switch_compare_1_22 == 1'b0 ? lut_value_temp11 :
              y_temp_0_11);



  always @(posedge clk or posedge reset)
    begin : z_reg_10_process
      if (reset == 1'b1) begin
        z11_p <= 34'sh000000000;
      end
      else begin
        if (enb) begin
          z11_p <= z11;
        end
      end
    end



  assign z_out = z11_p[31:0];



  assign z_temp3_cast = {z_out[31], z_out};
  assign z_temp3_cast_1 =  - (z_temp3_cast);
  assign z_temp3_1 = z_temp3_cast_1[31:0];



  assign z_temp2_1 = onePi_1 - z_out;



  assign z_temp1_1 = z_out - onePi_1;



  always @(onePi_1, x_y_adjust, z_out, z_temp1_1, z_temp2_1, z_temp3_1, zero) begin
    case ( x_y_adjust)
      3'b000 :
        begin
          z_out_adjust = zero;
        end
      3'b001 :
        begin
          z_out_adjust = zero;
        end
      3'b010 :
        begin
          z_out_adjust = onePi_1;
        end
      3'b011 :
        begin
          z_out_adjust = onePi_1;
        end
      3'b100 :
        begin
          z_out_adjust = z_out;
        end
      3'b101 :
        begin
          z_out_adjust = z_temp3_1;
        end
      3'b110 :
        begin
          z_out_adjust = z_temp2_1;
        end
      default :
        begin
          z_out_adjust = z_temp1_1;
        end
    endcase
  end



  // Pipeline register for output z
  always @(posedge clk or posedge reset)
    begin : z_out_reg_process
      if (reset == 1'b1) begin
        angle_1 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          angle_1 <= z_out_adjust;
        end
      end
    end



  assign angle = angle_1;

endmodule  // atan2_cordic_nw
