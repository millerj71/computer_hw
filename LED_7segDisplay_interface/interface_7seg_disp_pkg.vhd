
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package interface_7seg_disp_pkg is 

    subtype nibble  is unsigned(3 downto 0);
    subtype byte    is unsigned(7 downto 0);

    function to_7seg(input : nibble; isActiveHigh : boolean := true; offset : integer := 0) return byte;


end interface_7seg_disp_pkg;


package body interface_7seg_disp_pkg is 

    
    function to_7seg(input : nibble; isActiveHigh : boolean := true; offset : integer := 0) return byte is 
        variable output         : byte;
        variable isActiveLow    : boolean := not (isActiveHigh);
    begin 

        -- 7-seg display using byte representation in the form: 'A, B, C, D, E, F, G, DP'. However,
        -- it has an offset input to allow the bits to be circshifted left.
        case input is 
            when x"0"   => output := B"1111_1100"; 
            when x"1"   => output := B"0110_0000"; 
            when x"2"   => output := B"1101_1010"; 
            when x"3"   => output := B"1111_0010"; 
            when x"4"   => output := B"0110_0110"; 
            when x"5"   => output := B"1011_0110"; 
            when x"6"   => output := B"1011_1110"; 
            when x"7"   => output := B"1110_0000"; 
            when x"8"   => output := B"1111_1110"; 
            when x"9"   => output := B"1111_0110"; 
            when x"A"   => output := B"1110_1110"; 
            when x"B"   => output := B"0011_1110"; 
            when x"C"   => output := B"1001_1110"; 
            when x"D"   => output := B"0111_1010"; 
            when x"E"   => output := B"1001_1110"; 
            when x"F"   => output := B"1000_1110"; 
            when others => output := (others => 'X');
        end case;

        
        -- circshift left by offset
        if offset /= 0 then 
            output :=  output(output'high - offset downto 0) & output(output'high downto output'high - offset + 1);
        end if;

        if isActiveLow then 
            output := not (output);
        end if;


        return output;


    end to_7seg;




end interface_7seg_disp_pkg; 
