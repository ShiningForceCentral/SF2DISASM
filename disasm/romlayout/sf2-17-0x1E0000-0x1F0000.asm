
; GAME SECTION 17 :
; 0x1E0000 : PCM Banks, YM Instruments, sound driver, char stats, witch screens

; FREE SPACE : 462 bytes.


										incbin "sound/pcmbank0.bin"
										incbin "sound/pcmbank1.bin"
										incbin "sound/yminst.bin"
SoundDriver:        incbin "sound/sounddriver.bin"
p_StatGrowthCurves: dc.l StatGrowthCurves
p_pt_CharacterStats:dc.l pt_AllyStats
p_CharacterStartData:
										dc.l AllyStartData
p_ClassData:        dc.l ClassData
p_JewelEndScreenTiles:
										dc.l JewelsEndScreenTiles
p_JewelEndScreenLayout:
										dc.l JewelsEndScreenLayout
p_plt_JewelsEndScreen:
										dc.l plt_JewelsEndScreen
p_plt_SuspendString:dc.l plt_SuspendString
p_SuspendStringTiles:
										dc.l SuspendStringTiles
										dc.l BasePalette        
p_BaseTiles:        dc.l BaseTiles
StatGrowthCurves:   incbin "data/allies/growthcurves.bin"
										include "data\allies\stats\entries.asm"		; Ally stats
AllyStartData:      incbin "data/allies/allystartdata.bin"
ClassData:          incbin "data/allies/classes/classdata.bin"
JewelsEndScreenLayout:
										incbin "graphics/specialscreens/endingjewels/endingjewelslayout.bin"
plt_JewelsEndScreen:incbin "graphics/specialscreens/endingjewels/endingjewelspalette.bin"
JewelsEndScreenTiles:
										incbin "graphics/specialscreens/endingjewels/endingjewelstiles.bin"
plt_SuspendString:  incbin "graphics/specialscreens/suspendscreen/suspendstringpalette.bin"
SuspendStringTiles: incbin "graphics/specialscreens/suspendscreen/suspendstringtiles.bin"
BasePalette:        incbin "graphics/technical/basepalette.bin"
																						; two almost identical palettes which look like UI/sprites palette
BaseTiles:          incbin "graphics/technical/basetiles.bin"
										align $8000
