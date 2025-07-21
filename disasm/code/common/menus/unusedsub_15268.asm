
; ASM FILE code\common\menus\unusedsub_15268.asm :
; 0x15268..0x15284 : Unused menu engine function

; =============== S U B R O U T I N E =======================================

; unused


sub_15268:
                
                lea     (byte_FFCC86).l,a0
                move.l  #$C020C020,-$50(a0)
                moveq   #$C,d7
loc_15278:
                
                move.l  #$C020C020,(a0)+
                dbf     d7,loc_15278
                rts

    ; End of function sub_15268

