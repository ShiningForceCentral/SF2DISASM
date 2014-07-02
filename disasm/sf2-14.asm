
; GAME SECTION 14 :
; Battlescene grounds, weapons, spell graphics, witch screens

; FREE SPACE : 474 bytes.


p_pt_BattleSceneGrounds:
										dc.l pt_BattleSceneGrounds
p_pt_WeaponSprites: dc.l pt_WeaponSprites
p_plt_BattleSceneWeaponColors:
										dc.l plt_BattleSceneWeaponColors
p_pt_SpellGraphics: dc.l pt_SpellGraphics
p_plt_Witch:        dc.l plt_Witch
p_witchLayout:      dc.l witchLayout
p_witchTiles:       dc.l witchTiles
p_plt_WitchEnd:     dc.l plt_WitchEnd
p_witchEndLayout:   dc.l witchEndLayout
p_witchEndTiles:    dc.l witchEndTiles
pt_BattleSceneGrounds:
										dc.l battlesceneGround00
										dc.l battlesceneGround01
										dc.l battlesceneGround02
										dc.l battlesceneGround03
										dc.l battlesceneGround04
										dc.l battlesceneGround05
										dc.l battlesceneGround06
										dc.l battlesceneGround07
										dc.l battlesceneGround08
										dc.l battlesceneGround09
										dc.l battlesceneGround10
										dc.l battlesceneGround11
										dc.l battlesceneGround12
										dc.l battlesceneGround13
										dc.l battlesceneGround14
										dc.l battlesceneGround15
										dc.l battlesceneGround16
										dc.l battlesceneGround17
										dc.l battlesceneGround18
										dc.l battlesceneGround19
										dc.l battlesceneGround20
										dc.l battlesceneGround12
										dc.l battlesceneGround12
										dc.l battlesceneGround23
										dc.l battlesceneGround24
										dc.l battlesceneGround25
										dc.l battlesceneGround26
										dc.l battlesceneGround27
										dc.l battlesceneGround28
										dc.l battlesceneGround13
