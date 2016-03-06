
; GAME SECTION 12 :
; Ally battle sprites, status anim tiles, battlescene transition tiles, bolt graphics, ally and enemy animations

; FREE SPACE : 871 bytes.


p_pt_AllyBattleSprites:
										dc.l pt_AllyBattleSprites
p_statusAnimationTiles:
										dc.l StatusAnimationTiles
p_pt_battlesceneTransitionTiles:
										dc.l pt_battlesceneTransitionTiles
p_BoltAnimData_A:   dc.l BoltAnimData_A
p_BoltAnimData_B:   dc.l BoltAnimData_B
p_pt_AllyAnimations:dc.l pt_AlliesAnimations
p_pt_EnemyAnimations:
										dc.l pt_EnemyAnimations
pt_AllyBattleSprites:
										dc.l AllyBattleSprite00
										dc.l AllyBattleSprite01
										dc.l AllyBattleSprite02
										dc.l AllyBattleSprite03
										dc.l AllyBattleSprite04
										dc.l AllyBattleSprite05
										dc.l AllyBattleSprite06
										dc.l AllyBattleSprite07
										dc.l AllyBattleSprite08
										dc.l AllyBattleSprite09
										dc.l AllyBattleSprite10
										dc.l AllyBattleSprite11
										dc.l AllyBattleSprite12
										dc.l AllyBattleSprite13
										dc.l AllyBattleSprite14
										dc.l AllyBattleSprite15
										dc.l AllyBattleSprite16
										dc.l AllyBattleSprite17
										dc.l AllyBattleSprite18
										dc.l AllyBattleSprite19
										dc.l AllyBattleSprite20
										dc.l AllyBattleSprite21
										dc.l AllyBattleSprite22
										dc.l AllyBattleSprite23
										dc.l AllyBattleSprite24
										dc.l AllyBattleSprite25
										dc.l AllyBattleSprite26
										dc.l AllyBattleSprite27
										dc.l AllyBattleSprite28
										dc.l AllyBattleSprite29
										dc.l AllyBattleSprite30
										dc.l AllyBattleSprite31
AllyBattleSprite00: incbin "graphics/battles/battlesprites/allies/allybattlesprite00.bin"
AllyBattleSprite01: incbin "graphics/battles/battlesprites/allies/allybattlesprite01.bin"
AllyBattleSprite02: incbin "graphics/battles/battlesprites/allies/allybattlesprite02.bin"
AllyBattleSprite03: incbin "graphics/battles/battlesprites/allies/allybattlesprite03.bin"
AllyBattleSprite04: incbin "graphics/battles/battlesprites/allies/allybattlesprite04.bin"
AllyBattleSprite05: incbin "graphics/battles/battlesprites/allies/allybattlesprite05.bin"
AllyBattleSprite06: incbin "graphics/battles/battlesprites/allies/allybattlesprite06.bin"
AllyBattleSprite07: incbin "graphics/battles/battlesprites/allies/allybattlesprite07.bin"
AllyBattleSprite08: incbin "graphics/battles/battlesprites/allies/allybattlesprite08.bin"
AllyBattleSprite09: incbin "graphics/battles/battlesprites/allies/allybattlesprite09.bin"
AllyBattleSprite10: incbin "graphics/battles/battlesprites/allies/allybattlesprite10.bin"
AllyBattleSprite11: incbin "graphics/battles/battlesprites/allies/allybattlesprite11.bin"
AllyBattleSprite12: incbin "graphics/battles/battlesprites/allies/allybattlesprite12.bin"
AllyBattleSprite13: incbin "graphics/battles/battlesprites/allies/allybattlesprite13.bin"
AllyBattleSprite14: incbin "graphics/battles/battlesprites/allies/allybattlesprite14.bin"
AllyBattleSprite15: incbin "graphics/battles/battlesprites/allies/allybattlesprite15.bin"
AllyBattleSprite16: incbin "graphics/battles/battlesprites/allies/allybattlesprite16.bin"
AllyBattleSprite17: incbin "graphics/battles/battlesprites/allies/allybattlesprite17.bin"
AllyBattleSprite18: incbin "graphics/battles/battlesprites/allies/allybattlesprite18.bin"
AllyBattleSprite19: incbin "graphics/battles/battlesprites/allies/allybattlesprite19.bin"
AllyBattleSprite20: incbin "graphics/battles/battlesprites/allies/allybattlesprite20.bin"
AllyBattleSprite21: incbin "graphics/battles/battlesprites/allies/allybattlesprite21.bin"
AllyBattleSprite22: incbin "graphics/battles/battlesprites/allies/allybattlesprite22.bin"
AllyBattleSprite23: incbin "graphics/battles/battlesprites/allies/allybattlesprite23.bin"
AllyBattleSprite24: incbin "graphics/battles/battlesprites/allies/allybattlesprite24.bin"
AllyBattleSprite25: incbin "graphics/battles/battlesprites/allies/allybattlesprite25.bin"
AllyBattleSprite26: incbin "graphics/battles/battlesprites/allies/allybattlesprite26.bin"
AllyBattleSprite27: incbin "graphics/battles/battlesprites/allies/allybattlesprite27.bin"
AllyBattleSprite28: incbin "graphics/battles/battlesprites/allies/allybattlesprite28.bin"
AllyBattleSprite29: incbin "graphics/battles/battlesprites/allies/allybattlesprite29.bin"
AllyBattleSprite30: incbin "graphics/battles/battlesprites/allies/allybattlesprite30.bin"
AllyBattleSprite31: incbin "graphics/battles/battlesprites/allies/allybattlesprite31.bin"
StatusAnimationTiles:
										incbin "graphics/technical/statusanimationtiles.bin"
