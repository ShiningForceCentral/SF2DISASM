
                include "sf2cutscenemacros.asm"
                include "sf2mapmacros.asm"
                include "sf2mapsetupmacros.asm"
                include "sf2battlescenemacros.asm"


; ---------------------------------------------------------------------------
; Align and pad
; input: length to align to, value to use as padding (default is $FF)
; ---------------------------------------------------------------------------

align:  macro
            case narg
=0              ; If no arguments given, align to word boundary.
                dcb.b *%2,$FF
=1              ; If given an address argument only, pad with default $FF value.
                dcb.b \1-(*%\1),$FF
=?              ; If two arguments or more, pad with second argument value.
                dcb.b \1-(*%\1),\2
            endcase
        endm

alignIfStandard: macro
        if (STANDARD_BUILD=1)
            case narg
=0
                align
=1
                align \1
=?
                align \1, \2
            endcase
        endif
    endm

alignIfOptimizedLayout: macro ;alias
                alignIfStandard \1, \2
                inform 0,"INFO: 'alignIfOptimizedLayout' macro is obsolete. Please use 'alignIfStandard' instead."
            endm

alignIfVanilla: macro
        if (VANILLA_BUILD=1)
            case narg
=0
                align
=1
                align \1
=?
                align \1, \2
            endcase
        endif
    endm

alignIfVanillaLayout: macro ;alias
                alignIfVanilla \1, \2
                inform 0,"INFO: 'alignIfVanillaLayout' macro is obsolete. Please use 'alignIfVanilla' instead."
            endm

conditionalAlign: macro
        if (EXPANDED_ROM=1)
            if (MEMORY_MAPPER=1)
                alignIfStandard \1
            else
                alignIfStandard \2
            endif
        endif
                alignIfStandard
    endm

objIfMemoryMapper: macro
            if (EXPANDED_ROM&MEMORY_MAPPER=1)
                obj \1
            endif
        endm

objendIfMemoryMapper: macro
            if (EXPANDED_ROM&MEMORY_MAPPER=1)
                objend
            endif
        endm
    

; ---------------------------------------------------------------------------
; Conditional INCLUDE and INCBIN
; ---------------------------------------------------------------------------

incbinIfStandard: macro
            if (STANDARD_BUILD=1)
                incbin \1
            endif
        endm

incbinIfExpandedRom: macro ;alias
                incbinIfStandard \1
                inform 0,"INFO: 'incbinIfExpandedRom' macro is obsolete. Please use 'incbinIfStandard' instead."
            endm

incbinIfVanilla: macro
            if (VANILLA_BUILD=1)
                incbin \1
            endif
        endm

incbinIfVanillaRom: macro ;alias
                incbinIfVanilla \1
                inform 0,"INFO: 'incbinIfVanillaRom' macro is obsolete. Please use 'incbinIfVanilla' instead."
            endm

includeIfStandard: macro
            if (STANDARD_BUILD=1)
                include \1
            endif
        endm

includeIfExpandedRom: macro ;alias
                includeIfStandard \1
                inform 0,"INFO: 'includeIfExpandedRom' macro is obsolete. Please use 'includeIfStandard' instead."
            endm

includeIfOptimizedLayout: macro ;alias
                includeIfStandard \1
                inform 0,"INFO: 'includeIfOptimizedLayout' macro is obsolete. Please use 'includeIfStandard' instead."
            endm

includeIfVanilla: macro
            if (VANILLA_BUILD=1)
                include \1
            endif
        endm

includeIfVanillaLayout: macro ;alias
                includeIfVanilla \1
                inform 0,"INFO: 'includeIfVanillaLayout' macro is obsolete. Please use 'includeIfVanilla' instead."
            endm

includeIfVanillaRom: macro ;alias
                includeIfVanilla \1
                inform 0,"INFO: 'includeIfVanillaRom' macro is obsolete. Please use 'includeIfVanilla' instead."
            endm


; ---------------------------------------------------------------------------
; ROM Header
; ---------------------------------------------------------------------------
    
declareSystemId: macro
            if (STANDARD_BUILD&MEMORY_MAPPER&SSF_SYSTEM_ID=1)
                dc.b 'SEGA SSF        '
            else
                dc.b 'SEGA GENESIS    '
            endif
        endm
    
