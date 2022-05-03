
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ROM_package.all;
use work.jm_hex.all;

entity ROM is 
    port(
        addr_in     : in address;
        
        data_out    : out byte
    );
end ROM;


architecture synth of ROM is 

    signal memory     : ROM_16bit;

begin 

    memory <= load_ROM;

    data_out    <= memory(to_integer(unsigned(addr_in)));



end synth;