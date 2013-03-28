# Display signals from module cpu_0
add wave -noupdate -divider {cpu_0}
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/i_readdata
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/i_readdatavalid
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/i_waitrequest
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/i_address
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/i_read
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/clk
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/reset_n
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_readdata
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_waitrequest
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_irq
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_address
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_byteenable
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_read
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_write
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_writedata
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_pcb
add wave -noupdate -format Logic -radix ascii /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_vinst
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_valid
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_iw


# Display signals from module cpu_1
add wave -noupdate -divider {cpu_1}
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/i_readdata
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/i_readdatavalid
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/i_waitrequest
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/i_address
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/i_read
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/clk
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/reset_n
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/d_readdata
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/d_waitrequest
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/d_irq
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/d_address
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/d_byteenable
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/d_read
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/d_write
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/d_writedata
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/the_cpu_1_test_bench/W_pcb
add wave -noupdate -format Logic -radix ascii /test_bench/DUT/the_cpu_1/the_cpu_1_test_bench/W_vinst
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/the_cpu_1_test_bench/W_valid
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_1/the_cpu_1_test_bench/W_iw


# Display signals from module onchip_memory_0
add wave -noupdate -divider {onchip_memory_0}
add wave -noupdate -format Logic /test_bench/DUT/the_onchip_memory_0/chipselect
add wave -noupdate -format Logic /test_bench/DUT/the_onchip_memory_0/write
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_onchip_memory_0/address
add wave -noupdate -format Literal -radix binary /test_bench/DUT/the_onchip_memory_0/byteenable
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_onchip_memory_0/readdata
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_onchip_memory_0/writedata


# Display signals from module onchip_memory_1
add wave -noupdate -divider {onchip_memory_1}
add wave -noupdate -format Logic /test_bench/DUT/the_onchip_memory_1/chipselect
add wave -noupdate -format Logic /test_bench/DUT/the_onchip_memory_1/write
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_onchip_memory_1/address
add wave -noupdate -format Literal -radix binary /test_bench/DUT/the_onchip_memory_1/byteenable
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_onchip_memory_1/readdata
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_onchip_memory_1/writedata


# Display signals from module onchip_memory_2
add wave -noupdate -divider {onchip_memory_2}
add wave -noupdate -format Logic /test_bench/DUT/the_onchip_memory_2/chipselect
add wave -noupdate -format Logic /test_bench/DUT/the_onchip_memory_2/write
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_onchip_memory_2/address
add wave -noupdate -format Literal -radix binary /test_bench/DUT/the_onchip_memory_2/byteenable
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_onchip_memory_2/readdata
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_onchip_memory_2/writedata


# Display signals from module mutex_0
add wave -noupdate -divider {mutex_0}
add wave -noupdate -format Logic /test_bench/DUT/the_mutex_0/chipselect
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_mutex_0/address
add wave -noupdate -format Logic /test_bench/DUT/the_mutex_0/write
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_mutex_0/data_from_cpu
add wave -noupdate -format Logic /test_bench/DUT/the_mutex_0/read
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_mutex_0/data_to_cpu
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_mutex_0/reset_reg
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_mutex_0/mutex_state
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_mutex_0/mutex_value
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_mutex_0/mutex_owner


configure wave -justifyvalue right
configure wave -signalnamewidth 1
TreeUpdate [SetDefaultTree]