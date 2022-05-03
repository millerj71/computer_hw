
library ieee;
use ieee.std_logic_1164.all;

use work.jm6502_opcodes_package.all;
use work.jm6502_package.all;


entity test_jm6502 is 
    port(
        input   : in byte;
        output  : out byte
    );
end test_jm6502;



architecture synth of test_jm6502 is 

    signal test_params : opcode_parameters;

begin 

    test_params <= find_opcode_parameters(input);
    output <= input when test_params.num_bytes = 1 else (others => '0');


end synth;