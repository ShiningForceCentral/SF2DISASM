; ---------------------------------------------------------------------------
; Align and pad
; input: length to align to, value to use as padding (default is $FF)
; ---------------------------------------------------------------------------

	include "sf2cutscenemacros.asm"
	include "sf2mapmacros.asm"
	include "sf2mapsetupmacros.asm"

align:	macro
	if (narg=1)
	dcb.b \1-(*%\1),$FF
	else
	dcb.b \1-(*%\1),\2
	endc
	endm
	
wordAlign:	macro
	dcb.b *%2,$FF
	endm
	
sndCom:	macro
	trap #SOUND_COMMAND
	dc.w \1
	endm
	
chkFlg:	macro
	trap #CHECK_FLAG
	dc.w \1
	endm
	
setFlg:	macro
	trap #SET_FLAG
	dc.w \1
	endm
	
clrFlg:	macro
	trap #CLEAR_FLAG
	dc.w \1
	endm
	
checkFlg:	macro
	trap #4
	dc.w \1
	endm
	
txt:	macro
	trap #TEXTBOX
	dc.w \1
	endm
	
clsTxt:	macro
	trap #TEXTBOX
	dc.w $FFFF
	endm
	
script:	macro
	lea \1(pc), a0
	trap #MAPSCRIPT
	endm
	
    
defineBitfield:	macro
v:	= 0
n:	substr ,,"\2"
i:	= instr("\n","|")
	while (i>0)
p:	substr ,i-1,"\n"
v:	= v|\1\\p
n:	substr i+1,,"\n"
i:	= instr("\n","|")
	endw
v:	= v|\1\\n
	dc.\0 v
	endm
	
tableEnd:	macro
	if strcmp('\0','b')
	dc.b CODE_TERMINATOR_BYTE
	else
	dc.w CODE_TERMINATOR_WORD
	endc
	endm
	
	
flagSwitchedMap:	macro
	dc.w \1
	dc.w \2
	dc.w \3
	endm

flagSwitchedMapsEnd:	macro
	dc.w $FFFF
	endm
	
battleMapCoords:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.b \5
	dc.b \6
	dc.b \7
	endm
	
savePointMapCoords:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	endm
	
raftResetMapCoords:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	endm
	
	
classType:	macro
	dc.b CLASSTYPE_\1
	endm
	
;criticalHitSettings:	macro
	;dc.b \1,\2
	;endm
	
itemBreakMessage:	macro
	dc.b ITEM_\1,\2
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Enemy item drops
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
battle:			macro
	dc.b BATTLE_\1
	endm
	
enemyEntity:	macro
	dc.b \1+128
	endm
	
itemDrop:		macro
	dc.b ITEM_\1
	endm
	
dropFlag:			macro
	dc.b \1
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	
;enemyGold:	macro
	;dc.w \1
	;endm
	
spellElement:	macro
	dc.b SPELLELEMENT_\1
	endm
	
spellName:	macro
	dc.b strlen(\1)
	dc.b \1
	endm
	
allyName:	macro
	dc.b strlen(\1)
	dc.b \1
	endm
	
enemyName:	macro
	if (narg=2)				; if there are 2 arguments, it must be Jaro's bugged enemy name ending with a null character
	dc.b strlen(\1)+1
	else					; otherwise, just a regular name
	dc.b strlen(\1)
	endc
	rept narg
	dc.b \1
	shift
	endr
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Item definitions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

equipFlags:		macro
	defineBitfield.l EQUIPFLAG_,\1
	endm
	
range:			macro Min,Max
	dc.b Max,Min
	endm
	
price:			macro
	dc.w \1
	endm
	
itemType:		macro
	defineBitfield.b ITEMTYPE_,\1
	endm
	
useSpell:		macro
	defineBitfield.b SPELL_,\1
	endm
	
equipEffects:	macro
	dc.b EQUIPEFFECT_\1,\2
	dc.b EQUIPEFFECT_\3,\4
	dc.b EQUIPEFFECT_\5,\6
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Spell definitions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

index:		macro
	defineBitfield.b SPELL_,\1
	endm
	
mpCost:		macro
	dc.b \1
	endm
	
animation:	macro
	defineBitfield.b SPELLANIMATION_,\1
	endm
	
properties:	macro
	defineBitfield.b SPELLPROPS_,\1
	endm
	
;range:						; see Item definitions
	
radius:		macro
	dc.b \1
	endm
	
power:		macro
	dc.b \1
	endm
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	
itemName:	macro
	if (narg=3)				; if there are 3 arguments, item name must contain a special control code
	dc.b strlen(\1)+strlen(\3)+1
	else					; otherwise, just a regular name
	dc.b strlen(\1)
	endc
	rept narg
	dc.b \1
	shift
	endr
	endm
	
className:	macro
	dc.b strlen(\1)
	dc.b \1
	endm
	
allyBattleSprite:	macro
	dc.b ALLYBATTLESPRITE_\1,\2
	endm
	
enemyBattleSprite:	macro
	dc.b ENEMYBATTLESPRITE_\1,\2
	endm
	
