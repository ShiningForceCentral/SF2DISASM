
; ASM FILE code\gameflow\battle\regionactivatedcutscenes.asm :
; 0x47E82..0x47EC8 : Region-activated cutscenes functions

; =============== S U B R O U T I N E =======================================

; executes cutscenes activated by regions


ExecuteBattleRegionCutscene:
                
                movem.l d0-d1/a0,-(sp)
                lea     loc_47EC0(pc), a0
loc_47E8A:
                
                addq.w  #8,a0
                cmpi.w  #$FFFF,(a0)
                beq.w   loc_47EC2
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
                cmp.b   (a0),d1
                bne.s   loc_47E8A
                move.w  2(a0),d1
                jsr     j_CheckFlag
                bne.s   loc_47E8A
                clr.w   d0
                move.b  1(a0),d0
                jsr     j_CheckTriggerRegionFlag
                beq.s   loc_47E8A
                jsr     j_SetFlag
                movea.l 4(a0),a0
loc_47EC0:
                
                trap    #MAPSCRIPT
loc_47EC2:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ExecuteBattleRegionCutscene

