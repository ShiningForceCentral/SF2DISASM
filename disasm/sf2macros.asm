; ---------------------------------------------------------------------------
; Align and pad
; input: length to align to, value to use as padding (default is $FF)
; ---------------------------------------------------------------------------

    include "sf2cutscenemacros.asm"
    include "sf2mapmacros.asm"
    include "sf2mapsetupmacros.asm"
    include "sf2battlescenemacros.asm"

align: macro
    case narg
=0  ; If no arguments given, align to word boundary.
    dcb.b *%2,$FF
=1  ; If given an address argument only, pad with $FF.
    dcb.b \1-(*%\1),$FF
=?  ; If two arguments or more, pad with second argument.
    dcb.b \1-(*%\1),\2
    endcase
    endm
    
wordAlign: macro ;alias
    align
    endm
    
sndCom: macro
    trap #SOUND_COMMAND
    dc.w \1
    endm
    
chkFlg: macro
    trap #CHECK_FLAG
    dc.w \1
    endm
    
setFlg: macro
    trap #SET_FLAG
    dc.w \1
    endm
    
clrFlg: macro
    trap #CLEAR_FLAG
    dc.w \1
    endm
    
checkFlg: macro
    trap #4
    dc.w \1
    endm
    
txt: macro
    trap #TEXTBOX
    dc.w \1
    endm
    
clsTxt: macro
    trap #TEXTBOX
    dc.w $FFFF
    endm
    
script: macro
    lea \1(pc), a0
    trap #MAPSCRIPT
    endm
    
; ---------------------------------------------------------------------------
; Data definition macros
; ---------------------------------------------------------------------------
    
defineBitfieldWithParam: macro Prefix,Bitfield,Param
    if (type(\Prefix\\Param)&32>0)
Value: = \Prefix\\Param
    else
Value: = \Param
    endc
Next: substr ,,"\Bitfield"
i:  = instr("\Next","|")
    while (i>0)
Symbol: substr ,i-1,"\Next"
    if (type(\Prefix\\Symbol)&32>0)
Value: = Value|\Prefix\\Symbol
    else
Value: = Value|\Symbol
    endc
Next: substr i+1,,"\Next"
i:  = instr("\Next","|")
    endw
    if (type(\Prefix\\Next)&32>0)
Value: = Value|\Prefix\\Next
    else
Value: = Value|\Next
    endc
    dc.\0 Value
    endm
    
defineBitfield: macro
    defineBitfieldWithParam.\0 \1,\2,0
    endm
    
defineShorthand: macro Prefix,Shorthand
    if (type(\Prefix\\Shorthand)&32>0)
    dc.\0 \Prefix\\Shorthand
    else
    dc.\0 \Shorthand
    endc
    endm
    
tableEnd: macro
    if strcmp('\0','b')
    dc.b CODE_TERMINATOR_BYTE
    else
    dc.w CODE_TERMINATOR_WORD
    endc
    endm
    
flagSwitchedMap: macro
    dc.w \1
    dc.w \2
    dc.w \3
    endm

flagSwitchedMapsEnd: macro
    dc.w $FFFF
    endm
    
battleMapCoords: macro
    dc.b \1
    dc.b \2
    dc.b \3
    dc.b \4
    dc.b \5
    dc.b \6
    dc.b \7
    endm
    
savePointMapCoords: macro
    dc.b \1
    dc.b \2
    dc.b \3
    dc.b \4
    endm
    
raftResetMapCoords: macro
    dc.b \1
    dc.b \2
    dc.b \3
    dc.b \4
    endm
    
item: macro
    defineShorthand.b ITEM_,\1
    endm
    
classType: macro
    defineShorthand.b CLASSTYPE_,\1
    endm
    
itemBreakMessage: macro
    defineShorthand.b ITEM_,\1
    dc.b \2
    endm
    
; Enemy item drops
    
battle: macro
    defineShorthand.b BATTLE_,\1
    endm
    
enemyEntity: macro
    dc.b \1+128
    endm
    
itemDrop: macro ; alias
    item \1
    endm
    
droppedFlag: macro
    dc.b \1
    endm
    
dropFlag: macro ; alias
    droppedFlag \1
    endm
    
spellElement: macro
    defineShorthand.b SPELLELEMENT_,\1
    endm
    
landEffectAndMoveCost: macro
    defineBitfield.b LANDEFFECTSETTING_,\1
    endm
    
aiCommandset: macro
    dc.b narg
    rept narg
    defineShorthand.b AICOMMAND_,\1
    shift
    endr
    endm
    
battles: macro
    dc.b narg
    rept narg
    battle \1
    shift
    endr
    endm
    
