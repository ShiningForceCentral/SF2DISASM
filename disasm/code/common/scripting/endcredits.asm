
; ASM FILE code\common\scripting\endcredits.asm :
; 0x1AC068..0x1AC29C : Ending credits functions

; =============== S U B R O U T I N E =======================================


PlayEndCredits:
                
                jmp     *+4(pc)
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (WaitForVInt).w
                jsr     (DisableDisplayAndInterrupts).w
                jsr     (ClearVsramAndSprites).w
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (InitDisplay).w
                bsr.w   ClearPalette2
                jsr     (DisableDisplayAndInterrupts).w
                bsr.w   LoadEndCreditsFont
                lea     (PLANE_B_LAYOUT).l,a1
                move.w  #$27C0,d1
                moveq   #7,d7
loc_1AC09C:
                
                moveq   #5,d6
loc_1AC09E:
                
                move.w  d1,(a1)+
                addq.w  #1,d1
                dbf     d6,loc_1AC09E
                addq.w  #2,d1
                lea     $34(a1),a1
                dbf     d7,loc_1AC09C
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (EnableDisplayAndInterrupts).w
                clr.w   d6
                jsr     (UpdateForegroundHScrollData).w
                jsr     (UpdateForegroundVScrollData).w
                jsr     (UpdateBackgroundHScrollData).w
                jsr     (UpdateBackgroundVScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                jsr     (FadeInFromBlack).w
                move.l  (p_GameStaff).l,((CONFMODE_AND_CREDITS_SEQUENCE_POINTER-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_EndCredits
                moveq   #$78,d0 
                jsr     (Sleep).w       
                jsr     j_UpdateForce
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                lea     ((TARGETS_LIST-$1000000)).w,a0
loc_1AC10E:
                
                movem.l d7-a0,-(sp)
                clr.w   d0
                move.b  (a0),d0
                jsr     j_GetAllyPortrait
                jsr     j_LoadPortrait
                lea     (PALETTE_2_CURRENT).l,a0 ; clear palette 2
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                jsr     (ApplyVIntCramDma).w
                move.w  #$40,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$80,d7 
                move.w  d7,(HORIZONTAL_SCROLL_DATA+2).l
                move.w  #$60,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$20,d7 
                neg.w   d7
                move.w  d7,(VERTICAL_SCROLL_DATA+2).l
                move.b  #2,((FADING_PALETTE_BITMAP-$1000000)).w
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.w  #$B4,d0 
                jsr     (Sleep).w       
                move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                moveq   #$2C,d0 
                jsr     (Sleep).w       
                movem.l (sp)+,d7-a0
                addq.l  #1,a0
                dbf     d7,loc_1AC10E
loc_1AC1A8:
                
                movea.l ((CONFMODE_AND_CREDITS_SEQUENCE_POINTER-$1000000)).w,a0
                cmpi.b  #$FF,(a0)
                bne.s   loc_1AC1A8
                bsr.w   ClearPalette2
                move.w  #$B4,d0 
                jsr     (Sleep).w       
                jsr     (FadeOutToBlack).w
                move.w  #$78,d0 
                jsr     (Sleep).w       
                rts

    ; End of function PlayEndCredits


; =============== S U B R O U T I N E =======================================


ClearPalette2:
                
                lea     (PALLETE_2_BASE).l,a0
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                rts

    ; End of function ClearPalette2


; =============== S U B R O U T I N E =======================================


VInt_EndCredits:
                
                btst    #0,((FRAME_COUNTER-$1000000)).w
                bne.s   loc_1AC1F6
                subq.w  #1,(HORIZONTAL_SCROLL_DATA+2).l
                jsr     (UpdateVdpHScrollData).w
loc_1AC1F6:
                
                movea.l ((CONFMODE_AND_CREDITS_SEQUENCE_POINTER-$1000000)).w,a0
                cmpi.b  #$FF,(a0)
                beq.s   loc_1AC220
                move.b  ((FRAME_COUNTER-$1000000)).w,d0
                andi.b  #1,d0
                bne.s   loc_1AC220
                move.w  (VERTICAL_SCROLL_DATA).l,d0
                andi.w  #$F,d0
                bne.s   loc_1AC21A
                bsr.w   EndCreditSubroutine
loc_1AC21A:
                
                addq.w  #1,(VERTICAL_SCROLL_DATA).l
loc_1AC220:
                
                jsr     (UpdateVdpHScrollData).w
                jsr     (UpdateVdpVScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                rts

    ; End of function VInt_EndCredits


; =============== S U B R O U T I N E =======================================


EndCreditSubroutine:
                
                move.b  (a0)+,d1
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                move.w  (VERTICAL_SCROLL_DATA).l,d0
                lsr.w   #3,d0
                addi.w  #$1C,d0
                andi.w  #$1F,d0
                lsl.w   #6,d0
                adda.w  d0,a1
                movem.l d7/a1,-(sp)
                moveq   #$1F,d7
loc_1AC250:
                
                clr.l   (a1)+
                dbf     d7,loc_1AC250
                movem.l (sp)+,d7/a1
                tst.b   d1
                beq.s   loc_1AC280
                lsl.w   #1,d1
                adda.w  d1,a1
loc_1AC262:
                
                clr.w   d1
                move.b  (a0)+,d1
                beq.w   loc_1AC280
                subi.w  #$20,d1 
                lsl.w   #1,d1
                ori.w   #$C100,d1
                move.w  d1,(a1)
                addq.w  #1,d1
                move.w  d1,$40(a1)
                addq.l  #2,a1
                bra.s   loc_1AC262
loc_1AC280:
                
                move.l  a0,((CONFMODE_AND_CREDITS_SEQUENCE_POINTER-$1000000)).w
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                rts

    ; End of function EndCreditSubroutine

