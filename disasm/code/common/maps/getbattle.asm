
; ASM FILE code\common\maps\getbattle.asm :
; 0x799C..0x7A36 : GetNextBattleOnMap function

; =============== S U B R O U T I N E =======================================

; In: D0 = map index (if not supplied, will be pulled from CURRENT_MAP)
;     D1 = player X coord to check
;     D2 = player Y coord to check
; Out: D7 = battle index to trigger (-1 if none)
; ...more


CheckBattle:
                
                movem.l d1-d6/a0,-(sp)
                move.w  d1,d4
                move.w  d2,d5
                move.w  d0,-(sp)
                cmpi.b  #MAP_CURRENT,d0 
                bne.s   @Continue
                
                ; Get current map
                clr.w   d0
                getSavedByte CURRENT_MAP, d0
@Continue:
            if (STANDARD_BUILD=1)
                getPointer p_table_BattleMapCoordinates, a0
            else
                lea     table_BattleMapCoordinates(pc), a0
            endif
                moveq   #BATTLES_MAX_INDEX,d6
                clr.w   d7
@Loop:
                
                cmp.b   (a0),d0
                bne.s   @Next
                move.w  #BATTLE_UNLOCKED_FLAGS_START,d1
                add.w   d7,d1
                jsr     j_CheckFlag
                beq.s   @Next
                
                ; Check Trigger X
                cmpi.b  #-1,BATTLEMAPCOORDINATES_OFFSET_TRIGGER_X(a0)
                beq.w   @CheckTriggerY
                cmp.b   BATTLEMAPCOORDINATES_OFFSET_TRIGGER_X(a0),d4
                bne.w   @Next
@CheckTriggerY:
                
                cmpi.b  #-1,BATTLEMAPCOORDINATES_OFFSET_TRIGGER_Y(a0)
                beq.w   @SetCurrentCoordinates
                cmp.b   BATTLEMAPCOORDINATES_OFFSET_TRIGGER_Y(a0),d5 
                                                        ; if player is not on specified coords (bytes 5/6), then don't return battle index.
                bne.w   @Next
@SetCurrentCoordinates:
                
                setSavedByte BATTLEMAPCOORDINATES_OFFSET_X(a0), BATTLE_AREA_X
                setSavedByte BATTLEMAPCOORDINATES_OFFSET_Y(a0), BATTLE_AREA_Y
                setSavedByte BATTLEMAPCOORDINATES_OFFSET_WIDTH(a0), BATTLE_AREA_WIDTH
                setSavedByte BATTLEMAPCOORDINATES_OFFSET_HEIGHT(a0), BATTLE_AREA_HEIGHT
                addi.w  #BATTLE_UNLOCKED_TO_COMPLETED_FLAGS_OFFSET,d1
                jsr     j_CheckFlag
                beq.s   @TriggerBattle
                subi.w  #BATTLE_UNLOCKED_TO_COMPLETED_FLAGS_OFFSET,d1
                jsr     j_ClearFlag
@TriggerBattle:
                
                move.w  (sp)+,d1
                bra.w   @Done
@Next:
                
                addq.l  #BATTLEMAPCOORDINATES_ENTRY_SIZE_FULL,a0
                addq.w  #1,d7
                dbf     d6,@Loop
                
                moveq   #-1,d7
                move.w  (sp)+,d0
@Done:
                
                movem.l (sp)+,d1-d6/a0
                rts

    ; End of function CheckBattle

