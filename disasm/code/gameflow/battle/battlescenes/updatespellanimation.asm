
; ASM FILE code\gameflow\battle\battlescenes\updatespellanimation.asm :
; 0x1B7B0..0x1B93C : Battlescene engine

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
                bra.w   ReinitializeSceneAfterSpell
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
                dc.w spellanimationUpdate_CannonFire-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_ShotFire-rjt_SpellanimationUpdates
                dc.w spellanimationUpdate_GunnerBlast-rjt_SpellanimationUpdates
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


ReinitializeSceneAfterSpell:
                
                clr.w   ((PALETTE_1_CURRENT-$1000000)).w
                clr.w   ((PALETTE_3_CURRENT_02-$1000000)).w
                jsr     (ApplyVIntCramDma).w
                jsr     (EnableDmaQueueProcessing).w
                bsr.w   ClearSpellGraphics
                bsr.w   ClearSpellanimationProperties
                cmpi.b  #SPELLANIMATION_DAO,((CURRENT_SPELLANIMATION-$1000000)).w
                bcs.s   loc_1B858
                cmpi.b  #SPELLANIMATION_ATLAS,((CURRENT_SPELLANIMATION-$1000000)).w
                bhi.s   loc_1B858
                moveq   #16,d0   ; first 16 sprites composing ally battle scene
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

    ; End of function ReinitializeSceneAfterSpell


; =============== S U B R O U T I N E =======================================


sub_1B884:
                
                movem.w d1-d2,-(sp)
                move.w  (a5),d1
@Loop:
                
                cmp.w   (a0)+,d1
                bne.s   @NextEntry
                move.w  (a0)+,VDPSPRITE_OFFSET_SIZE(a4)
                move.w  VDPSPRITE_OFFSET_TILE(a4),d2
                andi.w  #VDPTILE_PROPERTIES_MASK,d2
                add.w   (a0),d2
                addi.w  #VDPTILE_SPELLTILE1,d2
                move.w  d2,VDPSPRITE_OFFSET_TILE(a4)
                bra.s   @Done
@NextEntry:
                
                addq.w  #4,a0
                dbf     d0,@Loop
@Done:
                
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
                clr.w   d1        ; Black
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
                bsr.w   MoveBackgroundVertically
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

