
; ASM FILE code\common\menus\goldwindow.asm :
; 0x12F12..0x12FE6 : Gold window functions

; =============== S U B R O U T I N E =======================================

goldWindowLayoutEndAddress = -18

OpenGoldWindow:
                
                tst.w   ((GOLD_WINDOW_INDEX-$1000000)).w
                bne.w   return_12F5C
                movem.l d0-a1,-(sp)
                link    a6,#-32
                move.w  #WINDOW_GOLD_SIZE,d0
                move.w  #WINDOW_GOLD_DEST,d1
                jsr     (CreateWindow).l
                addq.w  #1,d0
                move.w  d0,((GOLD_WINDOW_INDEX-$1000000)).w
                move.l  a1,goldWindowLayoutEndAddress(a6)
                bsr.w   WriteGoldAmount 
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$1617,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                unlk    a6
                movem.l (sp)+,d0-a1
return_12F5C:
                
                rts

    ; End of function OpenGoldWindow


; =============== S U B R O U T I N E =======================================

goldWindowLayoutEndAddress = -18

HideGoldWindow:
                
                tst.w   ((GOLD_WINDOW_INDEX-$1000000)).w
                beq.s   return_12F5C
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
                rts

    ; End of function HideGoldWindow


; =============== S U B R O U T I N E =======================================


CloseGoldWindow:
                
                tst.w   ((GOLD_WINDOW_INDEX-$1000000)).w
                beq.s   return_12F5C
                movem.l d0-a1,-(sp)
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$2017,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  ((DIALOGUE_WINDOW_INDEX-$1000000)).w,d0
                beq.s   @Skip
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
@Skip:
                
                jsr     (WaitForWindowMovementEnd).l
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                jsr     (DeleteWindow).l
                clr.w   ((GOLD_WINDOW_INDEX-$1000000)).w
                movem.l (sp)+,d0-a1
                rts

    ; End of function CloseGoldWindow

