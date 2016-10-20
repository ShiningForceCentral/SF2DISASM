
; GAME SECTION 17 :
; 0x1E0000..0x1F0000 : PCM Banks, YM Instruments, sound driver, char stats, witch screens
; FREE SPACE : 462 bytes.


		incbin "data/sound/pcmbank0.bin"
		incbin "data/sound/pcmbank1.bin"
		incbin "data/sound/yminst.bin"
SoundDriver:
		incbin "data/sound/sounddriver.bin"
p_StatGrowthCurves:
		dc.l StatGrowthCurves
p_pt_CharacterStats:
		dc.l pt_AllyStats
p_CharacterStartData:
		dc.l AllyStartData
p_ClassData:
		dc.l ClassData
p_JewelEndScreenTiles:
		dc.l JewelsEndScreenTiles
p_JewelEndScreenLayout:
		dc.l JewelsEndScreenLayout
p_plt_JewelsEndScreen:
		dc.l plt_JewelsEndScreen
p_plt_SuspendString:
		dc.l plt_SuspendString
p_SuspendStringTiles:
		dc.l SuspendStringTiles
		dc.l BasePalette        
p_BaseTiles:
		dc.l BaseTiles
StatGrowthCurves:
		incbin "data/stats/allies/growthcurves.bin"
		include "data\stats\allies\stats\entries.asm"		; Ally stats
AllyStartData:
		incbin "data/stats/allies/allystartdata.bin"
ClassData:
		incbin "data/stats/allies/classes/classdata.bin"
JewelsEndScreenLayout:
		incbin "data/graphics/specialscreens/endingjewels/endingjewelslayout.bin"
plt_JewelsEndScreen:
		incbin "data/graphics/specialscreens/endingjewels/endingjewelspalette.bin"
JewelsEndScreenTiles:
		incbin "data/graphics/specialscreens/endingjewels/endingjewelstiles.bin"
plt_SuspendString:
		incbin "data/graphics/specialscreens/suspendscreen/suspendstringpalette.bin"
SuspendStringTiles:
		incbin "data/graphics/specialscreens/suspendscreen/suspendstringtiles.bin"
BasePalette:
		incbin "data/graphics/tech/basepalette.bin"
						; two almost identical palettes which look like UI/sprites palette
BaseTiles:
		incbin "data/graphics/tech/basetiles.bin"
		align $8000
