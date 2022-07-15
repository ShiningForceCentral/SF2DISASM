
; ASM FILE code\common\tech\interrupts\trap6_mapscript.asm :
; 0x57A..0x592 : Trap 6 - Map Script

; =============== S U B R O U T I N E =======================================

; execute map script at a0


Trap6_TriggerAndExecuteMapScript:
                
                movem.l d0-a6,-(sp)
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l VInt_UpdateEntities
                jsr     j_ExecuteMapScript
                movem.l (sp)+,d0-a6
                rte

    ; End of function Trap6_TriggerAndExecuteMapScript

