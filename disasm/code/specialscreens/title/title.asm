
; ASM FILE code\specialscreens\title\title.asm :
; 0x100008..0x1002BE : Title screen functions

; =============== S U B R O U T I N E =======================================


TitleScreen:
                
                jmp     *+4(pc)
                jsr     (DisableDisplayAndInterrupts).w
                jsr     (ClearVsramAndSprites).w
                move.w  #$8C00,d0
                jsr     (SetVdpReg).w
                move.w  #$9000,d0
                jsr     (SetVdpReg).w
                move.w  #$8230,d0
                jsr     (SetVdpReg).w
                move.w  #$8407,d0
                jsr     (SetVdpReg).w
                move.w  #$8B00,d0
                jsr     (SetVdpReg).w
                conditionalPc lea,TitleScreenTiles,a0
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($2000).w,a1
                move.w  #$1000,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                conditionalPc lea,TitleScreenLayoutA,a0
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                move.w  #$700,d7
                jsr     (CopyBytes).w   
                conditionalPc lea,TitleScreenLayoutA,a0
                lea     (byte_FFC358).l,a1
                moveq   #$10,d7
                jsr     (CopyBytes).w   
                lea     (byte_FFC398).l,a1
                jsr     (CopyBytes).w   
                lea     (byte_FFC480).l,a1
                moveq   #$40,d7 
                jsr     (CopyBytes).w   
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$380,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                conditionalPc lea,TitleScreenLayoutB,a0
                lea     (SPRITE_05).l,a1
                moveq   #$A,d7
loc_1000B8:
                
                moveq   #$1F,d6
                moveq   #0,d2
loc_1000BC:
                
                move.w  (a0),d1
                beq.w   loc_100104
                tst.w   d2
                beq.w   loc_1000DE
                move.w  -2(a0),d3
                addq.w  #1,d3
                cmp.w   d1,d3
                bne.w   loc_1000DE
                moveq   #0,d2
                addq.b  #4,-6(a1)
                bra.w   loc_100104
loc_1000DE:
                
                move.w  #$E,d0
                sub.w   d7,d0
                lsl.w   #3,d0
                addi.w  #$80,d0 
                move.w  d0,(a1)+
                addq.l  #2,a1
                ori.w   #$2000,d1
                move.w  d1,(a1)+
                move.w  #$1F,d0
                sub.w   d6,d0
                lsl.w   #3,d0
                addi.w  #$80,d0 
                move.w  d0,(a1)+
                moveq   #$FFFFFFFF,d2
loc_100104:
                
                addq.l  #2,a0
                dbf     d6,loc_1000BC
                dbf     d7,loc_1000B8
                conditionalPc lea,plt_TitleScreen,a0
                lea     (PALETTE_1_BASE).l,a1
                move.w  #$80,d7 
                jsr     (CopyBytes).w   
                jsr     j_LoadTitleScreenFont
                move.l  #$AE0405,(SPRITE_04).l
                move.l  #$C062014E,(SPRITE_04_TILE_FLAGS).l
                jsr     (EnableDisplayAndInterrupts).w
                move.w  #$18,d6
                jsr     (UpdateBackgroundVScrollData).w
                move.w  #$FFE8,d6
                jsr     (UpdateForegroundVScrollData).w
                move.w  #0,d6
                jsr     (UpdateBackgroundHScrollData).w
                move.w  #0,d6
                jsr     (UpdateForegroundHScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #1,((FADING_PALETTE_BITMAP-$1000000)).w
                moveq   #$64,d0 
                bsr.w   WaitForPlayer1InputStart
                moveq   #$20,d0 
                bsr.w   TitleScreenLoop1
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #2,((FADING_PALETTE_BITMAP-$1000000)).w
                moveq   #$10,d0
                bsr.w   TitleScreenLoop1
                moveq   #$32,d0 
                bsr.w   WaitForPlayer1InputStart
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #4,((FADING_PALETTE_BITMAP-$1000000)).w
                move.w  #$78,d0 
                bsr.w   WaitForPlayer1InputStart
                move.w  #$12C,d0
                bsr.w   WaitForPlayer1InputStart
                move.w  #$258,d0
                bsr.w   TitleScreenLoop2
                jsr     (FadeOutToWhite).w
                lea     (PALETTE_1_BASE).l,a0
                moveq   #$1F,d7
loc_1001EC:
                
                move.l  #$EEE0EEE,(a0)+
                dbf     d7,loc_1001EC
                moveq   #$1E,d0
                bsr.w   WaitForPlayer1InputStart
                jsr     (FadeOutToBlack).w
                clr.w   d0
                rts

    ; End of function TitleScreen


; =============== S U B R O U T I N E =======================================

; wait for max d0 frames


WaitForPlayer1InputStart:
                
                jsr     (WaitForVInt).w
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                bne.w   TitleScreenEnd
                subq.w  #1,d0
                bne.s   WaitForPlayer1InputStart
                rts

    ; End of function WaitForPlayer1InputStart


; =============== S U B R O U T I N E =======================================


TitleScreenLoop1:
                
                btst    #0,((FRAME_COUNTER-$1000000)).w
                bne.s   loc_10022C
                addq.w  #1,(VERTICAL_SCROLL_DATA).l
                subq.w  #1,(VERTICAL_SCROLL_DATA+2).l
loc_10022C:
                
                jsr     (UpdateVdpVScrollData).w
                jsr     (WaitForDmaQueueProcessing).w
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                bne.w   TitleScreenEnd
                subq.w  #1,d0
                bne.s   TitleScreenLoop1
                rts

    ; End of function TitleScreenLoop1


; =============== S U B R O U T I N E =======================================


TitleScreenLoop2:
                
                movem.w d0,-(sp)
                conditionalPc lea,TitleScreenLayoutA,a0
                ext.l   d0
                divs.w  #$1E,d0
                swap    d0
                addq.w  #1,d0
                cmpi.w  #$A,d0
                ble.s   loc_100260
                lea     $480(a0),a0
loc_100260:
                
                lea     (byte_FFC480).l,a1
                moveq   #$40,d7 
                jsr     (CopyBytes).w   
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$380,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                movem.w (sp)+,d0
                jsr     (WaitForVInt).w
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                bne.w   TitleScreenEnd
                subq.w  #1,d0
                bne.s   TitleScreenLoop2
                rts

    ; End of function TitleScreenLoop2


; =============== S U B R O U T I N E =======================================


TitleScreenEnd:
                
                move.l  (sp)+,d0
                clr.w   d6
                jsr     (UpdateBackgroundVScrollData).w
                jsr     (UpdateForegroundVScrollData).w
                jsr     (UpdateBackgroundHScrollData).w
                jsr     (UpdateForegroundHScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                jsr     (FadeOutToBlack).w
                moveq   #$FFFFFFFF,d0
                rts

    ; End of function TitleScreenEnd

