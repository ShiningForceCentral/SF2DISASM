
; ASM FILE code\common\menus\endingkiss.asm :
; 0x12DEC..0x12F12 : Ending kiss sequence function

; =============== S U B R O U T I N E =======================================


PlayEndingKissSequence:
                
                move.b  #-1,(DEACTIVATE_WINDOW_HIDING).l
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                move.w  #$120E,d0
                move.w  #$707,d1
                jsr     (CreateWindow).w
                move.w  d0,d4
                move.w  #$A640,d5
                moveq   #$F,d7
                move.w  #$E000,(a1)+
loc_12E10:
                
                move.w  #$E000,(a1)+
                dbf     d7,loc_12E10
                move.w  #$E800,(a1)+
                moveq   #$B,d6
loc_12E1E:
                
                moveq   #$F,d7
                move.w  #$E000,(a1)+
loc_12E24:
                
                move.w  d5,(a1)+
                addq.w  #1,d5
                dbf     d7,loc_12E24
                move.w  #$E800,(a1)+
                dbf     d6,loc_12E1E
                moveq   #$F,d7
                move.w  #$F000,(a1)+
loc_12E3A:
                
                move.w  #$F000,(a1)+
                dbf     d7,loc_12E3A
                move.w  #$F800,(a1)+
                move.b  #5,((FADING_COUNTER_MAX-$1000000)).w
                lea     (PALETTE_3_CURRENT).l,a0
                lea     (PALETTE_4_CURRENT).l,a1
                move.w  #CRAM_PALETTE_SIZE,d7
                jsr     (CopyBytes).w   
                lea     (PALETTE_3_CURRENT).l,a0
                lea     (PALETTE_3_BASE).l,a1
                move.w  #CRAM_PALETTE_SIZE,d7
                jsr     (CopyBytes).w   
                getPointer p_palette_EndingKiss, a0
                lea     (PALETTE_2_CURRENT).l,a1
                move.w  #CRAM_PALETTE_SIZE,d7
                jsr     (CopyBytes).w   
                lea     $80(a1),a1
                jsr     (CopyBytes).w   
                jsr     (ApplyVIntCramDma).w
                lea     (PALETTE_1_CURRENT).l,a0
                lea     (PALETTE_1_BASE).l,a1
                move.w  #CRAM_SIZE,d7
                jsr     (CopyBytes).w   
                lea     (FF6802_LOADING_SPACE).l,a1
                move.w  #$5FF,d0
                moveq   #0,d1
loc_12EB4:
                
                move.l  d1,(a1)+
                dbf     d0,loc_12EB4
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($C800).l,a1
                move.w  #$600,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                lea     (byte_FF7402).l,a0
                lea     ($D400).l,a1
                move.w  #$600,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                move.w  d4,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
            if (STANDARD_BUILD=1)
                bsr.s   DisplayEndingKissPicture
            else
                jsr     j_DisplayEndingKissPicture
            endif
                move.w  #180,d0
                jsr     (Sleep).w       
                move.w  d4,d0
                jsr     (DeleteWindow).w
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function PlayEndingKissSequence

