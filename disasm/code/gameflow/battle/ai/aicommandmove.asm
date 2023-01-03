
; ASM FILE code\gameflow\battle\ai\aicommandmove.asm :
; 0xF1D4..0xF522 : AI command : Move

; =============== S U B R O U T I N E =======================================

; In: D0 = character index (mover)
;     D1 = extra AI variable (values of 0-2)

var_98 = -98
var_96 = -96
var_95 = -95
var_48 = -48
var_47 = -47

ExecuteAiCommand_Move:
                
                movem.l d0/d3-a6,-(sp)
                link    a6,#-100
                move.w  d0,d7           ; character index of the moving unit
                move.b  d1,var_98(a6)
                tst.b   d1
                beq.s   loc_F1FE
                cmpi.b  #1,d1
                bne.s   loc_F1F2
                jsr     j_GetMoveListForEnemyTarget
loc_F1F2:
                
                cmpi.b  #2,d1
                bne.s   loc_F1FE
                jsr     sub_1AC030      
loc_F1FE:
                
                bsr.w   GetMoveInfo     
                move.w  #$80,d0 
                bsr.w   MakeRangeLists
                bsr.w   MakeTargetsList_Everybody
                move.w  d7,d0
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   @NotMuddled
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                clr.w   d6
                bra.s   @Ally
@Enemy:
                
                clr.w   d6
                move.w  #COMBATANT_ENEMIES_START,d6
@Ally:
                
                bra.w   loc_F39E
@NotMuddled:
                
                move.w  d7,d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @TargetAllies
                move.w  #COMBATANT_ENEMIES_START,d0
                move.w  #COMBATANT_ENEMIES_COUNTER,d6
                bra.s   @PrepareTargetList
@TargetAllies:
                
                clr.w   d0
                move.w  #COMBATANT_ALLIES_COUNTER,d6
@PrepareTargetList:
                
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d2
@TargetCombatant_Loop:
                
                bsr.w   GetCurrentHP    ; iterate through combatants
                tst.w   d1
                bne.s   @CheckOnMap_X
                bra.w   @NextCombatant
@CheckOnMap_X:
                
                bsr.w   GetXPos
                tst.b   d1
                bpl.s   @CheckOnMap_Y
                bra.w   @NextCombatant
@CheckOnMap_Y:
                
                bsr.w   GetYPos
                tst.b   d1
                bpl.s   @AddToTargetList
                bra.w   @NextCombatant
@AddToTargetList:
                
                move.b  d0,(a0,d2.w)    ; add to targets if alive and on map
                addi.w  #1,d2
@NextCombatant:
                
                addq.w  #1,d0
                dbf     d6,@TargetCombatant_Loop
                
                move.w  d2,((TARGETS_LIST_LENGTH-$1000000)).w
                move.w  d2,d6
                clr.w   d2
@MoveCostToTarget_Loop:
                
                clr.w   d0
                move.b  (a0,d2.w),d0
                bsr.w   GetMoveCostToEntity
                move.b  d0,var_96(a6,d2.w)
                addi.w  #1,d2
                subq.w  #1,d6
                bne.s   @MoveCostToTarget_Loop
                
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d1
                cmpi.w  #1,d1
                bgt.s   loc_F2A8
                bra.w   loc_F39A
loc_F2A8:
                
                subq.w  #2,d1
                move.b  #0,d2
                lea     ((TARGETS_LIST-$1000000)).w,a0
loc_F2B2:
                
                tst.b   d2
                bpl.s   loc_F2BA
                bra.w   loc_F2F6
loc_F2BA:
                
                move.b  #$FF,d2
                clr.w   d3
loc_F2C0:
                
                move.b  var_95(a6,d3.w),d4
                cmp.b   var_96(a6,d3.w),d4
                bcc.s   loc_F2E8
                move.b  var_95(a6,d3.w),d4
                move.b  var_96(a6,d3.w),var_95(a6,d3.w)
                move.b  d4,var_96(a6,d3.w)
                move.b  1(a0,d3.w),d4
                move.b  (a0,d3.w),1(a0,d3.w)
                move.b  d4,(a0,d3.w)
                move.w  d3,d2
loc_F2E8:
                
                tst.w   d1
                beq.s   loc_F2F2
                addq.w  #1,d3
                subq.w  #1,d1
                bra.s   loc_F2C0
loc_F2F2:
                
                move.w  d2,d1
                bra.s   loc_F2B2
loc_F2F6:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_F300
                bra.w   loc_F39A
loc_F300:
                
                clr.w   d0
                move.b  d7,d0
                bsr.w   GetMoveType     
                lea     (pt_AttackPriorityForMoveType).l,a1
                lsl.l   #2,d1
                movea.l (a1,d1.l),a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d6
                clr.w   d5
@CheckTargetClass_Loop:
                
                clr.w   d0
                move.b  (a0,d5.w),d0
                bsr.w   GetClass        
                move.b  d1,d4
                clr.w   d3
                move.w  #CLASS_NUMBER_TOTAL,d2
