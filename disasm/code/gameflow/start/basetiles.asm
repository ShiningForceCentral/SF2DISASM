
; ASM FILE code\gameflow\start\basetiles.asm :
; 0x764E..0x769C : Base tiles loading

; =============== S U B R O U T I N E =======================================


LoadBaseTiles:
                
                bsr.w   DisableDisplayAndInterrupts
                bsr.w   ClearVsramAndSprites
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
            if (STANDARD_BUILD=1)
                bsr.w   SetVdpReg
            else
                jsr     (SetVdpReg).w
            endif
                getPointer p_tiles_Base, a0
                lea     (0).w,a1
                move.w  #4096,d0
                moveq   #2,d1
            if (STANDARD_BUILD=1)
                bra.w   ApplyImmediateVramDmaOnCompressedTiles
            else
                bsr.w   ApplyImmediateVramDmaOnCompressedTiles ; load base tiles
                rts
            endif

    ; End of function LoadBaseTiles

