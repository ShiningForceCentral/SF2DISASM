
; ASM FILE code\gameflow\battle\battlescenes\battlesceneengine_0.asm :
; 0x1A028..0x1A47A : Battlescene engine

; =============== S U B R O U T I N E =======================================


sub_1A028:
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   tint_None
                bsr.w   CopyPalettes

    ; End of function sub_1A028


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
                move.w  $12(a0),$12(a1)
                move.l  $1A(a0),$1A(a1)
                movem.l (sp)+,a0-a1
                rts

    ; End of function sub_1A0C4


; =============== S U B R O U T I N E =======================================

; Preserve UI palette entries #9, #13, and #14 when tinting the screen.


PreserveBasePaletteEntries:
                
                movem.l a0-a1,-(sp)
                lea     ((PALETTE_3_CURRENT-$1000000)).w,a0
                lea     ((PALETTE_3_BASE-$1000000)).w,a1
                move.w  $12(a1),$12(a0)
                move.l  $1A(a1),$1A(a0)
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
                andi.w  #$777,d6
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
                andi.w  #$333,d5
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
                andi.w  #$E00,d0        ; isolate blue component
                lsr.w   #1,d1           ; and halve the others
                andi.w  #$EE,d1 
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
                andi.w  #$E0,d0 ; isolate green component
                lsr.w   #1,d1           ; and halve the others
                andi.w  #$E0E,d1
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
                andi.w  #$E,d0          ; isolate red component
                lsr.w   #1,d1           ; and halve the others
                andi.w  #$EE0,d1
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
                moveq   #7,d0
@Palette1_Loop:
                
                move.l  (a1)+,(a0)+     ; restore palette 1
                dbf     d0,@Palette1_Loop
                
                lea     NEXT_PALETTE(a0),a0
                lea     NEXT_PALETTE(a1),a1
                moveq   #7,d0
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


; =============== S U B R O U T I N E =======================================

; In: d0.w = color to flash


ExecuteSpellcastFlashEffect:
                
                move.w  d0,d6
                moveq   #3,d7
@Loop:
                
                move.w  d6,((PALETTE_1_CURRENT-$1000000)).w
                move.w  d6,((PALETTE_3_CURRENT_02-$1000000)).w
                jsr     (ApplyVIntCramDma).w
                moveq   #4,d0
                jsr     (Sleep).w       
                clr.w   ((PALETTE_1_CURRENT-$1000000)).w
                clr.w   ((PALETTE_3_CURRENT_02-$1000000)).w
                jsr     (ApplyVIntCramDma).w
                moveq   #3,d0
                jsr     (Sleep).w       
                dbf     d7,@Loop
                
                rts

    ; End of function ExecuteSpellcastFlashEffect


; =============== S U B R O U T I N E =======================================

;     Clears a portion at RAM:b406 and RAM:b532 for spell properties.


ClearSpellanimationProperties:
                
                movem.l d7-a0,-(sp)
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a0
                moveq   #74,d7
@Loop1:
                
                clr.l   (a0)+
                dbf     d7,@Loop1
                
                lea     ((byte_FFB532-$1000000)).w,a0
                moveq   #3,d7
@Loop2:
                
                clr.l   (a0)+
                dbf     d7,@Loop2
                
                movem.l (sp)+,d7-a0
                rts

    ; End of function ClearSpellanimationProperties


; =============== S U B R O U T I N E =======================================

; Out: d0.w


sub_1A2F6:
                
                movem.l d6-d7,-(sp)
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a0
                clr.w   d6
                moveq   #$18,d7
loc_1A302:
                
                tst.w   (a0)
                bne.s   loc_1A316
                move.w  d0,(a0)
                clr.l   2(a0)
                clr.l   6(a0)
                clr.w   $A(a0)
                bra.s   loc_1A324
loc_1A316:
                
                lea     $C(a0),a0
                addq.w  #1,d6
                dbf     d7,loc_1A302
                move.w  #-1,d6
loc_1A324:
                
                move.w  d6,d0
                movem.l (sp)+,d6-d7
                rts

    ; End of function sub_1A2F6


; =============== S U B R O U T I N E =======================================

; code for invocations


