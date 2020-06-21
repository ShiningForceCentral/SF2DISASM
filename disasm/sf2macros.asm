; ---------------------------------------------------------------------------
; Align and pad
; input: length to align to, value to use as padding (default is $FF)
; ---------------------------------------------------------------------------

    include "sf2cutscenemacros.asm"
    include "sf2mapmacros.asm"
    include "sf2mapsetupmacros.asm"
    include "sf2battlescenemacros.asm"

align: macro
    if (narg=1)
    dcb.b \1-(*%\1),$FF
    else
    dcb.b \1-(*%\1),\2
    endc
    endm
    
wordAlign: macro
    dcb.b *%2,$FF
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
    
itemDrop: macro
    defineShorthand.b ITEM_,\1
    endm
    
dropFlag: macro
    dc.b \1
    endm
    
spellElement: macro
    defineShorthand.b SPELLELEMENT_,\1
    endm
    
landEffectAndMoveCost: macro
    defineBitfield.b LANDEFFECTSETTING_,\1
    endm
    
background: macro
    defineShorthand.b BATTLEBACKGROUND_,\1
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
    
index: macro
    defineBitfield.b SPELL_,\1
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
    
allyBattleSprite: macro
    defineShorthand.b ALLYBATTLESPRITE_,\1
    if (narg=2)
    dc.b \2
    endc
    endm
    
enemyBattleSprite: macro
    defineShorthand.b ENEMYBATTLESPRITE_,\1
    if (narg=2)
    dc.b \2
    endc
    endm
    
weaponSprite: macro
    defineShorthand.b WEAPONSPRITE_,\1
    endm
    
weaponPalette: macro
    defineShorthand.b WEAPONPALETTE_,\1
    endm
    
shopDef: macro
    dc.b narg
    rept narg
    defineShorthand.b ITEM_,\1
    shift
    endr
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
    defineShorthand.b ITEM_,\1
    shift
    endr
    endm
    
mithrilWeaponClass: macro
    dc.w narg
    rept narg
    defineShorthand.w CLASS_,\1
    shift
    endr
    endm
    
mithrilWeapons: macro
    dc.b \1
    defineShorthand.b ITEM_,\2
    dc.b \3
    defineShorthand.b ITEM_,\4
    dc.b \5
    defineShorthand.b ITEM_,\6
    dc.b \7
    defineShorthand.b ITEM_,\8
    endm
    
specialCaravanDescription: macro
    defineShorthand.b ITEM_,\1
    dc.b \2
    defineShorthand.w MESSAGE_CARAVANDESC_,\3
    endm
    
usableOutsideBattleItem: macro
    defineShorthand.b ITEM_,\1
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
    
speechSound: macro
    defineShorthand.b SFX_,\1
    dc.b 0
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
    
baseAtk: macro
    dc.b \1,0
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
    defineBitfield.w STATUSEFFECTS_MASK_,\1
    dcb.b 3,0
    endm
    
unknownWord: macro
    dcb.b 2,0
    dc.w \1
    dcb.b 2,0
    endm
    
randomBattles: macro
    dc.b narg
    rept narg
    defineShorthand.b BATTLE_,\1
    shift
    endr
    endm
    
; Ally stats
    
forClass: macro
    defineShorthand.b CLASS_,\1
    endm
    
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
    
atkGrowth: macro
    defineStatGrowth \1,\2,\3
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
    defineBitfield.b MOVETYPE_,\1
    endm
    
prowess: macro
    defineBitfield.b PROWESS_,\1
    endm
    
; VDP tiles
    
vdpTile: macro vdp_tile
    defineBitfieldWithParam.w VDPTILE_, \vdp_tile, VDPTILE_PALETTE3|VDPTILE_PRIORITY
    endm
    
vdpTilePortraitWindow: macro vdp_tile
    defineBitfieldWithParam.w VDPTILE_PORTRAITWINDOW_, \vdp_tile, VDPTILE_PRIORITY
    endm
    