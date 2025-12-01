
; ASM FILE code\gameflow\battle\battlefield\updatemovablegrid.asm :
; 0xC900..0xC958 : Movable-grid array update function

; =============== S U B R O U T I N E =======================================

; Set or clear TERRAIN_BIT_OCCUPIED in the movable-grid array ($FF4D00)
;   for spaces occupied by allies.
; 
; In: d3.w = set occupied bit toggle (clear if = 0, set otherwise)


UpdateMovableGrid:
                
                movem.l d0-a0,-(sp)
                move.w  #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                
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
                lea     (FF4D00_LOADING_SPACE).l,a0
                bsr.w   ConvertCoordinatesToAddress
                tst.w   d3
                bne.s   @Set
                
                ; Clear
                bclr    #TERRAIN_BIT_OCCUPIED,(a0)
                bra.s   @Next
@Set:
                
                bset    #TERRAIN_BIT_OCCUPIED,(a0)
@Next:
                
                addq.b  #1,d0
                dbf     d7,@Loop
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function UpdateMovableGrid

