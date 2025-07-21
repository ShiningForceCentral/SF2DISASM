
; GAME SECTION 11 :
; 0x130000..0x180000 : Enemy battlesprites
; FREE SPACE : 429 bytes.


                includeIfVanilla "code\common\tech\pointers\s11_enemybattlespritespointer.asm"    ; Game Section 11 Enemy Battlesprites Pointer
                includeIfVanilla "data\graphics\battles\battlesprites\enemies\entries.asm"    ; Enemy battlesprites
                alignIfVanilla $180000
