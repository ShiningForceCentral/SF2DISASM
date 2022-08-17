
; ASM FILE code\specialscreens\segalogo\segalogo_1.asm :
; 0x28FCC..0x28FF0 : SEGA logo functions

; =============== S U B R O U T I N E =======================================


VInt_CheckDebugModeCheat:
                
                movea.l ((ENTITY_WALKING_PARAMS-$1000000)).w,a0
                cmpi.b  #$FF,(a0)
                bne.s   CheckDebugModeInputSequence

    ; End of function VInt_CheckDebugModeCheat


; =============== S U B R O U T I N E =======================================


VInt_ActivateDebugModeCheat:
                
                move.b  #$FF,((DEBUG_MODE_ACTIVATED-$1000000)).w
                sndCom  MUSIC_CURSED_ITEM
                rts

    ; End of function VInt_ActivateDebugModeCheat


; =============== S U B R O U T I N E =======================================


CheckDebugModeInputSequence:
                
                move.b  (a0),d0
                cmp.b   ((P1_INPUT-$1000000)).w,d0
                bne.s   @Return
                addq.l  #1,((ENTITY_WALKING_PARAMS-$1000000)).w
@Return:
                
                rts

    ; End of function CheckDebugModeInputSequence

