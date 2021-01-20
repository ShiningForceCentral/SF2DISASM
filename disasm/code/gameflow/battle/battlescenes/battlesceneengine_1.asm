
; ASM FILE code\gameflow\battle\battlescenes\battlesceneengine_1.asm :
; 0x19E6E..0x1F806 : Battlescene engine

; =============== S U B R O U T I N E =======================================


sub_19E6E:
                
                cmpi.w  #COMBATANT_ENEMIES_START,d0
                bcc.w   @Skip
                jsr     j_GetUpperMoveType
                cmpi.w  #MOVETYPE_LOWER_FLYING,d1
                beq.w   @Skip
                cmpi.w  #MOVETYPE_LOWER_HOVERING,d1
                beq.w   @Skip
                bra.w   GetBattleBackground
@Skip:
                
                move.w  #$FFFF,d1
                rts

    ; End of function sub_19E6E


; =============== S U B R O U T I N E =======================================

; Get a boolean depending on background index


sub_19E96:
                
                movem.l a0,-(sp)
                lea     tbl_BackgroundEnemySwitch(pc), a0
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
                move.b  #$F,((FADING_PALETTE_BITMAP-$1000000)).w
                rts

    ; End of function FadeInFromBlackIntoBattlescene


; =============== S U B R O U T I N E =======================================


FadeOutToBlackForBattlescene:
                
                move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #$F,((FADING_PALETTE_BITMAP-$1000000)).w
                rts

    ; End of function FadeOutToBlackForBattlescene


; =============== S U B R O U T I N E =======================================

; Execute spell animation D0


ExecuteSpellAnimation:
                
                tst.b   ((byte_FFB584-$1000000)).w
                bne.w   return_19F5C
                cmpi.b  #$FF,d0
                beq.w   return_19F5C
                move.w  d0,d1
                lsr.w   #5,d1
                andi.w  #3,d1
                addq.w  #1,d1
                btst    #7,d0
                beq.s   loc_19F0A
                bset    #7,d1
loc_19F0A:
                
                move.b  d1,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                andi.w  #$1F,d0
                add.w   d0,d0
                move.w  rjt_SpellAnimation(pc,d0.w),d0
                jmp     rjt_SpellAnimation(pc,d0.w)
rjt_SpellAnimation:
                
                dc.w sa00_Nothing-rjt_SpellAnimation
                dc.w sa01_Blaze-rjt_SpellAnimation
                dc.w sa02_Freeze-rjt_SpellAnimation
                dc.w sa03_Desoul-rjt_SpellAnimation
                dc.w sa04_HealingFairy-rjt_SpellAnimation
                dc.w sa05_Blast-rjt_SpellAnimation
                dc.w sa06_Detox-rjt_SpellAnimation
                dc.w sa07_Bolt-rjt_SpellAnimation
                dc.w sa08_Buff1-rjt_SpellAnimation
                dc.w sa09_Debuff1-rjt_SpellAnimation
                dc.w sa0A_Absorb-rjt_SpellAnimation
                dc.w sa0B_DemonBreath-rjt_SpellAnimation
                dc.w sa0C_FlameBreath-rjt_SpellAnimation
                dc.w sa0D_ArrowsAndSpears-rjt_SpellAnimation
                dc.w sa0E_CannonProjectile-rjt_SpellAnimation
                dc.w sa0F_ShotProjectile-rjt_SpellAnimation
                dc.w sa10_GunnerProjectile-rjt_SpellAnimation
                dc.w sa11_Dao-rjt_SpellAnimation
                dc.w sa12_Apollo-rjt_SpellAnimation
                dc.w sa13_Neptun-rjt_SpellAnimation
                dc.w sa14_Atlas-rjt_SpellAnimation
                dc.w sa15_PrismLaser-rjt_SpellAnimation
                dc.w sa16_BubbleBreath-rjt_SpellAnimation
                dc.w sa17_SnowBreath-rjt_SpellAnimation
                dc.w sa18_CutOff-rjt_SpellAnimation
                dc.w sa19_Buff2-rjt_SpellAnimation
                dc.w sa1A_AttackSpell-rjt_SpellAnimation ; SFCD's ATTACK spell (unused)
                dc.w sa1B_Debuff2-rjt_SpellAnimation
                dc.w sa1C_Debuff3-rjt_SpellAnimation
                dc.w sa1D_PhoenixAttack-rjt_SpellAnimation
                dc.w sa1E_BurstRockExplosion-rjt_SpellAnimation
                dc.w sa1F_OddEyeBeam-rjt_SpellAnimation
return_19F5C:
                
                rts

    ; End of function ExecuteSpellAnimation


; =============== S U B R O U T I N E =======================================


sub_19F5E:
                
                movem.l d1/a1,-(sp)
                lea     (byte_FFAFA0).l,a1
                move.b  7(a0),d1
                lsr.b   #4,d1
                move.b  d1,(a1,d0.w)
                lea     ((SPRITE_TABLE-$1000000)).w,a1
                move.w  d0,d1
                lsl.w   #3,d1
                adda.w  d1,a1
                move.w  2(a0),(a1)+
                clr.w   d1
                move.b  6(a0),d1
                lsl.w   #8,d1
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
                lsl.w   #8,d0
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
                lsr.b   #4,d0
                move.b  d0,(a2)+
                addq.w  #8,a0
                dbf     d1,loc_19FC8
                movem.l (sp)+,d0-d3/a1-a2
                add.w   d1,d0
                rts

    ; End of function sub_19FAA


; =============== S U B R O U T I N E =======================================


sub_1A00A:
                
                moveq   #$26,d0 
                moveq   #$19,d7
loc_1A00E:
                
                lea     word_1A020(pc), a0
                nop
                bsr.w   sub_19F5E
                dbf     d7,loc_1A00E
                jmp     (sub_1942).w    

    ; End of function sub_1A00A

word_1A020:     dc.w 1
                dc.w 1
                dc.w 0
                dc.w 0

; =============== S U B R O U T I N E =======================================


sub_1A028:
                
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   nullsub_1A090
                bsr.w   CopyPalettes

    ; End of function sub_1A028


; =============== S U B R O U T I N E =======================================


TintScreen:
                
                clr.w   d0
                move.b  ((CURRENT_SPELLANIMATION-$1000000)).w,d0
                add.w   d0,d0
                move.w  rjt_TintScreenFunctions(pc,d0.w),d0
                jsr     rjt_TintScreenFunctions(pc,d0.w)
                bra.w   loc_1A088

    ; End of function TintScreen

rjt_TintScreenFunctions:
                dc.w nullsub_1A090-rjt_TintScreenFunctions ; related to ally or enemy reaction
                dc.w TintScreen_Red-rjt_TintScreenFunctions ; 01: Blaze
                dc.w TintScreen_Greyscale-rjt_TintScreenFunctions ; 02: Freeze
                dc.w TintScreen_Greyscale-rjt_TintScreenFunctions ; 03: Desoul
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w TintScreen_Dark-rjt_TintScreenFunctions ; 05: Blast
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w TintScreen_Darker-rjt_TintScreenFunctions ; 07: Bolt
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w TintScreen_Dark-rjt_TintScreenFunctions ; 11: Demon Breath
                dc.w TintScreen_Red-rjt_TintScreenFunctions ; 12: Flame Breath
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w TintScreen_Apollo-rjt_TintScreenFunctions ; 18: Apollo
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w TintScreen_Darker-rjt_TintScreenFunctions ; 21: Prism Laser
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w TintScreen_Greyscale-rjt_TintScreenFunctions ; 23: Cutoff
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions
                dc.w nullsub_1A090-rjt_TintScreenFunctions

; START OF FUNCTION CHUNK FOR TintScreen

loc_1A088:
                
                jsr     (ApplyVIntCramDma).w
                jmp     (EnableDmaQueueProcessing).w

; END OF FUNCTION CHUNK FOR TintScreen


; =============== S U B R O U T I N E =======================================


nullsub_1A090:
                
                rts

    ; End of function nullsub_1A090


; =============== S U B R O U T I N E =======================================


sub_1A092:
                
                tst.b   ((byte_FFB584-$1000000)).w
                bne.s   loc_1A0A2
                jsr     (ApplyVIntCramDma).w
                jsr     (EnableDmaQueueProcessing).w
                bra.s   return_1A0A8
loc_1A0A2:
                
                bsr.w   sub_1A270
                bsr.s   TintScreen
return_1A0A8:
                
                rts

    ; End of function sub_1A092


; =============== S U B R O U T I N E =======================================


CopyPalettes:
                
                movem.l d7-a1,-(sp)
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                lea     ((PALETTE_1_BASE-$1000000)).w,a1
                moveq   #$1F,d7
@Loop:
                
                move.l  (a0)+,(a1)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function CopyPalettes


; =============== S U B R O U T I N E =======================================


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

; restore some colors


sub_1A0E2:
                
                movem.l a0-a1,-(sp)
                lea     ((PALETTE_3_CURRENT-$1000000)).w,a0
                lea     ((PALETTE_3_BASE-$1000000)).w,a1
                move.w  $12(a1),$12(a0)
                move.l  $1A(a1),$1A(a0)
                movem.l (sp)+,a0-a1
                rts

    ; End of function sub_1A0E2


; =============== S U B R O U T I N E =======================================

; Lower brightness of most elements on the screen to 50%


sub_1A100:
                
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

    ; End of function sub_1A100


; =============== S U B R O U T I N E =======================================


TintScreen_Darker:
                
                bsr.s   sub_1A100       
                bra.s   sub_1A0E2       

    ; End of function TintScreen_Darker


; =============== S U B R O U T I N E =======================================

; Lower the brightness of most elements on the screen to 75%


sub_1A122:
                
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

    ; End of function sub_1A122


; =============== S U B R O U T I N E =======================================


TintScreen_Dark:
                
                bsr.s   sub_1A122       
                bra.s   sub_1A0E2       

    ; End of function TintScreen_Dark


; =============== S U B R O U T I N E =======================================

; Apply a greyscale palette to most elements on the screen


sub_1A14A:
                
                movem.l d0-d2/a0,-(sp)
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                moveq   #CRAM_COLORS_COUNTER,d2
@Loop:
                
                move.w  (a0),d0
                andi.w  #$F,d0
                lsr.w   #1,d0
                move.w  (a0),d1
                andi.w  #$F0,d1 
                lsr.w   #4,d1
                add.w   d1,d0
                move.w  (a0),d1
                andi.w  #$F00,d1
                lsr.w   #8,d1
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
                lsl.w   #4,d1
                or.w    d1,d0
                lsl.w   #4,d1
                or.w    d1,d0
                move.w  d0,(a0)+
                dbf     d2,@Loop
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function sub_1A14A


; =============== S U B R O U T I N E =======================================


TintScreen_Greyscale:
                
                bsr.s   sub_1A14A       
                bra.w   sub_1A0E2       

    ; End of function TintScreen_Greyscale


; =============== S U B R O U T I N E =======================================

; Tint the screen blue


sub_1A19E:
                
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

    ; End of function sub_1A19E


; =============== S U B R O U T I N E =======================================


TintScreen_Blue:
                
                bsr.s   sub_1A19E       
                bra.w   sub_1A0E2       

    ; End of function TintScreen_Blue


; =============== S U B R O U T I N E =======================================

; Tint the screen green


sub_1A1CA:
                
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

    ; End of function sub_1A1CA


; =============== S U B R O U T I N E =======================================


TintScreen_Green:
                
                bsr.s   sub_1A1CA       
                bra.w   sub_1A0E2       

    ; End of function TintScreen_Green


; =============== S U B R O U T I N E =======================================

