
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
                bsr.w   InitAllAlliesBattlePositions
                bsr.w   InitAllEnemiesBattlePositions
                move.b  #$80,d0
                moveq   #0,d1
                jsr     j_SetXPos
                move.w  #$AAAA,d1
                bsr.w   UpdateEnemyStatsForRespawn
                bsr.w   GetEnemyAITargetPosition
loc_1B126E:
                
                bra.s   loc_1B126E
                rts

    ; End of function BattleDebugFunction1B120A


; =============== S U B R O U T I N E =======================================


InitAllAlliesBattlePositions:
                
                movem.l d0-a6,-(sp)
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                move.w  #$FFFF,d1
@ResetPositions_Loop:
                
                jsr     j_SetXPos
                addq.b  #1,d0
                dbf     d7,@ResetPositions_Loop
                
                jsr     j_UpdateForce
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a1
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d6
                subq.w  #1,d6
                moveq   #BATTLESPRITESET_SUBSECTION_SIZES,d1
                bsr.w   GetBattleSpriteSetSubsection
                clr.w   d7
                move.b  (a0),d7
                subq.w  #1,d7
                bcs.w   @Done
                lea     BATTLESPRITESET_OFFSET_ALLY_ENTRIES(a0),a0
@InitPositions_Loop:
                
                move.b  (a1),d0         ; D0 = ally index from battle party members table
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.s   @Skip           ; skip positioning if ally is dead
                clr.w   d1
                move.b  BATTLESPRITESET_COMBATANT_OFFSET_STARTING_X(a0),d1
                jsr     j_SetXPos
                move.b  BATTLESPRITESET_COMBATANT_OFFSET_STARTING_Y(a0),d1
                jsr     j_SetYPos
                lea     BATTLESPRITESET_COMBATANT_OFFSET_NEXT_ENTRY(a0),a0
@Skip:
                
                addq.l  #1,a1
                subq.w  #1,d6
                bcs.w   @Done
                dbf     d7,@InitPositions_Loop
@LeaveBattleParty_Loop:
                
                move.b  (a1)+,d0
                jsr     j_LeaveBattleParty
                dbf     d6,@LeaveBattleParty_Loop
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function InitAllAlliesBattlePositions


; =============== S U B R O U T I N E =======================================


InitAllEnemiesBattlePositions:
                
                movem.l d0/d7,-(sp)
                move.b  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
@InitPositions_Loop:
                
                bsr.w   InitEnemyBattlePosition
                addq.b  #1,d0
                dbf     d7,@InitPositions_Loop
                
                movem.l (sp)+,d0/d7
                rts

    ; End of function InitAllEnemiesBattlePositions


; =============== S U B R O U T I N E =======================================


InitEnemyBattlePosition:
                
                movem.l d0-a6,-(sp)
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #BATTLE_TO_MOUN,d1
                bne.s   loc_1B132E
                cmpi.b  #$8F,d0
                bne.s   loc_1B132E
                bsr.w   HasJaroJoinedTheForce ; HARDCODED check for Jaro in battle 32
                tst.w   d1
                beq.s   loc_1B132E
                bra.w   loc_1B139A      ; skip positioning enemy 15 in battle 32 if Jaro has joined the Force
loc_1B132E:
                
                moveq   #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                bsr.w   GetBattleSpriteSetSubsection
                move.w  d1,d2
                bset    #COMBATANT_BIT_ENEMY,d2
                clr.w   d1
                cmp.b   d2,d0
                bcc.w   loc_1B1368
                move.b  d0,d1
                andi.l  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                mulu.w  #BATTLESPRITESET_COMBATANT_ENTRY_SIZE,d1
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
                move.b  BATTLESPRITESET_COMBATANT_OFFSET_TRIGGER_REGION(a0),d1
                move.b  9(a0),d2
                jsr     j_SetDefeats
loc_1B139A:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function InitEnemyBattlePosition


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     D1 = character word 34 (AI stuff)
; 
; Out: carry = 0 if respawn, 1 if not


