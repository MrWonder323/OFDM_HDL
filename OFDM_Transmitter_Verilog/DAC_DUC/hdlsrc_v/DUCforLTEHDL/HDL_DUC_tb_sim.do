onbreak resume
onerror resume
vsim -voptargs=+acc work.HDL_DUC_tb

add wave sim:/HDL_DUC_tb/u_HDL_DUC/clk
add wave sim:/HDL_DUC_tb/u_HDL_DUC/reset
add wave sim:/HDL_DUC_tb/u_HDL_DUC/clk_enable
add wave sim:/HDL_DUC_tb/u_HDL_DUC/dataIn
add wave sim:/HDL_DUC_tb/u_HDL_DUC/ValidIn
add wave sim:/HDL_DUC_tb/u_HDL_DUC/ce_out
add wave sim:/HDL_DUC_tb/u_HDL_DUC/Out1_re
add wave sim:/HDL_DUC_tb/Out1_re_ref
add wave sim:/HDL_DUC_tb/u_HDL_DUC/Out1_im
add wave sim:/HDL_DUC_tb/Out1_im_ref
add wave sim:/HDL_DUC_tb/u_HDL_DUC/Out2
add wave sim:/HDL_DUC_tb/Out2_ref
run -all
