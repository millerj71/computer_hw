transcript off
# stop previous simulations
quit -sim 

# select a directory for creation of the work directory
# cd {file_directory_location}
cd {C:\Users\Joseph Miller\OneDrive\Documents\VHDL_Practice\CPU6502\jm6502}
vlib work
vmap work work

# compile the program and test-bench files (vcom program_name.vhd)
vcom jm6502_opcodes_package.vhd
vcom jm6502_package.vhd 
vcom test_jm6502.vhd

# # initializing the simulation window and adding waves to the simulation window 
# # vsim test_bench name
# vsim generateLoop_resource_tb 

# # add wave sim:/test-bench_name/dev_to_test/*
# add wave sim:/generateLoop_resource_tb/uut/*


# # define simulation time
# # run X ns
# run 200 ns
# # zoom out
# wave zoom full