pt_battlesceneTransitionTiles:
										dc.l BattlesceneTransitionTilesA
										dc.l BattlesceneTransitionTilesB
BattlesceneTransitionTilesA:
										incbin "graphics/technical/battlescenetransitiontilesa.bin"
BattlesceneTransitionTilesB:
										incbin "graphics/technical/battlescenetransitiontilesb.bin"
BoltAnimData_A:     incbin "graphics/battles/spells/animations/boltanimdataa.bin"
BoltAnimData_B:     incbin "graphics/battles/spells/animations/boltanimdatab.bin"
pt_AlliesAnimations:dc.l AllyAnimation000
										dc.l AllyAnimation001
										dc.l AllyAnimation002
										dc.l AllyAnimation003
										dc.l AllyAnimation004
										dc.l AllyAnimation005
										dc.l AllyAnimation006
										dc.l AllyAnimation007
										dc.l AllyAnimation008
										dc.l AllyAnimation009
										dc.l AllyAnimation010
										dc.l AllyAnimation011
										dc.l AllyAnimation012
										dc.l AllyAnimation013
										dc.l AllyAnimation014
										dc.l AllyAnimation015
										dc.l AllyAnimation016
										dc.l AllyAnimation017
										dc.l AllyAnimation018
										dc.l AllyAnimation019
										dc.l AllyAnimation020
										dc.l AllyAnimation021
										dc.l AllyAnimation022
										dc.l AllyAnimation023
										dc.l AllyAnimation024
										dc.l AllyAnimation025
										dc.l AllyAnimation026
										dc.l AllyAnimation027
										dc.l AllyAnimation028
										dc.l AllyAnimation029
										dc.l AllyAnimation030
										dc.l AllyAnimation031
										dc.l AllyAnimation032
										dc.l AllyAnimation033
										dc.l AllyAnimation034
										dc.l AllyAnimation035
										dc.l AllyAnimation036
										dc.l AllyAnimation037
										dc.l AllyAnimation038
										dc.l AllyAnimation039
										dc.l AllyAnimation040
										dc.l AllyAnimation041
										dc.l AllyAnimation042
										dc.l AllyAnimation043
										dc.l AllyAnimation044
										dc.l AllyAnimation045
										dc.l AllyAnimation046
										dc.l AllyAnimation047
										dc.l AllyAnimation048
										dc.l AllyAnimation049
										dc.l AllyAnimation050
										dc.l AllyAnimation051
										dc.l AllyAnimation052
										dc.l AllyAnimation053
										dc.l AllyAnimation054
										dc.l AllyAnimation055
										dc.l AllyAnimation056
										dc.l AllyAnimation057
										dc.l AllyAnimation058
										dc.l AllyAnimation059
										dc.l AllyAnimation060
										dc.l AllyAnimation061
										dc.l AllyAnimation062
										dc.l AllyAnimation063
										dc.l AllyAnimation064
										dc.l AllyAnimation065
										dc.l AllyAnimation066
										dc.l AllyAnimation067
										dc.l AllyAnimation068
										dc.l AllyAnimation069
										dc.l AllyAnimation070
										dc.l AllyAnimation071
										dc.l AllyAnimation072
										dc.l AllyAnimation073
										dc.l AllyAnimation074
										dc.l AllyAnimation075
										dc.l AllyAnimation076
										dc.l AllyAnimation077
										dc.l AllyAnimation078
										dc.l AllyAnimation079
										dc.l AllyAnimation080
										dc.l AllyAnimation081
										dc.l AllyAnimation082
										dc.l AllyAnimation083
										dc.l AllyAnimation084
										dc.l AllyAnimation085
										dc.l AllyAnimation086
