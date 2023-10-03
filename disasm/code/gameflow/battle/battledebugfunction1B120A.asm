
; ASM FILE code\gameflow\battle\battledebugfunction1B120A.asm :
; 0x1B120A..0x1B1272 : unused

; =============== S U B R O U T I N E =======================================

; Never called, probably what remains of some debugging code ?


BattleDebugFunction1B120A:
                
                moveq   #ITEM_ANGEL_WING,d1
                jsr     j_AddItemToCaravan
                moveq   #ITEM_FAIRY_TEAR,d1
                jsr     j_AddItemToCaravan
                moveq   #4,d1
                jsr     j_RemoveItemFromCaravan
                moveq   #0,d1
                jsr     j_RemoveItemFromCaravan
                moveq   #0,d1
                jsr     j_RemoveItemFromCaravan
                moveq   #0,d1
                jsr     j_RemoveItemFromCaravan
                moveq   #ALLY_BOWIE,d0
                jsr     j_JoinForce
                setSavedByte #BATTLE_VERSUS_ALL_BOSSES, CURRENT_BATTLE
                jsr     j_InitializeEnemyList
                bsr.w   InitializeAllAlliesBattlePositions
                bsr.w   InitializeAllEnemiesBattlePositions
                move.b  #$80,d0
                moveq   #0,d1
                jsr     j_SetCombatantX
                move.w  #$AAAA,d1
                bsr.w   ResetEnemyStatsForRespawn
                bsr.w   GetAiSpecialMoveOrderCoordinates
loc_1B126E:
                
                bra.s   loc_1B126E
                rts

    ; End of function BattleDebugFunction1B120A

