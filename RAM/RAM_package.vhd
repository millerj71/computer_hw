
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.jm_hex.all;

package RAM_package is 

    constant ADDR_WIDTH         : integer := 16;
    constant NUM_ADDR_LOCATIONS : integer := 2**ADDR_WIDTH;

    subtype address     is unsigned(ADDR_WIDTH - 1 downto 0);
    type    RAM_16bit   is array(0 to NUM_ADDR_LOCATIONS - 1) of byte;


    function "and" (in1, in2 : std_logic) return boolean;  

end RAM_package;


package body RAM_package is 

    function "and" (in1, in2 : std_logic) return boolean is 
    
    begin 

        if (in1 and in2) = '1' then 
            return true;
        else 
            return false;
        end if;

    end function; 



end RAM_package;
    