
; ASM FILE code\gameflow\battle\battlefunctions\battlefunctions_3.asm :
; 0x256A2..0x2572A : Battle functions

table_RelativeTileMoveX:
                dc.w 1
table_RelativeTileMoveY:
                dc.w 0
                dc.w 0
                dc.w -1
                dc.w -1
                dc.w 0
                dc.w 0
                dc.w 1

; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
; Out: d0.w, d1.w = new X, Y


GetEntityPositionAfterApplyingFacing:
                
                movem.l d2-d3/a0,-(sp)
                jsr     j_GetCombatantX
                move.w  d1,d2
                jsr     j_GetCombatantY
                bsr.w   GetEntityIndexForCombatant_0
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                clr.w   d3
                move.b  ENTITYDEF_OFFSET_FACING(a0,d0.w),d3
                move.w  d2,d0
                lsl.w   #INDEX_SHIFT_COUNT,d3
                add.w   table_RelativeTileMoveX(pc,d3.w),d0
                add.w   table_RelativeTileMoveY(pc,d3.w),d1
                movem.l (sp)+,d2-d3/a0
                rts

    ; End of function GetEntityPositionAfterApplyingFacing


; =============== S U B R O U T I N E =======================================


sub_256E6:
                
                movem.l d0-d2/d7,-(sp)
                move.w  d0,d2
                move.w  d1,d3
                clr.w   d0
                move.w  #COMBATANTS_ALL_COUNTER,d7
loc_256F4:
                
                jsr     j_GetCombatantX
                cmp.w   d1,d2
                bne.w   loc_25712
                jsr     j_GetCombatantY
                cmp.w   d1,d3
                bne.w   loc_25712
                move.w  d0,d3
                bra.w   loc_25724
loc_25712:
                
                addq.w  #1,d0
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bne.s   loc_2571E
                move.w  #COMBATANT_ENEMIES_START,d0
loc_2571E:
                
                dbf     d7,loc_256F4
                moveq   #-1,d3
loc_25724:
                
                movem.l (sp)+,d0-d2/d7
                rts

    ; End of function sub_256E6

