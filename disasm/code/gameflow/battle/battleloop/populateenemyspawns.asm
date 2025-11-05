
; ASM FILE code\gameflow\battle\battleloop\populateenemyspawns.asm :
; 0x1ACF30..0x1AD090 : Enemy respawn functions

; =============== S U B R O U T I N E =======================================


PopulateTargetsListWithSpawningEnemies:
                
                movem.l d0-a6,-(sp)
                move.w  #COMBATANT_ENEMIES_NUMBER,d7
                move.w  #COMBATANT_ENEMIES_START,d4
                move.w  d4,d0
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d5
@Main_Loop:
                
                jsr     j_GetActivationBitfield
                andi.w  #AIBITFIELD_INITIALIZATION_MASK,d1
                tst.w   d1
                bne.s   @CheckSecondaryTriggerRegion          
                bra.w   @Next
@CheckSecondaryTriggerRegion:
                
                cmpi.w  #AIBITFIELD_HIDDEN,d1   ; $200 - region-triggered spawn - check if triggered and if not spawned yet
                bne.w   @loc_5          
                bsr.w   UpdateEnemyActivationIfDead
                tst.w   d0
                beq.s   @NoUpdate
                bra.w   @Next
@NoUpdate:
                
                move.w  d4,d0
                jsr     j_GetMaxHp
                tst.w   d1
                beq.s   @Update
                bra.w   @Next
@Update:
                
                move.w  d4,d0
                jsr     j_GetActivationBitfield
                bsr.w   ResetSpawningEnemyStats
                bcs.w   @Next
                move.b  d4,(a0,d5.w)
                addi.w  #1,d5
@loc_5:
                
                cmpi.w  #AIBITFIELD_RESPAWN,d1  ; $100 - respawn - check if dead
                bne.w   @loc_7          
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.s   @loc_6
                bra.w   @Next
@loc_6:
                
                move.w  d4,d0
                jsr     j_GetActivationBitfield
                bsr.w   ResetSpawningEnemyStats
                bcs.w   @Next
                move.b  d4,(a0,d5.w)
                addi.w  #1,d5
@loc_7:
                
                cmpi.w  #AIBITFIELD_RESPAWN|AIBITFIELD_HIDDEN,d1    ; $300 - region-triggered respawn - check if dead and triggered
                bne.s   @Next
                bsr.w   UpdateEnemyActivationIfDead
                tst.w   d0
                beq.s   @loc_8
                bra.w   @Next
@loc_8:
                
                move.w  d4,d0
                jsr     j_GetActivationBitfield
                bsr.w   ResetSpawningEnemyStats
                bcs.w   @Next
                move.b  d4,(a0,d5.w)
                addi.w  #1,d5
@Next:
                
                addi.w  #1,d4
                move.w  d4,d0
                subq.w  #1,d7
                bne.w   @Main_Loop
                
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  d5,(a0)
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulateTargetsListWithSpawningEnemies


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
;     d4.w = copy of combatant index
; 
; Out: d0.w = 0 if activated and dead, -1 if not


UpdateEnemyActivationIfDead:
                
                movem.l d1-a6,-(sp)
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.s   @CheckPrimaryTriggerRegion
                bra.w   @NoUpdate
@CheckPrimaryTriggerRegion:
                
                jsr     j_GetTriggerRegions
                cmpi.b  #AI_TRIGGER_REGION_NONE,d1
                beq.s   @CheckSecondaryTriggerRegion
                
                move.w  d1,d6
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                beq.s   @CheckSecondaryTriggerRegion
                
                move.w  d4,d0
                jsr     j_GetActivationBitfield
                bset    #AIBITFIELD_BIT_PRIMARY_ACTIVE,d1
                jsr     j_SetActivationBitfield
                bra.w   @Update
@CheckSecondaryTriggerRegion:
                
                move.w  d4,d0
                jsr     j_GetTriggerRegions
                cmpi.b  #AI_TRIGGER_REGION_NONE,d2
                beq.w   @NoUpdate
                
                move.w  d2,d6
                move.w  d2,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                beq.s   @NoUpdate
                
                move.w  d4,d0
                jsr     j_GetActivationBitfield
                bset    #AIBITFIELD_BIT_PRIMARY_ACTIVE,d1
                bset    #AIBITFIELD_BIT_SECONDARY_ACTIVE,d1
                jsr     j_SetActivationBitfield
                bra.w   @Update
@NoUpdate:
                
                move.w  #-1,d0
                movem.l (sp)+,d1-a6
                rts
@Update:
                
                clr.w   d0
                movem.l (sp)+,d1-a6
                rts

    ; End of function UpdateEnemyActivationIfDead

