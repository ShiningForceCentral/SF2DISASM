
; ASM FILE code\common\menus\item\isitemusableonfield.asm :
; 0x229CA..0x229E2 : Item menu function

; =============== S U B R O U T I N E =======================================

; Is item d1.b usable on field? Return d2.l = 0 if true.


IsItemUsableOnField:
                
                moveq   #0,d2
                lea     table_UsableOnFieldItems(pc), a0
                nop
@Loop:
                
                cmp.b   (a0)+,d1
                beq.w   @Return
                cmpi.b  #-1,(a0)
                bne.s   @Loop
                
                moveq   #-1,d2
@Return:
                
                rts

    ; End of function IsItemUsableOnField

