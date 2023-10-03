
; GAME SECTION 10 :
; 0x100000..0x130000 : Backgrounds, invocation sprites, title screen
; FREE SPACE : 432 bytes.


                includeIfVanilla "code\common\tech\pointers\s10_pointers.asm"    ; Game Section 10 Pointers
                
                includeIfStandard "code\gameflow\start\gameinit-standard.asm"    ; Game init
                includeIfStandard "code\gameflow\special\battletest-standard.asm"    ; Battle test functions
                includeIfStandard "code\gameflow\start\gameintro-standard.asm"    ; Game intro
                include "code\specialscreens\title\title.asm"    ; Title screen functions
                includeIfStandard "code\specialscreens\title\loadfont.asm"    ; Title screen font loading function
                includeIfStandard "code\common\tech\incbins\s06_incbins_titlescreen.asm"    ; Game Section 06 Incbin Directives, part 2
                include "code\specialscreens\title\graphics.asm"    ; Title Screen Graphics
                include "data\graphics\specialscreens\titlescreen\titlescreenlayouts.asm"    ; Title Screen Layouts
                includeIfStandard "code\specialscreens\witch\witchstart-standard.asm"    ; Start witch screen
                includeIfStandard "code\gameflow\special\configurationmode.asm"    ; Configuration mode function
                includeIfStandard "code\specialscreens\witch\soundtest-standard.asm"    ; Restored sound test
                includeIfStandard "code\specialscreens\suspend\suspend.asm"    ; Suspend functions
                includeIfStandard "code\specialscreens\witchend\witchend.asm"    ; Witch end functions
            if (MEMORY_MAPPER=1)
                includeIfStandard "code\common\tech\mappererrorhandling-standard.asm"
            endif
            if (CHAPTER_SCREEN=1)
                includeIfStandard "code\specialscreens\chapter\chapter.asm"
                alignIfStandard
                includeIfStandard "code\specialscreens\chapter\graphics.asm"
                alignIfStandard
            endif
                
                includeIfVanilla "data\graphics\battles\backgrounds\entries.asm"    ; Battlescene Backgrounds
                includeIfVanilla "data\graphics\battles\spells\invocations\entries.asm"    ; Invocation sprites
                alignIfVanilla $130000
