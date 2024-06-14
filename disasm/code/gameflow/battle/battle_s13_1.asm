
; ASM FILE code\gameflow\battle\battle_s13_1.asm :
; 0x1AC38E..0x1AC9B8 : Battle init, terrain, AI stuff to split more properly

; =============== S U B R O U T I N E =======================================

; AI-related


sub_1AC38E:
                
                movem.l d0/d5-a6,-(sp)
                jsr     j_GetCombatantX
                move.w  d1,d3
                jsr     j_GetCombatantY
                move.w  d1,d4
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #-1,d1
                bne.s   loc_1AC3C2
                
                cmpi.b  #-1,d2
                bne.s   loc_1AC3BE
                
                move.b  #-1,d1
                bra.w   loc_1AC434
                bra.s   loc_1AC3C0
loc_1AC3BE:
                
                move.b  d2,d0
loc_1AC3C0:
                
                bra.s   loc_1AC3C4
loc_1AC3C2:
                
                move.b  d1,d0
loc_1AC3C4:
                
                btst    #COMBATANT_BIT_SORT,d0
                bne.s   loc_1AC3DC
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   loc_1AC3DC
                move.w  #-1,d5
                bra.w   loc_1AC434
loc_1AC3DC:
                
                jsr     GetAiSpecialMoveOrderCoordinates
                clr.w   d5
                cmp.w   d3,d1
                bge.s   loc_1AC3EC
                bset    #0,d5
loc_1AC3EC:
                
                cmp.w   d4,d2
                blt.s   loc_1AC3F4
                bset    #1,d5
loc_1AC3F4:
                
                btst    #0,d5
                bne.s   loc_1AC406
                subi.w  #4,d3
                tst.w   d3
                bpl.s   loc_1AC404
                clr.w   d3
loc_1AC404:
                
                bra.s   loc_1AC414
loc_1AC406:
                
                addi.w  #4,d3
                cmpi.w  #$2F,d3 
                ble.s   loc_1AC414
                move.w  #$2F,d3 
loc_1AC414:
                
                btst    #1,d5
                beq.s   loc_1AC426
                subi.w  #4,d4
                tst.w   d4
                bpl.s   loc_1AC424
                clr.w   d4
loc_1AC424:
                
                bra.s   loc_1AC434
loc_1AC426:
                
                addi.w  #4,d4
                cmpi.w  #$2F,d4 
                ble.s   loc_1AC434
                move.w  #$2F,d4 
loc_1AC434:
                
                move.b  d5,d1
                movem.l (sp)+,d0/d5-a6
                rts

    ; End of function sub_1AC38E


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index


AdjustObstructionFlagsForAiWithSecondaryCharacteristic1:
                
                module
                movem.l d0-a6,-(sp)
                move.b  d0,d7
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #-1,d1
                bne.s   @CheckMoveOrderType
                bra.w   @Done
                bra.s   @loc2           ; unreachable code
@CheckMoveOrderType:
                
                move.b  d1,d0           ; d0.w = AI special move order
@loc2:
                
                btst    #COMBATANT_BIT_SORT,d0
                bne.s   @Continue       ; continue is ordered to move into position
                
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @Continue       ; continue if combatant to follow is alive
                bra.w   @Done
@Continue:
                
                jsr     GetAiSpecialMoveOrderCoordinates
                clr.l   d5
                clr.l   d6
                move.w  d1,d5
                move.w  d2,d6           ; d5.w,d6.w = destination X,Y
                move.w  d7,d0
                jsr     j_InitializeMovementArrays
                move.w  d5,d3
                move.w  d6,d4
                jsr     j_PopulateMovementArrays
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
                move.w  #0,d2
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                lea     (FF4D00_LOADING_SPACE).l,a1 ; Movable grid array (0 = movable space, -1 = not movable)
@OuterLoop:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
@InnerLoop:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   @IsMovableSpace
                bra.w   @NextSpace
@IsMovableSpace:
                
                move.l  d3,-(sp)
                move.w  d0,d3
                move.b  (a1,d1.w),d0
                btst    #7,d0
                beq.s   @loc7           ; skip if space is movable
                
                move.w  d3,d0
                bset    #7,d0           ; set obstruction flag
                bset    #6,d0
                move.b  d0,(a0,d1.w)
@loc7:
                
                move.l  (sp)+,d3
@NextSpace:
                
                addi.w  #1,d1
                dbf     d3,@InnerLoop
                
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a1
                addi.w  #1,d2
                dbf     d4,@OuterLoop
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function AdjustObstructionFlagsForAiWithSecondaryCharacteristic1

                modend

; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index


