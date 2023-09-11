
; ASM FILE code\common\tech\interrupts\unused_palettecopy.asm :
; 0xCC4..0xCD6 : Unused palette copy function

; =============== S U B R O U T I N E =======================================

; Unused palette copy


SetBasePalette1:
                
                lea     (PALETTE_1_BASE).l,a1
                move.w  #15,d0
@Loop:          move.w  (a0)+,(a1)+
                dbf     d0,@Loop
                rts

    ; End of function SetBasePalette1
