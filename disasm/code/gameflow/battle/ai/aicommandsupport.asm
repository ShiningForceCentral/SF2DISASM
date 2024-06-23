
; ASM FILE code\gameflow\battle\ai\aicommandsupport.asm :
; 0xEBA4..0xEDD6 : AI command : Support

; =============== S U B R O U T I N E =======================================

; Support spells AI (Muddle 2, Dispel 1)
; 
; In: d0.w = caster index
; Out: d1.b = -1 if command failed to execute


ExecuteAiCommand_Support:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d0,d7           ; save caster index
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                
                ; If ally, do nothing
                move.w  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
@Enemy:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   @CheckSupportSpell ; Does caster know any support spell?
                
                ; If muddled, do nothing
                move.w  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
@CheckSupportSpell:
                
                move.w  d7,d0           ; restore caster index
                clr.w   d3
                bsr.w   GetNextSupportSpell
                cmpi.w  #SPELL_NOTHING,d1
            if (STANDARD_BUILD&SUPPORT_AI_ENHANCEMENTS=1)
                bne.s   @CheckMpCost
            else
                bne.s   @CheckMuddle
            endif
                
                ; If no known status spell, do nothing
                move.w  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
            if (STANDARD_BUILD&SUPPORT_AI_ENHANCEMENTS=1)
            else
@CheckMuddle:
                
                cmpi.w  #SPELL_MUDDLE|SPELL_LV2,d1 ; HARDCODED spell entries
                bne.s   @CheckDispel
                bra.w   @CheckMpCost    
@CheckDispel:
                
                cmpi.w  #SPELL_DISPEL,d1
                bne.s   @DoNothing
                bra.w   @CheckMpCost    
@DoNothing:
                
                move.w  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
            endif
@CheckMpCost:
                
                move.w  d1,d6           ; d6 = copy of debuff spell entry
                bsr.w   FindSpellDefAddress
                clr.w   d2
                move.b  SPELLDEF_OFFSET_MP_COST(a0),d2
                move.b  SPELLDEF_OFFSET_PROPS(a0),d5
                clr.w   d0
                move.b  d7,d0
                bsr.w   GetCurrentMp
                cmp.b   d2,d1
                bge.s   @CheckTargetingGroup
                
                ; If not enough MP, do nothing
            if (STANDARD_BUILD&SUPPORT_AI_ENHANCEMENTS=1)
                bra.w   @DoNothing
            else
                move.w  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
            endif
@CheckTargetingGroup:
                
            if (STANDARD_BUILD&SUPPORT_AI_ENHANCEMENTS=1)
                bsr.w   InitializeMovementArrays     
                bsr.w   PopulateMovementArrays
                btst    #SPELLPROPS_BIT_TARGETING,d5
                bne.s   @TargetTeammates
                clr.w   d3
                                         
                bsr.w   UpdateBattleTerrainOccupiedByEnemies
                bsr.w   PopulateTargetsArrayWithAllies
                bra.s   @MakeTargetsList
@TargetTeammates:
                move.w  #$FFFF,d3
                bsr.w   UpdateBattleTerrainOccupiedByAllies
                bsr.w   PopulateTargetsArrayWithEnemies
            else
                clr.w   d0
                btst    #SPELLPROPS_BIT_TARGETING,d5
                move.w  #-1,d3
                bne.s   @TargetTeammates1
                bsr.w   UpdateBattleTerrainOccupiedByEnemies ; made unreachable by the preceding move.w #$FFFF,d3 instruction
                bra.s   @CheckTargetingGroup2
@TargetTeammates1:
                
                bsr.w   UpdateBattleTerrainOccupiedByAllies
@CheckTargetingGroup2:
                
                move.b  d7,d0
                bsr.w   InitializeMovementArrays
                bsr.w   PopulateMovementArrays
                btst    #SPELLPROPS_BIT_TARGETING,d5
                clr.w   d3
                bne.s   @TargetTeammates2
                bsr.w   UpdateBattleTerrainOccupiedByEnemies
                bsr.w   PopulateTargetsArrayWithAllies
                bra.s   @MakeTargetsList