; Tint the screen red


sub_1A1F6:
                
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

    ; End of function sub_1A1F6


; =============== S U B R O U T I N E =======================================


TintScreen_Red:
                
                bsr.s   sub_1A1F6       
                bra.w   sub_1A0E2       

    ; End of function TintScreen_Red


; =============== S U B R O U T I N E =======================================

; Tint parts of the screen red


TintScreen_Apollo:
                
                movem.l d0/a0-a1,-(sp)
                bsr.s   sub_1A1F6       
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                lea     ((PALETTE_1_BASE-$1000000)).w,a1
                moveq   #7,d0
@Palette1_Loop:
                
                move.l  (a1)+,(a0)+     ; restore palette 1
                dbf     d0,@Palette1_Loop
                
                lea     $20(a0),a0
                lea     $20(a1),a1
                moveq   #7,d0
@Palette3_Loop:
                
                move.l  (a1)+,(a0)+     ; restore palette 3
                dbf     d0,@Palette3_Loop
                
                movem.l (sp)+,d0/a0-a1
                rts

    ; End of function TintScreen_Apollo


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
                move.w  $52(a0),-(sp)
                move.l  $5A(a0),-(sp)
                moveq   #$1F,d7
loc_1A286:
                
                move.l  (a1)+,(a0)+
                dbf     d7,loc_1A286
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                move.l  (sp)+,$5A(a0)
                move.w  (sp)+,$52(a0)
                jsr     (ApplyVIntCramDma).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d7-a1
                rts

    ; End of function sub_1A270


; =============== S U B R O U T I N E =======================================

;     In: D0 = color to flash


ExecSpellAnimationFlash:
                
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

    ; End of function ExecSpellAnimationFlash


; =============== S U B R O U T I N E =======================================

;     Clears a portion at RAM:b406 and RAM:b532 for spell properties.


ClearSpellAnimationProperties:
                
                movem.l d7-a0,-(sp)
                lea     ((byte_FFB406-$1000000)).w,a0
                moveq   #$4A,d7 
loc_1A2DE:
                
                clr.l   (a0)+
                dbf     d7,loc_1A2DE
                lea     ((byte_FFB532-$1000000)).w,a0
                moveq   #3,d7
loc_1A2EA:
                
                clr.l   (a0)+
                dbf     d7,loc_1A2EA
                movem.l (sp)+,d7-a0
                rts

    ; End of function ClearSpellAnimationProperties


; =============== S U B R O U T I N E =======================================


sub_1A2F6:
                
                movem.l d6-d7,-(sp)
                lea     ((byte_FFB406-$1000000)).w,a0
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
                move.w  #$FFFF,d6
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
                bsr.w   ExecSpellAnimationFlash
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,((word_FFB400-$1000000)).w
                lea     ((byte_FFB562-$1000000)).w,a6
                move.w  #$FFFF,(a6)
                clr.w   2(a6)
                bsr.w   bsc07_switchAllies
                movem.l (sp)+,d0/a6
                jsr     (WaitForVInt).w
                clr.w   d1
                bsr.w   LoadInvocationSprite
                moveq   #8,d0
                jsr     (Sleep).w       
                bchg    #6,((byte_FFB56E-$1000000)).w
                jsr     (ApplyVIntCramDma).w
                bsr.w   sub_1A380
                jsr     (WaitForDmaQueueProcessing).w
                bset    #4,((byte_FFB56F-$1000000)).w
                rts

    ; End of function LoadInvocationSpell


; =============== S U B R O U T I N E =======================================


sub_1A380:
                
                lea     ((SPRITE_20-$1000000)).w,a1
                tst.w   4(a0)
                bne.s   loc_1A39C
                bclr    #5,((byte_FFB56F-$1000000)).w
                moveq   #5,d1
                moveq   #2,d4
                lea     (word_1F776).l,a2
                bra.s   loc_1A3AC
loc_1A39C:
                
                bset    #5,((byte_FFB56F-$1000000)).w
                moveq   #3,d1
                moveq   #3,d4
                lea     (word_1F7BE).l,a2
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

    ; End of function sub_1A380


; =============== S U B R O U T I N E =======================================


sub_1A3E8:
                
                lea     ((SPRITE_20_TILE_FLAGS-$1000000)).w,a0
                lea     (word_1F776).l,a1
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
                move.b  #1,((FADING_PALETTE_BITMAP-$1000000)).w
loc_1A43E:
                
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   loc_1A43E
                lea     ((SPRITE_20-$1000000)).w,a0
                moveq   #$11,d0
loc_1A44A:
                
                move.w  #1,(a0)+
                clr.l   (a0)+
                move.w  #1,(a0)+
                dbf     d0,loc_1A44A
                move.l  a6,-(sp)
                lea     ((byte_FFB562-$1000000)).w,a6
                move.w  ((word_FFB400-$1000000)).w,(a6)
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


sa00_Nothing:
                
                rts

    ; End of function sa00_Nothing


; =============== S U B R O U T I N E =======================================


sa01_Blaze:
                
                bsr.s   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BLAZE_FLASH_COLOR,d0
                bsr.w   ExecSpellAnimationFlash
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_BLAZE,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                btst    #SPELLANIMATION_BIT_MIRRORED,d1
                bne.s   @Mirrored
                lea     loc_1A58A(pc), a1
                bra.s   @Continue
@Mirrored:
                
                lea     byte_1A5B2(pc), a1
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
                lea     byte_1A5E4(pc), a0
                clr.w   d0
                move.b  (a1),d0
                lsl.w   #4,d0
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
                lea     byte_1A614(pc), a0
                bsr.w   sub_19FAA
loc_1A56E:
                
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BLAZE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  5(a1),d0
                addq.b  #1,d0
                move.b  d0,((byte_FFB584-$1000000)).w
loc_1A58A:
                
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa01_Blaze

                dc.b 0
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
byte_1A5B2:     dc.b 2
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
byte_1A5E4:     dc.b 0
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
byte_1A614:     dc.b 0
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


sa02_Freeze:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #FREEZE_FLASH_COLOR,d0
                bsr.w   ExecSpellAnimationFlash
                bsr.w   ClearSpellAnimationProperties
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
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_FREEZE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
loc_1A6CC:
                
                move.b  d1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa02_Freeze

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


sa03_Desoul:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #DESOUL_FLASH_COLOR,d0
                bsr.w   ExecSpellAnimationFlash
                bsr.w   ClearSpellAnimationProperties
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
                lea     byte_1A810(pc), a0
                bsr.w   sub_19F5E
                bsr.w   sub_19F5E
                addq.w  #2,d2
