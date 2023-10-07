
; ASM FILE code\common\tech\interrupts\applyvramdmafill.asm :
; 0x140E..0x14A6 : Vertical Interrupt Engine - VRAM DMA filler function

; =============== S U B R O U T I N E =======================================

; d0.w = Destination, d1.w = Length, d2.w = Filler value


ApplyVramDmaFill:
                
                movem.l d0-d3,-(sp)
                move.w  (VDP_REG01_STATUS).l,d3 ; get last 16+ vdp reg config command ?
                ori.b   #$10,d3         ; make sure it concerns a 16+ vdp reg
                move.w  d3,(VDP_Control).l ; send command again
                move.w  #$8F01,(VDP_Control).l ; set auto increment bias number to 1
                movem.l d1,-(sp)
                andi.w  #BYTE_MASK,d1
                ori.w   #$9300,d1
                move.w  d1,(VDP_Control).l ; DMA length counter low : 0
                movem.l (sp)+,d1
                lsr.w   #BYTE_SHIFT_COUNT,d1
                ori.w   #$9400,d1       ; DMA length counter high : 1
                move.w  d1,(VDP_Control).l
                move.w  #$9780,(VDP_Control).l ; VRAM fill
                movem.l d0,-(sp)
                andi.w  #$3FFF,d0       ; d0 : destination address
                ori.w   #$4000,d0
                move.w  d0,(VDP_Control).l
                movem.l (sp)+,d0
                rol.w   #2,d0
                andi.w  #3,d0
                ori.w   #$80,d0 ; errr .. CD5 set to 1 ? doesn't correspond to any access mode
                move.w  d0,(VDP_Control).l ; destination address, second word
                move.w  d2,(VDP_Data).l ; writes 0 everytime
@Wait:
                
                move.w  (VDP_Control).l,d0
                andi.w  #2,d0           ; wait for DMA free
                bne.s   @Wait
                
                move.w  (VDP_REG01_STATUS).l,d3 ; get last vdp 16+ reg config command and send it
                move.w  d3,(VDP_Control).l
                move.w  #$8F02,(VDP_Control).l ; auto increment bias number : 2
                movem.l (sp)+,d0-d3
                rts

    ; End of function ApplyVramDmaFill

