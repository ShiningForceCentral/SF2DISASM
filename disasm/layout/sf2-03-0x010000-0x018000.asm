
; GAME SECTION 03 :
; 0x010000..0x018000 : Menu Engine
; FREE SPACE : 38 bytes.


                include "code\common\tech\jumpinterfaces\s03_jumpinterface_1.asm"    ; Game Section 03 Jump Interface, part 1
                includeIfVanilla "code\common\tech\pointers\s03_pointers.asm"    ; Game Section 03 Pointers
                include "code\common\tech\jumpinterfaces\s03_jumpinterface_2.asm"    ; Game Section 03 Jump Interface, part 2
                includeIfVanilla "code\common\tech\pointers\s03_memberstatuswindowlayoutpointer.asm"    ; Game Section 03 Member Status Window Layout Pointer
                include "code\common\menus\menuengine_01.asm"    ; Menu engine
                include "code\common\menus\loadhighlightableicon.asm"    ; Load highlightable icon function
                include "code\common\menus\magicmenu.asm"    ; Magic menu actions
                include "data\graphics\tech\menus\diamondmenulayout.asm"    ; Diamond menu layout
            if (STANDARD_BUILD&EXTENDED_SPELL_NAMES=1)
                include "data\graphics\tech\menus\magicmenulayout-extendedspellnames.asm"
            else
                include "data\graphics\tech\menus\magicmenulayout.asm"    ; Magic menu layout
            endif
                include "data\graphics\tech\menus\itemmenulayout.asm"    ; Item menu layout
                include "code\common\menus\menuengine_02.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\battleequipwindowlayout.asm"    ; Battle equip window layout
                include "code\common\menus\menuengine_03.asm"    ; Menu engine
                includeIfStandard "code\common\menus\buildfighterministatuswindow-standard.asm"
                includeIfVanilla "code\common\menus\buildfighterministatuswindow.asm"    ; Build fighter mini status window function
                include "data\graphics\tech\windowlayouts\fighterministatuswindowlayout.asm"    ; Fighter mini status window layout
                include "code\common\menus\menuengine_04.asm"    ; Menu engine
                includeIfStandard "code\common\menus\buildmemberstatswindow-standard.asm"
                includeIfStandard "code\common\menus\getcombatantportrait-standard.asm"
                includeIfVanilla "code\common\menus\buildmemberstatswindow.asm"    ; Build member stats window function
                includeIfVanilla "code\common\menus\unusedsub_12606.asm"    ; Unused function
                includeIfVanilla "code\common\menus\getcombatantportrait.asm"    ; Get combatant portrait index function
                include "data\graphics\tech\windowborder\entries.asm"    ; Windows border compressed tiles
                include "data\graphics\tech\windowlayouts\portraitwindowlayout.asm"    ; Member screen portrait window layout
                include "data\graphics\tech\windowlayouts\allykilldefeatwindowlayout.asm"    ; Member screen kills and defeat window layout
                include "data\graphics\tech\windowlayouts\goldwindowlayout.asm"    ; Member screen gold window layout
                include "code\common\menus\menuengine_05.asm"    ; Menu engine
                includeIfStandard "code\common\menus\writememberlisttext-standard.asm"
                includeIfVanilla "code\common\menus\writememberlisttext.asm"    ; Write member list text function
                include "code\common\menus\menuengine_06.asm"    ; Menu engine
                includeIfVanilla "code\common\menus\unusedsub_156A8.asm"    ; Unused window functions
                includeIfVanilla "code\common\menus\getallyportrait.asm"    ; Get ally portrait index function
                include "code\common\menus\menuengine_07.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\battleconfigwindowlayout.asm"    ; Battle config window layout
                include "code\common\menus\menuengine_08.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\alphabetwindowlayout.asm"    ; Alphabet window layout
            if (STANDARD_BUILD&EIGHT_CHARACTERS_MEMBER_NAMES=1)
                include "data\graphics\tech\windowlayouts\namecharacterentrywindowlayout-menuenhancements.asm"
            else
                include "data\graphics\tech\windowlayouts\namecharacterentrywindowlayout.asm"    ; Name character entry window layout
            endif
                include "data\graphics\tech\alphabethighlight\entries.asm"    ; Alphabet Highlight Tiles
                include "code\common\menus\menuengine_09.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\timerwindowlayout.asm"    ; Timer window layout
                include "code\specialscreens\witch\witchmainmenu.asm"    ; Witch main menu
                include "code\common\menus\menuengine_10.asm"    ; Menu engine
                
                includeIfVanilla "data\graphics\tech\windowlayouts\memberstatswindowlayout.asm"    ; Member stats window layout
                includeIfVanilla "data\stats\items\itemdefs.asm"    ; Item definitions
                includeIfVanilla "data\stats\spells\spelldefs.asm"    ; Spell definitions
                includeIfVanilla "data\stats\items\itemnames.asm"    ; Item names
                alignIfVanilla
                includeIfVanilla "data\stats\allies\classes\classnames.asm"    ; Class names
                alignIfVanilla $18000
