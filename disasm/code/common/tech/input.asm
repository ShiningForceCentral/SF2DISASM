
; ASM FILE code\common\tech\input.asm :
; 0x150E..0x1600 : Input functions

; =============== S U B R O U T I N E =======================================

; converts data ports 1/2 information into P1/2 inputs State A/B


UpdatePlayerInputs:
                
                lea     ((P1_INPUT-$1000000)).w,a5
                lea     (DATA1).l,a6    
                bsr.s   loc_151C        ; do it with DATA1 and then DATA2
                addq.w  #2,a6
loc_151C:
                
                move.b  #0,(a6)
                nop
                nop
                move.b  (a6),d6
                move.b  #$40,(a6) 
                lsl.b   #2,d6
                andi.b  #$C0,d6
                move.b  (a6),d7
                move.b  #0,(a6)
                andi.b  #$3F,d7 
                or.b    d7,d6
                move.b  (a6),d7
                move.b  #$40,(a6) 
                not.b   d6
                move.b  d6,(a5)+        ; state A
                move.b  (a6),d7
                move.b  #0,(a6)
                nop
                nop
                move.b  (a6),d6
                move.b  #$40,(a6) 
                lsl.b   #2,d6
                andi.b  #$C0,d6
                move.b  (a6),d7
                move.b  #0,(a6)
                andi.b  #$3F,d7 
                or.b    d7,d6
                move.b  (a6),d7
                move.b  #$40,(a6) 
                not.b   d6
                move.b  d6,(a5)+        ; state B
                move.b  (a6),d7
                rts

    ; End of function UpdatePlayerInputs


; =============== S U B R O U T I N E =======================================


WaitForPlayerInput:
                
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT|INPUT_B|INPUT_C|INPUT_A|INPUT_START,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.s   @Return
                bsr.w   WaitForVInt
                bra.s   WaitForPlayerInput
@Return:
                
                rts

    ; End of function WaitForPlayerInput


; =============== S U B R O U T I N E =======================================


WaitForPlayer1NewInput:
                
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT|INPUT_B|INPUT_C|INPUT_A|INPUT_START,((P1_INPUT-$1000000)).w
                beq.s   @Wait
                bsr.w   WaitForVInt
                bra.s   WaitForPlayer1NewInput
@Wait:
                
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT|INPUT_B|INPUT_C|INPUT_A|INPUT_START,((P1_INPUT-$1000000)).w
                bne.s   @Return
                bsr.w   WaitForVInt
                bra.s   @Wait
@Return:
                
                rts

    ; End of function WaitForPlayer1NewInput


; =============== S U B R O U T I N E =======================================

; unused


sub_15A4:
                
                movem.l d7,-(sp)
                move.b  ((P1_INPUT-$1000000)).w,d7
                and.b   ((byte_FFDE9E-$1000000)).w,d7
                beq.s   loc_15CA
                addq.b  #1,((byte_FFDE9F-$1000000)).w
                move.b  ((byte_FFDE9F-$1000000)).w,d7
                cmpi.b  #$A,d7
                bcc.s   loc_15CA
                clr.b   ((P1_INPUT-$1000000)).w
                movem.l (sp)+,d7
                rts
loc_15CA:
                
                clr.b   ((byte_FFDE9E-$1000000)).w
                clr.b   ((byte_FFDE9F-$1000000)).w
                movem.l (sp)+,d7
                rts

    ; End of function sub_15A4


; =============== S U B R O U T I N E =======================================


WaitForInputFor1Second:
                
                movem.l d5,-(sp)
                moveq   #59,d5          ; number of frames to wait, minus one
WaitForInput_Loop:
                
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT|INPUT_B|INPUT_C|INPUT_A|INPUT_START,((P1_INPUT-$1000000)).w
                bne.s   @Done
                bsr.w   WaitForVInt
                dbf     d5,WaitForInput_Loop
@Done:
                
                movem.l (sp)+,d5
                rts

    ; End of function WaitForInputFor1Second


; =============== S U B R O U T I N E =======================================


WaitForInputFor3Seconds:
                
                movem.l d5,-(sp)
                move.l  #179,d5
                bra.s   WaitForInput_Loop

    ; End of function WaitForInputFor3Seconds

