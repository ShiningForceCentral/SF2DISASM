
; ASM FILE data\stats\allies\allymapsprites-standard.asm :
;
; Works in tandem with class types table located in data\stats\allies\classes\classtypes.asm

table_AllyMapsprites:

; 3 bytes per ally, one for each class type (base, promo, special)
;
; Syntax        mapsprite [MAPSPRITE_]enum (or index)
                
; 0: Bowie
                mapsprite BOWIE_BASE
                mapsprite BOWIE_PROMO
                mapsprite DEFAULT
                
; 1: Sarah
                mapsprite SARAH_BASE
                mapsprite SARAH_PROMO
                mapsprite SARAH_SPECIAL
                
; 2: Chester
                mapsprite CHESTER_BASE
                mapsprite CHESTER_PROMO
                mapsprite CHESTER_SPECIAL
                
; 3: Jaha
                mapsprite JAHA_BASE
                mapsprite JAHA_PROMO
                mapsprite JAHA_SPECIAL
                
; 4: Kazin
                mapsprite KAZIN_BASE
                mapsprite KAZIN_PROMO
                mapsprite KAZIN_SPECIAL
                
; 5: Slade
                mapsprite SLADE_BASE
                mapsprite SLADE_PROMO
                mapsprite DEFAULT
                
; 6: Kiwi
                mapsprite KIWI_BASE
                mapsprite KIWI_PROMO
                mapsprite DEFAULT
                
; 7: Peter
                mapsprite PETER_BASE
                mapsprite PETER_PROMO
                mapsprite DEFAULT
                
; 8: May
                mapsprite MAY_BASE
                mapsprite MAY_PROMO
                mapsprite DEFAULT
                
; 9: Gerhalt
                mapsprite GERHALT_BASE
                mapsprite GERHALT_PROMO
                mapsprite DEFAULT
                
; 10: Luke
                mapsprite LUKE_BASE
                mapsprite LUKE_PROMO
                mapsprite DEFAULT
                
; 11: Rohde
                mapsprite DEFAULT
                mapsprite DEFAULT
                mapsprite ROHDE_SPECIAL
                
; 12: Rick
                mapsprite RICK_BASE
                mapsprite RICK_PROMO
                mapsprite RICK_SPECIAL
                
; 13: Elric
                mapsprite ELRIC_BASE
                mapsprite ELRIC_PROMO
                mapsprite ELRIC_SPECIAL
                
; 14: Eric
                mapsprite ERIC_BASE
                mapsprite ERIC_PROMO
                mapsprite ERIC_SPECIAL
                
; 15: Karna
                mapsprite KARNA_BASE
                mapsprite KARNA_PROMO
                mapsprite KARNA_SPECIAL
                
; 16: Randolf
                mapsprite RANDOLF_BASE
                mapsprite RANDOLF_PROMO
                mapsprite RANDOLF_SPECIAL
                
; 17: Tyrin
                mapsprite TYRIN_BASE
                mapsprite TYRIN_PROMO
                mapsprite TYRIN_SPECIAL
                
; 18: Janet
                mapsprite JANET_BASE
                mapsprite JANET_PROMO
                mapsprite JANET_SPECIAL
                
; 19: Higins
                mapsprite DEFAULT
                mapsprite HIGINS_PROMO
                mapsprite DEFAULT
                
; 20: Skreech
                mapsprite DEFAULT
                mapsprite SKREECH_PROMO
                mapsprite DEFAULT
                
; 21: Taya
                mapsprite DEFAULT
                mapsprite DEFAULT
                mapsprite TAYA_SPECIAL
                
; 22: Frayja
                mapsprite DEFAULT
                mapsprite FRAYJA_PROMO
                mapsprite DEFAULT
                
; 23: Jaro
                mapsprite DEFAULT
                mapsprite DEFAULT
                mapsprite JARO_SPECIAL
                
; 24: Gyan
                mapsprite DEFAULT
                mapsprite GYAN_PROMO
                mapsprite DEFAULT
                
; 25: Sheela
                mapsprite DEFAULT
                mapsprite DEFAULT
                mapsprite SHEELA_SPECIAL
                
; 26: Zynk
                mapsprite DEFAULT
                mapsprite ZYNK_PROMO
                mapsprite DEFAULT
                
; 27: Chaz
                mapsprite DEFAULT
                mapsprite CHAZ_PROMO
                mapsprite DEFAULT
                
; 28: Lemon
                mapsprite DEFAULT
                mapsprite DEFAULT
                mapsprite LEMON_SPECIAL
                
; 29: Claude
                mapsprite DEFAULT
                mapsprite CLAUDE_PROMO
                mapsprite DEFAULT
                
            if (EXPANDED_FORCE_MEMBERS=1)
; 30: 
                mapsprite DEFAULT
                mapsprite DEFAULT
                mapsprite DEFAULT
                
; 31: 
                mapsprite DEFAULT
                mapsprite DEFAULT
                mapsprite DEFAULT
                
            endif


; Allies who use a different mapsprite before joining the Force. Entries are word-sized to accommodate expanded mapsrites.
table_AllyMapspritesIfNotJoined:
                
                dc.w ALLY_ROHDE, MAPSPRITE_NPC_ROHDE
                
                tableEnd