AllyAnimation000:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation000.bin"
AllyAnimation001:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation001.bin"
AllyAnimation002:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation002.bin"
AllyAnimation003:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation003.bin"
AllyAnimation004:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation004.bin"
AllyAnimation005:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation005.bin"
AllyAnimation006:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation006.bin"
AllyAnimation007:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation007.bin"
AllyAnimation008:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation008.bin"
AllyAnimation009:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation009.bin"
AllyAnimation010:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation010.bin"
AllyAnimation011:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation011.bin"
AllyAnimation012:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation012.bin"
AllyAnimation013:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation013.bin"
AllyAnimation014:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation014.bin"
AllyAnimation015:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation015.bin"
AllyAnimation016:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation016.bin"
AllyAnimation017:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation017.bin"
AllyAnimation018:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation018.bin"
AllyAnimation019:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation019.bin"
AllyAnimation020:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation020.bin"
AllyAnimation021:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation021.bin"
AllyAnimation022:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation022.bin"
AllyAnimation023:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation023.bin"
AllyAnimation024:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation024.bin"
AllyAnimation025:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation025.bin"
AllyAnimation026:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation026.bin"
AllyAnimation027:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation027.bin"
AllyAnimation028:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation028.bin"
AllyAnimation029:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation029.bin"
AllyAnimation030:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation030.bin"
AllyAnimation031:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation031.bin"
AllyAnimation032:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation032.bin"
AllyAnimation033:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation033.bin"
AllyAnimation034:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation034.bin"
AllyAnimation035:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation035.bin"
AllyAnimation036:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation036.bin"
AllyAnimation037:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation037.bin"
AllyAnimation038:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation038.bin"
AllyAnimation039:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation039.bin"
AllyAnimation040:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation040.bin"
AllyAnimation041:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation041.bin"
AllyAnimation042:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation042.bin"
AllyAnimation043:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation043.bin"
AllyAnimation044:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation044.bin"
AllyAnimation045:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation045.bin"
AllyAnimation046:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation046.bin"
AllyAnimation047:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation047.bin"
AllyAnimation048:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation048.bin"
AllyAnimation049:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation049.bin"
AllyAnimation050:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation050.bin"
AllyAnimation051:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation051.bin"
AllyAnimation052:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation052.bin"
AllyAnimation053:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation053.bin"
AllyAnimation054:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation054.bin"
AllyAnimation055:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation055.bin"
AllyAnimation056:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation056.bin"
AllyAnimation057:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation057.bin"
AllyAnimation058:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation058.bin"
AllyAnimation059:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation059.bin"
AllyAnimation060:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation060.bin"
AllyAnimation061:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation061.bin"
AllyAnimation062:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation062.bin"
AllyAnimation063:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation063.bin"
AllyAnimation064:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation064.bin"
AllyAnimation065:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation065.bin"
AllyAnimation066:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation066.bin"
AllyAnimation067:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation067.bin"
AllyAnimation068:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation068.bin"
AllyAnimation069:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation069.bin"
AllyAnimation070:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation070.bin"
AllyAnimation071:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation071.bin"
AllyAnimation072:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation072.bin"
AllyAnimation073:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation073.bin"
AllyAnimation074:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation074.bin"
AllyAnimation075:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation075.bin"
AllyAnimation076:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation076.bin"
AllyAnimation077:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation077.bin"
AllyAnimation078:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation078.bin"
AllyAnimation079:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation079.bin"
AllyAnimation080:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation080.bin"
AllyAnimation081:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation081.bin"
AllyAnimation082:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation082.bin"
AllyAnimation083:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation083.bin"
AllyAnimation084:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation084.bin"
AllyAnimation085:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation085.bin"
AllyAnimation086:   incbin "graphics/battles/battlesprites/allies/animations/allybattlespriteanimation086.bin"
pt_EnemyAnimations: dc.l EnemyAnimation000
										dc.l EnemyAnimation001
										dc.l EnemyAnimation002
										dc.l EnemyAnimation003
										dc.l EnemyAnimation004
										dc.l EnemyAnimation005
										dc.l EnemyAnimation006
										dc.l EnemyAnimation007
										dc.l EnemyAnimation008
										dc.l EnemyAnimation009
										dc.l EnemyAnimation010
										dc.l EnemyAnimation011
										dc.l EnemyAnimation012
										dc.l EnemyAnimation013
										dc.l EnemyAnimation014
										dc.l EnemyAnimation015
										dc.l EnemyAnimation016
										dc.l EnemyAnimation017
										dc.l EnemyAnimation018
										dc.l EnemyAnimation019
										dc.l EnemyAnimation020
										dc.l EnemyAnimation021
										dc.l EnemyAnimation022
										dc.l EnemyAnimation023
										dc.l EnemyAnimation024
										dc.l EnemyAnimation025
										dc.l EnemyAnimation026
										dc.l EnemyAnimation027
										dc.l EnemyAnimation028
										dc.l EnemyAnimation029
										dc.l EnemyAnimation030
										dc.l EnemyAnimation031
										dc.l EnemyAnimation032
										dc.l EnemyAnimation033
										dc.l EnemyAnimation034
										dc.l EnemyAnimation035
										dc.l EnemyAnimation036
										dc.l EnemyAnimation037
										dc.l EnemyAnimation038
										dc.l EnemyAnimation039
										dc.l EnemyAnimation040
										dc.l EnemyAnimation041
										dc.l EnemyAnimation042
										dc.l EnemyAnimation043
										dc.l EnemyAnimation044
										dc.l EnemyAnimation045
										dc.l EnemyAnimation046
										dc.l EnemyAnimation047
										dc.l EnemyAnimation048
										dc.l EnemyAnimation049
										dc.l EnemyAnimation050
										dc.l EnemyAnimation051
										dc.l EnemyAnimation052
										dc.l EnemyAnimation053
										dc.l EnemyAnimation054
										dc.l EnemyAnimation055
										dc.l EnemyAnimation056
										dc.l EnemyAnimation057
										dc.l EnemyAnimation058
										dc.l EnemyAnimation059
										dc.l EnemyAnimation060
										dc.l EnemyAnimation061
										dc.l EnemyAnimation062
										dc.l EnemyAnimation063
										dc.l EnemyAnimation064
										dc.l EnemyAnimation065
										dc.l EnemyAnimation066
										dc.l EnemyAnimation067
										dc.l EnemyAnimation068
										dc.l EnemyAnimation069
										dc.l EnemyAnimation070
										dc.l EnemyAnimation071
										dc.l EnemyAnimation072
										dc.l EnemyAnimation073
										dc.l EnemyAnimation074
										dc.l EnemyAnimation075
										dc.l EnemyAnimation076
										dc.l EnemyAnimation077
										dc.l EnemyAnimation078
										dc.l EnemyAnimation079
										dc.l EnemyAnimation080
										dc.l EnemyAnimation081
										dc.l EnemyAnimation082
										dc.l EnemyAnimation083
										dc.l EnemyAnimation084
										dc.l EnemyAnimation085
										dc.l EnemyAnimation086
										dc.l EnemyAnimation087
										dc.l EnemyAnimation088
										dc.l EnemyAnimation089
										dc.l EnemyAnimation090
										dc.l EnemyAnimation091
										dc.l EnemyAnimation092
										dc.l EnemyAnimation093
										dc.l EnemyAnimation094
										dc.l EnemyAnimation095
										dc.l EnemyAnimation096
										dc.l EnemyAnimation097
										dc.l EnemyAnimation098
										dc.l EnemyAnimation099
										dc.l EnemyAnimation100
										dc.l EnemyAnimation101
										dc.l EnemyAnimation102
										dc.l EnemyAnimation103
										dc.l EnemyAnimation104
										dc.l EnemyAnimation105
										dc.l EnemyAnimation106
										dc.l EnemyAnimation107
										dc.l EnemyAnimation108
										dc.l EnemyAnimation109
										dc.l EnemyAnimation110
										dc.l EnemyAnimation111
										dc.l EnemyAnimation112
										dc.l EnemyAnimation113
										dc.l EnemyAnimation114
										dc.l EnemyAnimation115
										dc.l EnemyAnimation116
										dc.l EnemyAnimation117
										dc.l EnemyAnimation118
										dc.l EnemyAnimation119
										dc.l EnemyAnimation120
