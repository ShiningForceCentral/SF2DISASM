
; ASM FILE code\common\menus\menuengine_06.asm :
; 0x137AC..0x156A8 : Menu engine

; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

sub_137AC:
                
                move.w  memberSummaryWindow(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  selectedMember(a6),d0

    ; End of function sub_137AC


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

BuildMemberSummaryWindow:
                
                link    a6,#-6
                move.w  d0,combatant(a6)
                move.l  a1,windowLayoutStartAddress(a6)
                move.w  #WINDOW_MEMBERSUMMARY_SIZE,d0
                bsr.w   alt_WriteWindowTiles
                move.w  combatant(a6),d0
                jsr     j_GetCombatantName
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_OFFSET_NAME,a1
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant(a6),d0
                jsr     j_GetClass
                jsr     j_GetClassName
                addq.w  #2,a1
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                addq.w  #2,a1
                move.w  #VDPTILE_UPPERCASE_L|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  combatant(a6),d0
                jsr     j_GetCurrentLevel
                moveq   #2,d7
                move.w  d1,d0
                ext.l   d0
                cmpi.w  #10,d0
                bge.s   @Continue
                subq.w  #1,d7
@Continue:
                
                bsr.w   WriteTilesFromNumber
                
                ; Draw status effect tiles
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_OFFSET_STATUSEFFECT_TILES,a1
            if (STANDARD_BUILD&(THREE_DIGITS_STATS|FULL_CLASS_NAMES)=1)
                move.l  d3,-(sp)
                move.l  a1,d3
            endif
                move.w  combatant(a6),d0
                jsr     j_GetStatusEffects
                
                ; Curse
                move.w  d1,d2
                andi.w  #STATUSEFFECT_CURSE,d2
                beq.s   @Poison
                move.l  #VDPTILES_STATUSEFFECT_CURSE,d0
                bsr.w   WriteStatusEffectTiles
@Poison:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_POISON,d2
                beq.s   @Muddle
                move.l  #VDPTILES_STATUSEFFECT_POISON,d0
                bsr.w   WriteStatusEffectTiles
@Muddle:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_MUDDLE,d2
                beq.s   @Silence
                move.l  #VDPTILES_STATUSEFFECT_MUDDLE,d0
                bsr.w   WriteStatusEffectTiles
@Silence:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SILENCE,d2
                beq.s   @Stun
                move.l  #VDPTILES_STATUSEFFECT_SILENCE,d0
                bsr.w   WriteStatusEffectTiles
@Stun:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_STUN,d2
                beq.s   @Sleep
                move.l  #VDPTILES_STATUSEFFECT_STUN,d0
                bsr.w   WriteStatusEffectTiles
@Sleep:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLEEP,d2
                beq.s   @Attack
                move.l  #VDPTILES_STATUSEFFECT_SLEEP,d0
                bsr.w   WriteStatusEffectTiles
@Attack:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_ATTACK,d2
                beq.s   @Boost
                move.l  #VDPTILES_STATUSEFFECT_ATTACK,d0
                bsr.w   WriteStatusEffectTiles
@Boost:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_BOOST,d2
                beq.s   @Slow
                move.l  #VDPTILES_STATUSEFFECT_BOOST,d0
                bsr.w   WriteStatusEffectTiles
@Slow:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLOW,d2
                beq.s   @DetermineMiniStatusPage
                move.l  #VDPTILES_STATUSEFFECT_SLOW,d0
                bsr.w   WriteStatusEffectTiles
@DetermineMiniStatusPage:
                
            if (STANDARD_BUILD&(THREE_DIGITS_STATS|FULL_CLASS_NAMES)=1)
                move.l  (sp)+,d3
            endif
                move.b  ((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w,d0
                bne.s   @Items
                bsr.w   WriteMemberMiniStatus
                bra.s   @Done
@Items:
                
                cmpi.b  #WINDOW_MEMBERSUMMARY_PAGE_ITEMS,d0
                bne.s   @Magic
                bsr.w   WriteItemsMiniStatus
                bra.s   @Done
@Magic:
                
                cmpi.b  #WINDOW_MEMBERSUMMARY_PAGE_MAGIC,d0
                bne.s   @Default        
                bsr.w   WriteMagicMiniStatus
                bra.s   @Done
@Default:
                
                bsr.w   WriteEquipMiniStatus ; default to "equip mini status"
@Done:
                
                unlk    a6
                rts

    ; End of function BuildMemberSummaryWindow


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

WriteMemberMiniStatus:
                
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MEMBERPAGE_OFFSET_MAGICITEM_STRING,a1
                lea     aMagicItem(pc), a0
                moveq   #-42,d1
                moveq   #14,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MEMBERPAGE_OFFSET_MAGICLIST_START,a1
                bsr.w   WriteMemberMagicList
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MEMBERPAGE_OFFSET_ITEMSLIST_START,a1
                bsr.w   WriteMemberItemsList
                rts

    ; End of function WriteMemberMiniStatus


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

WriteItemsMiniStatus:
                
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_ITEMSPAGE_OFFSET_ITEM_STRING,a1
                lea     aItem_3(pc), a0 
                moveq   #-42,d1
                moveq   #8,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_ITEMSPAGE_OFFSET_ITEMSLIST_START,a1
                bsr.w   WriteMemberItemsList
                bsr.w   WriteItemIconsCross
                rts

    ; End of function WriteItemsMiniStatus


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

WriteMagicMiniStatus:
                
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MAGICPAGE_OFFSET_MAGIC_STRING,a1
                lea     aMagic_2(pc), a0
                moveq   #-42,d1
                moveq   #7,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MAGICPAGE_OFFSET_MAGICLIST_START,a1
                bsr.w   WriteMemberMagicList
                bsr.w   WriteMagicIconsCross
                rts

    ; End of function WriteMagicMiniStatus


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

WriteEquipMiniStatus:
                
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIPPAGE_OFFSET_EQUIPMENT_STRING,a1
                lea     aEquipment(pc), a0
                moveq   #-42,d1
                moveq   #10,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  d5,d1
                cmpi.w  #ICON_UNARMED,d1
                beq.s   loc_139A0
                jsr     j_FindItemName
                bra.s   loc_139A6
loc_139A0:
                
                lea     aNothing_2(pc), a0
                moveq   #10,d7
loc_139A6:
                
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIPPAGE_OFFSET_ATT_STRING,a1
                lea     aAtt(pc), a0    
                moveq   #7,d7
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant(a6),d0
                jsr     j_GetCurrentAtt
            if (VANILLA_BUILD=1)
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
            endif
                bsr.w   WriteStatValue  
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIPPAGE_OFFSET_DEF_STRING,a1
                lea     aDef(pc), a0    
                moveq   #8,d7
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant(a6),d0
                jsr     j_GetCurrentDef
            if (VANILLA_BUILD=1)
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
            endif
                bsr.w   WriteStatValue  
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIPPAGE_OFFSET_AGI_STRING,a1
                lea     aAgi(pc), a0    
                moveq   #6,d7
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant(a6),d0
                jsr     j_GetCurrentAgi
            if (VANILLA_BUILD=1)
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
            endif
                bsr.w   WriteStatValue  
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIPPAGE_OFFSET_MOV_STRING,a1
                lea     aMov(pc), a0    
                moveq   #8,d7
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant(a6),d0
                jsr     j_GetCurrentMov
            if (VANILLA_BUILD=1)
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
            endif
                bsr.w   WriteStatValue  
                bra.w   loc_13C36
                rts                     ; unreachable

    ; End of function WriteEquipMiniStatus


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

WriteMemberMagicList:
                
                module  ; Start of magic and items lists module
                move.w  combatant(a6),d0
                clr.w   d1
                jsr     j_GetSpellAndNumberOfSpells
                tst.w   d2
                beq.w   @NoMagic
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d6
@Magic_Loop:
                
                move.w  combatant(a6),d0
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d1
                sub.w   d6,d1
                jsr     j_GetSpellAndNumberOfSpells
                cmpi.b  #SPELL_NOTHING,d1
                beq.w   return_13B46
                movem.l a0-a1,-(sp)
                movem.w d0-d1/d6-d7,-(sp)
                jsr     j_FindSpellName
                moveq   #-42,d1
                move.l  a1,-(sp)
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l (sp)+,a1
                movem.w (sp)+,d0-d1/d6-d7
                movem.w d6-d7,-(sp)
                lea     WINDOW_MEMBERSUMMARY_OFFSET_SPELL_LEVEL(a1),a1
            if (STANDARD_BUILD&EXTENDED_SPELL_NAMES=1)
            else
                move.w  #VDPTILE_UPPERCASE_L|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  #VDPTILE_LOWERCASE_E|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  #VDPTILE_LOWERCASE_V|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  #VDPTILE_LOWERCASE_E|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  #VDPTILE_LOWERCASE_L|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  #VDPTILE_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
            endif
                lsr.w   #SPELLENTRY_OFFSET_LV,d1
                addq.w  #1,d1
                move.w  d1,d0
                ext.l   d0
                moveq   #1,d7
                bsr.w   WriteTilesFromNumber
                movem.w (sp)+,d6-d7
                movem.l (sp)+,a0-a1
                lea     WINDOW_MEMBERSUMMARY_OFFSET_NEXT_SPELL(a1),a1
                dbf     d6,@Magic_Loop
                rts
@NoMagic:
                
                move.w  d7,-(sp)
            if (STANDARD_BUILD&EXTENDED_SPELL_NAMES=1)
                addq.w  #2,a1
            endif
                lea     aNothing_0(pc), a0
                moveq   #-42,d1
                moveq   #10,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
                rts

    ; End of function WriteMemberMagicList


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

WriteMemberItemsList:
                
                move.w  combatant(a6),d0
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                tst.w   d2
                beq.w   @NoItems
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d6
@Items_Loop:
                
                move.w  combatant(a6),d0
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d1
                sub.w   d6,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.b  #ITEM_NOTHING,d1
                beq.w   return_13B46
                movem.w d0-d1/d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                jsr     j_FindItemName
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movem.l (sp)+,a0-a1
                movem.w (sp)+,d0-d1/d6-d7
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.w   @Continue
                move.w  #VDPTILE_EQUIPPED_SYMBOL|VDPTILE_PALETTE3|VDPTILE_PRIORITY,-2(a1)
@Continue:
                
                lea     WINDOW_MEMBERSUMMARY_OFFSET_NEXT_ITEM(a1),a1
                dbf     d6,@Items_Loop
return_13B46:
                
                rts
@NoItems:
                
                move.w  d7,-(sp)
                lea     aNothing_1(pc), a0
                moveq   #-42,d1
                moveq   #10,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
                rts

    ; End of function WriteMemberItemsList

                modend  ; End of magic and items lists module

; =============== S U B R O U T I N E =======================================


LoadItemIcon:
                
                module  ; start of icon loading module
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                getPointer p_Icons, a0
            if (STANDARD_BUILD=1)
                cmpi.w  #ITEM_NOTHING,d1
                bne.s   LoadIcon
                bra.s   @Nothing
            else
                bra.w   LoadIcon
            endif

    ; End of function LoadItemIcon


; =============== S U B R O U T I N E =======================================


LoadSpellIcon:
                
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                getPointer p_Icons, a0
                cmpi.w  #SPELL_NOTHING,d1
                bne.s   @Spell
@Nothing:       move.w  #ICON_NOTHING,d1
                bra.s   LoadIcon
@Spell:
                
                addi.w  #ICON_SPELLS_START,d1

    ; End of function LoadSpellIcon


; START OF FUNCTION CHUNK FOR LoadItemIcon

LoadIcon:
                
                move.w  d1,d2           ; multiply by icon size (192)
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addIconOffset d1, a0
                moveq   #47,d7
@Loop:
                
                move.l  (a0)+,(a1)+
                dbf     d7,@Loop
                
                ori.w   #$F,-2(a1)
                ori.w   #$F000,-36(a1)
                ori.w   #$F,-158(a1)
                ori.w   #$F000,-192(a1)
                rts
                modend  ; end of icon loading module

; END OF FUNCTION CHUNK FOR LoadItemIcon


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

WriteItemIconsCross:
                
                move.w  combatant(a6),d0
                lea     (FF6802_LOADING_SPACE).l,a1
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                bsr.s   LoadItemIcon
                moveq   #1,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                bsr.s   LoadItemIcon
                moveq   #2,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                bsr.s   LoadItemIcon
                moveq   #3,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                bsr.w   LoadItemIcon
                bra.w   loc_13C20

    ; End of function WriteItemIconsCross


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

WriteMagicIconsCross:
                
                move.w  combatant(a6),d0
                lea     (FF6802_LOADING_SPACE).l,a1
                clr.w   d1
                jsr     j_GetSpellAndNumberOfSpells
                bsr.w   LoadSpellIcon
                moveq   #1,d1
                jsr     j_GetSpellAndNumberOfSpells
                bsr.w   LoadSpellIcon
                moveq   #2,d1
                jsr     j_GetSpellAndNumberOfSpells
                bsr.w   LoadSpellIcon
                moveq   #3,d1
                jsr     j_GetSpellAndNumberOfSpells
                bsr.w   LoadSpellIcon
loc_13C20:
                
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($BC00).l,a1
                move.w  #384,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
loc_13C36:
                
                movea.l windowLayoutStartAddress(a6),a1
                move.l  #$C5E0C5E1,$DC(a1)
                move.l  #$C5E2C5E3,$106(a1)
                move.l  #$C5E4C5E5,$130(a1)
                move.l  #$C5E6C5E7,$12A(a1)
                move.l  #$C5E8C5E9,$154(a1)
                move.l  #$C5EAC5EB,$17E(a1)
                move.l  #$C5ECC5ED,$136(a1)
                move.l  #$C5EEC5EF,$160(a1)
                move.l  #$C5F0C5F1,$18A(a1)
                move.l  #$C5F2C5F3,$184(a1)
                move.l  #$C5F4C5F5,$1AE(a1)
                move.l  #$C5F6C5F7,$1D8(a1)
                rts

    ; End of function WriteMagicIconsCross


; =============== S U B R O U T I N E =======================================


alt_WriteWindowTiles:
                
                movem.w d0-d1/d6-d7,-(sp)
                clr.w   d1
                move.b  d0,d1
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,d6
                subq.l  #3,d6
                move.w  #VDPTILE_CORNER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
loc_13CAE:
                
                move.w  #VDPTILE_H_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d6,loc_13CAE
                
                move.w  #VDPTILE_CORNER|VDPTILE_MIRROR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  d1,d7
                subq.w  #3,d7
loc_13CBE:
                
                move.w  d0,d6
                subq.w  #3,d6
                move.w  #VDPTILE_V_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
loc_13CC6:
                
                move.w  #VDPTILE_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d6,loc_13CC6
                
                move.w  #VDPTILE_V_BORDER|VDPTILE_MIRROR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d7,loc_13CBE
                
                move.w  d0,d6
                subq.l  #3,d6
                move.w  #VDPTILE_CORNER|VDPTILE_FLIP|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
loc_13CDE:
                
                move.w  #VDPTILE_H_BORDER|VDPTILE_FLIP|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d6,loc_13CDE
                
                move.w  #VDPTILE_CORNER|VDPTILE_MIRROR|VDPTILE_FLIP|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                movem.w (sp)+,d0-d1/d6-d7
                rts

    ; End of function alt_WriteWindowTiles

            if (VANILLA_BUILD=1)
aNameClassLevExp:
                dc.b 'NAME    CLASS     LEV EXP',0
aNameHpMpAtDfAgMv:
                dc.b 'NAME    HP MP AT DF AG MV',0
aNameAttackDefense:
                dc.b 'NAME    ATTACK   DEFENSE',0
            endif
aMagicItem:     dc.b 'MAGIC     ITEM'
aItem_3:        dc.b '- ITEM -',0
aMagic_2:       dc.b '- MAGIC -',0
aLevel:         dc.b 'LEVEL',0
aUnequippable:  dc.b '\unequippable',0
aEquipment:     dc.b 'Equipment ',0
aAtt:           dc.b 'ATT  ',0
aDef:           dc.b 'DEF  ',0
aMov:           dc.b 'MOV  ',0
aAgi:           dc.b 'AGI  ',0
aNothing_2:     dc.b '\Nothing',0
                
                align
                
tiles_TextHighlight:
                incbin "data/graphics/tech/texthighlighttiles.bin"
layout_13EDE:   
; Syntax        vdpBaseTile [VDPTILE_]enum[|MIRROR|FLIP]
;
; Notes: PALETTE3 and PRIORITY bits are always set.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE

; =============== S U B R O U T I N E =======================================


sub_13F14:
                
                movem.l d0/d3-a1,-(sp)
                sndCom  SFX_VALIDATION
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                clr.b   ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                lea     (FF8804_LOADING_SPACE).l,a1
                move.w  ((DISPLAYED_ICON_1-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_2-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_3-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_4-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                bsr.w   CleanIconCorners
                jsr     (WaitForVInt).w
                moveq   #$1E,d6
loc_13F88:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13FA2
                moveq   #1,d1
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_2-$1000000)).w
                beq.s   loc_13FA2
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1401E
loc_13FA2:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13FBC
                moveq   #2,d1
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_3-$1000000)).w
                beq.s   loc_13FBC
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1401E
loc_13FBC:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13FCE
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1401E
loc_13FCE:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13FE8
                moveq   #3,d1
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_4-$1000000)).w
                beq.s   loc_13FE8
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1401E
loc_13FE8:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13FFA
                move.b  #-1,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bra.w   loc_14052