declareChecksum: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                dc.w 0
            else
                dc.w $8921
            endif
        endm
    
declareRomEnd: macro
            if (EXPANDED_ROM=1)
                dc.l $3FFFFF
            else
                dc.l $1FFFFF
            endif
        endm
    
declareSramEnd: macro
            if (EXPANDED_SRAM=1)
                dc.l $20FFFF
            else
                dc.l $203FFF
            endif
        endm
    
declareRegionSupport: macro
            if (STANDARD_BUILD=1)
                dc.b 'JUE             '
            else
                dc.b 'U               '
            endif
        endm


; ---------------------------------------------------------------------------
; Expanded ROM
; ---------------------------------------------------------------------------
    
getCurrentSaveSlot: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                move.b  ((CURRENT_SAVE_SLOT-$1000000)).w,\1
            else
                move.w  ((CURRENT_SAVE_SLOT-$1000000)).w,\1
            endif
        endm
    
setCurrentSaveSlot: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                move.b  \1,((CURRENT_SAVE_SLOT-$1000000)).w
            else
                move.w  \1,((CURRENT_SAVE_SLOT-$1000000)).w
            endif
        endm
    
enableSram: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                jsr     (ControlMapper_EnableSram).w
            elseif (EXPANDED_ROM=1)
                move.b  #1,(SEGA_MAPPER_CTRL0).l
            endif
        endm
    
enableSramAndReturn: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                jmp     (ControlMapper_EnableSram).w
            elseif (EXPANDED_ROM=1)
                move.b  #1,(SEGA_MAPPER_CTRL0).l
                rts
            else
                rts
            endif
        endm
    
disableSram: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                jsr     (ControlMapper_DisableSram).w
            elseif (EXPANDED_ROM=1)
                move.b  #0,(SEGA_MAPPER_CTRL0).l
            endif
        endm
    
disableSramAndSwitchRomBanks: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                jsr     (ControlMapper_DisableSramAndSwitchRomBanks).w
            elseif (EXPANDED_ROM=1)
                move.b  #0,(SEGA_MAPPER_CTRL0).l
            endif
        endm
    
switchRomBanks: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                jsr     (ControlMapper_SwitchRomBanks).w
            endif
        endm
    
restoreRomBanks: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                jsr     (ControlMapper_RestoreRomBanks).w
            endif
        endm
    
restoreRomBanksAndEnableSram: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                jsr     (ControlMapper_RestoreRomBanksAndEnableSram).w
            elseif (EXPANDED_ROM=1)
                move.b  #1,(SEGA_MAPPER_CTRL0).l
            endif
        endm
    
processDmaAndRestoreMemoryMap: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                pea     (\3).w
                pea     (\2).w
                jmp     (\1).w
            elseif (EXPANDED_ROM=1)
                jsr     (\1).w
                jsr     (\2).w
                move.b  #1,(SEGA_MAPPER_CTRL0).l
                rts
            else
                jsr     (\1).w
                jmp     (\2).w
            endif
        endm
    
processDmaAndEnableSram: macro
                processDmaAndRestoreMemoryMap \1, WaitForDmaQueueProcessing, ControlMapper_EnableSram
            endm
    
processDmaRestoreRomBanksAndEnableSram: macro
                processDmaAndRestoreMemoryMap \1, WaitForDmaQueueProcessing, ControlMapper_RestoreRomBanksAndEnableSram
            endm
    
loadCompressedDataRestoreRomBanksAndEnableSram: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                pea     (ControlMapper_RestoreRomBanksAndEnableSram).w
                jmp     (LoadStackCompressedData).w
            elseif (EXPANDED_ROM=1)
                jsr     (LoadStackCompressedData).w
                move.b  #1,(SEGA_MAPPER_CTRL0).l
                rts
            else
                jmp     (LoadStackCompressedData).w
            endif
        endm
    
conditionalMapperInit: macro
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                bsr.w   InitializeMapper
            endif
        endm
    
conditionalRomExpand: macro
            if (EXPANDED_ROM=1)
                include "layout\sf2-expanded-19.asm"
            endif
        endm
    
