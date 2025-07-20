
; ASM FILE code\gameflow\battle\battleloop\processkilledcombatants.asm :
; 0x24518..0x24642 : Battle loop functions

; =============== S U B R O U T I N E =======================================


ProcessKilledCombatants:
                
                tst.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                beq.w   @NoneKilled
                movem.l d0-a2/a6,-(sp)
                moveq   #ANIM_SPRITE_DEATH_SPINS_NUMBER,d6
@DeathSpin_Loop:
                
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0 ; loop point for sprite death spin animation
                lea     ((ENTITY_ANIMATION_COUNTER-$1000000)).w,a1
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
@GetDeadCombatant_Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                jsr     GetEntityIndexForCombatant
                move.w  d6,d1
                andi.w  #DIRECTION_MASK,d1
                clr.w   d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).l
                cmpi.b  #GFX_MAX_SPRITES_TO_LOAD,((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                blt.s   @Continue
                jsr     (WaitForVInt).w
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
@Continue:
                
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                move.b  #-1,(a1,d0.w)
                dbf     d7,@GetDeadCombatant_Loop
                
                moveq   #ANIM_SPRITE_DEATH_SPIN_DELAY,d0
                jsr     (Sleep).w       
                dbf     d6,@DeathSpin_Loop
                
                sndCom  SFX_BATTLEFIELD_DEATH
                moveq   #2,d6
@DeathSound_Loop:
                
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
@UpdateDeadCombatant_Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                jsr     GetEntityIndexForCombatant
                cmpi.b  #ENTITY_SPECIAL_SPRITE,d0
                bne.s   @NormalEntity
                move.l  #$60006000,((ENTITY_SPECIAL_SPRITE_DATA-$1000000)).w
                move.l  #$60006000,((ENTITY_SPECIAL_SPRITE_DESTINATION-$1000000)).w
@NormalEntity:
                
                move.w  #DOWN,d1
                sub.w   d6,d1
                clr.w   d2
                move.w  #MAPSPRITE_EFFECT1,d3
                jsr     (UpdateEntityProperties).l
                cmpi.b  #GFX_MAX_SPRITES_TO_LOAD,((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                blt.s   @NextDeadEntity
                jsr     (WaitForVInt).w
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
@NextDeadEntity:
                
                dbf     d7,@UpdateDeadCombatant_Loop
                
                moveq   #8,d0
                jsr     (Sleep).w       
                dbf     d6,@DeathSound_Loop
                
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
@CheckKillDefeat_Loop:
                
                moveq   #1,d1
                clr.w   d0
                move.b  (a0)+,d0
                blt.s   @IncreaseKills
                jsr     j_IncreaseDefeats
                bra.s   @ClearDeadCombatant
@IncreaseKills:
                
                movem.l d0,-(sp)
                clr.w   d0
                move.b  ((BATTLESCENE_FIRST_ALLY-$1000000)).w,d0
                jsr     j_IncreaseKills
                movem.l (sp)+,d0
@ClearDeadCombatant:
                
                moveq   #-1,d1
                jsr     j_SetCombatantX
                jsr     j_SetCombatantY
                clr.w   d1
                jsr     j_SetStatusEffects
                jsr     j_UpdateCombatantStats
                jsr     GetEntityIndexForCombatant
                move.w  #$7000,d1
                move.w  #$7000,d2
                jsr     SetEntityPosition
                dbf     d7,@CheckKillDefeat_Loop
                
                moveq   #10,d0
                jsr     (Sleep).w       
                movem.l (sp)+,d0-a2/a6
@NoneKilled:
                
                rts

    ; End of function ProcessKilledCombatants

