
; ASM FILE code\specialscreens\endkiss\endkissfunctions_0.asm :
; 0x2C576..0x2C73C : End kiss function

; =============== S U B R O U T I N E =======================================


EndKissPictureSequence:
                
                movea.l (p_endKissPicture).l,a0
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($C800).l,a1
                bsr.w   DisplayEndingKissWithPixelFilling
                move.w  #$168,d0
                jsr     (Sleep).w       ; wait for 6 seconds
                lea     (PALETTE_1_BASE).l,a0
                moveq   #7,d7
loc_2C5A6:
                
                clr.l   (a0)+
                dbf     d7,loc_2C5A6
                lea     (PALETTE_1_BASE).l,a0
                clr.b   (FADING_TIMER_BYTE).l
                jsr     (sub_19C8).w    
                move.w  #$366,d0        ; wait for 14 seconds
                jsr     (Sleep).w       
                lea     (PALETTE_1_BASE).l,a0
                moveq   #$1F,d7
loc_2C5CC:
                
                clr.l   (a0)+
                dbf     d7,loc_2C5CC
                lea     (PALETTE_1_BASE).l,a0
                clr.b   (FADING_TIMER_BYTE).l
                jsr     (sub_19C8).w    
                rts

    ; End of function EndKissPictureSequence


; =============== S U B R O U T I N E =======================================


sub_2C5E4:
                
                movem.l d0-a3,-(sp)
                lea     (PALETTE_1_CURRENT).l,a0
                lea     (PALETTE_1_BASE).l,a1
                move.w  #$80,d7 
                jsr     (CopyBytes).w   
                lea     (PALETTE_1_BASE).l,a0
                moveq   #7,d7
loc_2C604:
                
                move.l  (a0),d0
                lsr.l   #1,d0
                andi.l  #$EEE0EEE,d0
                move.l  d0,(a0)+
                dbf     d7,loc_2C604
                lea     (PALETTE_3_BASE).l,a0
                moveq   #$F,d7
loc_2C61C:
                
                move.l  (a0),d0
                lsr.l   #1,d0
                andi.l  #$EEE0EEE,d0
                move.l  d0,(a0)+
                dbf     d7,loc_2C61C
                lea     (PALETTE_1_BASE).l,a0
                clr.b   (FADING_TIMER_BYTE).l
                jsr     (sub_19C8).w    
                movem.l (sp)+,d0-a3
                rts

    ; End of function sub_2C5E4


; =============== S U B R O U T I N E =======================================


DisplayEndingKissWithPixelFilling:
                
                move.w  #$BFF,d7
                lea     (FF0000_RAM_START).l,a2
loc_2C64C:
                
                clr.l   (a2)+
                dbf     d7,loc_2C64C
                lea     (FF0000_RAM_START).l,a2
                lea     byte_2C6FC(pc), a3
                moveq   #$3F,d7 
loc_2C65E:
                
                moveq   #0,d6
loc_2C660:
                
                move.w  #$FF,d5
loc_2C664:
                
                move.w  d7,d0
                move.w  d5,d2
                andi.w  #$3F,d2 
                move.b  (a3,d2.w),d2
                add.w   d2,d0
                andi.w  #$3F,d0 
                move.b  (a3,d0.w),d0
                move.w  d0,d1
                move.w  d5,d2
                lsl.w   #5,d2
                lsr.w   #1,d0
                add.w   d2,d0
                move.b  (a0,d0.w),d2
                btst    #0,d1
                bne.s   loc_2C69A
                andi.b  #$F0,d2
                andi.b  #$F,(a2,d0.w)
                bra.s   loc_2C6A4
loc_2C69A:
                
                andi.b  #$F,d2
                andi.b  #$F0,(a2,d0.w)
loc_2C6A4:
                
                or.b    d2,(a2,d0.w)
                dbf     d5,loc_2C664
                dbf     d6,loc_2C660
                movem.l d0-a3,-(sp)
                lea     (FF0000_RAM_START).l,a0
                move.w  #$600,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                movem.l (sp)+,d0-a3
                movem.l d0-a3,-(sp)
                lea     $C00(a1),a1
                lea     (byte_FF0C00).l,a0
                move.w  #$600,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                movem.l (sp)+,d0-a3
                cmpi.w  #$10,d7
                bne.s   loc_2C6F6
                bsr.w   sub_2C5E4
loc_2C6F6:
                
                dbf     d7,loc_2C65E
                rts

    ; End of function DisplayEndingKissWithPixelFilling

byte_2C6FC:     dc.b $13                ; Pixel appearance parameters for end kiss picture
                dc.b 9
                dc.b $1D
                dc.b $33
                dc.b 7
                dc.b $3C
                dc.b $28
                dc.b $30
                dc.b $19
                dc.b $26
                dc.b $29
                dc.b 3
                dc.b $22
                dc.b $A
                dc.b $15
                dc.b $34
                dc.b 6
                dc.b $23
                dc.b 4
                dc.b $18
                dc.b $2A
                dc.b $E
                dc.b $25
                dc.b $1B
                dc.b $2E
                dc.b $3F
                dc.b $10
                dc.b $12
                dc.b $1F
                dc.b $20
                dc.b $27
                dc.b 0
                dc.b $3D
                dc.b $B
                dc.b $2D
                dc.b $3B
                dc.b $38
                dc.b $21
                dc.b $24
                dc.b $3E
                dc.b $C
                dc.b $1C
                dc.b $3A
                dc.b $F
                dc.b 8
                dc.b $32
                dc.b $2B
                dc.b $37
                dc.b $35
                dc.b $2F
                dc.b $36
                dc.b $31
                dc.b 2
                dc.b $D
                dc.b 5
                dc.b $14
                dc.b $39
                dc.b $11
                dc.b $1A
                dc.b $2C
                dc.b $16
                dc.b $17
                dc.b 1
                dc.b $1E
