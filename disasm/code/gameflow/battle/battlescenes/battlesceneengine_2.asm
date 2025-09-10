
; ASM FILE code\gameflow\battle\battlescenes\battlesceneengine_2.asm :
; 0x19E6E..0x1A028 : Battlescene engine

; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
; Out: d1.w = battlescene ground index (-1 if skipped)


GetBattlesceneGround:
                
            if (STANDARD_BUILD=1)
                tst.b   d0
                bmi.s   @Skip           ; skip if enemy
                
                jsr     IsAirborneMoveType
                bcc.s   @Skip           ; skip if ally is flying or hovering
                
                bra.w   GetBattlesceneBackground
@Skip:
                
                moveq   #-1,d1
                rts
            else
                cmpi.w  #COMBATANT_ENEMIES_START,d0
                bcc.w   @Skip           ; skip if no ally present
                
                jsr     j_GetMoveType
                cmpi.w  #MOVETYPE_LOWER_FLYING,d1
                beq.w   @Skip           ; skip if ally is flying or hovering
                cmpi.w  #MOVETYPE_LOWER_HOVERING,d1
                beq.w   @Skip
                
                bra.w   GetBattlesceneBackground
@Skip:
                
                move.w  #-1,d1
                rts
            endif

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
                dc.w spellanimationSetup_CannonFire-rjt_SpellanimationSetups
                dc.w spellanimationSetup_ShotFire-rjt_SpellanimationSetups
                dc.w spellanimationSetup_GunnerBlast-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Dao-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Apollo-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Neptun-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Atlas-rjt_SpellanimationSetups
                dc.w spellanimationSetup_PrismLaser-rjt_SpellanimationSetups
                dc.w spellanimationSetup_BubbleBreath-rjt_SpellanimationSetups
                dc.w spellanimationSetup_SnowBreath-rjt_SpellanimationSetups
                dc.w spellanimationSetup_CutOffAndDodge-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Buff2-rjt_SpellanimationSetups
                dc.w spellanimationSetup_AttackSpell-rjt_SpellanimationSetups ; SFCD's ATTACK spell (unused)
                dc.w spellanimationSetup_Debuff2-rjt_SpellanimationSetups
                dc.w spellanimationSetup_Debuff3-rjt_SpellanimationSetups
                dc.w spellanimationSetup_PhoenixAttack-rjt_SpellanimationSetups
                dc.w spellanimationSetup_BurstRockExplosion-rjt_SpellanimationSetups
                dc.w spellanimationSetup_OddEyeBeam-rjt_SpellanimationSetups
return_19F5C:
                
                rts

    ; End of function SetupSpellanimation


; =============== S U B R O U T I N E =======================================


ConstructSimpleGraphic:
                
                movem.l d1/a1,-(sp)
                lea     (byte_FFAFA0).l,a1
                move.b  VDPSPELL_OFFSET_PROPERTIES(a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                move.b  d1,(a1,d0.w)
                lea     ((SPRITE_TABLE-$1000000)).w,a1
                move.w  d0,d1
                lsl.w   #VDP_SPRITE_SHIFT_COUNT,d1
                adda.w  d1,a1
                move.w  VDPSPELL_OFFSET_Y(a0),(a1)+
                clr.w   d1
                move.b  VDPSPELL_OFFSET_SIZE(a0),d1
                lsl.w   #BYTE_SHIFT_COUNT,d1
                move.w  d1,(a1)+
                move.b  VDPSPELL_OFFSET_PROPERTIES(a0),d1
                andi.w  #3,d1
                ror.w   #5,d1
                or.w    VDPSPELL_OFFSET_GRAPHIC(a0),d1
                ori.w   #VDPTILE_PALETTE3|VDPTILE_PRIORITY,d1
                move.w  d1,(a1)+
                move.w  (a0),(a1)
                movem.l (sp)+,d1/a1
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a0
                addq.w  #1,d0
                rts

    ; End of function ConstructSimpleGraphic


; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to spellanimation data


ConstructComplexGraphic:
                
                movem.l d0-d3/a1-a2,-(sp)
                subq.w  #1,d1
                addi.w  #128,d2 
                addi.w  #128,d3 
                lea     (byte_FFAFA0).l,a2
                adda.w  d0,a2
                lsl.w   #3,d0
                lea     ((SPRITE_TABLE-$1000000)).w,a1
                adda.w  d0,a1
loc_19FC8:
                
                move.w  VDPSPELL_OFFSET_Y(a0),d0
                add.w   d3,d0
                move.w  d0,(a1)+
                clr.w   d0
                move.b  VDPSPELL_OFFSET_SIZE(a0),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,(a1)+
                move.b  VDPSPELL_OFFSET_PROPERTIES(a0),d0
                andi.w  #3,d0
                ror.w   #5,d0
                or.w    VDPSPELL_OFFSET_GRAPHIC(a0),d0
                ori.w   #VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
                move.w  d0,(a1)+
                move.w  (a0),d0
                add.w   d2,d0
                move.w  d0,(a1)+
                move.b  VDPSPELL_OFFSET_PROPERTIES(a0),d0
                lsr.b   #NIBBLE_SHIFT_COUNT,d0
                move.b  d0,(a2)+
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a0
                dbf     d1,loc_19FC8
                
                movem.l (sp)+,d0-d3/a1-a2
                add.w   d1,d0
                rts

    ; End of function ConstructComplexGraphic


; =============== S U B R O U T I N E =======================================


ClearSpellGraphics:
                
                moveq   #38,d0
                moveq   #25,d7
loc_1A00E:
                
                lea     table_1A020(pc), a0
                nop
                bsr.w   ConstructSimpleGraphic
                dbf     d7,loc_1A00E
                
                jmp     (sub_1942).w    

    ; End of function ClearSpellGraphics

table_1A020:    vdpSpell 1, 1, 0, V1|H1|VALUE0  ; null graphic
