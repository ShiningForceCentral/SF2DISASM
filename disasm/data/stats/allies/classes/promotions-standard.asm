
; ASM FILE data\stats\allies\promotions-standard.asm :
; Promotions
tbl_Promotions: 
; Syntax        promotionSection [CLASS_]enum,..[CLASS_]enum
                
                promotionSection &      ; Regular base classes
                    SDMN, KNTE, WARR, MAGE, PRST, ACHR, BDMN, WFMN, RNGR, PHNK, THIF, TORT
                
                promotionSection &      ; Regular promoted classes
                    HERO, PLDN, GLDT, WIZ, VICR, SNIP, BDBT, WFBR, BWNT, PHNX, NINJ, MNST
                
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