battlesceneGround00:incbin "battles/grounds/ground00_palette.bin"
bsg00_rpbase:       dc.w groundTiles00-bsg00_rpbase
battlesceneGround01:incbin "battles/grounds/ground01_palette.bin"
bsg01_rpbase:       dc.w groundTiles01-bsg01_rpbase
battlesceneGround02:incbin "battles/grounds/ground02_palette.bin"
bsg02_rpbase:       dc.w groundTiles01-bsg02_rpbase
battlesceneGround03:incbin "battles/grounds/ground03_palette.bin"
bsg03_rpbase:       dc.w groundTiles03-bsg03_rpbase
battlesceneGround04:incbin "battles/grounds/ground04_palette.bin"
bsg04_rpbase:       dc.w groundTiles00-bsg04_rpbase
battlesceneGround05:incbin "battles/grounds/ground05_palette.bin"
bsg05_rpbase:       dc.w groundTiles05-bsg05_rpbase
battlesceneGround06:incbin "battles/grounds/ground06_palette.bin"
bsg06_rpbase:       dc.w groundTiles05-bsg06_rpbase
battlesceneGround07:incbin "battles/grounds/ground07_palette.bin"
bsg07_rpbase:       dc.w groundTiles03-bsg07_rpbase
battlesceneGround08:incbin "battles/grounds/ground08_palette.bin"
bsg08_rpbase:       dc.w groundTiles08-bsg08_rpbase
battlesceneGround09:incbin "battles/grounds/ground09_palette.bin"
bsg09_rpbase:       dc.w groundTiles09-bsg09_rpbase
battlesceneGround10:incbin "battles/grounds/ground10_palette.bin"
bsg10_rpbase:       dc.w groundTiles03-bsg10_rpbase
battlesceneGround11:incbin "battles/grounds/ground11_palette.bin"
bsg11_rpbase:       dc.w groundTiles03-bsg11_rpbase
battlesceneGround12:incbin "battles/grounds/ground12_palette.bin"
bsg12_rpbase:       dc.w groundTiles03-bsg12_rpbase
battlesceneGround13:incbin "battles/grounds/ground13_palette.bin"
bsg13_rpbase:       dc.w groundTiles09-bsg13_rpbase
battlesceneGround14:incbin "battles/grounds/ground14_palette.bin"
bsg14_rpbase:       dc.w groundTiles14-bsg14_rpbase
battlesceneGround15:incbin "battles/grounds/ground15_palette.bin"
bsg15_rpbase:       dc.w groundTiles09-bsg15_rpbase
battlesceneGround16:incbin "battles/grounds/ground16_palette.bin"
bsg16_rpbase:       dc.w groundTiles00-bsg16_rpbase
battlesceneGround17:incbin "battles/grounds/ground17_palette.bin"
bsg17_rpbase:       dc.w groundTiles17-bsg17_rpbase
battlesceneGround18:incbin "battles/grounds/ground18_palette.bin"
bsg18_rpbase:       dc.w groundTiles14-bsg18_rpbase
battlesceneGround19:incbin "battles/grounds/ground19_palette.bin"
bsg19_rpbase:       dc.w groundTiles00-bsg19_rpbase
battlesceneGround20:incbin "battles/grounds/ground20_palette.bin"
bsg20_rpbase:       dc.w groundTiles17-bsg20_rpbase
battlesceneGround23:incbin "battles/grounds/ground23_palette.bin"
bsg23_rpbase:       dc.w groundTiles03-bsg23_rpbase
battlesceneGround24:incbin "battles/grounds/ground24_palette.bin"
bsg24_rpbase:       dc.w groundTiles00-bsg24_rpbase
battlesceneGround25:incbin "battles/grounds/ground25_palette.bin"
bsg25_rpbase:       dc.w groundTiles25-bsg25_rpbase
battlesceneGround26:incbin "battles/grounds/ground26_palette.bin"
bsg26_rpbase:       dc.w groundTiles26-bsg26_rpbase
battlesceneGround27:incbin "battles/grounds/ground27_palette.bin"
bsg27_rpbase:       dc.w groundTiles26-bsg27_rpbase
battlesceneGround28:incbin "battles/grounds/ground28_palette.bin"
bsg28_rpbase:       dc.w groundTiles03-bsg28_rpbase
groundTiles00:      incbin "battles/grounds/ground00.bin"
groundTiles01:      incbin "battles/grounds/ground01.bin"
groundTiles05:      incbin "battles/grounds/ground05.bin"
groundTiles14:      incbin "battles/grounds/ground14.bin"
groundTiles03:      incbin "battles/grounds/ground03.bin"
groundTiles08:      incbin "battles/grounds/ground08.bin"
groundTiles09:      incbin "battles/grounds/ground09.bin"
groundTiles17:      incbin "battles/grounds/ground17.bin"
groundTiles25:      incbin "battles/grounds/ground25.bin"
groundTiles26:      incbin "battles/grounds/ground26.bin"
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
WeaponSprite00:     incbin "sprites/weapons/weaponsprite00.bin"
WeaponSprite01:     incbin "sprites/weapons/weaponsprite01.bin"
WeaponSprite02:     incbin "sprites/weapons/weaponsprite02.bin"
WeaponSprite03:     incbin "sprites/weapons/weaponsprite03.bin"
WeaponSprite04:     incbin "sprites/weapons/weaponsprite04.bin"
WeaponSprite05:     incbin "sprites/weapons/weaponsprite05.bin"
WeaponSprite06:     incbin "sprites/weapons/weaponsprite06.bin"
WeaponSprite07:     incbin "sprites/weapons/weaponsprite07.bin"
WeaponSprite08:     incbin "sprites/weapons/weaponsprite08.bin"
WeaponSprite09:     incbin "sprites/weapons/weaponsprite09.bin"
WeaponSprite10:     incbin "sprites/weapons/weaponsprite10.bin"
WeaponSprite11:     incbin "sprites/weapons/weaponsprite11.bin"
WeaponSprite12:     incbin "sprites/weapons/weaponsprite12.bin"
WeaponSprite13:     incbin "sprites/weapons/weaponsprite13.bin"
WeaponSprite14:     incbin "sprites/weapons/weaponsprite14.bin"
WeaponSprite15:     incbin "sprites/weapons/weaponsprite15.bin"
WeaponSprite16:     incbin "sprites/weapons/weaponsprite16.bin"
WeaponSprite17:     incbin "sprites/weapons/weaponsprite17.bin"
WeaponSprite18:     incbin "sprites/weapons/weaponsprite18.bin"
WeaponSprite19:     incbin "sprites/weapons/weaponsprite19.bin"
WeaponSprite20:     incbin "sprites/weapons/weaponsprite20.bin"
WeaponSprite21:     incbin "sprites/weapons/weaponsprite21.bin"
WeaponSprite22:     incbin "sprites/weapons/weaponsprite22.bin"
plt_BattleSceneWeaponColors:
										incbin "sprites/weapons/weaponspalette.bin"
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
SpellGraphics00:    incbin "spells/spellgraphics00.bin"
SpellGraphics01:    incbin "spells/spellgraphics01.bin"
SpellGraphics02:    incbin "spells/spellgraphics02.bin"
SpellGraphics03:    incbin "spells/spellgraphics03.bin"
SpellGraphics04:    incbin "spells/spellgraphics04.bin"
SpellGraphics05:    incbin "spells/spellgraphics05.bin"
SpellGraphics06:    incbin "spells/spellgraphics06.bin"
SpellGraphics07:    incbin "spells/spellgraphics07.bin"
SpellGraphics08:    incbin "spells/spellgraphics08.bin"
SpellGraphics09:    incbin "spells/spellgraphics09.bin"
SpellGraphics10:    incbin "spells/spellgraphics10.bin"
SpellGraphics11:    incbin "spells/spellgraphics11.bin"
SpellGraphics12:    incbin "spells/spellgraphics12.bin"
SpellGraphics13:    incbin "spells/spellgraphics13.bin"
SpellGraphics14:    incbin "spells/spellgraphics14.bin"
SpellGraphics15:    incbin "spells/spellgraphics15.bin"
SpellGraphics16:    incbin "spells/spellgraphics16.bin"
SpellGraphics17:    incbin "spells/spellgraphics17.bin"
SpellGraphics18:    incbin "spells/spellgraphics18.bin"
SpellGraphics19:    incbin "spells/spellgraphics19.bin"
SpellGraphics20:    incbin "spells/spellgraphics20.bin"
SpellGraphics21:    incbin "spells/spellgraphics21.bin"
SpellGraphics22:    incbin "spells/spellgraphics22.bin"
plt_Witch:          incbin "misc/specialscreens/witchpalette.bin"
witchLayout:        incbin "misc/specialscreens/witchlayout.bin"
witchTiles:         incbin "misc/specialscreens/witchtiles.bin"
plt_WitchEnd:       incbin "misc/specialscreens/endingwitchpalette.bin"
witchEndLayout:     incbin "misc/specialscreens/endingwitchlayout.bin"
witchEndTiles:      incbin "misc/specialscreens/endingwitchtiles.bin"
										align $8000
