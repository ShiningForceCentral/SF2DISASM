
; ASM FILE data\stats\allies\allystartdefs.asm :
; 0x1EE7D0..0x1EE890 : Ally start definitions
table_AllyStartDefinitions:
                
; Syntax        startClass [CLASS_]enum
;               startLevel 1-255
;               startItems &
;                   [ITEM_]enum[|EQUIPPED], &
;                   [ITEM_]enum[|EQUIPPED], &
;                   [ITEM_]enum[|EQUIPPED], &
;                   [ITEM_]enum[|EQUIPPED]
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                startClass SDMN         ; 0: BOWIE
                startLevel 1
                startItems &
                    WOODEN_SWORD|EQUIPPED, &
                    MEDICAL_HERB, &
                    NOTHING, &
                    NOTHING
                
                startClass PRST         ; 1: SARAH
                startLevel 1
                startItems &
                    WOODEN_ROD|EQUIPPED, &
                    MEDICAL_HERB, &
                    MEDICAL_HERB, &
                    NOTHING
                
                startClass KNTE         ; 2: CHESTER
                startLevel 1
                startItems &
                    WOODEN_STICK|EQUIPPED, &
                    MEDICAL_HERB, &
                    NOTHING, &
                    NOTHING
                
                startClass WARR         ; 3: JAHA
                startLevel 1
                startItems &
                    SHORT_AXE|EQUIPPED, &
                    MEDICAL_HERB, &
                    NOTHING, &
                    NOTHING
                
                startClass MAGE         ; 4: KAZIN
                startLevel 4
                startItems &
                    WOODEN_ROD|EQUIPPED, &
                    MEDICAL_HERB, &
                    NOTHING, &
                    NOTHING
                
                startClass THIF         ; 5: SLADE
                startLevel 5
                startItems &
                    SHORT_KNIFE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass TORT         ; 6: KIWI
                startLevel 7
                startItems &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass PHNK         ; 7: PETER
                startLevel 9
                startItems &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass RNGR         ; 8: MAY
                startLevel 10
                startItems &
                    WOODEN_ARROW|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass WFMN         ; 9: GERHALT
                startLevel 13
                startItems &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass BDMN         ; 10: LUKE
                startLevel 14
                startItems &
                    MIDDLE_SWORD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass BRGN         ; 11: ROHDE
                startLevel 4
                startItems &
                    ASSAULT_SHELL|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass KNTE         ; 12: RICK
                startLevel 19
                startItems &
                    STEEL_LANCE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass ACHR         ; 13: ELRIC
                startLevel 21
                startItems &
                    STEEL_ARROW|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass KNTE         ; 14: ERIC
                startLevel 24
                startItems &
                    STEEL_LANCE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass PRST         ; 15: KARNA
                startLevel 24
                startItems &
                    POWER_STICK|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass WARR         ; 16: RANDOLF
                startLevel 24
                startItems &
                    POWER_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass MAGE         ; 17: TYRIN
                startLevel 24
                startItems &
                    POWER_STICK|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass ACHR         ; 18: JANET
                startLevel 24
                startItems &
                    STEEL_ARROW|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass PLDN         ; 19: HIGINS
                startLevel 7
                startItems &
                    JAVELIN|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass BDBT         ; 20: SKREECH
                startLevel 11
                startItems &
                    GREAT_SWORD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass SORC         ; 21: TAYA
                startLevel 11
                startItems &
                    INDRA_STAFF|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass VICR         ; 22: FRAYJA
                startLevel 13
                startItems &
                    INDRA_STAFF|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass PGNT         ; 23: JARO
                startLevel 12
                startItems &
                    CHROME_LANCE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass GLDT         ; 24: GYAN
                startLevel 14
                startItems &
                    GREAT_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass MMNK         ; 25: SHEELA
                startLevel 15
                startItems &
                    BRASS_KNUCKLES|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass RBT          ; 26: ZYNK
                startLevel 16
                startItems &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass WIZ          ; 27: CHAZ
                startLevel 19
                startItems &
                    MAGE_STAFF|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass RDBN         ; 28: LEMON
                startLevel 19
                startItems &
                    DARK_SWORD, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass GLM          ; 29: CLAUDE
                startLevel 14
                startItems &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass RDBN
                startLevel 1
                startItems &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
                startClass RDBN
                startLevel 1
                startItems &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                