loc_13FFA:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1400C
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_14052
loc_1400C:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14034
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_14052
loc_1401E:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   DmaMembersListIcon
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                moveq   #$1D,d6
loc_14034:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaMembersListIcon
                moveq   #$14,d1
                bsr.w   LoadMiniStatusHighlightSprites
                subq.w  #1,d6
                bne.s   loc_1404A
                moveq   #$1E,d6
loc_1404A:
                
                jsr     (WaitForVInt).w
                bra.w   loc_13F88
loc_14052:
                
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   loc_14062
                sndCom  SFX_VALIDATION
                moveq   #-1,d1
                bra.s   loc_1406E
loc_14062:
                
                move.w  d1,d2
                add.w   d2,d2
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d2.w),d2
loc_1406E:
                
                movem.l (sp)+,d0/d3-a1
                rts

    ; End of function sub_13F14


; =============== S U B R O U T I N E =======================================

; In: d0.w = current diamond-menu choice


DmaMembersListIcon:
                
                moveq   #$7F,d7
                add.w   d0,d0
                move.w  rjt_DmaMembersListIconFunctions(pc,d0.w),d0
                jmp     rjt_DmaMembersListIconFunctions(pc,d0.w)

    ; End of function DmaMembersListIcon

rjt_DmaMembersListIconFunctions:
                dc.w dmaMembersListIcon_Up-rjt_DmaMembersListIconFunctions
                dc.w dmaMembersListIcon_Left-rjt_DmaMembersListIconFunctions
                dc.w dmaMembersListIcon_Right-rjt_DmaMembersListIconFunctions
                dc.w dmaMembersListIcon_Down-rjt_DmaMembersListIconFunctions

; =============== S U B R O U T I N E =======================================


dmaMembersListIcon_Up:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   loc_14098
                adda.w  #ICON_TILE_BYTESIZE,a0
loc_14098:
                
                lea     ($BC00).l,a1
                move.w  #96,d0
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaMembersListIcon_Up


; =============== S U B R O U T I N E =======================================


