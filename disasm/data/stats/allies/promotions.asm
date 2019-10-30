
; ASM FILE data\stats\allies\promotions.asm :
; 0x21046..0x21072 : Promotions
Promotions:     ; promotionSection enum Classes : CLASS_*
; promotionItems   enum Items : ITEM_*
    
                promotionSection &      ; Regular base classes
                    SDMN, KNTE, WARR, MAGE, PRST, ACHR, BDMN, WFMN, RNGR, PHNK, THIF, TORT
                    
                promotionSection &      ; Regular promoted classes
                    HERO, PLDN, GLDT, WIZ, VICR, SNIP, BDBT, WFBR, BWNT, PHNX, NINJ, MNST
                    
                promotionSection &      ; Special base classes
                    KNTE, WARR, MAGE, PRST, ACHR
                    
                promotionSection &      ; Special promoted classes
                    PGNT, BRN, SORC, MMNK, BRGN
                    
                promotionItems &        ; Special promotion items
                    PEGASUS_WING, WARRIORS_PRIDE, SECRET_BOOK, VIGOR_BALL, SILVER_TANK
