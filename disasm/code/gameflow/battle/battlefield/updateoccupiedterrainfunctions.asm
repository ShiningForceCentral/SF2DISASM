
; ASM FILE code\gameflow\battle\battlefield\updateoccupiedterrainfunctions.asm :
; 0xC87A..0xC900 : Occupied terrain update functions

; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant
;     d3.w = 0 to clear flag, set otherwise


UpdateOccupiedByOpponentsTerrain:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.w   UpdateOccupiedByEnemiesTerrain

    ; End of function UpdateOccupiedByOpponentsTerrain


; =============== S U B R O U T I N E =======================================


UpdateOccupiedByAlliesTerrain:
                
                movem.l d0-a0,-(sp)
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                bra.w   UpdateOccupiedTerrain_Loop

    ; End of function UpdateOccupiedByAlliesTerrain


; =============== S U B R O U T I N E =======================================


UpdateOccupiedByEnemiesTerrain:
                
                movem.l d0-a0,-(sp)
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7

    ; End of function UpdateOccupiedByEnemiesTerrain


; =============== S U B R O U T I N E =======================================

; Set or clear TERRAIN_BIT_OCCUPIED on BATTLE_TERRAIN_ARRAY entries
;   for occupied spaces depending on toggle d3, but skip TERRAIN_OBSTRUCTED.
; 
; In: d3.w = set occupied bit toggle (clear if = 0, set otherwise)


UpdateOccupiedTerrain_Loop:
                
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   @Next
                
                jsr     GetCombatantY
                move.w  d1,d2
                cmpi.w  #MAP_SIZE_MAX_TILEHEIGHT,d2
                bcc.w   @Next
                
                jsr     GetCombatantX
                cmpi.w  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   @Next
                
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                bsr.w   ConvertCoordinatesToAddress
                move.b  (a0),d4
                cmpi.b  #TERRAIN_OBSTRUCTED,d4
                bne.s   @Continue
                bra.w   @Next           ; skip if space is obstructed
@Continue:
                
                btst    #TERRAIN_BIT_IMPASSABLE,d4
                beq.s   @CheckToggle
                
                tst.w   d3
                bne.s   @CheckToggle
                bra.w   @Next           ; skip if TERRAIN_BIT_IMPASSABLE is set and we're clearing
@CheckToggle:
                
                tst.w   d3
                bne.s   @Set
                
                ; Clear
                bclr    #TERRAIN_BIT_OCCUPIED,(a0)
                bra.s   @Next
@Set:
                
                bset    #TERRAIN_BIT_OCCUPIED,(a0)
@Next:
                
                addq.b  #1,d0
                dbf     d7,UpdateOccupiedTerrain_Loop
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function UpdateOccupiedTerrain_Loop

