
; ASM FILE data\stats\allies\allymapsprites-standard.asm :
;
; Works in tandem with class types table located in data\stats\allies\classes\classtypes.asm

tbl_AllyMapSprites:

; 3 bytes per ally, one for each class type (base, promo, special)
;
; Syntax        mapSprite [MAPSPRITE_]enum (or index)
                
; 0: Bowie
                mapSprite BOWIE_BASE
                mapSprite BOWIE_PROMO
                mapSprite DEFAULT
                
; 1: Sarah
                mapSprite SARAH_BASE
                mapSprite SARAH_PROMO
                mapSprite SARAH_SPECIAL
                
; 2: Chester
                mapSprite CHESTER_BASE
                mapSprite CHESTER_PROMO
                mapSprite CHESTER_SPECIAL
                
; 3: Jaha
                mapSprite JAHA_BASE
                mapSprite JAHA_PROMO
                mapSprite JAHA_SPECIAL
                
; 4: Kazin
                mapSprite KAZIN_BASE
                mapSprite KAZIN_PROMO
                mapSprite KAZIN_SPECIAL
                
; 5: Slade
                mapSprite SLADE_BASE
                mapSprite SLADE_PROMO
                mapSprite DEFAULT
                
; 6: Kiwi
                mapSprite KIWI_BASE
                mapSprite KIWI_PROMO
                mapSprite DEFAULT
                
; 7: Peter
                mapSprite PETER_BASE
                mapSprite PETER_PROMO
                mapSprite DEFAULT
                
; 8: May
                mapSprite MAY_BASE
                mapSprite MAY_PROMO
                mapSprite DEFAULT
                
; 9: Gerhalt
                mapSprite GERHALT_BASE
                mapSprite GERHALT_PROMO
                mapSprite DEFAULT
                
; 10: Luke
                mapSprite LUKE_BASE
                mapSprite LUKE_PROMO
                mapSprite DEFAULT
                
; 11: Rohde
                mapSprite DEFAULT
                mapSprite DEFAULT
                mapSprite ROHDE_SPECIAL
                
; 12: Rick
                mapSprite RICK_BASE
                mapSprite RICK_PROMO
                mapSprite RICK_SPECIAL
                
; 13: Elric
                mapSprite ELRIC_BASE
                mapSprite ELRIC_PROMO
                mapSprite ELRIC_SPECIAL
                
; 14: Eric
                mapSprite ERIC_BASE
                mapSprite ERIC_PROMO
                mapSprite ERIC_SPECIAL
                
; 15: Karna
                mapSprite KARNA_BASE
                mapSprite KARNA_PROMO
                mapSprite KARNA_SPECIAL
                
; 16: Randolf
                mapSprite RANDOLF_BASE
                mapSprite RANDOLF_PROMO
                mapSprite RANDOLF_SPECIAL
                
; 17: Tyrin
                mapSprite TYRIN_BASE
                mapSprite TYRIN_PROMO
                mapSprite TYRIN_SPECIAL
                
; 18: Janet
                mapSprite JANET_BASE
                mapSprite JANET_PROMO
                mapSprite JANET_SPECIAL
                
; 19: Higins
                mapSprite DEFAULT
                mapSprite HIGINS_PROMO
                mapSprite DEFAULT
                
; 20: Skreech
                mapSprite DEFAULT
                mapSprite SKREECH_PROMO
                mapSprite DEFAULT
                
; 21: Taya
                mapSprite DEFAULT
                mapSprite DEFAULT
                mapSprite TAYA_SPECIAL
                
; 22: Frayja
                mapSprite DEFAULT
                mapSprite FRAYJA_PROMO
                mapSprite DEFAULT
                
; 23: Jaro
                mapSprite DEFAULT
                mapSprite DEFAULT
                mapSprite JARO_SPECIAL
                
; 24: Gyan
                mapSprite DEFAULT
                mapSprite GYAN_PROMO
                mapSprite DEFAULT
                
; 25: Sheela
                mapSprite DEFAULT
                mapSprite DEFAULT
                mapSprite SHEELA_SPECIAL
                
; 26: Zynk
                mapSprite DEFAULT
                mapSprite ZYNK_PROMO
                mapSprite DEFAULT
                
; 27: Chaz
                mapSprite DEFAULT
                mapSprite CHAZ_PROMO
                mapSprite DEFAULT
                
; 28: Lemon
                mapSprite DEFAULT
                mapSprite DEFAULT
                mapSprite LEMON_SPECIAL
                
; 29: Claude
                mapSprite DEFAULT
                mapSprite CLAUDE_PROMO
                mapSprite DEFAULT
                
                if (EXPANDED_FORCE_MEMBERS=1)
; 30: 
                mapSprite DEFAULT
                mapSprite DEFAULT
                mapSprite DEFAULT
                
; 31: 
                mapSprite DEFAULT
                mapSprite DEFAULT
                mapSprite DEFAULT
                
                endif
