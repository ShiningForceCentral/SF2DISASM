
; ASM FILE code\gameflow\battle\battle_s13_2.asm :
; 0x1B120A..0x1B1A66 : Battle init, terrain, AI stuff to split more properly

; =============== S U B R O U T I N E =======================================

; Never called, probably what remains of some debugging code ?

BattleDebugFunction1B120A:
                
                moveq   #4,d1
                jsr     j_AddItemToCaravan
                moveq   #7,d1
                jsr     j_AddItemToCaravan
                moveq   #4,d1
                jsr     j_RemoveItemFromCaravan
                moveq   #0,d1
                jsr     j_RemoveItemFromCaravan
                moveq   #0,d1
                jsr     j_RemoveItemFromCaravan
                moveq   #0,d1
                jsr     j_RemoveItemFromCaravan
                moveq   #0,d0
                jsr     j_JoinForce
                move.b  #BATTLE_VERSUS_ALL_BOSSES,((CURRENT_BATTLE-$1000000)).w
                jsr     j_InitEnemyList
                bsr.w   InitAllForceBattlePositions
                bsr.w   InitAllEnemyBattlePositions
                move.b  #$80,d0
                moveq   #0,d1
                jsr     j_SetXPos
                move.w  #$AAAA,d1
                bsr.w   UpdateEnemyStatsForRespawn
                bsr.w   GetEnemyAITargetPos
loc_1B126E:
                
                bra.s   loc_1B126E
                rts

    ; End of function BattleDebugFunction1B120A


; =============== S U B R O U T I N E =======================================

InitAllForceBattlePositions:
                
                movem.l d0-a6,-(sp)
                moveq   #COM_ALLY_START,d0
                moveq   #COM_ALLIES_COUNTER,d7
                move.w  #$FFFF,d1
loc_1B127E:
                
                jsr     j_SetXPos
                addq.b  #1,d0
                dbf     d7,loc_1B127E
                jsr     j_UpdateForce
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a1
                move.w  ((NUMBER_OF_BATTLE_PARTY_MEMBERS-$1000000)).w,d6
                subq.w  #1,d6
                moveq   #0,d1
                bsr.w   GetBattleSpriteSetSubsection
                clr.w   d7
                move.b  (a0),d7
                subq.w  #1,d7
                bcs.w   loc_1B12EC
                lea     4(a0),a0
loc_1B12AE:
                
                move.b  (a1),d0
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.s   loc_1B12D4
                clr.w   d1
                move.b  1(a0),d1
                jsr     j_SetXPos
                move.b  2(a0),d1
                jsr     j_SetYPos
                lea     $C(a0),a0
loc_1B12D4:
                
                addq.l  #1,a1
                subq.w  #1,d6
                bcs.w   loc_1B12EC
                dbf     d7,loc_1B12AE
loc_1B12E0:
                
                move.b  (a1)+,d0
                jsr     j_LeaveBattleParty
                dbf     d6,loc_1B12E0
loc_1B12EC:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function InitAllForceBattlePositions


; =============== S U B R O U T I N E =======================================

InitAllEnemyBattlePositions:
                
                movem.l d0/d7,-(sp)
                move.b  #COM_ENEMY_START,d0
                moveq   #COM_ENEMIES_COUNTER,d7
loc_1B12FC:
                
                bsr.w   InitEnemyBattlePosition
                addq.b  #1,d0
                dbf     d7,loc_1B12FC
                movem.l (sp)+,d0/d7
                rts

    ; End of function InitAllEnemyBattlePositions


; =============== S U B R O U T I N E =======================================

; (also checks for Jaro)

InitEnemyBattlePosition:
                
                movem.l d0-a6,-(sp)
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #BATTLE_TO_MOUN,d1
                bne.s   loc_1B132E
                cmpi.b  #$8F,d0
                bne.s   loc_1B132E
                bsr.w   sub_1B1A28
                tst.w   d1
                beq.s   loc_1B132E
                bra.w   loc_1B139A
