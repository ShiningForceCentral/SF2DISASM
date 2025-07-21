
; ASM FILE code\specialscreens\title\title.asm :
; 0x100008..0x1002BE : Title screen functions

; =============== S U B R O U T I N E =======================================


StartTitleScreen:
                
                jmp     *+4(pc)
                jsr     (DisableDisplayAndInterrupts).w
                jsr     (ClearVsramAndSprites).w
                move.w  #$8C00,d0       ; H32 cell mode, no interlace
                jsr     (SetVdpReg).w
                move.w  #$9000,d0       ; scroll size : V32 cell, H32 cell
                jsr     (SetVdpReg).w
                move.w  #$8230,d0       ; scroll A table VRAM address : C000
                jsr     (SetVdpReg).w
                move.w  #$8407,d0       ; scroll B table VRAM address : E000
                jsr     (SetVdpReg).w
                move.w  #$8B00,d0       ; disable external interrupt, full scrolls
                jsr     (SetVdpReg).w
                
                ; Load title tiles
                lea     tiles_TitleScreen(pc), a0
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($2000).w,a1
                move.w  #4096,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                
                ; Load title screen layout A
                lea     layout_TitleScreenA(pc), a0
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                move.w  #1792,d7
                jsr     (CopyBytes).w   
                lea     layout_TitleScreenA(pc), a0
                lea     (byte_FFC358).l,a1
                moveq   #16,d7
                jsr     (CopyBytes).w   
                lea     (byte_FFC398).l,a1
                jsr     (CopyBytes).w   
                
                ; Clear out row containing the "press start" string
                lea     (PRESS_START_BUTTON_LAYOUT).l,a1
                moveq   #64,d7
                jsr     (CopyBytes).w   
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #896,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                
                lea     layout_TitleScreenB(pc), a0
                lea     (SPRITE_05).l,a1
                moveq   #10,d7
@OuterLoop:
                
                moveq   #31,d6
                moveq   #0,d2
@InnerLoop:
                
                move.w  (a0),d1
                beq.w   @NextVdpTile
                tst.w   d2
                beq.w   @LoadSprite
                move.w  -2(a0),d3
                addq.w  #1,d3
                cmp.w   d1,d3
                bne.w   @LoadSprite
                moveq   #0,d2
                addq.b  #4,-6(a1)
                bra.w   @NextVdpTile
@LoadSprite:
                
                move.w  #14,d0          ; sprite layer Y offset
                sub.w   d7,d0
                lsl.w   #3,d0
                addi.w  #128,d0
                move.w  d0,(a1)+        ; push Y
                addq.l  #2,a1           ; skip size and link
                ori.w   #$2000,d1       ; use palette 2
                move.w  d1,(a1)+        ; push vdptile entry
                move.w  #31,d0
                sub.w   d6,d0
                lsl.w   #3,d0
                addi.w  #128,d0
                move.w  d0,(a1)+        ; push X
                moveq   #-1,d2
@NextVdpTile:
                
                addq.l  #2,a0
                dbf     d6,@InnerLoop
                dbf     d7,@OuterLoop
                
                lea     palette_TitleScreen(pc), a0
                lea     (PALETTE_1_BASE).l,a1
                move.w  #128,d7
                jsr     (CopyBytes).w   
            if (STANDARD_BUILD=1)
                bsr.w   LoadTitleScreenFont
            else
                jsr     j_LoadTitleScreenFont
            endif
                
                ; Load "TM" sprite
                move.l  #$AE0405,(SPRITE_TRADEMARK).l
                move.l  #$C062014E,(SPRITE_TRADEMARK_VDPTILE).l
                
                jsr     (EnableDisplayAndInterrupts).w
                move.w  #24,d6
                jsr     (UpdateBackgroundVScrollData).w
                move.w  #-24,d6
                jsr     (UpdateForegroundVScrollData).w
                move.w  #0,d6
                jsr     (UpdateBackgroundHScrollData).w
                move.w  #0,d6
                jsr     (UpdateForegroundHScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                
                ; "SHINING FORCE" fade in
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #1,((FADING_PALETTE_BITFIELD-$1000000)).w
                moveq   #100,d0
                bsr.w   WaitForPlayer1InputStart
                moveq   #32,d0
                bsr.w   TitleScreenLoop1 ; VScroll phase 1
                
                ; "II" fade in
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%10,((FADING_PALETTE_BITFIELD-$1000000)).w
                moveq   #16,d0
                bsr.w   TitleScreenLoop1 ; VScroll phase 2
                moveq   #50,d0
                bsr.w   WaitForPlayer1InputStart
                
                ; Copyright fade in
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%100,((FADING_PALETTE_BITFIELD-$1000000)).w
                move.w  #120,d0
                bsr.w   WaitForPlayer1InputStart
                move.w  #300,d0
                bsr.w   WaitForPlayer1InputStart
                move.w  #600,d0
                bsr.w   TitleScreenLoop2
                jsr     (FadeOutToWhite).w
                lea     (PALETTE_1_BASE).l,a0
                moveq   #31,d7
@WhiteOutAllPalettes_Loop:
                
                move.l  #$EEE0EEE,(a0)+
                dbf     d7,@WhiteOutAllPalettes_Loop
                
                moveq   #30,d0
                bsr.w   WaitForPlayer1InputStart
                jsr     (FadeOutToBlack).w
                clr.w   d0
                rts

    ; End of function StartTitleScreen


; =============== S U B R O U T I N E =======================================

; Wait for max d0.w frames


WaitForPlayer1InputStart:
                
                jsr     (WaitForVInt).w
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                bne.w   EndTitleScreen  
                subq.w  #1,d0
                bne.s   WaitForPlayer1InputStart
                rts

    ; End of function WaitForPlayer1InputStart


; =============== S U B R O U T I N E =======================================


TitleScreenLoop1:
                
                btst    #0,((FRAME_COUNTER-$1000000)).w
                bne.s   @Continue
                addq.w  #1,(VERTICAL_SCROLL_DATA).l
                subq.w  #1,(VERTICAL_SCROLL_DATA+2).l
@Continue:
                
                jsr     (UpdateVdpVScrollData).w
                jsr     (WaitForDmaQueueProcessing).w
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                bne.w   EndTitleScreen  
                subq.w  #1,d0
                bne.s   TitleScreenLoop1
                rts

    ; End of function TitleScreenLoop1


; =============== S U B R O U T I N E =======================================


TitleScreenLoop2:
                
                movem.w d0,-(sp)
                lea     layout_TitleScreenA(pc), a0
                ext.l   d0
                divs.w  #30,d0
                swap    d0
                addq.w  #1,d0
                cmpi.w  #10,d0
                ble.s   @Continue
                lea     1152(a0),a0
@Continue:
                
                lea     (PRESS_START_BUTTON_LAYOUT).l,a1
                moveq   #64,d7
                jsr     (CopyBytes).w   
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #896,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                movem.w (sp)+,d0
                
                jsr     (WaitForVInt).w
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                bne.w   EndTitleScreen  
                subq.w  #1,d0
                bne.s   TitleScreenLoop2
                rts

    ; End of function TitleScreenLoop2


; =============== S U B R O U T I N E =======================================

; End title screen if player pressed Start.


EndTitleScreen:
                
                move.l  (sp)+,d0
                clr.w   d6
                jsr     (UpdateBackgroundVScrollData).w
                jsr     (UpdateForegroundVScrollData).w
                jsr     (UpdateBackgroundHScrollData).w
                jsr     (UpdateForegroundHScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                jsr     (FadeOutToBlack).w
                moveq   #-1,d0
                rts

    ; End of function EndTitleScreen

