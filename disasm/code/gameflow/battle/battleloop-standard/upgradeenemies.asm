
; ASM FILE code\gameflow\battle\battleloop-standard\upgradeenemies.asm :
;

; =============== S U B R O U T I N E =======================================

; Is current battle upgradable? Return d1.w = -1 if true.


IsBattleUpgradable:
                
                movem.l d0/d2-a6,-(sp)
                clr.w   d1              ; clear d1 for "false"
                loadSavedDataAddress CURRENT_BATTLE, a0
                clr.w   d7
                move.b  (a0),d7         ; d7 contains battle index
                clr.w   d6
                getPointer p_list_RandomBattles, a0 ; point to length of table
                move.b  (a0)+,d6        ; put length of table in d6
                bra.s   @Find
                
@Find_Loop:     move.b  (a0)+,d0        ; put next byte in d0
                cmp.b   d7,d0
                bne.s   @Next           ; while d0 not battle index
                
                moveq   #-1,d1          ; else, battle index is in the list, put -1 in d1.w, for "true"
                bra.s   @Done
@Next:
@Find:          dbf     d6,@Find_Loop

@Done:          movem.l (sp)+,d0/d2-a6
                rts

    ; End of function IsBattleUpgradable


; =============== S U B R O U T I N E =======================================

; Should random battle enemies be upgraded? Return d1.w = -1 if so.


DetermineBattleUpgrade:
                
                movem.l d0/d2-a6,-(sp)
                loadSavedDataAddress CURRENT_BATTLE, a0
                move.b  (a0),d7
                getPointer p_list_RandomBattles, a1 ; point to length of table
                clr.w   d2
                move.b  (a1),d2
                addq.w  #1,a1
                clr.w   d3
                bra.s   @FindBattle
@FindBattle_Loop:
                
                clr.w   d1
                move.b  (a1,d3.w),d1
                cmp.b   d1,d7
                bne.s   @Next
                
                addi.w  #BATTLE_COMPLETED_FLAGS_START,d1
                jsr     CheckFlag
                bne.s   @AllowUpgrade
                
                clr.w   d1
                bra.s   @Done
                
@AllowUpgrade:  moveq   #-1,d1
                bra.s   @Done
                
@Next:          addq.w  #1,d3
@FindBattle:    dbf     d2,@FindBattle_Loop
                
@Done:          movem.l (sp)+,d0/d2-a6
                rts

    ; End of function DetermineBattleUpgrade


; =============== S U B R O U T I N E =======================================

; Upgrade enemy index d1.w -> d1.w


UpgradeRandomBattleEnemies:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d1,d5           ; D5 = original enemy index backup
                bsr.s   IsBattleUpgradable
                tst.w   d1
                beq.w   @DefaultEnemy
                
                bsr.s   DetermineBattleUpgrade
                tst.w   d1
                beq.w   @DefaultEnemy
                
                ; Do upgrade
                clr.w   d4
                clr.l   d1
                
                ; Get pointer to enemy upgrade data based on move type -> A0
                move.b  d5,d1
                mulu.w  #ENEMYDEF_ENTRY_SIZE,d1
                getPointer p_table_EnemyDefinitions, a1
                adda.w  d1,a1
                move.b  ENEMYDEF_OFFSET_MOVETYPE(a1),d2
                lsr.w   #NIBBLE_SHIFT_COUNT,d2 ; shift movetype upper nibble to lower position
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d2
                
                ; Check regular move type
                cmpi.b  #MOVETYPE_REGULAR,d2
                bne.s   @CheckCentaur
                getPointer p_table_MeleeTypeEnemyUpgradeDefinition, a0
                bra.s   @GetLeaderEffectiveLevel
@CheckCentaur:
                
                cmpi.b  #MOVETYPE_CENTAUR,d2
                bne.s   @CheckStealth
                getPointer p_table_MeleeTypeEnemyUpgradeDefinition, a0
                bra.s   @GetLeaderEffectiveLevel
@CheckStealth:
                
                cmpi.b  #MOVETYPE_STEALTH,d2
                bne.s   @CheckGunner
                getPointer p_table_MeleeTypeEnemyUpgradeDefinition, a0
                bra.s   @GetLeaderEffectiveLevel
@CheckGunner:
                
                cmpi.b  #MOVETYPE_BRASS_GUNNER,d2
                bne.s   @CheckFlying
                getPointer p_table_MeleeTypeEnemyUpgradeDefinition, a0
                bra.s   @GetLeaderEffectiveLevel
@CheckFlying:
                
                cmpi.b  #MOVETYPE_FLYING,d2
                bne.s   @CheckHovering
                getPointer p_table_AirborneTypeEnemyUpgradeDefinition, a0
                bra.s   @GetLeaderEffectiveLevel