loc_1B132E:
                
                moveq   #2,d1
                bsr.w   GetBattleSpriteSetSubsection
                move.w  d1,d2
                bset    #7,d2
                clr.w   d1
                cmp.b   d2,d0
                bcc.w   loc_1B1368
                move.b  d0,d1
                andi.l  #$7F,d1 
                mulu.w  #$C,d1
                adda.w  d1,a0
                move.w  $A(a0),d1
                andi.w  #$F,d1
                cmpi.w  #2,d1
                bge.w   loc_1B1368
                bsr.w   InitEnemyStats  
                bra.w   loc_1B139A
loc_1B1368:
                
                lsl.w   #8,d1
                jsr     j_SetCharacterWord34
                clr.w   d1
                jsr     j_SetMaxHP
                jsr     j_SetCurrentHP
                move.w  #$FFFF,d1
                jsr     j_SetXPos
                clr.w   d1
                clr.w   d2
                move.b  7(a0),d1
                move.b  9(a0),d2
                jsr     j_SetDefeats
loc_1B139A:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function InitEnemyBattlePosition


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D1 = char word 34 (AI stuff)
; Out: carry = 0 if respawn, 1 if not

UpdateEnemyStatsForRespawn:
                
                movem.l d0-a6,-(sp)
                move.w  d1,d2
                moveq   #2,d1
                bsr.w   GetBattleSpriteSetSubsection
                bset    #7,d1
                cmp.b   d1,d0
                bcc.w   loc_1B13E8
                move.b  d0,d1
                andi.l  #$7F,d1 
                mulu.w  #$C,d1
                adda.w  d1,a0
                clr.w   d3
                clr.w   d4
                move.b  1(a0),d3
                move.b  2(a0),d4
                bsr.w   GetEnemyOriginalPosOccupied
                bcs.w   loc_1B13E8
                bsr.w   InitEnemyStats  
                move.w  d2,d1
                jsr     j_SetCharacterWord34
                bra.w   loc_1B1404
loc_1B13E8:
                
                clr.w   d1
                jsr     j_SetMaxHP
                jsr     j_SetCurrentHP
                move.w  #$FFFF,d1
                jsr     j_SetXPos
                ori     #1,ccr
loc_1B1404:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function UpdateEnemyStatsForRespawn


; =============== S U B R O U T I N E =======================================

; In: A0 = address of current combatant from battle def

InitEnemyStats:
                
                movem.l d0-a1,-(sp)
                clr.l   d1
                move.b  (a0),d1
                bsr.w   UpgradeUnitIdx  
                move.w  d1,d6
                mulu.w  #$38,d1 
                lea     EnemyDefs(pc), a1
                adda.w  d1,a1
                move.l  a0,-(sp)
                jsr     j_GetCharacterRAMAddress_0
                moveq   #$D,d7
loc_1B142C:
                
                move.l  (a1)+,(a0)+
                dbf     d7,loc_1B142C
                movea.l (sp)+,a0
                jsr     j_GetMaxHP
                jsr     j_SetCurrentHP
                jsr     j_GetMaxMP
                jsr     j_SetCurrentMP
                clr.w   d1
                move.b  1(a0),d1
                jsr     j_SetXPos
                move.b  2(a0),d1
                jsr     j_SetYPos
                jsr     j_GetUpperMoveType
                lsl.w   #4,d1
                andi.w  #$F0,d1 
                move.b  3(a0),d2
                andi.w  #$F,d2
                or.w    d2,d1
                jsr     j_SetMoveType
                move.b  d6,d1
                jsr     j_SetEnemyID
                move.b  7(a0),d1
                move.b  9(a0),d2
                jsr     j_SetDefeats
                move.b  6(a0),d1
                move.b  8(a0),d2
                jsr     j_SetKills
                move.w  4(a0),d1
                bsr.w   InitEnemyItems  
                jsr     j_GetCharacterWord34
                move.w  d1,d2
                andi.w  #$F000,d2
                move.w  $A(a0),d1
                ror.w   #8,d1
                andi.w  #$FFF,d1
                or.w    d2,d1
                jsr     j_SetCharacterWord34
                bsr.w   SetEnemyBaseATK 
                jsr     j_ApplyStatusAndItemsOnStats
                movem.l (sp)+,d0-a1
                rts

    ; End of function InitEnemyStats


