
; ASM FILE code\common\tech\interrupts\trap1-4_flags.asm :
; 0x1700..0x1770 : Trap 1-4 - Flag Functions

; =============== S U B R O U T I N E =======================================


Trap4_CheckFlag:
                
                movem.l d1/a0,-(sp)
                movea.l $A(sp),a0
                move.w  (a0),d1
                addq.l  #2,$A(sp)
                jsr     j_CheckFlag
                movem.l (sp)+,d1/a0
                addq.l  #2,sp
                rts

    ; End of function Trap4_CheckFlag


; =============== S U B R O U T I N E =======================================


Trap2_SetFlag:
                
                movem.l d1/a0,-(sp)
                movea.l $A(sp),a0
                move.w  (a0),d1
                addq.l  #2,$A(sp)
                jsr     j_SetFlag
                movem.l (sp)+,d1/a0
                addq.l  #2,sp
                rts

    ; End of function Trap2_SetFlag


; =============== S U B R O U T I N E =======================================


Trap1_CheckFlag:
                
                movem.l d1/a0,-(sp)
                movea.l $A(sp),a0
                move.w  (a0),d1
                addq.l  #2,$A(sp)
                jsr     j_CheckFlag
                movem.l (sp)+,d1/a0
                addq.l  #2,sp
                rts

    ; End of function Trap1_CheckFlag


; =============== S U B R O U T I N E =======================================


Trap3_ClearFlag:
                
                movem.l d1/a0,-(sp)
                movea.l $A(sp),a0
                move.w  (a0),d1
                addq.l  #2,$A(sp)
                jsr     j_ClearFlag
                movem.l (sp)+,d1/a0
                addq.l  #2,sp
                rts

    ; End of function Trap3_ClearFlag

