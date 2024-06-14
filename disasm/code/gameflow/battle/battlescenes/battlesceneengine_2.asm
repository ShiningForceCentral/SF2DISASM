
; ASM FILE code\gameflow\battle\battlescenes\battlesceneengine_2.asm :
; 0x19E6E..0x1F806 : Battlescene engine

; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
; Out: d1.w = battlescene ground index (-1 if skipped)


GetBattlesceneGround:
                
                cmpi.w  #COMBATANT_ENEMIES_START,d0
                bcc.w   @Skip           ; skip if enemy
                jsr     j_GetMoveType
                cmpi.w  #MOVETYPE_LOWER_FLYING,d1
                beq.w   @Skip           ; skip if ally is flying or hovering
                cmpi.w  #MOVETYPE_LOWER_HOVERING,d1
                beq.w   @Skip
                bra.w   GetBattlesceneBackground
@Skip:
                
                move.w  #-1,d1
                rts

    ; End of function GetBattlesceneGround


; =============== S U B R O U T I N E =======================================

; Get a boolean depending on background index


sub_19E96:
                
                movem.l a0,-(sp)
                lea     table_BackgroundEnemySwitch(pc), a0
                tst.b   (a0,d0.w)
                beq.s   loc_19EA8
                ori     #1,ccr
loc_19EA8:
                
                movem.l (sp)+,a0
                rts

    ; End of function sub_19E96


; =============== S U B R O U T I N E =======================================


FadeInFromBlackIntoBattlescene:
                
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                rts

    ; End of function FadeInFromBlackIntoBattlescene


; =============== S U B R O U T I N E =======================================


FadeOutToBlackForBattlescene:
                
                move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                rts

    ; End of function FadeOutToBlackForBattlescene


; =============== S U B R O U T I N E =======================================

; In: d0.w = spellanimation entry


SetupSpellanimation:
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bne.w   return_19F5C
                cmpi.b  #-1,d0
                beq.w   return_19F5C
                
                move.w  d0,d1
                lsr.w   #SPELLANIMATION_BITS_VARIANT,d1
                andi.w  #SPELLANIMATION_VARIANT_MASK,d1
                addq.w  #1,d1
                btst    #SPELLANIMATION_BIT_MIRRORED,d0
                beq.s   @SkipMirror
                bset    #SPELLANIMATION_BIT_MIRRORED,d1
@SkipMirror:
                
                move.b  d1,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                andi.w  #SPELLANIMATION_MASK_INDEX,d0
                add.w   d0,d0
                move.w  rjt_SpellanimationSetups(pc,d0.w),d0
                jmp     rjt_SpellanimationSetups(pc,d0.w)
rjt_SpellanimationSetups:
                
                dc.w spellanimationSetup_Nothing-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Blaze-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Freeze-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Desoul-rjt_SpellanimationSetups
                dc.w spellanimationSetup_HealingFairy-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Blast-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Detox-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Bolt-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Buff1-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Debuff1-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Absorb-rjt_SpellanimationSetups
                dc.w spellanimationSetup_DemonBreath-rjt_SpellanimationSetups
                dc.w spellanimationSetup_FlameBreath-rjt_SpellanimationSetups
                dc.w spellanimationSetup_ArrowsAndSpears-rjt_SpellanimationSetups
                dc.w spellanimationSetup_CannonProjectile-rjt_SpellanimationSetups
                dc.w spellanimationSetup_ShotProjectile-rjt_SpellanimationSetups
                dc.w spellanimationSetup_GunnerProjectile-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Dao-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Apollo-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Neptun-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Atlas-rjt_SpellanimationSetups
                dc.w spellanimationSetup_PrismLaser-rjt_SpellanimationSetups
                dc.w spellanimationSetup_BubbleBreath-rjt_SpellanimationSetups
                dc.w spellanimationSetup_SnowBreath-rjt_SpellanimationSetups
                dc.w spellanimationSetup_CutOff-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Buff2-rjt_SpellanimationSetups
                dc.w spellanimationSetup_AttackSpell-rjt_SpellanimationSetups 
                                                        ; SFCD's ATTACK spell (unused)
                dc.w spellanimationSetup_Debuff2-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Debuff3-rjt_SpellanimationSetups
                dc.w spellanimationSetup_PhoenixAttack-rjt_SpellanimationSetups
                dc.w spellanimationSetup_BurstRockExplosion-rjt_SpellanimationSetups
                dc.w spellanimationSetup_OddEyeBeam-rjt_SpellanimationSetups
return_19F5C:
                
                rts

    ; End of function SetupSpellanimation


; =============== S U B R O U T I N E =======================================


sub_19F5E:
                
                movem.l d1/a1,-(sp)
                lea     (byte_FFAFA0).l,a1
                move.b  7(a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                move.b  d1,(a1,d0.w)
                lea     ((SPRITE_TABLE-$1000000)).w,a1
                move.w  d0,d1
                lsl.w   #3,d1
                adda.w  d1,a1
                move.w  2(a0),(a1)+
                clr.w   d1
                move.b  6(a0),d1
                lsl.w   #BYTE_SHIFT_COUNT,d1
                move.w  d1,(a1)+
                move.b  7(a0),d1
                andi.w  #3,d1
                ror.w   #5,d1
                or.w    4(a0),d1
                ori.w   #$C000,d1
                move.w  d1,(a1)+
                move.w  (a0),(a1)
                movem.l (sp)+,d1/a1
                addq.w  #8,a0
                addq.w  #1,d0
                rts

    ; End of function sub_19F5E


; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to spellanimation data


sub_19FAA:
                
                movem.l d0-d3/a1-a2,-(sp)
                subq.w  #1,d1
                addi.w  #$80,d2 
                addi.w  #$80,d3 
                lea     (byte_FFAFA0).l,a2
                adda.w  d0,a2
                lsl.w   #3,d0
                lea     ((SPRITE_TABLE-$1000000)).w,a1
                adda.w  d0,a1
loc_19FC8:
                
                move.w  2(a0),d0
                add.w   d3,d0
                move.w  d0,(a1)+
                clr.w   d0
                move.b  6(a0),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,(a1)+
                move.b  7(a0),d0
                andi.w  #3,d0
                ror.w   #5,d0
                or.w    4(a0),d0
                ori.w   #$C000,d0
                move.w  d0,(a1)+
                move.w  (a0),d0
                add.w   d2,d0
                move.w  d0,(a1)+
                move.b  7(a0),d0
                lsr.b   #NIBBLE_SHIFT_COUNT,d0
                move.b  d0,(a2)+
                addq.w  #8,a0
                dbf     d1,loc_19FC8
                
                movem.l (sp)+,d0-d3/a1-a2
                add.w   d1,d0
                rts

    ; End of function sub_19FAA


; =============== S U B R O U T I N E =======================================


sub_1A00A:
                
                moveq   #38,d0
                moveq   #25,d7
loc_1A00E:
                
                lea     table_1A020(pc), a0
                nop
                bsr.w   sub_19F5E
                dbf     d7,loc_1A00E
                
                jmp     (sub_1942).w    

    ; End of function sub_1A00A

table_1A020:    dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0

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
                tst.w   4(a0)
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
                
                move.w  d2,(a1)+
                move.w  #$F00,(a1)+
                move.w  (a2)+,(a1)+
                move.w  d0,(a1)+
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


; =============== S U B R O U T I N E =======================================


spellanimationSetup_Blaze:
                
                bsr.s   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BLAZE_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_BLAZE,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                btst    #SPELLANIMATION_BIT_MIRRORED,d1
                bne.s   @Mirrored
                lea     loc_1A58A(pc), a1
                bra.s   @Continue
@Mirrored:
                
                lea     table_1A5B2(pc), a1
@Continue:
                
                andi.w  #7,d1
                add.w   d1,d1
                move.w  d1,d2
                lsl.w   #2,d1
                add.w   d2,d1
                adda.w  d1,a1
                move.l  (a1),((byte_FFB532-$1000000)).w
                move.l  4(a1),((dword_FFB536-$1000000)).w
                move.w  8(a1),((byte_FFB53A-$1000000)).w
                clr.w   d2
                move.b  1(a1),d2
                clr.w   d3
                move.b  2(a1),d3
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #5,2(a0)
                moveq   #2,d0
                bsr.w   sub_1A2F6       
                lea     table_1A5E4(pc), a0
                clr.w   d0
                move.b  (a1),d0
                lsl.w   #NIBBLE_SHIFT_COUNT,d0
                adda.w  d0,a0
                moveq   #$26,d0 
                moveq   #2,d1
                bsr.w   sub_19FAA
                clr.w   d1
                move.b  5(a1),d1
                beq.s   loc_1A52A
                subq.w  #1,d1
@Loop:
                
                moveq   #$F,d6
                jsr     (GenerateRandomNumber).w
                move.w  d7,d0
                andi.w  #1,d0
                addq.w  #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$10,d6
                jsr     (GenerateRandomNumber).w
                move.w  d1,d4
                lsl.w   #3,d4
                add.w   d4,d7
                addq.w  #1,d7
                move.b  d7,3(a0)
                dbf     d1,@Loop
loc_1A52A:
                
                btst    #2,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1A56E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$40,2(a0) 
                move.w  #$40,4(a0) 
                move.w  #$80,6(a0) 
                moveq   #$1F,d0
                lea     ((byte_FFB496-$1000000)).w,a0
loc_1A552:
                
                move.w  d2,(a0)
                addi.w  #$80,(a0)+ 
                move.w  d3,(a0)
                addi.w  #$80,(a0)+ 
                dbf     d0,loc_1A552
                moveq   #$2C,d0 
                moveq   #8,d1
                lea     table_1A614(pc), a0
                bsr.w   sub_19FAA       
loc_1A56E:
                
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BLAZE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  5(a1),d0
                addq.b  #1,d0
                move.b  d0,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1A58A:
                
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Blaze

table_1A594:    dc.b 0
                dc.b $48
                dc.b $70
                dc.b $70
                dc.b 0
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b $44
                dc.b $60
                dc.b $80
                dc.b 0
                dc.b $A
                dc.b $50
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b $40
                dc.b $50
                dc.b $70
                dc.b 1
                dc.b $E
                dc.b $50
                dc.b 0
                dc.b 0
                dc.b 0
table_1A5B2:    dc.b 2
                dc.b $40
                dc.b $50
                dc.b $70
                dc.b 1
                dc.b 4
                dc.b $50
                dc.b $20
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b $B0
                dc.b $80
                dc.b $80
                dc.b 0
                dc.b 0
                dc.b $30
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b $AC
                dc.b $70
                dc.b $90
                dc.b 0
                dc.b $A
                dc.b $30
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b $A8
                dc.b $60
                dc.b $80
                dc.b 1
                dc.b $E
                dc.b $30
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b $A8
                dc.b $60
                dc.b $80
                dc.b 1
                dc.b 4
                dc.b $30
                dc.b $80
                dc.b $20
                dc.b 0
table_1A5E4:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $41
                dc.b 7
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $41
                dc.b 7
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $51
                dc.b $B
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $5D
                dc.b 9
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $75
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $85
                dc.b $F
                dc.b $20
table_1A614:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $31
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $24
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $20
                dc.b 5
                dc.b $20

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Freeze:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #FREEZE_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_FREEZE,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     (loc_1A6CC+2)(pc), a0 ; need to fix that ugly offset reference with the true data begin label
                bclr    #7,d1
                beq.s   loc_1A680
                lea     $30(a0),a0
loc_1A680:
                
                lsl.w   #2,d1
                move.w  d1,d0
                lsl.w   #1,d1
                add.w   d0,d1
                adda.w  d1,a0
                lea     ((byte_FFB532-$1000000)).w,a1
                move.b  #1,$E(a1)
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0),(a1)
                moveq   #1,d1
                btst    #2,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1A6B4
                moveq   #$14,d0
                bsr.w   sub_1A2F6       
                move.b  #2,(byte_FFAFC6).l
                addq.w  #1,d1
loc_1A6B4:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_FREEZE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
loc_1A6CC:
                
                move.b  d1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Freeze

                dc.b 1
                dc.b $70
                dc.b 0
                dc.b $9E
                dc.b $10
                dc.b 0
                dc.b 0
                dc.b $A0
                dc.b $FF
                dc.b $FA
                dc.b 0
                dc.b $C8
                dc.b 1
                dc.b $70
                dc.b 0
                dc.b $9E
                dc.b $16
                dc.b 0
                dc.b 0
                dc.b $C0
                dc.b $FF
                dc.b $FA
                dc.b 0
                dc.b $C8
                dc.b 1
                dc.b $70
                dc.b 0
                dc.b $9E
                dc.b $1C
                dc.b 0
                dc.b 0
                dc.b $E0
                dc.b $FF
                dc.b $FA
                dc.b 0
                dc.b $C8
                dc.b 1
                dc.b $70
                dc.b 0
                dc.b $9E
                dc.b $22
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b $FF
                dc.b $FA
                dc.b 0
                dc.b $C8
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $E2
                dc.b $10
                dc.b 0
                dc.b 0
                dc.b $A0
                dc.b 1
                dc.b 6
                dc.b 1
                dc.b $38
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $E2
                dc.b $16
                dc.b 0
                dc.b 0
                dc.b $C0
                dc.b 1
                dc.b 6
                dc.b 1
                dc.b $38
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $E2
                dc.b $1C
                dc.b 0
                dc.b 0
                dc.b $E0
                dc.b 1
                dc.b 6
                dc.b 1
                dc.b $38
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $E2
                dc.b $22
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 6
                dc.b 1
                dc.b $38

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Desoul:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #DESOUL_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                bsr.w   sub_1A00A
                moveq   #SPELLGRAPHICS_DESOUL,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     ((byte_FFB532-$1000000)).w,a0
                bclr    #7,d1
                bne.s   loc_1A778
                move.w  #$C0,(a0) 
                move.w  #$98,2(a0) 
                move.w  #$80,d2 
                moveq   #2,d3
                bra.s   loc_1A786
loc_1A778:
                
                move.w  #$110,(a0)
                move.w  #$A8,2(a0) 
                clr.w   d2
                clr.b   d3
loc_1A786:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  d2,2(a0)
                move.w  #$8000,4(a0)
                move.b  d3,6(a0)
                moveq   #1,d2
                cmpi.b  #2,d1
                bcs.s   loc_1A7E2
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$20,2(a0) 
                move.w  #$1E,4(a0)
                move.w  #3,6(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$20,2(a0) 
                move.w  #$14,4(a0)
                move.w  #$301,6(a0)
                moveq   #$2A,d0 
                lea     table_1A810(pc), a0
                bsr.w   sub_19F5E
                bsr.w   sub_19F5E
                addq.w  #2,d2
loc_1A7E2:
                
                move.l  #table_DesoulBackgroundModification,((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.b  #5,((byte_FFB583-$1000000)).w
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DESOUL,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  d2,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Desoul

table_1A810:    dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 5
                dc.b $80
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 5
                dc.b $84
                dc.b 5
                dc.b $21
table_DesoulBackgroundModification:
                dc.b 0
                dc.b $38
                dc.b $10
                dc.b $60
                dc.b 0
                dc.b 1
                dc.b $A8
                dc.b $28
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FD
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FB
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FB
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FD
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b 0

; =============== S U B R O U T I N E =======================================


spellanimationSetup_HealingFairy:
                
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #HEALING_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_HEALING,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                bclr    #7,d1
                bne.s   loc_1A874
                lea     table_1A908(pc), a0
                lea     table_1A8F4(pc), a1
                moveq   #7,d4
                bra.s   loc_1A87E
loc_1A874:
                
                lea     table_1A918(pc), a0
                lea     table_1A8FE(pc), a1
                moveq   #3,d4
loc_1A87E:
                
                lea     ((byte_FFB532-$1000000)).w,a2
                move.l  (a1)+,(a2)+
                move.l  (a1)+,(a2)+
                move.w  (a1),(a2)+
                subq.w  #1,d1
                bne.s   loc_1A88E
                moveq   #1,d1
loc_1A88E:
                
                move.w  d1,(a2)
                move.b  d1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                subq.w  #1,d1
                moveq   #$26,d0 
loc_1A898:
                
                movem.l d0-d1/a0,-(sp)
                moveq   #2,d1
                clr.w   d2
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                move.w  d7,d3
                bsr.w   sub_19FAA
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  d4,2(a0)
                moveq   #$1E,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,8(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #$C,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,4(a0)
                movem.l (sp)+,d0-d1/a0
                addq.w  #2,d0
                dbf     d1,loc_1A898
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_HEALING_FAIRY,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_HealingFairy

table_1A8F4:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $28
                dc.b 0
                dc.b $34
table_1A8FE:    dc.b 0
                dc.b $35
                dc.b 0
                dc.b $45
                dc.b 0
                dc.b $55
                dc.b 0
                dc.b $5D
                dc.b 0
                dc.b $69
table_1A908:    dc.b 1
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $30
                dc.b $F
                dc.b $20
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $40
                dc.b $D
                dc.b $20
table_1A918:    dc.b $FF
                dc.b $E0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $65
                dc.b $F
                dc.b $21
                dc.b $FF
                dc.b $E0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $75
                dc.b $D
                dc.b $21

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Blast:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BLAST_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_BLAST,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     ((byte_FFB532-$1000000)).w,a2
                bclr    #7,d1
                bne.s   loc_1A96E
                move.w  #$D0,(a2) 
                move.w  #$E0,2(a2) 
                cmpi.w  #3,d1
                bcs.s   loc_1A96C
                move.w  #$40,d2 
                move.w  d2,4(a2)
                move.w  #$50,d3 
loc_1A96C:
                
                bra.s   loc_1A98A
loc_1A96E:
                
                move.w  #$138,(a2)
                move.w  #$F0,2(a2) 
                cmpi.w  #3,d1
                bcs.s   loc_1A98A
                move.w  #$A8,d2 
                move.w  d2,4(a2)
                move.w  #$60,d3 
loc_1A98A:
                
                btst    #0,d1
                bne.s   loc_1A996
                move.w  #1,6(a2)
loc_1A996:
                
                moveq   #7,d1
                lea     (byte_FFAFC6).l,a1
loc_1A99E:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.b  d7,2(a0)
                move.b  #2,(a1)+
                dbf     d1,loc_1A99E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$301,2(a0)
                move.b  #2,(byte_FFAFCE).l
                tst.w   4(a2)
                beq.s   loc_1AA06
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.b  #1,3(a0)
                move.w  d3,4(a0)
                addi.w  #$B4,4(a0) 
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.b  #2,3(a0)
                move.b  #$1E,4(a0)
                moveq   #$2F,d0 
                moveq   #3,d1
                lea     table_1AA28(pc), a0
                bsr.w   sub_19FAA       
loc_1AA06:
                
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BLAST,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Blast

table_1AA28:    dc.b 0
                dc.b 8
                dc.b 0
                dc.b $30
                dc.b 5
                dc.b $AB
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $4B
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $5B
                dc.b $F
                dc.b $20

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Detox:
                
                 
                sndCom  SFX_SPELL_CAST
                move.w  #DETOX_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_DETOX,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #1,4(a0)
                lea     table_1AA88(pc), a0
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DETOX,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Detox

table_1AA88:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $3B
                dc.b 0
                dc.b $20

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Bolt:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BOLT_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_BOLT,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     loc_1AB4A(pc), a1
                andi.w  #7,d1
                lsl.w   #2,d1
                adda.w  d1,a1
                move.l  (a1),((byte_FFB532-$1000000)).w
                moveq   #$10,d0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1AACC
                addi.w  #$80,d0 
loc_1AACC:
                
                move.w  d0,((dword_FFB536-$1000000)).w
                move.w  (a1),d1
                subq.w  #1,d1