; =============== S U B R O U T I N E =======================================

InitEnemyList:
                
                movem.l d1/a0-a1,-(sp)
                lea     ((ENEMY_LIST-$1000000)).w,a1
                moveq   #7,d1
loc_1B14E2:
                
                clr.l   (a1)+
                dbf     d1,loc_1B14E2
                moveq   #2,d1
                bsr.w   GetBattleSpriteSetSubsection
                subq.w  #1,d1
                lea     ((ENEMY_LIST-$1000000)).w,a1
loc_1B14F4:
                
                move.b  (a0),(a1)+
                adda.w  #$C,a0
                dbf     d1,loc_1B14F4
                movem.l (sp)+,d1/a0-a1
                rts

    ; End of function InitEnemyList


; =============== S U B R O U T I N E =======================================

; handle custom item idx of monster list entry starting at A0 -> ???

InitEnemyItems:
                
                movem.l d0-a0,-(sp)
                cmpi.w  #ITEM_NOTHING,d1
                beq.w   loc_1B154E
                jsr     j_AddItem
                btst    #7,d1
                beq.s   loc_1B154E
                move.w  d1,d3
                clr.w   d1
                jsr     j_GetItemAndNumberOfItems
                subi.w  #1,d2
                move.w  d2,d4
                clr.w   d5
loc_1B152E:
                
                move.w  d5,d1
                jsr     j_GetItemAndNumberOfItems
                cmp.b   d1,d3
                bne.s   loc_1B1546
                move.w  d5,d1
                jsr     j_EquipItem
                bra.w   loc_1B154E
loc_1B1546:
                
                addi.w  #1,d5
                dbf     d4,loc_1B152E
loc_1B154E:
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function InitEnemyItems


; =============== S U B R O U T I N E =======================================

; In: D3 = enemy starting tile x (from battle def)
;     D4 = enemy starting tile y (from battle def)
; Out: carry = if anyone is on D3/D4

GetEnemyOriginalPosOccupied:
                
                movem.l d0-d2/d7,-(sp)
                moveq   #COM_ALLY_START,d0
                moveq   #COM_ALLIES_COUNTER,d7
loc_1B155C:
                
                jsr     j_GetXPos
                cmp.w   d1,d3
                bne.s   loc_1B1576
                jsr     j_GetYPos
                cmp.w   d1,d4
                ori     #1,ccr
                beq.w   loc_1B15A4
loc_1B1576:
                
                addq.w  #1,d0
                dbf     d7,loc_1B155C
                move.w  #COM_ENEMY_START,d0
                moveq   #COM_ENEMIES_COUNTER,d7
loc_1B1582:
                
                jsr     j_GetXPos
                cmp.w   d1,d3
                bne.s   loc_1B159C
                jsr     j_GetYPos
                cmp.w   d1,d4
                ori     #1,ccr
                beq.w   loc_1B15A4
loc_1B159C:
                
                addq.w  #1,d0
                dbf     d7,loc_1B1582
                tst.b   d0
loc_1B15A4:
                
                movem.l (sp)+,d0-d2/d7
                rts

    ; End of function GetEnemyOriginalPosOccupied


; =============== S U B R O U T I N E =======================================

; sets Enemy ATK according to difficulty

SetEnemyBaseATK:
                
                move.l  d1,-(sp)
                jsr     j_GetDifficulty
                cmpi.w  #2,d1
                beq.s   loc_1B15BC
                beq.w   loc_1B15F4
loc_1B15BC:
                
                clr.l   d1
                jsr     j_GetBaseATK
                mulu.w  #5,d1
                lsr.l   #2,d1
                jsr     j_SetBaseATK
                jsr     j_GetDifficulty
                cmpi.w  #2,d1
                beq.s   loc_1B15E0
                bra.w   loc_1B15F4
loc_1B15E0:
                
                clr.l   d1
                jsr     j_GetBaseATK
                mulu.w  #5,d1
                lsr.l   #2,d1
                jsr     j_SetBaseATK
loc_1B15F4:
                
                move.l  (sp)+,d1
                rts

    ; End of function SetEnemyBaseATK


; =============== S U B R O U T I N E =======================================

