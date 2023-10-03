
; ASM FILE code\common\tech\interrupts\trap9_contextualfunctions.asm :
; 0x7CE..0x8DE : Trap 9 - Contextual Functions Management

; =============== S U B R O U T I N E =======================================


Trap9_ManageContextualFunctions:
                
                module
                movem.l d0-a6,-(sp)
                move    sr,d6
                move    #$2700,sr       ; disable interrupts
                movea.l $3E(sp),a6
                move.w  (a6)+,d0
                addq.l  #2,$3E(sp)
                add.w   d0,d0
                move.w  rjt_Trap9Actions(pc,d0.w),d0
                jmp     rjt_Trap9Actions(pc,d0.w) ; jump according to the first two bytes parameter : $0000 to $0004

    ; End of function Trap9_ManageContextualFunctions

rjt_Trap9Actions:
                dc.w trap9_ClearPointers-rjt_Trap9Actions
                dc.w trap9_SetFunctionAndTrigger-rjt_Trap9Actions
                dc.w trap9_ClearFunctionAndTrigger-rjt_Trap9Actions
                dc.w trap9_ClearTrigger-rjt_Trap9Actions
                dc.w trap9_SetTrigger-rjt_Trap9Actions

; =============== S U B R O U T I N E =======================================


trap9_ClearPointers:
                
                moveq   #0,d0
                clr.b   ((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                bra.w   trap9_End

    ; End of function trap9_ClearPointers


; =============== S U B R O U T I N E =======================================


trap9_SetFunctionAndTrigger:
                
                move.l  (a6)+,d0
                addq.l  #4,$3E(sp)
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
@SetFunction_Loop:
                
                tst.l   (a0)+
                beq.w   @SetFunction
                addq.w  #1,d1
                dbf     d7,@SetFunction_Loop
                
                bra.w   trap9_End
@SetFunction:
                
                move.l  d0,-(a0)
                bset    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   trap9_End

    ; End of function trap9_SetFunctionAndTrigger


; =============== S U B R O U T I N E =======================================


trap9_ClearFunctionAndTrigger:
                
                move.l  (a6)+,d0
                addq.l  #4,$3E(sp)
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
@ClearFunction_Loop:
                
                cmp.l   (a0)+,d0
                beq.w   @ClearFunction
                addq.w  #1,d1
                dbf     d7,@ClearFunction_Loop
                
                bra.w   trap9_End
@ClearFunction:
                
                clr.l   -(a0)
                bclr    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   trap9_End

    ; End of function trap9_ClearFunctionAndTrigger


; =============== S U B R O U T I N E =======================================


trap9_ClearTrigger:
                
                addq.l  #4,$3E(sp)
                move.l  (a6)+,d0
                beq.w   @ClearAllTriggers
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
@ClearTrigger_Loop:
                
                cmp.l   (a0)+,d0
                beq.w   @ClearTrigger
                addq.w  #1,d1
                dbf     d7,@ClearTrigger_Loop
                
                bra.w   trap9_End
@ClearTrigger:
                
                bclr    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   trap9_End
@ClearAllTriggers:
                
                clr.b   ((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   trap9_End

    ; End of function trap9_ClearTrigger


; =============== S U B R O U T I N E =======================================


trap9_SetTrigger:
                
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
                addq.l  #4,$3E(sp)
                move.l  (a6)+,d0
                beq.w   @loc_3
@loc_1:
                
                cmp.l   (a0)+,d0
                beq.w   @loc_2          
                addq.w  #1,d1
                dbf     d7,@loc_1
                
                bra.w   trap9_End
@loc_2:
                
                bset    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w 
                                                        ; set trigger
                bra.w   trap9_End
@loc_3:
                
                clr.w   d0
                clr.w   d1
                moveq   #7,d7
@loc_4:
                
                tst.l   (a0)+
                beq.s   @loc_5
                bset    d1,d0
@loc_5:
                
                addq.w  #1,d1
                dbf     d7,@loc_4
                
                move.b  d0,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
trap9_End:
                
                move    d6,sr
                movem.l (sp)+,d0-a6
                rte

    ; End of function trap9_SetTrigger

                modend
