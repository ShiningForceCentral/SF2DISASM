
; ASM FILE code\gameflow\battle\battlefield\getreachabletargets.asm :
; 0xD1CC..0xD296 : Reachable targets getter functions

; =============== S U B R O U T I N E =======================================


GetTargetsReachableByAttack:
                
                movem.l d0-d5/d7-a3,-(sp)
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a1
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a2
                lea     ((ATTACK_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a3
                bsr.w   GetAttackRange  
                bra.w   PopulateReachableTargetsList

    ; End of function GetTargetsReachableByAttack


; =============== S U B R O U T I N E =======================================


GetTargetsReachableByItem:
                
                movem.l d0-d5/d7-a3,-(sp)
                lea     ((TARGETS_REACHABLE_BY_ITEM_NUMBER-$1000000)).w,a1
                lea     ((TARGETS_REACHABLE_BY_ITEM_LIST-$1000000)).w,a2
                lea     ((ITEM_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a3
                jsr     GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     GetSpellDefinitionAddress
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d4
                bra.w   PopulateReachableTargetsList

    ; End of function GetTargetsReachableByItem


; =============== S U B R O U T I N E =======================================


GetTargetsReachableBySpell:
                
                movem.l d0-d5/d7-a3,-(sp)
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a1
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a2
                lea     ((SPELL_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a3
                jsr     GetSpellDefinitionAddress
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d4
PopulateReachableTargetsList:
                
                bsr.w   IsCombatantConfused
                tst.b   d1
                beq.s   @IsAllyActor
                
                eori.b  #COMBATANT_MASK_ENEMY_BIT,d0 ; flip enemy bit, to get the opposite type when muddled
@IsAllyActor:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   @Ally
                
                moveq   #COMBATANT_ALLIES_START,d0
                move.w  #COMBATANT_ALLIES_COUNTER,d7
                bra.s   @Continue
@Ally:
                
                move.b  #COMBATANT_ENEMIES_START,d0
                move.w  #COMBATANT_ENEMIES_COUNTER,d7
@Continue:
                
                move.w  #0,(a1)
@Loop:
                
                jsr     GetCurrentHp
                tst.w   d1
                bne.s   @ValidateTargetReachability
                bra.w   @Next           ; skip if target is dead
@ValidateTargetReachability:
                
                jsr     GetCombatantY
                move.b  d1,d2
                jsr     GetCombatantX
                bsr.w   DetermineAttackPosition
                cmpi.b  #-1,d1
                beq.w   @Next           ; skip if target is unreachable
                
                addq.w  #1,(a1)
                move.b  d0,(a2)+
                move.b  d0,d5
                bsr.w   GetMovecostToDestination
                move.b  d0,(a3)+
                move.b  d5,d0
@Next:
                
                addq.b  #1,d0
                dbf     d7,@Loop
                
                movem.l (sp)+,d0-d5/d7-a3
                rts

    ; End of function GetTargetsReachableBySpell

