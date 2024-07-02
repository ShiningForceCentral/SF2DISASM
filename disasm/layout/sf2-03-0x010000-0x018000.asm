
; GAME SECTION 03 :
; 0x010000..0x018000 : Menu Engine
; FREE SPACE : 38 bytes.


                include "code\common\tech\jumpinterfaces\s03_jumpinterface_1.asm"    ; Game Section 03 Jump Interface, part 1
                includeIfVanilla "code\common\tech\pointers\s03_pointers.asm"    ; Game Section 03 Pointers
                include "code\common\tech\jumpinterfaces\s03_jumpinterface_2.asm"    ; Game Section 03 Jump Interface, part 2
                includeIfVanilla "code\common\tech\pointers\s03_memberstatuswindowlayoutpointer.asm"    ; Game Section 03 Member Status Window Layout Pointer
                include "code\common\menus\menuenginecommon.asm"    ; Menu engine, part 1 : Common functions
                include "code\common\menus\diamondmenu.asm"    ; Diamond menu actions
                include "code\common\menus\itemmenu.asm"    ; Battlefield item menu functions
                include "code\common\menus\loadhighlightableicon.asm"    ; Load highlightable icon function
                include "code\common\menus\magicmenu.asm"    ; Battlefield magic menu actions
                include "data\graphics\tech\menus\diamondmenulayout.asm"    ; Diamond menu layout
            if (STANDARD_BUILD&EXTENDED_SPELL_NAMES=1)
                include "data\graphics\tech\menus\magicmenulayout-extendedspellnames.asm"
            else
                include "data\graphics\tech\menus\magicmenulayout.asm"    ; Magic menu layout
            endif
                include "data\graphics\tech\menus\itemmenulayout.asm"    ; Item menu layout
                include "data\graphics\tech\menus\spelllevelindiacatorlayouts.asm"    ; Spell level indicator layouts
                include "code\common\menus\menutilespointertable.asm"    ; Menu tiles pointer table
                include "code\common\menus\menustringspointertable.asm"    ; Menu strings pointer table
                include "data\graphics\tech\menus\diamondmenubordertiles.asm"    ; Diamond menu border uncompressed tiles
                include "code\common\menus\equipmenu.asm"    ; Menu engine, part 2 : Battlefield equip menu actions
                include "data\graphics\tech\windowlayouts\battleequipwindowlayout.asm"    ; Battle equip window layout
                includeIfStandard "code\common\menus\ministatuswindow-standard.asm"
                includeIfVanilla "code\common\menus\ministatuswindow.asm"    ; Menu engine, part 3 : Mini status window functions
                include "data\graphics\tech\windowlayouts\ministatuswindowlayout.asm"    ; Mini status window layout
                include "code\common\menus\portraitwindow.asm"    ; Portrait window functions
                includeIfStandard "code\common\menus\memberscreen-standard.asm"
                includeIfStandard "code\common\menus\getcombatantportrait-standard.asm"
                includeIfVanilla "code\common\menus\memberscreen.asm"    ; Menu engine, part 4 : Member screen functions
                includeIfVanilla "code\common\menus\unusedsub_12606.asm"    ; Unused function
                includeIfVanilla "code\common\menus\getcombatantportrait.asm"    ; Combatant portrait index getter function
                include "data\graphics\tech\windowborder\entries.asm"    ; Windows border compressed tiles
                include "data\graphics\tech\windowlayouts\portraitwindowlayout.asm"    ; Portrait window layout
                include "data\graphics\tech\windowlayouts\allykilldefeatwindowlayout.asm"    ; Member screen kills and defeat window layout
                include "data\graphics\tech\windowlayouts\goldwindowlayout.asm"    ; Member screen gold window layout
                include "code\common\menus\minimapscreen.asm"    ; Menu engine, part 5 : Minimap screen functions
                include "code\common\menus\endingkiss.asm"    ; Ending kiss sequence function
                includeIfStandard "code\specialscreens\endkiss\endkissfunctions_0.asm"    ; End kiss function
                include "code\common\menus\goldwindow.asm"    ; Gold window functions
                include "code\common\menus\memberslistscreen.asm"    ; Members list screen functions
                include "code\common\menus\shopscreen.asm"    ; Menu engine, part 6 : Shop screen functions
tiles_PriceTagBlank:
                incbin "data/graphics/tech/pricetagblanktiles.bin"
tiles_PriceTagNumbers:
                incbin "data/graphics/tech/pricetagnumberstiles.bin"
                include "data\graphics\tech\windowlayouts\shopinventorylayout.asm"    ; Shop inventory window layout
tiles_ShopInventoryItemHighlight:
                incbin "data/graphics/tech/shopinventoryitemhighlighttiles.bin"
                includeIfVanilla "code\common\menus\unusedsub_15268.asm"    ; Unused menu engine function
                include "code\common\menus\yesnoprompt.asm"    ; Yes/No prompt functions
                include "data\graphics\tech\windowlayouts\yesnopromptlayout.asm"    ; Yes/No prompt window layout
                include "code\common\menus\portraitfunctions.asm"    ; Portrait functions
                includeIfVanilla "code\common\menus\unusedsub_156A8.asm"    ; Unused window functions
                includeIfVanilla "code\common\menus\getallyportrait.asm"    ; Get ally portrait index function
                include "code\common\menus\landeffectwindow.asm"    ; Menu engine, part 7 : Land effect window functions
                include "code\common\menus\battlefieldsettingswindow.asm"    ; Battlefield settings window functions
                include "data\graphics\tech\windowlayouts\battleconfigwindowlayout.asm"    ; Battle config window layout
                include "code\common\menus\nameallyscreen.asm"    ; Menu engine, part 8 : Name ally screen functions
                include "data\graphics\tech\windowlayouts\alphabetwindowlayout.asm"    ; Alphabet window layout
            if (STANDARD_BUILD&EIGHT_CHARACTERS_MEMBER_NAMES=1)
                include "data\graphics\tech\windowlayouts\namecharacterentrywindowlayout-menuenhancements.asm"
            else
                include "data\graphics\tech\windowlayouts\namecharacterentrywindowlayout.asm"    ; Name character entry window layout
            endif
                include "data\graphics\tech\alphabethighlight\entries.asm"    ; Alphabet Highlight Tiles
                include "code\common\menus\numberprompt.asm"    ; Menu engine, part 9 : Number prompt functions
                include "code\common\menus\debugsetflag.asm"    ; Debug : Set flag prompt
                include "code\common\menus\timerwindow.asm"    ; Timer window functions
                include "data\graphics\tech\windowlayouts\timerwindowlayout.asm"    ; Timer window layout
                include "code\specialscreens\witch\witchmainmenu.asm"    ; Witch main menu
                include "code\common\menus\nameunderportraitwindow.asm"    ; Menu engine, part 10 : Name under portrait window functions
                
                includeIfVanilla "data\graphics\tech\windowlayouts\memberstatswindowlayout.asm"    ; Member stats window layout
                includeIfVanilla "data\stats\items\itemdefs.asm"    ; Item definitions
                includeIfVanilla "data\stats\spells\spelldefs.asm"    ; Spell definitions
                includeIfVanilla "data\stats\items\itemnames.asm"    ; Item names
                alignIfVanilla
                includeIfVanilla "data\stats\allies\classes\classnames.asm"    ; Class names
                alignIfVanilla $18000