background: macro
    defineShorthand.b BATTLEBACKGROUND_,\1
    endm
	
enemyFacing: macro
    defineShorthand.b LASER_,\1
    endm
    
; Names
    
defineName: macro
    case narg
=3  ; in case with 3 arguments, assume that it's an item name containing a special control code
    dc.b strlen(\1)+strlen(\3)+1
=2  ; in case with 2 arguments, assume that it's Jaro's bugged enemy name ending with a null character
    dc.b strlen(\1)+1
=?  ; otherwise, just a regular name
    dc.b strlen(\1)
    endcase
    rept narg
    dc.b \1
    shift
    endr
    endm

spellName: macro
    defineName \1
    endm
    
allyName: macro
    defineName \1
    endm
    
enemyName: macro
    if (narg=2)
    defineName \1,\2
    else
    defineName \1
    endc
    endm
    
itemName: macro
    if (narg=3)
    defineName \1,\2,\3
    else
    defineName \1
    endc
    endm
    
className: macro
    defineName \1
    endm
    
; Item definitions
    
equipFlags: macro
    defineBitfield.l EQUIPFLAG_,\1
    endm
    
range: macro Min,Max
    dc.b Max,Min
    endm
    
price: macro
    dc.w \1
    endm
    
itemType: macro
    defineBitfield.b ITEMTYPE_,\1
    endm
    
useSpell: macro
    defineBitfield.b SPELL_,\1
    endm
    
equipEffects: macro
    defineShorthand.b EQUIPEFFECT_,\1
    dc.b \2
    defineShorthand.b EQUIPEFFECT_,\3
    dc.b \4
    defineShorthand.b EQUIPEFFECT_,\5
    dc.b \6
    endm
    
; Spell definitions
    
entry: macro
    defineBitfield.b SPELL_,\1
    endm
    
index: macro ; alias
    entry \1
    endm
    
mpCost: macro
    dc.b \1
    endm
    
animation: macro
    defineBitfield.b SPELLANIMATION_,\1
    endm
    
properties: macro
    defineBitfield.b SPELLPROPS_,\1
    endm
    
radius: macro
    dc.b \1
    endm
    
power: macro
    dc.b \1
    endm
    
forClass: macro
    defineShorthand.b CLASS_,\1
    endm
    
allyBattleSprite: macro
    defineShorthand.b ALLYBATTLESPRITE_,\1
    if (narg=2) ; legacy support for old ally battle sprite and palette
    dc.b \2
    endc
    endm
    
allyBattleSprAndPlt: macro
    forClass \1
    allyBattleSprite \2
    dc.b \3
    endm
    
enemyBattleSprite: macro
    defineShorthand.b ENEMYBATTLESPRITE_,\1
    if (narg=2) ; legacy support for old enemy battle sprite and palette
    dc.b \2
    endc
    endm
    
enemyBattleSprAndPlt: macro
    enemyBattleSprite \1
    dc.b \2
    endm
    
weaponSprite: macro
    defineShorthand.b WEAPONSPRITE_,\1
    endm
    
weaponPalette: macro
    defineShorthand.b WEAPONPALETTE_,\1
    endm
    
weaponGraphics: macro
    weaponSprite \1
    weaponPalette \2
    endm
    
shopInventory: macro
    dc.b narg
    rept narg
    item \1
    shift
    endr
    endm
    
shopDef: macro ; alias
    shopInventory \_
    endm
    
promotionSection: macro
    dc.b narg
    rept narg
    defineShorthand.b CLASS_,\1
    shift
    endr
    endm
    
promotionItems: macro
    dc.b narg
    rept narg
    item \1
    shift
    endr
    endm
    
classes: macro
    dc.w narg
    rept narg
    defineShorthand.w CLASS_,\1
    shift
    endr
    endm
    
blacksmithClasses: macro    ; alias
    classes \1
    endm
    
mithrilWeaponClass: macro   ; alias
    classes \1
    endm
    
mithrilWeapons: macro
    dc.b \1
    item \2
    dc.b \3
    item \4
    dc.b \5
    item \6
    dc.b \7
    item \8
    endm
    
specialCaravanDescription: macro
    item \1
    dc.b \2
    defineShorthand.w MESSAGE_CARAVANDESC_,\3
    endm
    
usableOutsideBattleItem: macro  ; alias
    item \1
    endm
    
input: macro
    defineBitfield.b INPUT_,\1
    endm
    
follower: macro
    dc.b \1
    dc.b \2
    dc.b \3
    dc.b \4
    endm
    
