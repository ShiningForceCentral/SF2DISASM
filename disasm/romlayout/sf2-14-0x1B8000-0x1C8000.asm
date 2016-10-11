
; GAME SECTION 14 :
; 0x1B8000 : Battlescene grounds, weapons, spell graphics, witch screens

; FREE SPACE : 474 bytes.


p_pt_BattleSceneGrounds:
										dc.l pt_Grounds
p_pt_WeaponSprites: dc.l pt_WeaponSprites
p_plt_BattleSceneWeaponColors:
										dc.l plt_WeaponPalettes
p_pt_SpellGraphics: dc.l pt_SpellGraphics
p_plt_Witch:        dc.l plt_Witch
p_WitchLayout:      dc.l WitchLayout
p_WitchTiles:       dc.l WitchTiles
p_plt_WitchEnd:     dc.l plt_WitchEnd
p_WitchEndLayout:   dc.l WitchEndLayout
p_WitchEndTiles:    dc.l WitchEndTiles
										include "graphics\battles\grounds\entries.asm"		; Grounds
										include "graphics\battles\weapons\entries.asm"		; Weapons
plt_WeaponPalettes: incbin "graphics/battles/weapons/weaponpalettes.bin"
										include "graphics\battles\spells\entries.asm"		; Spell Graphics
plt_Witch:          incbin "graphics/specialscreens/witchscreen/witchpalette.bin"
WitchLayout:        incbin "graphics/specialscreens/witchscreen/witchlayout.bin"
WitchTiles:         incbin "graphics/specialscreens/witchscreen/witchtiles.bin"
plt_WitchEnd:       incbin "graphics/specialscreens/witchscreen/endingwitchpalette.bin"
WitchEndLayout:     incbin "graphics/specialscreens/witchscreen/endingwitchlayout.bin"
WitchEndTiles:      incbin "graphics/specialscreens/witchscreen/endingwitchtiles.bin"
										align $8000
