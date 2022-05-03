

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
when OPCODE_PHA_IMPL   => output := PARAMS_PHA_IMP; 
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