
; ASM FILE code\gameflow\battle\regionactivatedcutscenes.asm :
; 0x47E82..0x47EC8 : Region-activated cutscenes functions

; =============== S U B R O U T I N E =======================================

; executes cutscenes activated by regions


ExecuteBattleRegionCutscene:
                
                movem.l d0-d1/a0,-(sp)
                lea     table_BattleRegionCutscenes-8(pc), a0
@CheckEntry_Loop:
                
                addq.w  #8,a0
                cmpi.w  #-1,(a0)
                beq.w   @Done
                
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
                cmp.b   (a0),d1         ; check battle match
                bne.s   @CheckEntry_Loop
                move.w  2(a0),d1        ; get associated flag
                jsr     j_CheckFlag
                bne.s   @CheckEntry_Loop
                clr.w   d0
                move.b  1(a0),d0        ; get associated region
                jsr     j_CheckTriggerRegionFlag
                beq.s   @CheckEntry_Loop
                jsr     j_SetFlag
                movea.l 4(a0),a0        ; get cutscene script address
                trap    #MAPSCRIPT
@Done:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ExecuteBattleRegionCutscene

