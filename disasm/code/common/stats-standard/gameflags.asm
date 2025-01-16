
; ASM FILE code\common\stats-standard\gameflags.asm :
; Game progression flags management functions

; =============== S U B R O U T I N E =======================================


CheckFlag:
                
                movem.l d0-d1/a0,-(sp)
                bsr.s   GetFlag
                and.b   (a0),d0
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function CheckFlag


; =============== S U B R O U T I N E =======================================


SetFlag:
                
                movem.l d0-d1/a0,-(sp)
                bsr.s   GetFlag   
                or.b    d0,(a0)
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function SetFlag


; =============== S U B R O U T I N E =======================================


ClearFlag:
                
                movem.l d0-d1/a0,-(sp)
                bsr.s   GetFlag
                eori.b  #$FF,d0
                and.b   d0,(a0)
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ClearFlag


; =============== S U B R O U T I N E =======================================

; flag bit check pattern based on bit number D1 -> D0


GetFlag:
                
                andi.l  #FLAG_MASK,d1
                divu.w  #8,d1           ; get the byte in which the flag is stored
                loadSavedDataAddress GAME_FLAGS, a0
                addToSavedBytePointer d1, a0           ; go to the concerned byte
                swap    d1
                moveq   #$FFFFFF80,d0
                lsr.b   d1,d0
                rts

    ; End of function GetFlag