dmaMembersListIcon_Left:
                
                lea     (FF8984_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   loc_140B8
                adda.w  #ICON_TILE_BYTESIZE,a0
loc_140B8:
                
                lea     ($BCC0).l,a1
                move.w  #96,d0
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaMembersListIcon_Left


; =============== S U B R O U T I N E =======================================


dmaMembersListIcon_Right:
                
                lea     (FF8B04_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   loc_140D8
                adda.w  #ICON_TILE_BYTESIZE,a0
loc_140D8:
                
                lea     ($BD80).l,a1
                move.w  #96,d0
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaMembersListIcon_Right


; =============== S U B R O U T I N E =======================================


dmaMembersListIcon_Down:
                
                lea     (FF8C84_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   loc_140F8
                adda.w  #ICON_TILE_BYTESIZE,a0
loc_140F8:
                
                lea     ($BE40).l,a1
                move.w  #96,d0
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaMembersListIcon_Down


; =============== S U B R O U T I N E =======================================

; related to equip menu


sub_14108:
                
                movem.l d0/d3-a2,-(sp)
@Weapons:
                
                jsr     j_GetEquippableWeapons
                tst.w   d1
                beq.w   @Ring           ; branch if no equippable weapon
                movea.l a0,a2           ; A0, A2 = pointer to equippable items list
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a1
                move.w  (a0),(a1)+
                move.w  4(a0),(a1)+
                move.w  8(a0),(a1)+
                move.w  $C(a0),(a1)+
                move.w  d1,d3           ; D3 = equippable weapons count
                jsr     j_GetEquippedWeapon
                bsr.w   BuildEquippingWindow
                tst.w   d1
                bpl.s   @EquipWeapon    ; branch based on returned diamond menu choice
                moveq   #WINDOW_MEMBERSUMMARY_PAGE_ITEMS,d7
                bsr.w   RefreshMemberSummaryWindow
                jsr     (WaitForWindowMovementEnd).w
                bra.w   @Done
@EquipWeapon:
                
                lsl.w   #INDEX_SHIFT_COUNT,d1
                move.w  (a2,d1.w),d2
                move.w  2(a2,d1.w),d1
                move.w  d2,d5
                move.w  d1,d4
                jsr     j_GetEquippedWeapon
                bsr.w   EquipNewItem
@Ring:
                
                jsr     j_GetEquippableRings
                tst.w   d1
                beq.w   @Done           ; branch if no equippable ring
                movea.l a0,a2
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a1
                move.w  (a0),(a1)+
                move.w  4(a0),(a1)+
                move.w  8(a0),(a1)+
                move.w  $C(a0),(a1)+
                move.w  d1,d3           ; D3 = equippable rings count
                jsr     j_GetEquippedRing
                bsr.w   BuildEquippingWindow
                tst.w   d1
                bpl.s   @EquipRing      ; branch based on returned diamond menu choice
                jsr     j_GetEquippableWeapons
                tst.w   d1
                bne.s   @Goto_Weapons
                moveq   #WINDOW_MEMBERSUMMARY_PAGE_ITEMS,d7
                bsr.w   RefreshMemberSummaryWindow
                jsr     (WaitForWindowMovementEnd).w
                moveq   #-1,d1
                bra.w   @Done
@Goto_Weapons:
                
                bra.w   @Weapons
@EquipRing:
                
                lsl.w   #INDEX_SHIFT_COUNT,d1
                move.w  (a2,d1.w),d2
                move.w  2(a2,d1.w),d1
                move.w  d2,d5
                move.w  d1,d4
                jsr     j_GetEquippedRing
                bsr.w   EquipNewItem
@Done:
                
                movem.l (sp)+,d0/d3-a2
                rts

    ; End of function sub_14108


; =============== S U B R O U T I N E =======================================

; In: D1 = old equipped item index
;     D2 = old equipped item slot
;     D3 = equippable items count

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

BuildEquippingWindow:
                
                movem.l d0/d2-a2,-(sp)
                tst.w   d1
                bpl.s   loc_141EA       ; branch if something equipped
                cmpi.w  #4,d3
                bne.s   loc_141E6
                
                ; Equip first item if inventory is full with equippable items
                clr.w   d1
                jsr     j_EquipItemBySlot
                bra.s   loc_141E8
loc_141E6:
                
                moveq   #3,d1           ; set menu initial choice to down slot
loc_141E8:
                
                bra.s   loc_141FE
loc_141EA:
                
                move.l  a0,-(sp)
                moveq   #3,d7
                moveq   #-1,d1
loc_141F0:
                
                addq.w  #1,d1
                addq.l  #2,a0
                move.w  (a0)+,d4
                cmp.w   d2,d4
                dbeq    d7,loc_141F0
                movea.l (sp)+,a0
loc_141FE:
                
                move.b  d1,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                move.w  d1,-(sp)
                moveq   #WINDOW_MEMBERSUMMARY_PAGE_EQUIP,d7
                bsr.w   RefreshMemberSummaryWindow
                jsr     j_GetStatusEffects
                move.w  d1,statusEffects(a6)
                lea     (FF8804_LOADING_SPACE).l,a1
                move.w  ((DISPLAYED_ICON_1-$1000000)).w,d0
                bsr.w   LoadHighlightableIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_2-$1000000)).w,d0
                bsr.w   LoadHighlightableIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_3-$1000000)).w,d0
                bsr.w   LoadHighlightableIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_4-$1000000)).w,d0
                bsr.w   LoadHighlightableIcon
                bsr.w   CleanIconCorners
                clr.w   d6
                moveq   #$1F,d7
                bsr.w   dmaMembersListIcon_Up
                bsr.w   dmaMembersListIcon_Left
                bsr.w   dmaMembersListIcon_Right
                bsr.w   dmaMembersListIcon_Down
                jsr     (WaitForWindowMovementEnd).w
                moveq   #$1E,d6
loc_14264:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1427E
                moveq   #1,d1
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_2-$1000000)).w
                beq.s   loc_1427E
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_142FA
loc_1427E:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14298
                moveq   #2,d1
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_3-$1000000)).w
                beq.s   loc_14298
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_142FA
loc_14298:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_142AA
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_142FA
loc_142AA:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_142C4
                moveq   #3,d1
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_4-$1000000)).w
                beq.s   loc_142C4
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_142FA
loc_142C4:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_142D6
                move.b  #-1,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bra.w   loc_1438C
loc_142D6:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_142E8
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_1438C
loc_142E8:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14366
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_1438C
loc_142FA:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   DmaMembersListIcon
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                move.w  d0,d2
                move.w  selectedMember(a6),d0
                lsl.w   #INDEX_SHIFT_COUNT,d2
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
                move.w  (a2,d2.w),d5
                move.w  2(a2,d2.w),d6
                move.w  (a2),d1
                jsr     j_GetEquipmentType
                tst.w   d2
                blt.s   loc_14336
                jsr     j_UnequipWeapon
                bra.s   loc_1433C
loc_14336:
                
                jsr     j_UnequipRing
loc_1433C:
                
                move.w  d6,d1
                cmpi.w  #COMBATANT_ITEMSLOTS,d1
                bge.s   loc_1434A
                jsr     j_EquipItemBySlot
loc_1434A:
                
                move.w  statusEffects(a6),d1
                jsr     j_SetStatusEffects
                bsr.w   sub_137AC
                move.w  memberSummaryWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                moveq   #$1D,d6
loc_14366:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaMembersListIcon       
                moveq   #$14,d1
                bsr.w   LoadMiniStatusHighlightSprites
            if (STANDARD_BUILD&EIGHT_CHARACTERS_MEMBER_NAMES=1)
                move.b  #16,(SPRITE_NAME_HIGHLIGHT_LINK_NEW).l
            else
                move.b  #16,(SPRITE_NAME_HIGHLIGHT_LINK).l
            endif
                subq.w  #1,d6
                bne.s   loc_14384
                moveq   #$1E,d6
loc_14384:
                
                jsr     (WaitForVInt).w
                bra.w   loc_14264
loc_1438C:
                
                move.w  selectedMember(a6),d0
                move.w  ((EQUIPPABLE_ITEMS-$1000000)).w,d1
                jsr     j_GetEquipmentType
                tst.w   d2
                blt.s   loc_143A6
                jsr     j_UnequipWeapon
                bra.s   loc_143AC
loc_143A6:
                
                jsr     j_UnequipRing
loc_143AC:
                
                move.w  (sp)+,d1
                lsl.w   #INDEX_SHIFT_COUNT,d1
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a0
                move.w  2(a0,d1.w),d1
                cmpi.w  #COMBATANT_ITEMSLOTS,d1
                bge.s   loc_143C4
                jsr     j_EquipItemBySlot
loc_143C4:
                
                move.w  statusEffects(a6),d1
                jsr     j_SetStatusEffects
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                movem.l (sp)+,d0/d2-a2
                move.b  #WINDOW_MEMBERSUMMARY_PAGE_ITEMS,((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                rts

    ; End of function BuildEquippingWindow


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

RefreshMemberSummaryWindow:
                
                movem.w d0-d7,-(sp)
                move.w  memberSummaryWindow(a6),d0
                move.w  #$2001,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.b  d7,((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                clr.w   d5
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d5
                lsl.w   #1,d5
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d5.w),d5
                bsr.w   sub_137AC
                move.w  memberSummaryWindow(a6),d0
                move.w  #$A01,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                movem.w (sp)+,d0-d7
                rts

    ; End of function RefreshMemberSummaryWindow


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

HideMembersListWindow:
                
                movem.w d0-d2/d7,-(sp)
                move.w  membersListWindow(a6),d0
                move.w  #$21C,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.w (sp)+,d0-d2/d7
                rts

    ; End of function HideMembersListWindow


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

ShowMembersListWindow:
                
                movem.w d0-d2/d7,-(sp)
                move.w  membersListWindow(a6),d0
                move.w  #$20E,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.w (sp)+,d0-d2/d7
                rts

    ; End of function ShowMembersListWindow


; =============== S U B R O U T I N E =======================================

; Handle out of battle MAGIC menu


