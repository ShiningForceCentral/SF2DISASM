
; GAME SECTION 14 :
; 0x1B8000..0x1C8000 : Battlescene grounds, weapons, spell graphics, witch screens
; FREE SPACE : 474 bytes.


                includeIfVanillaLayout "code\common\tech\pointers\s14_pointers.asm"    ; Game Section 14 Pointers
                includeIfVanillaRom "data\graphics\battles\grounds\entries.asm"    ; Battlescene Grounds
                includeIfVanillaRom "data\graphics\battles\weapons\entries.asm"    ; Battlescene Weapons
                includeIfVanillaRom "data\graphics\battles\weapons\palettes\entries.asm"    ; Battlescene Weapon Palettes
                includeIfVanillaRom "data\graphics\battles\spells\entries.asm"    ; Spell Graphics
                include "code\specialscreens\witch\graphics.asm"    ; Witch Screen
                include "code\specialscreens\witchend\graphics.asm"    ; Witch End Screen
                includeIfExpandedRom "data\graphics\tech\backgroundlayout.asm"    ; Battlescene Background Layout
                includeIfExpandedRom "code\common\tech\graphics\specialspritesentries.asm"    ; Special Sprites Entries
                align
                includeIfExpandedRom "code\specialscreens\endkiss\graphics.asm"  ; End Kiss Graphics
                align
                includeIfExpandedRom "code\specialscreens\jewelend\graphics.asm"             ; Jewel End Graphics
                align
                includeIfExpandedRom "code\specialscreens\suspend\graphics.asm"  ; Suspend String Graphics
                align
            if (STANDARD_BUILD&EXPANDED_ROM=1)
unused_BasePalettes: incbin "data/graphics/tech/unusedbasepalettes.bin" ; two almost identical palettes which look like UI/sprites palette
BaseTiles:           incbin "data/graphics/tech/basetiles.bin"
            endif
                alignIfVanillaLayout $1C8000
