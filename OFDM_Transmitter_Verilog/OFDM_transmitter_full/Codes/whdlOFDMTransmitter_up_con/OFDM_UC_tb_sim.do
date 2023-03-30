onbreak resume
onerror resume
vsim -L work -L work_whdlOFDMTx -voptargs=+acc work.OFDM_UC_tb

add wave sim:/OFDM_UC_tb/u_OFDM_UC/clk
add wave sim:/OFDM_UC_tb/u_OFDM_UC/reset
add wave sim:/OFDM_UC_tb/u_OFDM_UC/clk_enable
add wave sim:/OFDM_UC_tb/u_OFDM_UC/modTypeIndex
add wave sim:/OFDM_UC_tb/u_OFDM_UC/codeRateIndex
add wave sim:/OFDM_UC_tb/u_OFDM_UC/data
add wave sim:/OFDM_UC_tb/u_OFDM_UC/valid
add wave sim:/OFDM_UC_tb/u_OFDM_UC/ce_out_0
add wave sim:/OFDM_UC_tb/u_OFDM_UC/ce_out_1
add wave sim:/OFDM_UC_tb/u_OFDM_UC/txValid
add wave sim:/OFDM_UC_tb/txValid_ref
add wave sim:/OFDM_UC_tb/u_OFDM_UC/txData_re
add wave sim:/OFDM_UC_tb/txData_re_ref
add wave sim:/OFDM_UC_tb/u_OFDM_UC/txData_im
add wave sim:/OFDM_UC_tb/txData_im_ref
add wave sim:/OFDM_UC_tb/u_OFDM_UC/Out3
add wave sim:/OFDM_UC_tb/Out3_ref
add wave sim:/OFDM_UC_tb/u_OFDM_UC/Out4_re
add wave sim:/OFDM_UC_tb/Out4_re_ref
add wave sim:/OFDM_UC_tb/u_OFDM_UC/Out4_im
add wave sim:/OFDM_UC_tb/Out4_im_ref
add wave sim:/OFDM_UC_tb/u_OFDM_UC/ready
add wave sim:/OFDM_UC_tb/ready_ref
run -all
