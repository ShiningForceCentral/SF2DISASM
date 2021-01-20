
; ASM FILE code\gameflow\battle\battlefieldengine_1.asm :
; 0xC09A..0xC24E : Battlefield engine

; =============== S U B R O U T I N E =======================================

;     Convert coordinate to offset and add to address argument.
;     In: A0 = start of grid
;         D1 = X coord
;         D2 = Y coord
;     Out: A0 = start of grid + offset


ConvertCoordToOffset:
                
                move.l  d2,-(sp)
                mulu.w  #$30,d2 
                add.w   d1,d2
                adda.l  d2,a0
                move.l  (sp)+,d2
                rts

    ; End of function ConvertCoordToOffset


; =============== S U B R O U T I N E =======================================

;     Clear valid target index grid at RAM:5600.


ClearTargetGrid:
                
                movem.l d0-d1/a0,-(sp)
                lea     (FF5600_LOADING_SPACE).l,a0
                move.w  #$240,d0
                moveq   #$FFFFFFFF,d1
loc_C0B8:
                
                move.l  d1,(a0)+
                subq.w  #1,d0
                bne.s   loc_C0B8
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ClearTargetGrid


; =============== S U B R O U T I N E =======================================

;     Clear moveable tile data at RAM:4400 and RAM:4d00.


ClearMovableGrid:
                
                movem.l d0-a6,-(sp)
                lea     (byte_FF4400).l,a0
                lea     (FF4D00_LOADING_SPACE).l,a1
                move.w  #$240,d0
                moveq   #$FFFFFFFF,d1
loc_C0DA:
                
                move.l  d1,(a0)+
                move.l  d1,(a1)+
                subq.w  #1,d0
                bne.s   loc_C0DA
                movem.l (sp)+,d0-a6
                rts

    ; End of function ClearMovableGrid


; =============== S U B R O U T I N E =======================================

;     Get value at converted coordinate offset.
;     In: D1 = X coord
;         D2 = Y coord
;     Out: D0 = terrain at offset


GetTargetAtCoordOffset:
                
                movem.l d1-a6,-(sp)
                lea     (FF5600_LOADING_SPACE).l,a0
                bsr.s   ConvertCoordToOffset
                move.b  (a0),d0
                movem.l (sp)+,d1-a6
                rts

    ; End of function GetTargetAtCoordOffset


; =============== S U B R O U T I N E =======================================

; get distance from current unit to entity D0 -> D0


GetMoveCostToEntity:
                
                movem.l d1-a6,-(sp)
                jsr     GetYPos
                move.b  d1,d2
                jsr     GetXPos
                bsr.w   GetDestinationMoveCost
                movem.l (sp)+,d1-a6
                rts

    ; End of function GetMoveCostToEntity


; =============== S U B R O U T I N E =======================================

; get movecost to get to tile D1,D2 -> D0


GetDestinationMoveCost:
                
                movem.l d1-a6,-(sp)
                lea     (byte_FF4400).l,a0
                lea     (FF4D00_LOADING_SPACE).l,a1
                clr.w   d0
                mulu.w  #$30,d2 
                andi.w  #$FF,d1
                add.w   d1,d2
                move.b  (a1,d2.w),d0
                lsl.w   #8,d0
                move.b  (a0,d2.w),d0
                movem.l (sp)+,d1-a6
                rts

    ; End of function GetDestinationMoveCost


; =============== S U B R O U T I N E =======================================

; get terrain type of tile under entity D0 -> D0


GetCurrentTerrainType:
                
                movem.l d1-a6,-(sp)
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
                bsr.w   GetTerrain      
                movem.l (sp)+,d1-a6
                rts

    ; End of function GetCurrentTerrainType


; =============== S U B R O U T I N E =======================================

;     Get obstruction at converted coordinate offset.
;     In: D1 = X coord
;         D2 = Y coord
;     Out: D0 = target at offset


