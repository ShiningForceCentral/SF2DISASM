
; ASM FILE data\stats\allies\allydialogproperties-standard.asm :

allyPortraitAndSfx: macro
    defineShorthand.b PORTRAIT_,\1
    defineShorthand.b SFX_,\2
    endm


; 3 entries per ally for each class type, 2 bytes per entry.

table_AllyDialogueProperties:

; Syntax        allyPortraitAndSfx [PORTRAIT_]enum (or index), [SFX_]enum (or index)
;               allyPortraitAndSfx [PORTRAIT_]enum (or index), [SFX_]enum (or index)
;               allyPortraitAndSfx [PORTRAIT_]enum (or index), [SFX_]enum (or index)
                
; 0: Bowie
                allyPortraitAndSfx BOWIE_BASE,  DIALOG_BLEEP_5
                allyPortraitAndSfx BOWIE_PROMO, DIALOG_BLEEP_5
                allyPortraitAndSfx BOWIE_PROMO, DIALOG_BLEEP_5
                
; 1: Sarah
                allyPortraitAndSfx SARAH, DIALOG_BLEEP_2
                allyPortraitAndSfx SARAH, DIALOG_BLEEP_2
                allyPortraitAndSfx SARAH, DIALOG_BLEEP_2
                
; 2: Chester
                allyPortraitAndSfx CHESTER, DIALOG_BLEEP_5
                allyPortraitAndSfx CHESTER, DIALOG_BLEEP_5
                allyPortraitAndSfx CHESTER, DIALOG_BLEEP_5
                
; 3: Jaha
                allyPortraitAndSfx JAHA, DIALOG_BLEEP_5
                allyPortraitAndSfx JAHA, DIALOG_BLEEP_5
                allyPortraitAndSfx JAHA, DIALOG_BLEEP_5
                
; 4: Kazin
                allyPortraitAndSfx KAZIN, DIALOG_BLEEP_5
                allyPortraitAndSfx KAZIN, DIALOG_BLEEP_5
                allyPortraitAndSfx KAZIN, DIALOG_BLEEP_5
                
; 5: Slade
                allyPortraitAndSfx SLADE_BASE,  DIALOG_BLEEP_6
                allyPortraitAndSfx SLADE_PROMO, DIALOG_BLEEP_6
                allyPortraitAndSfx SLADE_PROMO, DIALOG_BLEEP_6
                
; 6: Kiwi
                allyPortraitAndSfx KIWI_BASE,  DIALOG_BLEEP_1
                allyPortraitAndSfx KIWI_PROMO, DIALOG_BLEEP_7
                allyPortraitAndSfx KIWI_PROMO, DIALOG_BLEEP_7
                
; 7: Peter
                allyPortraitAndSfx PETER_BASE,  DIALOG_BLEEP_4
                allyPortraitAndSfx PETER_PROMO, DIALOG_BLEEP_5
                allyPortraitAndSfx PETER_PROMO, DIALOG_BLEEP_5
                
; 8: May
                allyPortraitAndSfx MAY, DIALOG_BLEEP_3
                allyPortraitAndSfx MAY, DIALOG_BLEEP_3
                allyPortraitAndSfx MAY, DIALOG_BLEEP_3
                
; 9: Gerhalt
                allyPortraitAndSfx GERHALT_BASE,  DIALOG_BLEEP_6
                allyPortraitAndSfx GERHALT_PROMO, DIALOG_BLEEP_6
                allyPortraitAndSfx GERHALT_PROMO, DIALOG_BLEEP_6
                
; 10: Luke
                allyPortraitAndSfx LUKE, DIALOG_BLEEP_6
                allyPortraitAndSfx LUKE, DIALOG_BLEEP_6
                allyPortraitAndSfx LUKE, DIALOG_BLEEP_6
                
; 11: Rohde
                allyPortraitAndSfx ROHDE, DIALOG_BLEEP_5
                allyPortraitAndSfx ROHDE, DIALOG_BLEEP_5
                allyPortraitAndSfx ROHDE, DIALOG_BLEEP_5
                
; 12: Rick
                allyPortraitAndSfx RICK, DIALOG_BLEEP_5
                allyPortraitAndSfx RICK, DIALOG_BLEEP_5
                allyPortraitAndSfx RICK, DIALOG_BLEEP_5
                
; 13: Elric
                allyPortraitAndSfx ELRIC, DIALOG_BLEEP_5
                allyPortraitAndSfx ELRIC, DIALOG_BLEEP_5
                allyPortraitAndSfx ELRIC, DIALOG_BLEEP_5
                
; 14: Eric
                allyPortraitAndSfx ERIC, DIALOG_BLEEP_5
                allyPortraitAndSfx ERIC, DIALOG_BLEEP_5
                allyPortraitAndSfx ERIC, DIALOG_BLEEP_5
                
