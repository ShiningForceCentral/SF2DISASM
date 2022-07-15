
; ASM FILE data\stats\allies\classes\blacksmitheligibleclasses.asm :
; 0x21EB6..0x21ED6 : Blacksmith eligible classes list
tbl_BlacksmithEligibleClassesList:
                
; List of word-sized class indexes prefixed with length.
;
; Syntax        blacksmithClasses [CLASS_]enum,..[CLASS_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                classes HERO, &
                        PLDN, &
                        PGNT, &
                        GLDT, &
                        BRN, &
                        WIZ, &
                        SORC, &
                        VICR, &
                        MMNK, &
                        SNIP, &
                        BRGN, &
                        BDBT, &
                        BWNT, &
                        NINJ, &
                        RDBN
                
