
; ASM FILE code\gameflow\battle\battlescenes\tintscreen.asm :
; 0x1A028..0x1A2A6 : Battlescene engine

; =============== S U B R O U T I N E =======================================


StoreBattlespritePalette:
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   tint_None
                bsr.w   CopyPalettes

    ; End of function StoreBattlespritePalette


; =============== S U B R O U T I N E =======================================


TintScreen:
                
                module
                clr.w   d0
                move.b  ((CURRENT_SPELLANIMATION-$1000000)).w,d0
                add.w   d0,d0
                move.w  rjt_TintScreenFunctions(pc,d0.w),d0
                jsr     rjt_TintScreenFunctions(pc,d0.w)
                bra.w   @Continue

    ; End of function TintScreen

rjt_TintScreenFunctions:
                dc.w tint_None-rjt_TintScreenFunctions ; None
                dc.w tint_Red-rjt_TintScreenFunctions ; Blaze
                dc.w tint_Greyscale-rjt_TintScreenFunctions ; Freeze
                dc.w tint_Greyscale-rjt_TintScreenFunctions ; Desoul
                dc.w tint_None-rjt_TintScreenFunctions ; Healing Fairy
                dc.w tint_Dim-rjt_TintScreenFunctions ; Blast
                dc.w tint_None-rjt_TintScreenFunctions ; Detox
                dc.w tint_Dark-rjt_TintScreenFunctions ; Bolt
                dc.w tint_None-rjt_TintScreenFunctions ; Buff1
                dc.w tint_None-rjt_TintScreenFunctions ; Debuff1
                dc.w tint_None-rjt_TintScreenFunctions ; Magic Drain
                dc.w tint_Dim-rjt_TintScreenFunctions ; Demon Breath
                dc.w tint_Red-rjt_TintScreenFunctions ; Flame Breath
                dc.w tint_None-rjt_TintScreenFunctions ; Arrows and Spears
                dc.w tint_None-rjt_TintScreenFunctions ; Cannon Projectile
                dc.w tint_None-rjt_TintScreenFunctions ; Shot Projectile
                dc.w tint_None-rjt_TintScreenFunctions ; Gunner Projectile
                dc.w tint_None-rjt_TintScreenFunctions ; Dao
                dc.w tint_Apollo-rjt_TintScreenFunctions ; Apollo
                dc.w tint_None-rjt_TintScreenFunctions ; Neptun
                dc.w tint_None-rjt_TintScreenFunctions ; Atlas
                dc.w tint_Dark-rjt_TintScreenFunctions ; Prism Laser
                dc.w tint_None-rjt_TintScreenFunctions ; Bubble Breath
                dc.w tint_Greyscale-rjt_TintScreenFunctions ; Snowstorm
                dc.w tint_None-rjt_TintScreenFunctions ; Cutoff
                dc.w tint_None-rjt_TintScreenFunctions ; Buff2
                dc.w tint_None-rjt_TintScreenFunctions ; SFCD Attack
                dc.w tint_None-rjt_TintScreenFunctions ; Debuff2
                dc.w tint_None-rjt_TintScreenFunctions ; Debuff3
                dc.w tint_None-rjt_TintScreenFunctions ; PHNK Attack
                dc.w tint_None-rjt_TintScreenFunctions ; Burst Rock
                dc.w tint_None-rjt_TintScreenFunctions ; Odd Eye Beam

; START OF FUNCTION CHUNK FOR TintScreen

@Continue:
                
                jsr     (ApplyVIntCramDma).w
                jmp     (EnableDmaQueueProcessing).w

; END OF FUNCTION CHUNK FOR TintScreen

                modend

; =============== S U B R O U T I N E =======================================


tint_None:
                
                rts

    ; End of function tint_None


; =============== S U B R O U T I N E =======================================


sub_1A092:
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bne.s   @Continue
                
                jsr     (ApplyVIntCramDma).w
                jsr     (EnableDmaQueueProcessing).w
                bra.s   @Return
@Continue:
                
                bsr.w   sub_1A270
                bsr.s   TintScreen
@Return:
                
                rts

    ; End of function sub_1A092


; =============== S U B R O U T I N E =======================================


CopyPalettes:
                
                movem.l d7-a1,-(sp)
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                lea     ((PALETTE_1_BASE-$1000000)).w,a1
                moveq   #CRAM_LONGWORDS_COUNTER,d7
@Loop:
                
                move.l  (a0)+,(a1)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function CopyPalettes


