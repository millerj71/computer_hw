
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.jm_hex.all;

package jm6502_opcodes_package is 


    -- Custom Types
    subtype address is unsigned(15 downto 0);



    
    -- Instruction Opcodes
    subtype opcode is unsigned(7 downto 0);

    --------------------------------------------------------------------------------------------
    -- Legal Instruction Opcodes ---------------------------------------------------------------
    --------------------------------------------------------------------------------------------
    
    -- MSB '0'
    constant OPCODE_BRK_IMPL    : opcode := x"00";
    constant OPCODE_ORA_X_IND   : opcode := x"01";
    constant OPCODE_ORA_ZPG     : opcode := x"05";
    constant OPCODE_ASL_ZPG     : opcode := x"06";
    constant OPCODE_PHP_IMPL    : opcode := x"08";
    constant OPCODE_ORA_NUM     : opcode := x"09";
    constant OPCODE_ASL_A       : opcode := x"0A";
    constant OPCODE_ORA_ABS     : opcode := x"0D";
    constant OPCODE_ASL_ABS     : opcode := x"0E";
    
    -- MSB '1'
    constant OPCODE_BPL_REL     : opcode := x"10";
    constant OPCODE_ORA_IND_Y   : opcode := x"11";
    constant OPCODE_ORA_ZPG_X   : opcode := x"15";
    constant OPCODE_ASL_ZPG_X   : opcode := x"16";
    constant OPCODE_CLC_IMPL    : opcode := x"18";
    constant OPCODE_ORA_ABS_Y   : opcode := x"19";
    constant OPCODE_ORA_ABS_X   : opcode := x"1D";
    constant OPCODE_ASL_ABS_X   : opcode := x"1E";
    
    -- MSB '2'
    constant OPCODE_JSR_ABS     : opcode := x"20";
    constant OPCODE_AND_X_IND   : opcode := x"21";
    constant OPCODE_BIT_ZPG     : opcode := x"24";
    constant OPCODE_AND_ZPG     : opcode := x"25";
    constant OPCODE_ROL_ZPG     : opcode := x"26";
    constant OPCODE_PLP_IMPL    : opcode := x"28";
    constant OPCODE_AND_NUM     : opcode := x"29";
    constant OPCODE_ROL_A       : opcode := x"2A";
    constant OPCODE_BIT_ABS     : opcode := x"2C";
    constant OPCODE_AND_ABS     : opcode := x"2D";
    constant OPCODE_ROL_ABS     : opcode := x"2E";
    
    -- MSB '3'
    constant OPCODE_BMI_REL     : opcode := x"30";
    constant OPCODE_AND_IND_Y   : opcode := x"31";
    constant OPCODE_AND_ZPG_X   : opcode := x"35";
    constant OPCODE_ROL_ZPG_X   : opcode := x"36";
    constant OPCODE_SEC_IMPL    : opcode := x"38";
    constant OPCODE_AND_ABS_Y   : opcode := x"39";
    constant OPCODE_AND_ABS_X   : opcode := x"3D";
    constant OPCODE_ROL_ABS_X   : opcode := x"3E";
    
    -- MSB '4'
    constant OPCODE_RTI_IMPL    : opcode := x"40";
    constant OPCODE_EOR_X_IND   : opcode := x"41";
    constant OPCODE_EOR_ZPG     : opcode := x"45";
    constant OPCODE_LSR_ZPG     : opcode := x"46";
    constant OPCODE_PHA_IMPL    : opcode := x"48";
    constant OPCODE_EOR_NUM     : opcode := x"49";
    constant OPCODE_LSR_A       : opcode := x"4A";
    constant OPCODE_JMP_ABS     : opcode := x"4C";
    constant OPCODE_EOR_ABS     : opcode := x"4D";
    constant OPCODE_LSR_ABS     : opcode := x"4E";
    
    -- MSB '5'
    constant OPCODE_BVC_REL     : opcode := x"50";
    constant OPCODE_EOR_IND_Y   : opcode := x"51";
    constant OPCODE_EOR_ZPG_X   : opcode := x"55";
    constant OPCODE_LSR_ZPG_X   : opcode := x"56";
    constant OPCODE_CLI_IMPL    : opcode := x"58";
    constant OPCODE_EOR_ABS_Y   : opcode := x"59";
    constant OPCODE_EOR_ABS_X   : opcode := x"5D";
    constant OPCODE_LSR_ABS_X   : opcode := x"5E";
    
    -- MSB '6'
    constant OPCODE_RTS_IMPL    : opcode := x"60";
    constant OPCODE_ADC_X_IND   : opcode := x"61";
    constant OPCODE_ADC_ZPG     : opcode := x"65";
    constant OPCODE_ROR_ZPG     : opcode := x"66";
    constant OPCODE_PLA_IMPL    : opcode := x"68";
    constant OPCODE_ADC_NUM     : opcode := x"69";
    constant OPCODE_ROR_A       : opcode := x"6A";
    constant OPCODE_JMP_IND     : opcode := x"6C";
    constant OPCODE_ADC_ABS     : opcode := x"6D";
    constant OPCODE_ROR_ABS     : opcode := x"6E";
    
    -- MSB '7'
    constant OPCODE_BVS_REL     : opcode := x"70";
    constant OPCODE_ADC_IND_Y   : opcode := x"71";
    constant OPCODE_ADC_ZPG_X   : opcode := x"75";
    constant OPCODE_ROR_ZPG_X   : opcode := x"76";
    constant OPCODE_SEI_IMPL    : opcode := x"78";
    constant OPCODE_ADC_ABS_Y   : opcode := x"79";
    constant OPCODE_ADC_ABS_X   : opcode := x"7D";
    constant OPCODE_ROR_ABS_X   : opcode := x"7E";
    
    -- MSB '8'
    constant OPCODE_STA_X_IND   : opcode := x"81";
    constant OPCODE_STY_ZPG     : opcode := x"84";
    constant OPCODE_STA_ZPG     : opcode := x"85";
    constant OPCODE_STX_ZPG     : opcode := x"86";
    constant OPCODE_DEY_IMPL    : opcode := x"88";
    constant OPCODE_TXA_IMPL    : opcode := x"8A";
    constant OPCODE_STY_ABS     : opcode := x"8C";
    constant OPCODE_STA_ABS     : opcode := x"8D";
    constant OPCODE_STX_ABS     : opcode := x"8E";
    
    -- MSB '9'
    constant OPCODE_BCC_REL     : opcode := x"90";
    constant OPCODE_STA_IND_Y   : opcode := x"91";
    constant OPCODE_STY_ZPG_X   : opcode := x"94";
    constant OPCODE_STA_ZPG_X   : opcode := x"95";
    constant OPCODE_STX_ZPG_Y   : opcode := x"96";
    constant OPCODE_TYA_IMPL    : opcode := x"98";
    constant OPCODE_STA_ABS_Y   : opcode := x"99";
    constant OPCODE_TXS_IMPL    : opcode := x"9A";
    constant OPCODE_STA_ABS_X   : opcode := x"9D";
    
    -- MSB 'A'
    constant OPCODE_LDY_NUM     : opcode := x"A0";
    constant OPCODE_LDA_X_IND   : opcode := x"A1";
    constant OPCODE_LDX_NUM     : opcode := x"A2";
    constant OPCODE_LDY_ZPG     : opcode := x"A4";
    constant OPCODE_LDA_ZPG     : opcode := x"A5";
    constant OPCODE_LDX_ZPG     : opcode := x"A6";
    constant OPCODE_TAY_IMPL    : opcode := x"A8";
    constant OPCODE_LDA_NUM     : opcode := x"A9";
    constant OPCODE_TAX_IMPL    : opcode := x"AA";
    constant OPCODE_LDY_ABS     : opcode := x"AC";  
    constant OPCODE_LDA_ABS     : opcode := x"AD";     
    constant OPCODE_LDX_ABS     : opcode := x"AE";
    
    -- MSB 'B'
    constant OPCODE_BCS_REL     : opcode := x"B0";
    constant OPCODE_LDA_IND_Y   : opcode := x"B1";
    constant OPCODE_LDY_ZPG_X   : opcode := x"B4";
    constant OPCODE_LDA_ZPG_X   : opcode := x"B5";
    constant OPCODE_LDX_ZPG_Y   : opcode := x"B6";
    constant OPCODE_CLV_IMPL    : opcode := x"B8";
    constant OPCODE_LDA_ABS_Y   : opcode := x"B9";
    constant OPCODE_TSX_IMPL    : opcode := x"BA";
    constant OPCODE_LDY_ABS_X   : opcode := x"BC";
    constant OPCODE_LDA_ABS_X   : opcode := x"BD";
    constant OPCODE_LDX_ABS_Y   : opcode := x"BE";
    
    -- MSB 'C'
    constant OPCODE_CPY_NUM     : opcode := x"C0";
    constant OPCODE_CMP_X_IND   : opcode := x"C1";
    constant OPCODE_CPY_ZPG     : opcode := x"C4";
    constant OPCODE_CMP_ZPG     : opcode := x"C5";
    constant OPCODE_DEC_ZPG     : opcode := x"C6";
    constant OPCODE_INY_IMPL    : opcode := x"C8";
    constant OPCODE_CMP_NUM     : opcode := x"C9";
    constant OPCODE_DEX_IMPL    : opcode := x"CA";
    constant OPCODE_CPY_ABS     : opcode := x"CC";
    constant OPCODE_CMP_ABS     : opcode := x"CD";
    constant OPCODE_DEC_ABS     : opcode := x"CE";
    
    -- MSB 'D'
    constant OPCODE_BNE_REL     : opcode := x"D0";
    constant OPCODE_CMP_IND_Y   : opcode := x"D1";
    constant OPCODE_CMP_ZPG_X   : opcode := x"D5";
    constant OPCODE_DEC_ZPG_X   : opcode := x"D6";
    constant OPCODE_CLD_IMPL    : opcode := x"D8";
    constant OPCODE_CMP_ABS_Y   : opcode := x"D9";
    constant OPCODE_CMP_ABS_X   : opcode := x"DD";
    constant OPCODE_DEC_ABS_X   : opcode := x"DE";
    
    -- MSB 'E'
    constant OPCODE_CPX_NUM     : opcode := x"E0";
    constant OPCODE_SBC_X_IND   : opcode := x"E1";
    constant OPCODE_CPX_ZPG     : opcode := x"E4";
    constant OPCODE_SBC_ZPG     : opcode := x"E5";
    constant OPCODE_INC_ZPG     : opcode := x"E6";
    constant OPCODE_INX_IMPL    : opcode := x"E8";
    constant OPCODE_SBC_NUM     : opcode := x"E9";
    constant OPCODE_NOP_IMPL    : opcode := x"EA";
    constant OPCODE_CPX_ABS     : opcode := x"EC";
    constant OPCODE_SBC_ABS     : opcode := x"ED";
    constant OPCODE_INC_ABS     : opcode := x"EE";
    
    -- MSB 'F'
    constant OPCODE_BEQ_REL     : opcode := x"F0";
    constant OPCODE_SBC_IND_Y   : opcode := x"F1";
    constant OPCODE_SBC_ZPG_X   : opcode := x"F5";
    constant OPCODE_INC_ZPG_X   : opcode := x"F6";
    constant OPCODE_SED_IMPL    : opcode := x"F8";
    constant OPCODE_SBC_ABS_Y   : opcode := x"F9";
    constant OPCODE_SBC_ABS_X   : opcode := x"FD";
    constant OPCODE_INC_ABS_X   : opcode := x"FE";








 

    --------------------------------------------------------------------------------------------
    -- Legal Opcode Parameters -----------------------------------------------------------------
    --------------------------------------------------------------------------------------------
    -- * Add 1 to N if page boundary is crossed
    -- **Add 1 to N if branch occurs to same page and 2 to N if branch occurs to different page
    --------------------------------------------------------------------------------------------

    -- Opcode Parameters 
    type opcode_parameters is record 
        num_bytes   : integer;
        num_cycles  : integer;
    end record;


    -- MSB = '0'
    constant PARAMS_BRK_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 7);
    constant PARAMS_ORA_X_IND   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_ORA_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_ASL_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 5);
    constant PARAMS_PHP_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 3);
    constant PARAMS_ORA_NUM     : opcode_parameters := (num_bytes => 2, num_cycles => 2);
    constant PARAMS_ASL_A       : opcode_parameters := (num_bytes => 1, num_cycles => 1);
    constant PARAMS_ORA_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_ASL_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 5);

    -- MSB = '1'
    constant PARAMS_BPL_REL     : opcode_parameters := (num_bytes => 2, num_cycles => 2);   -- **
    constant PARAMS_ORA_IND_Y   : opcode_parameters := (num_bytes => 2, num_cycles => 5);   -- * 
    constant PARAMS_ORA_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_ASL_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_CLC_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_ORA_ABS_Y   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_ORA_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_ASL_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 7);

    -- MSB = '2'
    constant PARAMS_JSR_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 6);
    constant PARAMS_AND_X_IND   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_BIT_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_AND_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_ROL_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 5);
    constant PARAMS_PLP_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 4);
    constant PARAMS_AND_NUM     : opcode_parameters := (num_bytes => 2, num_cycles => 2);
    constant PARAMS_ROL_A       : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_BIT_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_AND_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_ROL_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 6);

    -- MSB = '3'
    constant PARAMS_BMI_REL     : opcode_parameters := (num_bytes => 2, num_cycles => 2);   -- **
    constant PARAMS_AND_IND_Y   : opcode_parameters := (num_bytes => 2, num_cycles => 5);   -- * 
    constant PARAMS_AND_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_ROL_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_SEC_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_AND_ABS_Y   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- *
    constant PARAMS_AND_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_ROL_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 7);

    -- MSB = '4'
    constant PARAMS_RTI_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 6);
    constant PARAMS_EOR_X_IND   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_EOR_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_LSR_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 5);
    constant PARAMS_PHA_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 3);
    constant PARAMS_EOR_NUM     : opcode_parameters := (num_bytes => 2, num_cycles => 2);
    constant PARAMS_LSR_A       : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_JMP_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 3);
    constant PARAMS_EOR_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_LSR_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 6);

    -- MSB = '5'
    constant PARAMS_BVC_REL     : opcode_parameters := (num_bytes => 2, num_cycles => 2);   -- **
    constant PARAMS_EOR_IND_Y   : opcode_parameters := (num_bytes => 2, num_cycles => 5);   -- * 
    constant PARAMS_EOR_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_LSR_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_CLI_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_EOR_ABS_Y   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_EOR_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_LSR_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 7);

    -- MSB = '6'
    constant PARAMS_RTS_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 6);
    constant PARAMS_ADC_X_IND   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_ADC_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_ROR_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 5);
    constant PARAMS_PLA_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 4);
    constant PARAMS_ADC_NUM     : opcode_parameters := (num_bytes => 2, num_cycles => 2);
    constant PARAMS_ROR_A       : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_JMP_IND     : opcode_parameters := (num_bytes => 3, num_cycles => 5);
    constant PARAMS_ADC_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_ROR_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 6);

    -- MSB = '7'
    constant PARAMS_BVS_REL     : opcode_parameters := (num_bytes => 2, num_cycles => 2);   -- **
    constant PARAMS_ADC_IND_Y   : opcode_parameters := (num_bytes => 2, num_cycles => 5);   -- * 
    constant PARAMS_ADC_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_ROR_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_SEI_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_ADC_ABS_Y   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_ADC_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_ROR_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 7);

    -- MSB = '8'
    constant PARAMS_STA_X_IND   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_STY_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_STA_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_STX_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_DEY_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_TXA_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_STY_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_STA_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_STX_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);

    -- MSB = '9'
    constant PARAMS_BCC_REL     : opcode_parameters := (num_bytes => 2, num_cycles => 2);   -- **
    constant PARAMS_STA_IND_Y   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_STY_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_STA_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_STX_ZPG_Y   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_TYA_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_STA_ABS_Y   : opcode_parameters := (num_bytes => 3, num_cycles => 5);
    constant PARAMS_TXS_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_STA_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 5);

    -- MSB = 'A'
    constant PARAMS_LDY_NUM     : opcode_parameters := (num_bytes => 2, num_cycles => 2);
    constant PARAMS_LDA_X_IND   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_LDX_NUM     : opcode_parameters := (num_bytes => 2, num_cycles => 2);
    constant PARAMS_LDY_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_LDA_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_LDX_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_TAY_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_LDA_NUM     : opcode_parameters := (num_bytes => 2, num_cycles => 2);
    constant PARAMS_TAX_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_LDY_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_LDA_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);   
    constant PARAMS_LDX_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);

    -- MSB = 'B'
    constant PARAMS_BCS_REL     : opcode_parameters := (num_bytes => 2, num_cycles => 2);   -- **
    constant PARAMS_LDA_IND_Y   : opcode_parameters := (num_bytes => 2, num_cycles => 5);   -- * 
    constant PARAMS_LDY_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_LDA_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_LDX_ZPG_Y   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_CLV_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_LDA_ABS_Y   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_TSX_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_LDY_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_LDA_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_LDX_ABS_Y   : opcode_parameters := (num_bytes => 3, num_cycles => 6);   -- * 

    -- MSB = 'C'
    constant PARAMS_CPY_NUM     : opcode_parameters := (num_bytes => 2, num_cycles => 2);
    constant PARAMS_CMP_X_IND   : opcode_parameters := (num_bytes => 2, num_cycles => 5);
    constant PARAMS_CPY_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_CMP_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_DEC_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_INY_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_CMP_NUM     : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_DEX_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_CPY_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_CMP_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_DEC_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 6);

    -- MSB = 'D'
    constant PARAMS_BNE_REL     : opcode_parameters := (num_bytes => 2, num_cycles => 2);   -- **
    constant PARAMS_CMP_IND_Y   : opcode_parameters := (num_bytes => 2, num_cycles => 5);   -- * 
    constant PARAMS_CMP_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_DEC_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_CLD_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_CMP_ABS_Y   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- *
    constant PARAMS_CMP_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_DEC_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 7);

    -- MSB = 'E'
    constant PARAMS_CPX_NUM     : opcode_parameters := (num_bytes => 2, num_cycles => 2);
    constant PARAMS_SBC_X_IND   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_CPX_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_SBC_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 3);
    constant PARAMS_INC_ZPG     : opcode_parameters := (num_bytes => 2, num_cycles => 5);
    constant PARAMS_INX_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_SBC_NUM     : opcode_parameters := (num_bytes => 2, num_cycles => 2);
    constant PARAMS_NOP_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_CPX_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_SBC_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 4);
    constant PARAMS_INC_ABS     : opcode_parameters := (num_bytes => 3, num_cycles => 6);

    -- MSB = 'F'
    constant PARAMS_BEQ_REL     : opcode_parameters := (num_bytes => 2, num_cycles => 2);   -- **
    constant PARAMS_SBC_IND_Y   : opcode_parameters := (num_bytes => 2, num_cycles => 5);   -- * 
    constant PARAMS_SBC_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 4);
    constant PARAMS_INC_ZPG_X   : opcode_parameters := (num_bytes => 2, num_cycles => 6);
    constant PARAMS_SED_IMPL    : opcode_parameters := (num_bytes => 1, num_cycles => 2);
    constant PARAMS_SBC_ABS_Y   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_SBC_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 4);   -- * 
    constant PARAMS_INC_ABS_X   : opcode_parameters := (num_bytes => 3, num_cycles => 7);








    --------------------------------------------------------------------------------------------
    -- Enabled Opcodes for 6502 ----------------------------------------------------------------
    --------------------------------------------------------------------------------------------
    type enabled_opcode_table is array(0 to 255) of boolean;

    constant opcodes_enabled    : enabled_opcode_table := 

    --       '0'     '1'     '2'     '3'     '4'     '5'     '6'     '7'     '8'     '9'     'A'     'B'     'C'     'D'     'E'     'F'
           (false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- '0' 
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- '1'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- '2'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- '3'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- '4'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- '5'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- '6'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- '7'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- '8'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- '9'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- 'A'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- 'B'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- 'C'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- 'D'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  -- 'E'
            false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false,  false); -- 'F'

    











    ------------------------------------------------------------------------------------------
    -- Opcode Functions ----------------------------------------------------------------------
    ------------------------------------------------------------------------------------------
    function find_opcode_parameters(input : byte; isOpcodeEnabledActive : boolean := true) return opcode_parameters;





