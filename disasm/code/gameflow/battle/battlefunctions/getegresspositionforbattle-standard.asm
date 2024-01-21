
; ASM FILE code\gameflow\battle\battlefunctions\getegresspositionforbattle-standard.asm :
; 

; =============== S U B R O U T I N E =======================================


GetEgressPositionForBattle:
                
                movem.l d1-d2/a0,-(sp)
                lea     table_EgressPositionsForBattles(pc), a0
                getSavedByte CURRENT_BATTLE, d1
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @GetEgressMap
                move.b  (a0),d0
                cmpi.b  #-1,d0
                bne.s   @Continue
                addi.w  #BATTLE_UNLOCKED_FLAGS_START,d1
                jsr     ClearFlag
@GetEgressMap:  getSavedByte EGRESS_MAP, d0
@Continue:      movem.l (sp)+,d1-d2/a0
                jmp     (GetSavepointForMap).w

    ; End of function GetEgressPositionForBattle

