
; ASM FILE code\common\tech\interrupts\trap5_textbox.asm :
; 0x556..0x57A : Trap 5 - Text Box

; =============== S U B R O U T I N E =======================================


Trap5_TextBox:
                
                movem.l d0-a6,-(sp)
                movea.l $3E(sp),a6
                addq.l  #2,$3E(sp)
                move.w  (a6)+,d0
                cmpi.w  #$FFFF,d0
                bne.s   loc_570
                bsr.w   HideTextBox
                bra.s   loc_574
loc_570:
                
                bsr.w   DisplayText     
loc_574:
                
                movem.l (sp)+,d0-a6
                rte

    ; End of function Trap5_TextBox

