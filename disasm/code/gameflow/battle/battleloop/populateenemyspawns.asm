
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
                bne.s   @loc_2          
                bra.w   @Next
@loc_2:
                
                cmpi.w  #AIBITFIELD_HIDDEN|AIBITFIELD_PRIORITYMOD_0,d1 ; $200 - region-triggered spawn - check if triggered and if not spawned yet
                bne.w   @loc_5          
                bsr.w   UpdateEnemyActivationIfDead
                tst.w   d0
                beq.s   @loc_3
                bra.w   @Next
@loc_3:
                
                move.w  d4,d0
                jsr     j_GetMaxHp
                tst.w   d1
                beq.s   @loc_4
                bra.w   @Next
@loc_4:
                
                move.w  d4,d0
                jsr     j_GetActivationBitfield
                bsr.w   ResetSpawningEnemyStats
                bcs.w   @Next
                move.b  d4,(a0,d5.w)
                addi.w  #1,d5
@loc_5:
                
                cmpi.w  #AIBITFIELD_RESPAWN|AIBITFIELD_PRIORITYMOD_0,d1 ; $100 - respawn - check if dead
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
                
                cmpi.w  #AIBITFIELD_RESPAWN|AIBITFIELD_HIDDEN|AIBITFIELD_PRIORITYMOD_0,d1 ; $300 - region-triggered respawn - check if dead and triggered
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

; In: d0.w = character index
;     d4.w = copy character index
; 
; Out: d0.w = 0 if activated and dead, -1 if not


UpdateEnemyActivationIfDead:
                
                movem.l d1-a6,-(sp)
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.s   @loc_1
                bra.w   @loc_3
@loc_1:
                
                jsr     j_GetAiRegion
                cmpi.b  #15,d1
                beq.s   @loc_2
                move.w  d1,d6
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                beq.s   @loc_2
                move.w  d4,d0
                jsr     j_GetActivationBitfield
                bset    #0,d1
                jsr     j_SetActivationBitfield
                bra.w   @loc_4
@loc_2:
                
                move.w  d4,d0
                jsr     j_GetAiRegion
                cmpi.b  #15,d2
                beq.w   @loc_3
                move.w  d2,d6
                move.w  d2,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                beq.s   @loc_3
                move.w  d4,d0
                jsr     j_GetActivationBitfield
                bset    #0,d1
                bset    #1,d1
                jsr     j_SetActivationBitfield
                bra.w   @loc_4
@loc_3:
                
                move.w  #-1,d0
                movem.l (sp)+,d1-a6
                rts
@loc_4:
                
                clr.w   d0
                movem.l (sp)+,d1-a6
                rts

    ; End of function UpdateEnemyActivationIfDead

