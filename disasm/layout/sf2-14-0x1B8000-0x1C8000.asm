
; GAME SECTION 14 :
; 0x1B8000..0x1C8000 : Battlescene grounds, weapons, spell graphics, witch screens
; FREE SPACE : 474 bytes.


                includeIfVanilla "code\common\tech\pointers\s14_pointers.asm"    ; Game Section 14 Pointers
                includeIfVanilla "data\graphics\battles\grounds\entries.asm"    ; Battlescene Grounds
                includeIfVanilla "data\graphics\battles\weapons\entries.asm"    ; Battlescene Weapons
                includeIfVanilla "data\graphics\battles\weapons\palettes\entries.asm"    ; Battlescene Weapon Palettes
                includeIfVanilla "data\graphics\battles\spells\entries.asm"    ; Spell Graphics
                includeIfVanilla "code\specialscreens\witch\graphics.asm"    ; Witch Screen
                includeIfVanilla "code\specialscreens\witchend\graphics.asm"    ; Witch End Screen
                alignIfVanilla $1C8000
