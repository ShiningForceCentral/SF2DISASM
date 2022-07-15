
; ASM FILE code\common\scripting\map\debugmapscripts.asm :
; 0x47102..0x4712A : Debug mapscript function
DebugMapScripts:dc.l dms_01
                dc.l bbcs_08
                dc.l abcs_battle08

; =============== S U B R O U T I N E =======================================


DebugMapScript:
                
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                moveq   #0,d0
                moveq   #0,d1
                moveq   #$A,d2
                jsr     j_NumberPrompt
                lsl.w   #2,d0
                movea.l DebugMapScripts(pc,d0.w),a0
                bsr.w   ExecuteMapScript
                rts

    ; End of function DebugMapScript

