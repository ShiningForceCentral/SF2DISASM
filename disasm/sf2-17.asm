
; GAME SECTION 17 :
; PCM Banks, YM Instruments, sound driver, char stats, witch screens

; FREE SPACE : 462 bytes.


										incbin "sound/pcmbank0.bin"
										incbin "sound/pcmbank1.bin"
										incbin "sound/yminst.bin"
Z80_SoundDriver:    incbin "sound/driver.bin"
p_StatGrowthCurves: dc.l StatGrowthCurves   ; related to level up stat gains ?
p_pt_CharacterStats:dc.l pt_AllyStats
p_CharacterStartData:
										dc.l AllyStartData
p_ClassData:        dc.l ClassData
p_JewelEndScreenTiles:
										dc.l JewelsEndScreenTiles
																						; jewel end screen tile data ?
p_JewelEndScreenLayout:
										dc.l JewelsEndScreenLayout
																						; jewel end screen layout data ?
p_plt_JewelsEndScreen:
										dc.l plt_JewelsEndScreen
p_plt_SuspendString:dc.l plt_SuspendString
p_SuspendStringTiles:
										dc.l SuspendStringTiles
										dc.l basePalette        
p_baseTiles:        dc.l baseTiles
StatGrowthCurves:   incbin "data/growthcurves.bin"
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
AllyStats00:        incbin "data/allystats/allystats00.bin"
AllyStats01:        incbin "data/allystats/allystats01.bin"
AllyStats02:        incbin "data/allystats/allystats02.bin"
AllyStats03:        incbin "data/allystats/allystats03.bin"
AllyStats04:        incbin "data/allystats/allystats04.bin"
AllyStats05:        incbin "data/allystats/allystats05.bin"
AllyStats06:        incbin "data/allystats/allystats06.bin"
AllyStats07:        incbin "data/allystats/allystats07.bin"
AllyStats08:        incbin "data/allystats/allystats08.bin"
AllyStats09:        incbin "data/allystats/allystats09.bin"
AllyStats10:        incbin "data/allystats/allystats10.bin"
AllyStats11:        incbin "data/allystats/allystats11.bin"
AllyStats12:        incbin "data/allystats/allystats12.bin"
AllyStats13:        incbin "data/allystats/allystats13.bin"
AllyStats14:        incbin "data/allystats/allystats14.bin"
AllyStats15:        incbin "data/allystats/allystats15.bin"
AllyStats16:        incbin "data/allystats/allystats16.bin"
AllyStats17:        incbin "data/allystats/allystats17.bin"
AllyStats18:        incbin "data/allystats/allystats18.bin"
AllyStats19:        incbin "data/allystats/allystats19.bin"
AllyStats20:        incbin "data/allystats/allystats20.bin"
AllyStats21:        incbin "data/allystats/allystats21.bin"
AllyStats22:        incbin "data/allystats/allystats22.bin"
AllyStats23:        incbin "data/allystats/allystats23.bin"
AllyStats24:        incbin "data/allystats/allystats24.bin"
AllyStats25:        incbin "data/allystats/allystats25.bin"
AllyStats26:        incbin "data/allystats/allystats26.bin"
AllyStats27:        incbin "data/allystats/allystats27.bin"
AllyStats28:        incbin "data/allystats/allystats28.bin"
AllyStats29:        incbin "data/allystats/allystats29.bin"
AllyStartData:      incbin "data/allystartdata.bin"
ClassData:          incbin "data/classes/classdata.bin"
JewelsEndScreenLayout:
										incbin "graphics/specialscreens/endingjewelslayout.bin"
plt_JewelsEndScreen:incbin "graphics/specialscreens/endingjewelspalette.bin"
JewelsEndScreenTiles:
										incbin "graphics/specialscreens/endingjewelstiles.bin"
plt_SuspendString:  incbin "graphics/specialscreens/suspendstringpalette.bin"
SuspendStringTiles: incbin "graphics/specialscreens/suspendstringtiles.bin"
basePalette:        dc.w 0                  ; two almost identical palettes which look like UI/sprites palette
										dc.w $EEE               ; is it actually used ?
										dc.w 0
										dc.w $444
										dc.w $888
										dc.w $4A0
										dc.w $C64
										dc.w $48E
										dc.w $ACE
										dc.w $84E
										dc.w $22C
										dc.w $4CE
										dc.w $48
										dc.w $24
										dc.w $260
										dc.w $820
										dc.w 0
										dc.w $4AE
										dc.w 0
										dc.w $444
										dc.w $888
										dc.w $6C0
										dc.w $C64
										dc.w $48E
										dc.w $ACE
										dc.w $84E
										dc.w $22C
										dc.w $4CE
										dc.w $48
										dc.w $24
										dc.w $260
										dc.w $820
baseTiles:          incbin "graphics/basetiles.bin"
										align $8000
