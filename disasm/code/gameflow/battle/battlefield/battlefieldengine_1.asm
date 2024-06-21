
; ASM FILE code\gameflow\battle\battlefield\battlefieldengine_1.asm :
; 0xC024..0xC24E : Battlefield engine

; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index
; Out: d1.w, d2.w = X,Y coordinates


GetEnemyDestination:
                
                movem.l d0/a0,-(sp)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                jsr     GetCombatantY
                move.w  d1,d2
                jsr     GetCombatantX
@Loop:
                
                move.b  (a0)+,d0
                cmpi.b  #-1,d0
                beq.w   @Done
                
                ; Check move right
                tst.b   d0
                bne.s   @CheckMoveUp
                addq.w  #1,d1
                bra.s   @Next
@CheckMoveUp:
                
                subq.b  #1,d0
                bne.s   @CheckMoveLeft
                subq.w  #1,d2
                bra.s   @Next
@CheckMoveLeft:
                
                subq.b  #1,d0
                bne.s   @CheckMoveDown
                subq.w  #1,d1
                bra.s   @Next
@CheckMoveDown:
                
                subq.b  #1,d0
                bne.s   @Goto_Done
                addq.w  #1,d2
                bra.s   @Next
@Goto_Done:
                
                bra.w   @Done
@Next:
                
                bra.s   @Loop
@Done:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function GetEnemyDestination


; =============== S U B R O U T I N E =======================================


ClearAiMoveInfo:
                
                movem.l d0-a6,-(sp)
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a0
                lea     ((byte_FFB1DC-$1000000)).w,a1
                clr.w   d0
                move.w  #48,d1
@Loop:
                
                move.b  #-1,(a0,d0.w)
                move.b  #0,(a1,d0.w)
                addq.w  #1,d0
                subq.w  #1,d1
                bne.s   @Loop
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ClearAiMoveInfo


; =============== S U B R O U T I N E =======================================

; Convert coordinates to offset and add to address argument.
; 
;   In: a0 = start of grid address, d1.w,d2.w = X,Y coordinates
;   Out: a0 = start of grid address + offset


ConvertCoordinatesToAddress:
                
                move.l  d2,-(sp)
                mulu.w  #MAP_SIZE_MAX_TILEWIDTH,d2
                add.w   d1,d2
                adda.l  d2,a0
                move.l  (sp)+,d2
                rts

    ; End of function ConvertCoordinatesToAddress


; =============== S U B R O U T I N E =======================================


ClearTargetsArray:
                
                movem.l d0-d1/a0,-(sp)
                lea     (FF5600_LOADING_SPACE).l,a0
                move.w  #576,d0
                moveq   #-1,d1
@Loop:
                
                move.l  d1,(a0)+
                subq.w  #1,d0
                bne.s   @Loop
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ClearTargetsArray


; =============== S U B R O U T I N E =======================================


ClearTotalMovecostsAndMovableGridArrays:
                
                movem.l d0-a6,-(sp)
                lea     (FF4400_LOADING_SPACE).l,a0
                lea     (FF4D00_LOADING_SPACE).l,a1
                move.w  #576,d0
                moveq   #-1,d1
@Loop:
                
                move.l  d1,(a0)+
                move.l  d1,(a1)+
                subq.w  #1,d0
                bne.s   @Loop
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ClearTotalMovecostsAndMovableGridArrays


; =============== S U B R O U T I N E =======================================

; Get index of combatant occupying position d1.w,d2.w -> d0.b


GetCombatantOccupyingSpace:
                
                movem.l d1-a6,-(sp)
                lea     (FF5600_LOADING_SPACE).l,a0
                bsr.s   ConvertCoordinatesToAddress
                move.b  (a0),d0
                movem.l (sp)+,d1-a6
                rts

    ; End of function GetCombatantOccupyingSpace


; =============== S U B R O U T I N E =======================================

; Get movecost to reach entity d0.b -> d0.b


GetMoveCostToEntity:
                
                movem.l d1-a6,-(sp)
                jsr     GetCombatantY
                move.b  d1,d2
                jsr     GetCombatantX
                bsr.w   GetMoveCostToDestination
                movem.l (sp)+,d1-a6
                rts

    ; End of function GetMoveCostToEntity


; =============== S U B R O U T I N E =======================================

; Get movecost to reach space at coordinates d1.w,d2.w -> d0.b


