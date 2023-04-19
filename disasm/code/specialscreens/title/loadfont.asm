
; ASM FILE code\specialscreens\title\loadfont.asm :
; 0x2C73C..0x2C7A0 : Title screen font loading function

; =============== S U B R O U T I N E =======================================


LoadTitleScreenFont:
                
                lea     StaticWidthFont(pc), a0
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($B000).l,a1
                move.w  #$800,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                lea     (PLANE_B_LAYOUT).l,a0
                move.w  #$6200,d0
                move.w  #$3FF,d7
loc_2C76E:
                
                move.w  #0,(a0)+
                addq.w  #1,d0
                dbf     d7,loc_2C76E
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$380,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                lea     TitleScreenPalettes(pc), a0
                lea     (PALETTE_4_BASE).l,a1
                moveq   #$20,d7 
                jsr     (CopyBytes).w   
                rts

    ; End of function LoadTitleScreenFont

