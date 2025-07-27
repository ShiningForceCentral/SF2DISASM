
; ASM FILE code\gameflow\battle\cutscenes\regionactivatedcutscenes.asm :
; 0x47E82..0x47EC8 : Region-activated cutscenes functions

; =============== S U B R O U T I N E =======================================

; Execute cutscenes activated by regions.


ExecuteBattleRegionCutscene:
                
                module
                movem.l d0-d1/a0,-(sp)
                lea     table_BattleRegionCutscenes-8(pc), a0
@Loop:
                
                addq.w  #8,a0
                cmpi.w  #TERMINATOR_WORD,(a0)
                beq.w   @Done
                
                ; Are there any cutscenes for the current battle?
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
                cmp.b   (a0),d1
                bne.s   @Loop
                
                ; Has cutscene already been played?
                move.w  2(a0),d1
                jsr     j_CheckFlag
                bne.s   @Loop
                
                ; Is region triggered?
                clr.w   d0
                move.b  1(a0),d0
                jsr     j_CheckTriggerRegionFlag
                beq.s   @Loop
                
                ; Play cutscene
                jsr     j_SetFlag
                movea.l 4(a0),a0
loc_47EC0:
                
                trap    #MAPSCRIPT
@Done:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ExecuteBattleRegionCutscene

                modend
