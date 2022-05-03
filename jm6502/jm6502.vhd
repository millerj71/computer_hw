
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.jm6502_opcodes_package.all;
use work.jm6502_package.all;


entity jm6502 is 
    generic(

    );
    port(

        clk_in              : in std_logic;
        reset_n             : in std_logic;
        ready               : in std_logic;

        irq_n               : in std_logic;
        NMI_n               : in std_logic;

        data_in             : in byte;


        
        clk_out1            : out std_logic;    
        clk_out2            : out std_logic;    

        read_hi_write_lo    : out std_logic;
        sync                : out std_logic;

        data_out            : out byte;
        address_out         : out address;

    );
end jm6502;


architecture synth of jm6502 is 
 
    -------------------------------------------------------------------------------------
    -- Required Internal Registers ------------------------------------------------------
    -------------------------------------------------------------------------------------

    signal accumulator          : byte;
    signal index_regX           : byte;
    signal index_regY           : byte;

    signal stack_pointer        : byte;
    signal status_reg           : byte;

    signal program_counter      : address;
    signal program_counter_low  : byte;
    signal program_counter_high : byte;



    -------------------------------------------------------------------------------------
    -- Output Signals for Internal Use --------------------------------------------------
    -------------------------------------------------------------------------------------

    signal clk_out1_int             : std_logic;
    signal clk_out2_int             : std_logic;
 
    signal read_hi_write_lo_int     : std_logic;
    signal sync_int                 : std_logic;
    signal data_out_int             : byte;
    signal address_out_int          : address;





    signal sr_flag              : sr_flag_type;




    
    -------------------------
    -- Required States: 
    -------------------------
    -- idle,
    -- reset_state,
    -- startup_state,
    -- load_start_address,
    -- read_command_state, 
    -- read_data_state,
    -- write_data_state,
    -- IRQ_state, 
    -- NMI_state, 

    
    type cpu_state_machine_type is (irq_state, idle, startup_state, load_start_address, running, reset_state);
    signal current_state        : cpu_state_machine_type;
    signal next_state           : cpu_state_machine_type; 






    CONSTANT MAX_STARTUP_COUNT              : integer := 7; -- Required clock cycles after reset 
    signal startup_counter                  : integer;

    constant MAX_LOAD_START_ADDRESS_COUNT   : integer := 2; -- Required clock cycles to get first address location
    signal load_start_address_counter       : integer; 

    signal required_cycles                  : integer;
    signal cycles_counter                   : integer;



    signal reset                            : std_logic;    -- Active-High Reset 



begin 

    reset <= not reset_n;


    -- Assigning jm6502 output signals
    clk_out1            <= clk_out1_int;     
    clk_out2            <= clk_out2_int;

    read_hi_write_lo    <= read_hi_write_lo_int;
    sync                <= sync_int;           
    data_out            <= data_in when read_hi_write_lo_int = '1' else data_out_int; 
    address_out         <= address_out_int;






    STATE_MACHINE   : process(
                                clk_in,
                                reset_n,
                                irq_n,
                                NMI_n,
                                data_bus_in,

                            );

    begin 

        if isLow( NMI_n )  then 
            -- Add NMI functionality later
            null;


        elsif isLow( irq_n ) and isLow( sr_flag.IRQ ) then 
            -- Add interrupt functionality later
            null;


        elsif rising_edge(clk) then 

            if isLow( reset_n ) then 
                current_state   <= reset_state;
                next_state      <= startup_state;


            elsif ( next_state = reset_state ) then 
                current_state   <= reset_state;
                next_state      <= startup_state;


            elsif ( next_state = startup_state ) then 
                current_state   <= startup_state; 

                if ( startup_counter >= MAX_STARTUP_COUNT ) then 
                    next_state  <= setup;
                end if;
            

            elsif ( next_state = load_start_address ) then 
                current_state   <= load_start_address;

                if ( load_start_address_counter >= MAX_LOAD_START_ADDRESS_COUNTER )
                    next_state  <= running; 
                end if;

            
            else 
                null;
        
            end if; 


        end if; 
    
    end process STATE_MACHINE; 










end synth; 




