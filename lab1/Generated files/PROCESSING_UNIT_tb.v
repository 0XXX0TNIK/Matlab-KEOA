// -------------------------------------------------------------
// 
// File Name: D:\КЕОА\3 курс\Апараткі\Лаба №1\Verilog\lab1\PROCESSING_UNIT_tb.v
// Created: 2023-01-17 13:12:52
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
// Module: PROCESSING_UNIT_tb
// Source Path: 
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module PROCESSING_UNIT_tb;



  reg  clk;
  reg  reset;
  wire clk_enable;
  wire Y_done;  // ufix1
  wire rdEnb;
  wire Y_done_enb;  // ufix1
  reg [3:0] Y_addr;  // ufix4
  wire Y_active;  // ufix1
  reg [3:0] Data_Type_Conversion_out1_addr;  // ufix4
  wire [3:0] Data_Type_Conversion7_out1_addr_delay_1;  // ufix4
  reg  tb_enb_delay;
  reg signed [31:0] fp_i_X3;  // sfix32
  reg signed [7:0] rawData_i_X3;  // int8
  reg signed [31:0] status_i_X3;  // sfix32
  reg signed [7:0] holdData_i_X3;  // int8
  reg signed [7:0] i_X3_offset;  // int8
  wire signed [7:0] i_X3;  // int8
  wire [3:0] Data_Type_Conversion6_out1_addr_delay_1;  // ufix4
  reg signed [31:0] fp_i_W3;  // sfix32
  reg signed [7:0] rawData_i_W3;  // int8
  reg signed [31:0] status_i_W3;  // sfix32
  reg signed [7:0] holdData_i_W3;  // int8
  reg signed [7:0] i_W3_offset;  // int8
  wire signed [7:0] i_W3;  // int8
  wire [3:0] Data_Type_Conversion5_out1_addr_delay_1;  // ufix4
  reg signed [31:0] fp_i_X2;  // sfix32
  reg signed [7:0] rawData_i_X2;  // int8
  reg signed [31:0] status_i_X2;  // sfix32
  reg signed [7:0] holdData_i_X2;  // int8
  reg signed [7:0] i_X2_offset;  // int8
  wire signed [7:0] i_X2;  // int8
  wire [3:0] Data_Type_Conversion4_out1_addr_delay_1;  // ufix4
  reg signed [31:0] fp_i_W2;  // sfix32
  reg signed [7:0] rawData_i_W2;  // int8
  reg signed [31:0] status_i_W2;  // sfix32
  reg signed [7:0] holdData_i_W2;  // int8
  reg signed [7:0] i_W2_offset;  // int8
  wire signed [7:0] i_W2;  // int8
  wire [3:0] Data_Type_Conversion3_out1_addr_delay_1;  // ufix4
  reg signed [31:0] fp_i_X1;  // sfix32
  reg signed [7:0] rawData_i_X1;  // int8
  reg signed [31:0] status_i_X1;  // sfix32
  reg signed [7:0] holdData_i_X1;  // int8
  reg signed [7:0] i_X1_offset;  // int8
  wire signed [7:0] i_X1;  // int8
  wire [3:0] Data_Type_Conversion2_out1_addr_delay_1;  // ufix4
  reg signed [31:0] fp_i_W1;  // sfix32
  reg signed [7:0] rawData_i_W1;  // int8
  reg signed [31:0] status_i_W1;  // sfix32
  reg signed [7:0] holdData_i_W1;  // int8
  reg signed [7:0] i_W1_offset;  // int8
  wire signed [7:0] i_W1;  // int8
  wire [3:0] Data_Type_Conversion1_out1_addr_delay_1;  // ufix4
  reg signed [31:0] fp_i_X0;  // sfix32
  reg signed [7:0] rawData_i_X0;  // int8
  reg signed [31:0] status_i_X0;  // sfix32
  reg signed [7:0] holdData_i_X0;  // int8
  reg signed [7:0] i_X0_offset;  // int8
  wire signed [7:0] i_X0;  // int8
  wire Data_Type_Conversion_out1_active;  // ufix1
  wire Data_Type_Conversion_out1_enb;  // ufix1
  wire [3:0] Data_Type_Conversion_out1_addr_delay_1;  // ufix4
  reg signed [31:0] fp_i_W0;  // sfix32
  reg signed [7:0] rawData_i_W0;  // int8
  reg signed [31:0] status_i_W0;  // sfix32
  reg signed [7:0] holdData_i_W0;  // int8
  reg signed [7:0] i_W0_offset;  // int8
  wire signed [7:0] i_W0;  // int8
  reg  check1_done;  // ufix1
  wire snkDonen;
  wire resetn;
  wire tb_enb;
  wire ce_out;
  wire signed [15:0] Y;  // int16
  wire Y_enb;  // ufix1
  wire Y_lastAddr;  // ufix1
  wire [3:0] Y_addr_delay_1;  // ufix4
  reg signed [31:0] fp_Y_expected;  // sfix32
  reg signed [15:0] Y_expected;  // int16
  reg signed [31:0] status_Y_expected;  // sfix32
  wire signed [15:0] Y_ref;  // int16
  reg  Y_testFailure;  // ufix1
  wire testFailure;  // ufix1

  function real absReal(input real num);
  begin
    if (num < 0)
      absReal = -num;
    else
      absReal = num;
  end
  endfunction

  function real floatHalfToReal;
  input [15:0] x;
  reg [63:0] conv;

  begin
    conv[63] = x[15]; // sign 
    if (x[14:10] == 5'b0) // exp 
      conv[62:52] = 11'b0; 
    else
      conv[62:52] = 1023 + (x[14:10] - 15);
    conv[51:42] = x[9:0]; // mantissa 
    conv[41:0] = 42'b0;
    if (((x[14:10] == 5'h1F) && (x[9:0] != 10'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatHalfToReal = $bitstoreal(conv);
  end
  endfunction

  function real floatSingleToReal;
  input [31:0] x;
  reg [63:0] conv;

  begin
    conv[63] = x[31]; // sign 
    if (x[30:23] == 8'b0) // exp 
      conv[62:52] = 11'b0; 
    else
      conv[62:52] = 1023 + (x[30:23] - 127);
    conv[51:29] = x[22:0]; // mantissa 
    conv[28:0] = 29'b0;
    if (((x[30:23] == 8'hFF) && (x[22:0] != 23'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatSingleToReal = $bitstoreal(conv);
  end
  endfunction

  function real floatDoubleToReal;
  input [63:0] x;
  reg [63:0] conv;

  begin
    conv[63:0] = x[63:0]; 
    if (((x[62:52] == 11'h7FF) && (x[51:0] != 52'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatDoubleToReal = $bitstoreal(conv);
  end
  endfunction

  function isFloatEpsEqual(input real a, input real b, input real eps);
  real absdiff;

  begin
    absdiff = absReal(a - b);
    if (absdiff < eps) // absolute error check 
      isFloatEpsEqual = 1;
    else if (a == b) // check infinities 
      isFloatEpsEqual = 1; 
    else if (a*b == 0.0) // either is zero 
      isFloatEpsEqual = (absdiff < eps);
    else if (absReal(a) < absReal(b)) // relative error check
      isFloatEpsEqual = absdiff/absReal(b) < eps;
    else
      isFloatEpsEqual = absdiff/absReal(a) < eps;
  end
  endfunction
  function isFloatHalfEpsEqual;
  input [15:0] x;
  input [15:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatHalfToReal(x);
    b = floatHalfToReal(y);
    isFloatHalfEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction
  function isFloatSingleEpsEqual;
  input [31:0] x;
  input [31:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatSingleToReal(x);
    b = floatSingleToReal(y);
    isFloatSingleEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction
  function isFloatDoubleEpsEqual;
  input [63:0] x;
  input [63:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatDoubleToReal(x);
    b = floatDoubleToReal(y);
    isFloatDoubleEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction

  assign Y_done_enb = Y_done & rdEnb;



  assign Y_active = Y_addr != 4'b1010;



  assign #1 Data_Type_Conversion7_out1_addr_delay_1 = Data_Type_Conversion_out1_addr;

  // Data source for i_X3
  initial
    begin : i_X3_fileread
      fp_i_X3 = $fopen("i_X3.dat", "r");
      status_i_X3 = $rewind(fp_i_X3);
    end

  always @(Data_Type_Conversion7_out1_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_i_X3 <= 8'bx;
      end
      else if (rdEnb == 1) begin
        status_i_X3 = $fscanf(fp_i_X3, "%h", rawData_i_X3);
      end
    end

  // holdData reg for Data_Type_Conversion7_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Data_Type_Conversion7_out1
      if (reset) begin
        holdData_i_X3 <= 8'bx;
      end
      else begin
        holdData_i_X3 <= rawData_i_X3;
      end
    end

  always @(rawData_i_X3 or rdEnb)
    begin : stimuli_Data_Type_Conversion7_out1_1
      if (rdEnb == 1'b0) begin
        i_X3_offset <= holdData_i_X3;
      end
      else begin
        i_X3_offset <= rawData_i_X3;
      end
    end

  assign #2 i_X3 = i_X3_offset;

  assign #1 Data_Type_Conversion6_out1_addr_delay_1 = Data_Type_Conversion_out1_addr;

  // Data source for i_W3
  initial
    begin : i_W3_fileread
      fp_i_W3 = $fopen("i_W3.dat", "r");
      status_i_W3 = $rewind(fp_i_W3);
    end

  always @(Data_Type_Conversion6_out1_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_i_W3 <= 8'bx;
      end
      else if (rdEnb == 1) begin
        status_i_W3 = $fscanf(fp_i_W3, "%h", rawData_i_W3);
      end
    end

  // holdData reg for Data_Type_Conversion6_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Data_Type_Conversion6_out1
      if (reset) begin
        holdData_i_W3 <= 8'bx;
      end
      else begin
        holdData_i_W3 <= rawData_i_W3;
      end
    end

  always @(rawData_i_W3 or rdEnb)
    begin : stimuli_Data_Type_Conversion6_out1_1
      if (rdEnb == 1'b0) begin
        i_W3_offset <= holdData_i_W3;
      end
      else begin
        i_W3_offset <= rawData_i_W3;
      end
    end

  assign #2 i_W3 = i_W3_offset;

  assign #1 Data_Type_Conversion5_out1_addr_delay_1 = Data_Type_Conversion_out1_addr;

  // Data source for i_X2
  initial
    begin : i_X2_fileread
      fp_i_X2 = $fopen("i_X2.dat", "r");
      status_i_X2 = $rewind(fp_i_X2);
    end

  always @(Data_Type_Conversion5_out1_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_i_X2 <= 8'bx;
      end
      else if (rdEnb == 1) begin
        status_i_X2 = $fscanf(fp_i_X2, "%h", rawData_i_X2);
      end
    end

  // holdData reg for Data_Type_Conversion5_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Data_Type_Conversion5_out1
      if (reset) begin
        holdData_i_X2 <= 8'bx;
      end
      else begin
        holdData_i_X2 <= rawData_i_X2;
      end
    end

  always @(rawData_i_X2 or rdEnb)
    begin : stimuli_Data_Type_Conversion5_out1_1
      if (rdEnb == 1'b0) begin
        i_X2_offset <= holdData_i_X2;
      end
      else begin
        i_X2_offset <= rawData_i_X2;
      end
    end

  assign #2 i_X2 = i_X2_offset;

  assign #1 Data_Type_Conversion4_out1_addr_delay_1 = Data_Type_Conversion_out1_addr;

  // Data source for i_W2
  initial
    begin : i_W2_fileread
      fp_i_W2 = $fopen("i_W2.dat", "r");
      status_i_W2 = $rewind(fp_i_W2);
    end

  always @(Data_Type_Conversion4_out1_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_i_W2 <= 8'bx;
      end
      else if (rdEnb == 1) begin
        status_i_W2 = $fscanf(fp_i_W2, "%h", rawData_i_W2);
      end
    end

  // holdData reg for Data_Type_Conversion4_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Data_Type_Conversion4_out1
      if (reset) begin
        holdData_i_W2 <= 8'bx;
      end
      else begin
        holdData_i_W2 <= rawData_i_W2;
      end
    end

  always @(rawData_i_W2 or rdEnb)
    begin : stimuli_Data_Type_Conversion4_out1_1
      if (rdEnb == 1'b0) begin
        i_W2_offset <= holdData_i_W2;
      end
      else begin
        i_W2_offset <= rawData_i_W2;
      end
    end

  assign #2 i_W2 = i_W2_offset;

  assign #1 Data_Type_Conversion3_out1_addr_delay_1 = Data_Type_Conversion_out1_addr;

  // Data source for i_X1
  initial
    begin : i_X1_fileread
      fp_i_X1 = $fopen("i_X1.dat", "r");
      status_i_X1 = $rewind(fp_i_X1);
    end

  always @(Data_Type_Conversion3_out1_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_i_X1 <= 8'bx;
      end
      else if (rdEnb == 1) begin
        status_i_X1 = $fscanf(fp_i_X1, "%h", rawData_i_X1);
      end
    end

  // holdData reg for Data_Type_Conversion3_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Data_Type_Conversion3_out1
      if (reset) begin
        holdData_i_X1 <= 8'bx;
      end
      else begin
        holdData_i_X1 <= rawData_i_X1;
      end
    end

  always @(rawData_i_X1 or rdEnb)
    begin : stimuli_Data_Type_Conversion3_out1_1
      if (rdEnb == 1'b0) begin
        i_X1_offset <= holdData_i_X1;
      end
      else begin
        i_X1_offset <= rawData_i_X1;
      end
    end

  assign #2 i_X1 = i_X1_offset;

  assign #1 Data_Type_Conversion2_out1_addr_delay_1 = Data_Type_Conversion_out1_addr;

  // Data source for i_W1
  initial
    begin : i_W1_fileread
      fp_i_W1 = $fopen("i_W1.dat", "r");
      status_i_W1 = $rewind(fp_i_W1);
    end

  always @(Data_Type_Conversion2_out1_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_i_W1 <= 8'bx;
      end
      else if (rdEnb == 1) begin
        status_i_W1 = $fscanf(fp_i_W1, "%h", rawData_i_W1);
      end
    end

  // holdData reg for Data_Type_Conversion2_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Data_Type_Conversion2_out1
      if (reset) begin
        holdData_i_W1 <= 8'bx;
      end
      else begin
        holdData_i_W1 <= rawData_i_W1;
      end
    end

  always @(rawData_i_W1 or rdEnb)
    begin : stimuli_Data_Type_Conversion2_out1_1
      if (rdEnb == 1'b0) begin
        i_W1_offset <= holdData_i_W1;
      end
      else begin
        i_W1_offset <= rawData_i_W1;
      end
    end

  assign #2 i_W1 = i_W1_offset;

  assign #1 Data_Type_Conversion1_out1_addr_delay_1 = Data_Type_Conversion_out1_addr;

  // Data source for i_X0
  initial
    begin : i_X0_fileread
      fp_i_X0 = $fopen("i_X0.dat", "r");
      status_i_X0 = $rewind(fp_i_X0);
    end

  always @(Data_Type_Conversion1_out1_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_i_X0 <= 8'bx;
      end
      else if (rdEnb == 1) begin
        status_i_X0 = $fscanf(fp_i_X0, "%h", rawData_i_X0);
      end
    end

  // holdData reg for Data_Type_Conversion1_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Data_Type_Conversion1_out1
      if (reset) begin
        holdData_i_X0 <= 8'bx;
      end
      else begin
        holdData_i_X0 <= rawData_i_X0;
      end
    end

  always @(rawData_i_X0 or rdEnb)
    begin : stimuli_Data_Type_Conversion1_out1_1
      if (rdEnb == 1'b0) begin
        i_X0_offset <= holdData_i_X0;
      end
      else begin
        i_X0_offset <= rawData_i_X0;
      end
    end

  assign #2 i_X0 = i_X0_offset;

  assign Data_Type_Conversion_out1_active = Data_Type_Conversion_out1_addr != 4'b1010;



  assign Data_Type_Conversion_out1_enb = Data_Type_Conversion_out1_active & (rdEnb & tb_enb_delay);



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 10
  always @(posedge clk or posedge reset)
    begin : DataTypeConversion_process
      if (reset == 1'b1) begin
        Data_Type_Conversion_out1_addr <= 4'b0000;
      end
      else begin
        if (Data_Type_Conversion_out1_enb) begin
          if (Data_Type_Conversion_out1_addr >= 4'b1010) begin
            Data_Type_Conversion_out1_addr <= 4'b0000;
          end
          else begin
            Data_Type_Conversion_out1_addr <= Data_Type_Conversion_out1_addr + 4'b0001;
          end
        end
      end
    end



  assign #1 Data_Type_Conversion_out1_addr_delay_1 = Data_Type_Conversion_out1_addr;

  // Data source for i_W0
  initial
    begin : i_W0_fileread
      fp_i_W0 = $fopen("i_W0.dat", "r");
      status_i_W0 = $rewind(fp_i_W0);
    end

  always @(Data_Type_Conversion_out1_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_i_W0 <= 8'bx;
      end
      else if (rdEnb == 1) begin
        status_i_W0 = $fscanf(fp_i_W0, "%h", rawData_i_W0);
      end
    end

  // holdData reg for Data_Type_Conversion_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Data_Type_Conversion_out1
      if (reset) begin
        holdData_i_W0 <= 8'bx;
      end
      else begin
        holdData_i_W0 <= rawData_i_W0;
      end
    end

  always @(rawData_i_W0 or rdEnb)
    begin : stimuli_Data_Type_Conversion_out1_1
      if (rdEnb == 1'b0) begin
        i_W0_offset <= holdData_i_W0;
      end
      else begin
        i_W0_offset <= rawData_i_W0;
      end
    end

  assign #2 i_W0 = i_W0_offset;

  assign snkDonen =  ~ check1_done;



  assign resetn =  ~ reset;



  assign tb_enb = resetn & snkDonen;



  // Delay inside enable generation: register depth 1
  always @(posedge clk or posedge reset)
    begin : u_enable_delay
      if (reset) begin
        tb_enb_delay <= 0;
      end
      else begin
        tb_enb_delay <= tb_enb;
      end
    end

  assign rdEnb = (check1_done == 1'b0 ? tb_enb_delay :
              1'b0);



  assign #2 clk_enable = rdEnb;

  initial
    begin : reset_gen
      reset <= 1'b1;
      # (20);
      @ (posedge clk)
      # (2);
      reset <= 1'b0;
    end

  always 
    begin : clk_gen
      clk <= 1'b1;
      # (5);
      clk <= 1'b0;
      # (5);
      if (check1_done == 1'b1) begin
        clk <= 1'b1;
        # (5);
        clk <= 1'b0;
        # (5);
        $stop;
      end
    end

  PROCESSING_UNIT u_PROCESSING_UNIT (.clk(clk),
                                     .reset(reset),
                                     .clk_enable(clk_enable),
                                     .i_W0(i_W0),  // int8
                                     .i_X0(i_X0),  // int8
                                     .i_W1(i_W1),  // int8
                                     .i_X1(i_X1),  // int8
                                     .i_W2(i_W2),  // int8
                                     .i_X2(i_X2),  // int8
                                     .i_W3(i_W3),  // int8
                                     .i_X3(i_X3),  // int8
                                     .ce_out(ce_out),
                                     .Y(Y)  // int16
                                     );

  assign Y_enb = ce_out & Y_active;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 10
  always @(posedge clk or posedge reset)
    begin : c_2_process
      if (reset == 1'b1) begin
        Y_addr <= 4'b0000;
      end
      else begin
        if (Y_enb) begin
          if (Y_addr >= 4'b1010) begin
            Y_addr <= 4'b0000;
          end
          else begin
            Y_addr <= Y_addr + 4'b0001;
          end
        end
      end
    end



  assign Y_lastAddr = Y_addr >= 4'b1010;



  assign Y_done = Y_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk or posedge reset)
    begin : checkDone_1
      if (reset) begin
        check1_done <= 0;
      end
      else begin
        if (Y_done_enb) begin
          check1_done <= Y_done;
        end
      end
    end

  assign #1 Y_addr_delay_1 = Y_addr;

  // Data source for Y_expected
  initial
    begin : Y_expected_fileread
      fp_Y_expected = $fopen("Y_expected.dat", "r");
      status_Y_expected = $rewind(fp_Y_expected);
    end

  always @(Y_addr_delay_1, ce_out, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        Y_expected <= 16'bx;
      end
      else if (ce_out == 1) begin
        status_Y_expected = $fscanf(fp_Y_expected, "%h", Y_expected);
      end
    end

  assign Y_ref = Y_expected;

  always @(posedge clk or posedge reset)
    begin : Y_checker
      if (reset == 1'b1) begin
        Y_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && Y !== Y_ref) begin
          Y_testFailure <= 1'b1;
          $display("ERROR in Y at time %t : Expected '%h' Actual '%h'", $time, Y_ref, Y);
        end
      end
    end

  assign testFailure = Y_testFailure;

  always @(posedge clk)
    begin : completed_msg
      if (check1_done == 1'b1) begin
        if (testFailure == 1'b0) begin
          $display("**************TEST COMPLETED (PASSED)**************");
        end
        else begin
          $display("**************TEST COMPLETED (FAILED)**************");
        end
      end
    end

endmodule  // PROCESSING_UNIT_tb

