
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.ROM_package.all;

entity ROM_tb is 
end ROM_tb;


architecture tb of ROM_tb is 

    component ROM is 
        port(
                addr_in     : in address;

                data_out    : out byte
            );
    end component ROM;

    signal addr_in          : address;
    signal data_out         : byte;

begin 

    uut : ROM 
        port map(
            addr_in     => addr_in, 
            data_out    => data_out
        );

    stimulus : process 
        constant MAX_COUNT  : integer := 2**ADDR_WIDTH;
    begin 

        for I in 0 to MAX_COUNT - 1 loop 
            addr_in <= std_logic_vector(to_unsigned(I, addr_in'length));

            wait for 10 ns;

        end loop;

    end process; 
    





end tb;
