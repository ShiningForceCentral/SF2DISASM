
; ASM FILE code\gameflow\battle\cutscenes\regionactivatedcutscenes.asm :
; 0x47E82..0x47EC8 : Region-activated cutscenes functions

; =============== S U B R O U T I N E =======================================

; Execute cutscenes activated by regions.


ExecuteBattleRegionCutscene:
                
                module
                movem.l d0-d1/a0,-(sp)
                lea     table_BattleRegionCutscenes-8(pc), a0
@CheckEntry_Loop:
                
                addq.w  #8,a0
                cmpi.w  #-1,(a0)
                beq.w   @Done
                
                 ; Are there any cutscenes for the current battle?
                getSavedByte CURRENT_BATTLE, d1
                cmp.b   (a0),d1         ; check battle match
                bne.s   @CheckEntry_Loop
                
                ; Has cutscene already been played?
                move.w  2(a0),d1        ; get associated flag
                jsr     j_CheckFlag
                bne.s   @CheckEntry_Loop
                
                ; Is region triggered?
                clr.w   d0
                move.b  1(a0),d0        ; get associated region
                jsr     j_CheckTriggerRegionFlag
                beq.s   @CheckEntry_Loop
                
                ; Play cutscene
                jsr     j_SetFlag
                movea.l 4(a0),a0        ; get cutscene script address
                trap    #MAPSCRIPT
@Done:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ExecuteBattleRegionCutscene

                modend