conditionalPc: macro
            if (EXPANDED_ROM=1)
                \1 \2,\3
            else
                \1 \2(pc),\3
                \4
            endif
                inform 0,"INFO: 'conditionalPc' macro is obsolete."
        endm
    
conditionalWordAddr: macro
            if (EXPANDED_ROM=1)
                \1 (\2).l,\3
            else
                \1 (\2).w,\3
            endif
                inform 0,"INFO: 'conditionalWordAddr' macro is obsolete."
        endm
    
getPointer: macro
            if (STANDARD_BUILD=1)
                movea.l (\1).w,\2
            else
                movea.l (\1).l,\2
            endif
        endm
        
loadPointer: macro
            if (STANDARD_BUILD=1)
                move.l  (\1).w,\2
            else
                move.l  (\1).l,\2
            endif
        endm
        
conditionalLongAddr: macro
            if (STANDARD_BUILD=1)
                \1 (\2).w,\3
            else
                \1 (\2).l,\3
            endif
                inform 0,"INFO: 'conditionalLongAddr' macro is obsolete. Please use 'getPointer' and remove the 'movea.l' parameter."
        endm


; ---------------------------------------------------------------------------
; Relocated saved data to SRAM
; ---------------------------------------------------------------------------
    
savedDataOperand: macro address
operand:        equs '((\address-$1000000)).w'
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
operand:        equs '(\address).l'
            endif
        endm
    
loadSavedDataAddress: macro address, pointer
                savedDataOperand \address
                lea     \operand, \pointer
            endm
    
testSavedByte: macro address
                savedDataOperand \address
                tst.b   \operand
            endm
    
compareToSavedByte: macro immediate, address
                savedDataOperand \address
                cmpi.b  \immediate,\operand
            endm
    
compareSavedByteTo: macro address, data
                savedDataOperand \address
                cmp.b   \operand,\data
            endm
    
clearSavedByte: macro address
                savedDataOperand \address
                clr.b   \operand
            endm
    
clearSavedByteWithPostIncrement: macro pointer
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                clr.b   (\pointer)
                addq.w  #2,\pointer
            else
                clr.b   (\pointer)+
            endif
        endm
    
copySavedByte: macro address1, address2
                savedDataOperand \address1
operand1:       equs '\operand'
                savedDataOperand \address2
operand2:       equs '\operand'
                
                move.b  \operand1,\operand2
            endm
    
getSavedByte: macro address, data
                savedDataOperand \address
                move.b  \operand,\data
        endm
    
getSavedByteWithPostIncrement: macro pointer, data
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.b  (\pointer),\data
                addq.w  #2,\pointer
            else
                move.b  (\pointer)+,\data
            endif
        endm
    
getSavedByteWithPreDecrement: macro pointer, data
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                subq.w  #2,\pointer
                move.b  (\pointer),\data
            else
                move.b  -(\pointer),\data
            endif
        endm
    
getSavedWord: macro pointer, data, offset
        if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            if (narg>=3)
                movep.w \offset\(\pointer),\data
            else
                movep.w 0(\pointer),\data
            endif
        else
                move.w  \offset\(\pointer),\data
        endif
    endm
    
getSavedWordWithPostIncrement: macro pointer, data, offset
            if (narg>=3)
                getSavedWord \pointer, \data, \offset
            else
                getSavedWord \pointer, \data
            endif
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                addq.w  #4,\pointer
            else
                addq.w  #2,\pointer
            endif
        endm
    
getSavedLong: macro pointer, data, offset
        if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            if (narg>=3)
                movep.l \offset\(\pointer),\data
            else
                movep.l 0(\pointer),\data
            endif
        else
                move.l  \offset\(\pointer),\data
        endif
    endm
    
setSavedByte: macro data, address
                savedDataOperand \address
                move.b  \data,\operand
            endm
    
setSavedByteWithPostIncrement: macro data, pointer
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.b  \data,(\pointer)
                addq.w  #2,\pointer
            else
                move.b  \data,(\pointer)+
            endif
        endm
    
