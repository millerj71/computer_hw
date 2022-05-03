
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.jm6502_opcode_package.all;
use work.jm6502_package.all;


entity instruction_decode is 
    generic(

    );
    port(

        -- From Datasheet 
        clk1                    : in std_logic;
        clk2                    : in std_logic;     -- Unsure of clk2's use.

        reset_n                 : in std_logic;
        irq_n                   : in std_logic;
        NMI_n                   : in std_logic;

        ready                   : in std_logic;

        instruction             : in byte;
        status_reg              : in byte;


        read_hi_write_lo        : out std_logic;
        sync                    : out std_logic;

        indexX_en               : out std_logic;
        indexY_en               : out std_logic;
        stack_pointer_en        : out std_logic;
        ALU_en                  : out std_logic;
        accumulator_en          : out std_logic;
        program_counter_low_en  : out std_logic;
        data_latch_en           : out std_logic;


        -- Additional Information
        num_bytes               : out integer;
        num_cycles              : out integer;



    );

end instruction_decode;


architecture synth of instruction_decode is 

    signal instruction_params   : opcode_parameters;

begin 



    instruction_params <= find_opcode_parameters( instruction );






end synth;