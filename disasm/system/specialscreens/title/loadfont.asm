
; SCRIPT SECTION system\specialscreens\title\loadfont :
; Title screen font loading function

; =============== S U B R O U T I N E =======================================

LoadTitleScreenFont:
										
										lea     StaticWidthFont(pc), a0
										lea     (FF6802_LOADING_SPACE).l,a1
										jsr     (LoadTileData).w
										lea     (FF6802_LOADING_SPACE).l,a0
										lea     ($B000).l,a1
										move.w  #$800,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										lea     (byte_FFE000).l,a0
										move.w  #$6200,d0
										move.w  #$3FF,d7
loc_2C76E:
										
										move.w  #0,(a0)+
										addq.w  #1,d0
										dbf     d7,loc_2C76E
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$380,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										lea     TitleScreenPalettes(pc), a0
										lea     (PALETTE_4_BIS).l,a1
										moveq   #$20,d7 
										jsr     (CopyBytes).w   
										rts

	; End of function LoadTitleScreenFont

