
; ASM FILE code\common\tech\graphics\display.asm :
; 0x2F6A..0x31CC : Display function
BlackScreenLayout:
                dcb.b $80,$22
MaskSprites:    dc.l $800301
                dc.l $C77C0080
                dc.l $A00302
                dc.l $C77C0080
                dc.l $C00303
                dc.l $C77C0080
                dc.l $E00304
                dc.l $C77C0080
                dc.l $1000305
                dc.l $C77C0080
                dc.l $1200306
                dc.l $C77C0080
                dc.l $1400307
                dc.l $C77C0080

; =============== S U B R O U T I N E =======================================


InitDisplay:
                
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE   ; clear all triggers
                dc.l 0
                bsr.w   WaitForVInt
                bsr.w   DisableDisplayAndInterrupts
                bsr.w   ClearSpriteTable
                move.w  #$8C00,d0       ; H32 cell mode, no interlace
                bsr.w   SetVdpReg
                move.w  #$9000,d0       ; scroll size : V32 cell, H32 cell
                bsr.w   SetVdpReg
                move.w  #$8230,d0       ; scroll A table VRAM address : C000
                bsr.w   SetVdpReg
                move.w  #$8407,d0       ; scroll B table VRAM address : E000
                bsr.w   SetVdpReg
                move.w  #$8B00,d0       ; disable external interrupt, full scrolls
                bsr.w   SetVdpReg
                move.w  #$8D3B,d0       ; H Scroll table VRAM address : EC00
                bsr.w   SetVdpReg
                lea     BlackScreenLayout(pc), a0
                lea     ($EF80).l,a1
                move.w  #$40,d0 
                moveq   #2,d1
                bsr.w   ApplyImmediateVramDma
                lea     MaskSprites(pc), a0
                lea     (SPRITE_TABLE).l,a1
                moveq   #$38,d7 
                bsr.w   CopyBytes       
                lea     plt_BasePalette(pc), a0
                lea     (PALETTE_3_BASE).l,a1
                move.w  #$20,d7 
                bsr.w   CopyBytes       
                rts

    ; End of function InitDisplay

plt_BasePalette:incbin "data/graphics/tech/basepalette.bin" ; Palette for UI/Sprites

; =============== S U B R O U T I N E =======================================


sub_30BE:
                
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bra.w   WaitForDmaQueueProcessing

    ; End of function sub_30BE


; =============== S U B R O U T I N E =======================================


sub_30EE:
                
                movem.l a0-a5,-(sp)
                movem.w d0-d5/d7,-(sp)
                neg.w   d2
                andi.w  #$FF,d2
                lsr.w   #3,d2
                add.w   d2,d2
                subq.w  #8,d3
                andi.w  #$FF,d3
                lsr.w   #3,d3
                add.w   d5,d3
                add.w   d3,d3
                lsl.w   #5,d3
                andi.w  #$7FE,d3
                adda.w  d3,a1
                move.w  d2,d3
                moveq   #$20,d7 
                lsr.w   #3,d0
                lsr.w   #3,d1
                lea     MapOffsetHashTable(pc), a3
                lea     (FF0000_RAM_START).l,a4
                lea     (FF2000_LOADING_SPACE).l,a5
loc_312C:
                
                bsr.w   sub_364E
                move.w  d2,(a1,d3.w)
                addq.w  #2,d3
                bclr    #6,d3
                addq.w  #1,d0
                dbf     d7,loc_312C
                movea.l a1,a0
                moveq   #$20,d0 
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.w (sp)+,d0-d5/d7
                movem.l (sp)+,a0-a5
                rts

    ; End of function sub_30EE


; =============== S U B R O U T I N E =======================================


sub_3158:
                
                movem.l a0-a5,-(sp)
                movem.w d0-d5/d7,-(sp)
                neg.w   d2
                andi.w  #$FF,d2
                lsr.w   #3,d2
                add.w   d4,d2
                add.w   d2,d2
                andi.w  #$3E,d2 
                adda.w  d2,a1
                subq.w  #8,d3
                andi.w  #$FF,d3
                lsr.w   #3,d3
                add.w   d3,d3
                move.w  d3,d5
                lsl.w   #5,d3
                moveq   #$20,d7 
                lsr.w   #3,d0
                lsr.w   #3,d1
                lea     MapOffsetHashTable(pc), a3
                lea     (FF0000_RAM_START).l,a4
                lea     (FF2000_LOADING_SPACE).l,a5
loc_3196:
                
                bsr.w   sub_364E
                move.w  d2,(a1,d3.w)
                addi.w  #$40,d3 
                bclr    #$B,d3
                move.w  d2,(a2,d5.w)
                addq.w  #2,d5
                bclr    #6,d5
                addq.w  #1,d1
                dbf     d7,loc_3196
                movea.l a2,a0
                moveq   #$20,d0 
                moveq   #$40,d1 
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.w (sp)+,d0-d5/d7
                movem.l (sp)+,a0-a5
