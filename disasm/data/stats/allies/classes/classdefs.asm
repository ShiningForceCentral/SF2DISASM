
; ASM FILE data\stats\allies\classes\classdefs.asm :
; 0x1EE890..0x1EE930 : Class definitions
tbl_ClassDefs:  
; Syntax        mov        0-255 (game slows down at around 15)
;               resistance [RESISTANCE_]bitfield
;               moveType   [MOVETYPE_UPPER_]enum (or index)
;               prowess    [PROWESS_]bitfield
                
                mov 6                   ; 0: SDMN
                resistance 0
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 7                   ; 1: KNTE
                resistance 0
                moveType   CENTAUR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 5                   ; 2: WARR
                resistance 0
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 5                   ; 3: MAGE
                resistance 0
                moveType   MAGE
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 5                   ; 4: PRST
                resistance 0
                moveType   HEALER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 5                   ; 5: ACHR
                resistance 0
                moveType   ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 6                   ; 6: BDMN
                resistance 0
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 5                   ; 7: WFMN
                resistance 0
                moveType   STEALTH
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 6                   ; 8: RNGR
                resistance 0
                moveType   CENTAUR_ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 6                   ; 9: PHNK
                resistance 0
                moveType   HOVERING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 7                   ; 10: THIF
                resistance 0
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN16|COUNTER_1IN32
                
                mov 5                   ; 11: TORT
                resistance 0
                moveType   STEALTH
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 6                   ; 12: HERO
                resistance 0
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN16|COUNTER_1IN8
                
                mov 7                   ; 13: PLDN
                resistance 0
                moveType   CENTAUR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 7                   ; 14: PGNT
                resistance 0
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 15: GLDT
                resistance 0
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 6                   ; 16: BRN
                resistance 0
                moveType   REGULAR
                prowess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 17: WIZ
                resistance 0
                moveType   MAGE
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 18: SORC
                resistance 0
                moveType   MAGE
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 19: VICR
                resistance 0
                moveType   HEALER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 20: MMNK
                resistance 0
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN8
                
                mov 6                   ; 21: SNIP
                resistance 0
                moveType   ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 22: BRGN
                resistance 0
                moveType   BRASS_GUNNER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 6                   ; 23: BDBT
                resistance 0
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 24: WFBR
                resistance 0
                moveType   STEALTH
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN8
                
                mov 6                   ; 25: BWNT
                resistance 0
                moveType   CENTAUR_ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 7                   ; 26: PHNX
                resistance FIRE_MAJOR|STATUS_MAJOR
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 7                   ; 27: NINJ
                resistance 0
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
                resistance 0
                moveType   REGULAR
                prowess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN8
                
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                    
                mov 6                   ; 32: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 33: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 34: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 35: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 36: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 37: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 38: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 39: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 40: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 41: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 42: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 43: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 44: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 45: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 46: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 47: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 48: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 49: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 50: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 51: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 52: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 53: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 54: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 55: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 56: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 57: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 58: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 59: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 60: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 61: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 62: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 63: 
                resistance NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                
            endif
                
