
; ASM FILE code\gameflow\battle\getlaserfacing.asm :
; 0x1AC8A0..0x1AC9B8 : Laser facing getter function

; =============== S U B R O U T I N E =======================================


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
                btst    #0,d6
                beq.s   @CheckFace_Up
            else
                tst.w   d6
                bne.s   @CheckFace_Up
            endif
                addi.w  #1,d1
@CheckFace_Up:
                
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst    #1,d6
                beq.s   @CheckFace_Left
            else
                cmpi.w  #UP,d6
                bne.s   @CheckFace_Left
            endif
                subi.w  #1,d2
@CheckFace_Left:
                
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst    #2,d6
                beq.s   @CheckFace_Down
            else
                cmpi.w  #LEFT,d6
                bne.s   @CheckFace_Down
            endif
                subi.w  #1,d1
@CheckFace_Down:
                
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst    #3,d6
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
                btst    #0,d6
                beq.s   @CheckIncrementSpace_Up
            else
                tst.w   d6
                bne.s   @CheckIncrementSpace_Up
            endif
                addi.w  #1,d1
                cmpi.w  #MAP_MAX_X,d1
                ble.s   @CheckIncrementSpace_Up
                bra.w   @Done
@CheckIncrementSpace_Up:
                
            if (STANDARD_BUILD&DIAGONAL_LASERS=1)
                btst    #1,d6
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
                btst    #2,d6
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
                btst    #3,d6
                beq.s   @NextSpace
            else
                cmpi.w  #DOWN,d6
                bne.s   @NextSpace
            endif
                addi.w  #1,d2
                cmpi.w  #MAP_MAX_Y,d2
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

