
; ASM FILE data\stats\allies\classes\classdefs.asm :
; 0x1EE890..0x1EE930 : Class definitions
tbl_ClassDefs:  
; Syntax        mov        0-255 (game slows down at around 15)
;               resistance [RESISTANCE_]bitfield
;               moveType   [MOVETYPE_UPPER_]enum (or index)
;               prowess    [PROWESS_]bitfield
                
                mov 6                   ; 0: SDMN
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 7                   ; 1: KNTE
                resistance NONE
                moveType   CENTAUR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 5                   ; 2: WARR
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 5                   ; 3: MAGE
                resistance NONE
                moveType   MAGE
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 5                   ; 4: PRST
                resistance NONE
                moveType   HEALER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 5                   ; 5: ACHR
                resistance NONE
                moveType   ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 6: BDMN
                resistance NONE
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 5                   ; 7: WFMN
                resistance NONE
                moveType   STEALTH
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 8: RNGR
                resistance NONE
                moveType   CENTAUR_ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 9: PHNK
                resistance NONE
                moveType   HOVERING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 7                   ; 10: THIF
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN16|COUNTER_1IN32
                    
                mov 5                   ; 11: TORT
                resistance NONE
                moveType   STEALTH
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 12: HERO
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN16|COUNTER_1IN8
                    
                mov 7                   ; 13: PLDN
                resistance NONE
                moveType   CENTAUR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 7                   ; 14: PGNT
                resistance NONE
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; 15: GLDT
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 6                   ; 16: BRN
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; 17: WIZ
                resistance NONE
                moveType   MAGE
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; 18: SORC
                resistance NONE
                moveType   MAGE
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; 19: VICR
                resistance NONE
                moveType   HEALER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; 20: MMNK
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN8
                    
                mov 6                   ; 21: SNIP
                resistance NONE
                moveType   ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; 22: BRGN
                resistance NONE
                moveType   BRASS_GUNNER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 6                   ; 23: BDBT
                resistance NONE
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; 24: WFBR
                resistance NONE
                moveType   STEALTH
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN8
                    
                mov 6                   ; 25: BWNT
                resistance NONE
                moveType   CENTAUR_ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 7                   ; 26: PHNX
                resistance FIRE_MAJOR|STATUS_MAJOR
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 7                   ; 27: NINJ
                resistance NONE
                moveType   STEALTH
                prowess    CRITICAL150_1IN8|DOUBLE_1IN16|COUNTER_1IN8
                    
                mov 7                   ; 28: MNST
                resistance NEUTRAL_MAJOR|UNDEFINED1_MAJOR|UNDEFINED2_MAJOR|STATUS_MAJOR
                moveType   HOVERING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 4                   ; 29: RBT
                resistance NEUTRAL_MINOR|STATUS_MINOR
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 4                   ; 30: GLM
                resistance FIRE_MAJOR|NEUTRAL_MINOR|UNDEFINED1_MINOR|UNDEFINED2_MINOR|STATUS_MINOR
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 6                   ; 31: RDBN
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN8
                    