GetTerrain:
                
                movem.l d1-a6,-(sp)
                lea     (BATTLE_TERRAIN).l,a0
                bsr.w   ConvertCoordToOffset
                move.b  (a0),d0
                movem.l (sp)+,d1-a6
                rts

    ; End of function GetTerrain


; =============== S U B R O U T I N E =======================================


SetTerrain:
                
                movem.l d1-a6,-(sp)
                lea     (BATTLE_TERRAIN).l,a0
                bsr.w   ConvertCoordToOffset
                move.b  d0,(a0)
                movem.l (sp)+,d1-a6
                rts

    ; End of function SetTerrain


; =============== S U B R O U T I N E =======================================


MemorizePath:
                
                movem.l d0-a6,-(sp)     ; copy current moving unit's terrain list to memory
                jsr     GetUpperMoveType
                lsl.w   #4,d1
                lea     tbl_LandEffectSettingsAndMoveCosts(pc), a0
                adda.w  d1,a0
                lea     ((MOVE_COST_LIST-$1000000)).w,a1
                moveq   #$F,d7
loc_C1A4:
                
                move.b  (a0)+,d1
                andi.b  #$F,d1
                cmpi.b  #$F,d1
                bne.s   loc_C1B2
                moveq   #$FFFFFFFF,d1
loc_C1B2:
                
                move.b  d1,(a1)+
                dbf     d7,loc_C1A4
                movem.l (sp)+,d0-a6
                rts

    ; End of function MemorizePath


; =============== S U B R O U T I N E =======================================


sub_C1BE:
                
                movem.l d0/d2-a6,-(sp)
                bsr.s   MemorizePath
                lea     ((MOVE_COST_LIST-$1000000)).w,a0
                bsr.w   GetCurrentTerrainType
                andi.w  #$F,d0
                adda.w  d0,a0
                move.b  (a0),d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_C1BE


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; 
; Out: D1 = land effect setting (0=0%, 1=15%, 2=30%)


GetLandEffectSetting:
                
                movem.l d0/d2-a6,-(sp)
                jsr     GetUpperMoveType
                lsl.w   #MOVETYPE_NIBBLE_SHIFTCOUNT,d1
                lea     tbl_LandEffectSettingsAndMoveCosts(pc), a0
                adda.w  d1,a0
                bsr.w   GetCurrentTerrainType
                andi.w  #TERRAIN_MASK_TYPE,d0
                adda.w  d0,a0
                move.b  (a0),d1
                lsr.b   #LANDEFFECT_NIBBLE_SHIFTCOUNT,d1 ; shift land effect setting into lower nibble position
                andi.b  #LANDEFFECT_MASK_LOWERNIBBLE,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function GetLandEffectSetting


; =============== S U B R O U T I N E =======================================

; Set coord to movable in movable grid
; 
;       In: D1 = X coord
;           D2 = Y coord


SetMovableAtCoord:
                
                movem.l d0-a6,-(sp)
                lea     (byte_FF4400).l,a0
                bsr.w   ConvertCoordToOffset
                move.b  #0,(a0)
                lea     (FF4D00_LOADING_SPACE).l,a0
                bsr.w   ConvertCoordToOffset
                move.b  #0,(a0)
                movem.l (sp)+,d0-a6
                rts

    ; End of function SetMovableAtCoord


; =============== S U B R O U T I N E =======================================

; Get combatant D0's resistance setting to spell D1 -> D2


GetResistanceToSpell:
                
                movem.l d0-d1/d3-a6,-(sp)
                andi.b  #SPELLENTRY_MASK_INDEX,d1
                move.b  tbl_SpellElements(pc,d1.w),d2
                jsr     GetCurrentResistance
                andi.w  #RESISTANCEENTRY_MASK_ALL,d1
                ror.w   d2,d1
                move.w  d1,d2
                andi.w  #RESISTANCEENTRY_LOWERMASK_SETTING,d2
                movem.l (sp)+,d0-d1/d3-a6
                rts

    ; End of function GetResistanceToSpell