mapSprite: macro
    defineShorthand.b MAPSPRITE_,\1
    endm
    
portrait: macro
    defineShorthand.b PORTRAIT_,\1
    endm
    
speechSfx: macro
    defineShorthand.b SFX_,\1
    dc.b 0
    endm
    
speechSound: macro ; alias
    speechSfx \1
    endm
    
; Enemy definitions
    
unknownByte: macro
    dc.b \1
    dcb.b 9,0                ; ...and define placeholder zeros while we're at it
    endm
    
spellPower: macro
    defineShorthand.b SPELLPOWER_,\1
    endm
    
level: macro
    dc.b \1
    endm
    
maxHp: macro
    dc.w \1,0
    endm
    
maxMp: macro
    dc.b \1,0
    endm
    
baseAtt: macro
    dc.b \1,0
    endm
    
baseAtk: macro ; alias
    baseAtt \1
    endm
    
baseDef: macro
    dc.b \1,0
    endm
    
baseAgi: macro
    dc.b \1,0
    endm
    
baseMov: macro
    dc.b \1,0
    endm
    
baseResistance: macro
    defineBitfield.w RESISTANCE_,\1
    dc.w 0
    endm
    
baseProwess: macro
    defineBitfield.b PROWESS_,\1
    dc.b 0
    endm
    
items: macro
    defineBitfield.w ITEM_,\1
    defineBitfield.w ITEM_,\2
    defineBitfield.w ITEM_,\3
    defineBitfield.w ITEM_,\4
    endm
    
spells: macro
    defineBitfield.b SPELL_,\1
    defineBitfield.b SPELL_,\2
    defineBitfield.b SPELL_,\3
    defineBitfield.b SPELL_,\4
    endm
    
initialStatus: macro
    defineBitfield.w STATUSEFFECT_,\1
    dcb.b 3,0
    endm
    
unknownWord: macro
    dcb.b 2,0
    dc.w \1
    dcb.b 2,0
    endm
    
randomBattles: macro ; alias
    battles
    endm
    
upgradeRange: macro
    dc.b \1
    defineShorthand.b ENEMY_,\2
    defineShorthand.b ENEMY_,\3
    endm
    
excludedEnemies: macro
    dc.b narg
    rept narg
    defineShorthand.b ENEMY_,\1
    shift
    endr
    endm
    
; Ally stats
    
defineStatGrowth: macro Start,Proj,Curve
    defineShorthand.b GROWTHCURVE_,\Curve
    dc.b \Start,\Proj
    endm
    
hpGrowth: macro
    defineStatGrowth \1,\2,\3
    endm
    
mpGrowth: macro
    defineStatGrowth \1,\2,\3
    endm
    
attGrowth: macro
    defineStatGrowth \1,\2,\3
    endm
    
atkGrowth: macro ; alias
    attGrowth \1,\2,\3
    endm
    
defGrowth: macro
    defineStatGrowth \1,\2,\3
    endm
    
agiGrowth: macro
    defineStatGrowth \1,\2,\3
    endm
    
spellList: macro
    rept narg/2
    dc.b \1
    defineBitfield.b SPELL_,\2
    shift
    shift
    endr
    dc.b ALLYSTATS_CODE_END_OF_SPELL_LIST
    endm
    
useFirstSpellList: macro
    dc.b ALLYSTATS_CODE_USE_FIRST_SPELL_LIST
    endm
    
; Ally start definitions
    
startClass: macro
    defineShorthand.b CLASS_,\1
    endm
    
startLevel: macro
    dc.b \1
    endm
    
startItems: macro
    defineBitfield.b ITEM_,\1
    defineBitfield.b ITEM_,\2
    defineBitfield.b ITEM_,\3
    defineBitfield.b ITEM_,\4
    endm
    
; Class definitions
    
mov: macro
    dc.b \1
    endm
    
resistance: macro
    defineBitfield.w RESISTANCE_,\1
    endm
    
moveType: macro
    defineBitfield.b MOVETYPE_UPPER_,\1
    endm
    
prowess: macro
    defineBitfield.b PROWESS_,\1
    endm
    
; VDP tiles
    
vdpTile: macro
    if (narg=0)
    dc.w 0
    else
    defineBitfield.w VDPTILE_,\1
    endc
    endm
    
vdpBaseTile: macro
    defineBitfieldWithParam.w VDPTILE_,\1,VDPTILE_PALETTE3|VDPTILE_PRIORITY
    endm
    
; VDP sprites

vdpSprite: macro
    dc.w \1
    defineBitfield.w VDPSPRITESIZE_,\2
    vdpTile \3
    dc.w \4
    endm
    