
; ASM FILE code\common\maps\mapinit_0.asm :
; 0x7956..0x7988 : Map init functions

; =============== S U B R O U T I N E =======================================

; Alter map index if certain flags are set (Granseal, Pacalon, etc.)
; 
; In: d0.w = original map index, Out: d0.w = new map index


SwitchMap:
                
                movem.l d1-d2/a0,-(sp)
            if (STANDARD_BUILD=1)
                getPointer p_table_FlagSwitchedMaps, a0
            else
                lea     table_FlagSwitchedMaps(pc), a0
            endif
@Loop:
                
                move.w  (a0),d2
                bmi.w   @Done
                cmp.w   d0,d2
                bne.w   @Next
                move.w  2(a0),d1
                jsr     j_CheckFlag
                beq.s   @Next
                move.w  4(a0),d0
                bra.w   @Done
@Next:
                
                addq.l  #6,a0
                bra.s   @Loop
@Done:
                
                movem.l (sp)+,d1-d2/a0
                rts

    ; End of function SwitchMap

