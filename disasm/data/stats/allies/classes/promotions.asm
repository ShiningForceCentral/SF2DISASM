
; ASM FILE data\stats\allies\classes\promotions.asm :
; 0x21046..0x21072 : Promotions
tbl_Promotions: 
; Syntax        promotionSection [CLASS_]enum,..[CLASS_]enum
;               promotionItems   [ITEM_]enum,..[ITEM_]enum
;
; Notes: 4 promotion sections and 1 promotion items list are required.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                promotionSection &      ; Regular base classes
                    SDMN, KNTE, WARR, MAGE, PRST, ACHR, BDMN, WFMN, RNGR, PHNK, THIF, TORT
                
                promotionSection &      ; Regular promoted classes
                    HERO, PLDN, GLDT, WIZ, VICR, SNIP, BDBT, WFBR, BWNT, PHNX, NINJ, MNST
                
            if (STANDARD_BUILD&EXPANDED_CLASSES=0)
            
                promotionSection &      ; Special base classes
                    KNTE, WARR, MAGE, PRST, ACHR
                
                promotionSection &      ; Special promoted classes
                    PGNT, BRN, SORC, MMNK, BRGN
                
                promotionItems &        ; Special promotion items
                    PEGASUS_WING, WARRIORS_PRIDE, SECRET_BOOK, VIGOR_BALL, SILVER_TANK
                
            else
                
                promotionSection &      ; Vigor Ball base classes
                    PRST
                
                promotionSection &      ; Vigor Ball promoted classes
                    MMNK
                
                promotionSection &      ; Pegasus Wing base classes
                    KNTE
                
                promotionSection &      ; Pegasus Wing promoted classes
                    PGNT
                
                promotionSection &      ; Warrior Pride base classes
                    WARR
                
                promotionSection &      ; Warrior Pride promoted classes
                    BRN
                
                promotionSection &      ; Secret Book base classes
                    MAGE
                
                promotionSection &      ; Secret Book promoted classes
                    SORC
                
                promotionSection &      ; Silver Tank base classes
                    ACHR
                
                promotionSection &      ; Silver Tank promoted classes
                    BRGN
                
            endif
