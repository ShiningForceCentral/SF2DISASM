
; GAME SECTION 16 :
; 0x1D8000..0x1E0000 : Icons
; FREE SPACE : 126 bytes.


                includeIfVanillaLayout "code\common\tech\pointers\s16_iconspointer.asm"    ; Game Section 16 Icons Pointer
                include "data\graphics\icons\entries.asm"    ; Icons
                align $1E0000
