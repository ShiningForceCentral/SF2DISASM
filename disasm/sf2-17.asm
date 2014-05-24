
; GAME SECTION 17 :
; PCM Banks, YM Instruments, sound driver, char stats, witch screens

; FREE SPACE : 462 bytes.


										incbin "sound/pcm/bank0.bin"
										incbin "sound/pcm/bank1.bin"
										incbin "sound/yminst.bin"
Z80_SoundDriver:    incbin "sound/driver/cube.bin"
p_StatGrowthCurves: dc.l StatGrowthCurves   ; related to level up stat gains ?
p_pt_CharacterStats:dc.l pt_CharacterStats
p_CharacterStartData:
										dc.l CharacterStartData
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
StatGrowthCurves:   incbin "chardata/growthcurves.bin"
pt_CharacterStats:  dc.l stats_Bowie
										dc.l stats_Sarah
										dc.l stats_Chester
										dc.l stats_Jaha
										dc.l stats_Kazin
										dc.l stats_Slade
										dc.l stats_Kiwi
										dc.l stats_Peter
										dc.l stats_May
										dc.l stats_Gerhalt
										dc.l stats_Luke
										dc.l stats_Rohde
										dc.l stats_Rick
										dc.l stats_Elric
										dc.l stats_Eric
										dc.l stats_Karna
										dc.l stats_Randolf
										dc.l stats_Tyrin
										dc.l stats_Janet
										dc.l stats_Higins
										dc.l stats_Skreech
										dc.l stats_Taya
										dc.l stats_Frayja
										dc.l stats_Jaro
										dc.l stats_Gyan
										dc.l stats_Sheela
										dc.l stats_Zynk
										dc.l stats_Chaz
										dc.l stats_Lemon
										dc.l stats_Claude
										dc.l stats_Claude
										dc.l stats_Claude
stats_Bowie:        incbin "chardata/stats/bowie.bin"
stats_Sarah:        incbin "chardata/stats/sarah.bin"
stats_Chester:      incbin "chardata/stats/chester.bin"
stats_Jaha:         incbin "chardata/stats/jaha.bin"
stats_Kazin:        incbin "chardata/stats/kazin.bin"
stats_Slade:        incbin "chardata/stats/slade.bin"
stats_Kiwi:         incbin "chardata/stats/kiwi.bin"
stats_Peter:        incbin "chardata/stats/peter.bin"
stats_May:          incbin "chardata/stats/may.bin"
stats_Gerhalt:      incbin "chardata/stats/gerhalt.bin"
stats_Luke:         incbin "chardata/stats/luke.bin"
stats_Rohde:        incbin "chardata/stats/rohde.bin"
stats_Rick:         incbin "chardata/stats/rick.bin"
stats_Elric:        incbin "chardata/stats/elric.bin"
stats_Eric:         incbin "chardata/stats/eric.bin"
stats_Karna:        incbin "chardata/stats/karna.bin"
stats_Randolf:      incbin "chardata/stats/randolf.bin"
stats_Tyrin:        incbin "chardata/stats/tyrin.bin"
stats_Janet:        incbin "chardata/stats/janet.bin"
stats_Higins:       incbin "chardata/stats/higins.bin"
stats_Skreech:      incbin "chardata/stats/skreech.bin"
stats_Taya:         incbin "chardata/stats/taya.bin"
stats_Frayja:       incbin "chardata/stats/frayja.bin"
stats_Jaro:         incbin "chardata/stats/jaro.bin"
stats_Gyan:         incbin "chardata/stats/gyan.bin"
stats_Sheela:       incbin "chardata/stats/sheela.bin"
stats_Zynk:         incbin "chardata/stats/zynk.bin"
stats_Chaz:         incbin "chardata/stats/chaz.bin"
stats_Lemon:        incbin "chardata/stats/lemon.bin"
stats_Claude:       incbin "chardata/stats/claude.bin"
CharacterStartData: incbin "chardata/startdata.bin"
ClassData:          incbin "chardata/classdata.bin"
JewelsEndScreenLayout:
										incbin "misc/specialscreens/endingjewelslayout.bin"
plt_JewelsEndScreen:incbin "misc/specialscreens/endingjewelspalette.bin"
JewelsEndScreenTiles:
										incbin "misc/specialscreens/endingjewelstiles.bin"
plt_SuspendString:  incbin "misc/specialscreens/suspendstringpalette.bin"
SuspendStringTiles: incbin "misc/specialscreens/suspendstringtiles.bin"
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
baseTiles:          incbin "misc/basetiles.bin"
										align $8000
