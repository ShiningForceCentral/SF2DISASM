
; ASM FILE code\gameflow\battle\battlescenes\getweaponspriteandpalette.asm :
; 0x19DB0..0x19DFE : Weapon sprite and palette getter function

; =============== S U B R O U T I N E =======================================

; Get battlescene weapon sprite and palette indexes for equipped weapon.
; 
; In: d0.w = combatant index
; Out: d2.w = weapon sprite index, d3.w = palette index


GetWeaponSpriteAndPalette:
                
                movem.l d1/a0,-(sp)
                cmpi.w  #COMBATANT_ENEMIES_START,d0
                bcc.w   @Skip
                jsr     j_GetEquippedWeapon
                if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                    bmi.s   @Skip
                    andi.w  #ITEMENTRY_MASK_INDEX,d1
                    lea     tbl_WeaponGraphics(pc), a0
@FindWeapon_Loop:
                    
                    cmpi.b  #CODE_TERMINATOR_BYTE,(a0)
                    beq.s   @Skip
                    cmp.b   (a0)+,d1
                    beq.s   @Found
                    addq.w  #2,a0
                    bra.s   @FindWeapon_Loop
@Found:
                    
                    move.b  (a0)+,d2
                    ext.w   d2
                    move.b  (a0)+,d3
                    ext.w   d3
                    bra.s   @Done
                else
                    andi.w  #ITEMENTRY_MASK_INDEX,d1
                    cmpi.w  #ITEMINDEX_WEAPONS_START,d1 ; HARDCODED start index for weapon items with battlescene graphics
                    bcs.w   @Skip
                    cmpi.w  #ITEMINDEX_WEAPONS_END,d1 ; HARDCODED end index for weapon items with battlescene graphics
                    bhi.w   @Skip
                    lea     tbl_WeaponGraphics(pc), a0
                    subi.w  #ITEMINDEX_WEAPONS_START,d1 ; Same here : HARDCODED start index for weapon items with battlescene graphics
                    add.w   d1,d1
                    move.b  (a0,d1.w),d2
                    ext.w   d2
                    move.b  1(a0,d1.w),d3
                    ext.w   d3
                    movem.l (sp)+,d1/a0
                    rts
                endif
@Skip:
                
                move.w  #$FFFF,d2
                move.w  d2,d3
@Done:
                
                movem.l (sp)+,d1/a0
                rts

    ; End of function GetWeaponSpriteAndPalette

