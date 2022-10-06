
; ASM FILE code\common\menus\menuengine_10.asm :
; 0x169AE..0x16A62 : Menu engine

; =============== S U B R O U T I N E =======================================


ShowPortraitName:
                
                movem.l d0-a1,-(sp)
                tst.w   (word_FFB08C).l
                bne.s   @Done
                movem.w d0,-(sp)
                move.w  #$A03,d0
                move.w  #$F60B,d1
                jsr     (CreateWindow).l
                addq.w  #1,d0
                move.w  d0,(word_FFB08C).l
                move.w  #$A03,d0
                bsr.w   sub_1018E       
                movem.w (sp)+,d0
                jsr     j_GetCurrentHP
                move.w  d1,d2
                jsr     j_GetCombatantName
                move.w  d7,d0
                addq.w  #1,d0
                andi.w  #$E,d0
                move.w  #$1E,d1
                sub.w   d0,d1
                adda.w  d1,a1
                moveq   #-16,d1
                moveq   #10,d7
                tst.w   d2
                bne.s   @LivingMember
                bsr.w   WriteTilesFromAsciiWithOrangeFont ; dead member
                bra.s   @DisplayName
@LivingMember:
                
                bsr.w   WriteTilesFromAsciiWithRegularFont ; living member
@DisplayName:
                
                move.w  (word_FFB08C).l,d0
                subq.w  #1,d0
                move.w  #$10B,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
@Done:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function ShowPortraitName


; =============== S U B R O U T I N E =======================================


HidePortraitName:
                
                movem.l d0-d1/a0-a1,-(sp)
                move.w  (word_FFB08C).l,d0
                beq.s   @Skip
                subq.w  #1,d0
                move.w  #$F60B,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                jsr     (ClearWindowAndUpdateEndPointer).l
                clr.w   (word_FFB08C).l
@Skip:
                
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function HidePortraitName

