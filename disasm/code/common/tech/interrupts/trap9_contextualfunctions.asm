
; ASM FILE code\common\tech\interrupts\trap9_contextualfunctions.asm :
; 0x7CE..0x8DE : Trap 9 - Contextual Functions Management

; =============== S U B R O U T I N E =======================================


Trap9_ManageContextualFunctions:
                
                movem.l d0-a6,-(sp)
                move    sr,d6
                move    #$2700,sr
                movea.l $3E(sp),a6
                move.w  (a6)+,d0
                addq.l  #2,$3E(sp)
                add.w   d0,d0
                move.w  rjt_Trap9ActionsOfs(pc,d0.w),d0
                jmp     rjt_Trap9ActionsOfs(pc,d0.w) ; jump according to the first two bytes parameter : $0000 to $0004

    ; End of function Trap9_ManageContextualFunctions

rjt_Trap9ActionsOfs:
                dc.w Trap9_ClearPointers-rjt_Trap9ActionsOfs
                dc.w Trap9_SetFunctionAndTrigger-rjt_Trap9ActionsOfs
                dc.w Trap9_ClearFunctionAndTrigger-rjt_Trap9ActionsOfs
                dc.w Trap9_ClearTrigger-rjt_Trap9ActionsOfs
                dc.w Trap9_SetTrigger-rjt_Trap9ActionsOfs

; =============== S U B R O U T I N E =======================================


Trap9_ClearPointers:
                
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
                bra.w   loc_8D6

    ; End of function Trap9_ClearPointers


; =============== S U B R O U T I N E =======================================


Trap9_SetFunctionAndTrigger:
                
                move.l  (a6)+,d0
                addq.l  #4,$3E(sp)
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
loc_822:
                
                tst.l   (a0)+
                beq.w   loc_832
                addq.w  #1,d1
                dbf     d7,loc_822
                bra.w   loc_8D6
loc_832:
                
                move.l  d0,-(a0)
                bset    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   loc_8D6

    ; End of function Trap9_SetFunctionAndTrigger


; =============== S U B R O U T I N E =======================================


Trap9_ClearFunctionAndTrigger:
                
                move.l  (a6)+,d0
                addq.l  #4,$3E(sp)
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
loc_84A:
                
                cmp.l   (a0)+,d0
                beq.w   loc_85A
                addq.w  #1,d1
                dbf     d7,loc_84A
                bra.w   loc_8D6
loc_85A:
                
                clr.l   -(a0)
                bclr    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   loc_8D6

    ; End of function Trap9_ClearFunctionAndTrigger


; =============== S U B R O U T I N E =======================================


Trap9_ClearTrigger:
                
                addq.l  #4,$3E(sp)
                move.l  (a6)+,d0
                beq.w   loc_88E
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
loc_876:
                
                cmp.l   (a0)+,d0
                beq.w   loc_886
                addq.w  #1,d1
                dbf     d7,loc_876
                bra.w   loc_8D6
loc_886:
                
                bclr    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   loc_8D6
loc_88E:
                
                clr.b   ((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   loc_8D6

    ; End of function Trap9_ClearTrigger


; =============== S U B R O U T I N E =======================================


Trap9_SetTrigger:
                
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
                addq.l  #4,$3E(sp)
                move.l  (a6)+,d0
                beq.w   loc_8C0
loc_8A8:
                
                cmp.l   (a0)+,d0
                beq.w   loc_8B8         
                addq.w  #1,d1
                dbf     d7,loc_8A8
                bra.w   loc_8D6
loc_8B8:
                
                bset    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w 
                                                        ; set trigger
                bra.w   loc_8D6
loc_8C0:
                
                clr.w   d0
                clr.w   d1
                moveq   #7,d7
loc_8C6:
                
                tst.l   (a0)+
                beq.s   loc_8CC
                bset    d1,d0
loc_8CC:
                
                addq.w  #1,d1
                dbf     d7,loc_8C6
                move.b  d0,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
loc_8D6:
                
                move    d6,sr
                movem.l (sp)+,d0-a6
                rte

    ; End of function Trap9_SetTrigger
