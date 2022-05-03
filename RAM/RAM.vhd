
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.RAM_package.all;

entity RAM is 
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
end RAM;


architecture synth of RAM is 

    signal memory           : RAM_16bit;

begin 


    READ_DATA : process( enable, read_hi_write_lo, addr_in)
        variable isBeingRead        : boolean;
        variable isInAddressRange   : boolean;
    begin 

        isBeingRead         := enable and read_hi_write_lo;
        isInAddressRange    := (addr_in <= ADDR_UPPER_BOUND) and (addr_in >= ADDR_LOWER_BOUND);

        assert (isInAddressRange) report "ADDRESS NOT IN RANGE" severity failure;

        if isBeingRead and isInAddressRange then  
            data_out    <= memory(to_integer(addr_in));
        else 
            data_out    <= (others => 'X');
        end if;

    end process READ_DATA;


    WRITE_DATA : process( enable, read_hi_write_lo, addr_in )
        variable isBeingWrittenTo   : boolean; 
        variable isInAddressRange   : boolean;
    begin 

        isBeingWrittenTo := enable and not( read_hi_write_lo ); 
        isInAddressRange := (addr_in <= ADDR_UPPER_BOUND) and (addr_in >= ADDR_LOWER_BOUND);

        assert (isInAddressRange) report "ADDRESS NOT IN RANGE" severity failure;
        
        if isBeingWrittenTo and isInAddressRange then 
            memory(to_integer(addr_in)) <= data_in;
        end if;

    end process WRITE_DATA;




end synth;