@CompareTargetClass_Loop:
                
                cmp.b   (a1,d3.w),d4
                bne.s   @NextClass
                move.b  d3,var_48(a6,d5.w)
                bra.w   @NextTarget
@NextClass:
                
                addq.b  #1,d3
                subq.w  #1,d2
                bne.s   @CompareTargetClass_Loop
@NextTarget:
                
                addq.b  #1,d5
                subq.w  #1,d6
                bne.s   @CheckTargetClass_Loop
                
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d6
                subi.w  #2,d6
                clr.w   d5
loc_F350:
                
                move.b  var_48(a6,d5.w),d0
                move.b  var_47(a6,d5.w),d1
                sub.b   d1,d0
                bpl.s   loc_F35E
                neg.b   d0
loc_F35E:
                
                cmpi.b  #1,d0
                bgt.s   loc_F392
                move.b  (a0,d5.w),d0
                sub.b   1(a0,d5.w),d0
                bpl.s   loc_F370
                neg.b   d0
loc_F370:
                
                cmpi.b  #3,d0
                bgt.s   loc_F392
                move.b  var_48(a6,d5.w),d0
                move.b  d0,var_47(a6,d5.w)
                move.b  d1,var_48(a6,d5.w)
                move.b  (a0,d5.w),d0
                move.b  1(a0,d5.w),d1
                move.b  d0,1(a0,d5.w)
                move.b  d1,(a0,d5.w)
loc_F392:
                
                addi.w  #1,d5
                dbf     d6,loc_F350
loc_F39A:
                
                clr.w   d6
                move.b  (a0),d6
loc_F39E:
                
                clr.w   d0
                move.b  d7,d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.w   @BasicMovement
                bsr.w   GetEnemyIndex   
                cmpi.b  #ENEMY_KRAKEN_LEG,d1 ; HARDCODED enemy indexes
                bne.s   @CheckKrakenArm
                bra.w   @SpecialMoveCosts
@CheckKrakenArm:
                
                cmpi.b  #ENEMY_KRAKEN_ARM,d1
                bne.s   @CheckKrakenHead
                bra.w   @SpecialMoveCosts
@CheckKrakenHead:
                
                cmpi.b  #ENEMY_KRAKEN_HEAD,d1
                bne.s   @NoMoveTable
                bra.w   @SpecialMoveCosts
@NoMoveTable:
                
                bra.w   @BasicMovement
@SpecialMoveCosts:
                
                jsr     j_ClearTerrainListObstructions
                move.b  d6,d0
                bsr.w   GetYPos
                move.w  d1,d4
                bsr.w   GetXPos
                move.w  d1,d3
                move.w  #$80,d0 
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN).l,a4
                lea     tbl_KrakenMoveCosts(pc), a5
                nop
                bra.w   @CommitMoveString
@BasicMovement:
                
                jsr     j_ClearTerrainListObstructions
                clr.w   d0
                move.b  d7,d0
                bsr.w   MemorizePath    
                move.b  d6,d0
                bsr.w   GetYPos
                move.w  d1,d4
                bsr.w   GetXPos
                move.w  d1,d3
                move.w  #$80,d0 
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN).l,a4
                lea     ((MOVE_COSTS_LIST-$1000000)).w,a5
@CommitMoveString:
                
                bsr.w   MakeRangeLists
                move.b  d7,d0
                bsr.w   GetXPos
                move.w  d1,d2
                move.w  #4,d3
                bsr.w   GetYPos
                move.w  d2,d0
                bsr.w   j_makeEnemyMoveOrder
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d0
                cmpi.b  #$FF,d0
                bne.s   loc_F476        
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_F512
loc_F476:
                
                move.b  var_98(a6),d1   ; special AI d1 value between 0-2
                tst.b   d1
                beq.s   loc_F49A        ; if d1 = 0, then no additional work
                cmpi.b  #1,d1
                bne.s   loc_F48C
                move.b  d7,d0           ; d7 = character index of the moving unit
                jsr     j_GetMoveListForEnemyTarget ; if d1 = 1
loc_F48C:
                
                cmpi.b  #2,d1
                bne.s   loc_F49A
                move.b  d7,d0
                jsr     sub_1AC030      ; if d1 = 2
loc_F49A:
                
                move.w  d7,d0
                move.w  #$FFFF,d3
                bsr.w   UpdateTargetsList
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                bsr.w   MakeTargetsList_Everybody
                move.w  #0,d3
                move.w  d7,d0
                bsr.w   UpdateTargetsList
                clr.w   d0
                move.b  d7,d0
                bsr.w   GetEnemyDestination
                clr.w   d3
                clr.w   d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                bne.s   loc_F4FE
                move.b  d7,d0
                bsr.w   GetEnemyDestination
                move.w  #1,d3
                move.w  #1,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                bne.s   loc_F4FE
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_F512
loc_F4FE:
                
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   MakeAiMoveString
loc_F512:
                
                jsr     j_ClearTerrainListObstructions
                clr.w   d1
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function ExecuteAiCommand_Move

