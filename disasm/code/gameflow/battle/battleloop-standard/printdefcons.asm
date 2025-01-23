
; ASM FILE code\gameflow\battle\battleloop-standard\printdefcons.asm :
;

; =============== S U B R O U T I N E =======================================

; If EXTENDED_BATTLE_TURN_UPDATE is OFF, run when starting a new round while in debug mode.

PrintAllActivatedDefCons:
                
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   @Return
                
                moveq   #0,d0
                move.w  #BATTLE_REGION_FLAGS_START,d1
                moveq   #15,d7
                
@Loop:          jsr     CheckFlag
                beq.s   @RegionInactive
                
                move.l  d0,((DIALOGUE_NUMBER-$1000000)).w
                txt     463             ; "DEF-CON No. {#} has been{N}implemented.{D3}"
@RegionInactive:
                
                addq.w  #1,d0
                addq.w  #1,d1
                dbf     d7,@Loop
                
                clsTxt
@Return:        rts

    ; End of function PrintAllActivatedDefCons


; =============== S U B R O U T I N E =======================================

; If EXTENDED_BATTLE_TURN_UPDATE is ON, run when activating a region for the first time while in debug mode.
;
; In: d2.w = newly activated regions bitfield

PrintNewlyActivatedDefCons:
                
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   @Return
                
                moveq   #0,d0
                moveq   #15,d7
                
@Loop:          btst    d0,d2
                beq.s   @RegionInactive
                
                move.l  d0,((DIALOGUE_NUMBER-$1000000)).w
                txt     463             ; "DEF-CON No. {#} has been{N}implemented.{D3}"
@RegionInactive:
                
                addq.w  #1,d0
                dbf     d7,@Loop
                
                clsTxt
@Return:        rts

    ; End of function PrintAllActivatedDefCons

