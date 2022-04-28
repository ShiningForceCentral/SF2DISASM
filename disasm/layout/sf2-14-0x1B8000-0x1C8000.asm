
; GAME SECTION 14 :
; 0x1B8000..0x1C8000 : Battlescene grounds, weapons, spell graphics, witch screens
; FREE SPACE : 474 bytes.


p_pt_Grounds:   dc.l pt_Grounds
p_pt_WeaponSprites:
                dc.l pt_WeaponSprites
p_plt_WeaponPalettes:
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
