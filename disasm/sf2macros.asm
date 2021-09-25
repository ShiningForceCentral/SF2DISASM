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
	
declareSystemId: macro
    if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    dc.b 'SEGA SSF        '
    else
    dc.b 'SEGA GENESIS    '
    endc
    endm
    
declareRomEnd:	macro
	if (EXPANDED_ROM=1)
    dc.l $3FFFFF
    else
	dc.l $1FFFFF
	endc
	endm	

enableSram:	macro
	if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    if (*<$8000)
    bsr.w   EnableMapperSram
    else
    jsr     (EnableMapperSram).w
    endc
    elseif (EXPANDED_ROM=1)
	move.b  #3,(SEGA_MAPPER_CTRL0).l
	endc
	endm
	
disableSram:	macro
	if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    if (*<$8000)
    bsr.w   DisableMapperSram
    else
    jsr     (DisableMapperSram).w
    endc
    elseif (EXPANDED_ROM=1)
	move.b  #0,(SEGA_MAPPER_CTRL0).l
	endc
	endm

getCurrentSaveSlot: macro
    if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    move.b  ((CURRENT_SAVE_SLOT-$1000000)).w,d0
    else
    move.w  ((CURRENT_SAVE_SLOT-$1000000)).w,d0
    endc
    endm
    
setCurrentSaveSlot: macro
    if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    move.b  d0,((CURRENT_SAVE_SLOT-$1000000)).w
    else
    move.w  d0,((CURRENT_SAVE_SLOT-$1000000)).w
    endc
    endm
    
getEnemyBattlespritePointer: macro
    movea.l (p_pt_EnemyBattleSprites).l,a0
    if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    move.b  #8,(ROM_BANK6).l
    move.b  #9,(ROM_BANK7).l
    endc
    endm
    
getAllyBattlespritePointer: macro
    movea.l (p_pt_AllyBattleSprites).l,a0
    if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    move.b  #10,(ROM_BANK6).l
    move.b  #11,(ROM_BANK7).l
    endc
    endm
    
restoreRomBanks: macro
    if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    move.b  #6,(ROM_BANK6).l
    move.b  #7,(ROM_BANK7).l
    endc
    endm
    
dmaBattlespriteFrame: macro
    if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    jsr     (ApplyImmediateVramDmaOnCompressedTiles).w
    move.b  #6,(ROM_BANK6).l
    move.b  #7,(ROM_BANK7).l
    rts
    else
    jmp     (ApplyImmediateVramDmaOnCompressedTiles).w
    endc
    endm
    
waitForBattlespriteDma: macro
    if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    jsr     (WaitForDmaQueueProcessing).w
    move.b  #6,(ROM_BANK6).l
    move.b  #7,(ROM_BANK7).l
    rts
    else
    jmp     (WaitForDmaQueueProcessing).w
    endc
    endm
    
loadBattlesprite: macro
    if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    jsr     (LoadCompressedData).w
    move.b  #6,(ROM_BANK6).l
    move.b  #7,(ROM_BANK7).l
    rts
    else
    jmp     (LoadCompressedData).w
    endc
    endm


conditionalRomExpand:	macro
	if (EXPANDED_ROM&EXTENDED_SSF_MAPPER=1)
    include "layout\sf2-expanded-19-0x200000-0x600000.asm"
    elseif (EXPANDED_ROM=1)
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
	
wordAlignIfExpandedRom:	macro
	if (EXPANDED_ROM=1)
	wordAlign
	endc
	endm
	
bsrIfVanillaRom:	macro
	if (EXPANDED_ROM=0)
	bsr.\0 \1
	endc
	endm
	
equIfVanillaRom:	macro
	if (EXPANDED_ROM=0)
\1: equ \2
    endc
    endm
    
equIfExpandedRom: macro
    if (EXPANDED_ROM=1)
\1: equ \2
    endc
    endm
    
includeIfVanillaRom: macro
    if (EXPANDED_ROM=0)
    include \1
    endc
    endm
    
incbinIfVanillaRom: macro
    if (EXPANDED_ROM=0)
    incbin \1
    endc
    endm
    
includeIfExpandedRom: macro
    if (EXPANDED_ROM=1)
    include \1
    endc
    endm
    
incbinIfExpandedRom: macro
    if (EXPANDED_ROM=1)
    incbin \1
    endc
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
    
testEquippedBit: macro
    if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
    btst    #ITEMENTRY_UPPERBIT_EQUIPPED,\1
    else
    btst    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT\1
    endc
    endm
    
setEquippedBit: macro
    if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
    bset    #ITEMENTRY_UPPERBIT_EQUIPPED,\1
    else
    bset    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT\1
    endc
    endm
    
clearEquippedBit: macro
    if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
    bclr    #ITEMENTRY_UPPERBIT_EQUIPPED,\1
    else
    bclr    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT\1
    endc
    endm
    
readStartingItemEntry: macro
    if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
    move.w  (a0)+,d3
    else
    move.b  (a0)+,d3
    endc
    endm
    
addJewelIconOffset: macro
    if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
    adda.l  d1,a0
    else
    adda.w  d1,a0
    endc
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
    
itemIndex: macro
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
    itemIndex \1
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
    if (narg=3)
    defineName \1,\2,\3
    else
    defineName \1
    endc
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
    if (narg=3)
    defineName \1,\2,\3
    else
    defineName \1
    endc
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
    itemIndex \1
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
    itemIndex \1
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
    itemIndex \2
    dc.b \3
    itemIndex \4
    dc.b \5
    itemIndex \6
    dc.b \7
    itemIndex \8
    endm
    
specialCaravanDescription: macro
    itemIndex \1
    dc.b \2
    defineShorthand.w MESSAGE_CARAVANDESC_,\3
    endm
    
usableOutsideBattleItem: macro  ; alias
    itemIndex \1
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
    
randomBattles: macro
    dc.b narg
    rept narg
    defineShorthand.b BATTLE_,\1
    shift
    endr
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
    if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
    defineBitfield.w ITEM_,\1
    defineBitfield.w ITEM_,\2
    defineBitfield.w ITEM_,\3
    defineBitfield.w ITEM_,\4
    else
    defineBitfield.b ITEM_,\1
    defineBitfield.b ITEM_,\2
    defineBitfield.b ITEM_,\3
    defineBitfield.b ITEM_,\4
    endc
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
    defineBitfield.w VDPTILE_,\1
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
