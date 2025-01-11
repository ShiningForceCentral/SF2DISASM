
; ASM FILE code\gameflow\battle\battleloop\loadbattleterraindata.asm :
; 0x1AD0DC..0x1AD104 : Load battle terrain data function

; =============== S U B R O U T I N E =======================================


LoadBattleTerrainData:
                
                movem.l d0-d6/a0-a5,-(sp)
            if (STANDARD_BUILD=1)
                getPointer p_pt_BattleTerrainData, a0
            else
                lea     pt_BattleTerrainData(pc), a0
                nop
            endif
                loadSavedDataAddress CURRENT_BATTLE, a1
                clr.l   d1
                move.b  (a1),d1
                lsl.l   #2,d1
                movea.l (a0,d1.w),a0
                lea     (BATTLE_TERRAIN_ARRAY).l,a1
                jsr     (LoadStackCompressedData).w
                movem.l (sp)+,d0-d6/a0-a5
                rts

    ; End of function LoadBattleTerrainData