; coords of anchor point used in AI byte D0 -> D1, D2

GetEnemyAITargetPos:
                
                movem.l d0/a0,-(sp)
                btst    #6,d0
                bne.s   loc_1B1612
                jsr     j_GetYPos
                move.w  d1,d2
                jsr     j_GetXPos
                bra.s   loc_1B162A
loc_1B1612:
                
                moveq   #4,d1
                bsr.w   GetBattleSpriteSetSubsection
                andi.w  #$F,d0
                add.w   d0,d0
                adda.w  d0,a0
                clr.w   d1
                clr.w   d2
                move.b  (a0),d1
                move.b  1(a0),d2
loc_1B162A:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function GetEnemyAITargetPos


; =============== S U B R O U T I N E =======================================

; Get current battle subsection d1 -> A0
; Subsection size -> d1

GetBattleSpriteSetSubsection:
                
                movem.l d0/d2/a1,-(sp)
                move.b  d1,d2
                clr.w   d1
                clr.w   d0
                move.b  ((CURRENT_BATTLE-$1000000)).w,d0
                lsl.w   #2,d0
                conditionalPc lea,pt_BattleSpriteSets,a0
                nop
                movea.l (a0,d0.w),a0
                tst.b   d2
                beq.w   loc_1B1698      ; 0 = Section sizes
                movea.l a0,a1
                move.b  (a1),d1
                lea     4(a0),a0
                subq.b  #1,d2
                beq.w   loc_1B1698      ; 1 = Allies
                clr.l   d0
                move.b  1(a1),d1
                move.b  (a1),d0
                mulu.w  #$C,d0
                adda.l  d0,a0
                subq.b  #1,d2
                beq.w   loc_1B1698      ; 2 = Enemies
                clr.l   d0
                move.b  2(a1),d1
                move.b  1(a1),d0
                mulu.w  #$C,d0
                adda.l  d0,a0
                subq.b  #1,d2
                beq.w   loc_1B1698      ; 3 = AI-regions
                clr.l   d0
                move.b  3(a1),d1
                move.b  2(a1),d0
                mulu.w  #$C,d0
                adda.l  d0,a0           ; 4 = AI-points
loc_1B1698:
                
                movem.l (sp)+,d0/d2/a1
                rts

    ; End of function GetBattleSpriteSetSubsection


; =============== S U B R O U T I N E =======================================

; Starting X and Y of entity d0 -> d1, d2

GetCombatantStartPos:
                
                movem.l d0/d3-a6,-(sp)
                btst    #7,d0
                bne.s   loc_1B16CA
                move.w  #1,d1
                bsr.s   GetBattleSpriteSetSubsection
                cmp.b   d0,d1
                bge.s   loc_1B16BE
                move.w  #$FFFF,d1
                move.w  #$FFFF,d2
                bra.w   loc_1B16F8
loc_1B16BE:
                
                andi.w  #$FF,d0
                mulu.w  #$C,d0
                adda.w  d0,a0
                bra.s   loc_1B16EC
loc_1B16CA:
                
                move.w  #2,d1
                bsr.w   GetBattleSpriteSetSubsection
                cmp.b   d0,d1
                bge.s   loc_1B16E2
                move.w  #$FFFF,d1
                move.w  #$FFFF,d2
                bra.w   loc_1B16F8
loc_1B16E2:
                
                andi.w  #$7F,d0 
                mulu.w  #$C,d0
                adda.w  d0,a0
loc_1B16EC:
                
                clr.w   d1
                clr.w   d2
                move.b  1(a0),d1
                move.b  2(a0),d2
loc_1B16F8:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetCombatantStartPos


; =============== S U B R O U T I N E =======================================

; Battle-related

sub_1B16FE:
                
                movem.l d1-a6,-(sp)
                move.w  d2,d7
                move.w  d1,d6
                move.w  #2,d1
                bsr.w   GetBattleSpriteSetSubsection
                move.w  d1,d5
                subi.w  #1,d5
                move.w  #$80,d0 
                tst.w   d1
                bne.s   loc_1B1724
                move.w  #$FFFF,d0
                bra.w   loc_1B177A