sub_1445A:
                
                movem.l d0/d3-a1,-(sp)
                sndCom  SFX_VALIDATION
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
            if (STANDARD_BUILD=1)
                jsr     GetSpellAndNumberOfSpells
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     GetSpellAndNumberOfSpells
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     GetSpellAndNumberOfSpells
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     GetSpellAndNumberOfSpells
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                move.w  d1,(a0)+
            else
                jsr     j_GetSpellAndNumberOfSpells
                andi.w  #$7F,d1         ; BUG -- Should be using spell entry index mask $3F instead.
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetSpellAndNumberOfSpells
                andi.w  #$7F,d1 
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetSpellAndNumberOfSpells
                andi.w  #$7F,d1 
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetSpellAndNumberOfSpells
                andi.w  #$7F,d1 
                move.w  d1,(a0)+
            endif
                clr.b   ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                lea     (FF8804_LOADING_SPACE).l,a1
                move.w  ((DISPLAYED_ICON_1-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_2-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_3-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_4-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                bsr.w   CleanIconCorners
loc_144D8:
                
                jsr     (WaitForVInt).w
                moveq   #$1E,d6
loc_144DE:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_144F8
                moveq   #1,d1
                cmpi.w  #SPELL_NOTHING,((DISPLAYED_ICON_2-$1000000)).w
                beq.s   loc_144F8
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_14574
loc_144F8:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14512
                moveq   #2,d1
                cmpi.w  #SPELL_NOTHING,((DISPLAYED_ICON_3-$1000000)).w
                beq.s   loc_14512
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_14574
loc_14512:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14524
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_14574
loc_14524:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1453E
                moveq   #3,d1
                cmpi.w  #SPELL_NOTHING,((DISPLAYED_ICON_4-$1000000)).w
                beq.s   loc_1453E
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_14574
loc_1453E:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14550
                move.b  #-1,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bra.w   byte_145A8
loc_14550:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14562
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   byte_145A8
loc_14562:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1458A
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   byte_145A8
loc_14574:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   DmaMembersListIcon
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                moveq   #$1D,d6
loc_1458A:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaMembersListIcon
                moveq   #$14,d1
                bsr.w   LoadMiniStatusHighlightSprites
                subq.w  #1,d6
                bne.s   loc_145A0
                moveq   #$1E,d6
loc_145A0:
                
                jsr     (WaitForVInt).w
                bra.w   loc_144DE
byte_145A8:
                
                sndCom  SFX_VALIDATION
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   loc_145BC
                moveq   #-1,d1
                movem.l (sp)+,d0/d3-a1
                rts
loc_145BC:
                
                move.w  d1,d2
                add.w   d2,d2
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d2.w),d2
                move.w  d2,-(sp)
                moveq   #$1E,d6
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaMembersListIcon
                move.w  (sp)+,d2
                move.w  d2,d4
                lsr.w   #SPELLENTRY_OFFSET_LV,d4
                move.w  d4,d3
                moveq   #$13,d1
                bsr.w   LoadMiniStatusHighlightSprites
                jsr     (WaitForVInt).w
                moveq   #$14,d1
loc_145EA:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14600
                tst.w   d3
                ble.s   loc_14600
                subq.w  #1,d3
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1463E
loc_14600:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14616
                cmp.w   d4,d3
                bge.s   loc_14616
                addq.w  #1,d3
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1463E
loc_14616:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14626
                move.b  #-1,d3
                bra.w   loc_14654
loc_14626:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14632
                bra.w   loc_14654
loc_14632:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14644
                bra.w   loc_14654
loc_1463E:
                
                bsr.w   sub_1474C
                moveq   #$13,d1
loc_14644:
                
                bsr.w   LoadMiniStatusHighlightSprites
                subq.w  #1,d1
                bne.s   loc_1464E
                moveq   #$14,d1
loc_1464E:
                
                jsr     (WaitForVInt).w
                bra.s   loc_145EA
loc_14654:
                
                moveq   #$13,d1
                bsr.w   LoadMiniStatusHighlightSprites
                tst.b   d3
                bpl.s   loc_1466C
                sndCom  SFX_VALIDATION
                move.w  d4,d3
                bsr.w   sub_1474C
                bra.w   loc_144D8
loc_1466C:
                
                move.w  d2,d1
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                lsl.w   #6,d3
                or.w    d3,d1
                movem.l (sp)+,d0/d3-a1  ;     fixSelectionRectCorners
                                        ;     Remove white pixels from corners of spell/item selection rect.
                                        ;     In: A1 = end of selection rect section in RAM
                rts

    ; End of function sub_1445A


; =============== S U B R O U T I N E =======================================


CleanIconCorners:
                
                ori.w   #$F,-2(a1)
                ori.w   #$F000,-$24(a1)
                ori.w   #$F,-$9E(a1)
                ori.w   #$F000,-$C0(a1)
                ori.w   #$F,-$C2(a1)
                ori.w   #$F000,-$E4(a1)
                ori.w   #$F,-$15E(a1)
                ori.w   #$F000,-$180(a1)
                rts

    ; End of function CleanIconCorners


; =============== S U B R O U T I N E =======================================

; In: D1 = blinking frame timer


LoadMiniStatusHighlightSprites:
                
                movem.w d0/d2,-(sp)
                lea     (SPRITE_BATTLE_CURSOR).l,a0
                lea     sprite_MiniStatusHighlight(pc), a1
                move.w  ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                lsl.w   #NIBBLE_SHIFT_COUNT,d0
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                beq.s   @Continue1
                moveq   #1,d1
                move.w  #$100,d0        ; position sprites off-screen while windows are hidden
@Continue1:
                
                moveq   #WINDOW_MEMBERS_LIST_HIGHLIGHTSPRITES_COUNTER,d7
@LoadMembersListSprites_Loop:
                
                move.w  (a1)+,(a0)
                add.w   d0,(a0)
                move.w  (a1)+,d2
                move.w  d2,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_TILE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_X(a0)
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a0
                dbf     d7,@LoadMembersListSprites_Loop
                
                ; Check blinking frame timer
                cmpi.w  #7,d1
                bge.s   @Continue2
                move.w  #$100,d0        ; position sprites off-screen at regular intervals
                bra.s   @OffsetY
@Continue2:
                
                clr.w   d0
@OffsetY:       if (STANDARD_BUILD&EXTENDED_SPELL_NAMES=1)
                    cmpi.b  #WINDOW_MEMBERSUMMARY_PAGE_MAGIC,((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                    bne.s   @Items
                    lea     spr_MagicListTextHighlight(pc), a1
@Items:         endif
                clr.w   d2
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d2
                lsl.w   #NIBBLE_SHIFT_COUNT,d2
                add.w   d2,d0
                moveq   #WINDOW_MEMBERSUMMARY_HIGHLIGHTSPRITES_COUNTER,d7
@LoadMiniStatusSprites_Loop:
                
                move.w  (a1)+,(a0)
                add.w   d0,(a0)
                move.w  (a1)+,d2
                move.w  d2,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_TILE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_X(a0)
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a0
                dbf     d7,@LoadMiniStatusSprites_Loop
                
                bsr.w   sub_101E6
                movem.w (sp)+,d0/d2
                rts

    ; End of function LoadMiniStatusHighlightSprites

sprite_MiniStatusHighlight:
                
; Syntax        vdpSprite y, [VDPSPRITESIZE_]bitfield|link, vdpTile, x
;
;      vdpTile: [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                vdpSprite 260, V2|H4|9, 1472|PALETTE3|PRIORITY, 156 ; member name
            if (STANDARD_BUILD&EIGHT_CHARACTERS_MEMBER_NAMES=1)
                vdpSprite 260, V2|H1|10, 1474|PALETTE3|PRIORITY, 188
                vdpSprite 260, V2|H4|11, 1472|MIRROR|PALETTE3|PRIORITY, 196
                vdpSprite 168, V2|H4|12, 1472|PALETTE3|PRIORITY, 300
                vdpSprite 168, V2|H2|13, 1474|PALETTE3|PRIORITY, 332
            else
                vdpSprite 260, V2|H4|10, 1472|MIRROR|PALETTE3|PRIORITY, 188
                vdpSprite 168, V2|H4|11, 1472|PALETTE3|PRIORITY, 300 ; item or spell
                vdpSprite 168, V2|H2|12, 1474|PALETTE3|PRIORITY, 332
            endif
                vdpSprite 168, V2|H4|16, 1472|MIRROR|PALETTE3|PRIORITY, 340
spr_MagicListTextHighlight:
                
        if (STANDARD_BUILD&EXTENDED_SPELL_NAMES=1)
            if (EIGHT_CHARACTERS_MEMBER_NAMES=1)
                vdpSprite 168, V2|H4|12, 1472|PALETTE3|PRIORITY, 292
                vdpSprite 168, V2|H3|13, 1474|PALETTE3|PRIORITY, 324
            else
                vdpSprite 168, V2|H4|11, 1472|PALETTE3|PRIORITY, 292
                vdpSprite 168, V2|H3|12, 1474|PALETTE3|PRIORITY, 324
            endif
                vdpSprite 168, V2|H4|16, 1472|MIRROR|PALETTE3|PRIORITY, 340
        endif

; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

sub_1474C:
                
                move.w  memberSummaryWindow(a6),d0
                clr.w   d1
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d1
                add.w   d1,d1
                addq.w  #5,d1
                ori.w   #$1300,d1
                jsr     (GetWindowTileAddress).w
                clr.w   d1
                move.w  d3,d0
                addq.w  #1,d0
                ext.l   d0
                moveq   #1,d7
                bsr.w   WriteTilesFromNumber
                move.w  memberSummaryWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                rts

    ; End of function sub_1474C


; =============== S U B R O U T I N E =======================================

; Try to unequip current item, and equip new one if successful
; 
;      In: d1.w = old item index (-1 if nothing equipped)
;          d2.w = old item slot
;          d4.w = new item slot


EquipNewItem:
                
                cmpi.w  #-1,d1
                beq.w   @Equip
                
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   @Equip          ; equip new item if not cursed
                cmp.w   d4,d1
                beq.w   @Return         ; return if selecting old item slot
                jsr     HideMembersListWindow(pc)
                sndCom  MUSIC_CURSED_ITEM
                txt     43              ; "Gosh!  The curse prohibits{N}you from exchanging{N}equipment!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput_0
                clsTxt
                jsr     ShowMembersListWindow(pc)
                bra.w   @Return
@Equip:
                
                move.w  d4,d1
                if (STANDARD_BUILD&FIX_HIGINS_SPELL=1)
                    cmpi.w  #COMBATANT_ITEMSLOTS,d1
                    bge.s   @Return
                endif
                jsr     j_EquipItemBySlot
                cmpi.w  #2,d2
                bne.w   @Return         ; return if new item is not cursed
                move.w  d0,(DIALOGUE_NAME_INDEX_1).l
                jsr     HideMembersListWindow(pc)
                sndCom  MUSIC_CURSED_ITEM
                txt     34              ; "Gosh!  {NAME} is{N}cursed!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput_0
                clsTxt
                jsr     ShowMembersListWindow(pc)
@Return:
                
                rts

    ; End of function EquipNewItem


; =============== S U B R O U T I N E =======================================


WaitForMusicResumeAndPlayerInput_0:
                
                move.w  d0,-(sp)
                move.w  #SOUND_COMMAND_PLAY_PREVIOUS_MUSIC,d0
                jsr     (PlayMusicAfterCurrentOne).w
                jsr     (WaitForPlayerInput).w
                move.w  (sp)+,d0
                rts

    ; End of function WaitForMusicResumeAndPlayerInput_0


; =============== S U B R O U T I N E =======================================

inventoryWindowLayoutLoadingSpace = -240
goldWindowLayoutEndAddress = -18
goldWindowSlot = -14
itemNameAndPriceWindowLayoutEndAddress = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowLayoutEndAddress = -6
inventoryWindowSlot = -2

BuildShopInventoryScreen:
                
                move.w  ((CURRENT_SHOP_PAGE-$1000000)).w,d0
                mulu.w  #6,d0
                add.w   ((CURRENT_SHOP_SELECTION-$1000000)).w,d0
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d0
                blt.s   loc_14814
                clr.w   ((CURRENT_SHOP_PAGE-$1000000)).w
                clr.w   ((CURRENT_SHOP_SELECTION-$1000000)).w
loc_14814:
                
                link    a6,#-240
                move.w  #WINDOW_SHOP_INVENTORY_SIZE,d0
                move.w  #WINDOW_SHOP_INVENTORY_DEST,d1
                jsr     (CreateWindow).l
                move.w  d0,inventoryWindowSlot(a6)
                move.l  a1,inventoryWindowLayoutEndAddress(a6)
                bsr.w   LoadItemIconsAndPriceTagTiles
                move.w  #WINDOW_SHOP_ITEM_NAME_AND_PRICE_SIZE,d0
                move.w  #WINDOW_SHOP_ITEM_NAME_AND_PRICE_DEST,d1
                jsr     (CreateWindow).l
                move.w  d0,itemNameAndPriceWindowSlot(a6)
                move.l  a1,itemNameAndPriceWindowLayoutEndAddress(a6)
                bsr.w   WriteItemNameAndGoldAmount
                move.w  #WINDOW_SHOP_GOLD_SIZE,d0
                move.w  #WINDOW_SHOP_GOLD_DEST,d1
                jsr     (CreateWindow).l
                move.w  d0,goldWindowSlot(a6)
                move.l  a1,goldWindowLayoutEndAddress(a6)
                bsr.w   WriteGoldAmount 
                move.w  inventoryWindowSlot(a6),d0
                move.w  #$201,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  itemNameAndPriceWindowSlot(a6),d0
                move.w  #$106,d1
                move.w  ((CURRENT_SHOP_SELECTION-$1000000)).w,d2
                lsl.w   #2,d2
                lsl.w   #BYTE_SHIFT_COUNT,d2
                add.w   d2,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  goldWindowSlot(a6),d0
                move.w  #$1617,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                lea     tiles_ShopInventoryItemHighlight(pc), a0
                lea     ($FE00).l,a1
                move.w  #$100,d0
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jsr     (WaitForWindowMovementEnd).l
                bsr.w   sub_14EDE
loc_148BC:
                
                move.w  ((CURRENT_SHOP_SELECTION-$1000000)).w,d0
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14906
                move.w  ((CURRENT_SHOP_PAGE-$1000000)).w,d2
                mulu.w  #ITEMS_PER_SHOP_PAGE,d2
                add.w   d0,d2
                addq.w  #1,d2
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d2
                bge.s   loc_14906
                addq.w  #1,d0
                sndCom  SFX_MENU_SELECTION
                cmp.w   ((word_FFB134-$1000000)).w,d0
                blt.s   loc_148FA
                addq.w  #1,((CURRENT_SHOP_PAGE-$1000000)).w
                clr.w   ((CURRENT_SHOP_SELECTION-$1000000)).w
                clr.b   ((word_FFAF9E-$1000000)).w
                bsr.w   sub_14E62
                bra.w   loc_149E0
loc_148FA:
                
                move.w  d0,((CURRENT_SHOP_SELECTION-$1000000)).w
                bsr.w   sub_14EC0
                bra.w   loc_149E0
loc_14906:
                
                move.w  ((CURRENT_SHOP_SELECTION-$1000000)).w,d0
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1494A
                move.w  ((CURRENT_SHOP_PAGE-$1000000)).w,d2
                mulu.w  #ITEMS_PER_SHOP_PAGE,d2
                add.w   d0,d2
                ble.s   loc_1494A
                subq.w  #1,d0
                sndCom  SFX_MENU_SELECTION
                bge.s   loc_1493E
                subq.w  #1,((CURRENT_SHOP_PAGE-$1000000)).w
                move.w  #5,((CURRENT_SHOP_SELECTION-$1000000)).w
                move.b  #1,((word_FFAF9E-$1000000)).w
                bsr.w   sub_14E62
                bra.w   loc_149E0
loc_1493E:
                
                move.w  d0,((CURRENT_SHOP_SELECTION-$1000000)).w
                bsr.w   sub_14EC0
                bra.w   loc_149E0
loc_1494A:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1496A
                tst.w   ((CURRENT_SHOP_PAGE-$1000000)).w
                beq.s   loc_1496A
                subq.w  #1,((CURRENT_SHOP_PAGE-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                move.b  #1,((word_FFAF9E-$1000000)).w
                bsr.w   sub_14E62
loc_1496A:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_149C2
                move.w  ((CURRENT_SHOP_PAGE-$1000000)).w,d2
                addq.w  #1,d2
                mulu.w  #ITEMS_PER_SHOP_PAGE,d2
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d2
                bge.s   loc_149C2
                addq.w  #1,((CURRENT_SHOP_PAGE-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                move.w  ((CURRENT_SHOP_SELECTION-$1000000)).w,d0
                move.w  ((CURRENT_SHOP_PAGE-$1000000)).w,d2
                move.w  d2,d1           ; multiply page by 6
                add.w   d2,d2
                add.w   d1,d2
                add.w   d2,d2
                move.w  ((GENERIC_LIST_LENGTH-$1000000)).w,d1
                sub.w   d2,d1
                cmpi.w  #ITEMS_PER_SHOP_PAGE,d1
                ble.s   loc_149A8
                moveq   #ITEMS_PER_SHOP_PAGE,d1
loc_149A8:
                
                move.w  d1,((word_FFB134-$1000000)).w
loc_149AC:
                
                cmp.w   d1,d0
                blt.w   loc_149B6
                subq.w  #1,d0
                bne.s   loc_149AC
loc_149B6:
                
                move.w  d0,((CURRENT_SHOP_SELECTION-$1000000)).w
                clr.b   ((word_FFAF9E-$1000000)).w
                bsr.w   sub_14E62
loc_149C2:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_149EC
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_149F2
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_149F2
loc_149E0:
                
                bsr.w   sub_14A82
                jsr     (WaitForVInt).w
                bra.w   loc_148BC
loc_149EC:
                
                moveq   #-1,d0
                bra.w   loc_14A0A
loc_149F2:
                
                move.w  ((CURRENT_SHOP_PAGE-$1000000)).w,d1
                mulu.w  #ITEMS_PER_SHOP_PAGE,d1
                add.w   ((CURRENT_SHOP_SELECTION-$1000000)).w,d1
                lea     ((GENERIC_LIST-$1000000)).w,a0
                move.b  (a0,d1.w),d0
                andi.w  #BYTE_MASK,d0
loc_14A0A:
                
                movem.w d0-d1,-(sp)
                clr.w   d1
                bsr.s   sub_14A82
                move.w  ((DIALOGUE_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_14A26
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindow).l  
loc_14A26:
                
                move.w  inventoryWindowSlot(a6),d0
                move.w  #$2F7,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  itemNameAndPriceWindowSlot(a6),d0
                move.w  #$F606,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  goldWindowSlot(a6),d0
                move.w  #$2017,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                move.w  goldWindowSlot(a6),d0
                jsr     (DeleteWindow).l
                move.w  itemNameAndPriceWindowSlot(a6),d0
                jsr     (DeleteWindow).l
                move.w  inventoryWindowSlot(a6),d0
                jsr     (DeleteWindow).l
                movem.w (sp)+,d0-d1
                unlk    a6
                rts

    ; End of function BuildShopInventoryScreen


; =============== S U B R O U T I N E =======================================


sub_14A82:
                
                lea     (SPRITE_BATTLE_CURSOR).l,a0
                cmpi.w  #7,d1
                bge.s   loc_14A9A
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                bra.s   loc_14AAC
loc_14A9A:
                
                move.w  ((CURRENT_SHOP_SELECTION-$1000000)).w,d0
                lsl.w   #5,d0
                addi.w  #156,d0
                move.w  d0,VDPSPRITE_OFFSET_X(a0)
                move.w  #145,(a0)
loc_14AAC:
                
                move.w  #VDPSPRITESIZE_V4|VDPSPRITESIZE_H4|9,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #VDPTILE_PORTRAITTILE49|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a0
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                tst.w   ((CURRENT_SHOP_PAGE-$1000000)).w
                beq.s   loc_14AE6
                cmpi.w  #7,d1
                blt.s   loc_14ADA
                move.w  #152,VDPSPRITE_OFFSET_X(a0)
                move.w  #144,(a0)
loc_14ADA:
                
                move.w  #VDPSPRITESIZE_V1|VDPSPRITESIZE_H1|10,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #VDPTILE_PRIORITY|VDPTILE_PALETTE3|VDPTILE_FLIP|VDPTILE_V_ARROW,VDPSPRITE_OFFSET_TILE(a0)
loc_14AE6:
                
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a0
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                move.w  ((CURRENT_SHOP_PAGE-$1000000)).w,d0
                addq.w  #1,d0
                mulu.w  #ITEMS_PER_SHOP_PAGE,d0
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d0
                bge.s   loc_14B1E
                cmpi.w  #7,d1
                blt.s   loc_14B12
                move.w  #344,VDPSPRITE_OFFSET_X(a0)
                move.w  #168,(a0)
loc_14B12:
                
                move.w  #VDPSPRITESIZE_V1|VDPSPRITESIZE_H1|16,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #VDPTILE_PRIORITY|VDPTILE_PALETTE3|VDPTILE_V_ARROW,VDPSPRITE_OFFSET_TILE(a0)
loc_14B1E:
                
                subq.w  #1,d1
                bne.s   loc_14B24
                moveq   #20,d1
loc_14B24:
                
                bra.w   sub_101E6

    ; End of function sub_14A82


; =============== S U B R O U T I N E =======================================

; related to gold display

inventoryWindowLayoutLoadingSpace = -240
goldWindowLayoutEndAddress = -18
goldWindowSlot = -14
itemNameAndPriceWindowLayoutEndAddress = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowLayoutEndAddress = -6
inventoryWindowSlot = -2

WriteGoldAmount:
                
                move.w  #$904,d0
                movea.l goldWindowLayoutEndAddress(a6),a1
                bsr.w   WriteWindowTiles
                lea     aGold(pc), a0   
                movea.l goldWindowLayoutEndAddress(a6),a1
                adda.w  #$14,a1
                moveq   #-18,d1
                moveq   #10,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                jsr     j_GetGold
                move.l  d1,d0
                movea.l goldWindowLayoutEndAddress(a6),a1
                adda.w  #$26,a1 
                moveq   #7,d7
                jsr     WriteTilesFromNumber
                rts

    ; End of function WriteGoldAmount

aGold:          dc.b 'GOLD',0
                dc.b 0

; =============== S U B R O U T I N E =======================================

inventoryWindowLayoutLoadingSpace = -240
goldWindowLayoutEndAddress = -18
goldWindowSlot = -14
itemNameAndPriceWindowLayoutEndAddress = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowLayoutEndAddress = -6
inventoryWindowSlot = -2

WriteItemNameAndGoldAmount:
                
                move.w  #$A05,d0
                movea.l itemNameAndPriceWindowLayoutEndAddress(a6),a1
                bsr.w   WriteWindowTiles
                bsr.w   GetCurrentShopSelection
                move.w  d0,d1
                move.w  d1,-(sp)
                jsr     j_FindItemName
                movea.l itemNameAndPriceWindowLayoutEndAddress(a6),a1
                adda.w  #$16,a1
                moveq   #-20,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d1
                jsr     j_GetItemDefAddress
                clr.l   d0
                move.w  ITEMDEF_OFFSET_PRICE(a0),d0
                movea.l itemNameAndPriceWindowLayoutEndAddress(a6),a1
                adda.w  #$44,a1 
                moveq   #5,d7
                jsr     WriteTilesFromNumber
                rts

    ; End of function WriteItemNameAndGoldAmount


; =============== S U B R O U T I N E =======================================

; Load item icons and price tag tiles based on generic index list.

inventoryWindowLayoutLoadingSpace = -240
goldWindowLayoutEndAddress = -18
goldWindowSlot = -14
itemNameAndPriceWindowLayoutEndAddress = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowLayoutEndAddress = -6
inventoryWindowSlot = -2

LoadItemIconsAndPriceTagTiles:
                
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                lea     layout_ShopInventoryWindow(pc), a0
                move.w  #324,d7
                jsr     (CopyBytes).w   
                bsr.w   *+4
                lea     (byte_FF6942).l,a0
                move.w  #1599,d7
@Clear_Loop:
                
                move.l  #-1,(a0)+
                dbf     d7,@Clear_Loop
                
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  ((CURRENT_SHOP_PAGE-$1000000)).w,d0
                move.w  d0,d1           ; multiply page by 6
                add.w   d0,d0
                add.w   d1,d0
                add.w   d0,d0
                adda.w  d0,a1
                move.w  ((GENERIC_LIST_LENGTH-$1000000)).w,d1
                sub.w   d0,d1
                cmpi.w  #ITEMS_PER_SHOP_PAGE,d1
                ble.s   @loc_1
                moveq   #ITEMS_PER_SHOP_PAGE,d1
@loc_1:
                
                move.w  d1,((word_FFB134-$1000000)).w
                move.w  d1,d7
                subq.w  #1,d7
                lea     (FF6802_LOADING_SPACE).l,a0
                movea.l inventoryWindowLayoutEndAddress(a6),a2
                adda.w  #$3C,a2 
@Main_Loop:
                
                clr.w   d0
                move.b  (a1)+,d0
                move.w  d7,-(sp)
                bsr.w   LoadIconPixels  
                move.l  a0,-(sp)
                move.w  d0,d1
                jsr     j_GetItemDefAddress
                clr.l   d0
                move.w  ITEMDEF_OFFSET_PRICE(a0),d0
                movea.l (sp)+,a0
                bsr.w   LoadPriceTagTiles
                move.w  #VDPTILE_SHOP_PRICE_TAG_STRING|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a2)
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a2
                move.w  (sp)+,d7
                dbf     d7,@Main_Loop
                
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($B800).l,a1
                move.w  #$3C0,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                rts

    ; End of function LoadItemIconsAndPriceTagTiles


; =============== S U B R O U T I N E =======================================

; Load shop price tag pixels into space at a0.


LoadPriceTagTiles:
                
                movem.l a1-a2,-(sp)
                andi.l  #WORD_MASK,d0
                move.l  a0,-(sp)
                lea     tiles_PriceTagBlank(pc), a1
                moveq   #31,d7
@LoadBlankTiles_Loop:
                
                move.l  (a1)+,(a0)+
                dbf     d7,@LoadBlankTiles_Loop
                
                movea.l (sp)+,a0
                adda.w  #$14,a0
                jsr     (WriteAsciiNumber).w
                lea     ((byte_FFDE85-$1000000)).w,a2
                moveq   #4,d7
@Main_Loop:
                
                clr.w   d0
                move.b  (a2)+,d0
                cmpi.w  #$20,d0 
                beq.s   @Next
                
                subi.w  #$30,d0 
                mulu.w  #$14,d0
                lea     tiles_PriceTagNumbers(pc), a1
                adda.w  d0,a1
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                bra.s   @Continue
@Next:
                
                adda.w  #$14,a0
@Continue:
                
                dbf     d7,@Main_Loop
                
                addq.w  #8,a0
                movem.l (sp)+,a1-a2
                rts

    ; End of function LoadPriceTagTiles


; =============== S U B R O U T I N E =======================================

; Load icon pixels for item d1.w to loading space in a0.


LoadIconPixels:
                
                move.l  a1,-(sp)
                move.w  d0,-(sp)
                getPointer p_Icons, a1
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                lsl.w   #6,d0
                addIconOffset d0, a1
                moveq   #ICON_PIXELS_LONGWORD_COUNTER,d7 
@Loop:
                
                move.l  (a1)+,(a0)+
                dbf     d7,@Loop
                
                ori.w   #$F,-2(a0)
                ori.w   #$F000,-$24(a0)
                ori.w   #$F,-$9E(a0)
                ori.w   #$F000,-$C0(a0)
                move.w  (sp)+,d0
                movea.l (sp)+,a1
                rts

    ; End of function LoadIconPixels


; =============== S U B R O U T I N E =======================================

; Get index of currently selected item in shop/caravan (from index list) -> d0.w


GetCurrentShopSelection:
                
                move.w  ((CURRENT_SHOP_PAGE-$1000000)).w,d0
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                add.w   d0,d0           ; index effectively multiplied by 6 (i.e. number of items per page)
                move.w  ((CURRENT_SHOP_SELECTION-$1000000)).w,d1
                add.w   d1,d0
                lea     ((GENERIC_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                andi.w  #BYTE_MASK,d0
                rts

    ; End of function GetCurrentShopSelection


; =============== S U B R O U T I N E =======================================

inventoryWindowLayoutLoadingSpace = -240
goldWindowLayoutEndAddress = -18
goldWindowSlot = -14
itemNameAndPriceWindowLayoutEndAddress = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowLayoutEndAddress = -6
inventoryWindowSlot = -2

sub_14D0C:
                
                bsr.w   *+4
                movea.l inventoryWindowLayoutEndAddress(a6),a0
                movea.l a0,a1
                adda.w  #$A2,a0 
                adda.w  #$36,a1 
                move.w  #108,d7
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayoutSpacerLine(pc), a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$A2,a1 
                move.w  #54,d7
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayoutSpacerLine(pc), a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$D8,a1 
                jsr     (CopyBytes).w   
loc_14D4A:
                
                move.w  inventoryWindowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                move.w  itemNameAndPriceWindowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                jmp     (WaitForVInt).w

    ; End of function sub_14D0C


; =============== S U B R O U T I N E =======================================

inventoryWindowLayoutLoadingSpace = -240
goldWindowLayoutEndAddress = -18
goldWindowSlot = -14
itemNameAndPriceWindowLayoutEndAddress = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowLayoutEndAddress = -6
inventoryWindowSlot = -2

sub_14D6A:
                
                lea     ShopInventoryWindowLayoutSpacerLine(pc), a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$36,a1 
                move.w  #54,d7
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayoutSpacerLine(pc), a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$6C,a1 
                move.w  #54,d7
                jsr     (CopyBytes).w   
                lea     inventoryWindowLayoutLoadingSpace(a6),a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$A2,a1 
                move.w  #108,d7
                jsr     (CopyBytes).w   
                bsr.w   sub_14DBE
                lea     inventoryWindowLayoutLoadingSpace(a6),a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$36,a1 
                move.w  #216,d7
                jsr     (CopyBytes).w   

    ; End of function sub_14D6A


; =============== S U B R O U T I N E =======================================


sub_14DBE:
                
                bra.s   loc_14D4A

    ; End of function sub_14DBE


; =============== S U B R O U T I N E =======================================

inventoryWindowLayoutLoadingSpace = -240
goldWindowLayoutEndAddress = -18
goldWindowSlot = -14
itemNameAndPriceWindowLayoutEndAddress = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowLayoutEndAddress = -6
inventoryWindowSlot = -2

sub_14DC0:
                
                bsr.w   *+4
                movea.l inventoryWindowLayoutEndAddress(a6),a0
                movea.l a0,a1
                adda.w  #$36,a0 
                adda.w  #$A2,a1 
                move.w  #108,d7
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayoutSpacerLine(pc), a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$36,a1 
                move.w  #54,d7
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayoutSpacerLine(pc), a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$6C,a1 
                move.w  #54,d7
                jsr     (CopyBytes).w   
                bra.w   loc_14D4A

    ; End of function sub_14DC0


; =============== S U B R O U T I N E =======================================

inventoryWindowLayoutLoadingSpace = -240
goldWindowLayoutEndAddress = -18
goldWindowSlot = -14
itemNameAndPriceWindowLayoutEndAddress = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowLayoutEndAddress = -6
inventoryWindowSlot = -2

sub_14E06:
                
                lea     ShopInventoryWindowLayoutSpacerLine(pc), a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$A2,a1 
                move.w  #54,d7
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayoutSpacerLine(pc), a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$D8,a1 
                move.w  #54,d7
                jsr     (CopyBytes).w   
                lea     inventoryWindowLayoutLoadingSpace(a6),a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$6C,a0 
                adda.w  #$36,a1 
                move.w  #108,d7
                jsr     (CopyBytes).w   
                bsr.w   sub_14E5E
                lea     inventoryWindowLayoutLoadingSpace(a6),a0
                movea.l inventoryWindowLayoutEndAddress(a6),a1
                adda.w  #$36,a1 
                move.w  #216,d7
                jsr     (CopyBytes).w   

    ; End of function sub_14E06


; =============== S U B R O U T I N E =======================================


sub_14E5E:
                
                bra.w   loc_14D4A

    ; End of function sub_14E5E


; =============== S U B R O U T I N E =======================================

inventoryWindowLayoutLoadingSpace = -240
goldWindowLayoutEndAddress = -18
goldWindowSlot = -14
itemNameAndPriceWindowLayoutEndAddress = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowLayoutEndAddress = -6
inventoryWindowSlot = -2

sub_14E62:
                
                movea.l inventoryWindowLayoutEndAddress(a6),a0
                adda.w  #$36,a0 
                lea     inventoryWindowLayoutLoadingSpace(a6),a1
                move.w  #216,d7
                jsr     (CopyBytes).w   
                tst.b   ((word_FFAF9E-$1000000)).w
                bne.s   loc_14E82
                bsr.w   sub_14D0C
                bra.s   loc_14E86
loc_14E82:
                
                bsr.w   sub_14DC0
loc_14E86:
                
                bsr.w   LoadItemIconsAndPriceTagTiles
                movea.l inventoryWindowLayoutEndAddress(a6),a0
                adda.w  #$36,a0 
                lea     inventoryWindowLayoutLoadingSpace(a6),a1
                move.w  #216,d7
                jsr     (CopyBytes).w   
                tst.b   ((word_FFAF9E-$1000000)).w
                bne.s   loc_14EAA
                bsr.w   sub_14D6A
                bra.s   loc_14EAE
loc_14EAA:
                
                bsr.w   sub_14E06
loc_14EAE:
                
                move.w  inventoryWindowSlot(a6),d0
                move.w  #$201,d1
                moveq   #4,d2
                jsr     (MoveWindow).l  
                bra.s   sub_14EDE

    ; End of function sub_14E62


; =============== S U B R O U T I N E =======================================

inventoryWindowLayoutLoadingSpace = -240
goldWindowLayoutEndAddress = -18
goldWindowSlot = -14
itemNameAndPriceWindowLayoutEndAddress = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowLayoutEndAddress = -6
inventoryWindowSlot = -2

sub_14EC0:
                
                move.w  itemNameAndPriceWindowSlot(a6),d0
                move.w  #$2000,d1
                jsr     (SetWindowDestination).l
                move.w  inventoryWindowSlot(a6),d0
                move.w  #$201,d1
                moveq   #4,d2
                jsr     (MoveWindow).l  

    ; End of function sub_14EC0


; =============== S U B R O U T I N E =======================================


sub_14EDE:
                
                bsr.w   WriteItemNameAndGoldAmount
                move.w  -8(a6),d0
                move.w  ((CURRENT_SHOP_SELECTION-$1000000)).w,d1
                ror.w   #6,d1
                ori.w   #$106,d1
                moveq   #4,d2
                jsr     (MoveWindow).l  
                moveq   #$A,d1
                rts

    ; End of function sub_14EDE

tiles_PriceTagBlank:
                incbin "data/graphics/tech/pricetagblanktiles.bin"
tiles_PriceTagNumbers:
                incbin "data/graphics/tech/pricetagnumberstiles.bin"
layout_ShopInventoryWindow:
                
; Syntax        vdpBaseTile [VDPTILE_]enum[|MIRROR|FLIP]
;
; Notes: PALETTE3 and PRIORITY bits are always set.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 1st line
                vdpBaseTile CORNER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile CORNER|MIRROR
                
; 2nd line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile DOLLAR_SIGN
                vdpBaseTile MENUTILE7
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE17
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE27
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE37
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE47
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE57
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 3rd line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE1
                vdpBaseTile MENUTILE2
                vdpBaseTile MENUTILE8
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE11
                vdpBaseTile MENUTILE12
                vdpBaseTile MENUTILE18
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE21
                vdpBaseTile MENUTILE22
                vdpBaseTile MENUTILE28
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE31
                vdpBaseTile MENUTILE32
                vdpBaseTile MENUTILE38
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE41
                vdpBaseTile MENUTILE42
                vdpBaseTile MENUTILE48
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE51
                vdpBaseTile MENUTILE52
                vdpBaseTile MENUTILE58
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 4th line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE3
                vdpBaseTile MENUTILE4
                vdpBaseTile MENUTILE9
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE13
                vdpBaseTile MENUTILE14
                vdpBaseTile MENUTILE19
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE23
                vdpBaseTile MENUTILE24
                vdpBaseTile MENUTILE29
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE33
                vdpBaseTile MENUTILE34
                vdpBaseTile MENUTILE39
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE43
                vdpBaseTile MENUTILE44
                vdpBaseTile MENUTILE49
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE53
                vdpBaseTile MENUTILE54
                vdpBaseTile MENUTILE59
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 5th line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE5
                vdpBaseTile MENUTILE6
                vdpBaseTile MENUTILE10
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE15
                vdpBaseTile MENUTILE16
                vdpBaseTile MENUTILE20
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE25
                vdpBaseTile MENUTILE26
                vdpBaseTile MENUTILE30
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE35
                vdpBaseTile MENUTILE36
                vdpBaseTile MENUTILE40
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE45
                vdpBaseTile MENUTILE46
                vdpBaseTile MENUTILE50
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE55
                vdpBaseTile MENUTILE56
                vdpBaseTile MENUTILE60
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 6th line
                vdpBaseTile CORNER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile CORNER|MIRROR|FLIP
ShopInventoryWindowLayoutSpacerLine:
                
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
tiles_ShopInventoryItemHighlight:
                incbin "data/graphics/tech/shopinventoryitemhighlighttiles.bin"

; =============== S U B R O U T I N E =======================================

; unused code

sub_15268:
                
                lea     (byte_FFCC86).l,a0
                move.l  #$C020C020,-$50(a0)
                moveq   #$C,d7
loc_15278:
                
                move.l  #$C020C020,(a0)+
                dbf     d7,loc_15278
                rts

    ; End of function sub_15268


; =============== S U B R O U T I N E =======================================


YesNoPrompt:
                
                clr.w   d0
                move.b  ((PLAYER_1_INPUT-$1000000)).w,d0
                bra.s   loc_1528E

    ; End of function YesNoPrompt


; =============== S U B R O U T I N E =======================================

windowLayoutEndAddress = -6
windowSlot = -2

alt_YesNoPrompt:
                
                clr.w   d0
loc_1528E:
                
                movem.l d1-a1,-(sp)
                link    a6,#-6
                move.w  d0,-(sp)
                move.w  #$E03,d0
                move.w  #$2011,d1
                jsr     (CreateWindow).w
                move.w  d0,windowSlot(a6)
                move.l  a1,windowLayoutEndAddress(a6)
                getPointer p_tiles_YesNoPrompt, a0
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                clr.b   ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bsr.w   LoadYesNoPromptLayout
                clr.w   d6
                bsr.w   sub_1542A
                bsr.w   sub_1544A
                move.w  windowSlot(a6),d0
                move.w  #$C11,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  ((DIALOGUE_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_152F0
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_152F0:
                
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_15302
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_15302:
                
                jsr     (WaitForWindowMovementEnd).w
                move.w  (sp)+,d0
                beq.w   loc_15312
loc_1530C:
                
                tst.b   ((PLAYER_1_INPUT-$1000000)).w
                bne.s   loc_1530C
loc_15312:
                
                moveq   #$F,d6
loc_15314:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_15328
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15378
loc_15328:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_1533C
                moveq   #-1,d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15378
loc_1533C:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_15350
                moveq   #-1,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bra.w   loc_153D6
loc_15350:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_15364
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_153D6
loc_15364:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_153C0
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_153D6
loc_15378:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_15422       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bsr.w   LoadYesNoPromptLayout
                move.w  windowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                move.w  ((DIALOGUE_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_153AC
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
loc_153AC:
                
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_153BE
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_153BE:
                
                moveq   #$13,d6
loc_153C0:
                
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_15422       
                subq.w  #1,d6
                bne.s   loc_153CE
                moveq   #$14,d6
loc_153CE:
                
                jsr     (WaitForVInt).w
                bra.w   loc_15314
loc_153D6:
                
                move.w  windowSlot(a6),d0
                move.w  #$F011,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  ((DIALOGUE_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_153F6
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_153F6:
                
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_15408
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_15408:
                
                jsr     (WaitForWindowMovementEnd).w
                move.w  windowSlot(a6),d0
                jsr     (DeleteWindow).w
                unlk    a6
                movem.l (sp)+,d1-a1
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                ext.w   d0
                rts

    ; End of function alt_YesNoPrompt


; =============== S U B R O U T I N E =======================================

; related to DMA
; 
; In: d0.b = current diamond menu choice


sub_15422:
                
                andi.w  #1,d0
                bne.w   sub_1544A

    ; End of function sub_15422


; =============== S U B R O U T I N E =======================================


sub_1542A:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                cmpi.w  #$A,d6
                blt.s   loc_1543A
                adda.w  #$120,a0
loc_1543A:
                
                lea     ($B800).l,a1
                move.w  #$90,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function sub_1542A


; =============== S U B R O U T I N E =======================================


sub_1544A:
                
                lea     (FF8A44_LOADING_SPACE).l,a0
                cmpi.w  #$A,d6
                blt.s   loc_1545A
                adda.w  #$120,a0
loc_1545A:
                
                lea     ($B920).l,a1
                move.w  #$90,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function sub_1544A


; =============== S U B R O U T I N E =======================================

windowLayoutEndAddress = -6
windowSlot = -2

LoadYesNoPromptLayout:
                
                movea.l windowLayoutEndAddress(a6),a1
                lea     layout_YesNoPromptMenu(pc), a0
                move.w  #84,d7
                jsr     (CopyBytes).w   
                tst.b   ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bne.s   loc_15486
                lea     s_Yes(pc), a0   
                bra.s   loc_1548A
loc_15486:
                
                lea     s_No(pc), a0    
loc_1548A:
                
                movea.l windowLayoutEndAddress(a6),a1
                adda.w  #48,a1
                moveq   #-28,d1
                moveq   #3,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                rts

    ; End of function LoadYesNoPromptLayout

s_Yes:          dc.b 'Yes'
s_No:           dc.b 'No '
layout_YesNoPromptMenu:
                
; Syntax        vdpTile [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 1st line
                vdpTile MENUTILE1|PALETTE3|PRIORITY
                vdpTile MENUTILE2|PALETTE3|PRIORITY
                vdpTile MENUTILE3|PALETTE3|PRIORITY
                vdpTile 
                vdpTile 
                vdpTile MENUTILE10|PALETTE3|PRIORITY
                vdpTile MENUTILE11|PALETTE3|PRIORITY
                vdpTile MENUTILE12|PALETTE3|PRIORITY
                vdpTile 
                vdpTile CORNER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|PALETTE3|PRIORITY
                
; 2nd line
                vdpTile MENUTILE4|PALETTE3|PRIORITY
                vdpTile MENUTILE5|PALETTE3|PRIORITY
                vdpTile MENUTILE6|PALETTE3|PRIORITY
                vdpTile 
                vdpTile 
                vdpTile MENUTILE13|PALETTE3|PRIORITY
                vdpTile MENUTILE14|PALETTE3|PRIORITY
                vdpTile MENUTILE15|PALETTE3|PRIORITY
                vdpTile 
                vdpTile V_BORDER|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 3rd line
                vdpTile MENUTILE7|PALETTE3|PRIORITY
                vdpTile MENUTILE8|PALETTE3|PRIORITY
                vdpTile MENUTILE9|PALETTE3|PRIORITY
                vdpTile 
                vdpTile 
                vdpTile MENUTILE16|PALETTE3|PRIORITY
                vdpTile MENUTILE17|PALETTE3|PRIORITY
                vdpTile MENUTILE18|PALETTE3|PRIORITY
                vdpTile 
                vdpTile CORNER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|FLIP|PALETTE3|PRIORITY

; =============== S U B R O U T I N E =======================================

; Close princess Elis's eyes when unconscious


ClosePortraitEyes:
                
                clr.b   ((BLINK_CONTROL_TOGGLE-$1000000)).w
                jsr     (WaitForVInt).w
                move.w  d0,-(sp)
                btst    #0,d0
                bne.s   loc_1550A
                clr.w   d1
                bra.s   loc_1550C
loc_1550A:
                
                moveq   #1,d1
loc_1550C:
                
                lea     ((BLINK_DATA-$1000000)).w,a2
                move.w  ((BLINK_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                move.w  (sp)+,d0
                btst    #1,d0
                bne.s   loc_15524
                clr.w   d1
                bra.s   loc_15526
loc_15524:
                
                moveq   #1,d1
loc_15526:
                
                lea     ((MOUTH_DATA-$1000000)).w,a2
                move.w  ((MOUTH_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                rts

    ; End of function ClosePortraitEyes


; =============== S U B R O U T I N E =======================================


VInt_PerformPortraitBlinking:
                
                tst.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                beq.w   @Return
                tst.b   ((BLINK_CONTROL_TOGGLE-$1000000)).w
                beq.w   @Return
                
                lea     ((BLINK_COUNTER-$1000000)).w,a0
                subq.w  #1,(a0)
                cmpi.w  #3,(a0)
                bne.s   @loc_1
                
                moveq   #1,d1
                lea     ((BLINK_DATA-$1000000)).w,a2
                move.w  ((BLINK_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
@loc_1:
                
                tst.w   (a0)
                bne.s   @loc_2
                clr.w   d1
                lea     ((BLINK_DATA-$1000000)).w,a2
                move.w  ((BLINK_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                moveq   #120,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #30,d7
                move.w  d7,(a0)
@loc_2:
                
                lea     ((word_FFB07C-$1000000)).w,a0
                tst.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                bne.s   @loc_3
                cmpi.w  #5,(a0)
                ble.s   @loc_5
                bra.s   @Return
@loc_3:
                
                subq.w  #1,(a0)
                cmpi.w  #5,(a0)
                bne.s   @loc_4
                moveq   #1,d1
                lea     ((MOUTH_DATA-$1000000)).w,a2
                move.w  ((MOUTH_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
@loc_4:
                
                tst.w   (a0)
                bne.s   @Return
@loc_5:
                
                clr.w   d1
                lea     ((MOUTH_DATA-$1000000)).w,a2
                move.w  ((MOUTH_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                moveq   #5,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$A,d7
                move.w  d7,(a0)
@Return:
                
                rts

    ; End of function VInt_PerformPortraitBlinking


; =============== S U B R O U T I N E =======================================

; In: d1.w = 0 to use original tiles, 1 to use alternate tiles
;     d7.w = tiles number


UpdatePortrait:
                
                bne.s   @Continue       ; skip if tiles number = 0
                rts
@Continue:
                
                move.w  d1,-(sp)
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$101,d1
                jsr     (GetWindowTileAddress).w
                move.w  (sp)+,d1
                subq.w  #1,d7
@Loop:
                
                move.w  d7,-(sp)
                clr.w   d0
                clr.w   d5
                clr.w   d6
                move.b  (a2)+,d5
                move.b  (a2)+,d6
                lsl.w   #3,d6
                add.w   d5,d6
                move.b  (a2)+,d5
                move.b  (a2)+,d0
                lsl.w   #3,d0
                add.w   d5,d0
                
                ; Use alternate tiles?
                tst.w   d1
                bne.s   @UseAlternateTiles
                move.w  d6,d0
@UseAlternateTiles:
                
                or.w    ((PORTRAIT_VDPTILES-$1000000)).w,d0
                tst.b   ((PORTRAIT_IS_MIRRORED_TOGGLE-$1000000)).w
                beq.s   @NotMirrored
                
                ; Mirror portrait
                eori.w  #7,d6
                subq.l  #2,d6
                ori.w   #$800,d0
@NotMirrored:
                
                add.w   d6,d6
                move.w  d0,(a1,d6.w)
                move.w  (sp)+,d7
                dbf     d7,@Loop
                
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                rts

    ; End of function UpdatePortrait


; =============== S U B R O U T I N E =======================================

; In: d0.w = portrait index


LoadPortrait:
                
                movem.l d0-a3,-(sp)
                getPointer p_pt_Portraits, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                move.w  (a0)+,d0
                move.w  d0,((BLINK_TILES_NUMBER-$1000000)).w
                beq.s   loc_1564E
                subq.w  #1,d0
                lea     ((BLINK_DATA-$1000000)).w,a1
loc_15648:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_15648
loc_1564E:
                
                move.w  (a0)+,d0
                move.w  d0,((MOUTH_TILES_NUMBER-$1000000)).w
                beq.s   loc_15662
                subq.w  #1,d0
                lea     ((MOUTH_DATA-$1000000)).w,a1
loc_1565C:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_1565C
loc_15662:
                
                lea     (PALETTE_2_CURRENT).l,a1
                lea     (PALLETE_2_BASE).l,a2
                lea     ((PALETTE_2_BACKUP-$1000000)).w,a3
                moveq   #7,d7
loc_15674:
                
                move.l  (a0),(a1)+
                move.l  (a0),(a2)+
                move.l  (a0)+,(a3)+
                dbf     d7,loc_15674
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                addq.b  #6,((INPUT_REPEAT_DELAYER-$1000000)).w ; Allow hold input to be applied directly. ... why ?
                movea.l a1,a0
                lea     ($F800).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (ApplyVIntCramDma).w
                movem.l (sp)+,d0-a3
                rts

    ; End of function LoadPortrait