setSavedByteWithPreDecrement: macro data, pointer
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                subq.w  #2,\pointer
                move.b  \data,(\pointer)
            else
                move.b  \data,-(\pointer)
            endif
        endm
    
setSavedWord: macro data, pointer, offset
        if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            if (narg>=3)
                movep.w \data,\offset\(\pointer)
            else
                movep.w \data,0(\pointer)
            endif
        else
                move.w  \data,\offset\(\pointer)
        endif
    endm
    
setSavedWordWithPostIncrement: macro data, pointer
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                setSavedWord \data, \pointer
                addq.w  #4,\pointer
            else
                move.w  \data,(\pointer)+
            endif
        endm
    
setSavedLong: macro data, pointer, offset
        if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            if (narg>=3)
                movep.l \data,\offset\(\pointer)
            else
                movep.l \data,0(\pointer)
            endif
        else
                move.l  \data,\offset\(\pointer)
        endif
    endm
    
setSavedLongWithPostIncrement: macro data, pointer
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                setSavedLong \data, \pointer
                addq.w  #8,\pointer
            else
                move.l  \data,(\pointer)+
            endif
        endm
    
addFromSavedByte: macro address, data
                savedDataOperand \address
                add.b  \operand,\data
            endm
    
addFromSavedByteWithPostIncrement: macro pointer, data
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.b   (\pointer),\data
                addq.w  #2,\pointer
            else
                add.b   (\pointer)+,\data
            endif
        endm
    
addToSavedBytePointer: macro data, pointer
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   \data,\data
            endif
                adda.w  \data,\pointer
        endm
    
addQuickToSavedByte: macro immediate, address
                savedDataOperand \address
                addq.b  \immediate,\operand
            endm
    
addQuickToSavedWord: macro immediate, address
                savedDataOperand \address
                addq.w  \immediate,\operand
            endm
    
subtractSavedByte: macro address, data
                savedDataOperand \address
                sub.b   \operand,\data
            endm
    

; Items
;
manipulateEquippedBit: macro instruction, pointer
equippedBit:    equs "#ITEMENTRY_BIT_EQUIPPED"
entryoffset:    equs "ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT"
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
equippedBit:    equs "#ITEMENTRY_UPPERBIT_EQUIPPED"
entryoffset:    equs "0"
            endif
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                \instruction \equippedBit,COMBATANT_OFFSET_ITEMS+\entryoffset\(\pointer)
            else
                \instruction \equippedBit,\entryoffset\(\pointer)
            endif
        endm
    
isItemEquipped: macro pointer
                manipulateEquippedBit btst,\pointer
            endm
    
equipItem: macro pointer
                manipulateEquippedBit bset,\pointer
            endm
    
unequipItem: macro pointer
                manipulateEquippedBit bclr,\pointer
            endm
    
breakItem: macro pointer
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                bset    #ITEMENTRY_UPPERBIT_BROKEN,COMBATANT_OFFSET_ITEMS(\pointer)
            else
                bset    #ITEMENTRY_UPPERBIT_BROKEN,(\pointer)
            endif
        endm
    
repairItem: macro pointer
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                bclr    #ITEMENTRY_UPPERBIT_BROKEN,COMBATANT_OFFSET_ITEMS(\pointer)
            else
                bclr    #ITEMENTRY_UPPERBIT_BROKEN,(\pointer)
            endif
        endm
    

; Battle turn order
;
appendBattleTurnEntry: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.b  \1,(\3)
                move.b  \2,2(\3)
                addq.w  #TURN_ORDER_ENTRY_SIZE,\3
            else
                move.b  \1,(\3)+
                move.b  \2,(\3)+
            endif
        endm
    
getBattleTurnActor: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                loadSavedDataAddress BATTLE_TURN_ORDER, a0
                getSavedWord a0, \1, CURRENT_BATTLE_TURN-BATTLE_TURN_ORDER
                adda.w  \1,a0
                clr.w   \1
                move.b  (a0),\1
            else
                clr.w   \1
                getSavedByte CURRENT_BATTLE_TURN, \1
                loadSavedDataAddress BATTLE_TURN_ORDER, a0
                move.b  (a0,\1.w),\1
            endif
        endm
    

