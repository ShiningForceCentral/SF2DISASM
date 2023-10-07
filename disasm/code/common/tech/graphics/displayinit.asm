
; ASM FILE code\common\tech\graphics\displayinit.asm :
; 0x3022..0x30BE : Display initialization

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
                lea     layout_BlackScreen(pc), a0
                lea     ($EF80).l,a1
                move.w  #$40,d0 
                moveq   #2,d1
                bsr.w   ApplyImmediateVramDma
                lea     sprite_Masks(pc), a0
                lea     (SPRITE_TABLE).l,a1
                moveq   #56,d7
                bsr.w   CopyBytes       
                lea     palette_Base(pc), a0
                lea     (PALETTE_3_BASE).l,a1
                move.w  #CRAM_PALETTE_SIZE,d7
                bsr.w   CopyBytes       
                rts

    ; End of function InitializeDisplay

palette_Base:   incbin "data/graphics/tech/basepalette.bin" ; Palette for UI and mapsprites
