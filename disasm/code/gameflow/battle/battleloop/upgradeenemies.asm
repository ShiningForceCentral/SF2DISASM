
; ASM FILE code\gameflow\battle\battleloop\upgradeenemies.asm :
; 0x1B1780..0x1B1A28 : Upgrade random battle enemies to stronger ones

; =============== S U B R O U T I N E =======================================

; Is current battle upgradable? Return d1.w = -1 if true.


IsBattleUpgradable:
                
                movem.l d0/d2-a6,-(sp)
                clr.w   d1              ; clear d1 for "false"
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                clr.w   d7
                move.b  (a0),d7         ; d7 contains battle index
                clr.w   d6
                lea     list_RandomBattles(pc), a0 ; point to length of table
                nop
                move.b  (a0)+,d6        ; put length of table in d6
                tst.b   d6
                bne.s   @Continue       ; if d6 not zero
                bra.w   @Done           ; else
@Continue:
                
                subi.w  #1,d6           ; d6--
@Find_Loop:
                
                move.b  (a0)+,d0        ; put next byte in d0
                cmp.b   d7,d0
                bne.s   @Next           ; while d0 not battle index
                move.w  #-1,d1          ; else, battle index is in the list, put -1 in d1.w, for "true"
                bra.w   @Done
@Next:
                
                dbf     d6,@Find_Loop   
@Done:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function IsBattleUpgradable


; =============== S U B R O U T I N E =======================================

; Strange use case where "Battle completed" flag is set for battle 4 in spite of being alreeady set earlier.


UpgradeBattle:
                
                movem.l d0-a6,-(sp)
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                move.b  (a0),d7
                lea     list_RandomBattles(pc), a1
                nop
                clr.w   d2
                move.b  (a1),d2
                subi.w  #1,d2
                adda.w  #1,a1
                clr.w   d3
@ReadRandomBattleList_Loop:
                
                move.b  (a1,d3.w),d1
                cmp.b   d1,d7
                bne.s   @CheckNextBattle
                addi.w  #BATTLE_COMPLETED_FLAGS_START,d1
                jsr     j_SetFlag
                bra.w   @ExitLoop
@CheckNextBattle:
                
                addi.w  #1,d3
                dbf     d2,@ReadRandomBattleList_Loop
@ExitLoop:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function UpgradeBattle


; =============== S U B R O U T I N E =======================================

; Should random battle enemies be upgraded? Return d1.w = 1 if so.


DetermineBattleUpgrade:
                
                movem.l d0/d2-a6,-(sp)
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                move.b  (a0),d7
                lea     list_RandomBattles(pc), a1
                nop
                clr.w   d2
                move.b  (a1),d2
                subi.w  #1,d2
                adda.w  #1,a1
                clr.w   d3
@FindBattle_Loop:
                
                clr.w   d1
                move.b  (a1,d3.w),d1
                cmp.b   d1,d7
                bne.s   @Next
                addi.w  #BATTLE_COMPLETED_FLAGS_START,d1
                jsr     j_CheckFlag
                bne.s   @AllowUpgrade
                clr.w   d1
                bra.s   @Goto_Done
@AllowUpgrade:
                
                move.w  #1,d1
@Goto_Done:
                
                bra.w   @Done
@Next:
                
                addi.w  #1,d3
                dbf     d2,@FindBattle_Loop
@Done:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function DetermineBattleUpgrade


; =============== S U B R O U T I N E =======================================

; Upgrade enemy index d1.w -> d1.w


UpgradeRandomBattleEnemies:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d1,d5           ; D5 = original enemy index backup
                bsr.w   IsBattleUpgradable
                tst.w   d1
                bne.s   @DetermineUpgrade
                move.w  d5,d1
                bra.w   @Done
@DetermineUpgrade:
                
                bsr.s   DetermineBattleUpgrade
                tst.w   d1
                bne.s   @DoUpgrade
                move.w  d5,d1
                bra.w   @Done
