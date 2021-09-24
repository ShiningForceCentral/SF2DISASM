
; ASM FILE code\gameflow\start\systeminit.asm :
; 0x200..0x2DE : System init functions

; =============== S U B R O U T I N E =======================================


SystemInit:
                
                bsr.s   InitVdp
                if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
                bsr.w   InitMapper
                endif
                bsr.w   InitZ80
                bsr.s   InitVdpData
                jmp     (InitGame).l

    ; End of function SystemInit


; =============== S U B R O U T I N E =======================================


InitVdp:
                
                move.w  #$3FFE,d0
                lea     (FF0000_RAM_START).l,a0
@ClearRam_Loop:
                
                clr.l   (a0)+           ; clear all RAM !
                dbf     d0,@ClearRam_Loop
                move.b  #3,((FADING_COUNTER_MAX-$1000000)).w
                clr.b   ((FADING_SETTING-$1000000)).w
                lea     vdp_init_params(pc), a0
                moveq   #$12,d1
@SetVdpReg_Loop:
                
                move.w  (a0)+,d0
                bsr.w   SetVdpReg
                dbf     d1,@SetVdpReg_Loop
                clr.w   d0
                clr.w   d1
                clr.w   d2
                bsr.w   ApplyVramDmaFill
                rts

    ; End of function InitVdp


; =============== S U B R O U T I N E =======================================


InitVdpData:
                
                move.l  #VDP_COMMAND_QUEUE,(VDP_COMMAND_QUEUE_POINTER).l
                move.l  #DMA_QUEUE,(DMA_QUEUE_POINTER).l
                moveq   #$40,d0 ; PD2 output mode ?
                move.b  d0,(CTRL1_BIS).l
                move.b  d0,(CTRL2).l
                move.b  d0,(CTRL3_BIS).l
                lea     (HORIZONTAL_SCROLL_DATA).l,a0
                move.w  #$FF,d0
loc_276:
                
                move.w  #0,(a0)+        ; clear from FFD100 to FFD500
                move.w  #0,(a0)+
                dbf     d0,loc_276      
                lea     (VERTICAL_SCROLL_DATA).l,a0
                move.w  #$13,d0
loc_28C:
                
                move.w  #0,(a0)+        ; clear next 80d bytes
                move.w  #0,(a0)+
                dbf     d0,loc_28C      
                lea     (PALETTE_1_BASE).l,a0
                moveq   #$7F,d1 
loc_2A0:
                
                clr.w   (a0)+           ; clear palette replicas ?
                dbf     d1,loc_2A0      
                bsr.w   ClearSpriteTable
                bsr.w   UpdateVdpHScrollData
                bsr.w   UpdateVdpVScrollData
                bsr.w   EnableDmaQueueProcessing
                rts

    ; End of function InitVdpData

vdp_init_params:dc.w $8004              ; disable H int, enable read H V counter
                dc.w $8124              ; disable display, enable Vint, disable DMA, V28 cell mode
                dc.w $8230              ; scroll A table VRAM address : C000
                dc.w $8338              ; window table VRAM address : E000
                dc.w $8407              ; scroll B table VRAM address : E000
                dc.w $8574              ; sprite attribute table VRAM address : E800
                dc.w $8600              ; always 0
                dc.w $8700              ; background color : plt 0, clr 0
                dc.w $8800              ; always 0
                dc.w $8900              ; always 0
                dc.w $8A00              ; Hint timing : 0
                dc.w $8B00              ; disable external interrupt, full scrolls
                dc.w $8C81              ; H40 cell mode, no interlace
                dc.w $8D3B              ; H Scroll table VRAM address : EC00
                dc.w $8E00              ; always 0
                dc.w $8F02              ; auto increment bias number : 2
                dc.w $9000              ; scroll size : V32 cell, H32 cell
                dc.w $9194              ; window is 20 cells from right
                dc.w $929C              ; window is 28 cells from bottom