
; GAME SECTION 06 :
; 0x028000..0x044000 : Fonts, Menu Tiles, Text Decoding Functions, SEGA Logo, Game Staff, Conf/Debug modes, End Kiss Sequence, Text Huffman Trees, Textbanks
; FREE SPACE : 6681 bytes.


                includeIfVanilla "code\common\tech\pointers\s06_textbankspointer.asm"    ; Game Section 06 Text Banks Pointer
                include "code\common\tech\jumpinterfaces\s06_jumpinterface_1.asm"    ; Game Section 06 Jump Interface, part 1
                includeIfVanilla "code\common\tech\pointers\s06_pointers.asm"    ; Game Section 06 Pointers
                include "code\common\tech\jumpinterfaces\s06_jumpinterface_2.asm"    ; Game Section 06 Jump Interface, part 2
                includeIfVanilla "code\common\tech\pointers\s06_gamestaffpointer.asm"    ; Game Section 06 Game Staff Pointer
                includeIfVanilla "code\common\tech\jumpinterfaces\s06_jumpinterface_3.asm"    ; Game Section 06 Jump Interface, part 3
                include "code\specialscreens\segalogo\segalogo_0.asm"    ; SEGA logo functions
                include "data\tech\configurationmodeinputsequence.asm"    ; Configuration mode input sequence
                align
                include "code\specialscreens\segalogo\segalogo_1.asm"    ; SEGA logo functions
                include "data\tech\debugmodeinputsequence.asm"    ; Debug mode input sequence
                align
                includeIfVanilla "code\common\tech\incbins\s06_incbins_graphics.asm"    ; Game Section 06 Incbin Directives, part 1
                includeIfVanilla "code\specialscreens\endkiss\endkissfunctions_0.asm"    ; End kiss function
                includeIfVanilla "code\specialscreens\title\loadfont.asm"    ; Title screen font loading function
                includeIfVanilla "code\common\tech\incbins\s06_incbins_titlescreen.asm"    ; Game Section 06 Incbin Directives, part 2
                include "code\common\scripting\text\decoding.asm"    ; Text decoding functions
                include "code\common\tech\incbins\s06_incbins_textbanktrees.asm"    ; Game Section 06 Incbin Directives, part 3
                include "data\scripting\text\entries.asm"    ; Textbank entries
                includeIfVanilla "data\scripting\gamestaff.asm"    ; Game Staff
                alignIfVanilla $44000