weaponSprite:	macro
	dc.b WEAPONSPRITE_\1
	endm
	
weaponPalette:	macro
	dc.b WEAPONPALETTE_\1
	endm
	
shopDef:	macro
	dc.b narg
	rept narg
	dc.b ITEM_\1
	shift
	endr
	endm
	
promotionSection:	macro
	dc.b narg
	rept narg
	dc.b CLASS_\1
	shift
	endr
	endm
	
promotionItems:	macro
	dc.b narg
	rept narg
	dc.b ITEM_\1
	shift
	endr
	endm
	
mithrilWeaponClass:	macro
	dc.w narg
	rept narg
	dc.w CLASS_\1
	shift
	endr
	endm
	
mithrilWeapons:	macro
	dc.b \1,ITEM_\2
	dc.b \3,ITEM_\4
	dc.b \5,ITEM_\6
	dc.b \7,ITEM_\8
	endm
	
specialCaravanDescription:	macro
	dc.b ITEM_\1,\2
	dc.w \3
	endm
	
usableOutsideBattleItem:	macro
	dc.b ITEM_\1
	endm
	
follower:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	endm
	
mapSprite:	macro
	if (type(MAPSPRITE_\1)&32>0)
	dc.b MAPSPRITE_\1
	else
	dc.b \1
	endc
	endm
	
portrait:	macro
	if (type(PORTRAIT_\1)&32>0)
	dc.b PORTRAIT_\1
	else
	dc.b \1
	endc
	endm
	
speechSound:	macro
	if (type(SFX_\1)&32>0)
	dc.b SFX_\1
	else
	dc.b \1
	endc
	dc.b 0
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Enemy definitions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

unknownByte:	macro
	dc.b \1
	dcb.b 9,0				; ...and define placeholder zeros while we're at it
	endm
	
spellPower:		macro
	dc.b SPELLPOWER_\1
	endm
	
level:			macro
	dc.b \1
	endm
	
maxHp:			macro
	dc.w \1,0
	endm
	
maxMp:			macro
	dc.b \1,0
	endm
	
baseAtk:		macro
	dc.b \1,0
	endm
	
baseDef:		macro
	dc.b \1,0
	endm
	
baseAgi:		macro
	dc.b \1,0
	endm
	
baseMov:		macro
	dc.b \1,0
	endm
	
baseResistance:	macro
	defineBitfield.w RESISTANCE_,\1
	dc.w 0
	endm
	
baseProwess:	macro
	defineBitfield.b PROWESS_,\1
	dc.b 0
	endm
	
items:			macro
	defineBitfield.w ITEM_,\1
	defineBitfield.w ITEM_,\2
	defineBitfield.w ITEM_,\3
	defineBitfield.w ITEM_,\4
	endm
	
spells:			macro
	defineBitfield.b SPELL_,\1
	defineBitfield.b SPELL_,\2
	defineBitfield.b SPELL_,\3
	defineBitfield.b SPELL_,\4
	endm
	
initialStatus:	macro
	dc.w \1
	dcb.b 3,0
	endm
	
;moveType:					; see Class definitions
	
unknownWord:	macro
	dcb.b 2,0
	dc.w \1
	dcb.b 2,0
	endm
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
randomBattles:	macro
	dc.b narg
	rept narg
	dc.b BATTLE_\1
	shift
	endr
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Ally stats
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
forClass:	macro
	dc.b CLASS_\1
	endm
	
hpGrowth:	macro Start,Proj,Curve
	dc.b GROWTHCURVE_\Curve,\Start,\Proj
	endm
	
mpGrowth:	macro Start,Proj,Curve
	dc.b GROWTHCURVE_\Curve,\Start,\Proj
	endm
	
atkGrowth:	macro Start,Proj,Curve
	dc.b GROWTHCURVE_\Curve,\Start,\Proj
	endm
	
defGrowth:	macro Start,Proj,Curve
	dc.b GROWTHCURVE_\Curve,\Start,\Proj
	endm
	
agiGrowth:	macro Start,Proj,Curve
	dc.b GROWTHCURVE_\Curve,\Start,\Proj
	endm
	
spellList:	macro
	rept narg/2
	dc.b \1
	defineBitfield.b SPELL_,\2
	shift
	shift
	endr
	dc.b ALLYSTATS_CODE_END_OF_SPELL_LIST
	endm
	
useFirstSpellList:	macro
	dc.b ALLYSTATS_CODE_USE_FIRST_SPELL_LIST
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Ally start definitions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

startClass:	macro
	dc.b CLASS_\1
	endm
	
startLevel:	macro
	dc.b \1
	endm
	
startItems:	macro
	defineBitfield.b ITEM_,\1
	defineBitfield.b ITEM_,\2
	defineBitfield.b ITEM_,\3
	defineBitfield.b ITEM_,\4
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Class definitions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov:		macro
	dc.b \1
	endm
	
resistance:	macro
	defineBitfield.w RESISTANCE_,\1
	endm
	
moveType:	macro
	defineBitfield.b MOVETYPE_,\1
	endm
	
prowess:	macro
	defineBitfield.b PROWESS_,\1
	endm
	