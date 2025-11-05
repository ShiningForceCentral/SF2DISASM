
; ASM FILE code\gameflow\battle\ai\command\heal\unusedfunctions_D3CA.asm :
; 0xD3CA..0xD408 : Unused AI engine functions

; =============== S U B R O U T I N E =======================================

; Unused in the US version.


sub_D3CA:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentMp
                move.w  d1,d2
                jsr     GetMaxMp
                bra.w   loc_D3FC

    ; End of function sub_D3CA


; =============== S U B R O U T I N E =======================================

; unused


sub_D3E0:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxMp
                bra.w   loc_D3FC

    ; End of function sub_D3E0


; =============== S U B R O U T I N E =======================================

; unused


sub_D3F0:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentMp
loc_D3FC:
                
                mulu.w  #3,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function sub_D3F0

