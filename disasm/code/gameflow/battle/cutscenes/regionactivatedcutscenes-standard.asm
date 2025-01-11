
; ASM FILE code\gameflow\battle\cutscenes\regionactivatedcutscenes-standard.asm :
; Integrate CheckTriggerRegionFlag helper function originally from section 13.

; =============== S U B R O U T I N E =======================================

; Execute cutscenes activated by regions.


ExecuteBattleRegionCutscene:
                
                movem.l d0-d1/a0,-(sp)
                lea     table_BattleRegionCutscenes(pc), a0
                getSavedByte CURRENT_BATTLE, d2
@Loop:
                
                cmpi.w  #TERMINATOR_WORD,(a0)
                beq.s   @Done
                
                ; Are there any cutscenes for the current battle?
                cmp.b   (a0),d2
                bne.s   @Next
                
                ; Has cutscene already been played?
                move.w  2(a0),d1
                jsr     CheckFlag
                bne.s   @Next
                
                ; Is region triggered?
                clr.w   d1
                move.b  1(a0),d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     CheckFlag
                bne.s   @PlayCutscene
@Next:
                
                addq.w  #8,a0
                bra.s   @Loop
@PlayCutscene:
                ; Play cutscene
                jsr     SetFlag
                movea.l 4(a0),a0
                trap    #MAPSCRIPT
@Done:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ExecuteBattleRegionCutscene

