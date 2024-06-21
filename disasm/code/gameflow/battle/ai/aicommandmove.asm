
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
                move.w  d0,d7           ; d0.w, d7.w = combatant index of the moving entity
                move.b  d1,var_98(a6)
                tst.b   d1
                beq.s   @loc_2
                
                cmpi.b  #1,d1
                bne.s   @loc_1
                jsr     j_AdjustObstructionFlagsForAiWithSecondaryCharacteristic1
@loc_1:
                
                cmpi.b  #2,d1
                bne.s   @loc_2
                jsr     j_AdjustObstructionFlagsForAiWithSecondaryCharacteristic2
@loc_2:
                
                bsr.w   InitializeMovementArrays
                move.w  #128,d0         ; HARDCODED move value
                bsr.w   PopulateMovementArrays
                bsr.w   PopulateTargetsArrayWithAllCombatants
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
                
                bra.w   @loc_31
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
                
                bsr.w   GetCurrentHp    ; iterate through combatants
                tst.w   d1
                bne.s   @CheckOnMap_X
                bra.w   @NextCombatant
@CheckOnMap_X:
                
                bsr.w   GetCombatantX
                tst.b   d1
                bpl.s   @CheckOnMap_Y
                bra.w   @NextCombatant
@CheckOnMap_Y:
                
                bsr.w   GetCombatantY
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
                bgt.s   @loc_14
                bra.w   @loc_30
@loc_14:
                
                subq.w  #2,d1
                move.b  #0,d2
                lea     ((TARGETS_LIST-$1000000)).w,a0
@loc_15:
                
                tst.b   d2
                bpl.s   @loc_16
                bra.w   @loc_20
@loc_16:
                
                move.b  #-1,d2
                clr.w   d3
@loc_17:
                
                move.b  var_95(a6,d3.w),d4
                cmp.b   var_96(a6,d3.w),d4
                bcc.s   @loc_18
                move.b  var_95(a6,d3.w),d4
                move.b  var_96(a6,d3.w),var_95(a6,d3.w)
                move.b  d4,var_96(a6,d3.w)
                move.b  1(a0,d3.w),d4
                move.b  (a0,d3.w),1(a0,d3.w)
                move.b  d4,(a0,d3.w)
                move.w  d3,d2
@loc_18:
                
                tst.w   d1
                beq.s   @loc_19
                addq.w  #1,d3
                subq.w  #1,d1
                bra.s   @loc_17
@loc_19:
                
                move.w  d2,d1
                bra.s   @loc_15
@loc_20:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @loc_21
                bra.w   @loc_30
@loc_21:
                
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
@loc_26:
                
                move.b  var_48(a6,d5.w),d0
                move.b  var_47(a6,d5.w),d1
                sub.b   d1,d0
                bpl.s   @loc_27
                neg.b   d0
@loc_27:
                
                cmpi.b  #1,d0
                bgt.s   @loc_29
                move.b  (a0,d5.w),d0
                sub.b   1(a0,d5.w),d0
                bpl.s   @loc_28
                neg.b   d0
@loc_28:
                
                cmpi.b  #3,d0
                bgt.s   @loc_29
                move.b  var_48(a6,d5.w),d0
                move.b  d0,var_47(a6,d5.w)
                move.b  d1,var_48(a6,d5.w)
                move.b  (a0,d5.w),d0
                move.b  1(a0,d5.w),d1
                move.b  d0,1(a0,d5.w)
                move.b  d1,(a0,d5.w)
@loc_29:
                
                addi.w  #1,d5
                dbf     d6,@loc_26
@loc_30:
                
                clr.w   d6
                move.b  (a0),d6
@loc_31:
                
                clr.w   d0
                move.b  d7,d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.w   @BasicMovement
                bsr.w   GetEnemy        
                cmpi.b  #ENEMY_KRAKEN_LEG,d1 ; HARDCODED enemy indexes
                bne.s   @CheckKrakenArm
                bra.w   @SpecialMovecosts
@CheckKrakenArm:
                
                cmpi.b  #ENEMY_KRAKEN_ARM,d1
                bne.s   @CheckKrakenHead
                bra.w   @SpecialMovecosts
@CheckKrakenHead:
                
                cmpi.b  #ENEMY_KRAKEN_HEAD,d1
                bne.s   @NoMoveTable
                bra.w   @SpecialMovecosts
@NoMoveTable:
                
                bra.w   @BasicMovement
@SpecialMovecosts:
                
                jsr     j_ClearBattleTerrainArrayObstructionFlags
                move.b  d6,d0
                bsr.w   GetCombatantY
                move.w  d1,d4
                bsr.w   GetCombatantX
                move.w  d1,d3
                move.w  #$80,d0 
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN_ARRAY).l,a4
                lea     table_KrakenMovecosts(pc), a5
                nop
                bra.w   @CommitMoveString
@BasicMovement:
                
                jsr     j_ClearBattleTerrainArrayObstructionFlags
                clr.w   d0
                move.b  d7,d0
                bsr.w   PopulateMovecostsTable
                move.b  d6,d0
                bsr.w   GetCombatantY
                move.w  d1,d4
                bsr.w   GetCombatantX
                move.w  d1,d3
                move.w  #$80,d0 
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN_ARRAY).l,a4
                lea     ((MOVECOSTS_TABLE-$1000000)).w,a5
@CommitMoveString:
                
                bsr.w   PopulateMovementArrays
                move.b  d7,d0
                bsr.w   GetCombatantX
                move.w  d1,d2
                move.w  #4,d3           ; HARDCODED move value
                bsr.w   GetCombatantY
                move.w  d2,d0
                bsr.w   BuildMoveString 
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d0
                cmpi.b  #-1,d0
                bne.s   @loc_38         
                
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   @loc_42
@loc_38:
                
                move.b  var_98(a6),d1   ; special AI d1 value between 0-2
                tst.b   d1
                beq.s   @loc_40         ; if d1 = 0, then no additional work
                cmpi.b  #1,d1
                bne.s   @loc_39
                move.b  d7,d0           ; d7 = character index of the moving unit
                jsr     j_AdjustObstructionFlagsForAiWithSecondaryCharacteristic1 
                                                        ; if d1 = 1
@loc_39:
                
                cmpi.b  #2,d1
                bne.s   @loc_40
                move.b  d7,d0
                jsr     j_AdjustObstructionFlagsForAiWithSecondaryCharacteristic2 
                                                        ; if d1 = 2
@loc_40:
                
                move.w  d7,d0
                move.w  #-1,d3
                bsr.w   UpdateBattleTerrainOccupiedByOpponents
                bsr.w   InitializeMovementArrays
                bsr.w   PopulateMovementArrays
                bsr.w   PopulateTargetsArrayWithAllCombatants
                move.w  #0,d3
                move.w  d7,d0
                bsr.w   UpdateBattleTerrainOccupiedByOpponents
                clr.w   d0
                move.b  d7,d0
                bsr.w   GetEnemyDestination
                clr.w   d3
                clr.w   d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #-1,d1
                bne.s   @loc_41
                move.b  d7,d0
                bsr.w   GetEnemyDestination
                move.w  #1,d3
                move.w  #1,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #-1,d1
                bne.s   @loc_41
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   @loc_42
@loc_41:
                
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   BuildAiMoveString
@loc_42:
                
                jsr     j_ClearBattleTerrainArrayObstructionFlags
                clr.w   d1
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function ExecuteAiCommand_Move

