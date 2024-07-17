
; ASM FILE code\common\menus\goldwindow.asm :
; 0x12F12..0x12FE6 : Gold window functions

; =============== S U B R O U T I N E =======================================

goldWindowLayoutEndAddress = -18

OpenGoldWindowInFieldMenu:
                
                module
                movem.l d0-a1,-(sp)
                link    a6,#-32
                move.w  #WINDOW_FIELD_GOLD_SOURCE,d1
                move.w  #WINDOW_FIELD_GOLD_DEST,d2
                bra.s   @Continue
OpenGoldWindow:
                
                movem.l d0-a1,-(sp)
                link    a6,#-32
                move.w  #WINDOW_GOLD_SOURCE,d1
                move.w  #WINDOW_GOLD_DEST,d1
                
@Continue:      tst.w   ((GOLD_WINDOW_INDEX-$1000000)).w
                bne.s   @Done
                
                move.w  #WINDOW_GOLD_SIZE,d0
                jsr     (CreateWindow).l
                addq.w  #1,d0
                move.w  d0,((GOLD_WINDOW_INDEX-$1000000)).w
                move.l  a1,goldWindowLayoutEndAddress(a6)
                bsr.w   WriteGoldAmount 
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  d2,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                
@Done:          unlk    a6
                movem.l (sp)+,d0-a1
                rts

    ; End of function OpenGoldWindow

                modend

; =============== S U B R O U T I N E =======================================

goldWindowLayoutEndAddress = -18

HideGoldWindow:
                
                tst.w   ((GOLD_WINDOW_INDEX-$1000000)).w
                beq.s   @Return
                
                movem.l d0-a1,-(sp)
                link    a6,#-32
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.l  a1,goldWindowLayoutEndAddress(a6)
                bsr.w   WriteGoldAmount 
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                unlk    a6
                movem.l (sp)+,d0-a1
@Return:        rts

    ; End of function HideGoldWindow


; =============== S U B R O U T I N E =======================================


CloseGoldWindowInFieldMenu:
                
                module
                movem.l d0-a1,-(sp)
                move.w  #WINDOW_FIELD_GOLD_SOURCE,d1
                bra.s   @Continue
CloseGoldWindow:
                
                movem.l d0-a1,-(sp)
                move.w  #WINDOW_GOLD_SOURCE,d1
                
@Continue:      tst.w   ((GOLD_WINDOW_INDEX-$1000000)).w
                beq.s   @Done
                
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  ((DIALOGUE_WINDOW_INDEX-$1000000)).w,d0
                beq.s   @Skip
                
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
@Skip:          jsr     (WaitForWindowMovementEnd).w
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                jsr     (DeleteWindow).w
                clr.w   ((GOLD_WINDOW_INDEX-$1000000)).w
@Done:          movem.l (sp)+,d0-a1
                rts

    ; End of function CloseGoldWindow

                modend
