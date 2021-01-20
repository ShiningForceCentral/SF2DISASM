
; ASM FILE code\gameflow\battle\battleactionsengine_8.asm :
; 0xC024..0xC09A : Battle actions engine

; =============== S U B R O U T I N E =======================================


GetEnemyDestination:
                
                movem.l d0/a0,-(sp)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
loc_C03A:
                
                move.b  (a0)+,d0
                cmpi.b  #$FF,d0
                beq.w   loc_C06A
                tst.b   d0
                bne.s   loc_C04C
                addq.w  #1,d1
                bra.s   loc_C068
loc_C04C:
                
                subq.b  #1,d0
                bne.s   loc_C054
                subq.w  #1,d2
                bra.s   loc_C068
loc_C054:
                
                subq.b  #1,d0
                bne.s   loc_C05C
                subq.w  #1,d1
                bra.s   loc_C068
loc_C05C:
                
                subq.b  #1,d0
                bne.s   loc_C064
                addq.w  #1,d2
                bra.s   loc_C068
loc_C064:
                
                bra.w   loc_C06A
loc_C068:
                
                bra.s   loc_C03A
loc_C06A:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function GetEnemyDestination


; =============== S U B R O U T I N E =======================================


ClearEnemyMoveInfo:
                
                movem.l d0-a6,-(sp)
                lea     ((ENEMY_TARGETTING_COMMAND_LIST-$1000000)).w,a0
                lea     ((byte_FFB1DC-$1000000)).w,a1
                clr.w   d0
                move.w  #$30,d1 
loc_C082:
                
                move.b  #$FF,(a0,d0.w)
                move.b  #0,(a1,d0.w)
                addq.w  #1,d0
                subq.w  #1,d1
                bne.s   loc_C082
                movem.l (sp)+,d0-a6
                rts

    ; End of function ClearEnemyMoveInfo

