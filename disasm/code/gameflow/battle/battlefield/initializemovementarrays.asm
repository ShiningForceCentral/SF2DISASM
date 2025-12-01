
; ASM FILE code\gameflow\battle\battlefield\initializemovementarrays.asm :
; 0xC2C8..0xC306 : Movement arrays initialization function

; =============== S U B R O U T I N E =======================================

; Out: a2, a3 = pointers to total movecosts and movable grid arrays
;      a4 = pointer to battle terrain array
;      a5 = pointer to move costs table
;      d0.w = move budget (MOV * 2)
;      d3.w, d4.w = moving combatant X, Y
;        


InitializeMovementArrays:
                
                movem.l d1-d2/d5-a1,-(sp)
                bsr.w   PopulateMoveCostsTable
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN_ARRAY).l,a4
                lea     ((MOVECOSTS_TABLE-$1000000)).w,a5
                jsr     GetCombatantX
                move.w  d1,d3
                jsr     GetCombatantY
                move.w  d1,d4
                jsr     GetCurrentMov
                move.w  d1,d0
                add.w   d0,d0
                movem.l (sp)+,d1-d2/d5-a1
                rts

    ; End of function InitializeMovementArrays

