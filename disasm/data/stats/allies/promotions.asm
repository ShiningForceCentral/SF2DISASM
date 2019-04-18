
; ASM FILE data\stats\allies\promotions.asm :
; 0x21046..0x21072 : Promotions
Promotions:     promotionSection &      ; Regular base classes
                    CLASS_SDMN, &
                    CLASS_KNTE, &
                    CLASS_WARR, &
                    CLASS_MAGE, &
                    CLASS_PRST, &
                    CLASS_ACHR, &
                    CLASS_BDMN, &
                    CLASS_WFMN, &
                    CLASS_RNGR, &
                    CLASS_PHNK, &
                    CLASS_THIF, &
                    CLASS_TORT
                    
                promotionSection &      ; Regular promoted classes
                    CLASS_HERO, &
                    CLASS_PLDN, &
                    CLASS_GLDT, &
                    CLASS_WIZ, &
                    CLASS_VICR, &
                    CLASS_SNIP, &
                    CLASS_BDBT, &
                    CLASS_WFBR, &
                    CLASS_BWNT, &
                    CLASS_PHNX, &
                    CLASS_NINJ, &
                    CLASS_MNST
                    
                promotionSection &      ; Special base classes
                    CLASS_KNTE, &
                    CLASS_WARR, &
                    CLASS_MAGE, &
                    CLASS_PRST, &
                    CLASS_ACHR
                    
                promotionSection &      ; Special promoted classes
                    CLASS_PGNT, &
                    CLASS_BRN, &
                    CLASS_SORC, &
                    CLASS_MMNK, &
                    CLASS_BRGN
                    
                promotionSection &      ; Special promotion items
                    ITEM_PEGASUS_WING, &
                    ITEM_WARRIORS_PRIDE, &
                    ITEM_SECRET_BOOK, &
                    ITEM_VIGOR_BALL, &
                    ITEM_SILVER_TANK
                    