AdjustObstructionFlagsForAiWithSecondaryCharacteristic2:
                
                movem.l d0-a6,-(sp)
                move.b  d0,d7           ; d7.b = copy of combatant
                clr.w   d1
                move.b  d0,d1           ; d1.b = copy of combatant
                lea     (AI_LAST_TARGET_TABLE).l,a0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                move.b  (a0,d1.w),d1
                cmpi.b  #-1,d1
                beq.s   @CheckSpecialMoveOrders
                
                bsr.w   AdjustObstructionFlagsForAiTetheredToLastTarget
                bra.w   @Done
@CheckSpecialMoveOrders:
                
                move.w  d7,d0
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #-1,d1
                bne.s   @CheckMoveOrderType
                
                bra.w   @Done           ; done if no special move orders
                bra.s   @loc3           ; unreachable code
@CheckMoveOrderType:
                
                move.b  d1,d0
@loc3:
                
                btst    #COMBATANT_BIT_SORT,d0
                bne.s   @Continue       ; continue is ordered to move into position (i.e., AI point)
                
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @Continue       ; continue if combatant to follow is alive
                bra.w   @Done
@Continue:
                
                jsr     GetAiSpecialMoveOrderCoordinates
                move.w  d1,d5
                move.w  d2,d6
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
@OuterLoop:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
@InnerLoop:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   @SetFlags       
                bra.w   @Next
@SetFlags:
                
                bset    #7,d0           ; set obstruction flags
                bset    #6,d0
                move.b  d0,(a0,d1.w)