loc_1AAD4:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,4(a0)
                dbf     d1,loc_1AAD4
                move.w  2(a1),d1
                beq.s   loc_1AB2C
                subq.w  #1,d1
                move.w  (a1),d0
                mulu.w  #5,d0
                addi.w  #$26,d0 
                lea     table_1AB5E(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1AB0C
                lea     $20(a0),a0
loc_1AB0C:
                
                movem.l d0/a0,-(sp)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                move.w  d7,2(a0)
                movem.l (sp)+,d0/a0
                bsr.w   sub_19F5E
                dbf     d1,loc_1AB0C
loc_1AB2C:
                
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BOLT,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  1(a1),((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
loc_1AB4A:
                
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Bolt

                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 3
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b 4
table_1AB5E:    dc.b 0
                dc.b $C8
                dc.b 0
                dc.b $C0
                dc.b 5
                dc.b $B3
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $98
                dc.b 0
                dc.b $D8
                dc.b 5
                dc.b $C3
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $F8
                dc.b 0
                dc.b $C8
                dc.b 5
                dc.b $B3
                dc.b $F
                dc.b $20
                dc.b 1
                dc.b $30
                dc.b 0
                dc.b $B8
                dc.b 5
                dc.b $C3
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $F8
                dc.b 0
                dc.b $C8
                dc.b 5
                dc.b $B3
                dc.b $F
                dc.b $20
                dc.b 1
                dc.b $30
                dc.b 0
                dc.b $B8
                dc.b 5
                dc.b $C3
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $C8
                dc.b 0
                dc.b $C0
                dc.b 5
                dc.b $B3
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $98
                dc.b 0
                dc.b $D8
                dc.b 5
                dc.b $C3
                dc.b $F
                dc.b $20

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Buff1:
                
                move.w  #$FFFE,d0
                moveq   #$1E,d1
                bra.w   loc_1ABAC

    ; End of function spellanimationSetup_Buff1


; =============== S U B R O U T I N E =======================================


spellanimationSetup_Buff2:
                
                moveq   #2,d0
                moveq   #2,d1

    ; End of function spellanimationSetup_Buff2


; START OF FUNCTION CHUNK FOR spellanimationSetup_Buff1

loc_1ABAC:
                
                movem.w d0-d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BUFF_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                movem.w (sp)+,d0-d1
                move.w  d0,((byte_FFB532-$1000000)).w
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #1,2(a0)
                move.w  d1,4(a0)
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BUFF1,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   sub_1A028

; END OF FUNCTION CHUNK FOR spellanimationSetup_Buff1


; =============== S U B R O U T I N E =======================================


spellanimationSetup_Debuff1:
                
                lea     table_1ACC6(pc), a0
                bra.w   loc_1AC08

    ; End of function spellanimationSetup_Debuff1


; =============== S U B R O U T I N E =======================================


spellanimationSetup_Debuff2:
                
                lea     table_1ACCC(pc), a0
                bra.w   loc_1AC08

    ; End of function spellanimationSetup_Debuff2


; =============== S U B R O U T I N E =======================================


spellanimationSetup_Debuff3:
                
                lea     table_1ACD2(pc), a0

    ; End of function spellanimationSetup_Debuff3


; START OF FUNCTION CHUNK FOR spellanimationSetup_Debuff1

loc_1AC08:
                
                move.l  a0,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #DEBUFF_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_DEBUFF,d0
                bsr.w   LoadSpellGraphics
                movea.l (sp)+,a0
                lea     ((PALETTE_3_CURRENT-$1000000)).w,a1
                lea     ((PALETTE_3_BASE-$1000000)).w,a2
                move.w  (a0),$12(a1)
                move.w  (a0)+,$12(a2)
                move.w  (a0),$1A(a1)
                move.w  (a0)+,$1A(a2)
                move.w  (a0),$1C(a1)
                move.w  (a0),$1C(a2)
                jsr     (ApplyVIntCramDma).w
                lea     ((byte_FFB532-$1000000)).w,a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1AC5C
                move.w  #$40,(a0)+ 
                move.w  #$20,(a0) 
                bra.s   loc_1AC64
loc_1AC5C:
                
                move.w  #$A8,(a0)+ 
                move.w  #$30,(a0) 
loc_1AC64:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #1,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #4,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #6,d7
                move.w  d7,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #4,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$C,d7
                move.w  d7,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #4,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$12,d7
                move.w  d7,4(a0)
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DEBUFF1,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #4,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   sub_1A028

; END OF FUNCTION CHUNK FOR spellanimationSetup_Debuff1

table_1ACC6:    dc.b 8
                dc.b $88
                dc.b $B
                dc.b $BB
                dc.b $D
                dc.b $DD
table_1ACCC:    dc.b 8
                dc.b $4E
                dc.b $E
                dc.b $C6
                dc.b $F
                dc.b $DA
table_1ACD2:    dc.b 8
                dc.b $4E
                dc.b 9
                dc.b $8E
                dc.b $D
                dc.b $BF

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Absorb:
                
                 
                sndCom  SFX_WARP
                move.w  #ABSORB_FLASH_COLOR,d0
                bra.w   ExecuteSpellcastFlashEffect

    ; End of function spellanimationSetup_Absorb


; =============== S U B R O U T I N E =======================================


spellanimationSetup_DemonBreath:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_DEMON_BREATH,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     ((byte_FFB532-$1000000)).w,a1
                cmpi.w  #ENEMYBATTLESPRITE_ZEON,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w 
                                                        ; HARDCODED Zeon enemy battle sprite
                bne.s   loc_1AD0C
                move.l  #$B000EA,(a1)
                move.w  #1,4(a1)
                bra.s   loc_1AD16
loc_1AD0C:
                
                move.l  #$C000D0,(a1)
                clr.w   4(a1)
loc_1AD16:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DEMON_BREATH,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_DemonBreath


; =============== S U B R O U T I N E =======================================


spellanimationSetup_FlameBreath:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_FLAME_BREATH,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     ((byte_FFB532-$1000000)).w,a1
                bclr    #7,d1
                bne.s   loc_1AD62
                move.w  #$40,(a1) 
                move.w  #$80,2(a1) 
                bra.s   loc_1AD6A
loc_1AD62:
                
                move.w  #$C0,(a1) 
                clr.w   2(a1)
loc_1AD6A:
                
                andi.w  #7,d1
                add.w   d1,d1
                addi.w  #$2C,d1 
                move.w  d1,4(a1)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  (a1),2(a0)
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_FLAME_BREATH,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_FlameBreath


; =============== S U B R O U T I N E =======================================


spellanimationSetup_ArrowsAndSpears:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_ARROWS_AND_SPEARS,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                clr.w   d1
                lea     table_1AE40(pc), a0
                lea     (loc_1AE16+2)(pc), a1
                bclr    #7,d0
                beq.s   loc_1ADCA
                lea     $30(a0),a0
                lea     $18(a1),a1
loc_1ADCA:
                
                cmpi.b  #2,d0
                bcs.s   loc_1ADDA
                addq.w  #1,d1
                cmpi.b  #3,d0
                bcs.s   loc_1ADDA
                moveq   #3,d0
loc_1ADDA:
                
                lsl.w   #3,d0
                adda.w  d0,a1
                add.w   d0,d0
                adda.w  d0,a0
                lea     ((byte_FFB532-$1000000)).w,a2
                move.w  d1,(a2)+
                move.l  (a1)+,(a2)+
                move.l  (a1)+,(a2)
                moveq   #$26,d0 
                addq.w  #1,d1
                clr.w   d2
                clr.w   d3
                bsr.w   sub_19FAA
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$72,((byte_FFB404-$1000000)).w 
                move.b  #SPELLANIMATION_ARROWS_AND_SPEARS,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1AE16:
                
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_ArrowsAndSpears

table_1AE20:    dc.b $F2
                dc.b 0
                dc.b 1
                dc.b $90
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b $E8
                dc.b $F2
                dc.b 0
                dc.b 1
                dc.b $90
                dc.b 1
                dc.b $98
                dc.b 0
                dc.b $E8
                dc.b $F2
                dc.b 0
                dc.b 1
                dc.b $90
                dc.b 1
                dc.b $B0
                dc.b 0
                dc.b $E8
                dc.b $E
                dc.b 0
                dc.b 0
                dc.b $60
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b $F0
table_1AE40:    dc.b $E
                dc.b 0
                dc.b 0
                dc.b $58
                dc.b 0
                dc.b $78
                dc.b 0
                dc.b $F0
                dc.b $E
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $60
                dc.b 0
                dc.b $F0
                dc.b 0
                dc.b $98
                dc.b 0
                dc.b $6C
                dc.b 5
                dc.b $20
                dc.b $C
                dc.b $11
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $98
                dc.b 0
                dc.b $6C
                dc.b 5
                dc.b $28
                dc.b 0
                dc.b $11
                dc.b 0
                dc.b $A0
                dc.b 0
                dc.b $6C
                dc.b 5
                dc.b $24
                dc.b $C
                dc.b $11
                dc.b 0
                dc.b $68
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $2D
                dc.b $C
                dc.b $11
                dc.b 0
                dc.b $88
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $29
                dc.b $C
                dc.b $11
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $64
                dc.b 5
                dc.b $20
                dc.b $C
                dc.b $10
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $64
                dc.b 5
                dc.b $24
                dc.b $C
                dc.b $10
                dc.b 0
                dc.b $70
                dc.b 0
                dc.b $64
                dc.b 5
                dc.b $28
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $62
                dc.b 5
                dc.b $29
                dc.b $C
                dc.b $10
                dc.b 0
                dc.b $70
                dc.b 0
                dc.b $62
                dc.b 5
                dc.b $2D
                dc.b $C
                dc.b $10

; =============== S U B R O U T I N E =======================================


spellanimationSetup_CannonProjectile:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_CANNON_PROJECTILE,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                lea     table_1AEFA(pc), a1
                btst    #7,d0
                beq.s   loc_1AECA
                addq.w  #8,a1
loc_1AECA:
                
                lea     ((byte_FFB532-$1000000)).w,a2
                move.l  (a1)+,(a2)+
                move.l  (a1),(a2)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_CANNON_PROJECTILE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_CannonProjectile

table_1AEFA:    dc.b $F3
                dc.b 0
                dc.b $FF
                dc.b $C0
                dc.b 1
                dc.b $80
                dc.b 0
                dc.b $E8
                dc.b $D
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $70
                dc.b 0
                dc.b $F0

; =============== S U B R O U T I N E =======================================


spellanimationSetup_ShotProjectile:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_EXPLOSION,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                lea     table_1AF7C(pc), a0
                lea     table_1AF64(pc), a1
                btst    #7,d0
                beq.s   loc_1AF2C
                addq.w  #8,a0
                lea     $C(a1),a1
loc_1AF2C:
                
                lea     ((byte_FFB532-$1000000)).w,a2
                move.l  (a1)+,(a2)+
                move.l  (a1)+,(a2)+
                move.l  (a1),(a2)
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_SHOT_PROJECTILE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_ShotProjectile

table_1AF64:    dc.b $F4
                dc.b 0
                dc.b $FF
                dc.b $C0
                dc.b 1
                dc.b $80
                dc.b 0
                dc.b $E8
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $60
                dc.b $C
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $70
                dc.b 0
                dc.b $F0
                dc.b 0
                dc.b $B8
                dc.b 0
                dc.b $70
table_1AF7C:    dc.b 1
                dc.b $20
                dc.b 0
                dc.b $E8
                dc.b 5
                dc.b $6C
                dc.b 5
                dc.b $10
                dc.b 0
                dc.b $C8
                dc.b 0
                dc.b $E0
                dc.b 5
                dc.b $6C
                dc.b 5
                dc.b $11

; =============== S U B R O U T I N E =======================================


spellanimationSetup_GunnerProjectile:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_GUNNER_PROJECTILE,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                lea     table_1B002(pc), a0
                lea     table_1AFEA(pc), a1
                btst    #7,d0
                beq.s   loc_1AFAE
                addq.w  #8,a0
                lea     $C(a1),a1
loc_1AFAE:
                
                lea     ((byte_FFB532-$1000000)).w,a2
                move.l  (a1)+,(a2)+
                move.l  (a1)+,(a2)+
                move.l  (a1),(a2)
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                bsr.w   CopyPalettes
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_GUNNER_PROJECTILE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_GunnerProjectile

table_1AFEA:    dc.b $F3
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b $80
                dc.b 0
                dc.b $E8
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $38
                dc.b $D
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $70
                dc.b 0
                dc.b $F0
                dc.b 0
                dc.b $88
                dc.b 0
                dc.b $48
table_1B002:    dc.b 1
                dc.b $3E
                dc.b 0
                dc.b $FA
                dc.b 5
                dc.b $20
                dc.b 5
                dc.b $10
                dc.b 0
                dc.b $D0
                dc.b 0
                dc.b $E0
                dc.b 5
                dc.b $20
                dc.b 5
                dc.b $10

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Dao:
                
                bsr.w   ClearSpellanimationProperties
                bclr    #6,((byte_FFB56E-$1000000)).w
                clr.w   d0
                bsr.w   LoadInvocationSpell
                moveq   #1,d1
                moveq   #6,d2
loc_1B026:
                
                movem.w d1-d2,-(sp)
                cmpi.w  #1,d2
                beq.s   byte_1B036
                jsr     (WaitForVInt).w
                bra.s   loc_1B040
byte_1B036:
                
                sndCom  SFX_INTRO_LIGHTNING
                moveq   #20,d0
                jsr     (Sleep).w       
loc_1B040:
                
                clr.w   d0
                bsr.w   LoadInvocationSpriteFrameToVram
                bchg    #6,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1A3E8
                movem.w (sp)+,d1-d2
                addq.w  #1,d1
                dbf     d2,loc_1B026
                
                moveq   #SPELLGRAPHICS_DAO,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$5A,((byte_FFB532-$1000000)).w 
                lea     (FF8804_LOADING_SPACE).l,a0
                move.w  #1023,d0
@ClearLoadingSpace_Loop:
                
                clr.l   (a0)+
                dbf     d0,@ClearLoadingSpace_Loop
                
                move.l  #table_DaoBackgroundModification,((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.l  #table_DaoBattlespriteModification,((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w
                move.w  #$A,((word_FFB3CA-$1000000)).w
                move.b  #$F,((byte_FFB583-$1000000)).w
                move.b  #1,((byte_FFB56B-$1000000)).w
                bclr    #3,((byte_FFB56E-$1000000)).w
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DAO,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Dao

table_DaoBackgroundModification:
                dc.b 4
                dc.b 1
table_DaoBattlespriteModification:
                dc.b 3
                dc.b 20

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Apollo:
                
                bsr.w   ClearSpellanimationProperties
                bclr    #6,((byte_FFB56E-$1000000)).w
                moveq   #SUMMON_APOLLO,d0
                bsr.w   LoadInvocationSpell
                sndCom  SFX_INTRO_LIGHTNING
                lea     ((SPRITE_20-$1000000)).w,a0
                moveq   #$15,d0
loc_1B0EA:
                
                move.l  a0,-(sp)
                moveq   #$F,d1
loc_1B0EE:
                
                addq.w  #8,(a0)
                addq.w  #8,a0
                dbf     d1,loc_1B0EE
                movea.l (sp)+,a0
                jsr     (WaitForVInt).w
                dbf     d0,loc_1B0EA
                moveq   #SUMMON_APOLLO,d0
                moveq   #1,d1
                bsr.w   LoadInvocationSpriteFrameToVram
                moveq   #30,d0
                jsr     (Sleep).w       
                bchg    #6,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1A3E8
                moveq   #SUMMON_APOLLO,d0
                moveq   #2,d1
                bsr.w   LoadInvocationSpriteFrameToVram
                moveq   #SPELLGRAPHICS_APOLLO,d0
                bsr.w   LoadSpellGraphicsForInvocation
                lea     (FF8B04_LOADING_SPACE).l,a0
                lea     ($3000).w,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                lea     (FF8D04_LOADING_SPACE).l,a0
                lea     ($4200).w,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                lea     (FF8F04_LOADING_SPACE).l,a0
                lea     ($B400).l,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                lea     (FF9104_LOADING_SPACE).l,a0
                lea     ($DE00).l,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                moveq   #$26,d0 
                lea     table_1B1FA(pc), a0
                bsr.w   sub_19F5E
                jsr     (WaitForVInt).w
                sndCom  SFX_BATTLEFIELD_DEATH
                lea     ((SPRITE_38-$1000000)).w,a0
                moveq   #$13,d0
                moveq   #1,d1
loc_1B1A4:
                
                move.w  (a0),d2
                exg     d1,d2
                move.w  d2,(a0)
                jsr     (WaitForVInt).w
                dbf     d0,loc_1B1A4
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #2,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.l  #table_ApolloBackgroundModification,((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.b  #5,((byte_FFB583-$1000000)).w
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_APOLLO,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #2,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Apollo

table_1B1FA:    dc.b 1
                dc.b 18
                dc.b 0
                dc.b -53
                dc.b 7
                dc.b -128
                dc.b 5
                dc.b 32
table_ApolloBackgroundModification:
                dc.b 0
                dc.b 56
                dc.b 8
                dc.b 96
                dc.b 0
                dc.b 1
                dc.b -78
                dc.b 10
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b -1
                dc.b -1
                dc.b -1
                dc.b -2
                dc.b -1
                dc.b -1
                dc.b 0
                dc.b 0

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Neptun:
                
                bsr.w   ClearSpellanimationProperties
                bclr    #6,((byte_FFB56E-$1000000)).w
                moveq   #SUMMON_NEPTUNE,d0
                bsr.w   LoadInvocationSpell
                moveq   #SUMMON_NEPTUNE,d0
                moveq   #1,d1
                bsr.w   LoadInvocationSpriteFrameToVram
                sndCom  SFX_PRISM_LASER_FIRING
                bset    #6,((byte_FFB56E-$1000000)).w
                moveq   #$14,d1
                moveq   #9,d2
                lea     table_1B358(pc), a0
                lea     6(a0),a1
loc_1B248:
                
                movem.l d1-d2/a0-a1,-(sp)
                bsr.w   LoadInvocationSprite
                movem.l (sp)+,d1-d2/a0-a1
                swap    d2
                tst.w   d2
                bne.s   loc_1B25E
                moveq   #1,d0
                bra.s   loc_1B268
loc_1B25E:
                
                subq.w  #1,d2
                bne.s   loc_1B266
                move.w  #1,d2
loc_1B266:
                
                move.w  d2,d0
loc_1B268:
                
                jsr     (Sleep).w       
                exg     a0,a1
                dbf     d1,loc_1B248
                moveq   #SPELLGRAPHICS_NEPTUN,d0
                bsr.w   LoadSpellGraphicsForInvocation
                moveq   #$26,d0 
                lea     table_1B364(pc), a0
                bsr.w   sub_19F5E
                moveq   #25,d0
                jsr     (Sleep).w       
                bclr    #6,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1A3E8
                sndCom  SFX_DESOUL_HOVERING
                moveq   #2,d0
                moveq   #0,d1
                moveq   #$10,d2
                lea     ((SPRITE_38-$1000000)).w,a0
loc_1B2A0:
                
                subi.w  #5,(a0)
                subq.w  #1,d0
                bne.s   loc_1B2BE
                moveq   #2,d0
                bchg    #0,d1
                bne.s   loc_1B2B8
                move.w  #$78C|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
                bra.s   loc_1B2BE
loc_1B2B8:
                
                move.w  #$786|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
loc_1B2BE:
                
                jsr     (WaitForVInt).w
                dbf     d2,loc_1B2A0
                moveq   #SPELLGRAPHICS_NEPTUN,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.b  #1,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #2,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #5,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #8,4(a0)
                lea     (BATTLESCENE_BATTLESPRITE_TOGGLE).l,a0
                moveq   #15,d0
loc_1B304:
                
                move.b  #1,(a0)+
                dbf     d0,loc_1B304
                lea     (byte_FFAFC6).l,a0
                moveq   #21,d0
loc_1B314:
                
                move.b  #1,(a0)+
                dbf     d0,loc_1B314
                moveq   #20,d0
                jsr     (Sleep).w       
                move.l  #table_NeptunBackgroundModification,((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.b  #5,((byte_FFB583-$1000000)).w
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_NEPTUN,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #4,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Neptun

table_1B358:    dc.b 1
                dc.b 0
                dc.b 0
                dc.b -80
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
table_1B364:    dc.b 1
                dc.b 40
                dc.b 0
                dc.b -64
                dc.b 7
                dc.b -128
                dc.b 6
                dc.b 32
table_NeptunBackgroundModification:
                dc.b 0
                dc.b 56
                dc.b 4
                dc.b 96
                dc.b 0
                dc.b 1
                dc.b -77
                dc.b 116
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b -1
                dc.b -1
                dc.b 0
                dc.b 0

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Atlas:
                
                bsr.w   ClearSpellanimationProperties
                bclr    #6,((byte_FFB56E-$1000000)).w
                moveq   #SUMMON_ATLAS,d0
                bsr.w   LoadInvocationSpell
                moveq   #SUMMON_ATLAS,d0
                moveq   #1,d1
                bsr.w   LoadInvocationSpriteFrameToVram
                lea     ((byte_FFB532-$1000000)).w,a0
                move.w  #$900,(a0)+
                move.w  #$A00,(a0)+
                move.w  #$F700,(a0)+
                move.w  #$A00,(a0)+
                move.w  #$50,(a0) 
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #6,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #1,4(a0)
                move.w  #1,8(a0)
                lea     (byte_FFAFB4).l,a0
                lea     (byte_FFAFC6).l,a1
                moveq   #$F,d0
loc_1B3D8:
                
                move.b  #2,(a0)+
                move.b  #2,(a1)+
                dbf     d0,loc_1B3D8
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_ATLAS,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #2,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Atlas


; =============== S U B R O U T I N E =======================================


spellanimationSetup_PrismLaser:
                
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_PRSIM_LASER,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                jsr     sub_1A2F6(pc)   
                cmpi.w  #ENEMYBATTLESPRITE_PRISM_FLOWER,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w 
                                                        ; HARDCODED Prism Flower enemy battle sprite
                bne.s   loc_1B426
                move.w  #$28,4(a0) 
                bra.s   loc_1B42C
loc_1B426:
                
                move.w  #5,2(a0)
loc_1B42C:
                
                moveq   #4,d1
loc_1B42E:
                
                moveq   #1,d0
                jsr     sub_1A2F6(pc)   
                moveq   #$10,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,2(a0)
                dbf     d1,loc_1B42E
                lea     table_1B480(pc), a0
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                lea     (byte_FFAFC6).l,a1
                moveq   #$F,d0
loc_1B456:
                
                move.b  #2,(a1)+
                dbf     d0,loc_1B456
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_PRISM_LASER,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_PrismLaser

table_1B480:    dc.b 0
                dc.b $B8
                dc.b 0
                dc.b $D4
                dc.b 5
                dc.b $23
                dc.b $F
                dc.b $20

; =============== S U B R O U T I N E =======================================


spellanimationSetup_BubbleBreath:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                clr.w   d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  (sp)+,d1
                andi.w  #7,d1
                cmpi.w  #2,d1
                bcs.s   loc_1B4CE
                lea     table_1B4F0(pc), a0
                lea     ((PALETTE_3_CURRENT-$1000000)).w,a1
                lea     ((PALETTE_3_BASE-$1000000)).w,a2
                move.w  (a0),$12(a1)
                move.w  (a0)+,$12(a2)
                move.w  (a0),$1A(a1)
                move.w  (a0)+,$1A(a2)
                move.w  (a0),$1C(a1)
                move.w  (a0),$1C(a2)
                jsr     (ApplyVIntCramDma).w
loc_1B4CE:
                
                move.w  #$E4,((byte_FFB404-$1000000)).w 
                move.b  #SPELLANIMATION_BUBBLE_BREATH,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_BubbleBreath

table_1B4F0:    dc.b $C
                dc.b $BF
                dc.b $B
                dc.b $9A
                dc.b $B
                dc.b $46
                

; =============== S U B R O U T I N E =======================================


spellanimationSetup_CutOff:
                
                module
                andi.w  #7,d1
                subq.w  #1,d1
                beq.w   loc_1B508
                subq.w  #1,d1
                beq.w   loc_1B53E
                rts
loc_1B508:
                
                bclr    #3,((byte_FFB56E-$1000000)).w
                move.w  #CUTOFF_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                move.l  #table_CutOffBattlespriteModification,((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w
                move.w  #1,((word_FFB3CA-$1000000)).w
                move.b  #$A,((byte_FFB583-$1000000)).w
loc_1B52A:
                
                tst.w   ((word_FFB3CA-$1000000)).w
                bne.s   loc_1B52A
                clr.l   ((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w
                clr.b   ((byte_FFB583-$1000000)).w
                rts

    ; End of function spellanimationSetup_CutOff

table_CutOffBattlespriteModification:
                dc.b 1
                dc.b 40
                dc.b 104
                dc.b 24

; START OF FUNCTION CHUNK FOR spellanimationSetup_CutOff

loc_1B53E:
                
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   @NotMirrored
                cmpi.w  #ENEMYBATTLESPRITE_ZEON,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w 
                                                        ; HARDCODED Zeon enemy battle sprite
                bne.s   @Continue
                rts
@Continue:
                
                btst    #2,((byte_FFB56F-$1000000)).w
                beq.s   loc_1B55A
                rts
loc_1B55A:
                
                bra.s   loc_1B570
@NotMirrored:
                
                cmpi.b  #BATTLEBACKGROUND_OVERWORLD,((BATTLESCENE_BACKGROUND-$1000000)).w
                bne.s   @OverworldBackground
                rts
@OverworldBackground:
                
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   loc_1B570
                rts
loc_1B570:
                
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_CUTOFF,d0
                bsr.w   LoadSpellGraphics
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((BATTLESCENE_ALLY_X_SPEED-$1000000)).w,a3
                lea     table_1B608(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   @NotMirroredGraphics
                addq.w  #8,a0
                lea     ((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w,a3
@NotMirroredGraphics:
                
                move.w  2(a0),6(a5)
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                jsr     (sub_1942).w    
                sndCom  SFX_PSHHH
                move.w  #5,4(a5)
                lea     ((SPRITE_38-$1000000)).w,a4
loc_1B5B2:
                
                jsr     (WaitForVInt).w
                addq.w  #1,(a5)
                btst    #0,1(a5)
                bne.s   loc_1B5CA
                move.w  #1,(a4)
                move.w  #1,(a3)
                bra.s   loc_1B5D2
loc_1B5CA:
                
                move.w  6(a5),(a4)
                move.w  #-1,(a3)
loc_1B5D2:
                
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   @MirroredAnimation
                addq.w  #1,VDPSPRITE_OFFSET_X(a4)
                bra.s   loc_1B5E4
@MirroredAnimation:
                
                subq.w  #1,VDPSPRITE_OFFSET_X(a4)
loc_1B5E4:
                
                subq.w  #1,4(a5)
                bne.s   loc_1B5B2
                move.w  #5,4(a5)
                addq.w  #1,2(a5)
                cmpi.w  #3,2(a5)
                bcc.w   loc_1B604
                addq.w  #4,VDPSPRITE_OFFSET_TILE(a4)
                bra.s   loc_1B5B2
loc_1B604:
                
                bra.w   sub_1A00A

; END OF FUNCTION CHUNK FOR spellanimationSetup_CutOff

                modend
                
table_1B608:    dc.w $138
                dc.w $110
                dc.w $520
                dc.w $520
                dc.w $C0
                dc.w $100
                dc.w $520
                dc.w $520

; =============== S U B R O U T I N E =======================================


spellanimationSetup_AttackSpell:
                
                 
                sndCom  SFX_SPELL_CAST
                move.w  #ATTACK_SPELL_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_DETOX,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #1,4(a0)
                lea     table_1AA88(pc), a0
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_ATTACK_SPELL,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_AttackSpell


; =============== S U B R O U T I N E =======================================


spellanimationSetup_SnowBreath:
                
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_SNOW_BREATH,d0
                bsr.w   LoadSpellGraphics
                lea     ((byte_FFB532-$1000000)).w,a1
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1B67C
                move.w  #$50,(a1) 
                bra.s   loc_1B680
loc_1B67C:
                
                move.w  #$D0,(a1) 
loc_1B680:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_SNOW_BREATH,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_SnowBreath


; =============== S U B R O U T I N E =======================================


spellanimationSetup_PhoenixAttack:
                
                bsr.w   ClearSpellanimationProperties
                btst    #0,d1
                beq.s   loc_1B6B6
                moveq   #SPELLGRAPHICS_PHOENIX_ATTACK,d0
                bra.s   loc_1B6B8
loc_1B6B6:
                
                moveq   #SPELLGRAPHICS_BLAST,d0
loc_1B6B8:
                
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$D0,4(a0) 
                move.w  #$64,((byte_FFB404-$1000000)).w 
                move.b  #SPELLANIMATION_PHOENIX_ATTACK,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_PhoenixAttack


; =============== S U B R O U T I N E =======================================


spellanimationSetup_BurstRockExplosion:
                
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_EXPLOSION,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BURST_ROCK_EXPLOSION,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_BurstRockExplosion


; =============== S U B R O U T I N E =======================================

; and maybe Zynk's beam too ?


spellanimationSetup_OddEyeBeam:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_ODD_EYE_BEAM,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     table_1B794(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,d1
                beq.s   loc_1B732
                lea     $E(a0),a0
loc_1B732:
                
                lea     ((byte_FFB532-$1000000)).w,a1
                move.l  (a0)+,(a1)+
                move.w  (a0)+,(a1)
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1B756
                move.w  #$38,2(a0) 
                bra.s   loc_1B75C
loc_1B756:
                
                move.w  #$102,2(a0)
loc_1B75C:
                
                lea     (byte_FFAFC6).l,a1
                moveq   #7,d0
loc_1B764:
                
                move.b  #2,(a1)+
                dbf     d0,loc_1B764
                
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_ODD_EYE_BEAM,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_OddEyeBeam

table_1B794:    dc.b 1
                dc.b 4
                dc.b 0
                dc.b $E9
                dc.b 8
                dc.b 0
                dc.b 1
                dc.b $1C
                dc.b 0
                dc.b $E5
                dc.b 5
                dc.b $20
                dc.b 5
                dc.b $21
                
                ; mirror
                dc.b 0
                dc.b $D2
                dc.b 0
                dc.b $CC
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $D2
                dc.b 0
                dc.b $CC
                dc.b 5
                dc.b $24
                dc.b $C
                dc.b $20

; =============== S U B R O U T I N E =======================================


UpdateSpellanimation:
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.s   @Return
                move.b  ((byte_FFB585-$1000000)).w,d0
                beq.s   @Return
                subq.b  #1,d0
                beq.s   loc_1B7CE
                subq.b  #1,d0
                beq.s   loc_1B7CA
                bra.w   sub_1B82A
@Return:
                
                rts
loc_1B7CA:
                
                clr.w   ((byte_FFB404-$1000000)).w
loc_1B7CE:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.s   loc_1B7D8
                subq.w  #1,((byte_FFB404-$1000000)).w
loc_1B7D8:
                
                clr.w   d7
                move.b  ((CURRENT_SPELLANIMATION-$1000000)).w,d7
                add.w   d7,d7
                move.w  rjt_SpellanimationUpdates(pc,d7.w),d7
                jmp     rjt_SpellanimationUpdates(pc,d7.w)

    ; End of function UpdateSpellanimation

rjt_SpellanimationUpdates:
                dc.w spellanimationUpdate_Nothing-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Blaze-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Freeze-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Desoul-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_HealingFairy-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Blast-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Detox-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Bolt-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Buff-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Debuff-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Absorb-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_DemonBreath-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_FlameBreath-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_ArrowsAndSpears-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_CannonProjectile-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_ShotProjectile-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_GunnerProjectile-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Dao-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Apollo-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Neptun-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Atlas-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_PrismLaser-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_BubbleBreath-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_SnowBreath-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Absorb-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Buff-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_AttackSpell-rjt_SpellanimationUpdates 
                                                        ; SFCD's ATTACK spell (unused)
                dc.w spellanimationUpdate_Debuff-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_Debuff-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_PhoenixAttack-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_BurstRockExplosion-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_OddEyeBeam-rjt_SpellanimationUpdates

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Absorb:
                
                rts

    ; End of function spellanimationUpdate_Absorb


; =============== S U B R O U T I N E =======================================


sub_1B82A:
                
                clr.w   ((PALETTE_1_CURRENT-$1000000)).w
                clr.w   ((PALETTE_3_CURRENT_02-$1000000)).w
                jsr     (ApplyVIntCramDma).w
                jsr     (EnableDmaQueueProcessing).w
                bsr.w   sub_1A00A
                bsr.w   ClearSpellanimationProperties
                cmpi.b  #SPELLANIMATION_DAO,((CURRENT_SPELLANIMATION-$1000000)).w
                bcs.s   loc_1B858
                cmpi.b  #SPELLANIMATION_ATLAS,((CURRENT_SPELLANIMATION-$1000000)).w
                bhi.s   loc_1B858
                moveq   #$10,d0
                jsr     (InitializeSprites).w
loc_1B858:
                
                clr.w   ((byte_FFB404-$1000000)).w
                clr.b   ((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                clr.b   ((CURRENT_SPELLANIMATION-$1000000)).w
                clr.b   ((byte_FFB585-$1000000)).w
                clr.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                clr.b   ((byte_FFB568-$1000000)).w
                clr.b   ((byte_FFB569-$1000000)).w
                clr.b   ((byte_FFB56A-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
                clr.b   ((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                jmp     (WaitForVInt).w

    ; End of function sub_1B82A


; =============== S U B R O U T I N E =======================================


sub_1B884:
                
                movem.w d1-d2,-(sp)
                move.w  (a5),d1
loc_1B88A:
                
                cmp.w   (a0)+,d1
                bne.s   loc_1B8A6
                move.w  (a0)+,2(a4)
                move.w  4(a4),d2
                andi.w  #$F800,d2
                add.w   (a0),d2
                addi.w  #$520,d2
                move.w  d2,4(a4)
                bra.s   loc_1B8AC
loc_1B8A6:
                
                addq.w  #4,a0
                dbf     d0,loc_1B88A
loc_1B8AC:
                
                movem.w (sp)+,d1-d2
                rts

    ; End of function sub_1B884


; =============== S U B R O U T I N E =======================================


sub_1B8B2:
                
                movem.w d0-d1/d6-d7,-(sp)
                addq.b  #1,((byte_FFB568-$1000000)).w
                move.b  ((byte_FFB568-$1000000)).w,d0
                cmp.b   ((byte_FFB569-$1000000)).w,d0
                bcs.s   loc_1B8F8
                clr.b   ((byte_FFB568-$1000000)).w
                tst.w   ((PALETTE_1_CURRENT-$1000000)).w
                bne.s   loc_1B8D6
                move.w  4(a0),d0
                move.w  (a0),d1
                bra.s   loc_1B8DC
loc_1B8D6:
                
                move.w  2(a0),d0
                clr.w   d1
loc_1B8DC:
                
                move.w  d0,d6
                jsr     (GenerateRandomNumber).w
                add.w   d7,d0
                move.b  d0,((byte_FFB569-$1000000)).w
                move.w  d1,((PALETTE_1_CURRENT-$1000000)).w
                move.w  d1,((PALETTE_3_CURRENT_02-$1000000)).w
                jsr     (ApplyVIntCramDma).w
                jsr     (EnableDmaQueueProcessing).w
loc_1B8F8:
                
                movem.w (sp)+,d0-d1/d6-d7
                rts

    ; End of function sub_1B8B2


; =============== S U B R O U T I N E =======================================


sub_1B8FE:
                
                tst.b   ((byte_FFB56A-$1000000)).w
                bne.s   return_1B90A
                move.b  #4,((byte_FFB56A-$1000000)).w
return_1B90A:
                
                rts

    ; End of function sub_1B8FE


; =============== S U B R O U T I N E =======================================

; related to spellanimations


sub_1B90C:
                
                movem.w d5-d6,-(sp)
                clr.w   d5
                move.b  ((byte_FFB56A-$1000000)).w,d5
                add.w   d5,d5
                move.w  table_1B932-2(pc,d5.w),d6
                tst.w   d5
                beq.s   loc_1B92C
                add.w   ((word_FFB3EE-$1000000)).w,d6
                bsr.w   sub_1F1F0
                subq.b  #1,((byte_FFB56A-$1000000)).w
loc_1B92C:
                
                movem.w (sp)+,d5-d6
                rts

    ; End of function sub_1B90C

table_1B932:    dc.b -1
                dc.b -2
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 3
                dc.b -1
                dc.b -3

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Nothing:
                
                rts

    ; End of function spellanimationUpdate_Nothing


; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Blaze:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   loc_1B9EA
                addq.w  #1,(a5)
                cmpi.w  #$28,(a5) 
                bne.s   loc_1B95A
                clr.b   ((byte_FFB588-$1000000)).w
loc_1B95A:
                
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1B982
                moveq   #1,d1
                move.w  d1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  d1,VDPSPRITE_OFFSET_X(a4)
                move.w  d1,NEXTVDPSPRITE_OFFSET_Y(a4)
                clr.l   NEXTVDPSPRITE_OFFSET_SIZE(a4)
                move.w  d1,NEXTVDPSPRITE_OFFSET_X(a4)
                clr.w   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1B9EA
loc_1B982:
                
                subq.w  #1,2(a5)
                bne.w   loc_1B9BC
                move.w  #5,2(a5)
                lea     table_1BE2A(pc), a0
                bchg    #0,6(a5)
                beq.s   loc_1B99E
                addq.w  #4,a0
loc_1B99E:
                
                clr.w   d1
                move.b  (a3),d1
                lsl.w   #3,d1
                move.w  (a0,d1.w),d2
                addi.w  #-$3AE0,d2
                move.w  d2,VDPSPRITE_OFFSET_TILE(a4)
                move.w  2(a0,d1.w),d2
                addi.w  #-$3AE0,d2
                move.w  d2,NEXTVDPSPRITE_OFFSET_TILE(a4)
loc_1B9BC:
                
                btst    #0,1(a5)
                bne.s   loc_1B9D0
                move.w  #1,(a4)
                move.w  #1,NEXTVDPSPRITE_OFFSET_Y(a4)
                bra.s   loc_1B9EA
loc_1B9D0:
                
                clr.w   d1
                move.b  2(a3),d1
                addi.w  #$80,d1 
                move.w  d1,(a4)
                clr.w   d1
                move.b  3(a3),d1
                addi.w  #$80,d1 
                move.w  d1,NEXTVDPSPRITE_OFFSET_Y(a4)
loc_1B9EA:
                
                lea     ((byte_FFB41E-$1000000)).w,a5
                lea     ((SPRITE_40-$1000000)).w,a4
                moveq   #$28,d0 
                clr.w   d1
                move.b  5(a3),d1
                beq.w   loc_1BC0A
                subq.w  #1,d1
loc_1BA00:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1BBFA
                addq.w  #1,(a5)
                move.b  2(a5),d1
                bne.w   loc_1BA8C
                subq.b  #1,3(a5)
                bne.w   loc_1BBFA
                move.w  #$106,2(a5)
                lea     table_1BE42(pc), a0
                tst.b   4(a3)
                beq.s   loc_1BA30
                lea     $20(a0),a0
loc_1BA30:
                
                bsr.w   sub_19F5E
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BA42
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1BA42:
                
                move.w  #$60,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$80,d7 
                clr.w   d0
                move.b  6(a3),d0
                add.w   d0,d7
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$300,d7
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BA70
                neg.w   d7
loc_1BA70:
                
                move.w  d7,4(a5)
                move.w  #$200,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$700,d7
                move.w  d7,6(a5)
                sndCom  SFX_DESOUL_HOVERING
                bra.w   loc_1BBFA
loc_1BA8C:
                
                subq.b  #1,d1
                bne.w   loc_1BB46
                move.w  4(a5),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1BAA8
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1BAB6
loc_1BAA8:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1BAB6:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  6(a5),d0
                add.w   $A(a5),d0
                tst.w   d0
                bmi.s   loc_1BAD4
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1BAE2
loc_1BAD4:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1BAE2:
                
                move.w  d1,$A(a5)
                add.w   d0,(a4)
                cmpi.w  #$F8,(a4) 
                bcs.s   loc_1BAF8
                move.w  #$200,2(a5)
                bra.w   loc_1BBFA
loc_1BAF8:
                
                subq.b  #1,3(a5)
                move.b  3(a5),d1
                andi.w  #$3F,d1 
                bne.w   loc_1BBFA
                lea     table_1BE46(pc), a0
                moveq   #6,d1
                btst    #6,3(a5)
                bne.s   loc_1BB1C
                bset    #6,d1
                addq.w  #8,a0
loc_1BB1C:
                
                move.b  d1,3(a5)
                tst.b   4(a3)
                beq.s   loc_1BB2A
                lea     $20(a0),a0
loc_1BB2A:
                
                move.w  (a0),d1
                addi.w  #-$4000,d1
                move.w  d1,VDPSPRITE_OFFSET_TILE(a4)
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BB42
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1BB42:
                
                bra.w   loc_1BBFA
loc_1BB46:
                
                subq.b  #1,d1
                bne.w   loc_1BB80
                move.w  #$300,2(a5)
                lea     table_1BE52(pc), a0
                tst.b   4(a3)
                beq.s   loc_1BB60
                lea     $20(a0),a0
loc_1BB60:
                
                move.w  (a4),d3
                move.w  VDPSPRITE_OFFSET_X(a4),d2
                bsr.w   sub_19F5E
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                move.w  d3,(a4)
                move.w  d3,$A(a5)
                sndCom  SFX_BATTLEFIELD_DEATH
                bsr.w   sub_1B8FE
                bra.w   loc_1BBFA
loc_1BB80:
                
                addq.b  #1,3(a5)
                cmpi.b  #6,3(a5)
                bne.s   loc_1BBAE
                lea     table_1BE5A(pc), a0
                move.w  (a4),d3
                move.w  VDPSPRITE_OFFSET_X(a4),d2
                tst.b   4(a3)
                beq.s   loc_1BBA2
                lea     $20(a0),a0
                bra.s   loc_1BBA4
loc_1BBA2:
                
                addq.w  #8,d3
loc_1BBA4:
                
                bsr.w   sub_19F5E
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                move.w  d3,(a4)
loc_1BBAE:
                
                btst    #0,1(a5)
                bne.s   loc_1BBBC
                move.w  #1,(a4)
                bra.s   loc_1BBC0
loc_1BBBC:
                
                move.w  $A(a5),(a4)
loc_1BBC0:
                
                cmpi.b  #$C,3(a5)
                bcs.w   loc_1BBFA
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1BBE8
                clr.w   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1BBFA
loc_1BBE8:
                
                move.w  #1,(a5)
                move.w  #$14,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,2(a5)
loc_1BBFA:
                
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                lea     $C(a5),a5
                dbf     d1,loc_1BA00
loc_1BC0A:
                
                bsr.w   sub_1B90C       
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                btst    #2,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BC20
                rts
loc_1BC20:
                
                addq.w  #1,(a5)
                move.w  6(a5),d2
                tst.b   $F(a5)
                bne.s   loc_1BC3E
                addi.w  #$10,d2
                cmpi.w  #$300,d2
                bcs.s   loc_1BC3C
                move.b  #1,$F(a5)
loc_1BC3C:
                
                bra.s   loc_1BC4C
loc_1BC3E:
                
                subi.w  #$10,d2
                cmpi.w  #$100,d2
                bhi.s   loc_1BC4C
                clr.b   $F(a5)
loc_1BC4C:
                
                move.w  d2,6(a5)
                move.b  $E(a5),d1
                beq.w   loc_1BCEC
                move.w  2(a5),d0
                subq.b  #1,d1
                bne.s   loc_1BC64
                addq.w  #8,d0
                bra.s   loc_1BC66
loc_1BC64:
                
                subq.w  #8,d0
loc_1BC66:
                
                andi.w  #BYTE_MASK,d0
                move.w  d0,2(a5)
                cmp.w   4(a5),d0
                bne.s   loc_1BC7E
                clr.b   $E(a5)
                move.w  #6,$10(a5)
loc_1BC7E:
                
                bsr.w   sub_1BD4C
                jsr     (sub_179C).w    
                move.w  d1,d0
                muls.w  d2,d0
                asr.l   #7,d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1BC9E
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1BCAC
loc_1BC9E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1BCAC:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  VDPSPRITE_OFFSET_X(a4),(a2)
                swap    d1
                muls.w  d2,d1
                asr.l   #7,d1
                add.w   $A(a5),d1
                tst.w   d1
                bmi.s   loc_1BCD0
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1BCDE
loc_1BCD0:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1BCDE:
                
                move.w  d0,$A(a5)
                add.w   d1,(a4)
                move.w  (a4),2(a2)
                bra.w   loc_1BD2E
loc_1BCEC:
                
                move.w  2(a5),d0
                move.w  6(a5),d2
                tst.w   $10(a5)
                beq.s   loc_1BD02
                subq.w  #1,$10(a5)
                bra.w   loc_1BC7E
loc_1BD02:
                
                bsr.w   sub_1BDA0
                bcc.w   loc_1BC7E
                move.w  d7,4(a5)
                move.w  2(a5),d0
                cmp.w   d7,d0
                bcc.s   loc_1BD18
                exg     d0,d7
loc_1BD18:
                
                sub.w   d7,d0
                cmpi.w  #$80,d0 
                bcc.s   loc_1BD28
                move.b  #2,$E(a5)
                bra.s   loc_1BD2E
loc_1BD28:
                
                move.b  #1,$E(a5)
loc_1BD2E:
                
                bclr    #3,VDPSPRITE_OFFSET_TILE(a4)
                cmpi.w  #$40,2(a5) 
                bcs.s   return_1BD4A
                cmpi.w  #$C0,2(a5) 
                bcc.s   return_1BD4A
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
return_1BD4A:
                
                rts

    ; End of function spellanimationUpdate_Blaze


; =============== S U B R O U T I N E =======================================


sub_1BD4C:
                
                movem.l d0-d2/a3-a4,-(sp)
                move.w  $12(a5),d0
                addq.w  #1,d0
                andi.w  #$1F,d0
                move.w  d0,$12(a5)
                lea     ((byte_FFB496-$1000000)).w,a2
                lsl.w   #2,d0
                move.w  d0,-(sp)
                lea     table_1BE82(pc), a3
                moveq   #6,d1
loc_1BD6C:
                
                addq.w  #8,a4
                sub.w   (a3)+,d0
                andi.w  #$7C,d0 
                move.w  (a2,d0.w),d2
                add.w   (a3),d2
                move.w  d2,6(a4)
                move.w  2(a2,d0.w),d2
                add.w   (a3)+,d2
                bchg    #1,$D(a5)
                bne.s   loc_1BD90
                move.w  d2,(a4)
                bra.s   loc_1BD92
loc_1BD90:
                
                clr.w   (a4)
loc_1BD92:
                
                dbf     d1,loc_1BD6C
                move.w  (sp)+,d0
                adda.w  d0,a2
                movem.l (sp)+,d0-d2/a3-a4
                rts

    ; End of function sub_1BD4C


; =============== S U B R O U T I N E =======================================


sub_1BDA0:
                
                movem.w d1-d6,-(sp)
                clr.w   d1
                move.b  7(a3),d1
                addi.w  #$80,d1 
                clr.w   d2
                move.b  8(a3),d2
                addi.w  #$80,d2 
                move.w  6(a4),d3
                move.w  (a4),d4
                clr.w   d5
                clr.w   d6
                cmp.w   d1,d3
                bge.s   loc_1BDCC
                bset    #0,d5
                addq.w  #1,d6
loc_1BDCC:
                
                cmp.w   d2,d4
                bge.s   loc_1BDD6
                bset    #1,d5
                addq.w  #1,d6
loc_1BDD6:
                
                addi.w  #$80,d1 
                cmp.w   d1,d3
                ble.s   loc_1BDE4
                bset    #2,d5
                addq.w  #1,d6
loc_1BDE4:
                
                addi.w  #$50,d2 
                cmp.w   d2,d4
                ble.s   loc_1BDF2
                bset    #3,d5
                addq.w  #1,d6
loc_1BDF2:
                
                tst.w   d6
                beq.w   loc_1BE16
                subq.w  #1,d6
                bne.s   loc_1BE00
                moveq   #$41,d6 
                bra.s   loc_1BE02
loc_1BE00:
                
                moveq   #$21,d6 
loc_1BE02:
                
                jsr     (GenerateRandomNumber).w
                clr.w   d3
                move.b  table_1BE1C(pc,d5.w),d3
                add.w   d3,d7
                andi.w  #BYTE_UPPER_NIBBLE_MASK,d7
                ori     #1,ccr
loc_1BE16:
                
                movem.w (sp)+,d1-d6
                rts

    ; End of function sub_1BDA0

table_1BE1C:    dc.b 0
                dc.b $E0
                dc.b $A0
                dc.b $D0
                dc.b $60
                dc.b 0
                dc.b $90
                dc.b 0
                dc.b $20
                dc.b $10
                dc.b 0
                dc.b 0
                dc.b $50
                dc.b $FF
table_1BE2A:    dc.b 0
                dc.b $21
                dc.b 0
                dc.b $21
                dc.b 0
                dc.b $29
                dc.b 0
                dc.b $29
                dc.b 0
                dc.b $31
                dc.b 0
                dc.b $3D
                dc.b 0
                dc.b $43
                dc.b 0
                dc.b $4F
                dc.b 0
                dc.b $55
                dc.b 0
                dc.b $65
                dc.b 0
                dc.b $75
                dc.b 0
                dc.b $85
table_1BE42:    dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
table_1BE46:    dc.b 5
                dc.b $B5
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $B9
                dc.b 5
                dc.b $20
table_1BE52:    dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $BD
                dc.b $A
                dc.b $20
table_1BE5A:    dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $C6
                dc.b 9
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $CC
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $D5
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $DE
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $EE
                dc.b $F
                dc.b $20
table_1BE82:    dc.w $C
                dc.w 4
                dc.w $C
                dc.w 4
                dc.w $C
                dc.w 4
                dc.w $C
                dc.w 4
                dc.w $C
                dc.w 4
                dc.w 8
                dc.w 8
                dc.w 8
                dc.w 8

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Freeze:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                moveq   #$26,d0 
                btst    #2,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1BF5C
                tst.w   (a5)
                beq.w   loc_1BF54
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1BEC8
                clr.l   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1BF54
loc_1BEC8:
                
                subq.w  #1,(a5)
                bne.w   loc_1BF54
                move.w  #2,(a5)
                tst.w   2(a5)
                bne.w   loc_1BF1E
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BEEC
                move.w  #$B8,d1 
                move.w  #$C8,d2 
                bra.s   loc_1BEF4
loc_1BEEC:
                
                move.w  #$120,d1
                move.w  #$D8,d2 
loc_1BEF4:
                
                moveq   #$30,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,d2
                move.w  d2,(a4)
                move.w  #VDPSPRITESIZE_V3|VDPSPRITESIZE_H1,VDPSPRITE_OFFSET_SIZE(a4)
                move.w  #$570|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a4)
                moveq   #$30,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,d1
                move.w  d1,VDPSPRITE_OFFSET_X(a4)
                addq.w  #1,2(a5)
                bra.w   loc_1BF54
loc_1BF1E:
                
                cmpi.w  #3,2(a5)
                bcc.w   loc_1BF42
                move.w  #$C570,d1
                btst    #0,3(a5)
                beq.s   loc_1BF36
                addq.w  #3,d1
loc_1BF36:
                
                move.w  d1,VDPSPRITE_OFFSET_TILE(a4)
                addq.w  #1,2(a5)
                bra.w   loc_1BF54
loc_1BF42:
                
                move.w  #1,(a4)
                clr.l   2(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.w   2(a5)
loc_1BF54:
                
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
loc_1BF5C:
                
                lea     ((byte_FFB532-$1000000)).w,a3
                addq.b  #1,$C(a3)
                move.b  $C(a3),$D(a3)
                lea     loc_1C170(pc), a2
                lea     (loc_1C184+2)(pc), a1 ; undefine operand to undo
                move.b  ((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w,d2
                andi.w  #7,d2
                move.w  d2,d1
                mulu.w  #$2A,d2 
                adda.w  d2,a2
                lsl.w   #2,d1
                adda.w  d1,a1
                moveq   #$17,d1
loc_1BF88:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1C136
                addq.w  #1,(a5)
                tst.b   2(a5)
                bne.w   loc_1BFF4
                lea     (byte_FFAFA0).l,a0
                moveq   #$28,d6 
                jsr     (GenerateRandomNumber).w
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BFBC
                addi.w  #$8C,d7 
                move.b  #1,(a0,d0.w)
                bra.s   loc_1BFC6
loc_1BFBC:
                
                addi.w  #$9C,d7 
                move.b  #2,(a0,d0.w)
loc_1BFC6:
                
                move.w  d7,$A(a5)
                move.w  d7,(a4)
                move.l  (a1),VDPSPRITE_OFFSET_SIZE(a4)
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                add.w   (a3),d7
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                addq.b  #1,2(a5)
                move.b  3(a3),3(a5)
                move.w  4(a3),4(a5)
                clr.l   6(a5)
                bra.w   loc_1C136
loc_1BFF4:
                
                cmpi.b  #1,2(a5)
                bne.w   loc_1C0BA
                cmpi.w  #$1C,(a5)
                bcs.s   loc_1C024
                addq.b  #1,2(a5)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                move.b  d7,3(a5)
                clr.w   6(a5)
                move.w  (a4),8(a5)
                addq.w  #8,8(a5)
                bra.w   loc_1C136
loc_1C024:
                
                clr.w   d0
                move.b  3(a5),d0
                move.b  8(a3),d1
                ext.w   d1
                add.w   d1,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,3(a5)
                jsr     (sub_179C).w    
                lsl.w   #3,d1
                add.w   6(a5),d1
                tst.w   d1
                bmi.s   loc_1C052
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1C060
loc_1C052:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1C060:
                
                move.w  d0,6(a5)
                add.w   d1,VDPSPRITE_OFFSET_X(a4)
                swap    d1
                lsl.w   #3,d1
                add.w   8(a5),d1
                tst.w   d1
                bmi.s   loc_1C07E
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1C08C
loc_1C07E:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1C08C:
                
                move.w  d0,8(a5)
                add.w   d1,$A(a5)
                cmpi.w  #4,(a5)
                bne.w   loc_1C136
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1C136
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                cmpi.w  #-1,d0
                beq.w   loc_1C136
                
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1C136
loc_1C0BA:
                
                lea     (byte_FFAFA0).l,a0
                adda.w  d0,a0
                clr.w   d0
                move.b  3(a5),d0
                move.b  9(a3),d1
                ext.w   d1
                add.w   d1,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,3(a5)
                move.w  4(a5),d1
                lsr.w   #2,d1
                swap    d1
                move.w  4(a5),d1
                jsr     (sub_1812).w    
                add.w   $A(a3),d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                swap    d2
                subq.w  #8,8(a5)
                add.w   8(a5),d2
                move.w  d2,$A(a5)
                cmpi.b  #$80,3(a5)
                bcc.s   loc_1C10C
                move.b  #0,(a0)
                bra.s   loc_1C110
loc_1C10C:
                
                move.b  #2,(a0)
loc_1C110:
                
                move.w  6(a3),d0
                add.w   d0,4(a5)
                cmpi.w  #$2E,(a5) 
                bcs.s   loc_1C136
                clr.l   (a5)
                move.w  #1,(a4)
                clr.l   2(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
loc_1C136:
                
                bchg    #0,$D(a3)
                bne.s   loc_1C144
                move.w  #1,(a4)
                bra.s   loc_1C148
loc_1C144:
                
                move.w  $A(a5),(a4)
loc_1C148:
                
                lea     (a2),a0
                moveq   #6,d0
                bsr.w   sub_1B884
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                lea     $C(a5),a5
                addq.w  #8,a4
                dbf     d1,loc_1BF88
                subq.b  #1,$E(a3)
                bne.s   loc_1C178
                sndCom  SFX_TINKLING
                moveq   #$E,d6
                jsr     (GenerateRandomNumber).w
loc_1C170:
                
                addi.w  #$A,d7
                move.b  d7,$E(a3)
loc_1C178:
                
                lea     table_1C242(pc), a0
                bsr.w   sub_1B8B2
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1C184:
                
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Freeze

                dc.b 0
                dc.b 0
                dc.b $C5
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b $C5
                dc.b $21
                dc.b 5
                dc.b 0
                dc.b $C5
                dc.b $22
                dc.b $A
                dc.b 0
                dc.b $C5
                dc.b $26
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $28
                dc.b 0
                dc.b $D
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b $12
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $29
                dc.b 0
                dc.b $17
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b $1C
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $2A
                dc.b 0
                dc.b $22
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 6
                dc.b 0
                dc.b $28
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $2E
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $29
                dc.b 0
                dc.b $D
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b $12
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $2A
                dc.b 0
                dc.b $17
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 6
                dc.b 0
                dc.b $1C
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $2E
                dc.b 0
                dc.b $22
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $F
                dc.b 0
                dc.b $28
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $37
                dc.b 0
                dc.b 8
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $2A
                dc.b 0
                dc.b $D
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 6
                dc.b 0
                dc.b $12
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $2E
                dc.b 0
                dc.b $17
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $F
                dc.b 0
                dc.b $1C
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $37
                dc.b 0
                dc.b $22
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $18
                dc.b 0
                dc.b $28
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b 8
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $2E
                dc.b 0
                dc.b $D
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $F
                dc.b 0
                dc.b $12
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $37
                dc.b 0
                dc.b $17
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $18
                dc.b 0
                dc.b $1C
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $22
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $18
                dc.b 0
                dc.b $28
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
table_1C242:    dc.b $E
                dc.b $44
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 1

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Desoul:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   4(a3)
                bne.w   loc_1C362
                clr.w   d0
                move.b  4(a5),d0
                btst    #2,6(a5)
                bne.s   loc_1C27A
                addq.w  #1,d0
                cmpi.w  #$D0,d0 
                bcs.s   loc_1C278
                bset    #2,6(a5)
loc_1C278:
                
                bra.s   loc_1C288
loc_1C27A:
                
                subq.w  #1,d0
                cmpi.w  #$80,d0 
                bhi.s   loc_1C288
                bclr    #2,6(a5)
loc_1C288:
                
                move.b  d0,4(a5)
                lsr.w   #6,d0
                add.w   2(a5),d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,2(a5)
                btst    #1,6(a5)
                bne.s   loc_1C2C0
                tst.b   5(a5)
                beq.s   loc_1C2D2
                cmpi.w  #$80,d0 
                bcs.s   loc_1C2BE
                bset    #1,6(a5)
loc_1C2B4:
                
                lea     table_1C51E(pc), a0
                moveq   #2,d4
                bsr.w   sub_1C4D8
loc_1C2BE:
                
                bra.s   loc_1C2DC
loc_1C2C0:
                
                tst.b   5(a5)
                beq.s   loc_1C2B4
                cmpi.w  #$80,d0 
                bhi.s   loc_1C2DC
                bclr    #1,6(a5)
loc_1C2D2:
                
                lea     table_1C4FE(pc), a0
                moveq   #1,d4
                bsr.w   sub_1C4D8
loc_1C2DC:
                
                clr.w   d2
                move.b  7(a5),d2
                btst    #3,6(a5)
                bne.s   loc_1C2F6
                subq.b  #1,d2
                bne.s   loc_1C2F4
                bset    #3,6(a5)
loc_1C2F4:
                
                bra.s   loc_1C304
loc_1C2F6:
                
                addq.b  #1,d2
                cmpi.b  #$FE,d2
                bcs.s   loc_1C304
                bclr    #3,6(a5)
loc_1C304:
                
                move.b  d2,7(a5)
                lsl.w   #3,d2
                move.w  #$1000,d1
                add.w   d2,d1
                swap    d1
                lsl.w   #2,d2
                move.w  #$3000,d1
                add.w   d2,d1
                jsr     (sub_1812).w    
                add.w   (a3),d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                move.w  d2,$E(a4)
                addi.w  #$20,d2 
                move.w  d2,$16(a4)
                move.w  d2,$1E(a4)
                swap    d2
                subq.b  #1,5(a5)
                bne.s   loc_1C348
                move.b  #$1C,5(a5)
                bchg    #0,6(a5)
loc_1C348:
                
                add.w   2(a3),d2
                move.w  d2,(a4)
                move.w  d2,$10(a4)
                addi.w  #$20,d2 
                move.w  d2,8(a4)
                move.w  d2,$18(a4)
                bra.w   loc_1C43A
loc_1C362:
                
                cmpi.w  #1,4(a3)
                bne.w   loc_1C3C4
                move.w  (a3),d0
                subi.w  #$20,d0 
                move.w  d0,VDPSPRITE_OFFSET_X(a4)
                move.w  d0,$E(a4)
                addi.w  #$20,d0 
                move.w  d0,$16(a4)
                move.w  d0,$1E(a4)
                move.w  2(a3),d0
                addi.w  #$10,d0
                move.w  d0,(a4)
                move.w  d0,$10(a4)
                addi.w  #$20,d0 
                move.w  d0,8(a4)
                move.w  d0,$18(a4)
                addq.w  #1,4(a3)
                btst    #1,6(a5)
                bne.s   loc_1C3B4
                move.w  #$40,2(a5) 
                bra.s   loc_1C3BA
loc_1C3B4:
                
                move.w  #$C0,2(a5) 
loc_1C3BA:
                
                move.b  #$14,5(a5)
                bra.w   loc_1C43A
loc_1C3C4:
                
                cmpi.w  #2,4(a3)
                bne.w   loc_1C42A
                subq.b  #1,5(a5)
                bne.w   loc_1C43A
                lea     table_1C4FE(pc), a0
                btst    #1,6(a5)
                beq.s   loc_1C3E6
                lea     $20(a0),a0
loc_1C3E6:
                
                moveq   #$26,d0 
                moveq   #4,d1
                move.w  6(a4),d2
                subi.w  #$80,d2 
                move.w  (a4),d3
                subi.w  #$70,d3 
                bsr.w   sub_19FAA       
                addi.w  #$30,VDPSPRITE_OFFSET_TILE(a4) 
                addi.w  #$30,$C(a4) 
                addi.w  #$30,$14(a4) 
                addi.w  #$30,$1C(a4) 
                addq.w  #1,4(a3)
                move.b  #$20,5(a5) 
                sndCom  SFX_DESOUL
                bsr.w   sub_1B8FE
                bra.w   loc_1C43A
loc_1C42A:
                
                bsr.w   sub_1B90C       
                subq.b  #1,5(a5)
                bne.w   loc_1C43A
                clr.w   4(a3)
loc_1C43A:
                
                btst    #1,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1C464
                lea     $C(a5),a5
                lea     $20(a4),a4
                move.w  #$FFF0,d2
                lea     ((SPRITE_38-$1000000)).w,a0
                bsr.w   sub_1C46E
                lea     $C(a5),a5
                addq.w  #8,a4
                moveq   #$20,d2 
                bsr.w   sub_1C46E
loc_1C464:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Desoul


; =============== S U B R O U T I N E =======================================


sub_1C46E:
                
                tst.w   (a5)
                beq.w   return_1C4D6
                addq.w  #1,(a5)
                move.w  2(a5),d0
                btst    #0,6(a5)
                bne.s   loc_1C486
                subq.w  #1,d0
                bra.s   loc_1C488
loc_1C486:
                
                addq.w  #1,d0
loc_1C488:
                
                move.w  d0,2(a5)
                asr.w   #1,d0
                add.w   VDPSPRITE_OFFSET_X(a0),d0
                move.w  d0,VDPSPRITE_OFFSET_X(a4)
                add.w   (a0),d2
                move.w  d2,(a4)
                subq.b  #1,7(a5)
                bne.s   loc_1C4BC
                move.b  #6,7(a5)
                bchg    #1,6(a5)
                bne.s   loc_1C4B6
                addi.w  #4,VDPSPRITE_OFFSET_TILE(a4)
                bra.s   loc_1C4BC
loc_1C4B6:
                
                subi.w  #4,VDPSPRITE_OFFSET_TILE(a4)
loc_1C4BC:
                
                subq.w  #1,4(a5)
                bne.w   return_1C4D6
                move.w  #$3C,4(a5) 
                bchg    #0,6(a5)
                bchg    #3,VDPSPRITE_OFFSET_TILE(a4)
return_1C4D6:
                
                rts

    ; End of function sub_1C46E


; =============== S U B R O U T I N E =======================================


sub_1C4D8:
                
                move.w  d0,-(sp)
                moveq   #$26,d0 
                moveq   #4,d1
                bsr.w   sub_19FAA
                lea     (byte_FFAFC6).l,a0
                move.b  d4,(a0)+
                move.b  d4,(a0)+
                move.b  d4,(a0)+
                move.b  d4,(a0)
                move.b  #$E,5(a5)
                sndCom  SFX_DESOUL_HOVERING
                move.w  (sp)+,d0
                rts

    ; End of function sub_1C4D8

table_1C4FE:    dc.w 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $20
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $30
                dc.b $D
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $38
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $48
                dc.b $D
                dc.b $20
table_1C51E:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $38
                dc.b $F
                dc.b $21
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $48
                dc.b $D
                dc.b $21
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $20
                dc.b $F
                dc.b $21
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $30
                dc.b $D
                dc.b $21

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_HealingFairy:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #$26,d0 
                move.w  $A(a3),d1
                subq.w  #1,d1
loc_1C552:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1C73E
                addq.w  #1,(a5)
                move.w  2(a5),d1
                andi.w  #3,d1
                cmpi.w  #3,d1
                bne.w   loc_1C5B6
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1C57E
                clr.w   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1C73E
loc_1C57E:
                
                subq.w  #1,8(a5)
                bne.w   loc_1C73E
                move.w  #2,(a5)
                move.w  2(a5),d1
                addq.w  #1,d1
                andi.w  #7,d1
                move.w  d1,2(a5)
                moveq   #$10,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$E6,d7 
                lsl.w   #NIBBLE_SHIFT_COUNT,d7
                move.w  d7,4(a5)
                move.w  #$F0,6(a5) 
                clr.l   8(a5)
                bra.w   loc_1C73E
loc_1C5B6:
                
                cmpi.w  #$2C,(a5) 
                bne.s   loc_1C5D6
                addq.w  #1,2(a5)
                move.w  (a3),d3
                addi.w  #-$3AE0,d3
                btst    #2,3(a5)
                beq.s   loc_1C5D2
                bset    #$B,d3
loc_1C5D2:
                
                move.w  d3,VDPSPRITE_OFFSET_TILE(a4)
loc_1C5D6:
                
                cmpi.w  #$48,(a5) 
                bne.s   loc_1C5F8
                addq.w  #1,2(a5)
                move.w  2(a3),d3
                addi.w  #-$3AE0,d3
                btst    #2,3(a5)
                beq.s   loc_1C5F4
                bset    #$B,d3
loc_1C5F4:
                
                move.w  d3,VDPSPRITE_OFFSET_TILE(a4)
loc_1C5F8:
                
                move.w  2(a5),d1
                move.w  4(a5),d0
                move.w  6(a5),d2
                btst    #0,d1
                bne.s   loc_1C61A
                addi.w  #$14,d2
                addq.w  #6,d0
                andi.w  #$FFF,d0
                move.w  d0,4(a5)
                bra.s   loc_1C622
loc_1C61A:
                
                subi.w  #$14,d2
                bpl.s   loc_1C622
                clr.w   d2
loc_1C622:
                
                move.w  d2,6(a5)
                lsr.w   #NIBBLE_SHIFT_COUNT,d0
                jsr     (sub_179C).w    
                move.w  d1,d0
                muls.w  d2,d0
                asr.l   #BYTE_SHIFT_COUNT,d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1C644
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1C652
loc_1C644:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1C652:
                
                move.w  d1,8(a5)
                btst    #2,3(a5)
                bne.s   loc_1C660
                neg.w   d0
loc_1C660:
                
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                add.w   d0,$E(a4)
                swap    d1
                muls.w  d2,d1
                asr.l   #BYTE_SHIFT_COUNT,d1
                add.w   $A(a5),d1
                tst.w   d1
                bmi.s   loc_1C680
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1C68E
loc_1C680:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1C68E:
                
                move.w  d0,$A(a5)
                add.w   d1,(a4)
                add.w   d1,8(a4)
                addq.b  #1,$E(a5)
                cmpi.b  #4,$E(a5)
                bcs.s   loc_1C6CC
                clr.b   $E(a5)
                bchg    #0,$F(a5)
                beq.s   loc_1C6B6
                move.w  4(a3),d1
                bra.s   loc_1C6BA
loc_1C6B6:
                
                move.w  6(a3),d1
loc_1C6BA:
                
                addi.w  #-$3AE0,d1
                move.w  $C(a4),d3
                andi.w  #$800,d3
                or.w    d3,d1
                move.w  d1,$C(a4)
loc_1C6CC:
                
                cmpi.w  #$60,VDPSPRITE_OFFSET_X(a4) 
                bcs.w   loc_1C6E0
                cmpi.w  #384,VDPSPRITE_OFFSET_X(a4)
                bls.w   loc_1C720
loc_1C6E0:
                
                addq.w  #1,2(a5)
                lea     table_1C7EE(pc), a0
                btst    #2,3(a5)
                beq.s   loc_1C6F2
                addq.w  #4,a0
loc_1C6F2:
                
                moveq   #$1C,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,8(a5)
                move.w  (a0),VDPSPRITE_OFFSET_X(a4)
                move.w  (a0)+,$E(a4)
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                add.w   (a0),d7
                move.w  d7,(a4)
                move.w  d7,8(a4)
                bchg    #3,VDPSPRITE_OFFSET_TILE(a4)
                bchg    #3,$C(a4)
loc_1C720:
                
                subq.w  #1,$10(a5)
                bne.w   loc_1C73E
                moveq   #$C,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #3,d7
                move.w  d7,$10(a5)
                move.w  VDPSPRITE_OFFSET_X(a4),$C(a3)
                move.w  (a4),$E(a3)
loc_1C73E:
                
                movem.w (sp)+,d0-d1
                addq.w  #2,d0
                lea     $10(a4),a4
                lea     $18(a5),a5
                dbf     d1,loc_1C552
                moveq   #$18,d1
                move.w  $A(a3),d2
                add.w   d2,d2
                sub.w   d2,d1
loc_1C75A:
                
                tst.w   (a5)
                bne.w   loc_1C7A4
                tst.w   $E(a3)
                beq.w   loc_1C7D8
                move.w  #1,(a5)
                clr.w   2(a5)
                move.w  #6,4(a5)
                move.w  $E(a3),d2
                addi.w  #$C,d2
                move.w  d2,(a4)
                clr.w   VDPSPRITE_OFFSET_SIZE(a4) ; clear size and link
                move.w  8(a3),d2
                addi.w  #-$3AE0,d2
                move.w  d2,VDPSPRITE_OFFSET_TILE(a4)
                move.w  $C(a3),d2
                addi.w  #$C,d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                clr.l   $C(a3)
                bra.w   loc_1C7D8
loc_1C7A4:
                
                addq.w  #1,(a5)
                addq.w  #1,(a4)
                subq.w  #1,4(a5)
                bne.w   loc_1C7D8
                move.w  #6,4(a5)
                subq.w  #1,VDPSPRITE_OFFSET_TILE(a4)
                addq.w  #1,2(a5)
                cmpi.w  #4,2(a5)
                bls.w   loc_1C7D8
                clr.l   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
loc_1C7D8:
                
                addq.w  #1,d0
                addq.w  #8,a4
                lea     $C(a5),a5
                dbf     d1,loc_1C75A
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_HealingFairy

table_1C7EE:    dc.b 0
                dc.b $60
                dc.b 0
                dc.b $80
                dc.b 1
                dc.b $80
                dc.b 0
                dc.b $80

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Blast:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #7,d1
loc_1C804:
                
                move.w  d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1C9A0
                tst.b   2(a5)
                beq.w   loc_1C8EC
                subq.b  #1,2(a5)
                bne.w   loc_1C9A0
                moveq   #6,d6
                jsr     (GenerateRandomNumber).w
                cmpi.w  #4,d7
                bcc.s   loc_1C84C
                clr.w   2(a5)
                tst.w   6(a3)
                bne.s   loc_1C83A
                clr.w   d1
                move.w  #$C520,d2
                bra.s   loc_1C842
loc_1C83A:
                
                move.w  #$500,d1
                move.w  #$C521,d2
loc_1C842:
                
                move.w  #$680,d3
                move.w  #$680,d4
                bra.s   loc_1C872
loc_1C84C:
                
                move.w  #1,2(a5)
                tst.w   6(a3)
                bne.s   loc_1C862
                move.w  #$100,d1
                move.w  #$C537,d2
                bra.s   loc_1C86A
loc_1C862:
                
                move.w  #$500,d1
                move.w  #$C539,d2
loc_1C86A:
                
                move.w  #$780,d3
                move.w  #$FF80,d4
loc_1C872:
                
                add.w   d7,d7
                move.w  d7,d0
                add.w   d7,d7
                add.w   d0,d7
                lea     table_1CBBA(pc), a0
                adda.w  d7,a0
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #$10,d7
                add.w   2(a0),d7
                add.w   2(a3),d7
                move.w  d7,(a4)
                move.w  d1,VDPSPRITE_OFFSET_SIZE(a4)
                or.w    4(a0),d2
                move.w  d2,VDPSPRITE_OFFSET_TILE(a4)
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #$10,d7
                add.w   (a0),d7
                add.w   (a3),d7
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                add.w   d3,d7
                tst.w   (a0)
                bmi.s   loc_1C8C2
                neg.w   d7
loc_1C8C2:
                
                move.w  d7,4(a5)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                add.w   d4,d7
                tst.w   2(a0)
                bmi.s   loc_1C8D8
                neg.w   d7
loc_1C8D8:
                
                move.w  d7,6(a5)
                move.w  #1,(a5)
                clr.l   8(a5)
                sndCom  SFX_BLAST_SPELL
                bra.w   loc_1C9A0
loc_1C8EC:
                
                addq.w  #1,(a5)
                cmpi.w  #$A,(a5)
                bcc.w   loc_1C918
                lea     table_1CBDE(pc), a0
                tst.w   6(a3)
                beq.s   loc_1C904
                lea     $18(a0),a0
loc_1C904:
                
                tst.b   3(a5)
                beq.s   loc_1C90E
                lea     $C(a0),a0
loc_1C90E:
                
                moveq   #2,d0
                bsr.w   sub_1B884
                bra.w   loc_1C9A0
loc_1C918:
                
                move.w  4(a5),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1C92E
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1C93C
loc_1C92E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1C93C:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  6(a5),d0
                add.w   $A(a5),d0
                tst.w   d0
                bmi.s   loc_1C95A
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1C968
loc_1C95A:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1C968:
                
                move.w  d1,$A(a5)
                add.w   d0,(a4)
                cmpi.w  #$12,(a5)
                bcs.w   loc_1C9A0
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.b   ((byte_FFB588-$1000000)).w
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1C994
                clr.w   (a5)
                bra.w   loc_1C9A0
loc_1C994:
                
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.b  d7,2(a5)
loc_1C9A0:
                
                move.w  (sp)+,d1
                lea     $C(a5),a5
                addq.w  #8,a4
                dbf     d1,loc_1C804
                tst.w   (a5)
                beq.w   loc_1CAA8
                addq.w  #1,(a5)
                subq.b  #1,3(a5)
                bne.w   loc_1CAA8
                move.b  #2,3(a5)
                move.b  2(a5),d0
                addq.w  #1,d0
                andi.w  #3,d0
                move.b  d0,2(a5)
                bne.w   loc_1CA22
                move.w  #$7FF,d6
                jsr     (GenerateRandomNumber).w
                move.w  d7,d0
                andi.w  #7,d0
                move.w  d0,4(a5)
                bsr.w   sub_1CBA6
                move.w  d7,d1
                lsr.w   #3,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                subi.w  #$10,d1
                move.b  1(a0),d2
                ext.w   d2
                add.w   d2,d1
                add.w   2(a3),d1
                move.w  d1,(a4)
                lsr.w   #7,d7
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d7
                subi.w  #$18,d7
                move.b  (a0),d2
                ext.w   d2
                add.w   d2,d7
                add.w   (a3),d7
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                lea     table_1CC44(pc), a1
                bra.w   loc_1CA76
loc_1CA22:
                
                subq.w  #1,d0
                bne.w   loc_1CA38
                lea     table_1CC46(pc), a1
                move.w  4(a5),d0
                bsr.w   sub_1CBA6
                bra.w   loc_1CA76
loc_1CA38:
                
                subq.w  #1,d0
                bne.w   loc_1CA5E
                move.w  4(a5),d0
                bsr.w   sub_1CBA6
                clr.w   d1
                move.b  4(a0),d1
                add.w   d1,VDPSPRITE_OFFSET_X(a4)
                move.b  5(a0),d1
                add.w   d1,(a4)
                lea     table_1CC48(pc), a1
                bra.w   loc_1CA76
loc_1CA5E:
                
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                move.b  #4,3(a5)
                bra.w   loc_1CAA8
loc_1CA76:
                
                clr.w   d0
                move.b  2(a0),d0
                add.w   d0,d0
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                adda.w  d0,a1
                clr.w   d0
                move.b  (a1),d0
                lsl.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  d0,VDPSPRITE_OFFSET_SIZE(a4)
                clr.w   d0
                move.b  1(a1),d0
                addi.w  #-$3AE0,d0
                clr.w   d1
                move.b  3(a0),d1
                lsl.w   #BYTE_SHIFT_COUNT,d1
                or.w    d1,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
loc_1CAA8:
                
                tst.w   4(a3)
                beq.w   loc_1CB94
                lea     $C(a5),a5
                addq.w  #8,a4
                tst.w   (a5)
                beq.w   loc_1CB00
                addq.w  #1,(a5)
                subq.b  #1,3(a5)
                bne.w   loc_1CB00
                move.b  #4,3(a5)
                clr.w   d0
                move.b  2(a5),d0
                addq.w  #1,d0
                cmpi.w  #4,d0
                bcs.s   loc_1CAE6
                clr.w   d0
                move.w  4(a3),d1
                addq.w  #8,d1
                move.w  d1,VDPSPRITE_OFFSET_X(a4)
loc_1CAE6:
                
                move.b  d0,2(a5)
                beq.s   loc_1CAFC
                move.w  4(a5),(a4)
                lsl.w   #2,d0
                addi.w  #-$3A59,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                bra.s   loc_1CB00
loc_1CAFC:
                
                move.w  #1,(a4)
loc_1CB00:
                
                lea     $C(a5),a5
                addq.w  #8,a4
                tst.w   (a5)
                beq.w   loc_1CB94
                addq.w  #1,(a5)
                subq.b  #1,3(a5)
                bne.w   loc_1CB42
                move.b  #4,3(a5)
                clr.w   d0
                move.b  2(a5),d0
                addq.w  #1,d0
                cmpi.w  #3,d0
                bcs.s   loc_1CB2C
                clr.w   d0
loc_1CB2C:
                
                move.b  d0,2(a5)
                lsl.w   #5,d0
                addi.w  #-$3AB5,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                addi.w  #$10,d0
                move.w  d0,$C(a4)
loc_1CB42:
                
                move.w  #$C0,d0 
                tst.b   5(a5)
                beq.s   loc_1CB4E
                neg.w   d0
loc_1CB4E:
                
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1CB60
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1CB6E
loc_1CB60:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1CB6E:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                add.w   d0,$E(a4)
                move.w  VDPSPRITE_OFFSET_X(a4),4(a3)
                subq.b  #1,4(a5)
                bne.w   loc_1CB94
                move.b  #$3C,4(a5) 
                bchg    #0,5(a5)
loc_1CB94:
                
                lea     table_1CC0E(pc), a0
                bsr.w   sub_1B8B2
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Blast


; =============== S U B R O U T I N E =======================================


sub_1CBA6:
                
                move.w  d0,-(sp)
                lea     table_1CC14(pc), a0
                add.w   d0,d0
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                adda.w  d0,a0
                move.w  (sp)+,d0
                rts

    ; End of function sub_1CBA6

table_1CBBA:    dc.b $FF
                dc.b $D0
                dc.b $FF
                dc.b $D0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $30
                dc.b $FF
                dc.b $D0
                dc.b 8
                dc.b 0
                dc.b $FF
                dc.b $D0
                dc.b 0
                dc.b $30
                dc.b $10
                dc.b 0
                dc.b 0
                dc.b $30
                dc.b 0
                dc.b $30
                dc.b $18
                dc.b 0
                dc.b $FF
                dc.b $CC
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $34
                dc.b 0
                dc.b 0
                dc.b 8
                dc.b 0
table_1CBDE:    dc.w 5
                dc.w $500
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 9
                dc.b 6
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b 5
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $19
                dc.b 0
                dc.b 9
                dc.b 9
                dc.b 0
                dc.b 0
                dc.b $1D
                dc.b 0
                dc.b 5
                dc.b 6
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b 9
                dc.b $B
                dc.b 0
                dc.b 0
                dc.b $B
                dc.b 0
                dc.b 5
                dc.b 9
                dc.b 0
                dc.b 0
                dc.b $1D
                dc.b 0
                dc.b 9
                dc.b $D
                dc.b 0
                dc.b 0
                dc.b $23
table_1CC0E:    dc.b $C
                dc.b $C4
                dc.b 0
                dc.b $A
                dc.b 0
                dc.b 1
table_1CC14:    dc.b $18
                dc.b $18
                dc.b 1
                dc.b $10
                dc.b 8
                dc.b 0
                dc.b 0
                dc.b $18
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 8
                dc.b $E8
                dc.b $18
                dc.b 1
                dc.b $18
                dc.b 0
                dc.b 0
                dc.b $18
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 8
                dc.b 8
                dc.b $E8
                dc.b 0
                dc.b 2
                dc.b 8
                dc.b 8
                dc.b 8
                dc.b $18
                dc.b $E8
                dc.b 1
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 0
                dc.b $E8
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b 0
                dc.b $E8
                dc.b $E8
                dc.b 1
                dc.b 8
                dc.b 0
                dc.b 0
table_1CC44:    dc.b $50
                dc.b $97
table_1CC46:    dc.b $70
                dc.b $9B
table_1CC48:    dc.b $60
                dc.b $A3
                dc.b $50
                dc.b $A9
                dc.b $D0
                dc.b $AD
                dc.b $90
                dc.b $B5
                dc.b $50
                dc.b $BB
                dc.b $F0
                dc.b $BF
                dc.b $60
                dc.b $CF

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Detox:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   loc_1CD70
                addq.w  #1,(a5)
                cmpi.w  #2,(a3)
                beq.w   loc_1CC92
                tst.w   (a3)
                bne.w   loc_1CCB2
                lea     table_1CE0C(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1CCB2
                move.w  #1,(a3)
                bra.w   loc_1CCB2
loc_1CC92:
                
                lea     table_1CE2A(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1CCB2
                clr.w   (a5)
                move.w  #1,(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1CD70
loc_1CCB2:
                
                move.w  2(a5),d0
                btst    #0,6(a5)
                bne.s   loc_1CCDA
                subq.w  #8,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,d1
                cmpi.w  #$88,d0 
                bne.s   loc_1CCD4
                bset    #0,6(a5)
                moveq   #8,d1
loc_1CCD4:
                
                move.w  #$130,d3
                bra.s   loc_1CCF4
loc_1CCDA:
                
                addq.w  #8,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,d1
                cmpi.w  #8,d0
                bne.s   loc_1CCF0
                bclr    #0,6(a5)
                moveq   #$78,d1 
loc_1CCF0:
                
                move.w  #$D0,d3 
loc_1CCF4:
                
                move.w  d1,2(a5)
                move.l  #$10003000,d1
                jsr     (sub_1812).w    
                add.w   d3,d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                swap    d2
                addi.w  #$C0,d2 
                move.w  d2,(a4)
loc_1CD10:
                
                cmpi.w  #$80,d0 
                bcc.s   loc_1CD1A
                moveq   #1,d1
                bra.s   loc_1CD1C
loc_1CD1A:
                
                moveq   #2,d1
loc_1CD1C:
                
                move.b  d1,(byte_FFAFA0).l
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1CD36
                cmpi.w  #2,(a3)
                bcc.s   loc_1CD36
                move.w  #1,(a5)
                move.w  #2,(a3)
loc_1CD36:
                
                subq.w  #1,4(a5)
                bne.w   loc_1CD70
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                move.w  d7,4(a5)
                cmpi.b  #$19,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1CD70
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  VDPSPRITE_OFFSET_X(a4),d0
                addq.w  #8,d0
                move.w  d0,4(a0)
                move.w  (a4),d0
                addq.w  #8,d0
                move.w  d0,6(a0)
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1CD70:
                
                lea     $C(a5),a5
                addq.w  #8,a4
                moveq   #$27,d0 
                moveq   #$17,d1
loc_1CD7A:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1CDF2
                addq.w  #1,(a5)
                tst.b   2(a5)
                bne.w   loc_1CDBC
                lea     (byte_FFAFA0).l,a1
                adda.w  d0,a1
                lea     table_1CE48(pc), a0
                bsr.w   sub_19F5E
                move.w  4(a5),VDPSPRITE_OFFSET_X(a4)
                move.w  6(a5),(a4)
                move.b  (byte_FFAFA0).l,(a1)
                addq.b  #1,2(a5)
                move.b  #6,3(a5)
                bra.w   loc_1CDF2
loc_1CDBC:
                
                addq.w  #1,(a4)
                subq.b  #1,3(a5)
                bne.w   loc_1CDF2
                move.b  #6,3(a5)
                addq.b  #1,2(a5)
                addq.w  #1,VDPSPRITE_OFFSET_TILE(a4)
                cmpi.b  #5,2(a5)
                bls.w   loc_1CDF2
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1CDF2:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1CD7A
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Detox

table_1CE0C:    dc.b 0
                dc.b 8
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $1A
                dc.b 0
                dc.b $E
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $16
                dc.b 0
                dc.b $14
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $12
                dc.b 0
                dc.b $1A
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 9
                dc.b 0
                dc.b $20
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 0
table_1CE2A:    dc.b 0
                dc.b 8
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 9
                dc.b 0
                dc.b $E
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $12
                dc.b 0
                dc.b $14
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $16
                dc.b 0
                dc.b $1A
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $1A
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $1B
table_1CE48:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $3C
                dc.b 0
                dc.b $20

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Bolt:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #$26,d0 
                move.w  (a3),d1
                subq.w  #1,d1
loc_1CE62:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1CF84
                addq.w  #1,(a5)
                subq.w  #1,4(a5)
                bne.w   loc_1CF84
                move.w  2(a5),d1
                cmpi.w  #6,d1
                bcc.w   loc_1CEEE
                tst.w   d1
                bne.s   loc_1CEA0
loc_1CE86:
                
                move.w  #$60,d6 
                jsr     (GenerateRandomNumber).w
                add.w   4(a3),d7
                move.w  d7,6(a5)
                moveq   #2,d6
                jsr     (GenerateRandomNumber).w
                move.b  d7,8(a5)
loc_1CEA0:
                
                cmpi.w  #2,d1
                bne.s   loc_1CEAA
                sndCom  SFX_BOLT_SPELL
loc_1CEAA:
                
                tst.b   8(a5)
                bne.s   loc_1CEB8
                getPointer p_BoltAnimData_A, a0
                bra.s   loc_1CEBE
loc_1CEB8:
                
                getPointer p_BoltAnimData_B, a0
loc_1CEBE:
                
                lsl.w   #3,d1
                move.w  d1,d2
                lsl.w   #2,d1
                add.w   d2,d1
                adda.w  d1,a0
                moveq   #5,d1
                move.w  6(a5),d2
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1CEDA
                clr.w   d3
                bra.s   loc_1CEDC
loc_1CEDA:
                
                moveq   #8,d3
loc_1CEDC:
                
                bsr.w   sub_19FAA       
                addq.w  #1,2(a5)
                move.w  #2,4(a5)
                bra.w   loc_1CF84
loc_1CEEE:
                
                bne.w   loc_1CF28
                move.l  a4,-(sp)
                moveq   #4,d1
loc_1CEF6:
                
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                addq.w  #8,a4
                dbf     d1,loc_1CEF6
                movea.l (sp)+,a4
                clr.b   ((byte_FFB588-$1000000)).w
                move.b  ((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w,d6
                andi.w  #7,d6
                add.w   d6,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                addq.w  #1,2(a5)
                move.w  d7,4(a5)
                bra.w   loc_1CF84
loc_1CF28:
                
                cmpi.w  #$C,d1
                bcc.w   loc_1CF42
                subq.w  #1,d1
                cmpi.w  #6,d1
                bne.w   loc_1CEAA
                sndCom  SFX_BOLT_SPELL
                bra.w   loc_1CE86
loc_1CF42:
                
                move.l  a4,-(sp)
                moveq   #4,d1
loc_1CF46:
                
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                addq.w  #8,a4
                dbf     d1,loc_1CF46
                movea.l (sp)+,a4
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1CF68
                clr.w   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1CF84
loc_1CF68:
                
                move.b  ((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w,d6
                andi.w  #7,d6
                lsl.w   #2,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.w   2(a5)
                move.w  d7,4(a5)
                bsr.w   sub_1B8FE
loc_1CF84:
                
                movem.w (sp)+,d0-d1
                addq.w  #5,d0
                lea     $28(a4),a4
                lea     $C(a5),a5
                dbf     d1,loc_1CE62
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                move.w  2(a3),d1
                beq.w   loc_1CFEA
                subq.w  #1,d1
loc_1CFA8:
                
                tst.w   (a5)
                beq.w   loc_1CFDE
                addq.w  #1,(a5)
                move.w  2(a5),d2
                addq.w  #1,d2
                andi.w  #7,d2
                move.w  d2,2(a5)
                move.w  #$C5B3,d3
                lsr.w   #1,d2
                bcc.s   loc_1CFCA
                bset    #$B,d3
loc_1CFCA:
                
                lsr.w   #1,d2
                bcc.s   loc_1CFD2
                addi.w  #$10,d3
loc_1CFD2:
                
                lsr.w   #1,d2
                bcc.s   loc_1CFDA
                bset    #$C,d3
loc_1CFDA:
                
                move.w  d3,VDPSPRITE_OFFSET_TILE(a4)
loc_1CFDE:
                
                addq.w  #1,d0
                addq.w  #8,a4
                lea     $C(a5),a5
                dbf     d1,loc_1CFA8
loc_1CFEA:
                
                bsr.w   sub_1B90C       
                lea     table_1CFF6(pc), a0
                bra.w   sub_1B8B2

    ; End of function spellanimationUpdate_Bolt

table_1CFF6:    dc.w $EAA
                dc.w $E
                dc.w 1

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Buff:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   return_1D036
                addq.w  #1,(a5)
                subq.w  #1,2(a5)
                bne.w   return_1D036
                move.w  4(a5),d0
                add.w   (a3),d0
                beq.w   sub_1B82A
                bmi.w   sub_1B82A
                cmpi.w  #$20,d0 
                bcc.w   sub_1B82A
                move.w  d0,2(a5)
                move.w  d0,4(a5)
                sndCom  SFX_PSH
return_1D036:
                
                rts

    ; End of function spellanimationUpdate_Buff


; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Debuff:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #$26,d0 
                moveq   #3,d1
loc_1D048:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1D0D4
                addq.w  #1,(a5)
                subq.w  #1,4(a5)
                bne.w   loc_1D0D4
                move.w  2(a5),d1
                addq.w  #1,d1
                cmpi.w  #6,d1
                bcs.s   loc_1D06A
                clr.w   d1
loc_1D06A:
                
                move.w  d1,2(a5)
                tst.w   d1
                bne.w   loc_1D090
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                move.w  #8,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #5,d7
                move.w  d7,4(a5)
                bra.w   loc_1D0D4
loc_1D090:
                
                move.w  #5,4(a5)
                subq.w  #1,d1
                bne.w   loc_1D0C2
                lea     table_1D0EE(pc), a0
                moveq   #1,d1
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                add.w   (a3),d7
                move.w  d7,d2
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                add.w   2(a3),d7
                move.w  d7,d3
                jsr     sub_19FAA       
                bra.w   loc_1D0D4
loc_1D0C2:
                
                add.w   d1,d1
                lea     table_1D0F6(pc), a0
                move.w  -2(a0,d1.w),d1
                addi.w  #-$3AE0,d1
                move.w  d1,VDPSPRITE_OFFSET_TILE(a4)
loc_1D0D4:
                
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                lea     $C(a5),a5
                addq.w  #8,a4
                dbf     d1,loc_1D048
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Debuff

table_1D0EE:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $20
                dc.b $F
                dc.b $20
table_1D0F6:    dc.b 0
                dc.b $10
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b 0

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_DemonBreath:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #$26,d0 
                moveq   #$18,d1
loc_1D10E:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1D288
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1D15E
                move.w  #$80,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$80,d7 
                move.w  d7,4(a5)
                move.w  #$500,d6
                jsr     (GenerateRandomNumber).w
                subi.w  #$300,d7
                move.w  d7,6(a5)
                clr.l   8(a5)
                lea     table_1D2A2(pc), a0
                bsr.w   sub_19F5E
                move.w  (a3),VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),(a4)
                sndCom  SFX_DEMON_BREATH
                bra.w   loc_1D288
loc_1D15E:
                
                cmpi.w  #$1C,(a5)
                bcc.w   loc_1D208
                move.w  4(a5),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D17C
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D18A
loc_1D17C:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D18A:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  6(a5),d0
                add.w   $A(a5),d0
                tst.w   d0
                bmi.s   loc_1D1A8
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D1B6
loc_1D1A8:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D1B6:
                
                move.w  d1,$A(a5)
                add.w   d0,(a4)
                cmpi.w  #$E,(a5)
                bne.s   loc_1D1C8
                move.w  #$530|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a4)
loc_1D1C8:
                
                move.w  4(a4),d0
                move.w  d0,d1
                addi.w  #$800,d0
                andi.w  #$1800,d0
                andi.w  #$E7FF,d1
                or.w    d1,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                cmpi.w  #$C,(a5)
                bne.w   loc_1D288
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1D288
                cmpi.b  #$19,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1D288
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1D288
loc_1D208:
                
                bne.w   loc_1D22E
                move.w  #$20,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$40,d7 
                move.w  d7,2(a5)
                clr.w   4(a5)
                clr.l   8(a5)
                move.w  #$540|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a4)
                bra.w   loc_1D288
loc_1D22E:
                
                move.w  4(a5),d0
                add.w   2(a5),d0
                move.w  d0,4(a5)
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D24C
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D25A
loc_1D24C:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D25A:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                tst.w   4(a3)
                beq.s   loc_1D272
                lea     table_1D2AA(pc), a0
                moveq   #$A,d0
                bsr.w   sub_1B884
loc_1D272:
                
                cmpi.w  #$45,(a5) 
                bcs.w   loc_1D288
                clr.w   (a5)
                move.w  #1,(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
loc_1D288:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1D10E
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_DemonBreath

table_1D2A2:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $20
                dc.b $F
                dc.b $20
table_1D2AA:    dc.w $20
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $30
                dc.b 0
                dc.b $24
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $28
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $30
                dc.b 0
                dc.b $2C
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $30
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $34
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $38
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $3C
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $40
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $44
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $50

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_FlameBreath:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #$18,d1
                moveq   #$26,d0 
loc_1D2F6:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1D424
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1D348
                lea     table_1D4A0(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1D33C
                addq.w  #8,a0
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w,d2
                cmpi.w  #$E,d2
                beq.w   loc_1D33C
                addq.w  #8,a0
                cmpi.w  #$13,d2
                beq.w   loc_1D33C
                addq.w  #8,a0
                cmpi.w  #$1A,d2
                beq.w   loc_1D33C
                addq.w  #8,a0
loc_1D33C:
                
                bsr.w   sub_19F5E
                sndCom  SFX_DOOR_OPEN
                bra.w   loc_1D424
loc_1D348:
                
                move.w  2(a5),d0
                jsr     (sub_179C).w    
                move.w  d1,d0
                asl.w   #1,d1
                add.w   d0,d1
                add.w   4(a5),d1
                tst.w   d1
                bmi.s   loc_1D368
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1D376
loc_1D368:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1D376:
                
                move.w  d0,4(a5)
                add.w   d1,VDPSPRITE_OFFSET_X(a4)
                swap    d1
                move.w  d1,d0
                asl.w   #1,d1
                add.w   d0,d1
                add.w   6(a5),d1
                tst.w   d1
                bmi.s   loc_1D398
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1D3A6
loc_1D398:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1D3A6:
                
                move.w  d0,6(a5)
                add.w   d1,(a4)
                cmpi.w  #6,(a5)
                bne.w   loc_1D402
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1D424
                move.w  2(a5),d1
                move.b  8(a5),d2
                bne.s   loc_1D3D8
                addq.w  #4,d1
                andi.w  #$FC,d1 
                cmp.w   2(a3),d1
                bne.s   loc_1D3D6
                move.b  #1,d2
loc_1D3D6:
                
                bra.s   loc_1D3E4
loc_1D3D8:
                
                subq.w  #4,d1
                andi.w  #$FC,d1 
                cmp.w   (a3),d1
                bne.s   loc_1D3E4
                clr.b   d2
loc_1D3E4:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                cmpi.w  #-1,d0
                beq.w   loc_1D424
                
                move.w  d1,2(a0)
                move.b  d2,8(a0)
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1D424
loc_1D402:
                
                move.w  4(a3),d1
                cmp.w   (a5),d1
                bhi.w   loc_1D424
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.b   ((byte_FFB588-$1000000)).w
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D424:
                
                moveq   #4,d0
                lea     table_1D4C8(pc), a0
                bsr.w   sub_1B884
                btst    #2,1(a5)
                bne.s   loc_1D43E
                bclr    #3,VDPSPRITE_OFFSET_TILE(a4)
                bra.s   loc_1D444
loc_1D43E:
                
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1D444:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1D2F6
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
loc_1D45C:
                
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                moveq   #$17,d0
loc_1D466:
                
                tst.w   (a5)
                bne.s   loc_1D494
                lea     (a4),a0
                lea     (a5),a1
                move.w  d0,d1
loc_1D470:
                
                move.l  8(a0),(a0)
                move.l  $C(a0),4(a0)
                move.l  $C(a1),(a1)
                move.l  $10(a1),4(a1)
                move.l  $14(a1),8(a1)
                addq.w  #8,a0
                lea     $C(a1),a1
                dbf     d1,loc_1D470
loc_1D494:
                
                addq.w  #8,a4
                lea     $C(a5),a5
                dbf     d0,loc_1D466
                rts

    ; End of function spellanimationUpdate_FlameBreath

table_1D4A0:    dc.b 1
                dc.b $1C
                dc.b 0
                dc.b $DE
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $D2
                dc.b 0
                dc.b $EC
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $DF
                dc.b 0
                dc.b $D6
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $D0
                dc.b 0
                dc.b $D8
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $D4
                dc.b 0
                dc.b $CC
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
table_1D4C8:    dc.b 0
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b $A
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b $F
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 6
                dc.b 0
                dc.b $14
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $A
                dc.b 0
                dc.b $19
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $13

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_ArrowsAndSpears:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   return_1D5C4
                addq.w  #1,(a5)
                move.w  2(a5),d0
                bne.w   loc_1D54A
                move.w  2(a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D518
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D526
loc_1D518:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D526:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                tst.w   (a3)
                beq.s   loc_1D536
                add.w   d0,$E(a4)
loc_1D536:
                
                cmpi.w  #$12,(a5)
                bcs.s   loc_1D546
                addq.w  #1,2(a5)
                move.w  #$22,4(a5) 
loc_1D546:
                
                bra.w   return_1D5C4
loc_1D54A:
                
                subq.w  #1,d0
                bne.w   loc_1D582
                subq.w  #1,4(a5)
                bne.w   return_1D5C4
                move.w  4(a3),VDPSPRITE_OFFSET_X(a4)
                move.w  8(a3),(a4)
                tst.w   (a3)
                beq.s   loc_1D572
                move.w  6(a3),$E(a4)
                move.w  8(a3),8(a4)
loc_1D572:
                
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   6(a5)
                bra.w   return_1D5C4
loc_1D582:
                
                move.w  2(a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D598
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D5A6
loc_1D598:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D5A6:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                tst.w   (a3)
                beq.s   loc_1D5B6
                add.w   d0,$E(a4)
loc_1D5B6:
                
                cmpi.w  #$10,(a5)
                bcs.s   return_1D5C4
                clr.b   ((byte_FFB588-$1000000)).w
                bra.w   sub_1B82A
return_1D5C4:
                
                rts

    ; End of function spellanimationUpdate_ArrowsAndSpears


; =============== S U B R O U T I N E =======================================


spellanimationUpdate_CannonProjectile:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #$26,d0 
                moveq   #7,d1
loc_1D5D6:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1D748
                move.w  2(a5),d1
                bne.w   loc_1D612
                lea     table_1D776(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1D5F6
                addq.w  #8,a0
loc_1D5F6:
                
                bsr.w   sub_19F5E
                moveq   #$10,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #8,d7
                add.w   d7,(a4)
                addq.w  #1,2(a5)
                move.w  #4,4(a5)
                bra.w   loc_1D748
loc_1D612:
                
                addq.w  #1,(a5)
                subq.w  #1,d1
                bne.w   loc_1D69E
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D62E
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D63C
loc_1D62E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D63C:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D65A
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D668
loc_1D65A:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D668:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1D762
                cmpi.w  #3,(a5)
                bne.s   loc_1D68A
                cmpi.b  #8,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.s   loc_1D68A
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D68A:
                
                cmpi.w  #$13,(a5)
                bcs.w   loc_1D748
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                bra.w   loc_1D748
loc_1D69E:
                
                subq.w  #1,d1
                bne.w   loc_1D6D0
                cmpi.w  #$20,(a5) 
                bcs.w   loc_1D748
                move.w  4(a3),VDPSPRITE_OFFSET_X(a4)
                moveq   #$10,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #8,d7
                add.w   6(a3),d7
                move.w  d7,(a4)
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   6(a5)
                bra.w   loc_1D748
loc_1D6D0:
                
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D6E4
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D6F2
loc_1D6E4:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D6F2:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D710
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D71E
loc_1D710:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D71E:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1D762
                cmpi.w  #$10,(a5)
                bcs.w   loc_1D748
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.w   (a5)
                clr.b   ((byte_FFB588-$1000000)).w
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D748:
                
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                addq.w  #8,a4
                lea     $C(a5),a5
                dbf     d1,loc_1D5D6
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_CannonProjectile


; =============== S U B R O U T I N E =======================================


sub_1D762:
                
                subq.w  #1,4(a5)
                bne.s   return_1D774
                move.w  #4,4(a5)
                bchg    #2,5(a4)
return_1D774:
                
                rts

    ; End of function sub_1D762

table_1D776:    dc.b 1
                dc.b $14
                dc.b 0
                dc.b $E8
                dc.b 5
                dc.b $20
                dc.b $C
                dc.b $10
                dc.b 0
                dc.b $D0
                dc.b 0
                dc.b $E0
                dc.b 5
                dc.b $20
                dc.b $C
                dc.b $11

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_ShotProjectile:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   $C(a3)
                bne.w   loc_1D8AE
                addq.w  #1,(a5)
                tst.w   2(a5)
                bne.w   loc_1D810
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D7B8
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D7C6
loc_1D7B8:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D7C6:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D7E4
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D7F2
loc_1D7E4:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D7F2:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1D9B2
                cmpi.w  #$14,(a5)
                bcs.s   loc_1D80C
                addq.w  #1,2(a5)
                move.w  #$1C,4(a5)
loc_1D80C:
                
                bra.w   loc_1D9A8
loc_1D810:
                
                cmpi.w  #1,2(a5)
                bne.w   loc_1D83C
                subq.w  #1,4(a5)
                bne.w   loc_1D9A8
                move.w  4(a3),VDPSPRITE_OFFSET_X(a4)
                move.w  6(a3),(a4)
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   6(a5)
                bra.w   loc_1D9A8
loc_1D83C:
                
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D850
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D85E
loc_1D850:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D85E:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D87C
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D88A
loc_1D87C:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D88A:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1D9B2
                cmpi.w  #$11,(a5)
                bcs.w   loc_1D9A8
                move.w  #1,(a5)
                clr.l   2(a5)
                move.w  #1,$C(a3)
                bra.w   loc_1D9A8
loc_1D8AE:
                
                clr.b   ((byte_FFB588-$1000000)).w
                moveq   #$26,d0 
                moveq   #$F,d1
loc_1D8B6:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1D998
                addq.w  #1,(a5)
                tst.w   2(a5)
                bne.w   loc_1D928
                moveq   #2,d6
                jsr     (GenerateRandomNumber).w
                lea     table_1D9CE(pc), a0
                move.b  d7,$A(a5)
                beq.s   loc_1D8DC
                addq.w  #8,a0
loc_1D8DC:
                
                moveq   #$50,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #$28,d7 
                add.w   8(a3),d7
                move.w  d7,d2
                moveq   #$50,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #$28,d7 
                add.w   $A(a3),d7
                move.w  d7,d3
                moveq   #1,d1
                bsr.w   sub_19FAA
                moveq   #4,d6
                jsr     (GenerateRandomNumber).w
                lsr.w   #1,d7
                bcc.s   loc_1D912
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1D912:
                
                lsr.w   #1,d7
                bcc.s   loc_1D91C
                bset    #4,VDPSPRITE_OFFSET_TILE(a4)
loc_1D91C:
                
                addq.w  #1,2(a5)
                sndCom  SFX_BATTLEFIELD_DEATH
                bra.w   loc_1D998
loc_1D928:
                
                cmpi.w  #4,(a5)
                bne.w   loc_1D954
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1D998
                cmpi.b  #$10,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1D998
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                cmpi.w  #-1,d0
                beq.w   loc_1D998
                
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D954:
                
                tst.b   $A(a5)
                bne.s   loc_1D96E
                lea     table_1D9DE(pc), a0
                moveq   #2,d0
                bsr.w   sub_1B884
                cmpi.w  #9,(a5)
                bcc.w   loc_1D984
                bra.s   loc_1D980
loc_1D96E:
                
                lea     table_1D9EA(pc), a0
                moveq   #3,d0
                bsr.w   sub_1B884
                cmpi.w  #$C,(a5)
                bcc.w   loc_1D984
loc_1D980:
                
                bra.w   loc_1D998
loc_1D984:
                
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.l   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D998:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1D8B6
loc_1D9A8:
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_ShotProjectile


; =============== S U B R O U T I N E =======================================


sub_1D9B2:
                
                move.w  4(a4),d0
                andi.w  #$F800,d0
                ori.w   #$56C,d0
                btst    #1,1(a5)
                beq.s   loc_1D9C8
                addq.w  #4,d0
loc_1D9C8:
                
                move.w  d0,4(a4)
                rts

    ; End of function sub_1D9B2

table_1D9CE:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $60
                dc.b 5
                dc.b $20
                dc.b $FF
                dc.b $F8
                dc.b $FF
                dc.b $F8
                dc.b 5
                dc.b $20
                dc.b $F
                dc.b $20
table_1D9DE:    dc.b 0
                dc.b 3
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $44
                dc.b 0
                dc.b 6
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $48
table_1D9EA:    dc.b 0
                dc.b 3
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b 6
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b 9
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $30

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_GunnerProjectile:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   $C(a3)
                bne.w   loc_1DB2E
                addq.w  #1,(a5)
                tst.w   2(a5)
                bne.w   loc_1DA86
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1DA2E
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1DA3C
loc_1DA2E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1DA3C:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1DA5A
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1DA68
loc_1DA5A:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1DA68:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1DC14
                cmpi.w  #$12,(a5)
                bcs.s   loc_1DA82
                addq.w  #1,2(a5)
                move.w  #$26,4(a5) 
loc_1DA82:
                
                bra.w   loc_1DBF8
loc_1DA86:
                
                cmpi.w  #1,2(a5)
                bne.w   loc_1DAB2
                subq.w  #1,4(a5)
                bne.w   loc_1DBF8
                move.w  4(a3),VDPSPRITE_OFFSET_X(a4)
                move.w  6(a3),(a4)
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   6(a5)
                bra.w   loc_1DBF8
loc_1DAB2:
                
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1DAC6
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1DAD4
loc_1DAC6:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1DAD4:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1DAF2
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1DB00
loc_1DAF2:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1DB00:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1DC14
                cmpi.w  #$F,(a5)
                bcs.w   loc_1DBF8
                move.w  #1,(a5)
                clr.w   2(a5)
                move.w  #1,4(a5)
                move.w  #1,$C(a3)
                sndCom  SFX_BIG_DOOR_RUMBLE
                bra.w   loc_1DBF8
loc_1DB2E:
                
                tst.w   (a5)
                beq.w   loc_1DBF8
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.s   loc_1DB62
                bsr.w   sub_1DC36
                move.b  #OUT_TO_WHITE,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                move.w  #1,(a4)
                bsr.w   sub_1B8FE
loc_1DB62:
                
                bsr.w   sub_1B90C       
                cmpi.w  #$20,(a5) 
                bcs.w   loc_1DBF8
                bne.s   loc_1DB8E
                bsr.w   sub_1DC48
                move.b  #IN_FROM_WHITE,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
loc_1DB8E:
                
                cmpi.w  #$36,(a5) 
                bne.s   loc_1DB9C
                bsr.w   LoadPalette1FromFFB41E
                clr.b   ((byte_FFB588-$1000000)).w
loc_1DB9C:
                
                move.w  2(a5),d4
                subq.w  #1,4(a5)
                bne.w   loc_1DBBC
                move.w  #6,4(a5)
                addq.w  #1,d4
                cmpi.w  #2,d4
                bls.s   loc_1DBB8
                clr.w   d4
loc_1DBB8:
                
                move.w  d4,2(a5)
loc_1DBBC:
                
                lsl.w   #3,d4
                move.w  d4,d0
                lsl.w   #3,d4
                add.w   d0,d4
                btst    #0,1(a5)
                beq.s   loc_1DBD6
                move.w  8(a3),d2
                move.w  $A(a3),d3
                bra.s   loc_1DBDE
loc_1DBD6:
                
                move.w  #$FF81,d2
                move.w  #$FF81,d3
loc_1DBDE:
                
                moveq   #$26,d0 
                moveq   #$C,d1
                lea     table_1DC88(pc), a0
                bsr.w   sub_19FAA       
                moveq   #4,d0
                moveq   #$B,d1
loc_1DBEE:
                
                add.w   d4,(a4,d0.w)
                addq.w  #8,d0
                dbf     d1,loc_1DBEE
loc_1DBF8:
                
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   return_1DC12
                lea     ((PALETTE_1_BASE-$1000000)).w,a0
                lea     ((byte_FFB41E-$1000000)).w,a1
                moveq   #$1F,d0
loc_1DC08:
                
                move.l  (a1)+,(a0)+
                dbf     d0,loc_1DC08
                bra.w   sub_1B82A
return_1DC12:
                
                rts

    ; End of function spellanimationUpdate_GunnerProjectile


; =============== S U B R O U T I N E =======================================


sub_1DC14:
                
                move.w  #$C520,d0
                btst    #1,1(a5)
                bne.s   loc_1DC2E
                btst    #2,1(a5)
                beq.s   loc_1DC2C
                bset    #$B,d0
loc_1DC2C:
                
                bra.s   loc_1DC30
loc_1DC2E:
                
                addq.w  #4,d0
loc_1DC30:
                
                move.w  d0,4(a4)
                rts

    ; End of function sub_1DC14


; =============== S U B R O U T I N E =======================================


sub_1DC36:
                
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                lea     ((byte_FFB41E-$1000000)).w,a1
                moveq   #$1F,d0
loc_1DC40:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_1DC40
                rts

    ; End of function sub_1DC36


; =============== S U B R O U T I N E =======================================


sub_1DC48:
                
                lea     ((byte_FFB41E-$1000000)).w,a0
                lea     ((PALETTE_1_BASE-$1000000)).w,a1
                movem.l a0-a1,-(sp)
                moveq   #$3F,d0 
loc_1DC56:
                
                move.w  (a0)+,d1
                lsr.w   #1,d1
                andi.w  #$EEE,d1
                move.w  d1,(a1)+
                dbf     d0,loc_1DC56
                movem.l (sp)+,a0-a1
                move.w  $52(a0),$52(a1)
                move.l  $5A(a0),$5A(a1)
                rts

    ; End of function sub_1DC48


; =============== S U B R O U T I N E =======================================


LoadPalette1FromFFB41E:
                
                lea     ((PALETTE_1_BASE-$1000000)).w,a0
                lea     ((byte_FFB41E-$1000000)).w,a1
                moveq   #$1F,d0
loc_1DC80:
                
                move.l  (a1)+,(a0)+
                dbf     d0,loc_1DC80
                rts

    ; End of function LoadPalette1FromFFB41E

table_1DC88:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $38
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 5
                dc.b $48
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $58
                dc.b 7
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $60
                dc.b 7
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $40
                dc.b 5
                dc.b $68
                dc.b 7
                dc.b $20
                dc.b 0
                dc.b $30
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $58
                dc.b 7
                dc.b $21
                dc.b 0
                dc.b $30
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $60
                dc.b 7
                dc.b $21
                dc.b 0
                dc.b $30
                dc.b 0
                dc.b $40
                dc.b 5
                dc.b $68
                dc.b 7
                dc.b $21
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $F
                dc.b $21
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $38
                dc.b $F
                dc.b $21
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $40
                dc.b 5
                dc.b $48
                dc.b $F
                dc.b $21

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Dao:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                subq.w  #1,((byte_FFB532-$1000000)).w
                bne.s   loc_1DCFA
                clr.b   ((byte_FFB588-$1000000)).w
loc_1DCFA:
                
                moveq   #$F,d0
loc_1DCFC:
                
                move.w  d0,-(sp)
                tst.w   (a5)
                beq.w   loc_1DDE8
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1DD74
                move.w  #$300,d6
                jsr     (GenerateRandomNumber).w
                subi.w  #$700,d7
                move.w  d7,2(a5)
                moveq   #$35,d1 
                sub.w   d0,d1
                move.w  d1,d0
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                lsl.w   #3,d7
                lea     table_1DE06(pc), a0
                adda.w  d7,a0
                bsr.w   sub_19F5E
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$80,d7 
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                move.w  #$40,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$100,d7
                move.w  d7,(a4)
                btst    #0,d7
                beq.s   loc_1DD60
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1DD60:
                
                btst    #1,d7
                beq.s   byte_1DD6C
                bset    #4,VDPSPRITE_OFFSET_TILE(a4)
byte_1DD6C:
                
                sndCom  SFX_BIG_DOOR_RUMBLE
                bra.w   loc_1DDE8
loc_1DD74:
                
                move.w  2(a5),d1
                add.w   4(a5),d1
                tst.w   d1
                bmi.s   loc_1DD8A
                move.w  d1,d2
                andi.w  #BYTE_MASK,d2
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1DD98
loc_1DD8A:
                
                neg.w   d1
                move.w  d1,d2
                andi.w  #BYTE_MASK,d2
                neg.w   d2
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1DD98:
                
                move.w  d2,4(a5)
                add.w   d1,(a4)
                addi.w  #6,2(a5)
                cmpi.w  #8,(a5)
                bne.w   loc_1DDCC
                cmpi.b  #$10,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1DDE8
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1DDE8
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1DDE8
loc_1DDCC:
                
                cmpi.w  #$60,(a4) 
                bhi.w   loc_1DDE8
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1DDE8:
                
                move.w  (sp)+,d0
                addq.w  #8,a4
                lea     $C(a5),a5
                dbf     d0,loc_1DCFC
                lea     table_1DE1E(pc), a0
                bsr.w   sub_1B8B2
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Dao

table_1DE06:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $21
                dc.b 6
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $27
                dc.b $B
                dc.b $20
table_1DE1E:    dc.b 2
                dc.b $48
                dc.b 0
                dc.b $1E
                dc.b 0
                dc.b 1

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Apollo:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                tst.w   (a5)
                beq.w   loc_1DE80
                addq.w  #1,(a5)
                cmpi.w  #$28,(a5) 
                bne.s   loc_1DE3E
                clr.b   ((byte_FFB588-$1000000)).w
loc_1DE3E:
                
                subq.w  #1,4(a5)
                bne.w   loc_1DE6E
                move.w  #6,4(a5)
                bchg    #6,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1A3E8
                lea     table_1DFA2(pc), a0
                bchg    #0,3(a5)
                bne.s   loc_1DE64
                addq.w  #8,a0
loc_1DE64:
                
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                move.w  (a4),6(a5)
loc_1DE6E:
                
                cmpi.w  #3,4(a5)
                bcc.s   loc_1DE7C
                move.w  6(a5),(a4)
                bra.s   loc_1DE80
loc_1DE7C:
                
                move.w  #1,(a4)
loc_1DE80:
                
                lea     $C(a5),a5
                addq.w  #8,a4
                moveq   #$27,d0 
                moveq   #$13,d1
loc_1DE8A:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1DF7E
                addq.w  #1,(a5)
                tst.b   6(a5)
                beq.s   loc_1DEA0
                subq.w  #1,VDPSPRITE_OFFSET_X(a4)
loc_1DEA0:
                
                move.w  2(a5),d1
                bne.w   loc_1DEFC
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                move.w  d7,d1
                andi.w  #1,d1
                move.b  d1,6(a5)
                andi.w  #$18,d7
                move.b  d7,7(a5)
                lea     table_1DFB2(pc), a0
                tst.b   d1
                beq.s   loc_1DECE
                addq.w  #8,a0
                sndCom  SFX_BATTLEFIELD_DEATH
loc_1DECE:
                
                jsr     sub_19F5E
                or.b    d7,VDPSPRITE_OFFSET_TILE(a4)
                move.w  #$80,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,VDPSPRITE_OFFSET_X(a4)
                move.w  #$A0,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,(a4)
                addq.w  #1,2(a5)
                move.w  #3,4(a5)
                bra.w   loc_1DF7E
loc_1DEFC:
                
                cmpi.w  #3,(a5)
                bne.w   loc_1DF24
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1DF7E
                cmpi.b  #$15,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1DF7E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1DF7E
loc_1DF24:
                
                subq.w  #1,4(a5)
                bne.w   loc_1DF7E
                move.w  #3,4(a5)
                move.w  2(a5),d1
                cmpi.w  #4,d1
                bcc.w   loc_1DF6A
                lea     table_1DFC0(pc), a0
                tst.b   6(a5)
                beq.s   loc_1DF4A
                addq.w  #6,a0
loc_1DF4A:
                
                add.w   d1,d1
                move.w  (a0,d1.w),d1
                addi.w  #-$4000,d1
                clr.w   d2
                move.b  7(a5),d2
                lsl.w   #BYTE_SHIFT_COUNT,d2
                or.w    d2,d1
                move.w  d1,VDPSPRITE_OFFSET_TILE(a4)
                addq.w  #1,2(a5)
                bra.w   loc_1DF7E
loc_1DF6A:
                
                clr.l   (a5)
                clr.l   4(a5)
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1DF7E:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1DE8A
                lea     table_1DFCE(pc), a0
                bsr.w   sub_1B8B2
                cmpi.b  #2,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcs.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Apollo

table_1DFA2:    dc.b 1
                dc.b $12
                dc.b 0
                dc.b $CB
                dc.b 7
                dc.b $80
                dc.b 5
                dc.b $20
                dc.b 1
                dc.b $1E
                dc.b 0
                dc.b $CC
                dc.b 7
                dc.b $84
                dc.b 5
                dc.b $20
table_1DFB2:    dc.b 0
                dc.b $80
                dc.b 0
                dc.b $90
                dc.b 7
                dc.b $94
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $90
                dc.b 6
                dc.b $F0
table_1DFC0:    dc.b $F
                dc.b $20
                dc.b 7
                dc.b $90
                dc.b 7
                dc.b $8C
                dc.b 7
                dc.b $88
                dc.b 5
                dc.b $A0
                dc.b 2
                dc.b $10
                dc.b 1
                dc.b $80
table_1DFCE:    dc.b 0
                dc.b $F
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 1

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Neptun:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                tst.w   (a5)
                beq.w   loc_1E010
                addq.w  #1,(a5)
                cmpi.w  #$28,(a5) 
                bne.s   loc_1DFEA
                clr.b   ((byte_FFB588-$1000000)).w
loc_1DFEA:
                
                subq.b  #1,4(a5)
                bne.w   loc_1E010
                move.b  #3,4(a5)
                lea     table_1E10E(pc), a0
                lea     ((SPRITE_01-$1000000)).w,a4
                moveq   #7,d0
                bsr.w   sub_1E0DA
                lea     ((SPRITE_38-$1000000)).w,a4
                moveq   #$A,d0
                bsr.w   sub_1E0DA
loc_1E010:
                
                lea     $C(a5),a5
                lea     ((SPRITE_60-$1000000)).w,a4
                moveq   #$3C,d0 
                moveq   #2,d1
loc_1E01C:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1E0C0
                addq.w  #1,(a5)
                move.w  2(a5),d2
                bne.w   loc_1E05E
                subq.w  #1,4(a5)
                bne.w   loc_1E0C0
                lea     table_1E106(pc), a0
                bsr.w   sub_19F5E
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                add.w   d7,VDPSPRITE_OFFSET_X(a4)
                addq.w  #1,2(a5)
                move.w  #5,4(a5)
                sndCom  SFX_WING_FLAP
                bra.w   loc_1E0C0
loc_1E05E:
                
                cmpi.w  #3,d2
                bcc.w   loc_1E090
                subq.w  #1,4(a5)
                bne.w   loc_1E0C0
                addi.w  #4,VDPSPRITE_OFFSET_TILE(a4)
                addq.w  #1,2(a5)
                cmpi.w  #2,d2
                bcc.s   loc_1E086
                move.w  #5,4(a5)
                bra.s   loc_1E08C
loc_1E086:
                
                move.w  #$C,4(a5)
loc_1E08C:
                
                bra.w   loc_1E0C0
loc_1E090:
                
                subq.w  #1,4(a5)
                beq.w   loc_1E0AE
                btst    #0,5(a5)
                bne.s   loc_1E0A6
                move.w  #$100,(a4)
                bra.s   loc_1E0AA
loc_1E0A6:
                
                move.w  #1,(a4)
loc_1E0AA:
                
                bra.w   loc_1E0C0
loc_1E0AE:
                
                clr.w   2(a5)
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #4,d7
                move.w  d7,4(a5)
loc_1E0C0:
                
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                lea     $C(a5),a5
                addq.w  #8,a4
                dbf     d1,loc_1E01C
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Neptun


; =============== S U B R O U T I N E =======================================


sub_1E0DA:
                
                moveq   #$70,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$98,d7 
                move.w  d7,(a4)+
                move.w  #$700,(a4)+
                move.w  #$C532,(a4)+
                move.w  (a0),(a4)+
                addi.w  #$20,d7 
                move.w  d7,(a4)+
                move.w  #$500,(a4)+
                move.w  #$C53A,(a4)+
                move.w  (a0)+,(a4)+
                dbf     d0,sub_1E0DA
                rts

    ; End of function sub_1E0DA

table_1E106:    dc.b 0
                dc.b $80
                dc.b 1
                dc.b 0
                dc.b 5
                dc.b $3E
                dc.b 5
                dc.b $20
table_1E10E:    dc.b 0
                dc.b $88
                dc.b 0
                dc.b $95
                dc.b 0
                dc.b $A2
                dc.b 0
                dc.b $AE
                dc.b 0
                dc.b $BD
                dc.b 0
                dc.b $C9
                dc.b 0
                dc.b $D6
                dc.b 0
                dc.b $E3
                dc.b 0
                dc.b $F1
                dc.b 0
                dc.b $FD
                dc.b 1
                dc.b $B
                dc.b 1
                dc.b $17
                dc.b 1
                dc.b $25
                dc.b 1
                dc.b $32
                dc.b 1
                dc.b $3F
                dc.b 1
                dc.b $4B
                dc.b 1
                dc.b $5A
                dc.b 1
                dc.b $66
                dc.b 1
                dc.b $78

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Atlas:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_20-$1000000)).w,a4
                bsr.s   sub_1E160
                lea     $C(a5),a5
                lea     $90(a4),a4
                bsr.s   sub_1E160
                subq.w  #1,((byte_FFB53A-$1000000)).w
                bne.s   loc_1E152
                clr.b   ((byte_FFB588-$1000000)).w
loc_1E152:
                
                bsr.w   sub_1B90C       
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Atlas


; =============== S U B R O U T I N E =======================================


sub_1E160:
                
                tst.w   (a5)
                beq.w   return_1E25C
                addq.w  #1,(a5)
                tst.w   8(a5)
                bne.s   loc_1E17C
                lea     ((byte_FFB532-$1000000)).w,a3
                lea     table_1E290(pc), a0
                move.w  #$10,d0
                bra.s   loc_1E188
loc_1E17C:
                
                lea     ((dword_FFB536-$1000000)).w,a3
                lea     table_1F7BE(pc), a0
                move.w  #$130,d0
loc_1E188:
                
                move.w  2(a5),d1
                bne.w   loc_1E1BC
                subq.w  #1,4(a5)
                bne.w   return_1E25C
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   4(a5)
                moveq   #$18,d6
                jsr     (GenerateRandomNumber).w
                add.w   d7,d0
                moveq   #$30,d6 
                jsr     (GenerateRandomNumber).w
                move.w  d7,d2
                addi.w  #$10,d2
                bra.w   loc_1E268
loc_1E1BC:
                
                subq.w  #1,d1
                bne.w   loc_1E228
                move.w  (a3),d0
                add.w   4(a5),d0
                tst.w   d0
                bmi.s   loc_1E1D6
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1E1E4
loc_1E1D6:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1E1E4:
                
                move.w  d1,4(a5)
                add.w   6(a4),d0
                move.w  2(a3),d2
                add.w   6(a5),d2
                tst.w   d2
                bmi.s   loc_1E202
                move.w  d2,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d2
                bra.s   loc_1E210
loc_1E202:
                
                neg.w   d2
                move.w  d2,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d2
                neg.w   d2
loc_1E210:
                
                move.w  d1,6(a5)
                add.w   (a4),d2
                cmpi.w  #$C,(a5)
                bcs.s   loc_1E224
                addq.w  #1,2(a5)
                lea     $24(a0),a0
loc_1E224:
                
                bra.w   loc_1E268
loc_1E228:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1E25E
                moveq   #2,d6
                jsr     (GenerateRandomNumber).w
                tst.w   d7
                bne.s   byte_1E240
                sndCom  SFX_HIT_1
                bra.s   loc_1E244
byte_1E240:
                
                sndCom  SFX_HIT_2
loc_1E244:
                
                bsr.w   sub_1B8FE
                clr.w   2(a5)
                move.w  #2,4(a5)
                moveq   #2,d6
                jsr     (GenerateRandomNumber).w
                move.w  d7,8(a5)
return_1E25C:
                
                rts
loc_1E25E:
                
                clr.w   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                moveq   #1,d0
                moveq   #1,d2
loc_1E268:
                
                move.l  a4,-(sp)
                moveq   #3,d1
loc_1E26C:
                
                moveq   #3,d3
loc_1E26E:
                
                move.w  d2,(a4)+
                move.w  #$F00,(a4)+
                move.w  (a0)+,(a4)+
                move.w  d0,(a4)+
                addi.w  #$20,d2 
                dbf     d3,loc_1E26E
                addi.w  #$20,d0 
                subi.w  #$80,d2 
                dbf     d1,loc_1E26C
                movea.l (sp)+,a4
                rts

    ; End of function sub_1E160

table_1E290:    dc.b $89
                dc.b $60
                dc.b $89
                dc.b $70
                dc.b $89
                dc.b $F0
                dc.b $8A
                dc.b 0
                dc.b $89
                dc.b $40
                dc.b $89
                dc.b $50
                dc.b $89
                dc.b $D0
                dc.b $89
                dc.b $E0
                dc.b $89
                dc.b $20
                dc.b $89
                dc.b $30
                dc.b $89
                dc.b $B0
                dc.b $89
                dc.b $C0
                dc.b $89
                dc.b 0
                dc.b $89
                dc.b $10
                dc.b $89
                dc.b $90
                dc.b $89
                dc.b $A0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $8D
                dc.b $80
                dc.b $8D
                dc.b $90
                dc.b $8E
                dc.b $D0
                dc.b $8E
                dc.b $E0
                dc.b $8D
                dc.b $60
                dc.b $8D
                dc.b $70
                dc.b $8D
                dc.b $F0
                dc.b $8E
                dc.b $C0
                dc.b $8D
                dc.b $40
                dc.b $8D
                dc.b $50
                dc.b $8D
                dc.b $D0
                dc.b $8D
                dc.b $E0
                dc.b $8D
                dc.b $20
                dc.b $8D
                dc.b $30
                dc.b $8D
                dc.b $B0
                dc.b $8D
                dc.b $C0

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_PrismLaser:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   return_1E452
                addq.w  #1,(a5)
                move.w  2(a5),d1
                cmpi.w  #3,d1
                bhi.w   loc_1E31A
                subq.w  #1,4(a5)
                bne.w   sub_1E4AC
                addq.w  #1,d1
                move.w  d1,2(a5)
                cmpi.w  #4,d1
                bcc.w   sub_1E4AC
                addi.w  #$10,VDPSPRITE_OFFSET_TILE(a4)
                move.w  #$28,4(a5) 
                bra.w   sub_1E4AC
loc_1E31A:
                
                subq.w  #4,d1
                bne.w   loc_1E33C
                move.b  #1,1(a3)
                bsr.w   sub_1E4AC
                tst.w   d0
                bne.w   return_1E452
                move.w  #$D4,(a4) 
                addq.w  #1,2(a5)
                bra.w   return_1E452
loc_1E33C:
                
                subq.w  #1,d1
                bne.w   loc_1E3A8
                tst.w   6(a5)
                bne.s   loc_1E36C
                move.w  #$563|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a4)
                sndCom  SFX_PRISM_LASER_FIRING
                move.b  #OUT_TO_WHITE,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
loc_1E36C:
                
                move.w  #$D8,d3 
                addq.w  #8,a4
                bsr.w   sub_1E454
                cmpi.w  #8,6(a5)
                bcs.w   return_1E452
                addq.w  #1,2(a5)
                move.w  #$1E,4(a5)
                move.b  #IN_FROM_WHITE,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                bra.w   return_1E452
loc_1E3A8:
                
                subq.w  #1,d1
                bne.w   loc_1E3C2
                subq.w  #1,4(a5)
                bne.w   return_1E452
                addq.w  #1,2(a5)
                clr.w   6(a5)
                bra.w   return_1E452
loc_1E3C2:
                
                subq.w  #1,d1
                bne.w   loc_1E3E2
                bsr.w   sub_1E48A
                cmpi.w  #9,6(a5)
                bcs.w   return_1E452
                addq.w  #1,2(a5)
                clr.b   ((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                bra.w   return_1E452
loc_1E3E2:
                
                subq.w  #1,d1
                bne.w   loc_1E404
                cmpi.b  #3,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                bne.w   loc_1E44A
                move.b  #1,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                addq.w  #1,2(a5)
                clr.w   6(a5)
                bra.w   loc_1E44A
loc_1E404:
                
                subq.w  #1,d1
                bne.w   loc_1E432
                tst.w   6(a5)
                bne.s   loc_1E414
                sndCom  SFX_PRISM_LASER_FIRING
loc_1E414:
                
                move.w  #$80,d3 
                bsr.w   sub_1E454
                cmpi.w  #9,6(a5)
                bcs.w   loc_1E44A
                addq.w  #1,2(a5)
                clr.w   6(a5)
                bra.w   loc_1E44A
loc_1E432:
                
                bsr.w   sub_1E48A
                cmpi.w  #9,6(a5)
                bcs.w   loc_1E44A
                clr.b   ((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                move.w  #7,2(a5)
loc_1E44A:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
return_1E452:
                
                rts

    ; End of function spellanimationUpdate_PrismLaser


; =============== S U B R O U T I N E =======================================


sub_1E454:
                
                move.w  6(a5),d2
                beq.s   loc_1E476
                subq.w  #1,d2
                lsl.w   #3,d2
                adda.w  d2,a4
                move.w  #$D4,(a4)+ 
                move.w  #$F00,(a4)+
                move.w  #$C573,(a4)+
                lsl.w   #2,d2
                add.w   d2,d3
                move.w  d3,(a4)+
                addi.w  #$20,d3 
loc_1E476:
                
                move.w  #$D4,(a4)+ 
                move.w  #$F00,(a4)+
                move.w  #$C583,(a4)+
                move.w  d3,(a4)
                addq.w  #1,6(a5)
                rts

    ; End of function sub_1E454


; =============== S U B R O U T I N E =======================================


sub_1E48A:
                
                move.w  6(a5),d2
                beq.s   loc_1E4A0
                subq.w  #1,d2
                lsl.w   #3,d2
                adda.w  d2,a4
                move.w  #1,(a4)+
                clr.l   (a4)+
                move.w  #1,(a4)+
loc_1E4A0:
                
                move.w  #$CD83,4(a4)
                addq.w  #1,6(a5)
                rts

    ; End of function sub_1E48A


; =============== S U B R O U T I N E =======================================


sub_1E4AC:
                
                movem.l a4-a5,-(sp)
                bchg    #0,(a3)
                bne.s   loc_1E4BC
                move.w  #$D4,(a4) 
                bra.s   loc_1E4C0
loc_1E4BC:
                
                move.w  #1,(a4)
loc_1E4C0:
                
                moveq   #0,d0
                moveq   #4,d1
loc_1E4C4:
                
                lea     $C(a5),a5
                addq.w  #8,a4
                tst.w   (a5)
                beq.w   loc_1E5C6
                addq.w  #1,d0
                cmpi.w  #2,(a5)
                bcc.w   loc_1E532
                subq.w  #1,2(a5)
                bne.w   loc_1E5C6
                moveq   #$38,d6 
                jsr     (GenerateRandomNumber).w
                move.w  d7,d2
                addi.w  #$C8,d2 
                move.w  d2,(a4)
                clr.w   2(a4)
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #-$3AE0,d7
                move.w  d7,4(a4)
                moveq   #$14,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$D4,d7 
                move.w  d7,6(a4)
                subi.w  #$C0,d7 
                asl.w   #NIBBLE_SHIFT_COUNT,d7
                neg.w   d7
                move.w  d7,4(a5)
                subi.w  #$E4,d2 
                asl.w   #NIBBLE_SHIFT_COUNT,d2
                neg.w   d2
                move.w  d2,6(a5)
                clr.l   8(a5)
                addq.w  #1,(a5)
                bra.w   loc_1E5C6
loc_1E532:
                
                addq.w  #1,(a5)
                cmpi.w  #$12,(a5)
                bcc.w   loc_1E596
                move.w  4(a5),d2
                add.w   8(a5),d2
                tst.w   d2
                bmi.s   loc_1E552
                move.w  d2,d3
                andi.w  #BYTE_MASK,d3
                asr.w   #BYTE_SHIFT_COUNT,d2
                bra.s   loc_1E560
loc_1E552:
                
                neg.w   d2
                move.w  d2,d3
                andi.w  #BYTE_MASK,d3
                neg.w   d3
                asr.w   #BYTE_SHIFT_COUNT,d2
                neg.w   d2
loc_1E560:
                
                move.w  d3,8(a5)
                add.w   d2,6(a4)
                move.w  6(a5),d2
                add.w   $A(a5),d2
                tst.w   d2
                bmi.s   loc_1E57E
                move.w  d2,d3
                andi.w  #BYTE_MASK,d3
                asr.w   #BYTE_SHIFT_COUNT,d2
                bra.s   loc_1E58C
loc_1E57E:
                
                neg.w   d2
                move.w  d2,d3
                andi.w  #BYTE_MASK,d3
                neg.w   d3
                asr.w   #BYTE_SHIFT_COUNT,d2
                neg.w   d2
loc_1E58C:
                
                move.w  d3,$A(a5)
                add.w   d2,(a4)
                bra.w   loc_1E5C6
loc_1E596:
                
                move.w  #1,(a4)
                clr.l   2(a4)
                move.w  #1,6(a4)
                tst.b   1(a3)
                bne.s   loc_1E5C2
                move.w  #1,(a5)
                move.w  #4,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,2(a5)
                sndCom  SFX_PRISM_LASER_LOADING
                bra.s   loc_1E5C6
loc_1E5C2:
                
                clr.l   (a5)
                subq.w  #1,d0
loc_1E5C6:
                
                dbf     d1,loc_1E4C4
                movem.l (sp)+,a4-a5
                rts

    ; End of function sub_1E4AC


; =============== S U B R O U T I N E =======================================


spellanimationUpdate_BubbleBreath:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                moveq   #$F,d7
                moveq   #$26,d6 
loc_1E5DC:
                
                tst.w   (a5)
                beq.w   loc_1E75A
                cmpi.w  #1,(a5)
                bne.s   loc_1E622
                movem.w d6-d7,-(sp)
                move.w  #$200,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$140,d7
                move.w  d7,2(a5)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                subi.w  #$200,d7
                move.w  d7,4(a5)
                movem.w (sp)+,d6-d7
                lea     table_1E786(pc), a0
                move.w  d6,d0
                bsr.w   sub_19F5E
                sndCom  SFX_SPAWN
                bra.w   loc_1E730
loc_1E622:
                
                cmpi.w  #$28,(a5) 
                bcc.w   loc_1E68C
                move.w  2(a5),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1E640
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1E64E
loc_1E640:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1E64E:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  4(a5),d0
                addi.w  #$1C,d0
                move.w  d0,4(a5)
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1E674
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1E682
loc_1E674:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1E682:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bra.w   loc_1E730
loc_1E68C:
                
                bne.w   loc_1E6B4
                movem.w d6-d7,-(sp)
                clr.w   2(a5)
                move.w  #$20,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #$40,d7 
                move.w  d7,4(a5)
                clr.l   6(a5)
                movem.w (sp)+,d6-d7
                bra.w   loc_1E730
loc_1E6B4:
                
                cmpi.w  #$50,(a5) 
                bcc.w   loc_1E716
                addq.w  #1,2(a5)
                move.w  2(a5),d0
                lsr.w   #1,d0
                andi.w  #3,d0
                cmpi.w  #3,d0
                bcs.s   loc_1E6D2
                moveq   #2,d0
loc_1E6D2:
                
                btst    #3,3(a5)
                beq.s   loc_1E6DC
                neg.w   d0
loc_1E6DC:
                
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  4(a5),d0
                subi.w  #$20,d0 
                move.w  d0,4(a5)
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1E6FE
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1E70C
loc_1E6FE:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1E70C:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bra.w   loc_1E730
loc_1E716:
                
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.b   ((byte_FFB588-$1000000)).w
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.s   loc_1E75A
loc_1E730:
                
                addq.w  #1,(a5)
                lea     table_1E78E(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$A,(a5)
                bne.s   loc_1E75A
                cmpi.b  #$10,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.s   loc_1E75A
                tst.w   ((byte_FFB404-$1000000)).w
                beq.s   loc_1E75A
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1E75A:
                
                btst    #2,1(a5)
                bne.s   loc_1E76A
                bclr    #3,VDPSPRITE_OFFSET_TILE(a4)
                bra.s   loc_1E770
loc_1E76A:
                
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1E770:
                
                addq.w  #8,a4
                lea     $C(a5),a5
                addq.w  #1,d6
                dbf     d7,loc_1E5DC
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_BubbleBreath

table_1E786:    dc.b 0
                dc.b $D4
                dc.b 0
                dc.b $F8
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
table_1E78E:    dc.b 0
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b $14
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b $1E
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 3
                dc.b 0
                dc.b $28
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $32
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b $3C
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $11

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_SnowBreath:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                addq.b  #1,2(a3)
                move.b  2(a3),3(a3)
                moveq   #$18,d1
                moveq   #$26,d0 
loc_1E7CC:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1E8AA
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1E806
                lea     table_1E8E2(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1E7EE
                addq.w  #8,a0
loc_1E7EE:
                
                bsr.w   sub_19F5E
                move.w  (a4),8(a5)
                moveq   #$28,d6 
                jsr     (GenerateRandomNumber).w
                add.w   (a3),d7
                move.w  d7,2(a5)
                bra.w   loc_1E8AA
loc_1E806:
                
                move.w  2(a5),d0
                jsr     (sub_179C).w    
                asl.w   #2,d1
                add.w   4(a5),d1
                tst.w   d1
                bmi.s   loc_1E822
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1E830
loc_1E822:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1E830:
                
                move.w  d0,4(a5)
                add.w   d1,VDPSPRITE_OFFSET_X(a4)
                swap    d1
                asl.w   #2,d1
                add.w   6(a5),d1
                tst.w   d1
                bmi.s   loc_1E84E
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1E85C
loc_1E84E:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1E85C:
                
                move.w  d0,6(a5)
                add.w   d1,8(a5)
                cmpi.w  #5,(a5)
                bne.w   loc_1E88A
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1E8AA
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                cmpi.w  #-1,d0
                beq.w   loc_1E8AA
                
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1E8AA
loc_1E88A:
                
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1E8AA
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.b   ((byte_FFB588-$1000000)).w
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1E8AA:
                
                move.w  8(a5),(a4)
                moveq   #$10,d0
                lea     table_1E8F2(pc), a0
                bsr.w   sub_1B884
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1E7CC
                move.b  2(a3),d0
                andi.w  #3,d0
                bne.s   loc_1E8D6
                sndCom  SFX_TINKLING
loc_1E8D6:
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                bra.w   loc_1D45C

    ; End of function spellanimationUpdate_SnowBreath

table_1E8E2:    dc.b 1
                dc.b $1C
                dc.b 0
                dc.b $DE
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $E0
                dc.b 0
                dc.b $DF
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
table_1E8F2:    dc.b 0
                dc.b 2
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b 4
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 6
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $C
                dc.b 0
                dc.b 8
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b $A
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $14
                dc.b 0
                dc.b $D
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $18
                dc.b 0
                dc.b $F
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $21
                dc.b 0
                dc.b $11
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $2A
                dc.b 0
                dc.b $13
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $33
                dc.b 0
                dc.b $15
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $3C
                dc.b 0
                dc.b $17
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $45
                dc.b 0
                dc.b $1A
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $4E
                dc.b 0
                dc.b $1C
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $5E
                dc.b 0
                dc.b $1E
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $6E
                dc.b 0
                dc.b $20
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $7E
                dc.b 0
                dc.b $22
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $8E
                dc.b 0
                dc.b $24
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $9E

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_AttackSpell:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   loc_1CD70
                addq.w  #1,(a5)
                cmpi.w  #2,(a3)
                beq.w   loc_1E994
                tst.w   (a3)
                bne.w   loc_1E9B4
                lea     table_1CE0C(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1E9B4
                move.w  #1,(a3)
                bra.w   loc_1E9B4
loc_1E994:
                
                lea     table_1CE2A(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1E9B4
                clr.w   (a5)
                move.w  #1,(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1CD70
loc_1E9B4:
                
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1E9D0
                btst    #2,((byte_FFB56F-$1000000)).w
                bne.s   loc_1E9CA
                move.w  #$D0,d3 
                bra.s   loc_1E9CE
loc_1E9CA:
                
                move.w  #$130,d3
loc_1E9CE:
                
                bra.s   loc_1E9E2
loc_1E9D0:
                
                btst    #1,((byte_FFB56F-$1000000)).w
                bne.s   loc_1E9DE
                move.w  #$138,d3
                bra.s   loc_1E9E2
loc_1E9DE:
                
                move.w  #$C8,d3 
loc_1E9E2:
                
                move.w  2(a5),d0
                subq.w  #8,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,2(a5)
                move.l  #$12003800,d1
                jsr     (sub_1812).w    
                add.w   d3,d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                swap    d2
                addi.w  #$D0,d2 
                move.w  d2,(a4)
                bra.w   loc_1CD10

    ; End of function spellanimationUpdate_AttackSpell


; =============== S U B R O U T I N E =======================================


spellanimationUpdate_PhoenixAttack:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                btst    #0,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1EAB2
                moveq   #$26,d0 
                moveq   #2,d1
loc_1EA22:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1EA98
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1EA46
                lea     table_1EB88(pc), a0
                bsr.w   sub_19F5E
                sndCom  SFX_SPAWN
                bra.w   loc_1EA98
loc_1EA46:
                
                subq.w  #3,VDPSPRITE_OFFSET_X(a4)
                lea     table_1EB90(pc), a0
                moveq   #3,d0
                bsr.w   sub_1B884
                cmpi.w  #$C,(a5)
                bne.w   loc_1EA7C
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1EA98
                cmpi.b  #3,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1EA98
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1EA98
loc_1EA7C:
                
                cmpi.w  #$1A,(a5)
                bcs.w   loc_1EA98
                clr.w   (a5)
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
loc_1EA98:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1EA22
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts
loc_1EAB2:
                
                tst.w   (a5)
                beq.w   loc_1EB7E
                addq.w  #1,(a5)
                move.w  2(a5),d0
                bne.w   loc_1EAD4
                lea     table_1EBA2(pc), a0
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                addq.w  #1,2(a5)
                bra.w   loc_1EB7E
loc_1EAD4:
                
                subq.w  #1,d0
                bne.w   loc_1EAFE
                cmpi.w  #4,(a5)
                bcs.w   loc_1EB7E
                moveq   #$27,d0 
                moveq   #2,d1
                clr.w   d2
                clr.w   d3
                lea     table_1EBAA(pc), a0
                bsr.w   sub_19FAA       
                sndCom  SFX_DESOUL_HOVERING
                addq.w  #1,2(a5)
                bra.w   loc_1EB7E
loc_1EAFE:
                
                cmpi.w  #6,(a5)
                bne.s   loc_1EB12
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
loc_1EB12:
                
                addq.w  #8,a4
                move.w  4(a5),d0
                subq.w  #2,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,4(a5)
                move.w  #$3000,d1
                jsr     (sub_17EC).w    
                addi.w  #$D8,d2 
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                move.w  d2,$E(a4)
                swap    d2
                addi.w  #$A4,d2 
                move.w  d2,(a4)
                addi.w  #$20,d2 
                move.w  d2,8(a4)
                btst    #0,1(a5)
                bne.s   loc_1EB72
                move.w  6(a5),d0
                addq.w  #1,d0
                cmpi.w  #3,d0
                bcs.s   loc_1EB5C
                clr.w   d0
loc_1EB5C:
                
                move.w  d0,6(a5)
                lsl.w   #5,d0
                addi.w  #-$3AB5,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                addi.w  #$10,d0
                move.w  d0,$C(a4)
loc_1EB72:
                
                cmpi.w  #$1A,(a5)
                bne.w   loc_1EB7E
                clr.b   ((byte_FFB588-$1000000)).w
loc_1EB7E:
                
                cmpi.w  #$22,(a5) 
                bcc.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_PhoenixAttack

table_1EB88:    dc.b 1
                dc.b $1C
                dc.b 0
                dc.b $D4
                dc.b 5
                dc.b $20
                dc.b $F
                dc.b $20
table_1EB90:    dc.b 0
                dc.b 8
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b $E
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $14
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $30
table_1EBA2:    dc.b 0
                dc.b $FD
                dc.b 0
                dc.b $DD
                dc.b 5
                dc.b $DF
                dc.b $F
                dc.b $23
table_1EBAA:    dc.b 0
                dc.b $6E
                dc.b 0
                dc.b $4E
                dc.b 5
                dc.b $4B
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $6E
                dc.b 0
                dc.b $6E
                dc.b 5
                dc.b $5B
                dc.b $F
                dc.b $20

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_BurstRockExplosion:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                moveq   #$26,d0 
                moveq   #$F,d1
loc_1EBC6:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1EC80
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1EC22
                moveq   #7,d6
                jsr     (GenerateRandomNumber).w
                lea     table_1EC9A(pc), a0
                bclr    #0,d7
                bne.s   loc_1EBF2
                move.b  #1,2(a5)
                addq.w  #8,a0
loc_1EBF2:
                
                bsr.w   sub_19F5E
                lsl.w   #2,d7
                or.b    d7,VDPSPRITE_OFFSET_TILE(a4)
                move.w  #$C0,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$A0,d7 
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                move.w  #$80,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$A0,d7 
                move.w  d7,(a4)
                sndCom  SFX_BATTLEFIELD_DEATH
                bra.w   loc_1EC80
loc_1EC22:
                
                cmpi.w  #4,(a5)
                bne.w   loc_1EC46
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1EC46
                cmpi.b  #$10,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1EC46
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1EC46:
                
                tst.b   2(a5)
                bne.s   loc_1EC5A
                lea     table_1ECAA(pc), a0
                moveq   #3,d0
                bsr.w   sub_1B884
                moveq   #$E,d0
                bra.s   loc_1EC66
loc_1EC5A:
                
                lea     table_1ECBC(pc), a0
                moveq   #2,d0
                bsr.w   sub_1B884
                moveq   #$B,d0
loc_1EC66:
                
                cmp.w   (a5),d0
                bhi.w   loc_1EC80
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.l   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1EC80:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1EBC6
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_BurstRockExplosion

table_1EC9A:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $20
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $60
                dc.b 5
                dc.b $20
table_1ECAA:    dc.b 0
                dc.b 5
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b 8
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $B
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $30
table_1ECBC:    dc.b 0
                dc.b 5
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $44
                dc.b 0
                dc.b 8
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $48

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_OddEyeBeam:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   return_1EDDA
                addq.w  #1,(a5)
                move.b  2(a5),d0
                bne.w   loc_1ED06
                move.w  6(a5),d0
                move.w  (a4),d1
                move.w  d1,6(a5)
                move.w  d0,(a4)
                subq.b  #1,3(a5)
                bne.w   return_1EDDA
                addq.b  #1,2(a5)
                move.b  #2,3(a5)
                bra.w   return_1EDDA
loc_1ED06:
                
                subq.b  #1,d0
                bne.w   loc_1ED64
                subq.b  #1,3(a5)
                bne.w   return_1EDDA
                move.b  #2,3(a5)
                tst.w   4(a5)
                bne.s   loc_1ED42
                move.w  2(a3),(a4)
                move.w  #VDPSPRITESIZE_V1|VDPSPRITESIZE_H4,VDPSPRITE_OFFSET_SIZE(a4)
                move.w  #$C524,d0
                or.w    4(a3),d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                move.w  (a3),VDPSPRITE_OFFSET_X(a4)
                addq.w  #1,4(a5)
                bra.w   return_1EDDA
loc_1ED42:
                
                move.w  (a3),d2
                bsr.w   sub_1EDDC
                cmpi.w  #6,4(a5)
                bcs.w   return_1EDDA
                addq.b  #1,2(a5)
                move.b  #$1E,3(a5)
                clr.b   ((byte_FFB588-$1000000)).w
                bra.w   return_1EDDA
loc_1ED64:
                
                subq.b  #1,d0
                bne.w   loc_1ED84
                subq.b  #1,3(a5)
                bne.w   return_1EDDA
                addq.b  #1,2(a5)
                move.b  #2,3(a5)
                clr.w   4(a5)
                bra.w   return_1EDDA
loc_1ED84:
                
                subq.b  #1,d0
                bne.w   loc_1EDB2
                subq.b  #1,3(a5)
                bne.w   return_1EDDA
                move.b  #2,3(a5)
                bsr.w   sub_1EE1A
                cmpi.w  #6,4(a5)
                bcs.w   return_1EDDA
                addq.b  #1,2(a5)
                clr.b   ((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                bra.w   return_1EDDA
loc_1EDB2:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
                cmpi.b  #3,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                bne.w   return_1EDDA
                move.b  #1,((byte_FFB588-$1000000)).w
                move.b  #1,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                move.w  #$102,2(a5)
                clr.w   4(a5)
return_1EDDA:
                
                rts

    ; End of function spellanimationUpdate_OddEyeBeam


; =============== S U B R O U T I N E =======================================


sub_1EDDC:
                
                move.w  4(a5),d0
                moveq   #$20,d1 
                tst.w   4(a3)
                beq.s   loc_1EDEA
                neg.w   d1
loc_1EDEA:
                
                muls.w  d0,d1
                add.w   d2,d1
                lsl.w   #3,d0
                lea     (a4,d0.w),a0
                cmpi.w  #2,4(a5)
                bcs.s   loc_1EE00
                subq.w  #4,-4(a0)
loc_1EE00:
                
                move.w  2(a3),(a0)+
                move.w  #$C00,(a0)+
                move.w  #$C52C,d0
                or.w    4(a3),d0
                move.w  d0,(a0)+
                move.w  d1,(a0)+
                addq.w  #1,4(a5)
                rts

    ; End of function sub_1EDDC


; =============== S U B R O U T I N E =======================================


sub_1EE1A:
                
                move.w  4(a5),d0
                lsl.w   #3,d0
                move.w  #1,(a4,d0.w)
                addq.w  #1,4(a5)
                rts

    ; End of function sub_1EE1A


; =============== S U B R O U T I N E =======================================


VInt_UpdateBattlesceneGraphics:
                
                addq.w  #1,((BATTLESCENE_FRAME_COUNTER-$1000000)).w
                clr.b   ((WAITING_FOR_BATTLESCENE_GRAPHICS_UPDATE-$1000000)).w
                bsr.w   UpdateEnemyBattlespriteAnimationCounter
                bsr.w   UpdateAllyBattlespriteAnimationCounter
                bsr.w   UpdateStatusEffectAnimations
                bsr.w   sub_1F282
                bsr.w   UpdateSpellanimation
                bsr.w   UpdateEnemyBattlespritePosition
                bsr.w   UpdateAllyBattlespritePosition
                jmp     (sub_1942).w    

    ; End of function VInt_UpdateBattlesceneGraphics


; =============== S U B R O U T I N E =======================================


UpdateEnemyBattlespriteAnimationCounter:
                
                btst    #3,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                btst    #5,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                subq.w  #1,((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                bne.s   @Return
                bsr.w   sub_1EF2E
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w,((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
@Return:
                
                rts

    ; End of function UpdateEnemyBattlespriteAnimationCounter


; =============== S U B R O U T I N E =======================================


UpdateAllyBattlespriteAnimationCounter:
                
                btst    #1,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                btst    #4,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                subq.w  #1,((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                bne.s   @Return
                bsr.s   UpdateWeaponsprite
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w,((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
@Return:
                
                rts

    ; End of function UpdateAllyBattlespriteAnimationCounter


; =============== S U B R O U T I N E =======================================


UpdateWeaponsprite:
                
                bchg    #0,((byte_FFB56E-$1000000)).w
                beq.s   @loc_1
                clr.w   d2
                move.b  ((WEAPON_IDLE_FRAME1_X-$1000000)).w,d3
                move.b  ((WEAPON_IDLE_FRAME1_Y-$1000000)).w,d4
                bra.s   @loc_2
@loc_1:
                
                move.w  #$90,d2 
                move.b  ((WEAPON_IDLE_FRAME2_X-$1000000)).w,d3
                move.b  ((WEAPON_IDLE_FRAME2_Y-$1000000)).w,d4
@loc_2:
                
                lea     (sprite_BattlesceneAlly+4)(pc), a0
                btst    #0,((byte_FFB56F-$1000000)).w
                beq.s   @loc_3
                lea     $48(a0),a0
@loc_3:
                
                lea     ((SPRITE_01_VDPTILE-$1000000)).w,a1
                moveq   #8,d7
@loc_4:
                
                move.w  (a0),(a1)
                add.w   d2,(a1)
                addq.w  #8,a0
                addq.w  #8,a1
                dbf     d7,@loc_4
                cmpi.w  #-1,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
                beq.w   @Return
                
                ext.w   d3
                ext.w   d4
                move.b  ((WEAPON_FRAME_INDEX-$1000000)).w,d7
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   @loc_5
                bchg    #4,d7
@loc_5:
                
                lea     sprite_BattlesceneWeapon(pc), a0
                andi.w  #$30,d7 
                add.w   d7,d7
                adda.w  d7,a0
                lea     ((SPRITE_BATTLESCENE_WEAPON-$1000000)).w,a1
                moveq   #3,d7
@loc_6:
                
                move.w  (a0),d0
                subi.w  #$C0,d0 
                add.w   ((BATTLESCENE_ALLY_Y-$1000000)).w,d0
                add.w   d4,d0
                move.w  d0,(a1)
                addq.w  #6,a0
                addq.w  #6,a1
                move.w  (a0)+,d0
                subi.w  #$108,d0
                add.w   ((BATTLESCENE_ALLY_X-$1000000)).w,d0
                add.w   d3,d0
                move.w  d0,(a1)+
                dbf     d7,@loc_6
@Return:
                
                rts

    ; End of function UpdateWeaponsprite


; =============== S U B R O U T I N E =======================================


sub_1EF2E:
                
                bsr.w   LoadBattlesceneEnemyLayout
                bra.w   loc_1EFB0

    ; End of function sub_1EF2E


; =============== S U B R O U T I N E =======================================

; related to loading enemy plane layout to VRAM


sub_1EF36:
                
                bsr.w   LoadBattlesceneEnemyLayout
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jmp     (ApplyImmediateVramDma).w

    ; End of function sub_1EF36


; =============== S U B R O U T I N E =======================================


LoadBattlesceneEnemyLayout:
                
                lea     layout_BattlesceneEnemy(pc), a0
                lea     (BATTLESCENE_ENEMY_LAYOUT).l,a1
                bchg    #2,((byte_FFB56E-$1000000)).w
                beq.s   @loc1
                move.w  #$220|VDPTILE_PALETTE2|VDPTILE_PRIORITY,d0
                bra.s   @loc2
@loc1:
                
                move.w  #$2E0|VDPTILE_PALETTE2|VDPTILE_PRIORITY,d0
@loc2:
                
                btst    #2,((byte_FFB56F-$1000000)).w
                bne.s   @loc5
                
                moveq   #11,d7
@loc3:
                
                moveq   #15,d6
@loc4:
                
                clr.w   d5
                move.b  (a0)+,d5
                add.w   d0,d5
                move.w  d5,(a1)+
                dbf     d6,@loc4
                
                lea     32(a1),a1
                dbf     d7,@loc3
                
                bra.s   @return
@loc5:
                
                bset    #11,d0
                lea     32(a1),a1
                moveq   #11,d7
@loc6:
                
                moveq   #15,d6
@loc7:
                
                clr.w   d5
                move.b  (a0)+,d5
                add.w   d0,d5
                move.w  d5,-(a1)
                dbf     d6,@loc7
                
                lea     96(a1),a1
                dbf     d7,@loc6
@return:
                
                rts

    ; End of function LoadBattlesceneEnemyLayout


; START OF FUNCTION CHUNK FOR sub_1EF2E

loc_1EFB0:
                
                tst.b   ((WAITING_FOR_BATTLESCENE_GRAPHICS_UPDATE-$1000000)).w
                bne.s   @return
                
                move.b  #1,((WAITING_FOR_BATTLESCENE_GRAPHICS_UPDATE-$1000000)).w
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
@return:
                
                rts

; END OF FUNCTION CHUNK FOR sub_1EF2E


; =============== S U B R O U T I N E =======================================


UpdateStatusEffectAnimations:
                
                clr.w   d7
                move.b  ((byte_FFB580-$1000000)).w,d7
                addq.b  #1,d7
                andi.b  #$3F,d7 
                move.b  d7,((byte_FFB580-$1000000)).w
                move.b  ((BATTLESCENE_ALLY_STATUS_ANIMATION-$1000000)).w,d0
                btst    #1,((byte_FFB56E-$1000000)).w
                bne.s   loc_1EFFE
                btst    #4,((byte_FFB56E-$1000000)).w
                bne.s   loc_1EFFE
                clr.w   d0
loc_1EFFE:
                
                move.b  ((ALLY_BATTLESPRITE_PROP2-$1000000)).w,d1
                ext.w   d1
                btst    #1,((byte_FFB56F-$1000000)).w
                bne.s   loc_1F012
                move.b  ((ALLY_BATTLESPRITE_PROP1-$1000000)).w,d4
                bra.s   loc_1F01A
loc_1F012:
                
                move.b  #$60,d4 
                sub.b   ((ALLY_BATTLESPRITE_PROP1-$1000000)).w,d4
loc_1F01A:
                
                ext.w   d4
                add.w   ((BATTLESCENE_ALLY_Y-$1000000)).w,d1
                add.w   ((BATTLESCENE_ALLY_X-$1000000)).w,d4
                lea     ((BATTLESCENE_ALLY_X_SPEED-$1000000)).w,a1
                bsr.w   sub_1F0B0
                lea     ((SPRITE_17-$1000000)).w,a0
                move.w  d1,(a0)+
                move.w  d2,(a0)+
                move.w  d3,(a0)+
                move.w  d4,(a0)
                move.b  #2,(byte_FFAFB1).l
                clr.w   d7
                move.b  ((byte_FFB581-$1000000)).w,d7
                addq.b  #1,d7
                andi.b  #$3F,d7 
                move.b  d7,((byte_FFB581-$1000000)).w
                move.b  ((BATTLESCENE_ENEMY_STATUS_ANIMATION-$1000000)).w,d0
                btst    #3,((byte_FFB56E-$1000000)).w
                bne.s   loc_1F066
                btst    #5,((byte_FFB56E-$1000000)).w
                bne.s   loc_1F066
                clr.w   d0
loc_1F066:
                
                move.b  ((ENEMY_BATTLESPRITE_PROP2-$1000000)).w,d1
                ext.w   d1
                btst    #2,((byte_FFB56F-$1000000)).w
                bne.s   loc_1F07A
                move.b  ((ENEMY_BATTLESPRITE_PROP1-$1000000)).w,d4
                bra.s   loc_1F082
loc_1F07A:
                
                move.b  #$80,d4
                sub.b   ((ENEMY_BATTLESPRITE_PROP1-$1000000)).w,d4
loc_1F082:
                
                ext.w   d4
                addi.w  #$B0,d1 
                add.w   ((word_FFB3F0-$1000000)).w,d1
                addi.w  #$90,d4 
                add.w   ((word_FFB3EC-$1000000)).w,d4
                lea     ((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w,a1
                bsr.s   sub_1F0B0
                lea     ((SPRITE_18-$1000000)).w,a0
                move.w  d1,(a0)+
                move.w  d2,(a0)+
                move.w  d3,(a0)+
                move.w  d4,(a0)
                move.b  #2,(word_FFAFB2).l
                rts

    ; End of function UpdateStatusEffectAnimations


; =============== S U B R O U T I N E =======================================


sub_1F0B0:
                
                tst.b   d0
                beq.w   loc_1F11E
                subq.b  #1,d0
                bne.s   loc_1F0D0
                btst    #4,d7
                beq.w   loc_1F11E
                move.w  #$500,d2
                move.w  #$7BB|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d3
                subq.w  #8,d1
                subq.w  #8,d4
                rts
loc_1F0D0:
                
                subq.b  #1,d0
                bne.s   loc_1F0F2
                move.w  #$900,d2
                move.w  #$7BF|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d3
                lsr.w   #3,d7
                andi.w  #3,d7
                mulu.w  #6,d7
                add.w   d7,d3
                subi.w  #$20,d1 
                subi.w  #$C,d4
                rts
loc_1F0F2:
                
                subq.b  #1,d0
                bne.s   loc_1F10E
                lsr.w   #NIBBLE_SHIFT_COUNT,d7
                andi.w  #3,d7
                beq.s   loc_1F11E
                lsl.w   #3,d7
                lea     sprite_1F128-8(pc,d7.w),a1
                add.w   (a1)+,d1
                move.w  (a1)+,d2
                move.w  (a1)+,d3
                add.w   (a1),d4
                rts
loc_1F10E:
                
                subq.b  #1,d0
                bne.s   loc_1F11E
                andi.w  #3,d7
                add.w   d7,d7
                move.w  table_1F140(pc,d7.w),d0
                add.w   d0,(a1)
loc_1F11E:
                
                moveq   #1,d1
loc_1F120:
                
                move.w  d1,d2
                move.w  d1,d3
                move.w  d1,d4
                rts

    ; End of function sub_1F0B0

sprite_1F128:   vdpSprite 65528, V1|H1|0, 1968|PALETTE3|PRIORITY, 65532 
                                                        ; VDP sprite definitions related to battlescene status effect sprites
                vdpSprite 65520, V2|H2|0, 1969|PALETTE3|PRIORITY, 65532
                vdpSprite 65512, V3|H2|0, 1973|PALETTE3|PRIORITY, 65532
                
table_1F140:    dc.w 1
                dc.w -1
                dc.w 1
                dc.w -1

; =============== S U B R O U T I N E =======================================


UpdateEnemyBattlespritePosition:
                
                cmpi.w  #-1,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   @Return
                
                move.w  ((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w,d6
                beq.s   @loc_1
                
                add.w   ((word_FFB3EC-$1000000)).w,d6
                bsr.w   MoveEnemyBattlespriteHorizontally
                clr.w   ((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w
@loc_1:
                
                move.w  ((BATTLESCENE_ENEMY_Y_SPEED-$1000000)).w,d6
                beq.s   @Return
                add.w   ((word_FFB3F0-$1000000)).w,d6
                bsr.w   MoveEnemyBattlespriteVertically
                clr.w   ((BATTLESCENE_ENEMY_Y_SPEED-$1000000)).w
@Return:
                
                rts

    ; End of function UpdateEnemyBattlespritePosition


; =============== S U B R O U T I N E =======================================


UpdateAllyBattlespritePosition:
                
                cmpi.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
                beq.w   @Return
                
                move.w  ((BATTLESCENE_ALLY_X_SPEED-$1000000)).w,d0
                move.w  d0,d2
                move.w  ((BATTLESCENE_ALLY_Y_SPEED-$1000000)).w,d1
                or.w    d1,d2
                beq.w   @Return
                
                add.w   d0,((BATTLESCENE_ALLY_X-$1000000)).w
                add.w   d1,((BATTLESCENE_ALLY_Y-$1000000)).w
                lea     ((SPRITE_01-$1000000)).w,a0
                moveq   #8,d2
@UpdateAllyPosition_Loop:
                
                add.w   d1,(a0)
                addq.w  #6,a0
                add.w   d0,(a0)+
                dbf     d2,@UpdateAllyPosition_Loop
                
                cmpi.w  #-1,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
                beq.s   @loc_3
                
                lea     ((SPRITE_BATTLESCENE_WEAPON-$1000000)).w,a0
                moveq   #3,d2
@UpdateWeaponPosition_Loop:
                
                add.w   d0,VDPSPRITE_OFFSET_X(a0)
                add.w   d1,(a0)
                addq.w  #8,a0
                dbf     d2,@UpdateWeaponPosition_Loop
@loc_3:
                
                clr.w   ((BATTLESCENE_ALLY_X_SPEED-$1000000)).w
                clr.w   ((BATTLESCENE_ALLY_Y_SPEED-$1000000)).w
@Return:
                
                rts

    ; End of function UpdateAllyBattlespritePosition


; =============== S U B R O U T I N E =======================================


sub_1F1CC:
                
                movem.l d0/a0,-(sp)
                move.w  d6,((word_FFB3EA-$1000000)).w
                lea     ((byte_FFD1C0-$1000000)).w,a0
                moveq   #103,d0
@Loop:
                
                move.w  d6,(a0)
                addq.w  #4,a0
                dbf     d0,@Loop
                
                jsr     (UpdateVdpHScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0/a0
                rts

    ; End of function sub_1F1CC


; =============== S U B R O U T I N E =======================================


sub_1F1F0:
                
                movem.l d0/a0,-(sp)
                move.w  d6,((word_FFB3EE-$1000000)).w
                lea     ((VERTICAL_SCROLL_DATA-$1000000)).w,a0
                moveq   #19,d0
loc_1F1FE:
                
                move.w  d6,(a0)
                addq.w  #4,a0
                dbf     d0,loc_1F1FE
                
                jsr     (UpdateVdpVScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0/a0
                rts

    ; End of function sub_1F1F0


; =============== S U B R O U T I N E =======================================


MoveEnemyBattlespriteHorizontally:
                
                movem.l d0/a0,-(sp)
                move.w  d6,((word_FFB3EC-$1000000)).w
                cmpi.w  #ENEMYBATTLESPRITE_ZEON,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w 
                                                        ; HARDCODED Zeon enemy battle sprite
                bne.s   loc_1F236
                btst    #2,((byte_FFB56F-$1000000)).w
                bne.s   loc_1F232
                subi.w  #16,d6
                bra.s   loc_1F236
loc_1F232:
                
                addi.w  #16,d6
loc_1F236:
                
                lea     ((HORIZONTAL_SCROLL_DATA+2-$1000000)).w,a0
                move.w  #255,d0
loc_1F23E:
                
                move.w  d6,(a0)
                addq.w  #4,a0
                dbf     d0,loc_1F23E
                
                jsr     (UpdateVdpHScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0/a0
                rts

    ; End of function MoveEnemyBattlespriteHorizontally


; =============== S U B R O U T I N E =======================================


MoveEnemyBattlespriteVertically:
                
                movem.l d0/a0,-(sp)
                move.w  d6,((word_FFB3F0-$1000000)).w
                cmpi.w  #ENEMYBATTLESPRITE_ZEON,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w 
                                                        ; HARDCODED Zeon enemy battle sprite
                bne.s   @Continue
                subq.w  #8,d6
@Continue:
                
                lea     ((VERTICAL_SCROLL_DATA+2-$1000000)).w,a0
                moveq   #19,d0
@Loop:
                
                move.w  d6,(a0)
                addq.w  #4,a0
                dbf     d0,@Loop
                
                jsr     (UpdateVdpVScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0/a0
                rts

    ; End of function MoveEnemyBattlespriteVertically


; =============== S U B R O U T I N E =======================================


sub_1F282:
                
                btst    #0,((byte_FFB3CD-$1000000)).w
                bne.s   loc_1F2AE
                btst    #0,((byte_FFB583-$1000000)).w
                beq.s   return_1F2F4
                btst    #2,((byte_FFB583-$1000000)).w
                beq.s   return_1F2F4
                tst.w   ((word_FFB3C4-$1000000)).w
                beq.s   return_1F2F4
                lea     ((HORIZONTAL_SCROLL_DATA-$1000000)).w,a3
                lea     ((VERTICAL_SCROLL_DATA-$1000000)).w,a4
                lea     ((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w,a5
                bra.s   loc_1F2D0
loc_1F2AE:
                
                btst    #1,((byte_FFB583-$1000000)).w
                beq.s   return_1F2F4
                btst    #3,((byte_FFB583-$1000000)).w
                beq.s   return_1F2F4
                tst.w   ((word_FFB3CA-$1000000)).w
                beq.s   return_1F2F4
                lea     ((HORIZONTAL_SCROLL_DATA+2-$1000000)).w,a3
                lea     ((VERTICAL_SCROLL_DATA+2-$1000000)).w,a4
                lea     ((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w,a5
loc_1F2D0:
                
                addq.w  #1,4(a5)
                movea.l (a5),a0
                move.b  (a0),d0
                beq.w   loc_1F338
                subq.b  #1,d0
                beq.w   loc_1F384
                subq.b  #1,d0
                beq.w   loc_1F3DC
                subq.b  #1,d0
                beq.w   loc_1F3E0
                subq.b  #1,d0
                beq.w   loc_1F4D2
return_1F2F4:
                
                rts

    ; End of function sub_1F282


; =============== S U B R O U T I N E =======================================


sub_1F2F6:
                
                tst.b   ((byte_FFB583-$1000000)).w
                beq.s   return_1F336
                clr.b   ((byte_FFB583-$1000000)).w
                clr.b   ((byte_FFB56B-$1000000)).w
                clr.w   ((word_FFB3C4-$1000000)).w
                clr.w   ((word_FFB3CA-$1000000)).w
                clr.l   ((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w
                clr.l   ((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w
                clr.w   d6
                bsr.w   sub_1F1CC
                bsr.w   sub_1F1F0
                btst    #2,((byte_FFB56F-$1000000)).w
                beq.s   loc_1F32A
                moveq   #96,d6
                bra.s   loc_1F32C
loc_1F32A:
                
                clr.w   d6
loc_1F32C:
                
                bsr.w   MoveEnemyBattlespriteHorizontally
                clr.w   d6
                bsr.w   MoveEnemyBattlespriteVertically
return_1F336:
                
                rts

    ; End of function sub_1F2F6


; START OF FUNCTION CHUNK FOR sub_1F282

loc_1F338:
                
                move.w  4(a5),d0
                movea.l (a5),a5
                clr.w   d3
                move.b  1(a5),d3
                lsl.w   #2,d3
                lea     (a3,d3.w),a0
                movea.l 4(a5),a1
                lea     (a1),a2
                clr.w   d2
                move.b  2(a5),d2
                subq.w  #1,d2
                and.w   d2,d0
                move.w  d0,d1
                add.w   d0,d0
                adda.w  d0,a1
                clr.w   d0
                move.b  3(a5),d0
                subq.w  #1,d0
loc_1F368:
                
                move.w  (a1)+,d3
                add.w   d3,(a0)
                addq.w  #4,a0
                addq.w  #1,d1
                cmp.w   d2,d1
                bls.s   loc_1F378
                clr.w   d1
                lea     (a2),a1
loc_1F378:
                
                dbf     d0,loc_1F368
                jsr     (UpdateVdpHScrollData).w
                jmp     (EnableDmaQueueProcessing).w
loc_1F384:
                
                move.w  4(a5),d0
                cmpi.w  #$10,d0
                bcc.s   loc_1F3C8
                move.b  table_1F3CE-2(pc,d0.w),d0
                movea.l (a5),a2
                clr.w   d3
                move.b  1(a2),d3
                lsl.w   #2,d3
                lea     (a3,d3.w),a0
                clr.w   d1
                move.b  2(a2),d1
                subq.w  #1,d1
                clr.w   d2
                move.b  3(a2),d2
                move.w  d2,d3
loc_1F3B0:
                
                add.w   d0,(a0)
                subq.w  #1,d3
                bne.s   loc_1F3BA
                neg.w   d0
                move.w  d2,d3
loc_1F3BA:
                
                addq.w  #4,a0
                dbf     d1,loc_1F3B0
                jsr     (UpdateVdpHScrollData).w
                jmp     (EnableDmaQueueProcessing).w
loc_1F3C8:
                
                clr.w   4(a5)
                rts

; END OF FUNCTION CHUNK FOR sub_1F282

table_1F3CE:    dc.b 4
                dc.b 3
                dc.b 3
                dc.b 3
                dc.b 2
                dc.b 2
                dc.b 2
                dc.b 2
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 0

; START OF FUNCTION CHUNK FOR sub_1F282

loc_1F3DC:
                
                clr.w   d7
                bra.s   loc_1F3E2
loc_1F3E0:
                
                moveq   #1,d7
loc_1F3E2:
                
                btst    #6,4(a5)
                bne.s   loc_1F422
                move.w  #4,d0
                move.w  #8,d1
                bsr.w   sub_1F45E
                move.w  #$FFE0,d0
                move.w  #$FFC0,d1
                tst.w   d7
                beq.s   loc_1F406
                neg.w   d0
                neg.w   d1
loc_1F406:
                
                bsr.w   sub_1F496
                move.w  4(a5),d0
                movea.l (a5),a0
                clr.w   d1
                move.b  1(a0),d1
                cmp.w   d1,d0
                bls.s   return_1F420
                move.w  #$4001,4(a5)
return_1F420:
                
                rts
loc_1F422:
                
                move.w  #$FFFC,d0
                move.w  #$FFF8,d1
                bsr.w   sub_1F45E
                move.w  #$20,d0 
                move.w  #$40,d1 
                tst.w   d7
                beq.s   loc_1F43E
                neg.w   d0
                neg.w   d1
loc_1F43E:
                
                bsr.w   sub_1F496
                move.w  4(a5),d0
                bclr    #$E,d0
                movea.l (a5),a0
                clr.w   d1
                move.b  1(a0),d1
                cmp.w   d1,d0
                bls.s   return_1F45C
                move.w  #1,4(a5)
return_1F45C:
                
                rts

; END OF FUNCTION CHUNK FOR sub_1F282


; =============== S U B R O U T I N E =======================================


sub_1F45E:
                
                lea     $17C(a3),a0
                lea     $180(a3),a1
                lea     (FF8804_LOADING_SPACE).l,a2
                asr.w   #1,d1
                moveq   #$3F,d2 
loc_1F470:
                
                move.w  d1,d3
                add.w   (a2),d3
                move.w  d3,(a2)+
                asr.w   #BYTE_SHIFT_COUNT,d3
                move.w  d3,d4
                add.w   ((word_FFB3EC-$1000000)).w,d4
                move.w  d4,(a0)
                neg.w   d3
                add.w   ((word_FFB3EC-$1000000)).w,d3
                move.w  d3,(a1)
                subq.w  #4,a0
                addq.w  #4,a1
                add.w   d0,d1
                dbf     d2,loc_1F470
                jmp     (UpdateVdpHScrollData).w

    ; End of function sub_1F45E


; =============== S U B R O U T I N E =======================================


sub_1F496:
                
                lea     $10(a4),a0
                lea     $14(a4),a1
                lea     (byte_FF8904).l,a2
                asr.w   #1,d1
                moveq   #4,d2
loc_1F4A8:
                
                move.w  d1,d3
                add.w   (a2),d3
                move.w  d3,(a2)+
                asr.w   #BYTE_SHIFT_COUNT,d3
                move.w  d3,d4
                add.w   ((word_FFB3F0-$1000000)).w,d4
                move.w  d4,(a1)
                neg.w   d3
                add.w   ((word_FFB3F0-$1000000)).w,d3
                move.w  d3,(a0)
                subq.w  #4,a0
                addq.w  #4,a1
                add.w   d0,d1
                dbf     d2,loc_1F4A8
                jsr     (UpdateVdpVScrollData).w
                jmp     (EnableDmaQueueProcessing).w

    ; End of function sub_1F496


; START OF FUNCTION CHUNK FOR sub_1F282

loc_1F4D2:
                
                move.w  4(a5),d0
                movea.l (a5),a0
                clr.w   d1
                move.b  1(a0),d1
                lea     table_1F530(pc), a0
                move.w  d0,d2
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d2
                move.b  (a0,d2.w),d2
                ext.w   d2
                beq.s   loc_1F502
                muls.w  d1,d2
                move.w  #$FF,d3
loc_1F4F6:
                
                add.w   d2,(a3)
                addq.w  #4,a3
                dbf     d3,loc_1F4F6
                jsr     (UpdateVdpHScrollData).w
loc_1F502:
                
                lea     table_1F528(pc), a0
                move.w  d0,d2
                andi.w  #7,d2
                move.b  (a0,d2.w),d2
                ext.w   d2
                beq.s   loc_1F524
                muls.w  d1,d2
                moveq   #$13,d3
loc_1F518:
                
                add.w   d2,(a4)
                addq.w  #4,a4
                dbf     d3,loc_1F518
                jsr     (UpdateVdpVScrollData).w
loc_1F524:
                
                jmp     (EnableDmaQueueProcessing).w

; END OF FUNCTION CHUNK FOR sub_1F282

table_1F528:    dc.b 0
                dc.b 2
                dc.b $FF
                dc.b 0
                dc.b 0
                dc.b $FE
                dc.b 1
                dc.b 0
table_1F530:    dc.b $FF
                dc.b 2
                dc.b $FD
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b $FE
                dc.b 3
                dc.b 0
                dc.b $FF
                dc.b 0
                dc.b $FE
                dc.b 0

; =============== S U B R O U T I N E =======================================


sub_1F540:
                
                tst.b   ((byte_FFB56B-$1000000)).w
                beq.s   return_1F574
                movem.l d0/a0,-(sp)
                move.w  #1,((word_FFB3C4-$1000000)).w
                lea     (FF8804_LOADING_SPACE).l,a0
                move.w  #$3FF,d0
loc_1F55A:
                
                clr.l   (a0)+
                dbf     d0,loc_1F55A
                movea.l ((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w,a0
                clr.w   d0
                move.b  1(a0),d0
                lsr.w   #1,d0
                move.w  d0,((word_FFB3CA-$1000000)).w
                movem.l (sp)+,d0/a0
return_1F574:
                
                rts

    ; End of function sub_1F540

sprite_BattlesceneAlly:
                
; Syntax        vdpSprite y, [VDPSPRITESIZE_]bitfield|link, vdpTile, x
;
;      vdpTile: [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                vdpSprite 192, V4|H4|0, 256|PRIORITY, 264
                vdpSprite 224, V4|H4|0, 272|PRIORITY, 264
                vdpSprite 256, V4|H4|0, 288|PRIORITY, 264
                vdpSprite 192, V4|H4|0, 304|PRIORITY, 296
                vdpSprite 224, V4|H4|0, 320|PRIORITY, 296
                vdpSprite 256, V4|H4|0, 336|PRIORITY, 296
                vdpSprite 192, V4|H4|0, 352|PRIORITY, 328
                vdpSprite 224, V4|H4|0, 368|PRIORITY, 328
                vdpSprite 256, V4|H4|0, 384|PRIORITY, 328
                
                ; Mirrored ally
                vdpSprite 192, V4|H4|0, 256|MIRROR|PRIORITY, 328
                vdpSprite 224, V4|H4|0, 272|MIRROR|PRIORITY, 328
                vdpSprite 256, V4|H4|0, 288|MIRROR|PRIORITY, 328
                vdpSprite 192, V4|H4|0, 304|MIRROR|PRIORITY, 296
                vdpSprite 224, V4|H4|0, 320|MIRROR|PRIORITY, 296
                vdpSprite 256, V4|H4|0, 336|MIRROR|PRIORITY, 296
                vdpSprite 192, V4|H4|0, 352|MIRROR|PRIORITY, 264
                vdpSprite 224, V4|H4|0, 368|MIRROR|PRIORITY, 264
                vdpSprite 256, V4|H4|0, 384|MIRROR|PRIORITY, 264
                
sprite_BattlesceneWeapon:
                ; Weapon frame 0
                vdpSprite 192, V4|H4|0, 1728|PRIORITY, 264
                vdpSprite 224, V4|H4|0, 1744|PRIORITY, 264
                vdpSprite 192, V4|H4|0, 1760|PRIORITY, 296
                vdpSprite 224, V4|H4|0, 1776|PRIORITY, 296
                
                ; Weapon frame 1
                vdpSprite 192, V4|H4|0, 1728|MIRROR|PRIORITY, 296
                vdpSprite 224, V4|H4|0, 1744|MIRROR|PRIORITY, 296
                vdpSprite 192, V4|H4|0, 1760|MIRROR|PRIORITY, 264
                vdpSprite 224, V4|H4|0, 1776|MIRROR|PRIORITY, 264
                
                ; Weapon frame 2
                vdpSprite 224, V4|H4|0, 1728|FLIP|PRIORITY, 264
                vdpSprite 192, V4|H4|0, 1744|FLIP|PRIORITY, 264
                vdpSprite 224, V4|H4|0, 1760|FLIP|PRIORITY, 296
                vdpSprite 192, V4|H4|0, 1776|FLIP|PRIORITY, 296
                
                ; Weapon frame 3
                vdpSprite 224, V4|H4|0, 1728|MIRROR|FLIP|PRIORITY, 296
                vdpSprite 192, V4|H4|0, 1744|MIRROR|FLIP|PRIORITY, 296
                vdpSprite 224, V4|H4|0, 1760|MIRROR|FLIP|PRIORITY, 264
                vdpSprite 192, V4|H4|0, 1776|MIRROR|FLIP|PRIORITY, 264
                
sprite_BattlesceneGround:
                vdpSprite 268, V4|H4|0, 1920|PALETTE3, 264
                vdpSprite 268, V4|H4|0, 1936|PALETTE3, 296
                vdpSprite 268, V4|H4|0, 1952|PALETTE3, 328
                
                ; Mirrored ground
                vdpSprite 268, V4|H4|0, 1920|MIRROR|PALETTE3, 328
                vdpSprite 268, V4|H4|0, 1936|MIRROR|PALETTE3, 296
                vdpSprite 268, V4|H4|0, 1952|MIRROR|PALETTE3, 264
                
layout_BattlesceneEnemy:
                dc.b 0
                dc.b 4
                dc.b 8
                dc.b $C
                dc.b $30
                dc.b $34
                dc.b $38
                dc.b $3C
                dc.b $60
                dc.b $64
                dc.b $68
                dc.b $6C
                dc.b $90
                dc.b $94
                dc.b $98
                dc.b $9C
                dc.b 1
                dc.b 5
                dc.b 9
                dc.b $D
                dc.b $31
                dc.b $35
                dc.b $39
                dc.b $3D
                dc.b $61
                dc.b $65
                dc.b $69
                dc.b $6D
                dc.b $91
                dc.b $95
                dc.b $99
                dc.b $9D
                dc.b 2
                dc.b 6
                dc.b $A
                dc.b $E
                dc.b $32
                dc.b $36
                dc.b $3A
                dc.b $3E
                dc.b $62
                dc.b $66
                dc.b $6A
                dc.b $6E
                dc.b $92
                dc.b $96
                dc.b $9A
                dc.b $9E
                dc.b 3
                dc.b 7
                dc.b $B
                dc.b $F
                dc.b $33
                dc.b $37
                dc.b $3B
                dc.b $3F
                dc.b $63
                dc.b $67
                dc.b $6B
                dc.b $6F
                dc.b $93
                dc.b $97
                dc.b $9B
                dc.b $9F
                dc.b $10
                dc.b $14
                dc.b $18
                dc.b $1C
                dc.b $40
                dc.b $44
                dc.b $48
                dc.b $4C
                dc.b $70
                dc.b $74
                dc.b $78
                dc.b $7C
                dc.b $A0
                dc.b $A4
                dc.b $A8
                dc.b $AC
                dc.b $11
                dc.b $15
                dc.b $19
                dc.b $1D
                dc.b $41
                dc.b $45
                dc.b $49
                dc.b $4D
                dc.b $71
                dc.b $75
                dc.b $79
                dc.b $7D
                dc.b $A1
                dc.b $A5
                dc.b $A9
                dc.b $AD
                dc.b $12
                dc.b $16
                dc.b $1A
                dc.b $1E
                dc.b $42
                dc.b $46
                dc.b $4A
                dc.b $4E
                dc.b $72
                dc.b $76
                dc.b $7A
                dc.b $7E
                dc.b $A2
                dc.b $A6
                dc.b $AA
                dc.b $AE
                dc.b $13
                dc.b $17
                dc.b $1B
                dc.b $1F
                dc.b $43
                dc.b $47
                dc.b $4B
                dc.b $4F
                dc.b $73
                dc.b $77
                dc.b $7B
                dc.b $7F
                dc.b $A3
                dc.b $A7
                dc.b $AB
                dc.b $AF
                dc.b $20
                dc.b $24
                dc.b $28
                dc.b $2C
                dc.b $50
                dc.b $54
                dc.b $58
                dc.b $5C
                dc.b $80
                dc.b $84
                dc.b $88
                dc.b $8C
                dc.b $B0
                dc.b $B4
                dc.b $B8
                dc.b $BC
                dc.b $21
                dc.b $25
                dc.b $29
                dc.b $2D
                dc.b $51
                dc.b $55
                dc.b $59
                dc.b $5D
                dc.b $81
                dc.b $85
                dc.b $89
                dc.b $8D
                dc.b $B1
                dc.b $B5
                dc.b $B9
                dc.b $BD
                dc.b $22
                dc.b $26
                dc.b $2A
                dc.b $2E
                dc.b $52
                dc.b $56
                dc.b $5A
                dc.b $5E
                dc.b $82
                dc.b $86
                dc.b $8A
                dc.b $8E
                dc.b $B2
                dc.b $B6
                dc.b $BA
                dc.b $BE
                dc.b $23
                dc.b $27
                dc.b $2B
                dc.b $2F
                dc.b $53
                dc.b $57
                dc.b $5B
                dc.b $5F
                dc.b $83
                dc.b $87
                dc.b $8B
                dc.b $8F
                dc.b $B3
                dc.b $B7
                dc.b $BB
                dc.b $BF
table_1F776:    dc.w $8100
                dc.w $8110
                dc.w $8120
                dc.w $8130
                dc.w $8140
                dc.w $8150
                dc.w $8160
                dc.w $8170
                dc.w $8180
                dc.w $8190
                dc.w $81A0
                dc.w $81B0
                dc.w $81C0
                dc.w $81D0
                dc.w $81E0
                dc.w $81F0
                dc.w $8200
                dc.w $8210
                dc.w $8520
                dc.w $8530
                dc.w $8540
                dc.w $8550
                dc.w $8560
                dc.w $8570
                dc.w $8580
                dc.w $8590
                dc.w $85A0
                dc.w $85B0
                dc.w $85C0
                dc.w $85D0
                dc.w $85E0
                dc.w $85F0
                dc.w $86C0
                dc.w $86D0
                dc.w $86E0
                dc.w $86F0
table_1F7BE:    dc.w $8100
                dc.w $8110
                dc.w $8190
                dc.w $81A0
                dc.w $8120
                dc.w $8130
                dc.w $81B0
                dc.w $81C0
                dc.w $8140
                dc.w $8150
                dc.w $81D0
                dc.w $81E0
                dc.w $8160
                dc.w $8170
                dc.w $81F0
                dc.w $8200
                dc.w 0
                dc.w 0
                dc.w $8520
                dc.w $8530
                dc.w $85B0
                dc.w $85C0
                dc.w $8540
                dc.w $8550
                dc.w $85D0
                dc.w $85E0
                dc.w $8560
                dc.w $8570
                dc.w $85F0
                dc.w $86C0
                dc.w $8580
                dc.w $8590
                dc.w $86D0
                dc.w $86E0
                dc.w 0
                dc.w 0
