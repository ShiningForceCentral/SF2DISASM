
; ASM FILE code\common\tech\interrupts\unused_vint_2.asm :
; 0xF3A..0x10DC : Unused Vertical Interrupt engine functions

; =============== S U B R O U T I N E =======================================

; unused


sub_F3A:
                
                bsr.w   DisableInterrupts
                movem.l d7/a4-a5,-(sp)
                movea.l (VDP_COMMAND_QUEUE_POINTER).l,a4
                moveq   #0,d7
                move.w  d7,(a4)+
                bsr.s   sub_F90         
                move.w  a6,(a4)+
loc_F50:
                
                move.w  d0,(a4)+
                move.l  a4,(VDP_COMMAND_QUEUE_POINTER).l
                addq.b  #1,(VDP_COMMAND_COUNTER).l
                clr.l   d7
                move.w  a6,d7
                ori.l   #$FF0000,d7
                movea.l d7,a6
                move.w  d0,(a6)
                movem.l (sp)+,d7/a4-a5
                bsr.w   EnableInterrupts
                rts

    ; End of function sub_F3A


; =============== S U B R O U T I N E =======================================

; unused


sub_F76:
                
                bsr.w   DisableInterrupts
                movem.l d7/a4-a5,-(sp)
                movea.l (VDP_COMMAND_QUEUE_POINTER).l,a4
                moveq   #0,d7
                move.w  d7,(a4)+
                bsr.s   sub_F90         
                bsr.s   SwapA6          
                move.w  a6,(a4)+
                bra.s   loc_F50

    ; End of function sub_F76


; =============== S U B R O U T I N E =======================================

; unused


sub_F90:
                
                movem.l d5-d7,-(sp)
                lea     ($E000).l,a6
                lsl.w   #1,d5
                move.w  (HORIZONTAL_SCROLL_DATA+2).l,d7
                addq.w  #4,d7
                lsr.w   #2,d7
                sub.w   d7,d5
                andi.w  #$7E,d5 
                lsl.w   #7,d6
                move.w  (VERTICAL_SCROLL_DATA+2).l,d7
                subq.w  #8,d7
                lsl.w   #NIBBLE_SHIFT_COUNT,d7
                add.w   d7,d6
                andi.w  #$F80,d6
                or.w    d6,d5
                adda.w  d5,a6
                bsr.s   SwapA6          
                movem.l (sp)+,d5-d6
                movem.l d5-d6,-(sp)
                adda.l  #$C000,a6
                lsl.w   #1,d5
                move.w  (HORIZONTAL_SCROLL_DATA).l,d7
                lsr.w   #2,d7
                sub.w   d7,d5
                andi.w  #$7E,d5 
                lsl.w   #7,d6
                move.w  (VERTICAL_SCROLL_DATA).l,d7
                lsl.w   #NIBBLE_SHIFT_COUNT,d7
                add.w   d7,d6
                andi.w  #$F80,d6
                or.w    d6,d5
                adda.w  d5,a6
                movem.l (sp)+,d5-d7
                andi.w  #$7E,d5 
loc_FFE:
                
                andi.w  #$F80,d6
                rts

    ; End of function sub_F90


; =============== S U B R O U T I N E =======================================

; unused


SwapA6:
                
                movem.l d7,-(sp)
                move.l  a6,d7
                swap    d7
                movea.l d7,a6
                movem.l (sp)+,d7
                rts

    ; End of function SwapA6


; =============== S U B R O U T I N E =======================================

; unused


sub_1014:
                
                bsr.w   DisableInterrupts
                lea     (byte_FFDB80).l,a4
                movem.l d5-d6,-(sp)
                move.w  (word_FFDEA6).l,d5
                lsr.w   #BYTE_SHIFT_COUNT,d5
                move.w  (word_FFDEA6).l,d6
                andi.w  #BYTE_MASK,d6
                bsr.w   sub_F90         
                movem.l (sp)+,d5-d6
loc_103C:
                
                movem.l d3-d4/a3-a6,-(sp)
                clr.l   d3
                move.w  a6,d3
                cmpi.w  #$E000,d3
                bcc.s   loc_104E
                addi.w  #$1000,d3
loc_104E:
                
                ori.l   #$FF0000,d3
                movea.l d3,a3
                movea.l (VDP_COMMAND_QUEUE_POINTER).l,a5
                move.w  (word_FFDEA8).l,d3
                andi.l  #BYTE_MASK,d3
                move.b  d3,(VDP_COMMAND_COUNTER).l
                subq.w  #1,d3
loc_1070:
                
                movem.l a3,-(sp)
                move.w  (word_FFDEA8).l,d4
                andi.l  #WORD_UPPER_BYTE_MASK,d4
                lsr.w   #BYTE_SHIFT_COUNT,d4
                subq.w  #1,d4
                move.w  d4,(a5)+
                move.w  a6,(a5)+
loc_1088:
                
                move.w  (a4),(a5)+
                move.w  (a4)+,(a3)+
                dbf     d4,loc_1088
                
                adda.w  #$80,a6 
                movem.l (sp)+,a3
                adda.w  #$80,a3 
                dbf     d3,loc_1070
                
                movem.l (sp)+,d3-d4/a3-a6
                bsr.w   EnableInterrupts
                bra.w   WaitForVdpCommandQueueProcessing
                bsr.w   DisableInterrupts
                lea     (byte_FFDB80).l,a4
                movem.l d5-d6,-(sp)
                move.w  (word_FFDEA6).l,d5
                lsr.w   #BYTE_SHIFT_COUNT,d5
                move.w  (word_FFDEA6).l,d6
                andi.w  #BYTE_MASK,d6
                bsr.w   sub_F90         
                movem.l (sp)+,d5-d6
                bsr.w   SwapA6          
                bra.w   loc_103C

    ; End of function sub_1014