@CheckHovering:
                
                cmpi.b  #MOVETYPE_HOVERING,d2
                bne.s   @CheckArcher
                getPointer p_table_AirborneTypeEnemyUpgradeDefinition, a0
                bra.s   @GetLeaderEffectiveLevel
@CheckArcher:
                
                cmpi.b  #MOVETYPE_ARCHER,d2
                bne.s   @CheckCentaurArcher
                getPointer p_table_RangedTypeEnemyUpgradeDefinition, a0
                bra.s   @GetLeaderEffectiveLevel
@CheckCentaurArcher:
                
                cmpi.b  #MOVETYPE_CENTAUR_ARCHER,d2
                bne.s   @CheckStealthArcher
                getPointer p_table_RangedTypeEnemyUpgradeDefinition, a0
                bra.s   @GetLeaderEffectiveLevel
@CheckStealthArcher:
                
                cmpi.b  #MOVETYPE_STEALTH_ARCHER,d2
                bne.s   @CheckMage
                getPointer p_table_RangedTypeEnemyUpgradeDefinition, a0
                bra.s   @GetLeaderEffectiveLevel
@CheckMage:
                
                cmpi.b  #MOVETYPE_MAGE,d2
                bne.s   @CheckHealer
                getPointer p_table_MageTypeEnemyUpgradeDefinition, a0
                bra.s   @GetLeaderEffectiveLevel
@CheckHealer:
                
                cmpi.b  #MOVETYPE_HEALER,d2
                bne.w   @DefaultEnemy
                getPointer p_table_HealerTypeEnemyUpgradeDefinition, a0
@GetLeaderEffectiveLevel:
                
                clr.w   d3
                move.b  d5,d3           ; d3 = original enemy index backup
                clr.w   d2
                clr.w   d0
                
                ; Get Bowie's effective level -> d2
                jsr     CalculateEffectiveLevel
                move.w  d1,d2
@Continue:
                
                loadSavedDataAddress CURRENT_BATTLE, a1
                clr.w   d1
                move.b  (a1),d1
                sub.w   d1,d2
                ble.s   @DefaultEnemy   ; default to original enemy if Bowie's effective level is lower than or equal
                                        ; to the current battle index
                
                ; Calculate upgrade multiplier
                divu.w  #10,d2          ; d2 = bowie_level - battle_index / 10
                andi.l  #BYTE_MASK,d2
                tst.w   d2
                beq.s   @DefaultEnemy   ; default to original enemy if Bowie is less than 10 levels over current battle
                
                ; Calculate upgrade range
                clr.w   d6
                move.b  (a0),d6         ; d6 = base upgrade range
                cmpi.b  #5,d6
                bne.s   @GetStrongestEnemy
                
                mulu.w  d6,d2           ; apply upgrade multiplier d2
                subq.w  #5,d2
@GetStrongestEnemy:
                
                add.w   d2,d3
                move.w  d3,d2           ; strongest enemy upgrade currently allowed -> d2
                addq.w  #1,d6
@UpgradeEnemy_Loop:
                
                jsr     (GenerateRandomNumber).w
                add.w   d7,d3
                cmp.b   1(a0),d3        ; compare to first upgradable enemy
                bge.s   @IsEnemyUpgradable
                
                tst.w   d4
                bne.s   @DefaultEnemy
                
                move.w  #1,d4
                move.w  d2,d3
                bra.s   @UpgradeEnemy_Loop ; fall back to enemy d2 and try again one more time
@IsEnemyUpgradable:
                
                cmp.b   2(a0),d3        ; compare to last upgradable enemy
                ble.s   @CheckExcludedEnemies ; keep going if enemy is upgradable
                
                tst.w   d4
                bne.s   @DefaultEnemy
                
                move.w  #1,d4
                move.w  d2,d3
                bra.s   @UpgradeEnemy_Loop ; fall back to enemy d2 and try again one more time
@CheckExcludedEnemies:
                
                movea.l a0,a1
                addq.w  #3,a1           ; a1 = pointer to excluded enemies list
                clr.w   d1
                move.b  (a1)+,d1
                bra.s   @FindExcludedEnemy
@FindExcludedEnemy_Loop:
                
                move.b  (a1)+,d0
                cmp.b   d0,d3
                bne.s   @NextEnemy
                
                tst.w   d4
                bne.s   @DefaultEnemy
                
                move.w  #1,d4
                move.w  d2,d3
                bra.s   @UpgradeEnemy_Loop ; fall back to enemy d2 and try again one more time
@NextEnemy:
@FindExcludedEnemy:
                dbf     d1,@FindExcludedEnemy_Loop
                
                clr.w   d1
                move.b  d3,d1           ; d1 = upgraded enemy index
                bra.s   @Done
@DefaultEnemy:
                
                move.w  d5,d1           ; default to original enemy
@Done:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function UpgradeRandomBattleEnemies

