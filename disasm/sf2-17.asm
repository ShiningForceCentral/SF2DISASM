
; GAME SECTION 17 :
; PCM Banks, YM Instruments, sound driver, char stats, witch screens

; FREE SPACE : 462 bytes.


										incbin "sound/pcmbank0.bin"
										incbin "sound/pcmbank1.bin"
										incbin "sound/yminst.bin"
SoundDriver:        incbin "sound/sounddriver.bin"
p_StatGrowthCurves: dc.l StatGrowthCurves   ; related to level up stat gains ?
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
pt_AllyStats:       dc.l AllyStats00
										dc.l AllyStats01
										dc.l AllyStats02
										dc.l AllyStats03
										dc.l AllyStats04
										dc.l AllyStats05
										dc.l AllyStats06
										dc.l AllyStats07
										dc.l AllyStats08
										dc.l AllyStats09
										dc.l AllyStats10
										dc.l AllyStats11
										dc.l AllyStats12
										dc.l AllyStats13
										dc.l AllyStats14
										dc.l AllyStats15
										dc.l AllyStats16
										dc.l AllyStats17
										dc.l AllyStats18
										dc.l AllyStats19
										dc.l AllyStats20
										dc.l AllyStats21
										dc.l AllyStats22
										dc.l AllyStats23
										dc.l AllyStats24
										dc.l AllyStats25
										dc.l AllyStats26
										dc.l AllyStats27
										dc.l AllyStats28
										dc.l AllyStats29
										dc.l AllyStats29
										dc.l AllyStats29
AllyStats00:        incbin "data/allies/stats/allystats00.bin"
AllyStats01:        incbin "data/allies/stats/allystats01.bin"
AllyStats02:        incbin "data/allies/stats/allystats02.bin"
AllyStats03:        incbin "data/allies/stats/allystats03.bin"
AllyStats04:        incbin "data/allies/stats/allystats04.bin"
AllyStats05:        incbin "data/allies/stats/allystats05.bin"
AllyStats06:        incbin "data/allies/stats/allystats06.bin"
AllyStats07:        incbin "data/allies/stats/allystats07.bin"
AllyStats08:        incbin "data/allies/stats/allystats08.bin"
AllyStats09:        incbin "data/allies/stats/allystats09.bin"
AllyStats10:        incbin "data/allies/stats/allystats10.bin"
AllyStats11:        incbin "data/allies/stats/allystats11.bin"
AllyStats12:        incbin "data/allies/stats/allystats12.bin"
AllyStats13:        incbin "data/allies/stats/allystats13.bin"
AllyStats14:        incbin "data/allies/stats/allystats14.bin"
AllyStats15:        incbin "data/allies/stats/allystats15.bin"
AllyStats16:        incbin "data/allies/stats/allystats16.bin"
AllyStats17:        incbin "data/allies/stats/allystats17.bin"
AllyStats18:        incbin "data/allies/stats/allystats18.bin"
AllyStats19:        incbin "data/allies/stats/allystats19.bin"
AllyStats20:        incbin "data/allies/stats/allystats20.bin"
AllyStats21:        incbin "data/allies/stats/allystats21.bin"
AllyStats22:        incbin "data/allies/stats/allystats22.bin"
AllyStats23:        incbin "data/allies/stats/allystats23.bin"
AllyStats24:        incbin "data/allies/stats/allystats24.bin"
AllyStats25:        incbin "data/allies/stats/allystats25.bin"
AllyStats26:        incbin "data/allies/stats/allystats26.bin"
AllyStats27:        incbin "data/allies/stats/allystats27.bin"
AllyStats28:        incbin "data/allies/stats/allystats28.bin"
AllyStats29:        incbin "data/allies/stats/allystats29.bin"
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