; =============== S U B R O U T I N E =======================================

; unused duplicate of the function below


sub_1A0C4:
                
                movem.l a0-a1,-(sp)
                lea     ((PALETTE_3_CURRENT-$1000000)).w,a0
                lea     ((PALETTE_3_BASE-$1000000)).w,a1
                move.w  $12(a0),$12(a1) ; color 9
                move.l  $1A(a0),$1A(a1) ; color 13/14
                movem.l (sp)+,a0-a1
                rts

    ; End of function sub_1A0C4


; =============== S U B R O U T I N E =======================================

; Preserve UI palette entries #9, #13, and #14 when tinting the screen.


PreserveBasePaletteEntries:
                
                movem.l a0-a1,-(sp)
                lea     ((PALETTE_3_CURRENT-$1000000)).w,a0
                lea     ((PALETTE_3_BASE-$1000000)).w,a1
                move.w  $12(a1),$12(a0) ; color 9
                move.l  $1A(a1),$1A(a0) ; color 13/14
                movem.l (sp)+,a0-a1
                rts

    ; End of function PreserveBasePaletteEntries


; =============== S U B R O U T I N E =======================================

; Lower brightness of most elements on the screen to 50%.


ProduceDarkenedPalettes:
                
                movem.l d6-a0,-(sp)
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                moveq   #CRAM_COLORS_COUNTER,d7
@Loop:
                
                move.w  (a0),d6
                lsr.w   #1,d6
                andi.w  #HALF_COLOR_MASK,d6
                move.w  d6,(a0)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d6-a0
                rts

    ; End of function ProduceDarkenedPalettes


; =============== S U B R O U T I N E =======================================


tint_Dark:
                
                bsr.s   ProduceDarkenedPalettes
                bra.s   PreserveBasePaletteEntries

    ; End of function tint_Dark


; =============== S U B R O U T I N E =======================================

; Lower the brightness of most elements on the screen to 75%.


ProduceDimmedPalettes:
                
                movem.l d5-a0,-(sp)
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                moveq   #CRAM_COLORS_COUNTER,d7
@Loop:
                
                move.w  (a0),d6
                lsr.w   #1,d6
                move.w  d6,d5
                lsr.w   #1,d5
                andi.w  #QUARTER_COLOR_MASK,d5
                add.w   d5,d6
                move.w  d6,(a0)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d5-a0
                rts

    ; End of function ProduceDimmedPalettes


; =============== S U B R O U T I N E =======================================


tint_Dim:
                
                bsr.s   ProduceDimmedPalettes
                bra.s   PreserveBasePaletteEntries

    ; End of function tint_Dim


; =============== S U B R O U T I N E =======================================

; Produce a greyscale palette for most elements on the screen.


ProduceGreyscalePalettes:
                
                movem.l d0-d2/a0,-(sp)
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                moveq   #CRAM_COLORS_COUNTER,d2
@Loop:
                
                move.w  (a0),d0
                andi.w  #COLOR_R_CHANNEL_MASK,d0
                lsr.w   #1,d0
                move.w  (a0),d1
                andi.w  #COLOR_G_CHANNEL_MASK,d1
                lsr.w   #NIBBLE_SHIFT_COUNT,d1
                add.w   d1,d0
                move.w  (a0),d1
                andi.w  #COLOR_B_CHANNEL_MASK,d1
                lsr.w   #BYTE_SHIFT_COUNT,d1
                lsr.w   #2,d1
                add.w   d1,d0
                lsl.w   #1,d0
                ext.l   d0
                divu.w  #3,d0
                cmpi.w  #$E,d0
                bls.s   @Continue
                moveq   #$E,d0
@Continue:
                
                move.w  d0,d1
                lsl.w   #NIBBLE_SHIFT_COUNT,d1
                or.w    d1,d0
                lsl.w   #NIBBLE_SHIFT_COUNT,d1
                or.w    d1,d0
                move.w  d0,(a0)+
                dbf     d2,@Loop
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function ProduceGreyscalePalettes


; =============== S U B R O U T I N E =======================================


tint_Greyscale:
                
                bsr.s   ProduceGreyscalePalettes
                bra.w   PreserveBasePaletteEntries

    ; End of function tint_Greyscale


; =============== S U B R O U T I N E =======================================

; Tint the screen blue.


