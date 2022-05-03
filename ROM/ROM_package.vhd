
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use std.textio.all;

use work.jm_hex.all;

package ROM_package is 

    constant ADDR_WIDTH         : integer := 16;
    constant NUM_ADDR_LOCATIONS : integer := 2**ADDR_WIDTH;

    subtype address     is std_logic_vector(ADDR_WIDTH - 1 downto 0);
    type    ROM_16bit   is array(0 to NUM_ADDR_LOCATIONS - 1) of byte;




    function char2hex(input : character) return nibble;

    impure function load_ROM return ROM_16bit;  





end ROM_package;


package body ROM_package is 

    function char2hex(input : character) return nibble is 
        variable output : nibble;
    begin 

        case input is 
            when '0' => output := x"0";
            when '1' => output := x"1";
            when '2' => output := x"2";
            when '3' => output := x"3";
            when '4' => output := x"4";
            when '5' => output := x"5";
            when '6' => output := x"6";
            when '7' => output := x"7";
            when '8' => output := x"8";
            when '9' => output := x"9";
            when 'A' | 'a'  => output := x"A";
            when 'B' | 'b'  => output := x"B";
            when 'C' | 'c'  => output := x"C";
            when 'D' | 'd'  => output := x"D";
            when 'E' | 'e'  => output := x"E";
            when 'F' | 'f'  => output := x"F";
            when others => output := "ZZZZ";
        end case;

        return output;

    end char2hex;





    impure function load_ROM return ROM_16bit is 
        file        program_file    : text open read_mode is "program.txt";
        variable    current_line    : line;
        variable    rom_output      : ROM_16bit;
        variable    current_char    : character;
        variable    addr_location   : integer := 0;
        variable    upper_nibble    : nibble;
        variable    lower_nibble    : nibble;
        variable    current_byte    : byte;
    begin 

        while (not endfile(program_file)) and (addr_location < NUM_ADDR_LOCATIONS) loop 

            readline(program_file, current_line);

            read(current_line, current_char);
            upper_nibble := char2hex(current_char);
            
            read(current_line, current_char);
            lower_nibble := char2hex(current_char);

            rom_output(addr_location) := upper_nibble & lower_nibble; 

            addr_location := addr_location + 1;

        end loop;

        while ( addr_location < NUM_ADDR_LOCATIONS - 1) loop 
            
            rom_output(addr_location) := (others => '0');

            addr_location := addr_location + 1;

        end loop;


        return rom_output;

    
    end load_ROM;
            



end ROM_package;