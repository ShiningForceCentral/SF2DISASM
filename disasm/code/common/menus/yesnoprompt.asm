
; ASM FILE code\common\menus\yesnoprompt.asm :
; 0x15284..0x154A2 : Yes/No prompt functions

; =============== S U B R O U T I N E =======================================


YesNoPrompt:
                
                clr.w   d0
                move.b  ((PLAYER_1_INPUT-$1000000)).w,d0
                bra.s   loc_1528E

    ; End of function YesNoPrompt


; =============== S U B R O U T I N E =======================================

windowLayoutEndAddress = -6
windowSlot = -2

alt_YesNoPrompt:
                
                clr.w   d0
loc_1528E:
                
                movem.l d1-a1,-(sp)
                link    a6,#-6
                move.w  d0,-(sp)
                move.w  #$E03,d0
                move.w  #$2011,d1
                jsr     (CreateWindow).w
                move.w  d0,windowSlot(a6)
                move.l  a1,windowLayoutEndAddress(a6)
                movea.l (p_tiles_YesNoPrompt).l,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                clr.b   ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bsr.w   LoadYesNoPromptLayout
                clr.w   d6
                bsr.w   sub_1542A
                bsr.w   sub_1544A
                move.w  windowSlot(a6),d0
                move.w  #$C11,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  ((DIALOGUE_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_152F0
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_152F0:
                
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_15302
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_15302:
                
                jsr     (WaitForWindowMovementEnd).w
                move.w  (sp)+,d0
                beq.w   loc_15312
loc_1530C:
                
                tst.b   ((PLAYER_1_INPUT-$1000000)).w
                bne.s   loc_1530C
loc_15312:
                
                moveq   #$F,d6
loc_15314:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_15328
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15378
loc_15328:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_1533C
                moveq   #-1,d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15378
loc_1533C:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_15350
                moveq   #-1,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bra.w   loc_153D6
loc_15350:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_15364
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_153D6
loc_15364:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_153C0
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_153D6
loc_15378:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_15422       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bsr.w   LoadYesNoPromptLayout
                move.w  windowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                move.w  ((DIALOGUE_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_153AC
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
loc_153AC:
                
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_153BE
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_153BE:
                
                moveq   #$13,d6
loc_153C0:
                
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_15422       
                subq.w  #1,d6
                bne.s   loc_153CE
                moveq   #$14,d6
loc_153CE:
                
                jsr     (WaitForVInt).w
                bra.w   loc_15314
loc_153D6:
                
                move.w  windowSlot(a6),d0
                move.w  #$F011,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  ((DIALOGUE_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_153F6
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_153F6:
                
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_15408
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_15408:
                
                jsr     (WaitForWindowMovementEnd).w
                move.w  windowSlot(a6),d0
                jsr     (DeleteWindow).w
                unlk    a6
                movem.l (sp)+,d1-a1
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                ext.w   d0
                rts

    ; End of function alt_YesNoPrompt


; =============== S U B R O U T I N E =======================================

; related to DMA
; 
; In: d0.b = current diamond menu choice


sub_15422:
                
                module
                andi.w  #1,d0
                bne.w   sub_1544A

    ; End of function sub_15422


; =============== S U B R O U T I N E =======================================


sub_1542A:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                cmpi.w  #$A,d6
                blt.s   loc_1543A
                adda.w  #$120,a0
loc_1543A:
                
                lea     ($B800).l,a1
                move.w  #$90,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function sub_1542A


; =============== S U B R O U T I N E =======================================


sub_1544A:
                
                lea     (FF8A44_LOADING_SPACE).l,a0
                cmpi.w  #$A,d6
                blt.s   loc_1545A
                adda.w  #$120,a0
loc_1545A:
                
                lea     ($B920).l,a1
                move.w  #$90,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function sub_1544A

                modend

; =============== S U B R O U T I N E =======================================

windowLayoutEndAddress = -6
windowSlot = -2

LoadYesNoPromptLayout:
                
                movea.l windowLayoutEndAddress(a6),a1
                lea     layout_YesNoPromptMenu(pc), a0
                move.w  #84,d7
                jsr     (CopyBytes).w   
                tst.b   ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bne.s   loc_15486
                lea     s_Yes(pc), a0   
                bra.s   loc_1548A
loc_15486:
                
                lea     s_No(pc), a0    
loc_1548A:
                
                movea.l windowLayoutEndAddress(a6),a1
                adda.w  #48,a1
                moveq   #-28,d1
                moveq   #3,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                rts

    ; End of function LoadYesNoPromptLayout

s_Yes:          dc.b 'Yes'
s_No:           dc.b 'No '