EnemyAnimation000:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation000.bin"
EnemyAnimation001:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation001.bin"
EnemyAnimation002:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation002.bin"
EnemyAnimation003:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation003.bin"
EnemyAnimation004:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation004.bin"
EnemyAnimation005:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation005.bin"
EnemyAnimation006:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation006.bin"
EnemyAnimation007:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation007.bin"
EnemyAnimation008:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation008.bin"
EnemyAnimation009:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation009.bin"
EnemyAnimation010:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation010.bin"
EnemyAnimation011:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation011.bin"
EnemyAnimation012:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation012.bin"
EnemyAnimation013:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation013.bin"
EnemyAnimation014:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation014.bin"
EnemyAnimation015:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation015.bin"
EnemyAnimation016:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation016.bin"
EnemyAnimation017:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation017.bin"
EnemyAnimation018:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation018.bin"
EnemyAnimation019:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation019.bin"
EnemyAnimation020:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation020.bin"
EnemyAnimation021:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation021.bin"
EnemyAnimation022:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation022.bin"
EnemyAnimation023:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation023.bin"
EnemyAnimation024:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation024.bin"
EnemyAnimation025:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation025.bin"
EnemyAnimation026:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation026.bin"
EnemyAnimation027:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation027.bin"
EnemyAnimation028:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation028.bin"
EnemyAnimation029:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation029.bin"
EnemyAnimation030:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation030.bin"
EnemyAnimation031:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation031.bin"
EnemyAnimation032:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation032.bin"
EnemyAnimation033:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation033.bin"
EnemyAnimation034:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation034.bin"
EnemyAnimation035:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation035.bin"
EnemyAnimation036:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation036.bin"
EnemyAnimation037:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation037.bin"
EnemyAnimation038:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation038.bin"
EnemyAnimation039:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation039.bin"
EnemyAnimation040:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation040.bin"
EnemyAnimation041:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation041.bin"
EnemyAnimation042:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation042.bin"
EnemyAnimation043:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation043.bin"
EnemyAnimation044:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation044.bin"
EnemyAnimation045:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation045.bin"
EnemyAnimation046:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation046.bin"
EnemyAnimation047:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation047.bin"
EnemyAnimation048:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation048.bin"
EnemyAnimation049:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation049.bin"
EnemyAnimation050:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation050.bin"
EnemyAnimation051:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation051.bin"
EnemyAnimation052:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation052.bin"
EnemyAnimation053:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation053.bin"
EnemyAnimation054:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation054.bin"
EnemyAnimation055:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation055.bin"
EnemyAnimation056:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation056.bin"
EnemyAnimation057:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation057.bin"
EnemyAnimation058:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation058.bin"
EnemyAnimation059:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation059.bin"
EnemyAnimation060:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation060.bin"
EnemyAnimation061:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation061.bin"
EnemyAnimation062:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation062.bin"
EnemyAnimation063:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation063.bin"
EnemyAnimation064:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation064.bin"
EnemyAnimation065:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation065.bin"
EnemyAnimation066:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation066.bin"
EnemyAnimation067:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation067.bin"
EnemyAnimation068:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation068.bin"
EnemyAnimation069:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation069.bin"
EnemyAnimation070:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation070.bin"
EnemyAnimation071:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation071.bin"
EnemyAnimation072:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation072.bin"
EnemyAnimation073:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation073.bin"
EnemyAnimation074:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation074.bin"
EnemyAnimation075:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation075.bin"
EnemyAnimation076:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation076.bin"
EnemyAnimation077:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation077.bin"
EnemyAnimation078:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation078.bin"
EnemyAnimation079:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation079.bin"
EnemyAnimation080:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation080.bin"
EnemyAnimation081:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation081.bin"
EnemyAnimation082:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation082.bin"
EnemyAnimation083:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation083.bin"
EnemyAnimation084:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation084.bin"
EnemyAnimation085:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation085.bin"
EnemyAnimation086:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation086.bin"
EnemyAnimation087:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation087.bin"
EnemyAnimation088:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation088.bin"
EnemyAnimation089:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation089.bin"
EnemyAnimation090:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation090.bin"
EnemyAnimation091:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation091.bin"
EnemyAnimation092:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation092.bin"
EnemyAnimation093:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation093.bin"
EnemyAnimation094:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation094.bin"
EnemyAnimation095:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation095.bin"
EnemyAnimation096:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation096.bin"
EnemyAnimation097:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation097.bin"
EnemyAnimation098:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation098.bin"
EnemyAnimation099:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation099.bin"
EnemyAnimation100:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation100.bin"
EnemyAnimation101:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation101.bin"
EnemyAnimation102:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation102.bin"
EnemyAnimation103:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation103.bin"
EnemyAnimation104:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation104.bin"
EnemyAnimation105:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation105.bin"
EnemyAnimation106:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation106.bin"
EnemyAnimation107:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation107.bin"
EnemyAnimation108:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation108.bin"
EnemyAnimation109:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation109.bin"
EnemyAnimation110:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation110.bin"
EnemyAnimation111:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation111.bin"
EnemyAnimation112:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation112.bin"
EnemyAnimation113:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation113.bin"
EnemyAnimation114:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation114.bin"
EnemyAnimation115:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation115.bin"
EnemyAnimation116:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation116.bin"
EnemyAnimation117:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation117.bin"
EnemyAnimation118:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation118.bin"
EnemyAnimation119:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation119.bin"
EnemyAnimation120:  incbin "graphics/battles/battlesprites/enemies/animations/enemybattlespriteanimation120.bin"
										align $4000