; 15: Karna
                allyPortraitAndSfx KARNA, DIALOG_BLEEP_5
                allyPortraitAndSfx KARNA, DIALOG_BLEEP_5
                allyPortraitAndSfx KARNA, DIALOG_BLEEP_5
                
; 16: Randolf
                allyPortraitAndSfx RANDOLF, DIALOG_BLEEP_6
                allyPortraitAndSfx RANDOLF, DIALOG_BLEEP_6
                allyPortraitAndSfx RANDOLF, DIALOG_BLEEP_6
                
; 17: Tyrin
                allyPortraitAndSfx TYRIN, DIALOG_BLEEP_6
                allyPortraitAndSfx TYRIN, DIALOG_BLEEP_6
                allyPortraitAndSfx TYRIN, DIALOG_BLEEP_6
                
; 18: Janet
                allyPortraitAndSfx JANET, DIALOG_BLEEP_4
                allyPortraitAndSfx JANET, DIALOG_BLEEP_4
                allyPortraitAndSfx JANET, DIALOG_BLEEP_4
                
; 19: Higins
                allyPortraitAndSfx HIGINS, DIALOG_BLEEP_6
                allyPortraitAndSfx HIGINS, DIALOG_BLEEP_6
                allyPortraitAndSfx HIGINS, DIALOG_BLEEP_6
                
; 20: Skreech
                allyPortraitAndSfx SKREECH, DIALOG_BLEEP_5
                allyPortraitAndSfx SKREECH, DIALOG_BLEEP_5
                allyPortraitAndSfx SKREECH, DIALOG_BLEEP_5
                
; 21: Taya
                allyPortraitAndSfx TAYA, DIALOG_BLEEP_3
                allyPortraitAndSfx TAYA, DIALOG_BLEEP_3
                allyPortraitAndSfx TAYA, DIALOG_BLEEP_3
                
; 22: Frayja
                allyPortraitAndSfx FRAYJA, DIALOG_BLEEP_3
                allyPortraitAndSfx FRAYJA, DIALOG_BLEEP_3
                allyPortraitAndSfx FRAYJA, DIALOG_BLEEP_3
                
; 23: Jaro
                allyPortraitAndSfx JARO, DIALOG_BLEEP_5
                allyPortraitAndSfx JARO, DIALOG_BLEEP_5
                allyPortraitAndSfx JARO, DIALOG_BLEEP_5
                
; 24: Gyan
                allyPortraitAndSfx GYAN, DIALOG_BLEEP_6
                allyPortraitAndSfx GYAN, DIALOG_BLEEP_6
                allyPortraitAndSfx GYAN, DIALOG_BLEEP_6
                
; 25: Sheela
                allyPortraitAndSfx SHEELA, DIALOG_BLEEP_2
                allyPortraitAndSfx SHEELA, DIALOG_BLEEP_2
                allyPortraitAndSfx SHEELA, DIALOG_BLEEP_2
                
; 26: Zynk
                allyPortraitAndSfx ZYNK, DIALOG_BLEEP_8
                allyPortraitAndSfx ZYNK, DIALOG_BLEEP_8
                allyPortraitAndSfx ZYNK, DIALOG_BLEEP_8
                
; 27: Chaz
                allyPortraitAndSfx CHAZ, DIALOG_BLEEP_2
                allyPortraitAndSfx CHAZ, DIALOG_BLEEP_2
                allyPortraitAndSfx CHAZ, DIALOG_BLEEP_2
                
; 28: Lemon
                allyPortraitAndSfx LEMON, DIALOG_BLEEP_6
                allyPortraitAndSfx LEMON, DIALOG_BLEEP_6
                allyPortraitAndSfx LEMON, DIALOG_BLEEP_6
                
; 29: Claude
                allyPortraitAndSfx CLAUDE, DIALOG_BLEEP_7
                allyPortraitAndSfx CLAUDE, DIALOG_BLEEP_7
                allyPortraitAndSfx CLAUDE, DIALOG_BLEEP_7
                
            if (EXPANDED_FORCE_MEMBERS=1)
; 30: 
                allyPortraitAndSfx BOWIE_BASE, DIALOG_BLEEP_5
                allyPortraitAndSfx BOWIE_BASE, DIALOG_BLEEP_5
                allyPortraitAndSfx BOWIE_BASE, DIALOG_BLEEP_5
                
; 31: 
                allyPortraitAndSfx BOWIE_BASE, DIALOG_BLEEP_5
                allyPortraitAndSfx BOWIE_BASE, DIALOG_BLEEP_5
                allyPortraitAndSfx BOWIE_BASE, DIALOG_BLEEP_5
                
            endif
