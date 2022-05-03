
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.RAM_package.all;

entity RAM_tb is 
end RAM_tb;


architecture tb of RAM_tb is 

    component RAM is 
        generic(
            ADDR_LOWER_BOUND    : address := x"0000";
            ADDR_UPPER_BOUND    : address := x"FFFF"
            );
        port(
                enable              : in std_logic;
                read_hi_write_lo    : in std_logic;
                data_in             : in byte;
                addr_in             : in address;

                data_out            : out byte
            );
    end component RAM;

    signal enable           : std_logic := '0';
    signal read_hi_write_lo : std_logic;
    signal data_in          : byte;
    signal addr_in          : address   := x"0000";

    signal data_out         : byte;

begin 

    uut : RAM 
        port map(
                    enable              => enable,         
                    read_hi_write_lo    => read_hi_write_lo,
                    data_in             => data_in,
                    addr_in             => addr_in,
                    data_out            => data_out
                );



    stimulus : process 
        constant MAX_COUNT      : integer   := 2**(ADDR_WIDTH / 4);
        variable load_data      : byte      := x"00";
        variable lower_addr_byte   : byte; 
    begin 

        for I in 0 to MAX_COUNT - 1 loop

            lower_addr_byte     := std_logic_vector(to_unsigned(I, lower_addr_byte'length));
            load_data           := load_data xor lower_addr_byte;

            enable              <= '1';
            read_hi_write_lo    <= '0';
            data_in             <= load_data;
            addr_in             <= to_unsigned(I, addr_in'length);

            wait for 10 ns;

        end loop;

        for I in 0 to MAX_COUNT - 1 loop
             
            enable              <= '1';
            read_hi_write_lo    <= '1';
            addr_in             <= to_unsigned(I, addr_in'length);

            wait for 10 ns;

        end loop;

    end process; 
    





end tb;