UpdateEnemyStatsForRespawn:
                
                movem.l d0-a6,-(sp)
                move.w  d1,d2
                moveq   #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
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
                bsr.w   UpgradeEnemyIndex
                move.w  d1,d6
                mulu.w  #$38,d1 
                lea     tbl_EnemyDefs(pc), a1
                adda.w  d1,a1
                move.l  a0,-(sp)
                jsr     j_GetCombatantEntryAddress_0
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
                jsr     j_SetEnemyIndex
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
                bsr.w   SetEnemyBaseATT 
                jsr     j_ApplyStatusEffectsAndItemsOnStats
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
                moveq   #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
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


InitEnemyItems:
                
                movem.l d0-a0,-(sp)
                cmpi.w  #ITEM_NOTHING,d1
                beq.w   loc_1B154E
                jsr     j_AddItem
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   loc_1B154E
                move.w  d1,d3
                clr.w   d1
                jsr     j_GetItemAndNumberHeld
                subi.w  #1,d2
                move.w  d2,d4
                clr.w   d5
loc_1B152E:
                
                move.w  d5,d1
                jsr     j_GetItemAndNumberHeld
                cmp.b   d1,d3
                bne.s   loc_1B1546
                move.w  d5,d1
                jsr     j_EquipItemBySlot
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
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
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
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
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

; Set enemy base ATT according to difficulty


SetEnemyBaseATT:
                
                move.l  d1,-(sp)
                jsr     j_GetDifficulty
                cmpi.w  #DIFFICULTY_SUPER,d1 ; pointless comparison
                beq.s   @Continue
                beq.w   @Done
@Continue:
                
                clr.l   d1
                jsr     j_GetBaseATT
                mulu.w  #5,d1
                lsr.l   #2,d1           ; base ATT effectively multiplied by 1.25
                jsr     j_SetBaseATT
                jsr     j_GetDifficulty
                cmpi.w  #DIFFICULTY_SUPER,d1
                beq.s   @SuperDifficulty
                bra.w   @Done
@SuperDifficulty:
                
                clr.l   d1
                jsr     j_GetBaseATT
                mulu.w  #5,d1
                lsr.l   #2,d1           ; if SUPER difficulty, multiply base ATT by 1.25 a second time
                jsr     j_SetBaseATT
@Done:
                
                move.l  (sp)+,d1
                rts

    ; End of function SetEnemyBaseATT


; =============== S U B R O U T I N E =======================================

; coords of anchor point used in AI byte D0 -> D1, D2


GetEnemyAITargetPosition:
                
                movem.l d0/a0,-(sp)
                btst    #6,d0
                bne.s   loc_1B1612
                jsr     j_GetYPos
                move.w  d1,d2
                jsr     j_GetXPos
                bra.s   loc_1B162A
loc_1B1612:
                
                moveq   #BATTLESPRITESET_SUBSECTION_AI_POINTS,d1
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

    ; End of function GetEnemyAITargetPosition


; =============== S U B R O U T I N E =======================================

; Get address and size of subsection D1 for current battle
; 
;       In: D1 = subsection index
; 
;       Out: A0 = subsection address
;            D1 = subsection size


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

; Get starting X and Y of combatant D0 -> D1, D2


GetCombatantStartingPositions:
                
                movem.l d0/d3-a6,-(sp)
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                move.w  #BATTLESPRITESET_SUBSECTION_ALLIES,d1
                bsr.s   GetBattleSpriteSetSubsection
                cmp.b   d0,d1
                bge.s   @GetAllyEntryAddress
                move.w  #$FFFF,d1       ; reset positions
                move.w  #$FFFF,d2
                bra.w   @Done
@GetAllyEntryAddress:
                
                andi.w  #COMBATANT_MASK_ALL,d0
                mulu.w  #BATTLESPRITESET_COMBATANT_ENTRY_SIZE,d0
                adda.w  d0,a0
                bra.s   @GetStartingPositions
@Enemy:
                
                move.w  #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                bsr.w   GetBattleSpriteSetSubsection
                cmp.b   d0,d1
                bge.s   @GetEnemyEntryAddress
                move.w  #$FFFF,d1       ; reset positions
                move.w  #$FFFF,d2
                bra.w   @Done
@GetEnemyEntryAddress:
                
                andi.w  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                mulu.w  #BATTLESPRITESET_COMBATANT_ENTRY_SIZE,d0
                adda.w  d0,a0