@Next:
                
                addi.w  #1,d1
                dbf     d3,@InnerLoop
                
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                dbf     d4,@OuterLoop
                
                lea     list_1AC848(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     list_1AC84B(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     list_1AC854(pc), a0
                nop
                bsr.w   sub_1AC7FE      
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function AdjustObstructionFlagsForAiWithSecondaryCharacteristic2


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index


AdjustObstructionFlagsForAiTetheredToLastTarget:
                
                movem.l d0-a6,-(sp)
                move.b  d0,d7
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #-1,d1
                bne.s   @CheckMoveOrderType
                
                bra.w   @Done
                bra.s   @loc2           ; unreachable code
@CheckMoveOrderType:
                
                move.b  d1,d0
@loc2:
                
                btst    #COMBATANT_BIT_SORT,d0
                bne.s   @Continue
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @Continue
                bra.w   @Done
@Continue:
                
                bsr.w   GetAiSpecialMoveOrderCoordinates
                move.w  d1,d5
                move.w  d2,d6
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
@OuterLoop:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
@InnerLoop:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   @SetFlags       
                bra.w   @NextSpace
@SetFlags:
                
                bset    #7,d0           ; set obstruction flags
                bset    #6,d0
                move.b  d0,(a0,d1.w)
@NextSpace:
                
                addi.w  #1,d1
                dbf     d3,@InnerLoop
                
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                dbf     d4,@OuterLoop
                
                lea     list_1AC848(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     list_1AC84B(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     list_1AC854(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     list_1AC865(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     list_1AC87E(pc), a0
                nop
                bsr.w   sub_1AC7FE      
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function AdjustObstructionFlagsForAiTetheredToLastTarget


; =============== S U B R O U T I N E =======================================

; Clear upper two bits from all entries in terrain array.


ClearBattleTerrainArrayObstructionFlags:
                
                movem.l d0-a6,-(sp)
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
@OuterLoop:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
@InnerLoop:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   @ClearFlags
                bra.w   @Next
@ClearFlags:
                
                bclr    #7,d0
                bclr    #6,d0
                move.b  d0,(a0,d1.w)
@Next:
                
                addi.w  #1,d1
                dbf     d3,@InnerLoop
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                dbf     d4,@OuterLoop
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ClearBattleTerrainArrayObstructionFlags


; =============== S U B R O U T I N E =======================================

; AI-related


sub_1AC69A:
                
                movem.l d0-a6,-(sp)
                clr.l   d7
                move.b  d0,d7
                bsr.w   sub_1AC38E      
                clr.l   d6
                clr.l   d5
                move.b  d1,d5
                tst.b   d5
                bne.s   loc_1AC6C8
                move.b  #1,d1
                bsr.w   sub_1AC728      
                move.b  #2,d1
                bsr.w   sub_1AC728      
                move.b  #3,d1
                bsr.w   sub_1AC728      
loc_1AC6C8:
                
                cmpi.b  #1,d5
                bne.s   loc_1AC6E6
                move.b  #0,d1
                bsr.w   sub_1AC728      
                move.b  #2,d1
                bsr.w   sub_1AC728      
                move.b  #3,d1
                bsr.w   sub_1AC728      
loc_1AC6E6:
                
                cmpi.b  #3,d5
                bne.s   loc_1AC704
                move.b  #0,d1
                bsr.w   sub_1AC728      
                move.b  #1,d1
                bsr.w   sub_1AC728      
                move.b  #3,d1
                bsr.w   sub_1AC728      
loc_1AC704:
                
                cmpi.b  #2,d5
                bne.s   loc_1AC722
                move.b  #0,d1
                bsr.w   sub_1AC728      
                move.b  #1,d1
                bsr.w   sub_1AC728      
                move.b  #2,d1
                bsr.w   sub_1AC728      
loc_1AC722:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_1AC69A


; =============== S U B R O U T I N E =======================================

; AI-related

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_1AC728:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.w  d3,d6
                move.w  d4,d7
                cmpi.b  #0,d1
                bne.s   loc_1AC74E
                move.b  #0,var_1(a6)
                move.b  d7,var_2(a6)
                move.b  d6,var_3(a6)
                move.b  #$2F,var_4(a6) 
loc_1AC74E:
                
                cmpi.b  #1,d1
                bne.s   loc_1AC768
                move.b  #0,var_1(a6)
                move.b  d7,var_2(a6)
                move.b  #0,var_3(a6)
                move.b  d6,var_4(a6)
loc_1AC768:
                
                cmpi.b  #2,d1
                bne.s   loc_1AC782
                move.b  d7,var_1(a6)
                move.b  #$2F,var_2(a6) 
                move.b  #0,var_3(a6)
                move.b  d6,var_4(a6)
loc_1AC782:
                
                cmpi.b  #3,d1
                bne.s   loc_1AC79C
                move.b  d7,var_1(a6)
                move.b  #$2F,var_2(a6) 
                move.b  d6,var_3(a6)
                move.b  #$2F,var_4(a6) 
loc_1AC79C:
                
                clr.w   d4
                move.b  var_2(a6),d4
                sub.b   var_1(a6),d4
                ext.w   d4
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                move.b  var_1(a6),d2
                ext.w   d2
loc_1AC7B4:
                
                move.b  var_3(a6),d1
                ext.w   d1
                move.b  var_4(a6),d3
                sub.b   var_3(a6),d3
                ext.w   d3
loc_1AC7C4:
                
                movea.l a0,a1
                move.l  d2,-(sp)
                mulu.w  #48,d2
                adda.w  d2,a1
                move.l  (sp)+,d2
                move.b  (a1,d1.w),d0
                cmpi.b  #-1,d0
                beq.s   loc_1AC7E6
                
                bset    #7,d0
                bset    #6,d0
                move.b  d0,(a1,d1.w)
loc_1AC7E6:
                
                addi.w  #1,d1
                dbf     d3,loc_1AC7C4
                addi.w  #1,d2
                dbf     d4,loc_1AC7B4
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_1AC728


; =============== S U B R O U T I N E =======================================

; AI-related
; 
;   In: a0 = pointer to relative coordinates list
;       d5.w,d6.w = X,Y


sub_1AC7FE:
                
                movem.l d0-a1,-(sp)
                clr.w   d7
                move.b  (a0)+,d7
                subq.w  #1,d7
@Loop:
                
                move.w  d6,d2
                add.b   1(a0),d2
                cmpi.w  #MAP_SIZE_MAX_TILEHEIGHT,d2
                bcc.w   @Next
                move.w  d5,d1
                add.b   (a0),d1
                cmpi.w  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   @Next
                jsr     j_GetTerrain
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                beq.s   @Next
                bclr    #7,d0           ; clear obstructed flags
                bclr    #6,d0
                jsr     j_SetTerrain
@Next:
                
                addq.l  #2,a0
                dbf     d7,@Loop
                movem.l (sp)+,d0-a1
                rts

    ; End of function sub_1AC7FE

list_1AC848:    dc.b 1                  ; AI-related relative coordinates list
                dc.b 0, 0
list_1AC84B:    dc.b 4                  ; AI-related relative coordinates list
                dc.b 0, 1
                dc.b 1, 0
                dc.b 0, -1
                dc.b -1, 0
list_1AC854:    dc.b 8                  ; AI-related relative coordinates list
                dc.b 0, -2
                dc.b -1, -1
                dc.b -2, 0
                dc.b -1, 1
                dc.b 0, 2
                dc.b 1, 1
                dc.b 2, 0
                dc.b 1, -1
list_1AC865:    dc.b 12                 ; AI-related relative coordinates list
                dc.b 0, -3
                dc.b -1, -2
                dc.b -2, -1
                dc.b -3, 0
                dc.b -2, 1
                dc.b -1, 2
                dc.b 0, 3
                dc.b 1, 2
                dc.b 2, 1
                dc.b 3, 0
                dc.b 2, -1
                dc.b 1, -2
list_1AC87E:    dc.b 16                 ; AI-related relative coordinates list
                dc.b 0, -4
                dc.b -1, -3
                dc.b -2, -2
                dc.b -3, -1
                dc.b -4, 0
                dc.b -3, 1
                dc.b -2, 2
                dc.b -1, 3
                dc.b 0, 4
                dc.b 1, 3
                dc.b 2, 2
                dc.b 3, 1
                dc.b 4, 0
                dc.b 3, -1
                dc.b 2, -2
                dc.b 1, -3
                
                align

; =============== S U B R O U T I N E =======================================

; AI-related


GetLaserFacing:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                loadSavedDataAddress CURRENT_BATTLE, a0
                clr.w   d2
                move.b  (a0),d2
                lea     list_BattlesWithLasers(pc), a0
                nop
                clr.w   d1
                move.b  (a0)+,d1
                subi.w  #1,d1
                clr.w   d3
@CheckBattle_Loop:
                
                move.b  (a0,d3.w),d0
                cmp.b   d0,d2
                bne.s   @NextBattle
                bra.w   @BattleHasLaser
@NextBattle:
                
                addi.w  #1,d3
                dbf     d1,@CheckBattle_Loop
                
                clr.w   d3
                bra.w   @Done
@BattleHasLaser:
                
                lea     pt_LaserEnemyFacingForBattle(pc), a0
                nop
                lsl.w   #INDEX_SHIFT_COUNT,d3 ; make into longword offset
                movea.l (a0,d3.w),a0
                clr.w   d0
                move.b  d7,d0
                andi.w  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                clr.w   d6
                move.b  (a0,d0.w),d6    ; get entity facing
                cmpi.b  #-1,d6
                bne.s   @ContinueToFacing
                
                moveq   #0,d3           ; does not laser attack, no targets
                bra.w   @Done
@ContinueToFacing:
                
                clr.w   d0
                move.b  d7,d0
                jsr     j_GetCombatantY
                move.w  d1,d2
                jsr     j_GetCombatantX
                jsr     j_ClearTotalMovecostsAndMovableGridArrays
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst       #0,d6
                beq.s   @CheckFace_Up
            else
                tst.w   d6
                bne.s   @CheckFace_Up
            endif
                addi.w  #1,d1
@CheckFace_Up:
                
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst       #1,d6
                beq.s   @CheckFace_Left
            else
                cmpi.w  #UP,d6
                bne.s   @CheckFace_Left
            endif
                subi.w  #1,d2
@CheckFace_Left:
                
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst       #2,d6
                beq.s   @CheckFace_Down
            else
                cmpi.w  #LEFT,d6
                bne.s   @CheckFace_Down
            endif
                subi.w  #1,d1
@CheckFace_Down:
                
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst       #3,d6
                beq.s   @ContinueToTargets
            else
                cmpi.w  #DOWN,d6
                bne.s   @ContinueToTargets
            endif
                addi.w  #1,d2
@ContinueToTargets:
                
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d3
@CheckSpace_Loop:
                
                jsr     j_SetMovableSpace
                jsr     j_GetCombatantOccupyingSpace
                cmpi.b  #-1,d0
                bne.s   @TargetOnSpace
                
                bra.w   @CheckIncrementSpace_Right
@TargetOnSpace:
                
                move.b  d0,(a0,d3.w)
                addi.w  #1,d3
@CheckIncrementSpace_Right:
                
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst       #0,d6
                beq.s   @CheckIncrementSpace_Up
            else
                tst.w   d6
                bne.s   @CheckIncrementSpace_Up
            endif
                addi.w  #1,d1
                cmpi.w  #47,d1
                ble.s   @CheckIncrementSpace_Up
                bra.w   @Done
@CheckIncrementSpace_Up:
                
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst       #1,d6
                beq.s   @CheckIncrementSpace_Left
            else
                cmpi.w  #UP,d6
                bne.s   @CheckIncrementSpace_Left
            endif
                subi.w  #1,d2
                tst.w   d2
                bpl.s   @CheckIncrementSpace_Left
                bra.w   @Done
@CheckIncrementSpace_Left:
                
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst       #2,d6
                beq.s   @CheckIncrementSpace_Down
            else
                cmpi.w  #LEFT,d6
                bne.s   @CheckIncrementSpace_Down
            endif
                subi.w  #1,d1
                tst.w   d1
                bpl.s   @CheckIncrementSpace_Down
                bra.w   @Done
@CheckIncrementSpace_Down:
                
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst       #3,d6
                beq.s   @NextSpace
            else
                cmpi.w  #DOWN,d6
                bne.s   @NextSpace
            endif
                addi.w  #1,d2
                cmpi.w  #47,d2
                ble.s   @NextSpace
                bra.w   @Done
@NextSpace:
                
                bra.s   @CheckSpace_Loop
@Done:
                
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  d3,(a0)
                movem.l (sp)+,d0-a6
                rts

    ; End of function GetLaserFacing