@DoUpgrade:
                
                clr.w   d4
                clr.l   d1
                
                ; Get pointer to enemy upgrade data based on movetype -> a0
                move.b  d5,d1
                mulu.w  #ENEMYDEF_ENTRY_SIZE,d1
                lea     table_EnemyDefinitions(pc), a1
                adda.w  d1,a1
                move.b  ENEMYDEF_OFFSET_MOVETYPE(a1),d2
                lsr.w   #NIBBLE_SHIFT_COUNT,d2 ; shift movetype upper nibble to lower position
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d2
                
                ; Check regular movetype
                cmpi.b  #MOVETYPE_REGULAR,d2
                bne.s   @CheckCentaur
                lea     table_MeleeTypeEnemyUpgradeDefinition(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckCentaur:
                
                cmpi.b  #MOVETYPE_CENTAUR,d2
                bne.s   @CheckStealth
                lea     table_MeleeTypeEnemyUpgradeDefinition(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckStealth:
                
                cmpi.b  #MOVETYPE_STEALTH,d2
                bne.s   @CheckGunner
                lea     table_MeleeTypeEnemyUpgradeDefinition(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckGunner:
                
                cmpi.b  #MOVETYPE_BRASS_GUNNER,d2
                bne.s   @CheckFlying
                lea     table_MeleeTypeEnemyUpgradeDefinition(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckFlying:
                
                cmpi.b  #MOVETYPE_FLYING,d2
                bne.s   @CheckHovering
                lea     table_AirborneTypeEnemyUpgradeDefinition(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckHovering:
                
                cmpi.b  #MOVETYPE_HOVERING,d2
                bne.s   @CheckArcher
                lea     table_AirborneTypeEnemyUpgradeDefinition(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckArcher:
                
                cmpi.b  #MOVETYPE_ARCHER,d2
                bne.s   @CheckCentaurArcher
                lea     table_RangedTypeEnemyUpgradeDefinition(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckCentaurArcher:
                
                cmpi.b  #MOVETYPE_CENTAUR_ARCHER,d2
                bne.s   @CheckStealthArcher
                lea     table_RangedTypeEnemyUpgradeDefinition(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckStealthArcher:
                
                cmpi.b  #MOVETYPE_STEALTH_ARCHER,d2
                bne.s   @CheckMage
                lea     table_RangedTypeEnemyUpgradeDefinition(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckMage:
                
                cmpi.b  #MOVETYPE_MAGE,d2
                bne.s   @CheckHealer
                lea     table_MageTypeEnemyUpgradeDefinition(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckHealer:
                
                cmpi.b  #MOVETYPE_HEALER,d2
                bne.s   @Default1
                lea     table_HealerTypeEnemyUpgradeDefinition(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@Default1:
                
                move.w  d5,d1
                bra.w   @Done           ; no valid movetype found, default to original enemy
@GetLeaderEffectiveLevel:
                
                clr.w   d3
                move.b  d5,d3           ; d3 = original enemy index backup
                clr.w   d2
                clr.w   d0
                
                ; Get Bowie's effective level -> d2
                jsr     j_GetLevel
                move.w  d1,d2
                jsr     j_GetClass
                cmpi.b  #CHAR_CLASS_LASTNONPROMOTED,d1
                ble.s   @Continue
                addi.w  #CHAR_CLASS_EXTRALEVEL,d2
@Continue:
                
                lea     ((CURRENT_BATTLE-$1000000)).w,a1
                clr.w   d1
                move.b  (a1),d1
                sub.w   d1,d2           ; subtract battle index from Bowie's effective level
                bne.s   @CheckPositive
                tst.w   d4
                bne.s   @Default2
                move.w  #1,d4
                bra.s   @GetLeaderEffectiveLevel
                bra.s   @CheckPositive  ; unreachable code
@Default2:
                
                move.w  d5,d1
                bra.w   @Done
@CheckPositive:
                
                bpl.s   @CalculateUpgradeMultiplier
                tst.w   d4
                bne.s   @Default3
                move.w  #1,d4
                bra.s   @GetLeaderEffectiveLevel ; if less than 1, do it all over again for nothing
                bra.s   @CalculateUpgradeMultiplier ; unreachable code
@Default3:
                
                move.w  d5,d1
                bra.w   @Done
@CalculateUpgradeMultiplier:
                
                divu.w  #10,d2          ; d2 = bowie_level - battle_index / 10
                andi.l  #BYTE_MASK,d2
                tst.w   d2
                bne.s   @CalculateUpgradeRange
                move.w  d5,d1
                bra.w   @Done           ; default to original enemy if Bowie is less than 10 levels over current battle
@CalculateUpgradeRange:
                
                clr.w   d6
                move.b  (a0),d6         ; d6 = base upgrade range
                cmpi.b  #5,d6
                bne.s   @GetStrongestEnemy
                mulu.w  d6,d2           ; apply upgrade multiplier D2
                subq.w  #5,d2
@GetStrongestEnemy:
                
                add.w   d2,d3
                move.w  d3,d2           ; strongest enemy upgrade currently allowed -> d2
                addi.w  #1,d6
@UpgradeEnemy_Loop:
                
                jsr     (GenerateRandomNumber).w
                add.w   d7,d3
                cmp.b   1(a0),d3        ; compare to first upgradable enemy
                bge.s   @IsEnemyUpgradable
                tst.w   d4
                bne.s   @Default4
                move.w  #1,d4
                move.w  d2,d3
                bra.s   @UpgradeEnemy_Loop ; fall back to enemy d2 and try again one more time
                bra.s   @IsEnemyUpgradable ; unreachable code
@Default4:
                
                move.w  d5,d1
                bra.w   @Done
@IsEnemyUpgradable:
                
                cmp.b   2(a0),d3        ; compare to last upgradable enemy
                ble.s   @CheckExcludedEnemies ; keep going if enemy is upgradable
                tst.w   d4
                bne.s   @Default5
                move.w  #1,d4
                move.w  d2,d3
                bra.s   @UpgradeEnemy_Loop ; fall back to enemy d2 and try again one more time
                bra.s   @CheckExcludedEnemies ; unreachable code
@Default5:
                
                move.w  d5,d1
                bra.w   @Done
@CheckExcludedEnemies:
                
                movea.l a0,a1
                adda.w  #3,a1           ; a1 = pointer to excluded enemies list
                clr.w   d1
                move.b  (a1)+,d1
                subi.w  #1,d1           ; d1 = loop counter
@FindExcludedEnemy_Loop:
                
                move.b  (a1)+,d0
                cmp.b   d0,d3
                bne.s   @Next
                tst.w   d4
                bne.s   @Default6
                move.w  #1,d4
                move.w  d2,d3
                bra.s   @UpgradeEnemy_Loop ; fall back to enemy D2 and try again one more time
                bra.s   @Next           ; unreachable code
@Default6:
                
                move.w  d5,d1
                bra.w   @Done
@Next:
                
                dbf     d1,@FindExcludedEnemy_Loop
                
                clr.w   d1
                move.b  d3,d1           ; d1 = upgraded enemy index
@Done:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function UpgradeRandomBattleEnemies

