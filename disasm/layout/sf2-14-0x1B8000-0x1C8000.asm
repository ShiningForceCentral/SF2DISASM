
; GAME SECTION 14 :
; 0x1B8000..0x1C8000 : Battlescene grounds, weapons, spell graphics, witch screens
; FREE SPACE : 474 bytes.


                include "code\common\tech\pointers\s14_pointers.asm"    ; Game Section 14 Pointers
                includeIfVanillaRom "data\graphics\battles\grounds\entries.asm"    ; Battlescene Grounds
                includeIfVanillaRom "data\graphics\battles\weapons\entries.asm"    ; Battlescene Weapons
                includeIfVanillaRom "data\graphics\battles\weapons\palettes\entries.asm"    ; Battlescene Weapon Palettes
                includeIfVanillaRom "data\graphics\battles\spells\entries.asm"    ; Spell Graphics
                include "code\specialscreens\witch\graphics.asm"    ; Witch Screen
                include "code\specialscreens\witchend\graphics.asm"    ; Witch End Screen
                includeIfExpandedRom "data\graphics\tech\backgroundlayout.asm"    ; Battlescene Background Layout
                includeIfExpandedRom "code\common\tech\graphics\specialspritesentries.asm"    ; Special Sprites Entries
                wordAlign
                includeIfExpandedRom "code\specialscreens\endkiss\graphics.asm"  ; End Kiss Graphics
                wordAlign
                includeIfExpandedRom "code\specialscreens\jewelend\graphics.asm"             ; Jewel End Graphics
                wordAlign
                includeIfExpandedRom "code\specialscreens\suspend\graphics.asm"  ; Suspend String Graphics
                alignIfOriginalRomLayout $1C8000