loc_1B1724:
                
                move.b  1(a0),d1
                move.b  2(a0),d2
                cmp.b   d1,d6
                bne.s   loc_1B176A
                cmp.b   d2,d7
                bne.s   loc_1B176A
                jsr     j_GetCharacterWord34
                cmpi.w  #$200,d1
                bne.s   loc_1B176A
                jsr     j_GetEnemyAISetting36
                cmpi.w  #$F,d1
                bne.s   loc_1B176A
                cmpi.w  #$F,d2
                bne.s   loc_1B176A
                jsr     j_GetMaxHP
                tst.w   d1
                bne.s   loc_1B176A
                jsr     j_GetCharacterWord34
                bsr.w   UpdateEnemyStatsForRespawn
                bra.w   loc_1B177A
loc_1B176A:
                
                addi.w  #1,d0
                adda.w  #$C,a0
                dbf     d5,loc_1B1724
                move.w  #$FFFF,d0
loc_1B177A:
                
                movem.l (sp)+,d1-a6
                rts

    ; End of function sub_1B16FE


; =============== S U B R O U T I N E =======================================

; Check if current battle can be upgraded (0x0000=no, 0xffff=yes) -> D1

DoesBattleUpgrade:
                
                movem.l d0/d2-a6,-(sp)
                clr.w   d1              ; clear d1 for "false"
                lea     ((CURRENT_BATTLE-$1000000)).w,a0 ; point to battle index in RAM
                clr.w   d7
                move.b  (a0),d7         ; d7 contains battle index
                clr.w   d6
                lea     RandomBattlesList(pc), a0 ; point to length of table
                nop
                move.b  (a0)+,d6        ; put length of table in d6
                tst.b   d6
                bne.s   loc_1B17A0      ; if d6 not zero
                bra.w   loc_1B17B6      ; else
loc_1B17A0:
                
                subi.w  #1,d6           ; d6--
loc_1B17A4:
                
                move.b  (a0)+,d0        ; put next byte in d0
                cmp.b   d7,d0
                bne.s   loc_1B17B2      ; while d0 not battle index
                move.w  #$FFFF,d1       ; else, battle index is in the list, put FFFF ind d1, for "true"
                bra.w   loc_1B17B6
loc_1B17B2:
                
                dbf     d6,loc_1B17A4   
loc_1B17B6:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function DoesBattleUpgrade


; =============== S U B R O U T I N E =======================================

; Strange use case where "Battle completed" flag is set for battle 4 in spite of being alreeady set earlier.

UpgradeBattle:
                
                movem.l d0-a6,-(sp)
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                move.b  (a0),d7
                lea     RandomBattlesList(pc), a1
                nop
                clr.w   d2
                move.b  (a1),d2
                subi.w  #1,d2
                adda.w  #1,a1
                clr.w   d3
loc_1B17DA:
                
                move.b  (a1,d3.w),d1
                cmp.b   d1,d7
                bne.s   loc_1B17F0
                addi.w  #$1F4,d1
                jsr     j_SetFlag
                bra.w   loc_1B17F8
loc_1B17F0:
                
                addi.w  #1,d3
                dbf     d2,loc_1B17DA
loc_1B17F8:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function UpgradeBattle


; =============== S U B R O U T I N E =======================================

; check if battle should be upgraded based on index in RAM:f712 and if normal battle was done (0=no, 1=yes) -> D1

ShouldBattleUpgrade:
                
                movem.l d0/d2-a6,-(sp)
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                move.b  (a0),d7
                lea     RandomBattlesList(pc), a1
                nop
                clr.w   d2
                move.b  (a1),d2
                subi.w  #1,d2
                adda.w  #1,a1
                clr.w   d3
loc_1B181C:
                
                clr.w   d1
                move.b  (a1,d3.w),d1
                cmp.b   d1,d7
                bne.s   loc_1B183E
                addi.w  #$1F4,d1        ; HARDCODED "Battle completed" flag index start
                jsr     j_CheckFlag
                bne.s   loc_1B1836
                clr.w   d1
                bra.s   loc_1B183A
loc_1B1836:
                
                move.w  #1,d1