ProduceBlueMonochromePalettes:
                
                movem.l d0-d1/a0,-(sp)
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                moveq   #CRAM_COLORS_COUNTER,d7
@Loop:
                
                move.w  (a0),d0
                move.w  d0,d1
                andi.w  #COLOR_MASK_BLUE,d0  ; isolate blue component
                lsr.w   #1,d1                ; and halve the others
                andi.w  #(FULL_COLOR_MASK-COLOR_MASK_BLUE),d1 
                or.w    d1,d0
                move.w  d0,(a0)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ProduceBlueMonochromePalettes


; =============== S U B R O U T I N E =======================================

; unused


tint_Blue:
                
                bsr.s   ProduceBlueMonochromePalettes
                bra.w   PreserveBasePaletteEntries

    ; End of function tint_Blue


; =============== S U B R O U T I N E =======================================

; Tint the screen green.


ProduceGreenMonochromePalettes:
                
                movem.l d0-d1/a0,-(sp)
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                moveq   #CRAM_COLORS_COUNTER,d7
@Loop:
                
                move.w  (a0),d0
                move.w  d0,d1
                andi.w  #COLOR_MASK_GREEN,d0   ; isolate green component
                lsr.w   #1,d1                  ; and halve the others
                andi.w  #(FULL_COLOR_MASK-COLOR_MASK_GREEN),d1
                or.w    d1,d0
                move.w  d0,(a0)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ProduceGreenMonochromePalettes


; =============== S U B R O U T I N E =======================================

; unused


tint_Green:
                
                bsr.s   ProduceGreenMonochromePalettes
                bra.w   PreserveBasePaletteEntries

    ; End of function tint_Green


; =============== S U B R O U T I N E =======================================

; Tint the screen red.


ProduceRedMonochromePalettes:
                
                movem.l d0-d1/a0,-(sp)
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                moveq   #CRAM_COLORS_COUNTER,d7
@Loop:
                
                move.w  (a0),d0
                move.w  d0,d1
                andi.w  #COLOR_MASK_RED,d0  ; isolate red component
                lsr.w   #1,d1               ; and halve the others
                andi.w  #(FULL_COLOR_MASK-COLOR_MASK_RED),d1
                or.w    d1,d0
                move.w  d0,(a0)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ProduceRedMonochromePalettes


; =============== S U B R O U T I N E =======================================


tint_Red:
                
                bsr.s   ProduceRedMonochromePalettes
                bra.w   PreserveBasePaletteEntries

    ; End of function tint_Red


; =============== S U B R O U T I N E =======================================

; Tint parts of the screen red when invocating Apollo.


tint_Apollo:
                
                movem.l d0/a0-a1,-(sp)
                bsr.s   ProduceRedMonochromePalettes
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                lea     ((PALETTE_1_BASE-$1000000)).w,a1
                moveq   #CRAM_PALETTE_LONGWORDS_COUNTER,d0
@Palette1_Loop:
                
                move.l  (a1)+,(a0)+     ; restore palette 1
                dbf     d0,@Palette1_Loop
                
                lea     NEXT_PALETTE(a0),a0
                lea     NEXT_PALETTE(a1),a1
                moveq   #CRAM_PALETTE_LONGWORDS_COUNTER,d0
@Palette3_Loop:
                
                move.l  (a1)+,(a0)+     ; restore palette 3
                dbf     d0,@Palette3_Loop
                
                movem.l (sp)+,d0/a0-a1
                rts

    ; End of function tint_Apollo


; =============== S U B R O U T I N E =======================================


RestorePalettes:
                
                movem.l d7-a1,-(sp)
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                lea     ((PALETTE_1_BASE-$1000000)).w,a1
                moveq   #CRAM_LONGWORDS_COUNTER,d7
@Loop:
                
                move.l  (a1)+,(a0)+
                dbf     d7,@Loop
                
                jsr     (ApplyVIntCramDma).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d7-a1
                rts

    ; End of function RestorePalettes


; =============== S U B R O U T I N E =======================================


sub_1A270:
                
                movem.l d7-a1,-(sp)
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                lea     ((PALETTE_1_BASE-$1000000)).w,a1
                move.w  $52(a0),-(sp)   ; preserve UI palette entries #9, #13, and #14
                move.l  $5A(a0),-(sp)
                moveq   #CRAM_LONGWORDS_COUNTER,d7
@Loop:
                
                move.l  (a1)+,(a0)+
                dbf     d7,@Loop
                
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                move.l  (sp)+,$5A(a0)
                move.w  (sp)+,$52(a0)
                jsr     (ApplyVIntCramDma).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d7-a1
                rts

    ; End of function sub_1A270

