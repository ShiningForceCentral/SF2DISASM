
; ASM FILE code\specialscreens\title\loadfont.asm :
; 0x2C73C..0x2C7A0 : Title screen font loading function

; =============== S U B R O U T I N E =======================================


LoadTitleScreenFont:
                
                lea     font_TitleScreen(pc), a0
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($B000).l,a1
                move.w  #2048,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                lea     (PLANE_B_LAYOUT).l,a0
                move.w  #$200|VDPTILE_PALETTE4,d0
                move.w  #1023,d7
@Loop:
                
                move.w  #0,(a0)+
                addq.w  #1,d0
                dbf     d7,@Loop
                
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #896,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                lea     palette_TitleScreenFont(pc), a0
                lea     (PALETTE_4_BASE).l,a1
                moveq   #CRAM_PALETTE_SIZE,d7
                jsr     (CopyBytes).w   
                rts

    ; End of function LoadTitleScreenFont

