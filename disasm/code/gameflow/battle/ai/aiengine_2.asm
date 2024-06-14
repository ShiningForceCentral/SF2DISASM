
; ASM FILE code\gameflow\battle\ai\aiengine_2.asm :
; 0xF522..0xF9B4 : AI engine

; =============== S U B R O U T I N E =======================================

; Randomly move an AI controlled combatant around a designated position when not activated.
; 
; In: d0.w = attacker combatant

moveCount = -4
attacker = -3
startingY = -2
startingX = -1

DetermineStandbyAiMovement:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.b  d0,attacker(a6)
                
                ; Determine 3/8 chance to stay put in the most roundabout way
                move.w  #8,d6
                jsr     j_GenerateRandomNumberUnderD6
                cmpi.b  #2,d7
                bne.s   @loc1
                
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #-1,(a2)
                bra.w   @loc23
@loc1:
                
                cmpi.b  #4,d7
                bne.s   @loc2
                
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #-1,(a2)
                bra.w   @loc23
@loc2:
                
                cmpi.b  #6,d7
                bne.s   @determineMoveOrder
                
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #-1,(a2)
                bra.w   @loc23
@determineMoveOrder:
                
                bsr.w   sub_F8EA        
                tst.b   d1
                beq.s   @isSpecialMove
                
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #-1,(a2)
                bra.w   @loc23
@isSpecialMove:
                
                tst.b   d2
                bne.s   @specialMove
                
                ; Perform regular movement
                clr.w   d0
                move.b  attacker(a6),d0
                jsr     j_GetCombatantStartingPosition
                move.b  d1,startingX(a6)
                move.b  d2,startingY(a6)
                bra.s   @loc6
@specialMove:
                
                clr.w   d0
                move.b  attacker(a6),d0
                bsr.w   GetAiSpecialMoveOrders
                move.w  d1,d0
                jsr     j_GetAiSpecialMoveOrderCoordinates
                move.b  d1,startingX(a6)
                move.b  d1,startingY(a6)
