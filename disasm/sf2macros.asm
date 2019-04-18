; ---------------------------------------------------------------------------
; Align and pad
; input: length to align to, value to use as padding (default is $FF)
; ---------------------------------------------------------------------------

	include "sf2cutscenemacros.asm"
	include "sf2mapsetupmacros.asm"

align:	macro
	if (narg=1)
	dcb.b \1-(*%\1),$FF
	else
	dcb.b \1-(*%\1),\2
	endc
	endm
	
headerRegion:	macro
	if (EXPANDED_ROM=0)
	dc.b 'U               '
	else
	dc.b 'JUE             '
	endc
	endm
	
regionCheck:	macro
	if (EXPANDED_ROM=0)
	bsr.w   CheckRegion
	else
	nop
	nop
	endc
	endm
	
declareRomEnd:	macro
	if (EXPANDED_ROM=0)
	dc.l $1FFFFF
	else
	dc.l $3FFFFF
	endc
	endm	

enableSram:	macro
	if (EXPANDED_ROM=1)
	move.b #$03,($a130f1).l
	endc
	endm
	
disableSram:	macro
	if (EXPANDED_ROM=1)
	move.b #$00,($a130f1).l
	endc
	endm	


conditionalRomExpand:	macro
	if (EXPANDED_ROM=1)
	include "layout\sf2-expanded-19-0x200000-0x400000.asm"
	endc
	endm
	
conditionalPc:	macro
	if (EXPANDED_ROM=0)
	\1 \2(pc),\3
	else
	\1 \2,\3
	endc
	endm
	
conditionalBsr:	macro
	if (EXPANDED_ROM=0)
	bsr.w \1
	else
	jsr \1
	endc
	endm
	
conditionalWordAddr:	macro
	if (EXPANDED_ROM=0)
	\1 (\2).w,\3
	else
	\1 (\2).l,\3
	endc
	endm	
	
alignIfVanillaRom:	macro
	if (EXPANDED_ROM=0)
	align \1
	endc
	endm
	
alignIfExpandedRom:	macro
	if (EXPANDED_ROM=1)
	align \1
	endc
	endm
	
includeIfVanillaRom:	macro
	if (EXPANDED_ROM=0)
	include \1
	endc
	endm
	
incbinIfVanillaRom:	macro
	if (EXPANDED_ROM=0)
	incbin \1
	endc
	endm

includeIfExpandedRom:	macro
	if (EXPANDED_ROM=1)
	include \1
	endc
	endm
	
incbinIfExpandedRom:	macro
	if (EXPANDED_ROM=1)
	incbin \1
	endc
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
	
;classType:	macro
	;dc.b \1
	;endm
	
criticalHitSetting:	macro
	dc.b \1, \2
	endm
	
itemBreakMessage:	macro
	dc.b \1, \2
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Enemy item drops
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
battle:			macro
	dc.b \1
	endm
	
enemyEntity:	macro
	dc.b \1
	endm
	
itemDrop:		macro
	dc.b \1
	endm
	
dropFlag:			macro
	dc.b \1
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	
;enemyGold:	macro
	;dc.w \1
	;endm
	
;spellElement:	macro
	;dc.b \1
	;endm
	
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
	dc.l \1
	endm
	
range:			macro	Min, Max
	dc.b Max, Min
	endm
	
price:			macro
	dc.w \1
	endm
	
itemType:		macro
	dc.b \1
	endm
	
useSpell:		macro
	dc.b \1
	endm
	
equipEffects:	macro
	dc.b \1, \2, \3, \4, \5, \6
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Spell definitions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

index:		macro
	dc.b \1
	endm

mpCost:		macro
	dc.b \1
	endm
	
animation:	macro
	dc.b \1
	endm
	
properties:	macro
	dc.b \1
	endm
	
;range:		macro	Min, Max	; see Item definitions
	;dc.b Max, Min
	;endm
	
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
	
battleSprite:	macro
	dc.b \1, \2
	endm
	
weaponGraphics:	macro
	dc.b \1, \2
	endm
	
shopDef:	macro
	dc.b narg
	rept narg
	dc.b \1
	shift
	endr
	endm
	
promotionSection:	macro
	dc.b narg
	rept narg
	dc.b \1
	shift
	endr
	endm
	
weaponClass:	macro
	dc.w narg
	rept narg
	dc.w \1
	shift
	endr
	endm
	
mithrilWeapons:	macro
	dc.b \1, \2, \3, \4, \5, \6, \7, \8
	endm
	
specialCaravanDescription:	macro
	dc.b \1, \2
	dc.w \3
	endm
	
;mapSprite:	macro
	;dc.b \1
	;endm
	
	
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
	dc.b \1
	endm
	
level:			macro
	dc.b \1
	endm
	
maxHp:			macro
	dc.w \1, 0
	endm
	
maxMp:			macro
	dc.b \1, 0
	endm
	
baseAtk:		macro
	dc.b \1, 0
	endm
	
baseDef:		macro
	dc.b \1, 0
	endm
	
baseAgi:		macro
	dc.b \1, 0
	endm
	
baseMov:		macro
	dc.b \1, 0
	endm
	
baseResistance:	macro
	dc.w \1, 0
	endm
	
baseProwess:	macro
	dc.b \1, 0
	endm
	
items:			macro
	dc.w \1, \2, \3, \4
	endm
	
spells:			macro
	dc.b \1, \2, \3, \4
	endm
	
initialStatus:	macro
	dc.w \1
	dcb.b 3,0
	endm
	
;moveType:		macro		; see Class definitions
	;dc.b \1
	;endm
	
unknownWord:	macro
	dcb.b 2,0
	dc.w \1
	dcb.b 2,0
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Ally stats
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
forClass:	macro
	dc.b \1
	endm
	
hpGrowth:	macro start, proj, curve
	dc.b \curve, \start, \proj
	endm
	
mpGrowth:	macro start, proj, curve
	dc.b \curve, \start, \proj
	endm
	
atkGrowth:	macro start, proj, curve
	dc.b \curve, \start, \proj
	endm
	
defGrowth:	macro start, proj, curve
	dc.b \curve, \start, \proj
	endm
	
agiGrowth:	macro start, proj, curve
	dc.b \curve, \start, \proj
	endm
	
spellList:	macro
	rept narg
	dc.b \1
	shift
	endr
	dc.b CODE_TERMINATOR_BYTE
	endm
	
useFirstSpellList:	macro
	dc.b CODE_USE_FIRST_SPELL_LIST
	endm
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Ally start definitions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

startClass:	macro
	dc.b \1
	endm
	
startLevel:	macro
	dc.b \1
	endm
	
startItems:	macro
	dc.b \1, \2, \3, \4
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
	dc.w \1
	endm
	
moveType:	macro
	dc.b \1
	endm
	
prowess:	macro
	dc.b \1
	endm
	