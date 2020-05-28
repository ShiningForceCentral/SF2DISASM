
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
                
                andi.b  #$FF,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.s   return_1584
                bsr.w   WaitForVInt
                bra.s   WaitForPlayerInput
return_1584:
                
                rts

    ; End of function WaitForPlayerInput


; =============== S U B R O U T I N E =======================================

WaitForPlayer1NewButtonPush:
                
                andi.b  #$FF,((P1_INPUT-$1000000)).w
                beq.s   loc_1594
                bsr.w   WaitForVInt
                bra.s   WaitForPlayer1NewButtonPush
loc_1594:
                
                andi.b  #$FF,((P1_INPUT-$1000000)).w
                bne.s   return_15A2
                bsr.w   WaitForVInt
                bra.s   loc_1594
return_15A2:
                
                rts

    ; End of function WaitForPlayer1NewButtonPush


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
                moveq   #$3B,d5 
loc_15DE:
                
                andi.b  #$FF,((P1_INPUT-$1000000)).w
                bne.s   loc_15EE
                bsr.w   WaitForVInt
                dbf     d5,loc_15DE
loc_15EE:
                
                movem.l (sp)+,d5
                rts

    ; End of function WaitForInputFor1Second


; =============== S U B R O U T I N E =======================================

WaitForInputFor3Seconds:
                
                movem.l d5,-(sp)
                move.l  #$B3,d5 
                bra.s   loc_15DE

    ; End of function WaitForInputFor3Seconds

