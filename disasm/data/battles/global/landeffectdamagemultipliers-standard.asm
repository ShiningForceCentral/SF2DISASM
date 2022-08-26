
; ASM FILE data\battles\global\landeffectdamagemultipliers-standard.asm :
;

; n/256 damage multipliers for land effect settings 0, 1, and 2, respectively.
;
; Can safely be expanded up to 16 entries in total.

LE_DMG_MULT_0: equ 256
LE_DMG_MULT_1: equ 230
LE_DMG_MULT_2: equ 205
LE_DMG_MULT_3: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_4: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_5: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_6: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_7: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_8: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_9: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_10: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_11: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_12: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_13: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_14: equ CODE_TERMINATOR_WORD
LE_DMG_MULT_15: equ CODE_TERMINATOR_WORD

landEffectDamageMultiplier: macro
            if ~(\1=CODE_TERMINATOR_WORD)
                dc.w \1
            endif
        endm

tbl_LandEffectDamageMultipliers:
                
                landEffectDamageMultiplier LE_DMG_MULT_0
                landEffectDamageMultiplier LE_DMG_MULT_1
                landEffectDamageMultiplier LE_DMG_MULT_2
                landEffectDamageMultiplier LE_DMG_MULT_3
                landEffectDamageMultiplier LE_DMG_MULT_4
                landEffectDamageMultiplier LE_DMG_MULT_5
                landEffectDamageMultiplier LE_DMG_MULT_6
                landEffectDamageMultiplier LE_DMG_MULT_7
                landEffectDamageMultiplier LE_DMG_MULT_8
                landEffectDamageMultiplier LE_DMG_MULT_9
                landEffectDamageMultiplier LE_DMG_MULT_10
                landEffectDamageMultiplier LE_DMG_MULT_11
                landEffectDamageMultiplier LE_DMG_MULT_12
                landEffectDamageMultiplier LE_DMG_MULT_13
                landEffectDamageMultiplier LE_DMG_MULT_14
                landEffectDamageMultiplier LE_DMG_MULT_15