LoadInvocationSpell:
                
                movem.l d0/a6,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #INVOCATION_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,((BATTLESCENE_ALLY_COPY-$1000000)).w
                lea     ((word_FFB562-$1000000)).w,a6
                move.w  #-1,(a6)
                clr.w   2(a6)
                bsr.w   bsc07_switchAllies
                movem.l (sp)+,d0/a6
                jsr     (WaitForVInt).w
                clr.w   d1
                bsr.w   LoadInvocationSpriteFrameToVram
                moveq   #8,d0
                jsr     (Sleep).w       
                bchg    #6,((byte_FFB56E-$1000000)).w
                jsr     (ApplyVIntCramDma).w
                bsr.w   LoadInvocationSprite
                jsr     (WaitForDmaQueueProcessing).w
                bset    #4,((byte_FFB56F-$1000000)).w
                rts

    ; End of function LoadInvocationSpell


; =============== S U B R O U T I N E =======================================


LoadInvocationSprite:
                
                lea     ((SPRITE_20-$1000000)).w,a1
                tst.w   VDPSPRITE_OFFSET_TILE(a0)
                bne.s   loc_1A39C
                bclr    #5,((byte_FFB56F-$1000000)).w
                moveq   #5,d1
                moveq   #2,d4
                lea     (table_1F776).l,a2
                bra.s   loc_1A3AC
loc_1A39C:
                
                bset    #5,((byte_FFB56F-$1000000)).w
                moveq   #3,d1
                moveq   #3,d4
                lea     (table_1F7BE).l,a2
loc_1A3AC:
                
                btst    #6,((byte_FFB56E-$1000000)).w
                beq.s   loc_1A3B8
                lea     $24(a2),a2
loc_1A3B8:
                
                lea     (byte_FFAFB4).l,a3
                move.w  (a0),d0
loc_1A3C0:
                
                move.w  2(a0),d2
                move.w  d4,d3
loc_1A3C6:
                
                move.w  d2,(a1)+     ; move y
                move.w  #$F00,(a1)+  ; move V4|H4|0
                move.w  (a2)+,(a1)+  ; move tile
                move.w  d0,(a1)+     ; move x
                move.b  #2,(a3)+
                addi.w  #$20,d2 
                dbf     d3,loc_1A3C6
                
                addi.w  #$20,d0 
                dbf     d1,loc_1A3C0
                
                jmp     (sub_1942).w    

    ; End of function LoadInvocationSprite


; =============== S U B R O U T I N E =======================================


sub_1A3E8:
                
                lea     ((SPRITE_20_VDPTILE-$1000000)).w,a0
                lea     (table_1F776).l,a1
                moveq   #$11,d0
                btst    #5,((byte_FFB56F-$1000000)).w
                beq.s   loc_1A402
                lea     $48(a1),a1
                moveq   #$F,d0
loc_1A402:
                
                btst    #6,((byte_FFB56E-$1000000)).w
                beq.s   loc_1A40E
                lea     $24(a1),a1
loc_1A40E:
                
                move.w  (a1)+,(a0)
                addq.w  #8,a0
                dbf     d0,loc_1A40E
                rts

    ; End of function sub_1A3E8


; START OF FUNCTION CHUNK FOR bsc05_makeAllyIdle

loc_1A418:
                
                btst    #4,((byte_FFB56F-$1000000)).w
                beq.s   return_1A474
                bsr.w   bsc0D_endAnimation
                move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #1,((FADING_PALETTE_BITFIELD-$1000000)).w
loc_1A43E:
                
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   loc_1A43E
                lea     ((SPRITE_20-$1000000)).w,a0
                moveq   #17,d0
loc_1A44A:
                
                move.w  #1,(a0)+
                clr.l   (a0)+
                move.w  #1,(a0)+
                dbf     d0,loc_1A44A
                
                move.l  a6,-(sp)
                lea     ((word_FFB562-$1000000)).w,a6
                move.w  ((BATTLESCENE_ALLY_COPY-$1000000)).w,(a6)
                move.w  #3,2(a6)
                bsr.w   bsc07_switchAllies
                movea.l (sp)+,a6
                bclr    #4,((byte_FFB56F-$1000000)).w
return_1A474:
                
                rts

; END OF FUNCTION CHUNK FOR bsc05_makeAllyIdle


; =============== S U B R O U T I N E =======================================


nullsub_1A476:
                
                rts

    ; End of function nullsub_1A476


; =============== S U B R O U T I N E =======================================


spellanimationSetup_Nothing:
                
                rts

    ; End of function spellanimationSetup_Nothing

