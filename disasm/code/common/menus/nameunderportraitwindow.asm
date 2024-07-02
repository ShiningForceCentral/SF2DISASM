
; ASM FILE code\common\menus\nameunderportraitwindow.asm :
; 0x169AE..0x16A62 : Menu engine, part 10 : Name under portrait window functions

; =============== S U B R O U T I N E =======================================


OpenNameUnderPortraitWindow:
                
                movem.l d0-a1,-(sp)
                tst.w   (ALLY_NAME_WINDOW_INDEX).l
                bne.s   @Done
                movem.w d0,-(sp)
                move.w  #WINDOW_TACTICAL_BASE_NAME_SIZE,d0
                move.w  #WINDOW_TACTICAL_BASE_NAME_DEST,d1
                jsr     (CreateWindow).l
                addq.w  #1,d0
                move.w  d0,(ALLY_NAME_WINDOW_INDEX).l
                move.w  #WINDOW_TACTICAL_BASE_NAME_SIZE,d0
                bsr.w   WriteWindowTiles
                movem.w (sp)+,d0
                jsr     j_GetCurrentHp
                move.w  d1,d2
                jsr     j_GetCombatantName
                move.w  d7,d0
                addq.w  #1,d0
                andi.w  #$E,d0
                move.w  #30,d1
                sub.w   d0,d1
                adda.w  d1,a1
                moveq   #-16,d1
                moveq   #10,d7
                tst.w   d2
                bne.s   @LivingCharacter
                
                ; If character is dead, write name using orange font
                bsr.w   WriteTilesFromAsciiWithOrangeFont
                bra.s   @DisplayName
@LivingCharacter:
                
                bsr.w   WriteTilesFromAsciiWithRegularFont
@DisplayName:
                
                move.w  (ALLY_NAME_WINDOW_INDEX).l,d0
                subq.w  #1,d0
                move.w  #$10B,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
@Done:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function OpenNameUnderPortraitWindow


; =============== S U B R O U T I N E =======================================

; Move window offscreen, then clear it from memory.


CloseNameUnderPortraitWindow:
                
                movem.l d0-d1/a0-a1,-(sp)
                move.w  (ALLY_NAME_WINDOW_INDEX).l,d0
                beq.s   @Done
                subq.w  #1,d0
                move.w  #WINDOW_TACTICAL_BASE_NAME_DEST,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                jsr     (DeleteWindow).l
                clr.w   (ALLY_NAME_WINDOW_INDEX).l
@Done:
                
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function CloseNameUnderPortraitWindow

