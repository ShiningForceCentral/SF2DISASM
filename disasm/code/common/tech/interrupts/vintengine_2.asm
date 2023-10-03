
; ASM FILE code\common\tech\interrupts\vintengine_2.asm :
; 0x10DC..0x1234 : Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display, part 2

; =============== S U B R O U T I N E =======================================

; In: a0 = Source, a1 = Destination, d0.w = Length, d1.l = Auto-increment


ApplyImmediateVramDma:
                
                move    sr,-(sp)
                move    #$2700,sr
                move.w  #$100,(Z80BusReq).l
loc_10EA:
                
                btst    #0,(Z80BusReq).l
                bne.s   loc_10EA
                movem.l d2,-(sp)
                movem.l d0/a6,-(sp)
                lea     (VDP_Control).l,a6
                cmpi.w  #2,d1
                beq.s   loc_1112
                move.l  d1,d2
                addi.w  #-$7100,d1
                move.w  d1,(a6)
                move.l  d2,d1
loc_1112:
                
                moveq   #$10,d2
                or.w    (VDP_REG01_STATUS).l,d2
                move.w  d2,(a6)
                clr.w   d2
                move.b  d0,d2
                lsr.w   #BYTE_SHIFT_COUNT,d0
                swap    d0
                move.w  d2,d0
                ori.l   #$94009300,d0
                move.l  d0,(a6)
                move.l  #$96009500,d2
                move.l  a0,d0
                lsr.l   #1,d0
                move.b  d0,d2
                lsr.w   #BYTE_SHIFT_COUNT,d0
                swap    d2
                move.b  d0,d2
                swap    d2
                move.l  d2,(a6)
                swap    d0
                ori.w   #$9700,d0
                move.w  d0,(a6)
                move.w  a1,d0
                andi.w  #$3FFF,d0
                ori.w   #$4000,d0
                move.w  d0,(a6)
                move.w  a1,d0
                rol.w   #2,d0
                andi.w  #3,d0
                ori.b   #$80,d0
                move.w  d0,(DMA_ADDR_MSBYTE).l
                move.w  (DMA_ADDR_MSBYTE).l,(a6)
                move.w  (VDP_REG01_STATUS).l,(a6)
                move.w  #0,(Z80BusReq).l
                cmpi.w  #2,d1
                beq.s   loc_1188
                move.w  #$8F02,(a6)
loc_1188:
                
                movem.l (sp)+,d0/a6
                moveq   #0,d2
                move.w  d0,d2
                add.l   d2,d2
                adda.l  d2,a0
                adda.l  d2,a1
                movem.l (sp)+,d2
                move    (sp)+,sr
                rts

    ; End of function ApplyImmediateVramDma


; =============== S U B R O U T I N E =======================================

; In: a0 = Source, a1 = Destination, d0.w = Length, d1.l = Auto-increment


ApplyVIntVramDma:
                
                move    sr,-(sp)
                move    #$2700,sr
                move.b  ((VINT_ENABLED-$1000000)).w,-(sp)
                sf      ((VINT_ENABLED-$1000000)).w ; gives msb sign
                movem.l d2,-(sp)
                movem.l d0/a6,-(sp)
                movea.l (DMA_QUEUE_POINTER).l,a6
                move.l  d1,d2
                addi.w  #$8F00,d1
                move.w  d1,(a6)+        ; Apply auto-increment from D1
                move.l  d2,d1
                clr.w   d2
                move.b  d0,d2
                lsr.w   #BYTE_SHIFT_COUNT,d0
                swap    d0
                move.w  d2,d0
                ori.l   #$94009300,d0
                move.l  d0,(a6)+        ; Apply DMA Length from D0
                move.l  #$96009500,d2
                move.l  a0,d0
                lsr.l   #1,d0
                move.b  d0,d2
                lsr.w   #BYTE_SHIFT_COUNT,d0
                swap    d2
                move.b  d0,d2
                swap    d2
                move.l  d2,(a6)+
                swap    d0
                ori.w   #$9700,d0
                move.w  d0,(a6)+        ; Apply source address from A0
                move.w  a1,d0
                andi.w  #$3FFF,d0
                ori.w   #$4000,d0
                move.w  d0,(a6)+
                move.w  a1,d0
                rol.w   #2,d0
                andi.w  #3,d0
                ori.b   #$80,d0
                move.w  d0,(a6)+        ; Apply VRAM write destination address from A1
                move.l  a6,(DMA_QUEUE_POINTER).l
                addq.b  #1,(DMA_QUEUE_SIZE).l
                movem.l (sp)+,d0/a6
                moveq   #0,d2
                move.w  d0,d2
                add.l   d2,d2
                adda.l  d2,a0
                adda.l  d2,a1
                movem.l (sp)+,d2
                move.b  (sp)+,((VINT_ENABLED-$1000000)).w
                move    (sp)+,sr
                rts

    ; End of function ApplyVIntVramDma