GetMoveCostToDestination:
                
                movem.l d1-a6,-(sp)
                lea     (FF4400_LOADING_SPACE).l,a0
                lea     (FF4D00_LOADING_SPACE).l,a1
                clr.w   d0
                mulu.w  #MAP_SIZE_MAX_TILEWIDTH,d2
                andi.w  #BYTE_MASK,d1
                add.w   d1,d2           ; d2.w = coordinates converted to offset
                move.b  (a1,d2.w),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  (a0,d2.w),d0
                movem.l (sp)+,d1-a6
                rts

    ; End of function GetMoveCostToDestination


; =============== S U B R O U T I N E =======================================

; Get terrain type of space occupied by battle entity d0.b -> d0.b


GetCurrentTerrainType:
                
                movem.l d1-a6,-(sp)
                jsr     GetCombatantY
                move.w  d1,d2
                jsr     GetCombatantX
                bsr.w   GetTerrain      
                movem.l (sp)+,d1-a6
                rts

    ; End of function GetCurrentTerrainType


; =============== S U B R O U T I N E =======================================

; Get terrain entry at coordinates d1.w,d2.w -> d0.b


GetTerrain:
                
                movem.l d1-a6,-(sp)
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                bsr.w   ConvertCoordinatesToAddress
                move.b  (a0),d0
                movem.l (sp)+,d1-a6
                rts

    ; End of function GetTerrain


; =============== S U B R O U T I N E =======================================

; Set terrain entry d0.b at coordinates d1.w,d2.w


SetTerrain:
                
                movem.l d1-a6,-(sp)
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                bsr.w   ConvertCoordinatesToAddress
                move.b  d0,(a0)
                movem.l (sp)+,d1-a6
                rts

    ; End of function SetTerrain


; =============== S U B R O U T I N E =======================================

; Populate movecosts table for moving battle entity d0.b


PopulateMovecostsTable:
                
                movem.l d0-a6,-(sp)
                jsr     GetMoveType     
                lsl.w   #NIBBLE_SHIFT_COUNT,d1
                lea     table_LandEffectSettingsAndMovecosts(pc), a0
                adda.w  d1,a0
                lea     ((MOVECOSTS_TABLE-$1000000)).w,a1
                moveq   #TERRAIN_TYPES_COUNTER,d7
@Loop:
                
                move.b  (a0)+,d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                cmpi.b  #MOVECOST_OBSTRUCTED,d1
                bne.s   @Continue
                moveq   #-1,d1
@Continue:
                
                move.b  d1,(a1)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulateMovecostsTable


; =============== S U B R O U T I N E =======================================

; unused


sub_C1BE:
                
                movem.l d0/d2-a6,-(sp)
                bsr.s   PopulateMovecostsTable
                lea     ((MOVECOSTS_TABLE-$1000000)).w,a0
                bsr.w   GetCurrentTerrainType
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d0
                adda.w  d0,a0
                move.b  (a0),d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_C1BE


; =============== S U B R O U T I N E =======================================

; In:  d0.b = combatant index
; Out: d1.w = land effect setting (0 = 0%, 1 = 15%, 2 = 30%)


GetLandEffectSetting:
                
                movem.l d0/d2-a6,-(sp)
                jsr     GetMoveType     
                lsl.w   #NIBBLE_SHIFT_COUNT,d1
                lea     table_LandEffectSettingsAndMovecosts(pc), a0
                adda.w  d1,a0
                bsr.w   GetCurrentTerrainType
                andi.w  #TERRAIN_MASK_TYPE,d0
                adda.w  d0,a0
                move.b  (a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1 ; shift land effect setting into lower nibble position
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function GetLandEffectSetting


; =============== S U B R O U T I N E =======================================

; Set space at position d1.w,d2.w as movable and clear movecost.


SetMovableSpace:
                
                movem.l d0-a6,-(sp)
                lea     (FF4400_LOADING_SPACE).l,a0
                bsr.w   ConvertCoordinatesToAddress
                move.b  #0,(a0)
                lea     (FF4D00_LOADING_SPACE).l,a0
                bsr.w   ConvertCoordinatesToAddress
                move.b  #0,(a0)
                movem.l (sp)+,d0-a6
                rts

    ; End of function SetMovableSpace


; =============== S U B R O U T I N E =======================================

; Get combatant D0's resistance setting to spell D1 -> D2


GetResistanceToSpell:
                
                movem.l d0-d1/d3-a6,-(sp)
                andi.b  #SPELLENTRY_MASK_INDEX,d1
                move.b  table_SpellElements(pc,d1.w),d2
                jsr     GetCurrentResistance
                andi.w  #RESISTANCEENTRY_MASK_ALL,d1
                ror.w   d2,d1
                move.w  d1,d2
                andi.w  #RESISTANCEENTRY_LOWERMASK_SETTING,d2
                movem.l (sp)+,d0-d1/d3-a6
                rts

    ; End of function GetResistanceToSpell

