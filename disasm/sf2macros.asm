
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

wordAlign:  macro ;alias
                align
                inform 0,"INFO: 'wordAlign' macro is obsolete. Please use 'align' with no arguments instead."
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
    
loadSavedDataAddress: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                lea     (\1).l,\2
            else
                lea     ((\1-$1000000)).w,\2
            endif
        endm
    
checkSavedByte: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
dest:           equs '(\2).l'
            else
dest:           equs '((\2-$1000000)).w'
            endif
            if (instr('\1','#')=0)
src:            equs '\1'
            else
src:            substr 2,,'\1'
            endif
            if (\src=0)
                tst.b   \dest
            else
                cmpi.b  \1,\dest
            endif
        endm
    
clearSavedByte: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                clr.b   (\1).l
            else
                clr.b   ((\1-$1000000)).w
            endif
        endm
    
clearSavedByteWithPostIncrement: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                clr.b   (\1)
                addq.w  #2,\1
            else
                clr.b   (\1)+
            endif
        endm
    
copySavedByte: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.b  (\1).l,(\2).l
            else
                move.b  ((\1-$1000000)).w,((\2-$1000000)).w
            endif
        endm
    
getSavedByte: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.b  (\1).l,\2
            else
                move.b  ((\1-$1000000)).w,\2
            endif
        endm
    
setSavedByte: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.b  \1,(\2).l
            else
                move.b  \1,((\2-$1000000)).w
            endif
        endm
    
setSavedByteWithPostIncrement: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.b  \1,(\2)
                addq.w  #2,\2
            else
                move.b  \1,(\2)+
            endif
        endm
    
addToSavedByte: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                addq.b  \1,(\2).l
            else
                addq.b  \1,((\2-$1000000)).w
            endif
        endm
    
subtractSavedByte: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                sub.b   (\1).l,\2
            else
                sub.b   ((\1-$1000000)).w,\2
            endif
        endm
    
getSavedWord: macro
        if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            if (narg>=3)
disp:           equs '\3'
            else
disp:           equs '0'
            endif
                movep.w \disp\\1,\2
        else
                move.w  \3\\1,\2
        endif
    endm
    
getSavedWordWithPostIncrement: macro
        if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            if (narg>=3)
disp:           equs '\3'
            else
disp:           equs '0'
            endif
                movep.w \disp\(\1),\2
                addq.w  #4,\1
        else
                move.w  (\1)+,\2
        endif
    endm
    
setSavedWord: macro
        if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            if (narg>=3)
disp:           equs '\3'
            else
disp:           equs '0'
            endif
                movep.w \1,\disp\\2
        else
                move.w  \1,\3\\2
        endif
    endm
    
setSavedWordWithPostIncrement: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w \1,0(\2)
                addq.w  #4,\2
            else
                move.w  \1,(\2)+
            endif
        endm
    
setSavedLongWithPostIncrement: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.l \1,0(\2)
                addq.w  #8,\2
            else
                move.l  \1,(\2)+
            endif
        endm
    
getSavedCombatantByte: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  \1(a0),d1
                movea.l (sp)+,a0
            else
                movem.l d7-a0,-(sp)
                moveq   #\1,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
            endif
        endm
    
getSavedCombatantWord: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                movep.w \1(a0),d1
                tst.w   d1
                movea.l (sp)+,a0
            else
                movem.l d7-a0,-(sp)
                moveq   #\1,d7
                bsr.w   GetCombatantWord
                movem.l (sp)+,d7-a0
            endif
        endm
    
getSavedCombatantPosition: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  \1(a0),d1
                ext.w   d1
                movea.l (sp)+,a0
            else
                movem.l d7-a0,-(sp)
                moveq   #\1,d7
                bsr.w   GetCombatantByte
                ext.w   d1
                movem.l (sp)+,d7-a0
            endif
        endm
    
setSavedCombatantByte: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,\1(a0)
                movea.l (sp)+,a0
            else
                movem.l d7-a0,-(sp)
                moveq   #\1,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
            endif
        endm
    
setSavedCombatantWord: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                movep.w d1,\1(a0)
                movea.l (sp)+,a0
            else
                movem.l d7-a0,-(sp)
                moveq   #\1,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
            endif
        endm
    
