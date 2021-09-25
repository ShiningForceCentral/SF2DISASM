
; GAME SECTION 03 :
; 0x010000..0x018000 : Menu Engine
; FREE SPACE : 38 bytes.


                include "code\common\menus\menuengine_01.asm"    ; Menu engine
                include "data\graphics\tech\menus\diamondmenulayout.asm"    ; Diamond menu layout
                
                if (EXTENDED_SPELL_NAMES=0)
                include "data\graphics\tech\menus\magicmenulayout.asm"    ; Magic menu layout
                else
                include "data\graphics\tech\menus\magicmenulayout-menuenhancements.asm"
                endif
                
                include "data\graphics\tech\menus\itemmenulayout.asm"    ; Item menu layout
                include "code\common\menus\menuengine_02.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\battleequipwindowlayout.asm"    ; Battle equip window layout
                include "code\common\menus\menuengine_03.asm"    ; Menu engine
                
                if (THREE_DIGITS_STATS|FULL_CLASS_NAMES=0)
                include "code\common\menus\buildfighterministatuswindow.asm"    ; Build fighter mini status window function
                else
                include "code\common\menus\buildfighterministatuswindow-menuenhancements.asm"
                endif
                
                include "data\graphics\tech\windowlayouts\fighterministatuswindowlayout.asm"    ; Fighter mini status window layout
                include "code\common\menus\menuengine_04.asm"    ; Menu engine
                
                if (THREE_DIGITS_STATS|FULL_CLASS_NAMES|ALTERNATE_JEWEL_ICONS_DISPLAY=0)
                include "code\common\menus\buildmemberstatswindow.asm"    ; Build member stats window function
                else
                include "code\common\menus\buildmemberstatswindow-menuenhancements.asm"
                endif
                
                include "code\common\menus\menuengine_05.asm"    ; Menu engine
                
                if (FORCE_MEMBERS_EXPANSION=1)
                include "code\common\menus\getcombatantportrait-expanded.asm"
                else
                include "code\common\menus\getcombatantportrait.asm"    ; Get combatant portrait index function
                endif
                
WindowBorderTiles:
                incbin "data/graphics/tech/windowbordertiles.bin" ; compressed
                include "data\graphics\tech\windowlayouts\portraitwindowlayout.asm"    ; Member screen portrait window layout
                include "data\graphics\tech\windowlayouts\allykilldefeatwindowlayout.asm"    ; Member screen kills and defeat window layout
                include "data\graphics\tech\windowlayouts\goldwindowlayout.asm"    ; Member screen gold window layout
                include "code\common\menus\menuengine_06.asm"    ; Menu engine
                
                if (THREE_DIGITS_STATS=0)
                include "code\common\menus\writememberlisttext.asm"    ; Write member list text function
                else
                include "code\common\menus\writememberlisttext-menuenhancements.asm"
                endif
                
                include "code\common\menus\menuengine_07.asm"    ; Menu engine
                
                if (FORCE_MEMBERS_EXPANSION=0)
                include "code\common\menus\getallyportrait.asm"    ; Get ally portrait index function
                endif
                
                include "code\common\menus\menuengine_08.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\battleconfigwindowlayout.asm"    ; Battle config window layout
                include "code\common\menus\menuengine_09.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\alphabetwindowlayout.asm"    ; Alphabet window layout
                
                if (EIGHT_CHARACTERS_MEMBER_NAMES=0)
                include "data\graphics\tech\windowlayouts\namecharacterentrywindowlayout.asm"    ; Name character entry window layout
                else
                include "data\graphics\tech\windowlayouts\namecharacterentrywindowlayout-menuenhancements.asm"
                endif
                
                include "code\common\menus\menuengine_10.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\timerwindowlayout.asm"    ; Timer window layout
                include "code\common\menus\menuengine_11.asm"    ; Menu engine
                
                if (THREE_DIGITS_STATS|FULL_CLASS_NAMES=0)
                include "data\graphics\tech\windowlayouts\memberstatswindowlayout.asm"    ; Member stats window layout
                else
                include "data\graphics\tech\windowlayouts\memberstatswindowlayout-menuenhancements.asm"
                endif
                
                if (ITEMS_AND_SPELLS_EXPANSION=0)
                    include "data\stats\items\itemdefs.asm"    ; Item definitions
                    include "data\stats\spells\spelldefs.asm"    ; Spell definitions
                    include "data\stats\items\itemnames.asm"    ; Item names
                endif
                include "data\stats\allies\classes\classnames.asm"    ; Class names
                align $18000
