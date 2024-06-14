
; ASM FILE code\common\menus\portraitwindow.asm :
; 0x11B46..0x11C2A : Portrait window functions

; =============== S U B R O U T I N E =======================================


OpenPortraitWindow:
                
                module
                tst.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                bne.w   return_11BE0
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a1,-(sp)
                move.w  d0,-(sp)
                move.b  d2,((PORTRAIT_IS_MIRRORED_TOGGLE-$1000000)).w
                move.b  d1,((PORTRAIT_IS_ON_RIGHT_TOGGLE-$1000000)).w
                move.w  #VDPTILE_PORTRAITTILE1|VDPTILE_PALETTE2|VDPTILE_PRIORITY,((PORTRAIT_VDPTILES-$1000000)).w
                move.w  #20,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                move.w  #$80A,d0        ; portrait dimensions
                move.w  #$2F6,d1        ; portrait offset
                tst.b   ((PORTRAIT_IS_ON_RIGHT_TOGGLE-$1000000)).w
                beq.s   @loc_1
                addi.w  #$1500,d1       ; adjustment to other side
@loc_1:
                
                jsr     (CreateWindow).w
                addq.w  #1,d0
                move.w  d0,((PORTRAIT_WINDOW_INDEX-$1000000)).w
                tst.b   ((PORTRAIT_IS_MIRRORED_TOGGLE-$1000000)).w
                bne.s   @loc_2
                lea     tiles_WindowBorder(pc), a0
                bra.s   @loc_3
@loc_2:
                
                lea     layout_PortraitWindow(pc), a0
@loc_3:
                
                move.w  #160,d7
                jsr     (CopyBytes).w   
                move.w  (sp)+,d0
            if (VANILLA_BUILD=1)
                bsr.w   GetAllyPortrait 
            endif
                bsr.w   LoadPortrait    
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$201,d1
                tst.b   ((PORTRAIT_IS_ON_RIGHT_TOGGLE-$1000000)).w
                beq.s   @loc_4
                addi.w  #$1500,d1       ; adjustment to other side
@loc_4:
                
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_PerformPortraitBlinking
                move.b  #-1,((BLINK_CONTROL_TOGGLE-$1000000)).w
                movem.l (sp)+,d0-a1
return_11BE0:
                
                rts

    ; End of function OpenPortraitWindow


; =============== S U B R O U T I N E =======================================

; Move window offscreen, then clear it from memory.


ClosePortraitWindow:
                
                tst.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                beq.s   return_11BE0
                
                movem.l d0-a1,-(sp)
                trap    #VINT_FUNCTIONS
                dc.w VINTS_REMOVE
                dc.l VInt_PerformPortraitBlinking
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$2F6,d1
                tst.b   ((PORTRAIT_IS_ON_RIGHT_TOGGLE-$1000000)).w
                beq.s   @Continue
                addi.w  #$1500,d1       ; adjustment to other side
@Continue:
                
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                jsr     (DeleteWindow).w
                clr.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                movem.l (sp)+,d0-a1
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function ClosePortraitWindow

                modend
