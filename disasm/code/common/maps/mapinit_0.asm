
; ASM FILE code\common\maps\mapinit_0.asm :
; 0x7956..0x7988 : Map init functions

; =============== S U B R O U T I N E =======================================

; Alter map index if certain flags are set (Granseal, Pacalon, etc)
; 
;       In: D0 = map index
; 
;       Out: D0 = new map index


CheckMapSwitch:
                
                movem.l d1-d2/a0,-(sp)
                lea     FlagSwitchedMaps(pc), a0
loc_795E:
                
                move.w  (a0),d2
                bmi.w   loc_7982
                cmp.w   d0,d2
                bne.w   loc_797E
                move.w  2(a0),d1
                jsr     j_CheckFlag
                beq.s   loc_797E
                move.w  4(a0),d0
                bra.w   loc_7982
loc_797E:
                
                addq.l  #6,a0
                bra.s   loc_795E
loc_7982:
                
                movem.l (sp)+,d1-d2/a0
                rts

    ; End of function CheckMapSwitch

