onbreak resume
onerror resume
vsim -voptargs=+acc work.PROCESSING_UNIT_tb

add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/clk
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/reset
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/clk_enable
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/i_W0
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/i_X0
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/i_W1
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/i_X1
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/i_W2
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/i_X2
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/i_W3
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/i_X3
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/ce_out
add wave sim:/PROCESSING_UNIT_tb/u_PROCESSING_UNIT/Y
add wave sim:/PROCESSING_UNIT_tb/Y_ref
run -all
