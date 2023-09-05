
; GAME SECTION 15 :
; 0x1C8000..0x1D8000 : Portraits
; FREE SPACE : 1467 bytes.


                includeIfVanilla "code\common\tech\pointers\s15_portraitspointer.asm"    ; Game Section 15 Portraits Pointer
                includeIfVanilla "data\graphics\portraits\entries.asm"    ; Portraits
                alignIfVanilla $1D8000
