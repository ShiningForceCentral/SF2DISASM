
; ASM FILE code\common\stats\findname.asm :
; 0x8970..0x89CE : Find a combatant, class, item, or spell name

; =============== S U B R O U T I N E =======================================


GetClassName:
                
                getPointer p_table_ClassNames, a0

    ; End of function GetClassName


; =============== S U B R O U T I N E =======================================

; In: a0 = names list pointer, d1.w = name index
; Out: a0 = pointer to name entry, d7.w = name length


FindName:
                
                move.w  d0,-(sp)
                subq.w  #1,d1
                bmi.s   @Done           ; done if name index = 0
                clr.w   d0
@Loop:
                
                move.b  (a0)+,d0
                adda.w  d0,a0
                dbf     d1,@Loop
@Done:
                
                clr.w   d7
                move.b  (a0)+,d7
                move.w  (sp)+,d0
                rts

    ; End of function FindName