loc_1B183A:
                
                bra.w   loc_1B1846
loc_1B183E:
                
                addi.w  #1,d3
                dbf     d2,loc_1B181C
loc_1B1846:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function ShouldBattleUpgrade


; =============== S U B R O U T I N E =======================================

; In: D1 = original unit idx
; Out: D1 = upgraded unit idx

UpgradeUnitIdx:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d1,d5
                bsr.w   DoesBattleUpgrade
                tst.w   d1
                bne.s   loc_1B1860
                move.w  d5,d1
                bra.w   loc_1B1A22
loc_1B1860:
                
                bsr.s   ShouldBattleUpgrade
                tst.w   d1
                bne.s   loc_1B186C
                move.w  d5,d1
                bra.w   loc_1B1A22
loc_1B186C:
                
                clr.w   d4
                clr.l   d1
                move.b  d5,d1
                mulu.w  #ENEMYDEF_ENTRY_SIZE,d1
                lea     EnemyDefs(pc), a1
                adda.w  d1,a1
                move.b  ENEMYDEF_OFFSET_MOVETYPE(a1),d2
                lsr.w   #4,d2           ; shift movetype upper nibble to lower position
                andi.b  #MOVETYPE_MASK_LOWERNIBBLE,d2
                cmpi.b  #MOVETYPE_LOWERNIBBLE_REGULAR,d2
                bne.s   loc_1B1896
                lea     unk_1B6DBC(pc), a0
                nop
                bra.w   loc_1B193C
loc_1B1896:
                
                cmpi.b  #MOVETYPE_LOWERNIBBLE_CENTAUR,d2
                bne.s   loc_1B18A6
                lea     unk_1B6DBC(pc), a0
                nop
                bra.w   loc_1B193C
loc_1B18A6:
                
                cmpi.b  #MOVETYPE_LOWERNIBBLE_STEALTH,d2
                bne.s   loc_1B18B6
                lea     unk_1B6DBC(pc), a0
                nop
                bra.w   loc_1B193C
loc_1B18B6:
                
                cmpi.b  #MOVETYPE_LOWERNIBBLE_BRASS_GUNNER,d2
                bne.s   loc_1B18C6
                lea     unk_1B6DBC(pc), a0
                nop
                bra.w   loc_1B193C
loc_1B18C6:
                
                cmpi.b  #MOVETYPE_LOWERNIBBLE_FLYING,d2
                bne.s   loc_1B18D6
                lea     unk_1B6DC6(pc), a0
                nop
                bra.w   loc_1B193C
loc_1B18D6:
                
                cmpi.b  #MOVETYPE_LOWERNIBBLE_HOVERING,d2
                bne.s   loc_1B18E6
                lea     unk_1B6DC6(pc), a0
                nop
                bra.w   loc_1B193C
loc_1B18E6:
                
                cmpi.b  #MOVETYPE_LOWERNIBBLE_ARCHER,d2
                bne.s   loc_1B18F6
                lea     unk_1B6DCA(pc), a0
                nop
                bra.w   loc_1B193C
loc_1B18F6:
                
                cmpi.b  #MOVETYPE_LOWERNIBBLE_CENTAUR_ARCHER,d2
                bne.s   loc_1B1906
                lea     unk_1B6DCA(pc), a0
                nop
                bra.w   loc_1B193C
loc_1B1906:
                
                cmpi.b  #MOVETYPE_LOWERNIBBLE_STEALTH_ARCHER,d2
                bne.s   loc_1B1916
                lea     unk_1B6DCA(pc), a0
                nop
                bra.w   loc_1B193C
loc_1B1916:
                
                cmpi.b  #MOVETYPE_LOWERNIBBLE_MAGE,d2
                bne.s   loc_1B1926
                lea     unk_1B6DD0(pc), a0
                nop
                bra.w   loc_1B193C
loc_1B1926:
                
                cmpi.b  #MOVETYPE_LOWERNIBBLE_HEALER,d2
                bne.s   loc_1B1936
                lea     unk_1B6DD5(pc), a0
                nop
                bra.w   loc_1B193C
loc_1B1936:
                
                move.w  d5,d1
                bra.w   loc_1B1A22