loc_1A7E2:
                
                move.l  #byte_1A820,((dword_FFB3C0-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.b  #5,((byte_FFB583-$1000000)).w
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DESOUL,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  d2,((byte_FFB584-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa03_Desoul

byte_1A810:     dc.b 0
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
byte_1A820:     dc.b 0
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


sa04_HealingFairy:
                
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #HEALING_FLASH_COLOR,d0
                bsr.w   ExecSpellAnimationFlash
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_HEALING,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                bclr    #7,d1
                bne.s   loc_1A874
                lea     byte_1A908(pc), a0
                lea     byte_1A8F4(pc), a1
                moveq   #7,d4
                bra.s   loc_1A87E
loc_1A874:
                
                lea     byte_1A918(pc), a0
                lea     byte_1A8FE(pc), a1
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
                move.b  d1,((byte_FFB584-$1000000)).w
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
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_HEALING_FAIRY,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa04_HealingFairy

byte_1A8F4:     dc.b 0
                dc.b 0
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $28
                dc.b 0
                dc.b $34
byte_1A8FE:     dc.b 0
                dc.b $35
                dc.b 0
                dc.b $45
                dc.b 0
                dc.b $55
                dc.b 0
                dc.b $5D
                dc.b 0
                dc.b $69
byte_1A908:     dc.b 1
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
byte_1A918:     dc.b $FF
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


sa05_Blast:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BLAST_FLASH_COLOR,d0
                bsr.w   ExecSpellAnimationFlash
                bsr.w   ClearSpellAnimationProperties
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
                lea     byte_1AA28(pc), a0
                bsr.w   sub_19FAA
loc_1AA06:
                
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BLAST,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa05_Blast

byte_1AA28:     dc.b 0
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


sa06_Detox:
                
                 
                sndCom  SFX_SPELL_CAST
                move.w  #$A8A,d0
                bsr.w   ExecSpellAnimationFlash
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_DETOX,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6
                move.w  #1,4(a0)
                lea     byte_1AA88(pc), a0
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DETOX,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB584-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa06_Detox

byte_1AA88:     dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $3B
                dc.b 0
                dc.b $20

; =============== S U B R O U T I N E =======================================


sa07_Bolt:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BOLT_FLASH_COLOR,d0
                bsr.w   ExecSpellAnimationFlash
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_BOLT,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     loc_1AB4A(pc), a1
                andi.w  #7,d1
                lsl.w   #2,d1
                adda.w  d1,a1
                move.l  (a1),((byte_FFB532-$1000000)).w
                moveq   #$10,d0
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                lea     byte_1AB5E(pc), a0
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BOLT,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  1(a1),((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
loc_1AB4A:
                
                bra.w   sub_1A028

    ; End of function sa07_Bolt

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
byte_1AB5E:     dc.b 0
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


sa08_Buff1:
                
                move.w  #$FFFE,d0
                moveq   #$1E,d1
                bra.w   loc_1ABAC

    ; End of function sa08_Buff1


; =============== S U B R O U T I N E =======================================


sa19_Buff2:
                
                moveq   #2,d0
                moveq   #2,d1

    ; End of function sa19_Buff2


; START OF FUNCTION CHUNK FOR sa08_Buff1

loc_1ABAC:
                
                movem.w d0-d1,-(sp)

; END OF FUNCTION CHUNK FOR sa08_Buff1

                dc.b $4E, $40, 0, $4D
                move.w  #BUFF_FLASH_COLOR,d0
                bsr.w   ExecSpellAnimationFlash
                bsr.w   ClearSpellAnimationProperties
                movem.w (sp)+,d0-d1
                move.w  d0,((byte_FFB532-$1000000)).w
                moveq   #1,d0
                bsr.w   sub_1A2F6
                move.w  #1,2(a0)
                move.w  d1,4(a0)
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BUFF1,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB584-$1000000)).w
                bra.w   sub_1A028

; =============== S U B R O U T I N E =======================================


sa09_Debuff1:
                
                lea     byte_1ACC6(pc), a0
                bra.w   loc_1AC08

    ; End of function sa09_Debuff1


; =============== S U B R O U T I N E =======================================


sa1B_Debuff2:
                
                lea     byte_1ACCC(pc), a0
                bra.w   loc_1AC08

    ; End of function sa1B_Debuff2


; =============== S U B R O U T I N E =======================================


sa1C_Debuff3:
                
                lea     byte_1ACD2(pc), a0

    ; End of function sa1C_Debuff3


; START OF FUNCTION CHUNK FOR sa09_Debuff1

loc_1AC08:
                
                move.l  a0,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #DEBUFF_FLASH_COLOR,d0
                bsr.w   ExecSpellAnimationFlash
                bsr.w   ClearSpellAnimationProperties
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
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DEBUFF1,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #4,((byte_FFB584-$1000000)).w
                bra.w   sub_1A028

; END OF FUNCTION CHUNK FOR sa09_Debuff1

byte_1ACC6:     dc.b 8
                dc.b $88
                dc.b $B
                dc.b $BB
                dc.b $D
                dc.b $DD
byte_1ACCC:     dc.b 8
                dc.b $4E
                dc.b $E
                dc.b $C6
                dc.b $F
                dc.b $DA
byte_1ACD2:     dc.b 8
                dc.b $4E
                dc.b 9
                dc.b $8E
                dc.b $D
                dc.b $BF

; =============== S U B R O U T I N E =======================================


sa0A_Absorb:
                
                 
                sndCom  SFX_WARP
                move.w  #ABSORB_FLASH_COLOR,d0
                bra.w   ExecSpellAnimationFlash

    ; End of function sa0A_Absorb


; =============== S U B R O U T I N E =======================================


sa0B_DemonBreath:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_DEMON_BREATH,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     ((byte_FFB532-$1000000)).w,a1
                cmpi.w  #$35,((ENEMY_BATTLE_SPRITE-$1000000)).w 
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
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DEMON_BREATH,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa0B_DemonBreath


; =============== S U B R O U T I N E =======================================


sa0C_FlameBreath:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellAnimationProperties
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
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa0C_FlameBreath


; =============== S U B R O U T I N E =======================================


sa0D_ArrowsAndSpears:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_ARROWS_AND_SPEARS,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                clr.w   d1
                lea     byte_1AE40(pc), a0
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
                move.b  #1,((byte_FFB584-$1000000)).w
loc_1AE16:
                
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa0D_ArrowsAndSpears

                dc.b $F2
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
byte_1AE40:     dc.b $E
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


sa0E_CannonProjectile:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_CANNON_PROJECTILE,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                lea     byte_1AEFA(pc), a1
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
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa0E_CannonProjectile

byte_1AEFA:     dc.b $F3
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


sa0F_ShotProjectile:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_EXPLOSION,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                lea     byte_1AF7C(pc), a0
                lea     byte_1AF64(pc), a1
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
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa0F_ShotProjectile

byte_1AF64:     dc.b $F4
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
byte_1AF7C:     dc.b 1
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


sa10_GunnerProjectile:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_GUNNER_PROJECTILE,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                lea     byte_1B002(pc), a0
                lea     byte_1AFEA(pc), a1
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
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa10_GunnerProjectile

byte_1AFEA:     dc.b $F3
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
byte_1B002:     dc.b 1
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


sa11_Dao:
                
                bsr.w   ClearSpellAnimationProperties
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
                moveq   #$14,d0
                jsr     (Sleep).w       
loc_1B040:
                
                clr.w   d0
                bsr.w   LoadInvocationSprite
                bchg    #6,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1A3E8
                movem.w (sp)+,d1-d2
                addq.w  #1,d1
                dbf     d2,loc_1B026
                moveq   #SPELLGRAPHICS_DA0,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6
                move.w  #$5A,((byte_FFB532-$1000000)).w 
                lea     (FF8804_LOADING_SPACE).l,a0
                move.w  #$3FF,d0
loc_1B076:
                
                clr.l   (a0)+
                dbf     d0,loc_1B076
                move.l  #byte_1B0CC,((dword_FFB3C0-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.l  #byte_1B0CE,((dword_FFB3C6-$1000000)).w
                move.w  #$A,((word_FFB3CA-$1000000)).w
                move.b  #$F,((byte_FFB583-$1000000)).w
                move.b  #1,((byte_FFB56B-$1000000)).w
                bclr    #3,((byte_FFB56E-$1000000)).w
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DAO,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa11_Dao

byte_1B0CC:     dc.b 4
                dc.b 1
byte_1B0CE:     dc.b 3
                dc.b $14

; =============== S U B R O U T I N E =======================================


sa12_Apollo:
                
                bsr.w   ClearSpellAnimationProperties
                bclr    #6,((byte_FFB56E-$1000000)).w
                moveq   #3,d0
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
                moveq   #3,d0
                moveq   #1,d1
                bsr.w   LoadInvocationSprite
                moveq   #$1E,d0
                jsr     (Sleep).w       
                bchg    #6,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1A3E8
                moveq   #3,d0
                moveq   #2,d1
                bsr.w   LoadInvocationSprite
                moveq   #$13,d0
                bsr.w   sub_19CE8       
                lea     (byte_FF8B04).l,a0
                lea     ($3000).w,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                lea     (byte_FF8D04).l,a0
                lea     ($4200).w,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                lea     (byte_FF8F04).l,a0
                lea     ($B400).l,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                lea     (byte_FF9104).l,a0
                lea     ($DE00).l,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                moveq   #$26,d0 
                lea     byte_1B1FA(pc), a0
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
                move.l  #byte_1B202,((dword_FFB3C0-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.b  #5,((byte_FFB583-$1000000)).w
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_APOLLO,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #2,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa12_Apollo

byte_1B1FA:     dc.b 1
                dc.b $12
                dc.b 0
                dc.b $CB
                dc.b 7
                dc.b $80
                dc.b 5
                dc.b $20
byte_1B202:     dc.b 0
                dc.b $38
                dc.b 8
                dc.b $60
                dc.b 0
                dc.b 1
                dc.b $B2
                dc.b $A
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FE
                dc.b $FF
                dc.b $FF
                dc.b 0
                dc.b 0

; =============== S U B R O U T I N E =======================================


sa13_Neptun:
                
                bsr.w   ClearSpellAnimationProperties
                bclr    #6,((byte_FFB56E-$1000000)).w
                moveq   #2,d0
                bsr.w   LoadInvocationSpell
                moveq   #2,d0
                moveq   #1,d1
                bsr.w   LoadInvocationSprite
                sndCom  SFX_PRISM_LASER_FIRING
                bset    #6,((byte_FFB56E-$1000000)).w
                moveq   #$14,d1
                moveq   #9,d2
                lea     byte_1B358(pc), a0
                lea     6(a0),a1
loc_1B248:
                
                movem.l d1-d2/a0-a1,-(sp)
                bsr.w   sub_1A380
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
                moveq   #$E,d0
                bsr.w   sub_19CE8       
                moveq   #$26,d0 
                lea     byte_1B364(pc), a0
                bsr.w   sub_19F5E
                moveq   #$19,d0
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
                lea     (byte_FFAFA1).l,a0
                moveq   #$F,d0
loc_1B304:
                
                move.b  #1,(a0)+
                dbf     d0,loc_1B304
                lea     (byte_FFAFC6).l,a0
                moveq   #$15,d0
loc_1B314:
                
                move.b  #1,(a0)+
                dbf     d0,loc_1B314
                moveq   #$14,d0
                jsr     (Sleep).w       
                move.l  #byte_1B36C,((dword_FFB3C0-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.b  #5,((byte_FFB583-$1000000)).w
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_NEPTUN,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #4,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa13_Neptun

byte_1B358:     dc.b 1
                dc.b 0
                dc.b 0
                dc.b $B0
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
byte_1B364:     dc.b 1
                dc.b $28
                dc.b 0
                dc.b $C0
                dc.b 7
                dc.b $80
                dc.b 6
                dc.b $20
byte_1B36C:     dc.b 0
                dc.b $38
                dc.b 4
                dc.b $60
                dc.b 0
                dc.b 1
                dc.b $B3
                dc.b $74
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FF
                dc.b 0
                dc.b 0

; =============== S U B R O U T I N E =======================================


sa14_Atlas:
                
                bsr.w   ClearSpellAnimationProperties
                bclr    #6,((byte_FFB56E-$1000000)).w
                moveq   #1,d0
                bsr.w   LoadInvocationSpell
                moveq   #1,d0
                moveq   #1,d1
                bsr.w   LoadInvocationSprite
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
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_ATLAS,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #2,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa14_Atlas


; =============== S U B R O U T I N E =======================================


sa15_PrismLaser:
                
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_PRSIM_LASER,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                jsr     sub_1A2F6(pc)
                cmpi.w  #$31,((ENEMY_BATTLE_SPRITE-$1000000)).w 
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
                lea     byte_1B480(pc), a0
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                lea     (byte_FFAFC6).l,a1
                moveq   #$F,d0
loc_1B456:
                
                move.b  #2,(a1)+
                dbf     d0,loc_1B456
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_PRISM_LASER,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB589-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa15_PrismLaser

byte_1B480:     dc.b 0
                dc.b $B8
                dc.b 0
                dc.b $D4
                dc.b 5
                dc.b $23
                dc.b $F
                dc.b $20

; =============== S U B R O U T I N E =======================================


sa16_BubbleBreath:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellAnimationProperties
                clr.w   d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6
                move.w  (sp)+,d1
                andi.w  #7,d1
                cmpi.w  #2,d1
                bcs.s   loc_1B4CE
                lea     byte_1B4F0(pc), a0
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
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa16_BubbleBreath

byte_1B4F0:     dc.b $C
                dc.b $BF
                dc.b $B
                dc.b $9A
                dc.b $B
                dc.b $46

; =============== S U B R O U T I N E =======================================


sa18_CutOff:
                
                andi.w  #7,d1
                subq.w  #1,d1
                beq.w   loc_1B508
                subq.w  #1,d1
                beq.w   loc_1B53E
                rts
loc_1B508:
                
                bclr    #3,((byte_FFB56E-$1000000)).w
                move.w  #CUTOFF_FLASH_COLOR,d0
                bsr.w   ExecSpellAnimationFlash
                move.l  #byte_1B53A,((dword_FFB3C6-$1000000)).w
                move.w  #1,((word_FFB3CA-$1000000)).w
                move.b  #$A,((byte_FFB583-$1000000)).w
loc_1B52A:
                
                tst.w   ((word_FFB3CA-$1000000)).w
                bne.s   loc_1B52A
                clr.l   ((dword_FFB3C6-$1000000)).w
                clr.b   ((byte_FFB583-$1000000)).w
                rts
byte_1B53A:
                
                dc.b 1
                dc.b $28
                dc.b $68
                dc.b $18
loc_1B53E:
                
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1B55C
                cmpi.w  #$35,((ENEMY_BATTLE_SPRITE-$1000000)).w 
                bne.s   loc_1B550
                rts
loc_1B550:
                
                btst    #2,((byte_FFB56F-$1000000)).w
                beq.s   loc_1B55A
                rts
loc_1B55A:
                
                bra.s   loc_1B570
loc_1B55C:
                
                cmpi.b  #$FF,((BATTLE_BACKGROUND-$1000000)).w
                bne.s   loc_1B566
                rts
loc_1B566:
                
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   loc_1B570
                rts
loc_1B570:
                
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_CUTOFF,d0
                bsr.w   LoadSpellGraphics
                lea     ((byte_FFB406-$1000000)).w,a5
                lea     ((word_FFB3FA-$1000000)).w,a3
                lea     word_1B608(pc), a0
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1B594
                addq.w  #8,a0
                lea     ((word_FFB3F6-$1000000)).w,a3
loc_1B594:
                
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
                move.w  #$FFFF,(a3)
loc_1B5D2:
                
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1B5E0
                addq.w  #1,VDPSPRITE_OFFSET_X(a4)
                bra.s   loc_1B5E4
loc_1B5E0:
                
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

    ; End of function sa18_CutOff

word_1B608:     dc.w $138
                dc.w $110
                dc.w $520
                dc.w $520
                dc.w $C0
                dc.w $100
                dc.w $520
                dc.w $520

; =============== S U B R O U T I N E =======================================


sa1A_AttackSpell:
                
                 
                sndCom  SFX_SPELL_CAST
                move.w  #ATTACK_SPELL_FLASH_COLOR,d0
                bsr.w   ExecSpellAnimationFlash
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_DETOX,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6
                move.w  #1,4(a0)
                lea     byte_1AA88(pc), a0
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_ATTACK_SPELL,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB584-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa1A_AttackSpell


; =============== S U B R O U T I N E =======================================


sa17_SnowBreath:
                
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_SNOW_BREATH,d0
                bsr.w   LoadSpellGraphics
                lea     ((byte_FFB532-$1000000)).w,a1
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1B67C
                move.w  #$50,(a1) 
                bra.s   loc_1B680
loc_1B67C:
                
                move.w  #$D0,(a1) 
loc_1B680:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_SNOW_BREATH,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa17_SnowBreath


; =============== S U B R O U T I N E =======================================


sa1D_PhoenixAttack:
                
                bsr.w   ClearSpellAnimationProperties
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
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa1D_PhoenixAttack


; =============== S U B R O U T I N E =======================================


sa1E_BurstRockExplosion:
                
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_EXPLOSION,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BURST_ROCK_EXPLOSION,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB584-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa1E_BurstRockExplosion


; =============== S U B R O U T I N E =======================================

; and maybe Zynk's beam too ?


sa1F_OddEyeBeam:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellAnimationProperties
                moveq   #SPELLGRAPHICS_ODD_EYE_BEAM,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     byte_1B794(pc), a0
                btst    #7,d1
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
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                move.w  #$FFFF,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_ODD_EYE_BEAM,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB584-$1000000)).w
                move.b  #1,((byte_FFB589-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function sa1F_OddEyeBeam

byte_1B794:     dc.b 1
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


UpdateSpellAnimation:
                
                tst.b   ((byte_FFB584-$1000000)).w
                beq.s   return_1B7C8
                move.b  ((byte_FFB585-$1000000)).w,d0
                beq.s   return_1B7C8
                subq.b  #1,d0
                beq.s   loc_1B7CE
                subq.b  #1,d0
                beq.s   loc_1B7CA
                bra.w   sub_1B82A
return_1B7C8:
                
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
                move.w  rjt_SpellAnimationUpdates(pc,d7.w),d7
                jmp     rjt_SpellAnimationUpdates(pc,d7.w)

    ; End of function UpdateSpellAnimation

rjt_SpellAnimationUpdates:
                dc.w nullsub_1B93A-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Blaze-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Freeze-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Desoul-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_HealingFairy-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Blast-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Detox-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Bolt-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Buff-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Debuff-rjt_SpellAnimationUpdates
                dc.w nullsub_1B828-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_DemonBreath-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_FlameBreath-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_ArrowsAndSpears-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_CannonProjectile-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_ShotProjectile-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_GunnerProjectile-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Dao-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Apollo-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Neptun-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Atlas-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_PrismLaser-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_BubbleBreath-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_SnowBreath-rjt_SpellAnimationUpdates
                dc.w nullsub_1B828-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Buff-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_AttackSpell-rjt_SpellAnimationUpdates 
                                                        ; SFCD's ATTACK spell (unused)
                dc.w UpdateSpellAnimation_Debuff-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_Debuff-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_PhoenixAttack-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_BurstRockExplosion-rjt_SpellAnimationUpdates
                dc.w UpdateSpellAnimation_OddEyeBeam-rjt_SpellAnimationUpdates

; =============== S U B R O U T I N E =======================================


nullsub_1B828:
                
                rts

    ; End of function nullsub_1B828


; =============== S U B R O U T I N E =======================================


sub_1B82A:
                
                clr.w   ((PALETTE_1_CURRENT-$1000000)).w
                clr.w   ((PALETTE_3_CURRENT_02-$1000000)).w
                jsr     (ApplyVIntCramDma).w
                jsr     (EnableDmaQueueProcessing).w
                bsr.w   sub_1A00A
                bsr.w   ClearSpellAnimationProperties
                cmpi.b  #SPELLANIMATION_DAO,((CURRENT_SPELLANIMATION-$1000000)).w
                bcs.s   loc_1B858
                cmpi.b  #SPELLANIMATION_ATLAS,((CURRENT_SPELLANIMATION-$1000000)).w
                bhi.s   loc_1B858
                moveq   #$10,d0
                jsr     (InitSprites).w 
loc_1B858:
                
                clr.w   ((byte_FFB404-$1000000)).w
                clr.b   ((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                clr.b   ((CURRENT_SPELLANIMATION-$1000000)).w
                clr.b   ((byte_FFB585-$1000000)).w
                clr.b   ((byte_FFB584-$1000000)).w
                clr.b   ((byte_FFB568-$1000000)).w
                clr.b   ((byte_FFB569-$1000000)).w
                clr.b   ((byte_FFB56A-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
                clr.b   ((byte_FFB589-$1000000)).w
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


sub_1B90C:
                
                movem.w d5-d6,-(sp)
                clr.w   d5
                move.b  ((byte_FFB56A-$1000000)).w,d5
                add.w   d5,d5
                move.w  word_1B930(pc,d5.w),d6
                tst.w   d5
                beq.s   loc_1B92C
                add.w   ((word_FFB3EE-$1000000)).w,d6
                bsr.w   sub_1F1F0
                subq.b  #1,((byte_FFB56A-$1000000)).w
loc_1B92C:
                
                movem.w (sp)+,d5-d6
word_1B930:
                
                dc.w $4E75

    ; End of function sub_1B90C

                dc.b $FF
                dc.b $FE
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 3
                dc.b $FF
                dc.b $FD

; =============== S U B R O U T I N E =======================================


nullsub_1B93A:
                
                rts

    ; End of function nullsub_1B93A


; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_Blaze:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                move.w  d1,8(a4)
                clr.l   $A(a4)
                move.w  d1,$E(a4)
                clr.w   (a5)
                subq.b  #1,((byte_FFB584-$1000000)).w
                bra.w   loc_1B9EA
loc_1B982:
                
                subq.w  #1,2(a5)
                bne.w   loc_1B9BC
                move.w  #5,2(a5)
                lea     byte_1BE2A(pc), a0
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
                move.w  d2,$C(a4)
loc_1B9BC:
                
                btst    #0,1(a5)
                bne.s   loc_1B9D0
                move.w  #1,(a4)
                move.w  #1,8(a4)
                bra.s   loc_1B9EA
loc_1B9D0:
                
                clr.w   d1
                move.b  2(a3),d1
                addi.w  #$80,d1 
                move.w  d1,(a4)
                clr.w   d1
                move.b  3(a3),d1
                addi.w  #$80,d1 
                move.w  d1,8(a4)
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
                lea     byte_1BE42(pc), a0
                tst.b   4(a3)
                beq.s   loc_1BA30
                lea     $20(a0),a0
loc_1BA30:
                
                bsr.w   sub_19F5E
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1BAB6
loc_1BAA8:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1BAB6:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  6(a5),d0
                add.w   $A(a5),d0
                tst.w   d0
                bmi.s   loc_1BAD4
                move.w  d0,d1
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1BAE2
loc_1BAD4:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                lea     byte_1BE46(pc), a0
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
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BB42
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1BB42:
                
                bra.w   loc_1BBFA
loc_1BB46:
                
                subq.b  #1,d1
                bne.w   loc_1BB80
                move.w  #$300,2(a5)
                lea     byte_1BE52(pc), a0
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
                lea     byte_1BE5A(pc), a0
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
                subq.b  #1,((byte_FFB584-$1000000)).w
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
                addq.w  #8,a4
                lea     $C(a5),a5
                dbf     d1,loc_1BA00
loc_1BC0A:
                
                bsr.w   sub_1B90C
                tst.b   ((byte_FFB584-$1000000)).w
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
                
                andi.w  #$FF,d0
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1BCAC
loc_1BC9E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                andi.w  #$FF,d0
                asr.w   #8,d1
                bra.s   loc_1BCDE
loc_1BCD0:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #$FF,d0
                neg.w   d0
                asr.w   #8,d1
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

    ; End of function UpdateSpellAnimation_Blaze


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
                lea     word_1BE82(pc), a3
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
                move.b  byte_1BE1C(pc,d5.w),d3
                add.w   d3,d7
                andi.w  #$F0,d7 
                ori     #1,ccr
loc_1BE16:
                
                movem.w (sp)+,d1-d6
                rts

    ; End of function sub_1BDA0

byte_1BE1C:     dc.b 0
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
byte_1BE2A:     dc.b 0
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
byte_1BE42:     dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
byte_1BE46:     dc.b 5
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
byte_1BE52:     dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $BD
                dc.b $A
                dc.b $20
byte_1BE5A:     dc.b 0
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
word_1BE82:     dc.w $C
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $C
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $C
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $C
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $C
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 8

; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_Freeze:
                
                lea     ((byte_FFB406-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                moveq   #$26,d0 
                btst    #2,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1BF5C
                tst.w   (a5)
                beq.w   loc_1BF54
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1BEC8
                clr.l   (a5)
                subq.b  #1,((byte_FFB584-$1000000)).w
                bra.w   loc_1BF54
loc_1BEC8:
                
                subq.w  #1,(a5)
                bne.w   loc_1BF54
                move.w  #2,(a5)
                tst.w   2(a5)
                bne.w   loc_1BF1E
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                andi.w  #$FF,d0
                move.b  d0,3(a5)
                jsr     (sub_179C).w    
                lsl.w   #3,d1
                add.w   6(a5),d1
                tst.w   d1
                bmi.s   loc_1C052
                move.w  d1,d0
                andi.w  #$FF,d0
                asr.w   #8,d1
                bra.s   loc_1C060
loc_1C052:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #$FF,d0
                neg.w   d0
                asr.w   #8,d1
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
                andi.w  #$FF,d0
                asr.w   #8,d1
                bra.s   loc_1C08C
loc_1C07E:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #$FF,d0
                neg.w   d0
                asr.w   #8,d1
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
                cmpi.w  #$FFFF,d0
                beq.w   loc_1C136
                addq.b  #1,((byte_FFB584-$1000000)).w
                bra.w   loc_1C136
loc_1C0BA:
                
                lea     (byte_FFAFA0).l,a0
                adda.w  d0,a0
                clr.w   d0
                move.b  3(a5),d0
                move.b  9(a3),d1
                ext.w   d1
                add.w   d1,d0
                andi.w  #$FF,d0
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
                subq.b  #1,((byte_FFB584-$1000000)).w
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
                
                lea     byte_1C242(pc), a0
                bsr.w   sub_1B8B2
                tst.b   ((byte_FFB584-$1000000)).w
loc_1C184:
                
                beq.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_Freeze

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
byte_1C242:     dc.b $E
                dc.b $44
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 1

; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_Desoul:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                andi.w  #$FF,d0
                move.w  d0,2(a5)
                btst    #1,6(a5)
                bne.s   loc_1C2C0
                tst.b   5(a5)
                beq.s   loc_1C2D2
                cmpi.w  #$80,d0 
                bcs.s   loc_1C2BE
                bset    #1,6(a5)
loc_1C2B4:
                
                lea     byte_1C51E(pc), a0
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
                
                lea     word_1C4FE(pc), a0
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
                lea     word_1C4FE(pc), a0
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

    ; End of function UpdateSpellAnimation_Desoul


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

word_1C4FE:     dc.w 0
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
byte_1C51E:     dc.b 0
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


UpdateSpellAnimation_HealingFairy:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                subq.b  #1,((byte_FFB584-$1000000)).w
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
                lsl.w   #4,d7
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
                lsr.w   #4,d0
                jsr     (sub_179C).w    
                move.w  d1,d0
                muls.w  d2,d0
                asr.l   #8,d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1C644
                move.w  d0,d1
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1C652
loc_1C644:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                asr.l   #8,d1
                add.w   $A(a5),d1
                tst.w   d1
                bmi.s   loc_1C680
                move.w  d1,d0
                andi.w  #$FF,d0
                asr.w   #8,d1
                bra.s   loc_1C68E
loc_1C680:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #$FF,d0
                neg.w   d0
                asr.w   #8,d1
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
                cmpi.w  #$180,VDPSPRITE_OFFSET_X(a4)
                bls.w   loc_1C720
loc_1C6E0:
                
                addq.w  #1,2(a5)
                lea     byte_1C7EE(pc), a0
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
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_HealingFairy

byte_1C7EE:     dc.b 0
                dc.b $60
                dc.b 0
                dc.b $80
                dc.b 1
                dc.b $80
                dc.b 0
                dc.b $80

; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_Blast:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1CBBA(pc), a0
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
                lea     word_1CBDE(pc), a0
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1C93C
loc_1C92E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1C93C:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  6(a5),d0
                add.w   $A(a5),d0
                tst.w   d0
                bmi.s   loc_1C95A
                move.w  d0,d1
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1C968
loc_1C95A:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                andi.w  #$F,d1
                subi.w  #$10,d1
                move.b  1(a0),d2
                ext.w   d2
                add.w   d2,d1
                add.w   2(a3),d1
                move.w  d1,(a4)
                lsr.w   #7,d7
                andi.w  #$F,d7
                subi.w  #$18,d7
                move.b  (a0),d2
                ext.w   d2
                add.w   d2,d7
                add.w   (a3),d7
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                lea     byte_1CC44(pc), a1
                bra.w   loc_1CA76
loc_1CA22:
                
                subq.w  #1,d0
                bne.w   loc_1CA38
                lea     byte_1CC46(pc), a1
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
                lea     byte_1CC48(pc), a1
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
                lsl.w   #4,d0
                move.w  d0,VDPSPRITE_OFFSET_SIZE(a4)
                clr.w   d0
                move.b  1(a1),d0
                addi.w  #-$3AE0,d0
                clr.w   d1
                move.b  3(a0),d1
                lsl.w   #8,d1
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1CB6E
loc_1CB60:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                
                lea     byte_1CC0E(pc), a0
                bsr.w   sub_1B8B2
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_Blast


; =============== S U B R O U T I N E =======================================


sub_1CBA6:
                
                move.w  d0,-(sp)
                lea     byte_1CC14(pc), a0
                add.w   d0,d0
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                adda.w  d0,a0
                move.w  (sp)+,d0
                rts

    ; End of function sub_1CBA6

byte_1CBBA:     dc.b $FF
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
word_1CBDE:     dc.w 5
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
byte_1CC0E:     dc.b $C
                dc.b $C4
                dc.b 0
                dc.b $A
                dc.b 0
                dc.b 1
byte_1CC14:     dc.b $18
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
byte_1CC44:     dc.b $50
                dc.b $97
byte_1CC46:     dc.b $70
                dc.b $9B
byte_1CC48:     dc.b $60
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


UpdateSpellAnimation_Detox:
                
                lea     ((byte_FFB406-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   loc_1CD70
                addq.w  #1,(a5)
                cmpi.w  #2,(a3)
                beq.w   loc_1CC92
                tst.w   (a3)
                bne.w   loc_1CCB2
                lea     byte_1CE0C(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1CCB2
                move.w  #1,(a3)
                bra.w   loc_1CCB2
loc_1CC92:
                
                lea     byte_1CE2A(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1CCB2
                clr.w   (a5)
                move.w  #1,(a4)
                subq.b  #1,((byte_FFB584-$1000000)).w
                bra.w   loc_1CD70
loc_1CCB2:
                
                move.w  2(a5),d0
                btst    #0,6(a5)
                bne.s   loc_1CCDA
                subq.w  #8,d0
                andi.w  #$FF,d0
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
                andi.w  #$FF,d0
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
                cmpi.b  #$19,((byte_FFB584-$1000000)).w
                bcc.w   loc_1CD70
                moveq   #1,d0
                bsr.w   sub_1A2F6
                move.w  VDPSPRITE_OFFSET_X(a4),d0
                addq.w  #8,d0
                move.w  d0,4(a0)
                move.w  (a4),d0
                addq.w  #8,d0
                move.w  d0,6(a0)
                addq.b  #1,((byte_FFB584-$1000000)).w
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
                lea     byte_1CE48(pc), a0
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
                subq.b  #1,((byte_FFB584-$1000000)).w
loc_1CDF2:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1CD7A
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_Detox

byte_1CE0C:     dc.b 0
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
byte_1CE2A:     dc.b 0
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
byte_1CE48:     dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $3C
                dc.b 0
                dc.b $20

; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_Bolt:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                movea.l (p_BoltAnimData_A).l,a0
                bra.s   loc_1CEBE
loc_1CEB8:
                
                movea.l (p_BoltAnimData_B).l,a0
loc_1CEBE:
                
                lsl.w   #3,d1
                move.w  d1,d2
                lsl.w   #2,d1
                add.w   d2,d1
                adda.w  d1,a0
                moveq   #5,d1
                move.w  6(a5),d2
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                subq.b  #1,((byte_FFB584-$1000000)).w
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
                tst.b   ((byte_FFB584-$1000000)).w
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
                lea     word_1CFF6(pc), a0
                bra.w   sub_1B8B2

    ; End of function UpdateSpellAnimation_Bolt

word_1CFF6:     dc.w $EAA
                dc.w $E
                dc.w 1

; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_Buff:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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

    ; End of function UpdateSpellAnimation_Buff


; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_Debuff:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1D0EE(pc), a0
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
                lea     byte_1D0F6(pc), a0
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

    ; End of function UpdateSpellAnimation_Debuff

byte_1D0EE:     dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $20
                dc.b $F
                dc.b $20
byte_1D0F6:     dc.b 0
                dc.b $10
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b 0

; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_DemonBreath:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1D2A2(pc), a0
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D18A
loc_1D17C:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1D18A:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  6(a5),d0
                add.w   $A(a5),d0
                tst.w   d0
                bmi.s   loc_1D1A8
                move.w  d0,d1
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D1B6
loc_1D1A8:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                cmpi.b  #$19,((byte_FFB584-$1000000)).w
                bcc.w   loc_1D288
                moveq   #1,d0
                bsr.w   sub_1A2F6
                addq.b  #1,((byte_FFB584-$1000000)).w
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D25A
loc_1D24C:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1D25A:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                tst.w   4(a3)
                beq.s   loc_1D272
                lea     word_1D2AA(pc), a0
                moveq   #$A,d0
                bsr.w   sub_1B884
loc_1D272:
                
                cmpi.w  #$45,(a5) 
                bcs.w   loc_1D288
                clr.w   (a5)
                move.w  #1,(a4)
                subq.b  #1,((byte_FFB584-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
loc_1D288:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1D10E
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_DemonBreath

byte_1D2A2:     dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $20
                dc.b $F
                dc.b $20
word_1D2AA:     dc.w $20
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


UpdateSpellAnimation_FlameBreath:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1D4A0(pc), a0
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1D33C
                addq.w  #8,a0
                move.w  ((ENEMY_BATTLE_SPRITE-$1000000)).w,d2
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
                andi.w  #$FF,d0
                asr.w   #8,d1
                bra.s   loc_1D376
loc_1D368:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #$FF,d0
                neg.w   d0
                asr.w   #8,d1
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
                andi.w  #$FF,d0
                asr.w   #8,d1
                bra.s   loc_1D3A6
loc_1D398:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #$FF,d0
                neg.w   d0
                asr.w   #8,d1
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
                cmpi.w  #$FFFF,d0
                beq.w   loc_1D424
                move.w  d1,2(a0)
                move.b  d2,8(a0)
                addq.b  #1,((byte_FFB584-$1000000)).w
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
                subq.b  #1,((byte_FFB584-$1000000)).w
loc_1D424:
                
                moveq   #4,d0
                lea     byte_1D4C8(pc), a0
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
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
loc_1D45C:
                
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB406-$1000000)).w,a5
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

    ; End of function UpdateSpellAnimation_FlameBreath

byte_1D4A0:     dc.b 1
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
byte_1D4C8:     dc.b 0
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


UpdateSpellAnimation_ArrowsAndSpears:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D526
loc_1D518:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D5A6
loc_1D598:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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

    ; End of function UpdateSpellAnimation_ArrowsAndSpears


; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_CannonProjectile:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1D776(pc), a0
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D63C
loc_1D62E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1D63C:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D65A
                move.w  d0,d1
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D668
loc_1D65A:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1D668:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1D762
                cmpi.w  #3,(a5)
                bne.s   loc_1D68A
                cmpi.b  #8,((byte_FFB584-$1000000)).w
                bcc.s   loc_1D68A
                moveq   #1,d0
                bsr.w   sub_1A2F6
                addq.b  #1,((byte_FFB584-$1000000)).w
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D6F2
loc_1D6E4:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1D6F2:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D710
                move.w  d0,d1
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D71E
loc_1D710:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                subq.b  #1,((byte_FFB584-$1000000)).w
loc_1D748:
                
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                addq.w  #8,a4
                lea     $C(a5),a5
                dbf     d1,loc_1D5D6
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_CannonProjectile


; =============== S U B R O U T I N E =======================================


sub_1D762:
                
                subq.w  #1,4(a5)
                bne.s   return_1D774
                move.w  #4,4(a5)
                bchg    #2,5(a4)
return_1D774:
                
                rts

    ; End of function sub_1D762

byte_1D776:     dc.b 1
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


UpdateSpellAnimation_ShotProjectile:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D7C6
loc_1D7B8:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1D7C6:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D7E4
                move.w  d0,d1
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D7F2
loc_1D7E4:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D85E
loc_1D850:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1D85E:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D87C
                move.w  d0,d1
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1D88A
loc_1D87C:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                lea     byte_1D9CE(pc), a0
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
                cmpi.b  #$10,((byte_FFB584-$1000000)).w
                bcc.w   loc_1D998
                moveq   #1,d0
                bsr.w   sub_1A2F6
                cmpi.w  #$FFFF,d0
                beq.w   loc_1D998
                addq.b  #1,((byte_FFB584-$1000000)).w
loc_1D954:
                
                tst.b   $A(a5)
                bne.s   loc_1D96E
                lea     byte_1D9DE(pc), a0
                moveq   #2,d0
                bsr.w   sub_1B884
                cmpi.w  #9,(a5)
                bcc.w   loc_1D984
                bra.s   loc_1D980
loc_1D96E:
                
                lea     byte_1D9EA(pc), a0
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
                subq.b  #1,((byte_FFB584-$1000000)).w
loc_1D998:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1D8B6
loc_1D9A8:
                
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_ShotProjectile


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

byte_1D9CE:     dc.b 0
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
byte_1D9DE:     dc.b 0
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
byte_1D9EA:     dc.b 0
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


UpdateSpellAnimation_GunnerProjectile:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1DA3C
loc_1DA2E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1DA3C:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1DA5A
                move.w  d0,d1
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1DA68
loc_1DA5A:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1DAD4
loc_1DAC6:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1DAD4:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1DAF2
                move.w  d0,d1
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1DB00
loc_1DAF2:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                move.b  #$F,((FADING_PALETTE_BITMAP-$1000000)).w
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
                move.b  #$F,((FADING_PALETTE_BITMAP-$1000000)).w
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
                lea     byte_1DC88(pc), a0
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

    ; End of function UpdateSpellAnimation_GunnerProjectile


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

byte_1DC88:     dc.b 0
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


UpdateSpellAnimation_Dao:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1DE06(pc), a0
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
                andi.w  #$FF,d2
                asr.w   #8,d1
                bra.s   loc_1DD98
loc_1DD8A:
                
                neg.w   d1
                move.w  d1,d2
                andi.w  #$FF,d2
                neg.w   d2
                asr.w   #8,d1
                neg.w   d1
loc_1DD98:
                
                move.w  d2,4(a5)
                add.w   d1,(a4)
                addi.w  #6,2(a5)
                cmpi.w  #8,(a5)
                bne.w   loc_1DDCC
                cmpi.b  #$10,((byte_FFB584-$1000000)).w
                bcc.w   loc_1DDE8
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1DDE8
                moveq   #1,d0
                bsr.w   sub_1A2F6
                addq.b  #1,((byte_FFB584-$1000000)).w
                bra.w   loc_1DDE8
loc_1DDCC:
                
                cmpi.w  #$60,(a4) 
                bhi.w   loc_1DDE8
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((byte_FFB584-$1000000)).w
loc_1DDE8:
                
                move.w  (sp)+,d0
                addq.w  #8,a4
                lea     $C(a5),a5
                dbf     d0,loc_1DCFC
                lea     byte_1DE1E(pc), a0
                bsr.w   sub_1B8B2
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_Dao

byte_1DE06:     dc.b 0
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
byte_1DE1E:     dc.b 2
                dc.b $48
                dc.b 0
                dc.b $1E
                dc.b 0
                dc.b 1

; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_Apollo:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1DFA2(pc), a0
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
                lea     byte_1DFB2(pc), a0
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
                cmpi.b  #$15,((byte_FFB584-$1000000)).w
                bcc.w   loc_1DF7E
                moveq   #1,d0
                bsr.w   sub_1A2F6
                addq.b  #1,((byte_FFB584-$1000000)).w
                bra.w   loc_1DF7E
loc_1DF24:
                
                subq.w  #1,4(a5)
                bne.w   loc_1DF7E
                move.w  #3,4(a5)
                move.w  2(a5),d1
                cmpi.w  #4,d1
                bcc.w   loc_1DF6A
                lea     byte_1DFC0(pc), a0
                tst.b   6(a5)
                beq.s   loc_1DF4A
                addq.w  #6,a0
loc_1DF4A:
                
                add.w   d1,d1
                move.w  (a0,d1.w),d1
                addi.w  #-$4000,d1
                clr.w   d2
                move.b  7(a5),d2
                lsl.w   #8,d2
                or.w    d2,d1
                move.w  d1,VDPSPRITE_OFFSET_TILE(a4)
                addq.w  #1,2(a5)
                bra.w   loc_1DF7E
loc_1DF6A:
                
                clr.l   (a5)
                clr.l   4(a5)
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((byte_FFB584-$1000000)).w
loc_1DF7E:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1DE8A
                lea     byte_1DFCE(pc), a0
                bsr.w   sub_1B8B2
                cmpi.b  #2,((byte_FFB584-$1000000)).w
                bcs.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_Apollo

byte_1DFA2:     dc.b 1
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
byte_1DFB2:     dc.b 0
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
byte_1DFC0:     dc.b $F
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
byte_1DFCE:     dc.b 0
                dc.b $F
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 1

; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_Neptun:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1E10E(pc), a0
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
                lea     byte_1E106(pc), a0
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

    ; End of function UpdateSpellAnimation_Neptun


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

byte_1E106:     dc.b 0
                dc.b $80
                dc.b 1
                dc.b 0
                dc.b 5
                dc.b $3E
                dc.b 5
                dc.b $20
byte_1E10E:     dc.b 0
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


UpdateSpellAnimation_Atlas:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_Atlas


; =============== S U B R O U T I N E =======================================


sub_1E160:
                
                tst.w   (a5)
                beq.w   return_1E25C
                addq.w  #1,(a5)
                tst.w   8(a5)
                bne.s   loc_1E17C
                lea     ((byte_FFB532-$1000000)).w,a3
                lea     byte_1E290(pc), a0
                move.w  #$10,d0
                bra.s   loc_1E188
loc_1E17C:
                
                lea     ((dword_FFB536-$1000000)).w,a3
                lea     word_1F7BE(pc), a0
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1E1E4
loc_1E1D6:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
                neg.w   d0
loc_1E1E4:
                
                move.w  d1,4(a5)
                add.w   6(a4),d0
                move.w  2(a3),d2
                add.w   6(a5),d2
                tst.w   d2
                bmi.s   loc_1E202
                move.w  d2,d1
                andi.w  #$FF,d1
                asr.w   #8,d2
                bra.s   loc_1E210
loc_1E202:
                
                neg.w   d2
                move.w  d2,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d2
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
                subq.b  #1,((byte_FFB584-$1000000)).w
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

byte_1E290:     dc.b $89
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


UpdateSpellAnimation_PrismLaser:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                move.b  #$F,((FADING_PALETTE_BITMAP-$1000000)).w
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
                move.b  #$F,((FADING_PALETTE_BITMAP-$1000000)).w
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
                clr.b   ((byte_FFB589-$1000000)).w
                bra.w   return_1E452
loc_1E3E2:
                
                subq.w  #1,d1
                bne.w   loc_1E404
                cmpi.b  #3,((byte_FFB589-$1000000)).w
                bne.w   loc_1E44A
                move.b  #1,((byte_FFB589-$1000000)).w
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
                clr.b   ((byte_FFB589-$1000000)).w
                move.w  #7,2(a5)
loc_1E44A:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
return_1E452:
                
                rts

    ; End of function UpdateSpellAnimation_PrismLaser


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
                asl.w   #4,d7
                neg.w   d7
                move.w  d7,4(a5)
                subi.w  #$E4,d2 
                asl.w   #4,d2
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
                andi.w  #$FF,d3
                asr.w   #8,d2
                bra.s   loc_1E560
loc_1E552:
                
                neg.w   d2
                move.w  d2,d3
                andi.w  #$FF,d3
                neg.w   d3
                asr.w   #8,d2
                neg.w   d2
loc_1E560:
                
                move.w  d3,8(a5)
                add.w   d2,6(a4)
                move.w  6(a5),d2
                add.w   $A(a5),d2
                tst.w   d2
                bmi.s   loc_1E57E
                move.w  d2,d3
                andi.w  #$FF,d3
                asr.w   #8,d2
                bra.s   loc_1E58C
loc_1E57E:
                
                neg.w   d2
                move.w  d2,d3
                andi.w  #$FF,d3
                neg.w   d3
                asr.w   #8,d2
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


UpdateSpellAnimation_BubbleBreath:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1E786(pc), a0
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1E64E
loc_1E640:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1E682
loc_1E674:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                andi.w  #$FF,d1
                asr.w   #8,d0
                bra.s   loc_1E70C
loc_1E6FE:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #$FF,d1
                neg.w   d1
                asr.w   #8,d0
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
                subq.b  #1,((byte_FFB584-$1000000)).w
                bra.s   loc_1E75A
loc_1E730:
                
                addq.w  #1,(a5)
                lea     byte_1E78E(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$A,(a5)
                bne.s   loc_1E75A
                cmpi.b  #$10,((byte_FFB584-$1000000)).w
                bcc.s   loc_1E75A
                tst.w   ((byte_FFB404-$1000000)).w
                beq.s   loc_1E75A
                moveq   #1,d0
                bsr.w   sub_1A2F6
                addq.b  #1,((byte_FFB584-$1000000)).w
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
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_BubbleBreath

byte_1E786:     dc.b 0
                dc.b $D4
                dc.b 0
                dc.b $F8
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
byte_1E78E:     dc.b 0
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


UpdateSpellAnimation_SnowBreath:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1E8E2(pc), a0
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                andi.w  #$FF,d0
                asr.w   #8,d1
                bra.s   loc_1E830
loc_1E822:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #$FF,d0
                neg.w   d0
                asr.w   #8,d1
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
                andi.w  #$FF,d0
                asr.w   #8,d1
                bra.s   loc_1E85C
loc_1E84E:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #$FF,d0
                neg.w   d0
                asr.w   #8,d1
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
                cmpi.w  #$FFFF,d0
                beq.w   loc_1E8AA
                addq.b  #1,((byte_FFB584-$1000000)).w
                bra.w   loc_1E8AA
loc_1E88A:
                
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1E8AA
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.b   ((byte_FFB588-$1000000)).w
                subq.b  #1,((byte_FFB584-$1000000)).w
loc_1E8AA:
                
                move.w  8(a5),(a4)
                moveq   #$10,d0
                lea     byte_1E8F2(pc), a0
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
                
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
                bra.w   loc_1D45C

    ; End of function UpdateSpellAnimation_SnowBreath

byte_1E8E2:     dc.b 1
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
byte_1E8F2:     dc.b 0
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


UpdateSpellAnimation_AttackSpell:
                
                lea     ((byte_FFB406-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   loc_1CD70
                addq.w  #1,(a5)
                cmpi.w  #2,(a3)
                beq.w   loc_1E994
                tst.w   (a3)
                bne.w   loc_1E9B4
                lea     byte_1CE0C(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1E9B4
                move.w  #1,(a3)
                bra.w   loc_1E9B4
loc_1E994:
                
                lea     byte_1CE2A(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1E9B4
                clr.w   (a5)
                move.w  #1,(a4)
                subq.b  #1,((byte_FFB584-$1000000)).w
                bra.w   loc_1CD70
loc_1E9B4:
                
                btst    #7,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
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
                andi.w  #$FF,d0
                move.w  d0,2(a5)
                move.l  #$12003800,d1
                jsr     (sub_1812).w
                add.w   d3,d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                swap    d2
                addi.w  #$D0,d2 
                move.w  d2,(a4)
                bra.w   loc_1CD10

    ; End of function UpdateSpellAnimation_AttackSpell


; =============== S U B R O U T I N E =======================================


UpdateSpellAnimation_PhoenixAttack:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1EB88(pc), a0
                bsr.w   sub_19F5E
                sndCom  SFX_SPAWN
                bra.w   loc_1EA98
loc_1EA46:
                
                subq.w  #3,VDPSPRITE_OFFSET_X(a4)
                lea     byte_1EB90(pc), a0
                moveq   #3,d0
                bsr.w   sub_1B884
                cmpi.w  #$C,(a5)
                bne.w   loc_1EA7C
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1EA98
                cmpi.b  #3,((byte_FFB584-$1000000)).w
                bcc.w   loc_1EA98
                moveq   #1,d0
                bsr.w   sub_1A2F6
                addq.b  #1,((byte_FFB584-$1000000)).w
                bra.w   loc_1EA98
loc_1EA7C:
                
                cmpi.w  #$1A,(a5)
                bcs.w   loc_1EA98
                clr.w   (a5)
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((byte_FFB584-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
loc_1EA98:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1EA22
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
                rts
loc_1EAB2:
                
                tst.w   (a5)
                beq.w   loc_1EB7E
                addq.w  #1,(a5)
                move.w  2(a5),d0
                bne.w   loc_1EAD4
                lea     byte_1EBA2(pc), a0
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
                lea     byte_1EBAA(pc), a0
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
                andi.w  #$FF,d0
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

    ; End of function UpdateSpellAnimation_PhoenixAttack

byte_1EB88:     dc.b 1
                dc.b $1C
                dc.b 0
                dc.b $D4
                dc.b 5
                dc.b $20
                dc.b $F
                dc.b $20
byte_1EB90:     dc.b 0
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
byte_1EBA2:     dc.b 0
                dc.b $FD
                dc.b 0
                dc.b $DD
                dc.b 5
                dc.b $DF
                dc.b $F
                dc.b $23
byte_1EBAA:     dc.b 0
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


UpdateSpellAnimation_BurstRockExplosion:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                lea     byte_1EC9A(pc), a0
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
                cmpi.b  #$10,((byte_FFB584-$1000000)).w
                bcc.w   loc_1EC46
                moveq   #1,d0
                bsr.w   sub_1A2F6
                addq.b  #1,((byte_FFB584-$1000000)).w
loc_1EC46:
                
                tst.b   2(a5)
                bne.s   loc_1EC5A
                lea     byte_1ECAA(pc), a0
                moveq   #3,d0
                bsr.w   sub_1B884
                moveq   #$E,d0
                bra.s   loc_1EC66
loc_1EC5A:
                
                lea     byte_1ECBC(pc), a0
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
                subq.b  #1,((byte_FFB584-$1000000)).w
loc_1EC80:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1EBC6
                tst.b   ((byte_FFB584-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function UpdateSpellAnimation_BurstRockExplosion

byte_1EC9A:     dc.b 0
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
byte_1ECAA:     dc.b 0
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
byte_1ECBC:     dc.b 0
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


UpdateSpellAnimation_OddEyeBeam:
                
                lea     ((byte_FFB406-$1000000)).w,a5
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
                clr.b   ((byte_FFB589-$1000000)).w
                bra.w   return_1EDDA
loc_1EDB2:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
                cmpi.b  #3,((byte_FFB589-$1000000)).w
                bne.w   return_1EDDA
                move.b  #1,((byte_FFB588-$1000000)).w
                move.b  #1,((byte_FFB589-$1000000)).w
                move.w  #$102,2(a5)
                clr.w   4(a5)
return_1EDDA:
                
                rts

    ; End of function UpdateSpellAnimation_OddEyeBeam


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
                clr.b   ((byte_FFB56D-$1000000)).w
                bsr.w   UpdateEnemyBattleSprite
                bsr.w   UpdateAllyBattleSprite
                bsr.w   sub_1EFD8
                bsr.w   sub_1F282
                bsr.w   UpdateSpellAnimation
                bsr.w   sub_1F148
                bsr.w   sub_1F176
                jmp     (sub_1942).w    

    ; End of function VInt_UpdateBattlesceneGraphics


; =============== S U B R O U T I N E =======================================


UpdateEnemyBattleSprite:
                
                btst    #3,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                btst    #5,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                subq.w  #1,((ENEMY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                bne.s   @Return
                bsr.w   sub_1EF2E
                move.w  ((ENEMY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w,((ENEMY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
@Return:
                
                rts

    ; End of function UpdateEnemyBattleSprite


; =============== S U B R O U T I N E =======================================


UpdateAllyBattleSprite:
                
                btst    #1,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                btst    #4,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                subq.w  #1,((ALLY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                bne.s   @Return
                bsr.s   UpdateWeaponSprite
                move.w  ((ALLY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w,((ALLY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
@Return:
                
                rts

    ; End of function UpdateAllyBattleSprite


; =============== S U B R O U T I N E =======================================


UpdateWeaponSprite:
                
                bchg    #0,((byte_FFB56E-$1000000)).w
                beq.s   loc_1EEAA
                clr.w   d2
                move.b  ((WEAPON_IDLE_FRAME1_X-$1000000)).w,d3
                move.b  ((WEAPON_IDLE_FRAME1_Y-$1000000)).w,d4
                bra.s   loc_1EEB6
loc_1EEAA:
                
                move.w  #$90,d2 
                move.b  ((WEAPON_IDLE_FRAME2_X-$1000000)).w,d3
                move.b  ((WEAPON_IDLE_FRAME2_Y-$1000000)).w,d4
loc_1EEB6:
                
                lea     word_1F57A(pc), a0
                btst    #0,((byte_FFB56F-$1000000)).w
                beq.s   loc_1EEC6
                lea     $48(a0),a0
loc_1EEC6:
                
                lea     ((SPRITE_01_TILE_FLAGS-$1000000)).w,a1
                moveq   #8,d7
loc_1EECC:
                
                move.w  (a0),(a1)
                add.w   d2,(a1)
                addq.w  #8,a0
                addq.w  #8,a1
                dbf     d7,loc_1EECC
                cmpi.w  #$FFFF,((ALLY_WEAPON_SPRITE-$1000000)).w
                beq.w   return_1EF2C
                ext.w   d3
                ext.w   d4
                move.b  ((WEAPON_FRAME_INDEX-$1000000)).w,d7
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   loc_1EEF6
                bchg    #4,d7
loc_1EEF6:
                
                lea     spr_1F606(pc), a0
                andi.w  #$30,d7 
                add.w   d7,d7
                adda.w  d7,a0
                lea     ((SPRITE_10-$1000000)).w,a1
                moveq   #3,d7
loc_1EF08:
                
                move.w  (a0),d0
                subi.w  #$C0,d0 
                add.w   ((word_FFB3F4-$1000000)).w,d0
                add.w   d4,d0
                move.w  d0,(a1)
                addq.w  #6,a0
                addq.w  #6,a1
                move.w  (a0)+,d0
                subi.w  #$108,d0
                add.w   ((word_FFB3F2-$1000000)).w,d0
                add.w   d3,d0
                move.w  d0,(a1)+
                dbf     d7,loc_1EF08
return_1EF2C:
                
                rts

    ; End of function UpdateWeaponSprite


; =============== S U B R O U T I N E =======================================


sub_1EF2E:
                
                bsr.w   sub_1EF50
                bra.w   loc_1EFB0

    ; End of function sub_1EF2E


; =============== S U B R O U T I N E =======================================


sub_1EF36:
                
                bsr.w   sub_1EF50
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jmp     (ApplyImmediateVramDma).w

    ; End of function sub_1EF36


; =============== S U B R O U T I N E =======================================


sub_1EF50:
                
                lea     word_1F6B6(pc), a0
                lea     (byte_FFE184).l,a1
                bchg    #2,((byte_FFB56E-$1000000)).w
                beq.s   loc_1EF68
                move.w  #$A220,d0
                bra.s   loc_1EF6C
loc_1EF68:
                
                move.w  #$A2E0,d0
loc_1EF6C:
                
                btst    #2,((byte_FFB56F-$1000000)).w
                bne.s   loc_1EF8E
                moveq   #$B,d7
loc_1EF76:
                
                moveq   #$F,d6
loc_1EF78:
                
                clr.w   d5
                move.b  (a0)+,d5
                add.w   d0,d5
                move.w  d5,(a1)+
                dbf     d6,loc_1EF78
                lea     $20(a1),a1
                dbf     d7,loc_1EF76
                bra.s   return_1EFAE
loc_1EF8E:
                
                bset    #$B,d0
                lea     $20(a1),a1
                moveq   #$B,d7
loc_1EF98:
                
                moveq   #$F,d6
loc_1EF9A:
                
                clr.w   d5
                move.b  (a0)+,d5
                add.w   d0,d5
                move.w  d5,-(a1)
                dbf     d6,loc_1EF9A
                lea     $60(a1),a1
                dbf     d7,loc_1EF98
return_1EFAE:
                
                rts

    ; End of function sub_1EF50


; START OF FUNCTION CHUNK FOR sub_1EF2E

loc_1EFB0:
                
                tst.b   ((byte_FFB56D-$1000000)).w
                bne.s   return_1EFD6
                move.b  #1,((byte_FFB56D-$1000000)).w
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
return_1EFD6:
                
                rts

; END OF FUNCTION CHUNK FOR sub_1EF2E


; =============== S U B R O U T I N E =======================================


sub_1EFD8:
                
                clr.w   d7
                move.b  ((byte_FFB580-$1000000)).w,d7
                addq.b  #1,d7
                andi.b  #$3F,d7 
                move.b  d7,((byte_FFB580-$1000000)).w
                move.b  ((byte_FFB57E-$1000000)).w,d0
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
                add.w   ((word_FFB3F4-$1000000)).w,d1
                add.w   ((word_FFB3F2-$1000000)).w,d4
                lea     ((word_FFB3FA-$1000000)).w,a1
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
                move.b  ((byte_FFB57F-$1000000)).w,d0
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
                lea     ((word_FFB3F6-$1000000)).w,a1
                bsr.s   sub_1F0B0
                lea     ((SPRITE_18-$1000000)).w,a0
                move.w  d1,(a0)+
                move.w  d2,(a0)+
                move.w  d3,(a0)+
                move.w  d4,(a0)
                move.b  #2,(word_FFAFB2).l
                rts

    ; End of function sub_1EFD8


; =============== S U B R O U T I N E =======================================


sub_1F0B0:
                
                tst.b   d0
                beq.w   loc_1F11E
                subq.b  #1,d0
                bne.s   loc_1F0D0
                btst    #4,d7
                beq.w   loc_1F11E
                move.w  #$500,d2
                move.w  #$C7BB,d3
                subq.w  #8,d1
                subq.w  #8,d4
                rts
loc_1F0D0:
                
                subq.b  #1,d0
                bne.s   loc_1F0F2
                move.w  #$900,d2
                move.w  #$C7BF,d3
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
                lsr.w   #4,d7
                andi.w  #3,d7
                beq.s   loc_1F11E
                lsl.w   #3,d7
                lea     loc_1F120(pc,d7.w),a1
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
                move.w  word_1F140(pc,d7.w),d0
                add.w   d0,(a1)
loc_1F11E:
                
                moveq   #1,d1
loc_1F120:
                
                move.w  d1,d2
                move.w  d1,d3
                move.w  d1,d4
                rts

    ; End of function sub_1F0B0

                dc.b $FF
                dc.b $F8
                dc.b 0
                dc.b 0
                dc.b $C7
                dc.b $B0
                dc.b $FF
                dc.b $FC
                dc.b $FF
                dc.b $F0
                dc.b 5
                dc.b 0
                dc.b $C7
                dc.b $B1
                dc.b $FF
                dc.b $FC
                dc.b $FF
                dc.b $E8
                dc.b 6
                dc.b 0
                dc.b $C7
                dc.b $B5
                dc.b $FF
                dc.b $FC
word_1F140:     dc.w 1
                dc.w $FFFF
                dc.w 1
                dc.w $FFFF

; =============== S U B R O U T I N E =======================================


sub_1F148:
                
                cmpi.w  #$FFFF,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   return_1F174
                move.w  ((word_FFB3F6-$1000000)).w,d6
                beq.s   loc_1F162
                add.w   ((word_FFB3EC-$1000000)).w,d6
                bsr.w   sub_1F214
                clr.w   ((word_FFB3F6-$1000000)).w
loc_1F162:
                
                move.w  ((word_FFB3F8-$1000000)).w,d6
                beq.s   return_1F174
                add.w   ((word_FFB3F0-$1000000)).w,d6
                bsr.w   sub_1F254
                clr.w   ((word_FFB3F8-$1000000)).w
return_1F174:
                
                rts

    ; End of function sub_1F148


; =============== S U B R O U T I N E =======================================


sub_1F176:
                
                cmpi.w  #$FFFF,((BATTLESCENE_ALLY-$1000000)).w
                beq.w   return_1F1CA
                move.w  ((word_FFB3FA-$1000000)).w,d0
                move.w  d0,d2
                move.w  ((word_FFB3FC-$1000000)).w,d1
                or.w    d1,d2
                beq.w   return_1F1CA
                add.w   d0,((word_FFB3F2-$1000000)).w
                add.w   d1,((word_FFB3F4-$1000000)).w
                lea     ((SPRITE_01-$1000000)).w,a0
                moveq   #8,d2
loc_1F19E:
                
                add.w   d1,(a0)
                addq.w  #6,a0
                add.w   d0,(a0)+
                dbf     d2,loc_1F19E
                cmpi.w  #$FFFF,((ALLY_WEAPON_SPRITE-$1000000)).w
                beq.s   loc_1F1C2
                lea     ((SPRITE_10-$1000000)).w,a0
                moveq   #3,d2
loc_1F1B6:
                
                add.w   d0,VDPSPRITE_OFFSET_X(a0)
                add.w   d1,(a0)
                addq.w  #8,a0
                dbf     d2,loc_1F1B6
loc_1F1C2:
                
                clr.w   ((word_FFB3FA-$1000000)).w
                clr.w   ((word_FFB3FC-$1000000)).w
return_1F1CA:
                
                rts

    ; End of function sub_1F176


; =============== S U B R O U T I N E =======================================


sub_1F1CC:
                
                movem.l d0/a0,-(sp)
                move.w  d6,((word_FFB3EA-$1000000)).w
                lea     ((byte_FFD1C0-$1000000)).w,a0
                moveq   #$67,d0 
loc_1F1DA:
                
                move.w  d6,(a0)
                addq.w  #4,a0
                dbf     d0,loc_1F1DA
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
                moveq   #$13,d0
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


sub_1F214:
                
                movem.l d0/a0,-(sp)
                move.w  d6,((word_FFB3EC-$1000000)).w
                cmpi.w  #$35,((ENEMY_BATTLE_SPRITE-$1000000)).w 
                bne.s   loc_1F236
                btst    #2,((byte_FFB56F-$1000000)).w
                bne.s   loc_1F232
                subi.w  #$10,d6
                bra.s   loc_1F236
loc_1F232:
                
                addi.w  #$10,d6
loc_1F236:
                
                lea     ((HORIZONTAL_SCROLL_DATA+2-$1000000)).w,a0
                move.w  #$FF,d0
loc_1F23E:
                
                move.w  d6,(a0)
                addq.w  #4,a0
                dbf     d0,loc_1F23E
                jsr     (UpdateVdpHScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0/a0
                rts

    ; End of function sub_1F214


; =============== S U B R O U T I N E =======================================


sub_1F254:
                
                movem.l d0/a0,-(sp)
                move.w  d6,((word_FFB3F0-$1000000)).w
                cmpi.w  #$35,((ENEMY_BATTLE_SPRITE-$1000000)).w 
                bne.s   loc_1F266
                subq.w  #8,d6
loc_1F266:
                
                lea     ((VERTICAL_SCROLL_DATA+2-$1000000)).w,a0
                moveq   #$13,d0
loc_1F26C:
                
                move.w  d6,(a0)
                addq.w  #4,a0
                dbf     d0,loc_1F26C
                jsr     (UpdateVdpVScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0/a0
                rts

    ; End of function sub_1F254


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
                lea     ((dword_FFB3C0-$1000000)).w,a5
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
                lea     ((dword_FFB3C6-$1000000)).w,a5
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
                clr.l   ((dword_FFB3C0-$1000000)).w
                clr.l   ((dword_FFB3C6-$1000000)).w
                clr.w   d6
                bsr.w   sub_1F1CC
                bsr.w   sub_1F1F0
                btst    #2,((byte_FFB56F-$1000000)).w
                beq.s   loc_1F32A
                moveq   #$60,d6 
                bra.s   loc_1F32C
loc_1F32A:
                
                clr.w   d6
loc_1F32C:
                
                bsr.w   sub_1F214
                clr.w   d6
                bsr.w   sub_1F254
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
                move.b  byte_1F3CC(pc,d0.w),d0
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

; END OF FUNCTION CHUNK FOR sub_1F282

byte_1F3CC:     dc.b $4E
                dc.b $75
                dc.b 4
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
                asr.w   #8,d3
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
                asr.w   #8,d3
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
                lea     byte_1F530(pc), a0
                move.w  d0,d2
                andi.w  #$F,d2
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
                
                lea     byte_1F528(pc), a0
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

byte_1F528:     dc.b 0
                dc.b 2
                dc.b $FF
                dc.b 0
                dc.b 0
                dc.b $FE
                dc.b 1
                dc.b 0
byte_1F530:     dc.b $FF
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
                movea.l ((dword_FFB3C6-$1000000)).w,a0
                clr.w   d0
                move.b  1(a0),d0
                lsr.w   #1,d0
                move.w  d0,((word_FFB3CA-$1000000)).w
                movem.l (sp)+,d0/a0
return_1F574:
                
                rts

    ; End of function sub_1F540

spr_1F576:      dc.w $C0                ; unknown sprite definitions
                dc.b $F
                dc.b 0
word_1F57A:     dc.w $8100              ; VDP tile
                dc.w $108
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $8110
                dc.w $108
                dc.w $100
                dc.b $F
                dc.b 0
                dc.w $8120
                dc.w $108
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $8130
                dc.w $128
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $8140
                dc.w $128
                dc.w $100
                dc.b $F
                dc.b 0
                dc.w $8150
                dc.w $128
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $8160
                dc.w $148
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $8170
                dc.w $148
                dc.w $100
                dc.b $F
                dc.b 0
                dc.w $8180
                dc.w $148
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $8900
                dc.w $148
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $8910
                dc.w $148
                dc.w $100
                dc.b $F
                dc.b 0
                dc.w $8920
                dc.w $148
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $8930
                dc.w $128
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $8940
                dc.w $128
                dc.w $100
                dc.b $F
                dc.b 0
                dc.w $8950
                dc.w $128
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $8960
                dc.w $108
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $8970
                dc.w $108
                dc.w $100
                dc.b $F
                dc.b 0
                dc.w $8980
                dc.w $108
spr_1F606:      dc.w $C0                ; unknown sprite definitions
                dc.b $F
                dc.b 0
                dc.w $86C0
                dc.w $108
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $86D0
                dc.w $108
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $86E0
                dc.w $128
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $86F0
                dc.w $128
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $8EC0
                dc.w $128
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $8ED0
                dc.w $128
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $8EE0
                dc.w $108
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $8EF0
                dc.w $108
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $96C0
                dc.w $108
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $96D0
                dc.w $108
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $96E0
                dc.w $128
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $96F0
                dc.w $128
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $9EC0
                dc.w $128
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $9ED0
                dc.w $128
                dc.w $E0
                dc.b $F
                dc.b 0
                dc.w $9EE0
                dc.w $108
                dc.w $C0
                dc.b $F
                dc.b 0
                dc.w $9EF0
                dc.w $108
spr_1F686:      dc.w $10C               ; unknown sprite definitions
                dc.b $F
                dc.b 0
                dc.w $4780
                dc.w $108
                dc.w $10C
                dc.b $F
                dc.b 0
                dc.w $4790
                dc.w $128
                dc.w $10C
                dc.b $F
                dc.b 0
                dc.w $47A0
                dc.w $148
                dc.w $10C
                dc.b $F
                dc.b 0
                dc.w $4F80
                dc.w $148
                dc.w $10C
                dc.b $F
                dc.b 0
                dc.w $4F90
                dc.w $128
                dc.w $10C
                dc.b $F
                dc.b 0
                dc.w $4FA0
                dc.w $108
word_1F6B6:     dc.w 4
                dc.b 8
                dc.b $C
                dc.w $3034
                dc.w $383C
                dc.w $6064
                dc.b $68
                dc.b $6C
                dc.w $9094
                dc.w $989C
                dc.w $105
                dc.b 9
                dc.b $D
                dc.w $3135
                dc.w $393D
                dc.w $6165
                dc.b $69
                dc.b $6D
                dc.w $9195
                dc.w $999D
                dc.w $206
                dc.b $A
                dc.b $E
                dc.w $3236
                dc.w $3A3E
                dc.w $6266
                dc.b $6A
                dc.b $6E
                dc.w $9296
                dc.w $9A9E
                dc.w $307
                dc.b $B
                dc.b $F
                dc.w $3337
                dc.w $3B3F
                dc.w $6367
                dc.b $6B
                dc.b $6F
                dc.w $9397
                dc.w $9B9F
                dc.w $1014
                dc.b $18
                dc.b $1C
                dc.w $4044
                dc.w $484C
                dc.w $7074
                dc.b $78
                dc.b $7C
                dc.w $A0A4
                dc.w $A8AC
                dc.w $1115
                dc.b $19
                dc.b $1D
                dc.w $4145
                dc.w $494D
                dc.w $7175
                dc.b $79
                dc.b $7D
                dc.w $A1A5
                dc.w $A9AD
                dc.w $1216
                dc.b $1A
                dc.b $1E
                dc.w $4246
                dc.w $4A4E
                dc.w $7276
                dc.b $7A
                dc.b $7E
                dc.w $A2A6
                dc.w $AAAE
                dc.w $1317
                dc.b $1B
                dc.b $1F
                dc.w $4347
                dc.w $4B4F
                dc.w $7377
                dc.b $7B
                dc.b $7F
                dc.w $A3A7
                dc.w $ABAF
                dc.w $2024
                dc.b $28
                dc.b $2C
                dc.w $5054
                dc.w $585C
                dc.w $8084
                dc.b $88
                dc.b $8C
                dc.w $B0B4
                dc.w $B8BC
                dc.w $2125
                dc.b $29
                dc.b $2D
                dc.w $5155
                dc.w $595D
                dc.w $8185
                dc.b $89
                dc.b $8D
                dc.w $B1B5
                dc.w $B9BD
                dc.w $2226
                dc.b $2A
                dc.b $2E
                dc.w $5256
                dc.w $5A5E
                dc.w $8286
                dc.b $8A
                dc.b $8E
                dc.w $B2B6
                dc.w $BABE
                dc.w $2327
                dc.b $2B
                dc.b $2F
                dc.w $5357
                dc.w $5B5F
                dc.w $8387
                dc.b $8B
                dc.b $8F
                dc.w $B3B7
                dc.w $BBBF
word_1F776:     dc.w $8100
                dc.b $81
                dc.b $10
                dc.w $8120
                dc.w $8130
                dc.w $8140
                dc.b $81
                dc.b $50
                dc.w $8160
                dc.w $8170
                dc.w $8180
                dc.b $81
                dc.b $90
                dc.w $81A0
                dc.w $81B0
                dc.w $81C0
                dc.b $81
                dc.b $D0
                dc.w $81E0
                dc.w $81F0
                dc.w $8200
                dc.b $82
                dc.b $10
                dc.w $8520
                dc.w $8530
                dc.w $8540
                dc.b $85
                dc.b $50
                dc.w $8560
                dc.w $8570
                dc.w $8580
                dc.b $85
                dc.b $90
                dc.w $85A0
                dc.w $85B0
                dc.w $85C0
                dc.b $85
                dc.b $D0
                dc.w $85E0
                dc.w $85F0
                dc.w $86C0
                dc.b $86
                dc.b $D0
                dc.w $86E0
                dc.w $86F0
word_1F7BE:     dc.w $8100
                dc.b $81
                dc.b $10
                dc.w $8190
                dc.w $81A0
                dc.w $8120
                dc.b $81
                dc.b $30
                dc.w $81B0
                dc.w $81C0
                dc.w $8140
                dc.b $81
                dc.b $50
                dc.w $81D0
                dc.w $81E0
                dc.w $8160
                dc.b $81
                dc.b $70
                dc.w $81F0
                dc.w $8200
                dc.w 0
                dc.b 0
                dc.b 0
                dc.w $8520
                dc.w $8530
                dc.w $85B0
                dc.b $85
                dc.b $C0
                dc.w $8540
                dc.w $8550
                dc.w $85D0
                dc.b $85
                dc.b $E0
                dc.w $8560
                dc.w $8570
                dc.w $85F0
                dc.b $86
                dc.b $C0
                dc.w $8580
                dc.w $8590
                dc.w $86D0
                dc.b $86
                dc.b $E0
                dc.w 0
                dc.w 0