end jm6502_opcodes_package; 


package body jm6502_opcodes_package is 


    function find_opcode_parameters(input : byte; isOpcodeEnabledActive : boolean := true) return opcode_parameters is 
        constant opcode_in  : opcode := opcode(input);
        variable output     : opcode_parameters;
    begin 

        if opcodes_enabled(to_integer(input)) and isOpcodeEnabledActive then 

            case opcode_in is 

                -- MSB '0'
                when OPCODE_BRK_IMPL    => output := PARAMS_BRK_IMPL;
                when OPCODE_ORA_X_IND   => output := PARAMS_ORA_X_IND;
                when OPCODE_ORA_ZPG     => output := PARAMS_ORA_ZPG;
                when OPCODE_ASL_ZPG     => output := PARAMS_ASL_ZPG;
                when OPCODE_PHP_IMPL    => output := PARAMS_PHP_IMPL;
                when OPCODE_ORA_NUM     => output := PARAMS_ORA_NUM;
                when OPCODE_ASL_A       => output := PARAMS_ASL_A;
                when OPCODE_ORA_ABS     => output := PARAMS_ORA_ABS;
                when OPCODE_ASL_ABS     => output := PARAMS_ASL_ABS;


                -- MSB '1'
                when OPCODE_BPL_REL    => output := PARAMS_BPL_REL;
                when OPCODE_ORA_IND_Y  => output := PARAMS_ORA_IND_Y;
                when OPCODE_ORA_ZPG_X  => output := PARAMS_ORA_ZPG_X;
                when OPCODE_ASL_ZPG_X  => output := PARAMS_ASL_ZPG_X;
                when OPCODE_CLC_IMPL   => output := PARAMS_CLC_IMPL;
                when OPCODE_ORA_ABS_Y  => output := PARAMS_ORA_ABS_Y;
                when OPCODE_ORA_ABS_X  => output := PARAMS_ORA_ABS_X;
                when OPCODE_ASL_ABS_X  => output := PARAMS_ASL_ABS_X;


                -- MSB '2'
                when OPCODE_JSR_ABS    => output := PARAMS_JSR_ABS; 
                when OPCODE_AND_X_IND  => output := PARAMS_AND_X_IND; 
                when OPCODE_BIT_ZPG    => output := PARAMS_BIT_ZPG; 
                when OPCODE_AND_ZPG    => output := PARAMS_AND_ZPG; 
                when OPCODE_ROL_ZPG    => output := PARAMS_ROL_ZPG; 
                when OPCODE_PLP_IMPL   => output := PARAMS_PLP_IMPL; 
                when OPCODE_AND_NUM    => output := PARAMS_AND_NUM; 
                when OPCODE_ROL_A      => output := PARAMS_ROL_A; 
                when OPCODE_BIT_ABS    => output := PARAMS_BIT_ABS; 
                when OPCODE_AND_ABS    => output := PARAMS_AND_ABS; 
                when OPCODE_ROL_ABS    => output := PARAMS_ROL_ABS; 


                -- MSB '3'
                when OPCODE_BMI_REL    => output := PARAMS_BMI_REL; 
                when OPCODE_AND_IND_Y  => output := PARAMS_AND_IND_Y; 
                when OPCODE_AND_ZPG_X  => output := PARAMS_AND_ZPG_X; 
                when OPCODE_ROL_ZPG_X  => output := PARAMS_ROL_ZPG_X; 
                when OPCODE_SEC_IMPL   => output := PARAMS_SEC_IMPL; 
                when OPCODE_AND_ABS_Y  => output := PARAMS_AND_ABS_Y; 
                when OPCODE_AND_ABS_X  => output := PARAMS_AND_ABS_X; 
                when OPCODE_ROL_ABS_X  => output := PARAMS_ROL_ABS_X; 


                -- MSB '4'
                when OPCODE_RTI_IMPL   => output := PARAMS_RTI_IMPL; 
                when OPCODE_EOR_X_IND  => output := PARAMS_EOR_X_IND; 
                when OPCODE_EOR_ZPG    => output := PARAMS_EOR_ZPG; 
                when OPCODE_LSR_ZPG    => output := PARAMS_LSR_ZPG; 
                when OPCODE_PHA_IMPL   => output := PARAMS_PHA_IMPL; 
                when OPCODE_EOR_NUM    => output := PARAMS_EOR_NUM; 
                when OPCODE_LSR_A      => output := PARAMS_LSR_A; 
                when OPCODE_JMP_ABS    => output := PARAMS_JMP_ABS; 
                when OPCODE_EOR_ABS    => output := PARAMS_EOR_ABS; 
                when OPCODE_LSR_ABS    => output := PARAMS_LSR_ABS; 


                -- MSB '5'
                when OPCODE_BVC_REL    => output := PARAMS_BVC_REL; 
                when OPCODE_EOR_IND_Y  => output := PARAMS_EOR_IND_Y; 
                when OPCODE_EOR_ZPG_X  => output := PARAMS_EOR_ZPG_X; 
                when OPCODE_LSR_ZPG_X  => output := PARAMS_LSR_ZPG_X; 
                when OPCODE_CLI_IMPL   => output := PARAMS_CLI_IMPL; 
                when OPCODE_EOR_ABS_Y  => output := PARAMS_EOR_ABS_Y; 
                when OPCODE_EOR_ABS_X  => output := PARAMS_EOR_ABS_X; 
                when OPCODE_LSR_ABS_X  => output := PARAMS_LSR_ABS_X; 


                -- MSB '6'
                when OPCODE_RTS_IMPL   => output := PARAMS_RTS_IMPL; 
                when OPCODE_ADC_X_IND  => output := PARAMS_ADC_X_IND; 
                when OPCODE_ADC_ZPG    => output := PARAMS_ADC_ZPG; 
                when OPCODE_ROR_ZPG    => output := PARAMS_ROR_ZPG; 
                when OPCODE_PLA_IMPL   => output := PARAMS_PLA_IMPL; 
                when OPCODE_ADC_NUM    => output := PARAMS_ADC_NUM; 
                when OPCODE_ROR_A      => output := PARAMS_ROR_A; 
                when OPCODE_JMP_IND    => output := PARAMS_JMP_IND; 
                when OPCODE_ADC_ABS    => output := PARAMS_ADC_ABS; 
                when OPCODE_ROR_ABS    => output := PARAMS_ROR_ABS; 


                -- MSB '7'
                when OPCODE_BVS_REL    => output := PARAMS_BVS_REL; 
                when OPCODE_ADC_IND_Y  => output := PARAMS_ADC_IND_Y; 
                when OPCODE_ADC_ZPG_X  => output := PARAMS_ADC_ZPG_X; 
                when OPCODE_ROR_ZPG_X  => output := PARAMS_ROR_ZPG_X; 
                when OPCODE_SEI_IMPL   => output := PARAMS_SEI_IMPL; 
                when OPCODE_ADC_ABS_Y  => output := PARAMS_ADC_ABS_Y; 
                when OPCODE_ADC_ABS_X  => output := PARAMS_ADC_ABS_X; 
                when OPCODE_ROR_ABS_X  => output := PARAMS_ROR_ABS_X; 


                -- MSB '8'
                when OPCODE_STA_X_IND  => output := PARAMS_STA_X_IND; 
                when OPCODE_STY_ZPG    => output := PARAMS_STY_ZPG; 
                when OPCODE_STA_ZPG    => output := PARAMS_STA_ZPG; 
                when OPCODE_STX_ZPG    => output := PARAMS_STX_ZPG; 
                when OPCODE_DEY_IMPL   => output := PARAMS_DEY_IMPL; 
                when OPCODE_TXA_IMPL   => output := PARAMS_TXA_IMPL; 
                when OPCODE_STY_ABS    => output := PARAMS_STY_ABS; 
                when OPCODE_STA_ABS    => output := PARAMS_STA_ABS; 
                when OPCODE_STX_ABS    => output := PARAMS_STX_ABS; 


                -- MSB '9'
                when OPCODE_BCC_REL    => output := PARAMS_BCC_REL; 
                when OPCODE_STA_IND_Y  => output := PARAMS_STA_IND_Y; 
                when OPCODE_STY_ZPG_X  => output := PARAMS_STY_ZPG_X; 
                when OPCODE_STA_ZPG_X  => output := PARAMS_STA_ZPG_X; 
                when OPCODE_STX_ZPG_Y  => output := PARAMS_STX_ZPG_Y; 
                when OPCODE_TYA_IMPL   => output := PARAMS_TYA_IMPL; 
                when OPCODE_STA_ABS_Y  => output := PARAMS_STA_ABS_Y; 
                when OPCODE_TXS_IMPL   => output := PARAMS_TXS_IMPL; 
                when OPCODE_STA_ABS_X  => output := PARAMS_STA_ABS_X; 


                -- MSB 'A'
                when OPCODE_LDY_NUM    => output := PARAMS_LDY_NUM; 
                when OPCODE_LDA_X_IND  => output := PARAMS_LDA_X_IND; 
                when OPCODE_LDX_NUM    => output := PARAMS_LDX_NUM; 
                when OPCODE_LDY_ZPG    => output := PARAMS_LDY_ZPG; 
                when OPCODE_LDA_ZPG    => output := PARAMS_LDA_ZPG; 
                when OPCODE_LDX_ZPG    => output := PARAMS_LDX_ZPG; 
                when OPCODE_TAY_IMPL   => output := PARAMS_TAY_IMPL; 
                when OPCODE_LDA_NUM    => output := PARAMS_LDA_NUM; 
                when OPCODE_TAX_IMPL   => output := PARAMS_TAX_IMPL; 
                when OPCODE_LDY_ABS    => output := PARAMS_LDY_ABS; 
                when OPCODE_LDA_ABS    => output := PARAMS_LDA_ABS; 
                when OPCODE_LDX_ABS    => output := PARAMS_LDX_ABS; 


                -- MSB 'B'
                when OPCODE_BCS_REL    => output := PARAMS_BCS_REL; 
                when OPCODE_LDA_IND_Y  => output := PARAMS_LDA_IND_Y; 
                when OPCODE_LDY_ZPG_X  => output := PARAMS_LDY_ZPG_X; 
                when OPCODE_LDA_ZPG_X  => output := PARAMS_LDA_ZPG_X; 
                when OPCODE_LDX_ZPG_Y  => output := PARAMS_LDX_ZPG_Y; 
                when OPCODE_CLV_IMPL   => output := PARAMS_CLV_IMPL; 
                when OPCODE_LDA_ABS_Y  => output := PARAMS_LDA_ABS_Y; 
                when OPCODE_TSX_IMPL   => output := PARAMS_TSX_IMPL; 
                when OPCODE_LDY_ABS_X  => output := PARAMS_LDY_ABS_X; 
                when OPCODE_LDA_ABS_X  => output := PARAMS_LDA_ABS_X; 
                when OPCODE_LDX_ABS_Y  => output := PARAMS_LDX_ABS_Y; 


                -- MSB 'C'
                when OPCODE_CPY_NUM    => output := PARAMS_CPY_NUM; 
                when OPCODE_CMP_X_IND  => output := PARAMS_CMP_X_IND; 
                when OPCODE_CPY_ZPG    => output := PARAMS_CPY_ZPG; 
                when OPCODE_CMP_ZPG    => output := PARAMS_CMP_ZPG; 
                when OPCODE_DEC_ZPG    => output := PARAMS_DEC_ZPG; 
                when OPCODE_INY_IMPL   => output := PARAMS_INY_IMPL; 
                when OPCODE_CMP_NUM    => output := PARAMS_CMP_NUM; 
                when OPCODE_DEX_IMPL   => output := PARAMS_DEX_IMPL; 
                when OPCODE_CPY_ABS    => output := PARAMS_CPY_ABS; 
                when OPCODE_CMP_ABS    => output := PARAMS_CMP_ABS; 
                when OPCODE_DEC_ABS    => output := PARAMS_DEC_ABS; 


                -- MSB 'D'
                when OPCODE_BNE_REL    => output := PARAMS_BNE_REL; 
                when OPCODE_CMP_IND_Y  => output := PARAMS_CMP_IND_Y; 
                when OPCODE_CMP_ZPG_X  => output := PARAMS_CMP_ZPG_X; 
                when OPCODE_DEC_ZPG_X  => output := PARAMS_DEC_ZPG_X; 
                when OPCODE_CLD_IMPL   => output := PARAMS_CLD_IMPL; 
                when OPCODE_CMP_ABS_Y  => output := PARAMS_CMP_ABS_Y; 
                when OPCODE_CMP_ABS_X  => output := PARAMS_CMP_ABS_X; 
                when OPCODE_DEC_ABS_X  => output := PARAMS_DEC_ABS_X; 


                -- MSB 'E'
                when OPCODE_CPX_NUM    => output := PARAMS_CPX_NUM; 
                when OPCODE_SBC_X_IND  => output := PARAMS_SBC_X_IND; 
                when OPCODE_CPX_ZPG    => output := PARAMS_CPX_ZPG; 
                when OPCODE_SBC_ZPG    => output := PARAMS_SBC_ZPG; 
                when OPCODE_INC_ZPG    => output := PARAMS_INC_ZPG; 
                when OPCODE_INX_IMPL   => output := PARAMS_INX_IMPL; 
                when OPCODE_SBC_NUM    => output := PARAMS_SBC_NUM; 
                when OPCODE_NOP_IMPL   => output := PARAMS_NOP_IMPL; 
                when OPCODE_CPX_ABS    => output := PARAMS_CPX_ABS; 
                when OPCODE_SBC_ABS    => output := PARAMS_SBC_ABS; 
                when OPCODE_INC_ABS    => output := PARAMS_INC_ABS; 


                -- MSB 'F'
                when OPCODE_BEQ_REL    => output := PARAMS_BEQ_REL; 
                when OPCODE_SBC_IND_Y  => output := PARAMS_SBC_IND_Y; 
                when OPCODE_SBC_ZPG_X  => output := PARAMS_SBC_ZPG_X; 
                when OPCODE_INC_ZPG_X  => output := PARAMS_INC_ZPG_X; 
                when OPCODE_SED_IMPL   => output := PARAMS_SED_IMPL; 
                when OPCODE_SBC_ABS_Y  => output := PARAMS_SBC_ABS_Y; 
                when OPCODE_SBC_ABS_X  => output := PARAMS_SBC_ABS_X; 
                when OPCODE_INC_ABS_X  => output := PARAMS_INC_ABS_X; 


                -- Default: Error Code
                when others             => output := (num_bytes => -1, num_cycles => -1);


            end case;
        
        else 
            -- Default: Error Code
            output := ( num_bytes => -1, num_cycles => -1 );

        end if;

        return output;

    end find_opcode_parameters;










end jm6502_opcodes_package;