; Mithril
;
loadMithrilWeaponOrder: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w 0(\2),d0
                tst.w   d0
                bne.s   @Next
                movep.w \1,0(\2)
                bra.s   @Done
@Next:          addq.w  #4,a0
            else
                cmpi.w  #0,(\2)
                bne.w   @Next           ; check next weapon slot if current one is occupied
                move.w  \1,(\2)
                bra.w   @Done           ; move item index to current weapon slot in RAM, and we're done
@Next:          move.w  #2,d0
                adda.w  d0,a0
            endif
        endm
    
getMithrilWeaponOrder: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w 0(\1),d0
                addq.w  #4,\1
                move.w  d0,\2
            else
                move.w  (\1)+,\2
                cmpi.w  #0,\2
            endif
        endm
    
clearMithrilWeaponOrder: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   \1,\1
                add.w   \1,\1
                adda.w  \1,\2
                clr.w   d0
                movep.w d0,0(\2)
            else
                lsl.w   #1,\1
                adda.w  \1,\2
                move.w  (\2),d2
                move.w  #0,(\2)
            endif
        endm


; ---------------------------------------------------------------------------
; Items and spells expansion
; ---------------------------------------------------------------------------
    
getStartingItem: macro
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                move.w  \1,\2
            else
                move.b  \1,\2
            endif
        endm
    
getSpellDefsCounter: macro
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                move.w  #SPELLDEFS_COUNTER,\1
            else
                moveq   #SPELLDEFS_COUNTER,\1
            endif
        endm
    
addIconOffset: macro
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                adda.l  \1,\2
            else
                adda.w  \1,\2
            endif
        endm
    
    
; ---------------------------------------------------------------------------
; Traps
; ---------------------------------------------------------------------------

sndCom:     macro
                trap #SOUND_COMMAND
                dc.w \1
            endm

deactivateMusicResuming: macro
            if (STANDARD_BUILD=1)
                sndCom SOUND_COMMAND_DEACTIVATE_RESUMING
            endif
        endm

activateMusicResuming: macro
            if (STANDARD_BUILD=1)
                sndCom SOUND_COMMAND_ACTIVATE_RESUMING
            endif
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
                alignIfStandard
            else
                dc.w TERMINATOR_WORD
            endif
        endm
                
flagSwitchedMap: macro
                dc.w \1
                dc.w \2
                dc.w \3
            endm

flagSwitchedMapsEnd: macro
                dc.w $FFFF
            endm
                
battleMapCoordinates: macro
                dc.b \1
                dc.b \2
                dc.b \3
                dc.b \4
                dc.b \5
                dc.b \6
                dc.b \7
            endm
                
savePointMapCoordinates: macro
                dc.b \1
                dc.b \2
                dc.b \3
                dc.b \4
            endm
                
raftResetMapCoordinates: macro
                dc.b \1
                dc.b \2
                dc.b \3
                dc.b \4
            endm
                
item:       macro
                defineShorthand.b ITEM_,\1
            endm
                
classType:  macro
                defineShorthand.b CLASSTYPE_,\1
            endm
                
itemBreakMessage: macro
                defineShorthand.b ITEM_,\1
                dc.b \2
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
    
position: macro
                dc.b \1
                dc.b \2
            endm
    
facing: macro
            if (STANDARD_BUILD=1)
                ; make sure that neutral battle entities mapsprite index is word-aligned
                dc.w \1 ; EXPANDED_MAPSPRITES
            else
                dc.b \1
            endif
        endm
    
; Battle spriteset definitions
                
allyCombatant: macro
                dc.b \1
                dc.b \2
                dc.b \3
            endm
                
enemyCombatant: macro
                defineShorthand.b ENEMY_,\1
                dc.b \2
                dc.b \3
            endm
                
combatantAiAndItem: macro
                defineShorthand.b AICOMMANDSET_,\1
                defineBitfield.w ITEM_,\2
            endm
                
combatantBehavior: macro
                defineBitfield.b AIORDER_,\1
                dc.b \2
                defineBitfield.b AIORDER_,\3
                dc.b \4
                dc.b \5
                defineBitfield.b SPAWN_,\6
            endm
                
; Names
                
defineName: macro
            case narg
