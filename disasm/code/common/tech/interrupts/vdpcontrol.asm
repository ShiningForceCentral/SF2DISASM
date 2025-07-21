
; ASM FILE code\common\tech\interrupts\vdpcontrol.asm :
; 0xB96..0xCC4 : Vertical Interrupt Engine - VDP control functions

; =============== S U B R O U T I N E =======================================


WaitDmaEnd:
                
                movem.w d0,-(sp)
@Wait:
                
                move.w  (VDP_Control).l,d0
                btst    #1,d0           ; control if DMA in progress
                bne.s   @Wait           ; loop if DMA in progress
                movem.w (sp)+,d0
                rts

    ; End of function WaitDmaEnd


; =============== S U B R O U T I N E =======================================

; unused
; 
; VDP Reg Status -> d0.w


GetVdpRegStatus:
            if (VANILLA_BUILD=1)
                movem.l a0,-(sp)
                lea     (VDP_REG00_STATUS).l,a0
                add.w   d0,d0
                move.w  (a0,d0.w),d0
                movem.l (sp)+,a0
                rts
            endif

    ; End of function GetVdpRegStatus


; =============== S U B R O U T I N E =======================================


SetVdpReg:
                
                bsr.s   WaitDmaEnd
                movem.l d0-d1/a0,-(sp)
                lea     (VDP_REG00_STATUS).l,a0
                move.w  d0,(VDP_Control).l
                move.w  d0,d1
                andi.w  #$7F00,d0
                lsr.w   #7,d0
                move.w  d1,(a0,d0.w)    ; store new vdp reg status
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function SetVdpReg


; =============== S U B R O U T I N E =======================================


ApplyLogicalOrOnVdpReg:
                
                bsr.s   WaitDmaEnd
                movem.l d0-d1/a0,-(sp)
                lea     (VDP_REG00_STATUS).l,a0
                add.w   d0,d0
                or.b    d1,1(a0,d0.w)   ; enable display
                bra.s   SendVdpCommand

    ; End of function ApplyLogicalOrOnVdpReg


; =============== S U B R O U T I N E =======================================


ApplyLogicalAndOnVdpReg:
                
                bsr.s   WaitDmaEnd
                movem.l d0-d1/a0,-(sp)
                lea     (VDP_REG00_STATUS).l,a0
                add.w   d0,d0
                and.b   d1,1(a0,d0.w)   ; disable display

    ; End of function ApplyLogicalAndOnVdpReg


; =============== S U B R O U T I N E =======================================


SendVdpCommand:
                
                move.w  (a0,d0.w),d1
                move.w  d1,(VDP_Control).l
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function SendVdpCommand


; =============== S U B R O U T I N E =======================================


EnableDisplayOnVdp:
                
                move.w  #1,d0           ; get vdp reg 01
                move.w  #$40,d1 
                bra.s   ApplyLogicalOrOnVdpReg

    ; End of function EnableDisplayOnVdp


; =============== S U B R O U T I N E =======================================


DisableDisplayOnVdp:
                
                move.w  #1,d0
                move.w  #$BF,d1 
                bra.s   ApplyLogicalAndOnVdpReg

    ; End of function DisableDisplayOnVdp


; =============== S U B R O U T I N E =======================================


EnableInterrupts:
                
                move.b  #$80,((VINT_ENABLED-$1000000)).w
                move    #$2300,sr       ; set interrupt mask to level 3
                rts

    ; End of function EnableInterrupts


; =============== S U B R O U T I N E =======================================


DisableInterrupts:
                
                clr.b   ((VINT_ENABLED-$1000000)).w
                move    #$2700,sr       ; set interrupt mask to level 7 : no more HInt/VInt !
                rts

    ; End of function DisableInterrupts


; =============== S U B R O U T I N E =======================================


EnableDisplayAndInterrupts:
                
                bsr.s   EnableDisplayOnVdp
                bra.s   EnableInterrupts

    ; End of function EnableDisplayAndInterrupts


; =============== S U B R O U T I N E =======================================


DisableDisplayAndInterrupts:
                
                bsr.s   DisableInterrupts
                bra.s   DisableDisplayOnVdp

    ; End of function DisableDisplayAndInterrupts


; =============== S U B R O U T I N E =======================================

; unused


ActivateVIntDmaQueueProcessing:
                
                bclr    #DEACTIVATE_DMA,(VINT_PARAMETERS).l
                rts

    ; End of function ActivateVIntDmaQueueProcessing


; =============== S U B R O U T I N E =======================================

; unused


DeactivateVIntDmaQueueProcessing:
                
                bset    #DEACTIVATE_DMA,(VINT_PARAMETERS).l
                rts

    ; End of function DeactivateVIntDmaQueueProcessing


; =============== S U B R O U T I N E =======================================


DuplicatePalettes:
                
                movem.l d7/a5-a6,-(sp)
                lea     (PALETTE_1_BASE).l,a5
                lea     (PALETTE_1_CURRENT).l,a6
                move.w  #CRAM_COLORS_COUNTER,d7
@Loop:
                
                move.w  (a5)+,(a6)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d7/a5-a6

    ; End of function DuplicatePalettes


; =============== S U B R O U T I N E =======================================

; VDP CRAM


ApplyVIntCramDma:
                
                move    sr,-(sp)
                move    #$2700,sr       ; disable interrupts
                movem.l a6,-(sp)
                movea.l (DMA_QUEUE_POINTER).l,a6
                move.w  #$8F02,(a6)+    ; auto increment : 2
                move.w  #$9400,(a6)+    ; DMA length : 64
                move.w  #$9340,(a6)+
                move.w  #$96E8,(a6)+
                move.w  #$9500,(a6)+
                move.w  #$977F,(a6)+    ; RAM to VRAM, address : 0xFFD000 (Palette data)
                move.w  #$C000,(a6)+
                move.w  #$80,(a6)+      ; CRAM DMA Write
                move.l  a6,(DMA_QUEUE_POINTER).l
                addq.b  #1,(DMA_QUEUE_SIZE).l
                movem.l (sp)+,a6
                move    (sp)+,sr
                rts

    ; End of function ApplyVIntCramDma

