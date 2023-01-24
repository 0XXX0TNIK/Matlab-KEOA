onbreak resume
onerror resume
vsim -voptargs=+acc work.CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT_tb

add wave sim:/CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT_tb/u_CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT/clk
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT_tb/u_CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT/reset
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT_tb/u_CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT/clk_enable
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT_tb/u_CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT/I_COMPLEX_VALUE_re
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT_tb/u_CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT/I_COMPLEX_VALUE_im
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT_tb/u_CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT/ce_out
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT_tb/u_CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT/O_MAGNITUDE
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT_tb/O_MAGNITUDE_ref
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT_tb/u_CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT/O_PHASE
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FLOAT_POINT_tb/O_PHASE_ref
run -all