=3              ; In case with 3 arguments, assume that it's an item name containing a special control code.
                dc.b strlen(\1)+strlen(\3)+1
=2              ; In case with 2 arguments, assume that it's Jaro's bugged enemy name ending with a null character.
                dc.b strlen(\1)+1
=?              ; Otherwise, just a regular name.
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
            endif
        endm
    
allyName: macro
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
    
className: macro
            if (narg=3)
                defineName \1,\2,\3
            else
                defineName \1
            endif
        endm


; Item definitions
                
equipFlags: macro
                defineBitfield.l EQUIPFLAG_,\1
            endm
    
equipFlags2: macro
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                defineBitfield.l EQUIPFLAG2_,\1
            endif
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
            if (STANDARD_BUILD=1)
                ; Increase effects number from 3 to 6, and expand parameter size from byte to word
                defineShorthand.b EQUIPEFFECT_,\1
                defineShorthand.b EQUIPEFFECT_,\3
                defineShorthand.b EQUIPEFFECT_,\5
                defineShorthand.b EQUIPEFFECT_,\7
                defineShorthand.b EQUIPEFFECT_,\9
                defineShorthand.b EQUIPEFFECT_,\11
                dc.w \2
                dc.w \4
                dc.w \6
                dc.w \8
                dc.w \10
                dc.w \12
            else
                defineShorthand.b EQUIPEFFECT_,\1
                dc.b \2
                defineShorthand.b EQUIPEFFECT_,\3
                dc.b \4
                defineShorthand.b EQUIPEFFECT_,\5
                dc.b \6
            endif
        endm


; Spell definitions
                
entry:      macro
                defineBitfield.b SPELL_,\1
            endm
                
index:      macro ;alias
                entry \1
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
            if (narg=2) ; legacy support for old ally battle sprite and palette
                dc.b \2
            endif
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
            endif
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
            if (narg=3)
                ; Declare item index when EXPANDED_ITEMS_AND_SPELLS patch is enabled.
                item \1
                shift
            endif
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
                
input:      macro
                defineBitfield.b INPUT_,\1
            endm
    
follower: macro
            if (STANDARD_BUILD=1)
                dc.b \1
                dc.b \2
                dc.w \3 ; word-sized mapsprite index
                dc.b \4
                dc.b 0  ; alignment byte
            else
                dc.b \1
                dc.b \2
                dc.b \3
                dc.b \4
            endif
        endm
    
mapsprite: macro
            if (STANDARD_BUILD=1)
                defineShorthand.w MAPSPRITE_,\1 ; word-sized index to accomodate up to 65k+ mapsprites
            else
                defineShorthand.b MAPSPRITE_,\1
            endif
        endm
    
portrait:   macro
                defineShorthand.b PORTRAIT_,\1
            endm
    
speechSfx: macro
            if (STANDARD_BUILD=1)
                defineShorthand.b SFX_,\1
            else
                defineShorthand.b SFX_,\1
                dc.b 0  ; alignment byte
            endif
        endm


; Enemy definitions
                
unknownByte: macro
                dc.b \1
                ; ...and define placeholder zeros while we're at it.
                dcb.b 9,0
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
                
unknownWord: macro
                dcb.b 2,0
                dc.w \1
                dcb.b 2,0
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
    
capEnemyStat: macro
                cmpi.w #255,d1
                ble.s  *+6
                move.w #255,d1
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
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                defineBitfield.w ITEM_,\1
                defineBitfield.w ITEM_,\2
                defineBitfield.w ITEM_,\3
                defineBitfield.w ITEM_,\4
            else
                defineBitfield.b ITEM_,\1
                defineBitfield.b ITEM_,\2
                defineBitfield.b ITEM_,\3
                defineBitfield.b ITEM_,\4
            endif
        endm


; Class definitions
                
mov:        macro
                dc.b \1
            endm
                
resistance: macro
                defineBitfield.w RESISTANCE_,\1
            endm
                
moveType:   macro
                defineBitfield.b MOVETYPE_UPPER_,\1
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
                dc.w \1
                defineBitfield.w VDPSPRITESIZE_,\2
                vdpTile \3
                dc.w \4
            endm
