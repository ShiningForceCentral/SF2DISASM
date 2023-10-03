
; ASM FILE code\gameflow\battle\ai\aicommandspecialmove.asm :
; 0xE98C..0xEBA4 : AI command : Special Move

; =============== S U B R O U T I N E =======================================

; Move scripts (move to point, follow ally, follow force member)
; 
; Out: d1.b = -1 if command failed to execute

var_4 = -4
var_3 = -3
teammateToFollow = -2
movingCombatant = -1

ExecuteAiCommand_SpecialMove:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-6
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_E9B2
                
                move.b  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   loc_EB7A
loc_E9B2:
                
                move.b  d0,movingCombatant(a6)
                move.b  d1,teammateToFollow(a6)
                move.b  d2,var_4(a6)
                bsr.w   GetCurrentMov
                tst.b   d1
                bne.s   @CanMove
                
                move.b  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   loc_EB7A
@CanMove:
                
                bsr.w   GetAiSpecialMoveOrders
                cmpi.b  #-1,d1
                bne.s   loc_EA00
                
                move.b  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   loc_EB7A
loc_EA00:
                
                move.b  d1,var_3(a6)
                btst    #6,d1
                bne.s   loc_EA2E
                clr.w   d0
                move.b  d1,d0
                bsr.w   GetCurrentHp
                tst.w   d1
                bne.s   loc_EA2E
                
                move.b  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   loc_EB7A
loc_EA2E:
                
                move.b  teammateToFollow(a6),d0
                tst.b   d0
                bne.w   loc_EAE6
                move.b  movingCombatant(a6),d0
                move.w  #-1,d3
                bsr.w   UpdateBattleTerrainOccupiedByAllies
                bsr.w   InitializeMovementArrays
                bsr.w   PopulateMovementArrays
                clr.w   d3
                bsr.w   UpdateBattleTerrainOccupiedByAllies
                clr.w   d0
                move.b  movingCombatant(a6),d0
                bsr.w   sub_CE96
                tst.b   d1
                bne.s   loc_EA78
                
                move.w  #-1,d1
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
loc_EA78:
                
                jsr     j_ClearBattleTerrainArrayObstructionFlags
                move.b  movingCombatant(a6),d0
                jsr     sub_1AC028      
                move.b  movingCombatant(a6),d0
                clr.w   d1
                bsr.w   ExecuteAiCommand_Attack
                tst.b   d1
                bne.s   loc_EA9C
                clr.w   d1
                bra.w   loc_EB7A
loc_EA9C:
                
                jsr     j_ClearBattleTerrainArrayObstructionFlags
                move.b  movingCombatant(a6),d0
                move.b  var_3(a6),d1
                bsr.w   sub_F7A0        
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #-1,d1
                bne.s   loc_EAD4
                
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
                move.w  #-1,d1
                bra.s   loc_EAE2
loc_EAD4:
                
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                clr.w   d1
                bra.w   loc_EB7A
loc_EAE2:
                
                bra.w   loc_EB7A
loc_EAE6:
                
                clr.w   d0
                move.b  movingCombatant(a6),d0
                move.b  teammateToFollow(a6),d1
                bsr.w   sub_D430
                tst.b   d1
                bne.s   loc_EB10
                
                move.w  #-1,d1
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
loc_EB10:
                
                jsr     j_ClearBattleTerrainArrayObstructionFlags
                move.b  movingCombatant(a6),d0
                jsr     sub_1AC028      
                move.b  movingCombatant(a6),d0
                clr.w   d1
                bsr.w   ExecuteAiCommand_Attack
                tst.b   d1
                bne.s   loc_EB34
                clr.w   d1
                bra.w   loc_EB7A
loc_EB34:
                
                jsr     j_ClearBattleTerrainArrayObstructionFlags
                move.b  movingCombatant(a6),d0
                move.b  var_3(a6),d1
                bsr.w   sub_F7A0        
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #-1,d1
                bne.s   loc_EB6C
                
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
                move.w  #-1,d1
                bra.s   loc_EB7A
loc_EB6C:
                
                clr.w   d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   *+4
loc_EB7A:
                
                clr.w   d2
                move.b  var_4(a6),d2
                tst.w   d2
                beq.s   loc_EB9C
                cmpi.w  #1,d2
                bne.s   loc_EB90
                jsr     j_GetMoveListForEnemyTarget
loc_EB90:
                
                cmpi.w  #2,d2
                bne.s   loc_EB9C
                jsr     sub_1AC030      
loc_EB9C:
                
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function ExecuteAiCommand_SpecialMove

