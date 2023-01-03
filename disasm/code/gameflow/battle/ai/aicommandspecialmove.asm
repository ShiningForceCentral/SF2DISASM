
; ASM FILE code\gameflow\battle\ai\aicommandspecialmove.asm :
; 0xE98C..0xEBA4 : AI command : Special Move

; =============== S U B R O U T I N E =======================================

; Move scripts (move to point, follow ally, follow force member)

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

ExecuteAiCommand_SpecialMove:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-6
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_E9B2
                move.b  #$FF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   loc_EB7A
loc_E9B2:
                
                move.b  d0,var_1(a6)
                move.b  d1,var_2(a6)
                move.b  d2,var_4(a6)
                bsr.w   GetCurrentMOV
                tst.b   d1
                bne.s   @CanMove
                move.b  #$FF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   loc_EB7A
@CanMove:
                
                bsr.w   GetAiSpecialMoveOrders
                cmpi.b  #$FF,d1
                bne.s   loc_EA00
                move.b  #$FF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   loc_EB7A
loc_EA00:
                
                move.b  d1,var_3(a6)
                btst    #6,d1
                bne.s   loc_EA2E
                clr.w   d0
                move.b  d1,d0
                bsr.w   GetCurrentHP
                tst.w   d1
                bne.s   loc_EA2E
                move.b  #$FF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   loc_EB7A
loc_EA2E:
                
                move.b  var_2(a6),d0
                tst.b   d0
                bne.w   loc_EAE6
                move.b  var_1(a6),d0
                move.w  #$FFFF,d3
                bsr.w   UpdateTargetsList_Allies
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                clr.w   d3
                bsr.w   UpdateTargetsList_Allies
                clr.w   d0
                move.b  var_1(a6),d0
                bsr.w   sub_CE96
                tst.b   d1
                bne.s   loc_EA78
                move.w  #$FFFF,d1
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
loc_EA78:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                jsr     sub_1AC028      
                move.b  var_1(a6),d0
                clr.w   d1
                bsr.w   ExecuteAiCommand_Attack
                tst.b   d1
                bne.s   loc_EA9C
                clr.w   d1
                bra.w   loc_EB7A
loc_EA9C:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                move.b  var_3(a6),d1
                bsr.w   sub_F7A0
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #$FF,d1
                bne.s   loc_EAD4
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
                move.w  #$FFFF,d1
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
                move.b  var_1(a6),d0
                move.b  var_2(a6),d1
                bsr.w   sub_D430
                tst.b   d1
                bne.s   loc_EB10
                move.w  #$FFFF,d1
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
loc_EB10:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                jsr     sub_1AC028      
                move.b  var_1(a6),d0
                clr.w   d1
                bsr.w   ExecuteAiCommand_Attack
                tst.b   d1
                bne.s   loc_EB34
                clr.w   d1
                bra.w   loc_EB7A
loc_EB34:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                move.b  var_3(a6),d1
                bsr.w   sub_F7A0
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #$FF,d1
                bne.s   loc_EB6C
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
                move.w  #$FFFF,d1
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

