
; ASM FILE code\common\tech\randomnumbergenerator.asm :
; 0x1600..0x16BE : RNG functions

; =============== S U B R O U T I N E =======================================

; In: d6.w = Value range, Out: d7.w = Random value


GenerateRandomNumber:
                
                move.w  (RANDOM_SEED).l,d7
                mulu.w  #13,d7
                addi.w  #7,d7
                andi.l  #WORD_MASK,d7
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

; unused


WaitForRandomValueToMatch:
                
                movem.l d0-d5/a0-a6,-(sp)
                move.b  d6,d1
loc_162E:
                
                bsr.w   GenerateRandomValueUnsigned
                cmpi.b  #1,d1
                beq.s   loc_163A
                bpl.s   loc_163E
loc_163A:
                
                bra.w   loc_164A
loc_163E:
                
                cmp.b   d1,d7
                bcs.s   loc_1644
                bra.s   loc_162E
loc_1644:
                
                movem.l (sp)+,d0-d5/a0-a6
                rts
loc_164A:
                
                clr.b   d7
                movem.l (sp)+,d0-d5/a0-a6
                rts

    ; End of function WaitForRandomValueToMatch


; =============== S U B R O U T I N E =======================================

; unused


GenerateRandomValueUnsigned:
                
                movem.l d0-d5/a0-a6,-(sp)
                lea     (RANDOM_WAITING_FOR_INPUT).l,a0
                clr.w   d7
                move.w  (a0),d7
                mulu.w  #541,d7
                addi.w  #12345,d7
                move.w  d7,(a0)
                andi.w  #BYTE_MASK,d7
                movem.l (sp)+,d0-d5/a0-a6
                rts

    ; End of function GenerateRandomValueUnsigned


; =============== S U B R O U T I N E =======================================

; Debug mode allows values 0-3 depending on player direction.
; 
;   In: d0.w = Value range, Out: d0.w = Random or debug value


GenerateRandomOrDebugNumber:
                
                movem.l d6-d7,-(sp)
                move.w  d0,d6
                tst.b   (DEBUG_MODE_TOGGLE).l
                beq.s   @Skip
                
                moveq   #0,d0
                btst    #INPUT_BIT_RIGHT,((PLAYER_1_INPUT-$1000000)).w
                bne.w   @Done
                moveq   #1,d0
                btst    #INPUT_BIT_UP,((PLAYER_1_INPUT-$1000000)).w
                bne.w   @Done
                moveq   #2,d0
                btst    #INPUT_BIT_LEFT,((PLAYER_1_INPUT-$1000000)).w
                bne.w   @Done
                moveq   #3,d0
                btst    #INPUT_BIT_DOWN,((PLAYER_1_INPUT-$1000000)).w
                bne.w   @Done
@Skip:
                
                bsr.w   GenerateRandomNumber
                move.w  d7,d0
@Done:
                
                movem.l (sp)+,d6-d7
                rts

    ; End of function GenerateRandomOrDebugNumber

