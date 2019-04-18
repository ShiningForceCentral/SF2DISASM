
; GAME SECTION 18 :
; 0x1F0000..0x200000 : Music banks 1 and 0
; FREE SPACE : 1038 bytes.


                incbin "data/sound/musicbank1.bin"
                incbin "data/sound/musicbank0.bin" ; music data relative pointer table
