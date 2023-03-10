// -------------------------------------------------------------
// 
// File Name: D:\КЕОА\3 курс\Апараткі\Лаба №1\Verilog\lab1\PROCESSING_UNIT.v
// Created: 2023-01-17 13:11:30
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
// Y                             ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: PROCESSING_UNIT
// Source Path: lab1/PROCESSING_UNIT
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module PROCESSING_UNIT
          (clk,
           reset,
           clk_enable,
           i_W0,
           i_X0,
           i_W1,
           i_X1,
           i_W2,
           i_X2,
           i_W3,
           i_X3,
           ce_out,
           Y);


  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [7:0] i_W0;  // int8
  input   signed [7:0] i_X0;  // int8
  input   signed [7:0] i_W1;  // int8
  input   signed [7:0] i_X1;  // int8
  input   signed [7:0] i_W2;  // int8
  input   signed [7:0] i_X2;  // int8
  input   signed [7:0] i_W3;  // int8
  input   signed [7:0] i_X3;  // int8
  output  ce_out;
  output  signed [15:0] Y;  // int16


  wire enb;
  reg signed [7:0] Delay_out1;  // int8
  reg signed [7:0] Delay2_out1;  // int8
  reg signed [7:0] Delay4_out1;  // int8
  reg signed [7:0] Delay6_out1;  // int8
  reg signed [7:0] Delay1_out1;  // int8
  wire signed [15:0] Product_out1;  // int16
  reg signed [7:0] Delay3_out1;  // int8
  wire signed [15:0] Product1_out1;  // int16
  wire signed [15:0] Add_op_stage1;  // sfix16
  reg signed [7:0] Delay5_out1;  // int8
  wire signed [15:0] Product2_out1;  // int16
  wire signed [15:0] Add_op_stage2;  // sfix16
  reg signed [7:0] Delay7_out1;  // int8
  wire signed [15:0] Product3_out1;  // int16
  wire signed [15:0] Add_out1;  // int16
  reg signed [15:0] Delay8_out1;  // int16


  assign enb = clk_enable;

  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 8'sb00000000;
      end
      else begin
        if (enb) begin
          Delay_out1 <= i_W0;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1 <= 8'sb00000000;
      end
      else begin
        if (enb) begin
          Delay2_out1 <= i_W1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        Delay4_out1 <= 8'sb00000000;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= i_W2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        Delay6_out1 <= 8'sb00000000;
      end
      else begin
        if (enb) begin
          Delay6_out1 <= i_W3;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 8'sb00000000;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= i_X0;
        end
      end
    end



  assign Product_out1 = Delay_out1 * Delay1_out1;



  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 8'sb00000000;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= i_X1;
        end
      end
    end



  assign Product1_out1 = Delay2_out1 * Delay3_out1;



  assign Add_op_stage1 = Product_out1 + Product1_out1;



  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_out1 <= 8'sb00000000;
      end
      else begin
        if (enb) begin
          Delay5_out1 <= i_X2;
        end
      end
    end



  assign Product2_out1 = Delay4_out1 * Delay5_out1;



  assign Add_op_stage2 = Add_op_stage1 + Product2_out1;



  always @(posedge clk or posedge reset)
    begin : Delay7_process
      if (reset == 1'b1) begin
        Delay7_out1 <= 8'sb00000000;
      end
      else begin
        if (enb) begin
          Delay7_out1 <= i_X3;
        end
      end
    end



  assign Product3_out1 = Delay6_out1 * Delay7_out1;



  assign Add_out1 = Add_op_stage2 + Product3_out1;



  always @(posedge clk or posedge reset)
    begin : Delay8_process
      if (reset == 1'b1) begin
        Delay8_out1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb) begin
          Delay8_out1 <= Add_out1;
        end
      end
    end



  assign Y = Delay8_out1;

  assign ce_out = clk_enable;

endmodule  // PROCESSING_UNIT