manipulateEquippedBit: macro
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
equippedBit:    equs "#ITEMENTRY_UPPERBIT_EQUIPPED"
entryoffset:    equs "0"
            else
equippedBit:    equs "#ITEMENTRY_BIT_EQUIPPED"
entryoffset:    equs "ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT"
            endif
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                \1    \equippedBit,COMBATANT_OFFSET_ITEMS+\entryoffset\\2
            else
                \1    \equippedBit,\entryoffset\\2
            endif
        endm
    
isItemEquipped: macro
                manipulateEquippedBit btst,\1
            endm
    
equipItem: macro
                manipulateEquippedBit bset,\1
            endm
    
unequipItem: macro
                manipulateEquippedBit bclr,\1
            endm
    
breakItem: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                bset    #ITEMENTRY_UPPERBIT_BROKEN,COMBATANT_OFFSET_ITEMS\1
            else
                bset    #ITEMENTRY_UPPERBIT_BROKEN,\1
            endif
        endm
    
repairItem: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                bclr    #ITEMENTRY_UPPERBIT_BROKEN,COMBATANT_OFFSET_ITEMS\1
            else
                bclr    #ITEMENTRY_UPPERBIT_BROKEN,\1
            endif
        endm
    
checkCurrentMap: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                cmp.b   (CURRENT_MAP).l,\1
            else
                cmp.b   ((CURRENT_MAP-$1000000)).w,\1
            endif
        endm
    
checkRaftMap: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                cmp.b   (RAFT_MAP).l,\1
            else
                cmp.b   ((RAFT_MAP-$1000000)).w,\1
            endif
        endm
    
getBattleTurnActor: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                lea     (BATTLE_TURN_ORDER).l,a0
                move.b  CURRENT_BATTLE_TURN-BATTLE_TURN_ORDER(a0),\1
            else
                move.b  ((CURRENT_BATTLE_TURN-$1000000)).w,\1
                lea     ((BATTLE_TURN_ORDER-$1000000)).w,a0
            endif
                move.b  (a0,\1.w),\1
        endm
    
addSavedByteOffset: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   \1,\1
            endif
                adda.w  \1,\2
        endm
    
getSavedBattleMapCoordinates: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                lea     (BATTLE_AREA_X).l,a0
                movep.w 0(a0),\1
                movep.w BATTLE_AREA_WIDTH-BATTLE_AREA_X(a0),\2
                movea.l (sp)+,a0
            else
                move.w  ((BATTLE_AREA_X-$1000000)).w,\1
                move.w  ((BATTLE_AREA_WIDTH-$1000000)).w,\2
            endif
        endm
    
getSavedBattleMapDimensions: macro
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                lea     (BATTLE_AREA_WIDTH).l,a0
                movep.w 0(a0),\1
                movea.l (sp)+,a0
            else
                move.w  ((BATTLE_AREA_WIDTH-$1000000)).w,\1
            endif
        endm
    
loadSavedMithrilWeaponOrder: macro
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
    
getSavedMithrilWeaponOrder: macro
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
                
itemDrop:   macro ;alias
                item \1
            endm
                
droppedFlag: macro
                dc.b \1
            endm
                
dropFlag:   macro ;alias
                droppedFlag \1
                inform 0,"INFO: 'dropFlag' macro is obsolete. Please use 'droppedFlag' instead."
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
                defineShorthand.b EQUIPEFFECT_,\1
                dc.b \2
                defineShorthand.b EQUIPEFFECT_,\3
                dc.b \4
                defineShorthand.b EQUIPEFFECT_,\5
                dc.b \6
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
                
shopDef:    macro ;alias
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
                
blacksmithClasses: macro                ;alias
                classes \1
            endm
                
mithrilWeaponClass: macro   ;alias
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
                
usableOutsideBattleItem: macro  ;alias
                item \1
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
    
speechSound: macro ;alias
                speechSfx \1
                inform 0,"INFO: 'speechSound' macro is obsolete. Please use 'speechSfx' instead."
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
                
baseAtk:    macro ;alias
                baseAtt \1
                inform 0,"INFO: 'baseAtk' macro is obsolete. Please use 'baseAtt' instead."
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
                
randomBattles: macro ;alias
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
                
atkGrowth:  macro ;alias
                attGrowth \1,\2,\3
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
