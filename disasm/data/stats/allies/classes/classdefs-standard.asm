
; ASM FILE data\stats\allies\classes\classdefs.asm :
; 0x1EE890..0x1EE930 : Class definitions
table_ClassDefs:  
; Syntax        mov        0-255 (game slows down at around 15)
;               resistance [RESISTANCE_]bitfield
;               moveType   [MOVETYPE_UPPER_]enum (or index)
;               prowess    [PROWESS_]bitfield
                
                mov 6                   ; 0: SDMN
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 7                   ; 1: KNTE
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   CENTAUR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 5                   ; 2: WARR
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 5                   ; 3: MAGE
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   MAGE
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 5                   ; 4: PRST
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   HEALER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 5                   ; 5: ACHR
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 6                   ; 6: BDMN
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 5                   ; 7: WFMN
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   STEALTH
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 6                   ; 8: RNGR
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   CENTAUR_ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 6                   ; 9: PHNK
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   HOVERING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 7                   ; 10: THIF
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN16|COUNTER_1IN32
                
                mov 5                   ; 11: TORT
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   STEALTH
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                
                mov 6                   ; 12: HERO
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN16|COUNTER_1IN8
                
                mov 7                   ; 13: PLDN
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   CENTAUR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 7                   ; 14: PGNT
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 15: GLDT
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 6                   ; 16: BRN
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 17: WIZ
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   MAGE
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 18: SORC
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   MAGE
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 19: VICR
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   HEALER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 20: MMNK
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN8
                
                mov 6                   ; 21: SNIP
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 22: BRGN
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   BRASS_GUNNER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 6                   ; 23: BDBT
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 5                   ; 24: WFBR
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   STEALTH
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN8
                
                mov 6                   ; 25: BWNT
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   CENTAUR_ARCHER
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 7                   ; 26: PHNX
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_MAJOR|NEUTRAL_NONE|STATUS_MAJOR
                moveType   FLYING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 7                   ; 27: NINJ
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   STEALTH
                prowess    CRITICAL150_1IN8|DOUBLE_1IN16|COUNTER_1IN8
                
                mov 7                   ; 28: MNST
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_MAJOR|STATUS_MAJOR
                moveType   HOVERING
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 4                   ; 29: RBT
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_MINOR|STATUS_MINOR
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 4                   ; 30: GLM
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_MAJOR|NEUTRAL_MINOR|STATUS_MINOR
                moveType   REGULAR
                prowess    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                
                mov 6                   ; 31: RDBN
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN8
                
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                    
                mov 6                   ; 32: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 33: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 34: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 35: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 36: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 37: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 38: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 39: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 40: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 41: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 42: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 43: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 44: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 45: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 46: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 47: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 48: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 49: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 50: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 51: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 52: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 53: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 54: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 55: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 56: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 57: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 58: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 59: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 60: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 61: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 62: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; 63: 
                resistance WIND_NONE|LIGHTNING_NONE|ICE_NONE|FIRE_NONE|NEUTRAL_NONE|STATUS_NONE
                moveType   REGULAR
                prowess    CRITICAL_NONE|DOUBLE_1IN32|COUNTER_1IN32
                
            endif
                