@GetStartingPositions:
                
                clr.w   d1
                clr.w   d2
                move.b  BATTLESPRITESET_COMBATANT_OFFSET_STARTING_X(a0),d1
                move.b  BATTLESPRITESET_COMBATANT_OFFSET_STARTING_Y(a0),d2
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetCombatantStartingPositions


; =============== S U B R O U T I N E =======================================

; Battle-related
; 
;       In: D1 = 
;           D2 = 


sub_1B16FE:
                
                movem.l d1-a6,-(sp)
                move.w  d2,d7
                move.w  d1,d6
                move.w  #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                bsr.w   GetBattleSpriteSetSubsection
                move.w  d1,d5
                subi.w  #1,d5
                move.w  #COMBATANT_ENEMIES_START,d0
                tst.w   d1
                bne.s   loc_1B1724
                move.w  #$FFFF,d0
                bra.w   loc_1B177A
loc_1B1724:
                
                move.b  BATTLESPRITESET_COMBATANT_OFFSET_STARTING_X(a0),d1
                move.b  BATTLESPRITESET_COMBATANT_OFFSET_STARTING_Y(a0),d2
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
                adda.w  #BATTLESPRITESET_COMBATANT_ENTRY_SIZE,a0
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
                addi.w  #500,d1         ; HARDCODED "Battle completed" flag index start
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

; In: D1 = original enemy index
; 
; Out: D1 = upgraded enemy index


UpgradeEnemyIndex:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d1,d5           ; D5 = original enemy index backup
                bsr.w   DoesBattleUpgrade
                tst.w   d1
                bne.s   @DetermineUpgrade
                move.w  d5,d1
                bra.w   @Done
@DetermineUpgrade:
                
                bsr.s   ShouldBattleUpgrade
                tst.w   d1
                bne.s   @DoUpgrade
                move.w  d5,d1
                bra.w   @Done
