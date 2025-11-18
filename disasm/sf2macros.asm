; ---------------------------------------------------------------------------
; Align and pad
; input: length to align to, value to use as padding (default is $FF)
; ---------------------------------------------------------------------------

                include "sf2cutscenemacros.asm"
                include "sf2mapmacros.asm"
                include "sf2mapsetupmacros.asm"
                include "sf2battlescenemacros.asm"

align:  macro
            case narg
=0  ; If no arguments given, align to word boundary.
                dcb.b *%2,$FF
=1  ; If given an address argument only, pad with $FF.
                dcb.b \1-(*%\1),$FF
=?  ; If two arguments or more, pad with second argument.
                dcb.b \1-(*%\1),\2
            endcase
        endm


; ---------------------------------------------------------------------------
; Traps
; ---------------------------------------------------------------------------

sndCom:     macro
                trap #SOUND_COMMAND
                dc.w \1
            endm
                
chkFlg:     macro
                trap #CHECK_FLAG
                dc.w \1
            endm
                
setFlg:     macro
                trap #SET_FLAG
                dc.w \1
            endm
                
clrFlg:     macro
                trap #CLEAR_FLAG
                dc.w \1
            endm
                
checkFlg:   macro
                trap #4
                dc.w \1
            endm
                
txt:        macro
                trap #TEXTBOX
                dc.w \1
            endm
                
clsTxt:     macro
                trap #TEXTBOX
                dc.w $FFFF
            endm
                
script:     macro
                lea \1(pc), a0
                trap #MAPSCRIPT
            endm


; ---------------------------------------------------------------------------
; Data definition
; ---------------------------------------------------------------------------
                
defineBitfieldWithParam: macro Prefix,Bitfield,Param
        if (type(\Prefix\\Param)&32>0)
Value:          set \Prefix\\Param
        else
Value:          set \Param
        endif
Next:           substr ,,"\Bitfield"
i:              set instr("\Next","|")
        while (i>0)
Symbol:         substr ,i-1,"\Next"
            if (type(\Prefix\\Symbol)&32>0)
Value:          set Value|\Prefix\\Symbol
            else
Value:          set Value|\Symbol
            endif
Next:           substr i+1,,"\Next"
i:              set instr("\Next","|")
        endw
        if (type(\Prefix\\Next)&32>0)
Value:          set Value|\Prefix\\Next
        else
Value:          set Value|\Next
        endif
                dc.\0 Value
    endm
                
defineBitfield: macro
                defineBitfieldWithParam.\0 \1,\2,0
            endm
                
defineNibbleShiftedShorthand: macro Prefix,Shorthand
            if (type(\Prefix\\Shorthand)&32>0)
                dc.\0 \Prefix\\Shorthand<<NIBBLE_SHIFT_COUNT
            else
                dc.\0 \Shorthand<<NIBBLE_SHIFT_COUNT
            endif
        endm
                
defineShorthand: macro Prefix,Shorthand
            if (type(\Prefix\\Shorthand)&32>0)
                dc.\0 \Prefix\\Shorthand
            else
                dc.\0 \Shorthand
            endif
        endm
                
tableEnd: macro
            if strcmp('\0','b')
                dc.b TERMINATOR_BYTE
            else
                dc.w TERMINATOR_WORD
            endif
        endm
                
flagSwitchedMap: macro
                dc.w \1 ; original map
                dc.w \2 ; flag
                dc.w \3 ; replacement map
            endm

flagSwitchedMapsEnd: macro
                dc.w $FFFF
            endm
                
battleMapCoordinates: macro
                dc.b \1 ; map
                dc.b \2 ; area start X
                dc.b \3 ; area start Y
                dc.b \4 ; area width
                dc.b \5 ; area height
                dc.b \6 ; trigger X (255 = any)
                dc.b \7 ; trigger Y (255 = any)
            endm
                
savePointMapCoordinates: macro
                dc.b \1 ; map
                dc.b \2 ; X
                dc.b \3 ; Y
                dc.b \4 ; facing
            endm
                
