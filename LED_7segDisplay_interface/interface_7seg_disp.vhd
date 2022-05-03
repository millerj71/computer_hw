
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.interface_7seg_disp_pkg.all;

entity interface_7seg_disp is 
    generic(
            IS_ACTIVE_HIGH  : boolean := true;
            OFFSET          : integer := 0
    );
    port(
        nibble_in   : in nibble;
        byte_out    : out byte
    );
end interface_7seg_disp;


architecture synth of interface_7seg_disp is 

begin 

    byte_out <= to_7seg(nibble_in, IS_ACTIVE_HIGH, OFFSET);

end synth;