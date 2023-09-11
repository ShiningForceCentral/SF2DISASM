
; ASM FILE code\common\tech\graphics\displayinit.asm :
; 0x2F6A..0x31CC : Display initialization
tbl_BlackScreenLayout:
                dcb.b $80,$22
spr_MaskSprites:vdpSprite 128, V4|H1|1, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 160, V4|H1|2, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 192, V4|H1|3, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 224, V4|H1|4, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 256, V4|H1|5, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 288, V4|H1|6, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 320, V4|H1|7, 1916|PALETTE3|PRIORITY, 128

; =============== S U B R O U T I N E =======================================


InitializeDisplay:
                
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
                lea     tbl_BlackScreenLayout(pc), a0
                lea     ($EF80).l,a1
                move.w  #$40,d0 
                moveq   #2,d1
                bsr.w   ApplyImmediateVramDma
                lea     spr_MaskSprites(pc), a0
                lea     (SPRITE_TABLE).l,a1
                moveq   #56,d7
                bsr.w   CopyBytes       
                lea     plt_Base(pc), a0
                lea     (PALETTE_3_BASE).l,a1
                move.w  #CRAM_PALETTE_SIZE,d7
                bsr.w   CopyBytes       
                rts

    ; End of function InitializeDisplay

plt_Base:       incbin "data/graphics/tech/basepalette.bin" ; Palette for UI and mapsprites