loc_1B193C:
                
                clr.w   d3
                move.b  d5,d3
                clr.w   d2
                clr.w   d0
                jsr     j_GetCurrentLevel
                move.w  d1,d2
                jsr     j_GetClass      
                cmpi.b  #CHAR_CLASS_LASTNONPROMOTED,d1
                ble.s   loc_1B195C
                addi.w  #CHAR_CLASS_EXTRALEVEL,d2
loc_1B195C:
                
                lea     ((CURRENT_BATTLE-$1000000)).w,a1
                clr.w   d1
                move.b  (a1),d1
                sub.w   d1,d2           ; subtract battle ID from force leader's effective level
                bne.s   loc_1B197A
                tst.w   d4
                bne.s   loc_1B1974
                move.w  #1,d4
                bra.s   loc_1B193C
                bra.s   loc_1B197A
loc_1B1974:
                
                move.w  d5,d1
                bra.w   loc_1B1A22
loc_1B197A:
                
                bpl.s   loc_1B198E
                tst.w   d4
                bne.s   loc_1B1988
                move.w  #1,d4
                bra.s   loc_1B193C
                bra.s   loc_1B198E
loc_1B1988:
                
                move.w  d5,d1
                bra.w   loc_1B1A22
loc_1B198E:
                
                divu.w  #$A,d2
                andi.l  #$FF,d2
                tst.w   d2
                bne.s   loc_1B19A2
                move.w  d5,d1
                bra.w   loc_1B1A22
loc_1B19A2:
                
                clr.w   d6
                move.b  (a0),d6
                cmpi.b  #5,d6
                bne.s   loc_1B19B0
                mulu.w  d6,d2
                subq.w  #5,d2
loc_1B19B0:
                
                add.w   d2,d3
                move.w  d3,d2
                addi.w  #1,d6
loc_1B19B8:
                
                jsr     (GenerateRandomNumber).w
                add.w   d7,d3
                cmp.b   1(a0),d3
                bge.s   loc_1B19D8
                tst.w   d4
                bne.s   loc_1B19D2
                move.w  #1,d4
                move.w  d2,d3
                bra.s   loc_1B19B8
                bra.s   loc_1B19D8
loc_1B19D2:
                
                move.w  d5,d1
                bra.w   loc_1B1A22
loc_1B19D8:
                
                cmp.b   2(a0),d3
                ble.s   loc_1B19F2
                tst.w   d4
                bne.s   loc_1B19EC
                move.w  #1,d4
                move.w  d2,d3
                bra.s   loc_1B19B8
                bra.s   loc_1B19F2
loc_1B19EC:
                
                move.w  d5,d1
                bra.w   loc_1B1A22
loc_1B19F2:
                
                movea.l a0,a1
                adda.w  #3,a1
                clr.w   d1
                move.b  (a1)+,d1
                subi.w  #1,d1
loc_1B1A00:
                
                move.b  (a1)+,d0
                cmp.b   d0,d3
                bne.s   loc_1B1A1A
                tst.w   d4
                bne.s   loc_1B1A14
                move.w  #1,d4
                move.w  d2,d3
                bra.s   loc_1B19B8
                bra.s   loc_1B1A1A
loc_1B1A14:
                
                move.w  d5,d1
                bra.w   loc_1B1A22
loc_1B1A1A:
                
                dbf     d1,loc_1B1A00
                clr.w   d1
                move.b  d3,d1
loc_1B1A22:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function UpgradeUnitIdx


; =============== S U B R O U T I N E =======================================

sub_1B1A28:
                
                movem.l d0/d2-a6,-(sp)
                jsr     j_UpdateForce
                lea     ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a0
                move.w  (a0),d7
                subi.w  #1,d7
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                clr.l   d6
loc_1B1A42:
                
                clr.w   d0
                move.b  (a0,d6.w),d0
                cmpi.b  #$17,d0
                bne.s   loc_1B1A56
                move.w  #1,d1
                bra.w   loc_1B1A60
loc_1B1A56:
                
                addi.w  #1,d6
                dbf     d7,loc_1B1A42
                clr.w   d1
loc_1B1A60:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_1B1A28