raftResetMapCoordinates: macro
                dc.b \1 ; egress map
                dc.b \2 ; raft map
                dc.b \3 ; raft X
                dc.b \4 ; raft Y
            endm
                
item:       macro
                defineShorthand.b ITEM_,\1
            endm
                
classType:  macro
                defineShorthand.b CLASSTYPE_,\1
            endm
                
itemBreakMessage: macro
                defineShorthand.b ITEM_,\1
                defineShorthand.b ITEMBREAK_\2
            endm
                
; Enemy item drops
                
battle: macro
            if strcmp('\0','w')
                defineShorthand.w BATTLE_,\1
            else
                defineShorthand.b BATTLE_,\1
            endif
        endm
                
enemyEntity: macro
                dc.b \1+128
            endm
                
droppedFlag: macro
                dc.b \1
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
                defineShorthand.b AI_COMMAND_,\1
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
                
position:   macro
                dc.b \1 ; 
                dc.b \2 ; 
            endm
                
facing:     macro
                dc.b \1
            endm
                
; Battle spriteset definitions
                
allyCombatant: macro
                dc.b \1 ; entity index
                dc.b \2 ; X
                dc.b \3 ; Y
            endm
                
enemyCombatant: macro
                defineShorthand.b ENEMY_,\1 ; enemy index
                dc.b \2 ; X
                dc.b \3 ; Y
            endm
                
combatantAiAndItem: macro
                defineShorthand.b AICOMMANDSET_,\1
                defineBitfield.w ITEM_,\2
            endm
                
combatantBehavior: macro
                defineBitfield.b AIORDER_,\1 ; primary order
                dc.b \2 ; region to activate primary order
                defineBitfield.b AIORDER_,\3 ; secondary order
                dc.b \4 ; region to activate secondary order
                dc.b \5 ; filler byte
                defineBitfield.b SPAWN_,\6 ; initialization type
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
                
allyName:   macro
                defineName \1
            endm
                
enemyName: macro
            if (narg=2)
                defineName \1,\2
            else
                defineName \1
            endif
        endm
                
itemName: macro
            if (narg=3)
                defineName \1,\2,\3
            else
                defineName \1
            endif
        endm
                
className:  macro
                defineName \1
            endm
                
; Item definitions
                
equipFlags: macro
                defineBitfield.l EQUIPFLAG_,\1
            endm
                
range:      macro Min,Max
                dc.b Max,Min
            endm
                
price:      macro
                dc.w \1
            endm
                
itemType:   macro
                defineBitfield.b ITEMTYPE_,\1
            endm
                
useSpell:   macro
                defineBitfield.b SPELL_,\1
            endm
                
equipEffects: macro
                defineShorthand.b EQUIPEFFECT_,\1
                dc.b \2 ; parameter for effect 1
                defineShorthand.b EQUIPEFFECT_,\3
                dc.b \4 ; parameter for effect 2
                defineShorthand.b EQUIPEFFECT_,\5 ; unused effect
                dc.b \6 ; parameter for effect 3
            endm
                
; Spell definitions
                
entry:      macro
                defineBitfield.b SPELL_,\1
            endm
                
mpCost:     macro
                dc.b \1
            endm
                
animation:  macro
                defineBitfield.b SPELLANIMATION_,\1
            endm
                
properties: macro
                defineBitfield.b SPELLPROPS_,\1
            endm
                
radius:     macro
                dc.b \1
            endm
                
power:      macro
                dc.b \1
            endm
                
forClass:   macro
                defineShorthand.b CLASS_,\1
            endm
                
allyBattleSprite: macro
                defineShorthand.b ALLYBATTLESPRITE_,\1
            endm
                
allyBattleSprAndPlt: macro
                forClass \1
                allyBattleSprite \2
                dc.b \3
            endm
                
enemyBattleSprite: macro
                defineShorthand.b ENEMYBATTLESPRITE_,\1
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
                