@DoUpgrade:
                
                clr.w   d4
                clr.l   d1
                
                ; Get pointer to enemy upgrade data based on move type -> A0
                move.b  d5,d1
                mulu.w  #ENEMYDEF_ENTRY_SIZE,d1
                lea     tbl_EnemyDefs(pc), a1
                adda.w  d1,a1
                move.b  ENEMYDEF_OFFSET_MOVETYPE(a1),d2
                lsr.w   #MOVETYPE_NIBBLE_SHIFTCOUNT,d2 ; shift movetype upper nibble to lower position
                andi.b  #MOVETYPE_MASK_LOWERNIBBLE,d2
                
                ; Check regular move type
                cmpi.b  #MOVETYPE_LOWER_REGULAR,d2
                bne.s   @CheckCentaur
                lea     tbl_EnemyUpgradeDef_Melee(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckCentaur:
                
                cmpi.b  #MOVETYPE_LOWER_CENTAUR,d2
                bne.s   @CheckStealth
                lea     tbl_EnemyUpgradeDef_Melee(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckStealth:
                
                cmpi.b  #MOVETYPE_LOWER_STEALTH,d2
                bne.s   @CheckGunner
                lea     tbl_EnemyUpgradeDef_Melee(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckGunner:
                
                cmpi.b  #MOVETYPE_LOWER_BRASS_GUNNER,d2
                bne.s   @CheckFlying
                lea     tbl_EnemyUpgradeDef_Melee(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckFlying:
                
                cmpi.b  #MOVETYPE_LOWER_FLYING,d2
                bne.s   @CheckHovering
                lea     tbl_EnemyUpgradeDef_Air(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckHovering:
                
                cmpi.b  #MOVETYPE_LOWER_HOVERING,d2
                bne.s   @CheckArcher
                lea     tbl_EnemyUpgradeDef_Air(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckArcher:
                
                cmpi.b  #MOVETYPE_LOWER_ARCHER,d2
                bne.s   @CheckCentaurArcher
                lea     tbl_EnemyUpgradeDef_Ranged(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckCentaurArcher:
                
                cmpi.b  #MOVETYPE_LOWER_CENTAUR_ARCHER,d2
                bne.s   @CheckStealthArcher
                lea     tbl_EnemyUpgradeDef_Ranged(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckStealthArcher:
                
                cmpi.b  #MOVETYPE_LOWER_STEALTH_ARCHER,d2
                bne.s   @CheckMage
                lea     tbl_EnemyUpgradeDef_Ranged(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckMage:
                
                cmpi.b  #MOVETYPE_LOWER_MAGE,d2
                bne.s   @CheckHealer
                lea     tbl_EnemyUpgradeDef_Mage(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@CheckHealer:
                
                cmpi.b  #MOVETYPE_LOWER_HEALER,d2
                bne.s   @Default1
                lea     tbl_EnemyUpgradeDef_Healer(pc), a0
                nop
                bra.w   @GetLeaderEffectiveLevel
@Default1:
                
                move.w  d5,d1
                bra.w   @Done           ; no valid move type found, default to original enemy
@GetLeaderEffectiveLevel:
                
                clr.w   d3
                move.b  d5,d3           ; D3 = original enemy index backup
                clr.w   d2
                clr.w   d0
                
                ; Get Bowie's effective level -> D2
                jsr     j_GetCurrentLevel
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
                bra.s   @CheckPositive
@Default2:
                
                move.w  d5,d1
                bra.w   @Done
@CheckPositive:
                
                bpl.s   @CalculateUpgradeMultiplier
                tst.w   d4
                bne.s   @Default3
                move.w  #1,d4
                bra.s   @GetLeaderEffectiveLevel ; if less than 1, do it all over again once more for laughs !
                bra.s   @CalculateUpgradeMultiplier
@Default3:
                
                move.w  d5,d1
                bra.w   @Done
@CalculateUpgradeMultiplier:
                
                divu.w  #10,d2          ; D2 = bowie_level - battle_index / 10
                andi.l  #$FF,d2
                tst.w   d2
                bne.s   @CalculateUpgradeRange
                move.w  d5,d1
                bra.w   @Done           ; default to original enemy if Bowie is less than 10 levels over current battle
@CalculateUpgradeRange:
                
                clr.w   d6
                move.b  (a0),d6         ; D6 = base upgrade range
                cmpi.b  #5,d6
                bne.s   @GetStrongestEnemy
                mulu.w  d6,d2           ; apply upgrade multiplier D2
                subq.w  #5,d2
@GetStrongestEnemy:
                
                add.w   d2,d3
                move.w  d3,d2           ; strongest enemy upgrade currently allowed -> D2
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
                bra.s   @UpgradeEnemy_Loop ; fall back to enemy D2 and try again one more time
                bra.s   @IsEnemyUpgradable
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
                bra.s   @UpgradeEnemy_Loop ; fall back to enemy D2 and try again one more time
                bra.s   @CheckExcludedEnemies
@Default5:
                
                move.w  d5,d1
                bra.w   @Done
@CheckExcludedEnemies:
                
                movea.l a0,a1
                adda.w  #3,a1           ; A1 = pointer to excluded enemies list
                clr.w   d1
                move.b  (a1)+,d1
                subi.w  #1,d1           ; D1 = loop counter
@FindExcludedEnemy_Loop:
                
                move.b  (a1)+,d0
                cmp.b   d0,d3
                bne.s   @Next
                tst.w   d4
                bne.s   @Default6
                move.w  #1,d4
                move.w  d2,d3
                bra.s   @UpgradeEnemy_Loop ; fall back to enemy D2 and try again one more time
                bra.s   @Next
@Default6:
                
                move.w  d5,d1
                bra.w   @Done
@Next:
                
                dbf     d1,@FindExcludedEnemy_Loop
                
                clr.w   d1
                move.b  d3,d1           ; D1 = upgraded enemy index
@Done:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function UpgradeEnemyIndex


; =============== S U B R O U T I N E =======================================

; Check if Jaro has joined the Force
; 
;       Out: D1 = 0 if false, 1 if true


HasJaroJoinedTheForce:
                
                movem.l d0/d2-a6,-(sp)
                jsr     j_UpdateForce
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  (a0),d7
                subi.w  #1,d7
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.l   d6
@Loop:
                
                clr.w   d0
                move.b  (a0,d6.w),d0
                cmpi.b  #ALLY_JARO,d0
                bne.s   @Next           ; keep checking force members until we either find Jaro or reach end of the list
                move.w  #1,d1
                bra.w   @Found          ; Jaro is found, so we're done
@Next:
                
                addi.w  #1,d6
                dbf     d7,@Loop
                clr.w   d1              ; reached end of the list without finding Jaro
@Found:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function HasJaroJoinedTheForce

