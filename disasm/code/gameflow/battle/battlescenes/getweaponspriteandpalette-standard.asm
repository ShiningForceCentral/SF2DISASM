
; ASM FILE code\gameflow\battle\battlescenes\getweaponspriteandpalette-standard.asm :
; Standard reimplementation of weapon sprite and palette getter function.

; =============== S U B R O U T I N E =======================================

; Get battlescene weapon sprite and palette indexes for equipped weapon.
; 
; In: d0.w = combatant index
; Out: d2.w = weapon sprite index, d3.w = palette index


GetWeaponSpriteAndPalette:
                
                movem.l d1/a0,-(sp)
                tst.b   d0
                bmi.s   @Skip
                jsr     GetEquippedWeapon
                bmi.s   @Skip
                
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                lea     table_WeaponGraphics(pc), a0
@FindWeapon_Loop:
                cmpi.b  #TERMINATOR_BYTE,(a0)
                beq.s   @Skip
                cmp.b   (a0)+,d1
                beq.s   @Found
                addq.w  #2,a0
                bra.s   @FindWeapon_Loop
                
@Found:         clr.w   d2
                move.b  (a0)+,d2
                clr.w   d3
                move.b  (a0),d3
                bra.s   @Done
                
@Skip:          move.w  #$FFFF,d2
                move.w  d2,d3
                
@Done:          movem.l (sp)+,d1/a0
                rts

    ; End of function GetWeaponSpriteAndPalette

