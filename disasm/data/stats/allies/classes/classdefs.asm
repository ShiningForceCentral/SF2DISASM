
; ASM FILE data\stats\allies\classes\classdefs.asm :
; 0x1EE890..0x1EE930 : Class definitions
ClassDefs:      ; resistance enum Resistance : RESISTANCE_*
; moveType   enum MoveTypes : MOVETYPE_*
; prowess    enum Prowess : PROWESS_*
    
                mov 6                   ; SDMN
                resistance NONE
                moveType UPPER_REGULAR
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 7                   ; KNTE
                resistance NONE
                moveType UPPER_CENTAUR
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 5                   ; WARR
                resistance NONE
                moveType UPPER_REGULAR
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 5                   ; MAGE
                resistance NONE
                moveType UPPER_MAGE
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 5                   ; PRST
                resistance NONE
                moveType UPPER_HEALER
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 5                   ; ACHR
                resistance NONE
                moveType UPPER_ARCHER
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; BDMN
                resistance NONE
                moveType UPPER_FLYING
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 5                   ; WFMN
                resistance NONE
                moveType UPPER_STEALTH
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; RNGR
                resistance NONE
                moveType UPPER_CENTAUR_ARCHER
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; PHNK
                resistance NONE
                moveType UPPER_HOVERING
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 7                   ; THIF
                resistance NONE
                moveType UPPER_REGULAR
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN16|COUNTER_1IN32
                    
                mov 5                   ; TORT
                resistance NONE
                moveType UPPER_STEALTH
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN32
                    
                mov 6                   ; HERO
                resistance NONE
                moveType UPPER_REGULAR
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN16|COUNTER_1IN8
                    
                mov 7                   ; PLDN
                resistance NONE
                moveType UPPER_CENTAUR
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 7                   ; PGNT
                resistance NONE
                moveType UPPER_FLYING
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; GLDT
                resistance NONE
                moveType UPPER_REGULAR
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 6                   ; BRN
                resistance NONE
                moveType UPPER_REGULAR
                prowess &
                    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; WIZ
                resistance NONE
                moveType UPPER_MAGE
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; SORC
                resistance NONE
                moveType UPPER_MAGE
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; VICR
                resistance NONE
                moveType UPPER_HEALER
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; MMNK
                resistance NONE
                moveType UPPER_REGULAR
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN8
                    
                mov 6                   ; SNIP
                resistance NONE
                moveType UPPER_ARCHER
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; BRGN
                resistance NONE
                moveType UPPER_BRASS_GUNNER
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 6                   ; BDBT
                resistance NONE
                moveType UPPER_FLYING
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 5                   ; WFBR
                resistance NONE
                moveType UPPER_STEALTH
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN8
                    
                mov 6                   ; BWNT
                resistance NONE
                moveType UPPER_CENTAUR_ARCHER
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 7                   ; PHNX
                resistance &
                    FIRE_MAJOR|STATUS_MAJOR
                moveType UPPER_FLYING
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 7                   ; NINJ
                resistance NONE
                moveType UPPER_STEALTH
                prowess &
                    CRITICAL150_1IN8|DOUBLE_1IN16|COUNTER_1IN8
                    
                mov 7                   ; MNST
                resistance &
                    UNDEFINED1_MAJOR|UNDEFINED2_MAJOR|UNDEFINED3_MAJOR|STATUS_MAJOR
                moveType UPPER_HOVERING
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 4                   ; RBT
                resistance &
                    UNDEFINED1_MINOR|STATUS_MINOR
                moveType UPPER_REGULAR
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 4                   ; GLM
                resistance &
                    FIRE_MAJOR|UNDEFINED1_MINOR|UNDEFINED2_MINOR|UNDEFINED3_MINOR|STATUS_MINOR
                moveType UPPER_REGULAR
                prowess &
                    CRITICAL125_1IN16|DOUBLE_1IN32|COUNTER_1IN16
                    
                mov 6                   ; RDBN
                resistance NONE
                moveType UPPER_REGULAR
                prowess &
                    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN8
                    