mithrilWeapons: macro
                dc.b \1 ; 1/x chance
                item \2
                dc.b \3 ; 1/x chance
                item \4
                dc.b \5 ; 1/x chance
                item \6
                dc.b \7 ; 1/x chance
                item \8
            endm
                
specialCaravanDescription: macro
                item \1
                dc.b \2 ; # of text lines
                defineShorthand.w MESSAGE_CARAVANDESC_,\3 ; starting text line
            endm
                
input:      macro
                defineBitfield.b INPUT_,\1
            endm
                
follower:   macro
                dc.b \1 ; flag
                dc.b \2 ; entity
                dc.b \3 ; mapsprite
                dc.b \4 ; 
            endm
                
mapsprite:  macro
                defineShorthand.b MAPSPRITE_,\1
            endm
                
portrait:   macro
                defineShorthand.b PORTRAIT_,\1
            endm
                
speechSfx:  macro
                defineShorthand.b SFX_,\1
                dc.b 0
            endm
            

; Enemy definitions
                
unknownByte: macro
                dc.b \1 ; 
                dcb.b 9,0                                                                ; ...and define placeholder zeros while we're at it
            endm
                
spellPower: macro
                defineShorthand.b SPELLPOWER_,\1
            endm
                
level:      macro
                dc.b \1
            endm
                
maxHp:      macro
                dc.w \1,0
            endm
                
maxMp:      macro
                dc.b \1,0
            endm
                
baseAtt:    macro
                dc.b \1,0
            endm
                
baseDef:    macro
                dc.b \1,0
            endm
                
baseAgi:    macro
                dc.b \1,0
            endm
                
baseMov:    macro
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
                
items:      macro
                defineBitfield.w ITEM_,\1
                defineBitfield.w ITEM_,\2
                defineBitfield.w ITEM_,\3
                defineBitfield.w ITEM_,\4
            endm
                
spells:     macro
                defineBitfield.b SPELL_,\1
                defineBitfield.b SPELL_,\2
                defineBitfield.b SPELL_,\3
                defineBitfield.b SPELL_,\4
            endm
                
initialStatus: macro
                defineBitfield.w STATUSEFFECT_,\1
                dcb.b 3,0
            endm
                
aiBitfield: macro
                dcb.b 2,0
                defineBitfield.w AIBITFIELD_,\1 ; activation bitfield?
                dcb.b 2,0
            endm
                
upgradeRange: macro
                dc.b \1 ; upgrade factor/step
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
                
hpGrowth:   macro
                defineStatGrowth \1,\2,\3
            endm
                
mpGrowth:   macro
                defineStatGrowth \1,\2,\3
            endm
                
attGrowth:  macro
                defineStatGrowth \1,\2,\3
            endm
                
defGrowth:  macro
                defineStatGrowth \1,\2,\3
            endm
                
agiGrowth:  macro
                defineStatGrowth \1,\2,\3
            endm
                
spellList: macro
            rept narg/2 ; # of spells
                dc.b \1 ; spell learn level
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
                
mov:        macro
                dc.b \1
            endm
                
resistance: macro
                defineBitfield.w RESISTANCE_,\1
            endm
                
movetype:   macro
                defineNibbleShiftedShorthand.b MOVETYPE_,\1
            endm
                
prowess:    macro
                defineBitfield.b PROWESS_,\1
            endm
                
; VDP tiles
                
vdpTile: macro
            if (narg=0)
                dc.w 0
            else
                defineBitfield.w VDPTILE_,\1
            endif
        endm
                
vdpBaseTile: macro
                defineBitfieldWithParam.w VDPTILE_,\1,VDPTILE_PALETTE3|VDPTILE_PRIORITY
            endm
                
; VDP sprites

vdpSprite:  macro
                dc.w \1 ; Y
                defineBitfield.w VDPSPRITESIZE_,\2
                vdpTile \3
                dc.w \4 ; X
            endm

vdpSpell:  macro
                dc.w \1 ; X
                dc.w \2 ; Y
                vdpTile \3 ; starting tile
                defineBitfield.w VDPSPELLPROP_,\4
            endm
                