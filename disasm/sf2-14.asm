
; GAME SECTION 14 :
; Battlescene grounds, weapons, spell graphics, witch screens

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
pt_Grounds:         dc.l Ground00
										dc.l Ground01
										dc.l Ground02
										dc.l Ground03
										dc.l Ground04
										dc.l Ground05
										dc.l Ground06
										dc.l Ground07
										dc.l Ground08
										dc.l Ground09
										dc.l Ground10
										dc.l Ground11
										dc.l Ground12
										dc.l Ground13
										dc.l Ground14
										dc.l Ground15
										dc.l Ground16
										dc.l Ground17
										dc.l Ground18
										dc.l Ground19
										dc.l Ground20
										dc.l Ground12
										dc.l Ground12
										dc.l Ground23
										dc.l Ground24
										dc.l Ground25
										dc.l Ground26
										dc.l Ground27
										dc.l Ground28
										dc.l Ground13
Ground00:           incbin "graphics/grounds/ground00_palette.bin"
bsg00_rpbase:       dc.w GroundTiles00-bsg00_rpbase
Ground01:           incbin "graphics/grounds/ground01_palette.bin"
bsg01_rpbase:       dc.w GroundTiles01-bsg01_rpbase
Ground02:           incbin "graphics/grounds/ground02_palette.bin"
bsg02_rpbase:       dc.w GroundTiles01-bsg02_rpbase
Ground03:           incbin "graphics/grounds/ground03_palette.bin"
bsg03_rpbase:       dc.w GroundTiles03-bsg03_rpbase
Ground04:           incbin "graphics/grounds/ground04_palette.bin"
bsg04_rpbase:       dc.w GroundTiles00-bsg04_rpbase
Ground05:           incbin "graphics/grounds/ground05_palette.bin"
bsg05_rpbase:       dc.w GroundTiles05-bsg05_rpbase
Ground06:           incbin "graphics/grounds/ground06_palette.bin"
bsg06_rpbase:       dc.w GroundTiles05-bsg06_rpbase
Ground07:           incbin "graphics/grounds/ground07_palette.bin"
bsg07_rpbase:       dc.w GroundTiles03-bsg07_rpbase
Ground08:           incbin "graphics/grounds/ground08_palette.bin"
bsg08_rpbase:       dc.w GroundTiles08-bsg08_rpbase
Ground09:           incbin "graphics/grounds/ground09_palette.bin"
bsg09_rpbase:       dc.w GroundTiles09-bsg09_rpbase
Ground10:           incbin "graphics/grounds/ground10_palette.bin"
bsg10_rpbase:       dc.w GroundTiles03-bsg10_rpbase
Ground11:           incbin "graphics/grounds/ground11_palette.bin"
bsg11_rpbase:       dc.w GroundTiles03-bsg11_rpbase
Ground12:           incbin "graphics/grounds/ground12_palette.bin"
bsg12_rpbase:       dc.w GroundTiles03-bsg12_rpbase
Ground13:           incbin "graphics/grounds/ground13_palette.bin"
bsg13_rpbase:       dc.w GroundTiles09-bsg13_rpbase
Ground14:           incbin "graphics/grounds/ground14_palette.bin"
bsg14_rpbase:       dc.w GroundTiles14-bsg14_rpbase
Ground15:           incbin "graphics/grounds/ground15_palette.bin"
bsg15_rpbase:       dc.w GroundTiles09-bsg15_rpbase
Ground16:           incbin "graphics/grounds/ground16_palette.bin"
bsg16_rpbase:       dc.w GroundTiles00-bsg16_rpbase
Ground17:           incbin "graphics/grounds/ground17_palette.bin"
bsg17_rpbase:       dc.w GroundTiles17-bsg17_rpbase
Ground18:           incbin "graphics/grounds/ground18_palette.bin"
bsg18_rpbase:       dc.w GroundTiles14-bsg18_rpbase
Ground19:           incbin "graphics/grounds/ground19_palette.bin"
bsg19_rpbase:       dc.w GroundTiles00-bsg19_rpbase
Ground20:           incbin "graphics/grounds/ground20_palette.bin"
bsg20_rpbase:       dc.w GroundTiles17-bsg20_rpbase
Ground23:           incbin "graphics/grounds/ground23_palette.bin"
bsg23_rpbase:       dc.w GroundTiles03-bsg23_rpbase
Ground24:           incbin "graphics/grounds/ground24_palette.bin"
bsg24_rpbase:       dc.w GroundTiles00-bsg24_rpbase
Ground25:           incbin "graphics/grounds/ground25_palette.bin"
bsg25_rpbase:       dc.w GroundTiles25-bsg25_rpbase
Ground26:           incbin "graphics/grounds/ground26_palette.bin"
bsg26_rpbase:       dc.w GroundTiles26-bsg26_rpbase
Ground27:           incbin "graphics/grounds/ground27_palette.bin"
bsg27_rpbase:       dc.w GroundTiles26-bsg27_rpbase
Ground28:           incbin "graphics/grounds/ground28_palette.bin"
bsg28_rpbase:       dc.w GroundTiles03-bsg28_rpbase
GroundTiles00:      incbin "graphics/grounds/groundtiles00.bin"
GroundTiles01:      incbin "graphics/grounds/groundtiles01.bin"
GroundTiles05:      incbin "graphics/grounds/groundtiles05.bin"
GroundTiles14:      incbin "graphics/grounds/groundtiles14.bin"
GroundTiles03:      incbin "graphics/grounds/groundtiles03.bin"
GroundTiles08:      incbin "graphics/grounds/groundtiles08.bin"
GroundTiles09:      incbin "graphics/grounds/groundtiles09.bin"
GroundTiles17:      incbin "graphics/grounds/groundtiles17.bin"
GroundTiles25:      incbin "graphics/grounds/groundtiles25.bin"
GroundTiles26:      incbin "graphics/grounds/groundtiles26.bin"
pt_WeaponSprites:   dc.l WeaponSprite00
										dc.l WeaponSprite01
										dc.l WeaponSprite02
										dc.l WeaponSprite03
										dc.l WeaponSprite04
										dc.l WeaponSprite05
										dc.l WeaponSprite06
										dc.l WeaponSprite07
										dc.l WeaponSprite08
										dc.l WeaponSprite09
										dc.l WeaponSprite10
										dc.l WeaponSprite11
										dc.l WeaponSprite12
										dc.l WeaponSprite13
										dc.l WeaponSprite14
										dc.l WeaponSprite15
										dc.l WeaponSprite16
										dc.l WeaponSprite17
										dc.l WeaponSprite18
										dc.l WeaponSprite19
										dc.l WeaponSprite20
										dc.l WeaponSprite21
										dc.l WeaponSprite22
