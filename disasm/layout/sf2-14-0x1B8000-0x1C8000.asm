
; GAME SECTION 14 :
; 0x1B8000..0x1C8000 : Battlescene grounds, weapons, spell graphics, witch screens
; FREE SPACE : 474 bytes.


p_pt_BattlesceneGrounds:
                dc.l pt_Grounds
p_pt_WeaponSprites:
                dc.l pt_WeaponSprites
p_plt_BattlesceneWeaponColors:
                dc.l WeaponPalette00
p_pt_SpellGraphics:
                dc.l pt_SpellGraphics
p_plt_Witch:    dc.l plt_Witch
p_WitchLayout:  dc.l WitchLayout
p_WitchTiles:   dc.l WitchTiles
p_plt_WitchEnd: dc.l plt_WitchEnd
p_WitchEndLayout:
                dc.l WitchEndLayout
p_WitchEndTiles:dc.l WitchEndTiles
                includeIfVanillaRom "data\graphics\battles\grounds\entries.asm"    ; Grounds
                includeIfVanillaRom "data\graphics\battles\weapons\entries.asm"    ; Weapons
                includeIfVanillaRom "data\graphics\battles\weapons\palettes\entries.asm"    ; WeaponPalettes
                includeIfVanillaRom "data\graphics\battles\spells\entries.asm"    ; Spell Graphics
                include "code\specialscreens\witch\graphics.asm"    ; Witch Screen
                include "code\specialscreens\witchend\graphics.asm"    ; Witch End Screen
                align $1C8000
