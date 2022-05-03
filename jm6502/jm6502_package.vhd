
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.jm_hex.all;
use work.jm6502_opcodes_package.all;

package jm6502_package is 

    type sr_flag_type is record
    NEG     : std_logic;    -- Negative
    OVF     : std_logic;    -- Overflow
    IGN     : std_logic;    -- Ignored 
    BRK     : std_logic;    -- Break
    DEC     : std_logic;    -- Decimal (use BCD for arithmetics)
    IRQ     : std_logic;    -- Interrupt (IRQ disable)
    ZERO    : std_logic;    -- Zero 
    CARRY   : std_logic;    -- Carry
    end record;


    function to_byte(input  : sr_flag_type)         return byte; 

    function isLow(input    : std_logic)            return boolean;
    function isLow(input    : std_logic_vector)     return boolean;

    function isHigh(input   : std_logic)            return boolean;
    function isHigh(input   : std_logic_vector)     return boolean;





end jm6502_package;


package body jm6502_package is 


    function to_byte(input : sr_flag_type) return byte is 
        variable output : byte;
    begin 

        output := ( input.NEG, 
                    input.OVF, 
                    input.IGN, 
                    input.BRK, 
                    input.DEC, 
                    input.IRQ, 
                    input.ZERO, 
                    input.CARRY ); 
        return output; 

    end function to_byte; 





    function isLow(input : std_logic) return boolean is 
        variable output     : boolean;
    begin 
        if input = '0' then 
            output := true;
        else 
            output := false;
        end if;
        return output; 
    end function isLow;

    function isLow(input : std_logic_vector) return boolean is 
        variable output     : boolean := true;
    begin 
        for I in 0 to input'high loop
            output := output and isLow(input(I));
        end loop;
    end function isLow;



    function isHigh(input : std_logic) return boolean is 
        variable output     : boolean;
    begin 
        if input = '1' then 
            output := true;
        else 
            output := false;
        end if;
        return output;  
    end function isHigh;

    function isHigh(input : std_logic_vector) return boolean is 
        variable output     : boolean := true;
    begin 
        for I in 0 to input'high loop
            output := output and isHigh(input(I));
        end loop;
    end function isHigh;










end jm6502_package;