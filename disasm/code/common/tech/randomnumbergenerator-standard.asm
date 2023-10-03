
; ASM FILE code\common\tech\randomnumbergenerator-standard.asm :
; RNG functions

; =============== S U B R O U T I N E =======================================

; In: d6.w = Value range, Out: d7.w = Random value


GenerateRandomNumber:
                
                move.w  (RANDOM_SEED).l,d7
                mulu.w  #$D,d7
                addi.w  #7,d7
                andi.l  #$FFFF,d7
                move.w  d7,(RANDOM_SEED).l
                move.w  d6,-(sp)
                add.w   d6,d6
                mulu.w  d6,d7
                swap    d7
                move.w  (sp)+,d6
                lsr.w   #1,d7
                rts

    ; End of function GenerateRandomNumber


; =============== S U B R O U T I N E =======================================

; Debug mode allows values 0-3 depending on player direction.
; 
;   In: d0.w = Value range, Out: d0.w = Random or debug value


GenerateRandomOrDebugNumber:
                
                move.l  d6,-(sp)
                move.l  d7,-(sp)
                move.w  d0,d6
                tst.b   (DEBUG_MODE_TOGGLE).l
                beq.s   @Skip
                
                moveq   #0,d0
                btst    #INPUT_BIT_RIGHT,((PLAYER_1_INPUT-$1000000)).w
                bne.s   @Done
                moveq   #1,d0
                btst    #INPUT_BIT_UP,((PLAYER_1_INPUT-$1000000)).w
                bne.s   @Done
                moveq   #2,d0
                btst    #INPUT_BIT_LEFT,((PLAYER_1_INPUT-$1000000)).w
                bne.s   @Done
                moveq   #3,d0
                btst    #INPUT_BIT_DOWN,((PLAYER_1_INPUT-$1000000)).w
                bne.s   @Done
@Skip:
                
                bsr.s   GenerateRandomNumber
                move.w  d7,d0
@Done:
                
                move.l  (sp)+,d7
                move.l  (sp)+,d6
                rts

    ; End of function GenerateRandomOrDebugNumber

