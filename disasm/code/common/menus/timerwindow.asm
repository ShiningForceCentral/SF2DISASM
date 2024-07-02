
; ASM FILE code\common\menus\timerwindow.asm :
; 0x1650C..0x16618 : Timer window functions

; =============== S U B R O U T I N E =======================================


OpenTimerWindow:
                
                movem.l d0-d1/a0-a1,-(sp)
                tst.w   ((TIMER_WINDOW_INDEX-$1000000)).w
                bne.s   @Skip
                
                move.w  #$804,d0        ; width height
                move.w  #$117,d1        ; X-Y screen pos
                jsr     (CreateWindow).l
                bsr.w   WriteTimerDigits
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                addq.w  #1,d0
                move.w  d0,((TIMER_WINDOW_INDEX-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateTimerWindow
                move.l  #-1,((SPECIAL_BATTLE_TIME-$1000000)).w
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
@Skip:
                
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function OpenTimerWindow


; =============== S U B R O U T I N E =======================================


CloseTimerWindow:
                
                movem.l d0-d1/a0-a1,-(sp)
                move.w  ((TIMER_WINDOW_INDEX-$1000000)).w,d0
                beq.s   @Skip
                
                subq.w  #1,d0
                move.w  #$2020,d1
                jsr     (SetWindowDestination).l
                jsr     (WaitForVInt).w
                jsr     (DeleteWindow).l
                clr.w   ((TIMER_WINDOW_INDEX-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_REMOVE
                dc.l VInt_UpdateTimerWindow
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
@Skip:
                
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function CloseTimerWindow


; =============== S U B R O U T I N E =======================================


VInt_UpdateTimerWindow:
                
                movem.l d0-d1/a0-a1,-(sp)
                move.w  ((TIMER_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_165BA
                move.l  ((SECONDS_COUNTER-$1000000)).w,d1
                cmp.l   ((SPECIAL_BATTLE_TIME-$1000000)).w,d1
                beq.s   loc_165BA
                move.l  d1,((SPECIAL_BATTLE_TIME-$1000000)).w
                subq.w  #1,d0
                bsr.w   WriteTimerDigits
                sndCom  SFX_MENU_SELECTION
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                bne.s   loc_165BA
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
loc_165BA:
                
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function VInt_UpdateTimerWindow


; =============== S U B R O U T I N E =======================================


WriteTimerDigits:
                
                move.w  d0,-(sp)
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                movem.l a1,-(sp)
                lea     layout_TimerWindow(pc), a0
                moveq   #64,d7
                jsr     (CopyBytes).w   
                movem.l (sp)+,a1
                adda.w  #34,a1
                move.l  ((SECONDS_COUNTER-$1000000)).w,d0
                divu.w  #60,d0
                move.l  d0,-(sp)
                ext.l   d0
                cmpi.l  #999,d0
                bcs.s   loc_165FA
                move.l  #999,d0
loc_165FA:
                
                moveq   #-16,d1
                moveq   #3,d7
                bsr.w   WriteTilesFromNumber
                move.l  (sp)+,d0
                swap    d0
                ext.l   d0
                addi.w  #100,d0
                addq.l  #2,a1
                moveq   #2,d7
                bsr.w   WriteTilesFromNumber
                move.w  (sp)+,d0
                rts

    ; End of function WriteTimerDigits