@TargetTeammates2:
                
                bsr.w   UpdateBattleTerrainOccupiedByAllies ; made unreachable by the preceding clr.w d3 instruction
                bsr.w   PopulateTargetsArrayWithEnemies
            endif
@MakeTargetsList:
                
                clr.w   d1
                move.b  d6,d1
            if (STANDARD_BUILD&SUPPORT_AI_ENHANCEMENTS=1)
                move.w    d6,d3
                andi.b    #SPELLENTRY_MASK_INDEX,d3
            endif
                clr.w   d0
                move.b  d7,d0
                
            if (STANDARD_BUILD&SUPPORT_AI_ENHANCEMENTS=1)
                
                ; MUDDLE spell
                cmpi.w  #SPELL_MUDDLE,d3
                bne.s   @CheckSpell_Slow
                bsr.w   MakePrioritiesListForSpell_Muddle2
                bra.w   @CheckReachableTargets
@CheckSpell_Slow:
                
                cmpi.w  #SPELL_SLOW,d3
                bne.s   @CheckSpell_Sleep
                bsr.w   MakePrioritiesListForSpell_Muddle2
                bra.w   @CheckReachableTargets
@CheckSpell_Sleep:
                
                cmpi.w  #SPELL_SLEEP,d3
                bne.s   @CheckSpell_Dispel
                bsr.w   PopulatePrioritiesListForSpell_Dispel
                bra.w   @CheckReachableTargets
@CheckSpell_Dispel:
                
                cmpi.w  #SPELL_DISPEL,d3
                bne.s   @DoNothing
                bsr.w   PopulatePrioritiesListForSpell_Dispel
                bra.w   @CheckReachableTargets
@DoNothing:
            else
                ; ATTACK spell
                cmpi.w  #SPELL_ATTACK,d1
                bne.s   @CheckBoost
                bsr.w   PopulatePrioritiesListForSpell_Attack
                bra.w   @CheckReachableTargets
@CheckBoost:
                
                cmpi.w  #SPELL_BOOST|SPELL_LV2,d1
                bne.s   @CheckMuddle2
                bsr.w   PopulatePrioritiesListForSpell_Boost2
                bra.w   @CheckReachableTargets
@CheckMuddle2:
                
                cmpi.w  #SPELL_MUDDLE|SPELL_LV2,d1
                bne.s   @CheckDispel2
                bsr.w   PopulatePrioritiesListForSpell_Muddle2
                bra.w   @CheckReachableTargets
@CheckDispel2:
                
                cmpi.w  #SPELL_DISPEL,d1
                bne.s   @DoNothing2
                bsr.w   PopulatePrioritiesListForSpell_Dispel
                bra.w   @CheckReachableTargets
            endif
@DoNothing2:
                
                move.w  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
@CheckReachableTargets:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                tst.w   d5
                bne.s   @GetTarget
                
                ; If no reachable target, do nothing
                move.w  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
@GetTarget:
                
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a1
                move.b  #-1,d0
                clr.w   d1
                clr.w   d2
@GetTarget_Loop:
                
                clr.w   d3
                move.b  (a1,d2.w),d3
                cmp.b   d1,d3
                blt.s   @Next
                move.b  (a0,d2.w),d0
                move.b  d3,d1
@Next:
                
                addi.w  #1,d2
                dbf     d5,@GetTarget_Loop
                
                cmpi.b  #-1,d0
                bne.s   @LoadBattleactionData
                
                ; If no reachable target, do nothing
                move.w  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
@LoadBattleactionData:
                
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_CAST_SPELL,(a0)
                move.w  d6,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                move.w  d0,BATTLEACTION_OFFSET_TARGET(a0)
                move.w  d6,d1
                bsr.w   GetSpellRange   
                move.w  BATTLEACTION_OFFSET_TARGET(a0),d0
                bsr.w   PopulateTargetsArrayWithAllCombatants
                jsr     GetCombatantY
                move.w  d1,d2
                jsr     GetCombatantX
                bsr.w   GetClosestAttackPosition
                cmpi.w  #NOTHING_BYTE,d1
                bne.s   @MakeMoveString
                
                ; If no valid attack position, do nothing
                move.w  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
@MakeMoveString:
                
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   BuildAiMoveString
                clr.w   d1
@Done:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function ExecuteAiCommand_Support

