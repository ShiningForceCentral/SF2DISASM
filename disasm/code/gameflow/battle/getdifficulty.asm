
; ASM FILE code\gameflow\battle\getdifficulty.asm :
; 0xD408..0xD430 : Difficulty getter function

; =============== S U B R O U T I N E =======================================

; Out: D1 = 0 if normal, 1 if hard, 2 if super, 3 if ouch


GetDifficulty:
                
                movem.l d0/d2-a6,-(sp)
                clr.w   d2
                move.w  #FLAG_INDEX_DIFFICULTY1,d1
                bsr.w   CheckFlag
                beq.s   loc_D41C
                move.w  #1,d2
loc_D41C:
                
                move.w  #FLAG_INDEX_DIFFICULTY2,d1
                bsr.w   CheckFlag
                beq.s   loc_D428
                addq.w  #2,d2
loc_D428:
                
                move.w  d2,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function GetDifficulty