WeaponSprite00:     incbin "graphics/weapons/weaponsprite00.bin"
WeaponSprite01:     incbin "graphics/weapons/weaponsprite01.bin"
WeaponSprite02:     incbin "graphics/weapons/weaponsprite02.bin"
WeaponSprite03:     incbin "graphics/weapons/weaponsprite03.bin"
WeaponSprite04:     incbin "graphics/weapons/weaponsprite04.bin"
WeaponSprite05:     incbin "graphics/weapons/weaponsprite05.bin"
WeaponSprite06:     incbin "graphics/weapons/weaponsprite06.bin"
WeaponSprite07:     incbin "graphics/weapons/weaponsprite07.bin"
WeaponSprite08:     incbin "graphics/weapons/weaponsprite08.bin"
WeaponSprite09:     incbin "graphics/weapons/weaponsprite09.bin"
WeaponSprite10:     incbin "graphics/weapons/weaponsprite10.bin"
WeaponSprite11:     incbin "graphics/weapons/weaponsprite11.bin"
WeaponSprite12:     incbin "graphics/weapons/weaponsprite12.bin"
WeaponSprite13:     incbin "graphics/weapons/weaponsprite13.bin"
WeaponSprite14:     incbin "graphics/weapons/weaponsprite14.bin"
WeaponSprite15:     incbin "graphics/weapons/weaponsprite15.bin"
WeaponSprite16:     incbin "graphics/weapons/weaponsprite16.bin"
WeaponSprite17:     incbin "graphics/weapons/weaponsprite17.bin"
WeaponSprite18:     incbin "graphics/weapons/weaponsprite18.bin"
WeaponSprite19:     incbin "graphics/weapons/weaponsprite19.bin"
WeaponSprite20:     incbin "graphics/weapons/weaponsprite20.bin"
WeaponSprite21:     incbin "graphics/weapons/weaponsprite21.bin"
WeaponSprite22:     incbin "graphics/weapons/weaponsprite22.bin"
plt_WeaponPalettes: incbin "graphics/weapons/weaponspalettes.bin"
pt_SpellGraphics:   dc.l SpellGraphics00
										dc.l SpellGraphics01
										dc.l SpellGraphics02
										dc.l SpellGraphics03
										dc.l SpellGraphics04
										dc.l SpellGraphics05
										dc.l SpellGraphics06
										dc.l SpellGraphics07
										dc.l SpellGraphics08
										dc.l SpellGraphics09
										dc.l SpellGraphics10
										dc.l SpellGraphics11
										dc.l SpellGraphics12
										dc.l SpellGraphics13
										dc.l SpellGraphics14
										dc.l SpellGraphics15
										dc.l SpellGraphics16
										dc.l SpellGraphics17
										dc.l SpellGraphics18
										dc.l SpellGraphics19
										dc.l SpellGraphics20
										dc.l SpellGraphics21
										dc.l SpellGraphics22
