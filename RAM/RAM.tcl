transcript off
# stop previous simulations
quit -sim 

# select a directory for creation of the work directory
# cd {file_directory_location}
cd {C:\Users\Joseph Miller\OneDrive\Documents\VHDL_Practice\computer_hw\RAM}
vlib work
vmap work work

# compile the program and test-bench files (vcom program_name.vhd)
vcom RAM_package.vhd
vcom RAM.vhd
vcom RAM_tb.vhd

# initializing the simulation window and adding waves to the simulation window 
# vsim test_bench name
vsim RAM_tb 

# add wave sim:/test-bench_name/dev_to_test/*
add wave sim:/RAM_tb/uut/*


# define simulation time
# run X ns
run 20000 ns
# zoom out
wave zoom full