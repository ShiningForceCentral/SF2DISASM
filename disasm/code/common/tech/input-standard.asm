
; ASM FILE code\common\tech\input.asm :
; Input functions

; =============== S U B R O U T I N E =======================================

; Convert data ports 1/2 information into P1/2 inputs State A/B.


UpdatePlayerInputs:
                
                lea     ((PLAYER_1_INPUT-$1000000)).w,a5
                lea     (DATA1).l,a6    
                bsr.s   @loc_1          ; do it with DATA1 and then DATA2
                addq.w  #2,a6
                
@loc_1:         move.b  #0,(a6)
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

                module
@Wait:          bsr.w   WaitForVInt
WaitForPlayerInput:
                
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT|INPUT_B|INPUT_C|INPUT_A|INPUT_START,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @Wait
                rts
                modend

    ; End of function WaitForPlayerInput