SpellGraphics00:    incbin "graphics/spells/spellgraphics00.bin"
SpellGraphics01:    incbin "graphics/spells/spellgraphics01.bin"
SpellGraphics02:    incbin "graphics/spells/spellgraphics02.bin"
SpellGraphics03:    incbin "graphics/spells/spellgraphics03.bin"
SpellGraphics04:    incbin "graphics/spells/spellgraphics04.bin"
SpellGraphics05:    incbin "graphics/spells/spellgraphics05.bin"
SpellGraphics06:    incbin "graphics/spells/spellgraphics06.bin"
SpellGraphics07:    incbin "graphics/spells/spellgraphics07.bin"
SpellGraphics08:    incbin "graphics/spells/spellgraphics08.bin"
SpellGraphics09:    incbin "graphics/spells/spellgraphics09.bin"
SpellGraphics10:    incbin "graphics/spells/spellgraphics10.bin"
SpellGraphics11:    incbin "graphics/spells/spellgraphics11.bin"
SpellGraphics12:    incbin "graphics/spells/spellgraphics12.bin"
SpellGraphics13:    incbin "graphics/spells/spellgraphics13.bin"
SpellGraphics14:    incbin "graphics/spells/spellgraphics14.bin"
SpellGraphics15:    incbin "graphics/spells/spellgraphics15.bin"
SpellGraphics16:    incbin "graphics/spells/spellgraphics16.bin"
SpellGraphics17:    incbin "graphics/spells/spellgraphics17.bin"
SpellGraphics18:    incbin "graphics/spells/spellgraphics18.bin"
SpellGraphics19:    incbin "graphics/spells/spellgraphics19.bin"
SpellGraphics20:    incbin "graphics/spells/spellgraphics20.bin"
SpellGraphics21:    incbin "graphics/spells/spellgraphics21.bin"
SpellGraphics22:    incbin "graphics/spells/spellgraphics22.bin"
plt_Witch:          incbin "graphics/specialscreens/witchpalette.bin"
WitchLayout:        incbin "graphics/specialscreens/witchlayout.bin"
WitchTiles:         incbin "graphics/specialscreens/witchtiles.bin"
plt_WitchEnd:       incbin "graphics/specialscreens/endingwitchpalette.bin"
WitchEndLayout:     incbin "graphics/specialscreens/endingwitchlayout.bin"
WitchEndTiles:      incbin "graphics/specialscreens/endingwitchtiles.bin"
										align $8000
