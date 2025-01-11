
; ASM FILE code\gameflow\battle\battleloop\hasjarojoined.asm :
; 0x1B1A28..0x1B1A66 : Battle loop function

; =============== S U B R O U T I N E =======================================

; Has Jaro joined the Force? Return d1.w = 1 if true.


HasJaroJoinedTheForce:
                
                movem.l d0/d2-a6,-(sp)
                jsr     j_UpdateForce
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  (a0),d7
                subi.w  #1,d7
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.l   d6
@Loop:
                
                clr.w   d0
                move.b  (a0,d6.w),d0
                cmpi.b  #ALLY_JARO,d0
                bne.s   @Next           ; keep checking force members until we either find Jaro or reach end of the list
                move.w  #1,d1
                bra.w   @Found          ; Jaro is found, so we're done
@Next:
                
                addi.w  #1,d6
                dbf     d7,@Loop
                clr.w   d1              ; reached end of the list without finding Jaro
@Found:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function HasJaroJoinedTheForce