@loc6:
                
                move.b  attacker(a6),d0
                bsr.w   InitializeMovementArrays
                bsr.w   PopulateMovementArrays
                bsr.w   PopulateTargetsArrayWithAllCombatants
                lea     (byte_FFB1DC).l,a0
                clr.w   d0
                move.b  attacker(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                clr.w   d1
                move.b  (a0),d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                tst.b   d1
                bne.s   @loc8
                
                clr.w   d6
                move.w  #2,d6
                jsr     j_GenerateRandomNumberUnderD6
                tst.b   d7
                bne.s   @loc7
                
                move.b  #4,d1
                move.b  d1,(a0)
                bra.s   @loc8
@loc7:
                
                move.b  #3,d1
                move.b  d1,(a0)
@loc8:
                
                move.b  d1,moveCount(a6)
                clr.l   d5
                move.b  d1,d5
                subi.l  #1,d5
                clr.w   d1
                move.b  (a0),d1
                lsr.w   #NIBBLE_SHIFT_COUNT,d1
                move.w  d1,d6
                clr.w   d7
                lea     pt_StandbyAiMovements(pc), a1
                nop
                move.b  moveCount(a6),d7
                subi.b  #3,d7
                lsl.l   #2,d7
                movea.l (a1,d7.w),a1
                clr.w   d7
                clr.w   d0
                clr.w   d3
@loc9:
                
                clr.w   d1
                clr.w   d2
                move.b  (a1,d0.w),d1
                move.b  1(a1,d0.w),d2
                add.b   startingX(a6),d1
                add.b   startingY(a6),d2
                tst.b   d1
                bpl.s   @loc10
                bra.w   @loc15
@loc10:
                
                cmpi.b  #MAP_SIZE_MAX_TILEWIDTH,d1
                ble.s   @loc11
                bra.w   @loc15
@loc11:
                
                tst.b   d2
                bpl.s   @loc12
                bra.w   @loc15
@loc12:
                
                cmpi.b  #MAP_SIZE_MAX_TILEHEIGHT,d2
                ble.s   @loc13
                bra.w   @loc15
@loc13:
                
                move.l  d3,-(sp)
                clr.w   d3
                clr.w   d4
                bsr.w   GetClosestAttackPosition
                move.l  (sp)+,d3
                cmpi.b  #-1,d1
                bne.s   @loc14
                bra.w   @loc15
@loc14:
                
                bset    d3,d7
@loc15:
                
                addi.w  #2,d0
                addi.w  #1,d3
                dbf     d5,@loc9
                
                bclr    d6,d7
                tst.b   d7
                bne.s   @loc16
                
                lea     (byte_FFB1DC).l,a0
                clr.w   d0
                move.b  attacker(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                move.b  #0,(a0)
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #-1,(a2)
                bra.w   @loc23
@loc16:
                
                move.w  d7,d5
                move.w  #3,d4
                clr.w   d0
@loc17:
                
                lsr.w   #1,d5
                bcc.s   @loc18
                addi.b  #1,d0
@loc18:
                
                dbf     d4,@loc17
                
                move.w  d7,d5
                move.w  d0,d6
                jsr     j_GenerateRandomNumberUnderD6
                clr.l   d4
                move.b  moveCount(a6),d4
                subi.w  #1,d4
                clr.w   d0
                clr.w   d1
@loc19:
                
                lsr.w   #1,d5
                bcc.s   @loc21
                cmp.b   d7,d0
                bne.s   @loc20
                bra.w   @loc22
@loc20:
                
                addi.b  #1,d0
@loc21:
                
                addi.b  #1,d1
                dbf     d4,@loc19
@loc22:
                
                lea     (byte_FFB1DC).l,a0
                clr.w   d0
                move.b  attacker(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                move.b  (a0),d0
                move.b  d1,d2
                lsl.w   #NIBBLE_SHIFT_COUNT,d2
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d2
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d0
                or.b    d2,d0
                move.b  d0,(a0)
                clr.l   d7
                move.b  d1,d7
                lsl.w   #1,d7
                move.b  (a1,d7.w),d0
                move.b  1(a1,d7.w),d1
                add.b   startingX(a6),d0
                add.b   startingY(a6),d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   BuildAiMoveString
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
@loc23:
                
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function DetermineStandbyAiMovement

pt_StandbyAiMovements:
                dc.l table_StandbyAiMovements1 ; relative coordinates used for AI controlled movement
                dc.l table_StandbyAiMovements2
table_StandbyAiMovements1:
                dc.b 0, -1
                dc.b -1, 1
                dc.b 1, 1
table_StandbyAiMovements2:
                dc.b 0, -1
                dc.b -1, 0
                dc.b 0, 1
                dc.b 1, 0

; =============== S U B R O U T I N E =======================================

; In: d0.b = moving combatant index
;     d1.b = teammate to follow combatant index

destinationX = -4
destinationY = -3
teammateToFollow = -2
movingCombatant = -1

sub_F7A0:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.b  d0,movingCombatant(a6)
                move.b  d1,teammateToFollow(a6)
                clr.w   d0
                move.b  movingCombatant(a6),d0
                bsr.w   PopulateMovecostsTable
                move.b  teammateToFollow(a6),d0
                jsr     j_GetAiSpecialMoveOrderCoordinates
                move.w  d1,d3
                move.w  d2,d4
                move.w  #128,d0         ; HARDCODED move value
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN_ARRAY).l,a4
                lea     ((MOVECOSTS_TABLE-$1000000)).w,a5
                bsr.w   PopulateMovementArrays
                move.w  #-1,d3
                bsr.w   UpdateMovableGridArray
                bsr.w   PopulateTargetsArrayWithAllCombatants
                clr.w   d0
                move.b  movingCombatant(a6),d0
                bsr.w   GetCombatantX
                move.w  d1,d2
                bsr.w   GetCurrentMov
                move.w  d1,d3
                add.w   d3,d3           ; d3.w = move value (MOV*2)
                bsr.w   GetCombatantY
                move.w  d2,d0
                bsr.w   BuildMoveString 
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d0
                cmpi.b  #-1,d0
                bne.s   loc_F820
                bra.w   loc_F8E2
loc_F820:
                
                clr.w   d0
                move.b  movingCombatant(a6),d0
                bsr.w   GetEnemyDestination
                move.b  d1,destinationX(a6)
                move.b  d2,destinationY(a6)
                move.w  #-1,d3
                bsr.w   UpdateBattleTerrainOccupiedByAllies
                move.b  movingCombatant(a6),d0
                bsr.w   InitializeMovementArrays
                bsr.w   PopulateMovementArrays
                move.w  #0,d3
                bsr.w   UpdateBattleTerrainOccupiedByAllies
                move.b  destinationX(a6),d1
                move.b  destinationY(a6),d2
                clr.w   d3
                clr.w   d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #-1,d1
                beq.s   loc_F868
                bra.w   loc_F8CE
loc_F868:
                
                move.b  destinationX(a6),d1
                move.b  destinationY(a6),d2
                move.w  #1,d3
                move.w  #1,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #-1,d1
                beq.s   loc_F886
                bra.w   loc_F8CE
loc_F886:
                
                move.b  destinationX(a6),d1
                move.b  destinationY(a6),d2
                move.w  #2,d3
                move.w  #2,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #-1,d1
                beq.s   loc_F8A4
                bra.w   loc_F8CE
loc_F8A4:
                
                move.b  destinationX(a6),d1
                move.b  destinationY(a6),d2
                move.w  #3,d3
                move.w  #3,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #-1,d1
                beq.s   loc_F8C2
                bra.w   loc_F8CE
loc_F8C2:
                
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   loc_F8E2
loc_F8CE:
                
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   BuildAiMoveString
loc_F8E2:
                
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_F7A0


; =============== S U B R O U T I N E =======================================

; Out: d1.w = 0 if allowed to move
;      d2.w != 0 if combatant is set to perform a special move order

secondAiPoint = -4
combatantToFollow = -3
aiActivationRegion2 = -2
aiActivationRegion1 = -1

sub_F8EA:
                
                movem.l d0/d3-a6,-(sp)
                link    a6,#-4
                move.w  d0,d7
                bsr.w   GetAiSpecialMoveOrders
                move.b  d1,combatantToFollow(a6)
                move.b  d2,secondAiPoint(a6)
                bsr.w   GetAiRegion     
                move.b  d1,aiActivationRegion1(a6)
                move.b  d2,aiActivationRegion2(a6)
                move.b  combatantToFollow(a6),d0
                cmpi.b  #-1,d0
                beq.s   @checkSecondAiPoint
                
                cmpi.b  #15,d1
                beq.s   @checkSecondAiPoint
                
                move.b  #1,d1
                bra.w   @loc6
@checkSecondAiPoint:
                
                move.b  secondAiPoint(a6),d0
                cmpi.b  #-1,d0
                beq.s   @checkCombatantToFollow
                
                cmpi.b  #15,d2
                beq.s   @checkCombatantToFollow
                
                move.b  #1,d1
                bra.w   @loc6
@checkCombatantToFollow:
                
                move.b  combatantToFollow(a6),d0
                cmpi.b  #-1,d0
                beq.s   @loc3
                
                ; If set to follow a combatant
                move.b  aiActivationRegion1(a6),d0
                cmpi.b  #15,d0
                bne.s   @loc3
                
                move.b  secondAiPoint(a6),d0
                cmpi.b  #-1,d0
                bne.s   @loc3
                
                move.b  aiActivationRegion2(a6),d0
                cmpi.b  #15,d0
                beq.s   @loc3
                
                clr.w   d1
                move.b  #1,d2
                bra.w   @loc6
@loc3:
                
                move.b  combatantToFollow(a6),d0
                cmpi.b  #-1,d0
                bne.s   @loc4
                
                ; If not set to follow a combatant
                move.b  aiActivationRegion1(a6),d0
                cmpi.b  #15,d0
                beq.s   @loc4
                clr.w   d1
                clr.w   d2
                bra.w   @loc6
@loc4:
                
                move.b  secondAiPoint(a6),d0
                cmpi.b  #-1,d0
                bne.s   @loc5
                
                move.b  aiActivationRegion2(a6),d0
                cmpi.b  #15,d0
                beq.s   @loc5
                clr.w   d1
                clr.w   d2
                bra.w   @loc6
@loc5:
                
                move.w  #1,d1
                clr.w   d2
@loc6:
                
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function sub_F8EA

