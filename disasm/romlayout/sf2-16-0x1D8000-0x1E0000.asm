
; GAME SECTION 16 :
; 0x1D8000 : Icons

; FREE SPACE : 126 bytes.


p_Icons:            dc.l Icons
Icons:              incbin "graphics/icons/icons.bin"
										align $8000
