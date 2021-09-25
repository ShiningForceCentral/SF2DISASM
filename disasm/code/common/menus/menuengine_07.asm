
; ASM FILE code\common\menus\menuengine_07.asm :
; 0x137AC..0x15736 : Menu engine

; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
memberListWindow = -4
selectedMember = -2

sub_137AC:
                
                move.w  memberSummaryWindow(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  selectedMember(a6),d0

    ; End of function sub_137AC


; =============== S U B R O U T I N E =======================================

windowTilesAddress = -6
combatant = -2

BuildMemberSummaryWindow:
                
                link    a6,#-6
                move.w  d0,combatant(a6)
                move.l  a1,windowTilesAddress(a6)
                move.w  #WINDOW_MEMBERSUMMARY_SIZE,d0
                bsr.w   CopyWindowTilesToRam
                move.w  combatant(a6),d0
                jsr     j_GetCombatantName
                movea.l windowTilesAddress(a6),a1
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
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_OFFSET_STATUSEFFECT_TILES,a1
                
                if (THREE_DIGITS_STATS|FULL_CLASS_NAMES>=1)
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
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@Poison:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_POISON,d2
                beq.s   @Muddle
                move.l  #VDPTILES_STATUSEFFECT_POISON,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@Muddle:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_MUDDLE,d2
                beq.s   @Silence
                move.l  #VDPTILES_STATUSEFFECT_MUDDLE,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@Silence:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SILENCE,d2
                beq.s   @Stun
                move.l  #VDPTILES_STATUSEFFECT_SILENCE,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@Stun:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_STUN,d2
                beq.s   @Sleep
                move.l  #VDPTILES_STATUSEFFECT_STUN,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@Sleep:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLEEP,d2
                beq.s   @Attack
                move.l  #VDPTILES_STATUSEFFECT_SLEEP,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@Attack:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_ATTACK,d2
                beq.s   @Boost
                move.l  #VDPTILES_STATUSEFFECT_ATTACK,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@Boost:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_BOOST,d2
                beq.s   @Slow
                move.l  #VDPTILES_STATUSEFFECT_BOOST,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@Slow:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLOW,d2
                beq.s   @DetermineMiniStatusPage
                move.l  #VDPTILES_STATUSEFFECT_SLOW,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@DetermineMiniStatusPage:
                
                if (THREE_DIGITS_STATS|FULL_CLASS_NAMES>=1)
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

windowTilesAddress = -6
combatant = -2

WriteMemberMiniStatus:
                
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MEMBERPAGE_OFFSET_MAGICITEM_STRING,a1
                lea     aMagicItem(pc), a0
                moveq   #-42,d1
                moveq   #14,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MEMBERPAGE_OFFSET_MAGICLIST_START,a1
                bsr.w   WriteMemberMagicList
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MEMBERPAGE_OFFSET_ITEMSLIST_START,a1
                bsr.w   WriteMemberItemsList
                rts

    ; End of function WriteMemberMiniStatus


; =============== S U B R O U T I N E =======================================

windowTilesAddress = -6
combatant = -2

WriteItemsMiniStatus:
                
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_ITEMSPAGE_OFFSET_ITEM_STRING,a1
                lea     aItem_3(pc), a0 
                moveq   #-42,d1
                moveq   #8,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_ITEMSPAGE_OFFSET_ITEMSLIST_START,a1
                bsr.w   WriteMemberItemsList
                bsr.w   DrawMemberItemsIconsCross
                rts

    ; End of function WriteItemsMiniStatus


; =============== S U B R O U T I N E =======================================

windowTilesAddress = -6
combatant = -2

WriteMagicMiniStatus:
                
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MAGICPAGE_OFFSET_MAGIC_STRING,a1
                lea     aMagic_2(pc), a0
                moveq   #-42,d1
                moveq   #7,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MAGICPAGE_OFFSET_MAGICLIST_START,a1
                bsr.w   WriteMemberMagicList
                bsr.w   DrawMemberMagicIconsCross
                rts

    ; End of function WriteMagicMiniStatus


; =============== S U B R O U T I N E =======================================

windowTilesAddress = -6
combatant = -2

WriteEquipMiniStatus:
                
                movea.l windowTilesAddress(a6),a1
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
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIPPAGE_OFFSET_ATT_STRING,a1
                lea     aAtt(pc), a0    
                moveq   #7,d7
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant(a6),d0
                jsr     j_GetCurrentATT
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIPPAGE_OFFSET_DEF_STRING,a1
                lea     aDef(pc), a0    
                moveq   #8,d7
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant(a6),d0
                jsr     j_GetCurrentDEF
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIPPAGE_OFFSET_AGI_STRING,a1
                lea     aAgi(pc), a0    
                moveq   #6,d7
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant(a6),d0
                jsr     j_GetCurrentAGI
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIPPAGE_OFFSET_MOV_STRING,a1
                lea     aMov(pc), a0    
                moveq   #8,d7
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant(a6),d0
                jsr     j_GetCurrentMOV
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                bra.w   loc_13C36
                rts

    ; End of function WriteEquipMiniStatus


; =============== S U B R O U T I N E =======================================

windowTilesAddress = -6
combatant = -2

WriteMemberMagicList:
                
                module
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
                
                if (EXTENDED_SPELL_NAMES=0)
                move.w  #VDPTILE_UPPERCASE_L|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  #VDPTILE_LOWERCASE_E|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  #VDPTILE_LOWERCASE_V|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  #VDPTILE_LOWERCASE_E|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  #VDPTILE_LOWERCASE_L|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  #VDPTILE_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                endif
                
                lsr.w   #6,d1
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
                
                if (EXTENDED_SPELL_NAMES>=1)
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

windowTilesAddress = -6
combatant = -2

WriteMemberItemsList:
                
                move.w  combatant(a6),d0
                clr.w   d1
                jsr     j_GetItemAndNumberHeld
                tst.w   d2
                beq.w   @NoItems
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d6
@Items_Loop:
                
                move.w  combatant(a6),d0
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d1
                sub.w   d6,d1
                jsr     j_GetItemAndNumberHeld
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

                modend

; =============== S U B R O U T I N E =======================================


LoadItemIcon:
                
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                movea.l (p_Icons).l,a0
                bra.w   LoadIcon

    ; End of function LoadItemIcon


; =============== S U B R O U T I N E =======================================


LoadSpellIcon:
                
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                movea.l (p_Icons).l,a0
                cmpi.w  #SPELL_NOTHING,d1
                bne.s   loc_13B7E
                move.w  #ICON_NOTHING,d1
                bra.s   LoadIcon
loc_13B7E:
                
                addi.w  #ICON_SPELLS_START,d1

    ; End of function LoadSpellIcon


; START OF FUNCTION CHUNK FOR LoadItemIcon

LoadIcon:
                
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    adda.l  d1,a0
                else
                    adda.w  d1,a0           ; icon offset
                endif
                moveq   #$2F,d7 
loc_13B8E:
                
                move.l  (a0)+,(a1)+
                dbf     d7,loc_13B8E
                ori.w   #$F,-2(a1)
                ori.w   #$F000,-$24(a1)
                ori.w   #$F,-$9E(a1)
                ori.w   #$F000,-$C0(a1)
                rts

; END OF FUNCTION CHUNK FOR LoadItemIcon


; =============== S U B R O U T I N E =======================================

windowTilesAddress = -6
combatant = -2

DrawMemberItemsIconsCross:
                
                move.w  combatant(a6),d0
                lea     (FF6802_LOADING_SPACE).l,a1
                clr.w   d1
                jsr     j_GetItemAndNumberHeld
                bsr.s   LoadItemIcon
                moveq   #1,d1
                jsr     j_GetItemAndNumberHeld
                bsr.s   LoadItemIcon
                moveq   #2,d1
                jsr     j_GetItemAndNumberHeld
                bsr.s   LoadItemIcon
                moveq   #3,d1
                jsr     j_GetItemAndNumberHeld
                bsr.w   LoadItemIcon
                bra.w   loc_13C20

    ; End of function DrawMemberItemsIconsCross


; =============== S U B R O U T I N E =======================================

windowTilesAddress = -6
combatant = -2

DrawMemberMagicIconsCross:
                
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
                move.w  #$180,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
loc_13C36:
                
                movea.l windowTilesAddress(a6),a1
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

    ; End of function DrawMemberMagicIconsCross


; =============== S U B R O U T I N E =======================================


CopyWindowTilesToRam:
                
                movem.w d0-d1/d6-d7,-(sp)
                clr.w   d1
                move.b  d0,d1
                lsr.w   #8,d0
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

    ; End of function CopyWindowTilesToRam

                if (THREE_DIGITS_STATS=0)
                    if (EIGHT_CHARACTERS_MEMBER_NAMES=0)
aNameClassLevExp:   dc.b 'NAME    CLASS     LEV EXP',0
aNameHpMpAtDfAgMv:  dc.b 'NAME    HP MP AT DF AG MV',0
aNameAttackDefense: dc.b 'NAME    ATTACK   DEFENSE',0
                    else
aNameClassLevExp:   dc.b 'NAME     CLASS     LEV EXP'
aNameHpMpAtDfAgMv:  dc.b 'NAME     HP MP AT DF AG MV'
aNameAttackDefense: dc.b 'NAME     ATTACK   DEFENSE',0
                    endif
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
                
                wordAlign               ; make sure tiles data is word aligned in case patches are applied
                
TextHighlightTiles:
                incbin "data/graphics/tech/texthighlighttiles.bin"
word_13EDE:     
; Syntax        vdpBaseTile [VDPTILE_]enum[|MIRROR|FLIP]
;
; Notes: PALETTE3 and PRIORITY bits are always set.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                vdpBaseTile SPACE       ; window layout
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
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                clr.b   ((CURRENT_DIAMENU_CHOICE-$1000000)).w
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
                move.b  #$FF,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bra.w   loc_14052
loc_13FFA:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1400C
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_14052
loc_1400C:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14034
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_14052
loc_1401E:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_14074       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                moveq   #$1D,d6
loc_14034:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_14074       
                moveq   #$14,d1
                bsr.w   LoadMiniStatusTextHighlightSprites
                subq.w  #1,d6
                bne.s   loc_1404A
                moveq   #$1E,d6
loc_1404A:
                
                jsr     (WaitForVInt).w
                bra.w   loc_13F88
loc_14052:
                
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   loc_14062
                sndCom  SFX_VALIDATION
                moveq   #$FFFFFFFF,d1
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

; related to menu choice


sub_14074:
                
                moveq   #$7F,d7 
                add.w   d0,d0           ; d0 is current diamond-menu choice
                move.w  rjt_14080(pc,d0.w),d0
                jmp     rjt_14080(pc,d0.w)

    ; End of function sub_14074

rjt_14080:      dc.w DmaIcon1-rjt_14080
                dc.w DmaIcon2-rjt_14080
                dc.w DmaIcon3-rjt_14080
                dc.w DmaIcon4-rjt_14080

; =============== S U B R O U T I N E =======================================


DmaIcon1:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_14098
                adda.w  #$C0,a0 
loc_14098:
                
                lea     ($BC00).l,a1
                move.w  #$60,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function DmaIcon1


; =============== S U B R O U T I N E =======================================


DmaIcon2:
                
                lea     (byte_FF8984).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_140B8
                adda.w  #$C0,a0 
loc_140B8:
                
                lea     ($BCC0).l,a1
                move.w  #$60,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function DmaIcon2


; =============== S U B R O U T I N E =======================================


DmaIcon3:
                
                lea     (byte_FF8B04).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_140D8
                adda.w  #$C0,a0 
loc_140D8:
                
                lea     ($BD80).l,a1
                move.w  #$60,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function DmaIcon3


; =============== S U B R O U T I N E =======================================


DmaIcon4:
                
                lea     (byte_FF8C84).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_140F8
                adda.w  #$C0,a0 
loc_140F8:
                
                lea     ($BE40).l,a1
                move.w  #$60,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function DmaIcon4


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
                bsr.w   sub_141CE       
                tst.w   d1
                bpl.s   @EquipWeapon    ; branch based on returned diamenu choice
                moveq   #WINDOW_MEMBERSUMMARY_PAGE_ITEMS,d7
                bsr.w   RefreshMemberSummaryWindow
                jsr     (WaitForWindowMovementEnd).w
                bra.w   @Done
@EquipWeapon:
                
                lsl.w   #2,d1
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
                bsr.w   sub_141CE       
                tst.w   d1
                bpl.s   @EquipRing      ; branch based on returned diamenu choice
                jsr     j_GetEquippableWeapons
                tst.w   d1
                bne.s   @GoToWeapons
                moveq   #WINDOW_MEMBERSUMMARY_PAGE_ITEMS,d7
                bsr.w   RefreshMemberSummaryWindow
                jsr     (WaitForWindowMovementEnd).w
                moveq   #$FFFFFFFF,d1
                bra.w   @Done
@GoToWeapons:
                
                bra.w   @Weapons
@EquipRing:
                
                lsl.w   #2,d1
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
memberListWindow = -4
selectedMember = -2

sub_141CE:
                
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
                moveq   #$FFFFFFFF,d1
loc_141F0:
                
                addq.w  #1,d1
                addq.l  #2,a0
                move.w  (a0)+,d4
                cmp.w   d2,d4
                dbeq    d7,loc_141F0
                movea.l (sp)+,a0
loc_141FE:
                
                move.b  d1,((CURRENT_DIAMENU_CHOICE-$1000000)).w
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
                bsr.w   DmaIcon1
                bsr.w   DmaIcon2
                bsr.w   DmaIcon3
                bsr.w   DmaIcon4
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
                move.b  #$FF,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bra.w   loc_1438C
loc_142D6:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_142E8
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_1438C
loc_142E8:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14366
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_1438C
loc_142FA:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_14074       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                move.w  d0,d2
                move.w  selectedMember(a6),d0
                lsl.w   #2,d2
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
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_14074       
                moveq   #$14,d1
                bsr.w   LoadMiniStatusTextHighlightSprites
                
                if (EIGHT_CHARACTERS_MEMBER_NAMES=0)
                move.b  #16,(SPRITE_09_LINK).l
                else
                move.b  #16,(SPRITE_10_LINK).l
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
                lsl.w   #2,d1
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a0
                move.w  2(a0,d1.w),d1
                cmpi.w  #COMBATANT_ITEMSLOTS,d1
                bge.s   loc_143C4
                jsr     j_EquipItemBySlot
loc_143C4:
                
                move.w  statusEffects(a6),d1
                jsr     j_SetStatusEffects
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                movem.l (sp)+,d0/d2-a2
                move.b  #WINDOW_MEMBERSUMMARY_PAGE_ITEMS,((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                rts

    ; End of function sub_141CE


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
memberListWindow = -4
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
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d5
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
memberListWindow = -4
selectedMember = -2

HideMemberListWindow:
                
                movem.w d0-d2/d7,-(sp)
                move.w  memberListWindow(a6),d0
                move.w  #$21C,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.w (sp)+,d0-d2/d7
                rts

    ; End of function HideMemberListWindow


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
memberListWindow = -4
selectedMember = -2

ShowMemberListWindow:
                
                movem.w d0-d2/d7,-(sp)
                move.w  memberListWindow(a6),d0
                move.w  #$20E,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.w (sp)+,d0-d2/d7
                rts

    ; End of function ShowMemberListWindow


; =============== S U B R O U T I N E =======================================

; Handle out of battle MAGIC menu


sub_1445A:
                
                movem.l d0/d3-a1,-(sp)
                sndCom  SFX_VALIDATION
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetSpellAndNumberOfSpells
                andi.w  #$7F,d1 ; <BUG?> -- shouldn't we be ANDing $3F instead?
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
                clr.b   ((CURRENT_DIAMENU_CHOICE-$1000000)).w
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
                move.b  #$FF,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bra.w   byte_145A8
loc_14550:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14562
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   byte_145A8
loc_14562:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1458A
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   byte_145A8
loc_14574:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_14074       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                moveq   #$1D,d6
loc_1458A:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_14074       
                moveq   #$14,d1
                bsr.w   LoadMiniStatusTextHighlightSprites
                subq.w  #1,d6
                bne.s   loc_145A0
                moveq   #$1E,d6
loc_145A0:
                
                jsr     (WaitForVInt).w
                bra.w   loc_144DE
byte_145A8:
                
                sndCom  SFX_VALIDATION
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   loc_145BC
                moveq   #$FFFFFFFF,d1
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
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_14074       
                move.w  (sp)+,d2
                move.w  d2,d4
                lsr.w   #6,d4
                move.w  d4,d3
                moveq   #$13,d1
                bsr.w   LoadMiniStatusTextHighlightSprites
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
                move.b  #$FF,d3
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
                
                bsr.w   LoadMiniStatusTextHighlightSprites
                subq.w  #1,d1
                bne.s   loc_1464E
                moveq   #$14,d1
loc_1464E:
                
                jsr     (WaitForVInt).w
                bra.s   loc_145EA
loc_14654:
                
                moveq   #$13,d1
                bsr.w   LoadMiniStatusTextHighlightSprites
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


LoadMiniStatusTextHighlightSprites:
                
                movem.w d0/d2,-(sp)
                lea     (SPRITE_08).l,a0
                lea     spr_MiniStatusTextHighlight(pc), a1
                move.w  ((DISPLAYED_MEMBERLIST_SELECTED_ENTRY-$1000000)).w,d0
                lsl.w   #4,d0
                tst.b   ((HIDE_WINDOWS-$1000000)).w
                beq.s   @Continue1
                moveq   #1,d1
                move.w  #$100,d0        ; position sprites off-screen while windows are hidden
@Continue1:
                
                moveq   #WINDOW_MEMBERLIST_HIGHLIGHTSPRITES_COUNTER,d7
@LoadMemberListSprites_Loop:
                
                move.w  (a1)+,(a0)
                add.w   d0,(a0)
                move.w  (a1)+,d2
                move.w  d2,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_TILE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_X(a0)
                addq.l  #8,a0
                dbf     d7,@LoadMemberListSprites_Loop
                
                ; Check blinking frame timer
                cmpi.w  #7,d1
                bge.s   @Continue2
                move.w  #$100,d0        ; position sprites off-screen at regular intervals
                bra.s   @OffsetY
@Continue2:
                
                clr.w   d0
@OffsetY:
                
                if (EXTENDED_SPELL_NAMES>=1)
                cmpi.b  #WINDOW_MEMBERSUMMARY_PAGE_MAGIC,((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                bne.s   @Items
                lea     spr_MagicListTextHighlight(pc), a1
@Items:
                endif
                
                clr.w   d2
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d2
                lsl.w   #4,d2
                add.w   d2,d0
                moveq   #WINDOW_MEMBERSUMMARY_HIGHLIGHTSPRITES_COUNTER,d7
@LoadMiniStatusSprites_Loop:
                
                move.w  (a1)+,(a0)
                add.w   d0,(a0)
                move.w  (a1)+,d2
                move.w  d2,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_TILE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_X(a0)
                addq.l  #8,a0
                dbf     d7,@LoadMiniStatusSprites_Loop
                
                bsr.w   sub_101E6
                movem.w (sp)+,d0/d2
                rts

    ; End of function LoadMiniStatusTextHighlightSprites

spr_MiniStatusTextHighlight:
                
; Syntax        vdpSprite Y, [VDPSPRITESIZE_]bitfield, [VDPTILE_]bitfield, X
                
                vdpSprite 260, V2|H4|9, 1472|PALETTE3|PRIORITY, 156
                if (EIGHT_CHARACTERS_MEMBER_NAMES=0)
                vdpSprite 260, V2|H4|10, 1472|MIRROR|PALETTE3|PRIORITY, 188
                vdpSprite 168, V2|H4|11, 1472|PALETTE3|PRIORITY, 300
                vdpSprite 168, V2|H2|12, 1474|PALETTE3|PRIORITY, 332
                else
                vdpSprite 260, V2|H1|10, 1474|PALETTE3|PRIORITY, 188
                vdpSprite 260, V2|H4|11, 1472|MIRROR|PALETTE3|PRIORITY, 196
                vdpSprite 168, V2|H4|12, 1472|PALETTE3|PRIORITY, 300
                vdpSprite 168, V2|H2|13, 1474|PALETTE3|PRIORITY, 332
                endif
                vdpSprite 168, V2|H4|16, 1472|MIRROR|PALETTE3|PRIORITY, 340

                if (EXTENDED_SPELL_NAMES>=1)
spr_MagicListTextHighlight:
                    if (EIGHT_CHARACTERS_MEMBER_NAMES=0)
                    vdpSprite 168, V2|H4|11, 1472|PALETTE3|PRIORITY, 292
                    vdpSprite 168, V2|H3|12, 1474|PALETTE3|PRIORITY, 324
                    else
                    vdpSprite 168, V2|H4|12, 1472|PALETTE3|PRIORITY, 292
                    vdpSprite 168, V2|H3|13, 1474|PALETTE3|PRIORITY, 324
                    endif
                vdpSprite 168, V2|H4|16, 1472|MIRROR|PALETTE3|PRIORITY, 340
                endif

; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
memberListWindow = -4
selectedMember = -2

sub_1474C:
                
                move.w  memberSummaryWindow(a6),d0
                clr.w   d1
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
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
;      In: D1 = old item index
;          D2 = old item slot
;          D4 = new item slot


EquipNewItem:
                
                cmpi.w  #$FFFF,d1
                beq.w   @Equip          ; equip if nothing equipped
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   @Equip          ; equip new item if not cursed
                cmp.w   d4,d1
                beq.w   @Return         ; return if selecting old item slot
                jsr     HideMemberListWindow(pc)
                sndCom  MUSIC_CURSED_ITEM
                txt     43              ; "Gosh!  The curse prohibits{N}you from exchanging{N}equipment!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput_0
                clsTxt
                jsr     ShowMemberListWindow(pc)
                bra.w   @Return
@Equip:
                
                move.w  d4,d1
                
                if (BUGFIX_HIGINS_SPELL>=1)
                cmpi.w  #COMBATANT_ITEMSLOTS,d1
                bge.s   @Return
                endif
                
                jsr     j_EquipItemBySlot
                cmpi.w  #2,d2
                bne.w   @Return         ; return if new item is not cursed
                move.w  d0,(TEXT_NAME_INDEX_1).l
                jsr     HideMemberListWindow(pc)
                sndCom  MUSIC_CURSED_ITEM
                txt     34              ; "Gosh!  {NAME} is{N}cursed!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput_0
                clsTxt
                jsr     ShowMemberListWindow(pc)
@Return:
                
                rts

    ; End of function EquipNewItem


; =============== S U B R O U T I N E =======================================


WaitForMusicResumeAndPlayerInput_0:
                
                move.w  d0,-(sp)
                move.w  #$FB,d0 
                jsr     (PlayMusicAfterCurrentOne).w
                jsr     (WaitForPlayerInput).w
                move.w  (sp)+,d0
                rts

    ; End of function WaitForMusicResumeAndPlayerInput_0


; =============== S U B R O U T I N E =======================================

inventoryWindowTilesLoadingSpace = -240
goldWindowTilesEnd = -18
goldWindowSlot = -14
itemNameAndPriceWindowTilesEnd = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowTilesEnd = -6
inventoryWindowSlot = -2

CreateShopInventoryScreen:
                
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d0
                mulu.w  #6,d0
                add.w   ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d0
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d0
                blt.s   loc_14814
                clr.w   ((CURRENT_ITEMLIST_PAGE-$1000000)).w
                clr.w   ((CURRENT_ITEMLIST_SELECTION-$1000000)).w
loc_14814:
                
                link    a6,#-240
                move.w  #WINDOW_SHOP_INVENTORY_SIZE,d0
                move.w  #WINDOW_SHOP_INVENTORY_DEST,d1
                jsr     (CreateWindow).l
                move.w  d0,inventoryWindowSlot(a6)
                move.l  a1,inventoryWindowTilesEnd(a6)
                bsr.w   sub_14BB0       
                move.w  #WINDOW_SHOP_ITEM_NAME_AND_PRICE_SIZE,d0
                move.w  #WINDOW_SHOP_ITEM_NAME_AND_PRICE_DEST,d1
                jsr     (CreateWindow).l
                move.w  d0,itemNameAndPriceWindowSlot(a6)
                move.l  a1,itemNameAndPriceWindowTilesEnd(a6)
                bsr.w   sub_14B68
                move.w  #WINDOW_SHOP_GOLD_SIZE,d0
                move.w  #WINDOW_SHOP_GOLD_DEST,d1
                jsr     (CreateWindow).l
                move.w  d0,goldWindowSlot(a6)
                move.l  a1,goldWindowTilesEnd(a6)
                bsr.w   sub_14B28       
                move.w  inventoryWindowSlot(a6),d0
                move.w  #$201,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  itemNameAndPriceWindowSlot(a6),d0
                move.w  #$106,d1
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d2
                lsl.w   #2,d2
                lsl.w   #8,d2
                add.w   d2,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  goldWindowSlot(a6),d0
                move.w  #$1617,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                lea     ShopInventoryItemHighlightTiles(pc), a0
                lea     ($FE00).l,a1
                move.w  #$100,d0
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jsr     (WaitForWindowMovementEnd).l
                bsr.w   sub_14EDE
loc_148BC:
                
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d0
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14906
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d2
                mulu.w  #6,d2
                add.w   d0,d2
                addq.w  #1,d2
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d2
                bge.s   loc_14906
                addq.w  #1,d0
                sndCom  SFX_MENU_SELECTION
                cmp.w   ((word_FFB134-$1000000)).w,d0
                blt.s   loc_148FA
                addq.w  #1,((CURRENT_ITEMLIST_PAGE-$1000000)).w
                clr.w   ((CURRENT_ITEMLIST_SELECTION-$1000000)).w
                clr.b   ((word_FFAF9E-$1000000)).w
                bsr.w   sub_14E62
                bra.w   loc_149E0
loc_148FA:
                
                move.w  d0,((CURRENT_ITEMLIST_SELECTION-$1000000)).w
                bsr.w   sub_14EC0
                bra.w   loc_149E0
loc_14906:
                
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d0
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1494A
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d2
                mulu.w  #6,d2
                add.w   d0,d2
                ble.s   loc_1494A
                subq.w  #1,d0
                sndCom  SFX_MENU_SELECTION
                bge.s   loc_1493E
                subq.w  #1,((CURRENT_ITEMLIST_PAGE-$1000000)).w
                move.w  #5,((CURRENT_ITEMLIST_SELECTION-$1000000)).w
                move.b  #1,((word_FFAF9E-$1000000)).w
                bsr.w   sub_14E62
                bra.w   loc_149E0
loc_1493E:
                
                move.w  d0,((CURRENT_ITEMLIST_SELECTION-$1000000)).w
                bsr.w   sub_14EC0
                bra.w   loc_149E0
loc_1494A:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1496A
                tst.w   ((CURRENT_ITEMLIST_PAGE-$1000000)).w
                beq.s   loc_1496A
                subq.w  #1,((CURRENT_ITEMLIST_PAGE-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                move.b  #1,((word_FFAF9E-$1000000)).w
                bsr.w   sub_14E62
loc_1496A:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_149C2
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d2
                addq.w  #1,d2
                mulu.w  #6,d2
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d2
                bge.s   loc_149C2
                addq.w  #1,((CURRENT_ITEMLIST_PAGE-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d0
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d2
                move.w  d2,d1
                add.w   d2,d2
                add.w   d1,d2
                add.w   d2,d2
                move.w  ((GENERIC_LIST_LENGTH-$1000000)).w,d1
                sub.w   d2,d1
                cmpi.w  #6,d1
                ble.s   loc_149A8
                moveq   #6,d1
loc_149A8:
                
                move.w  d1,((word_FFB134-$1000000)).w
loc_149AC:
                
                cmp.w   d1,d0
                blt.w   loc_149B6
                subq.w  #1,d0
                bne.s   loc_149AC
loc_149B6:
                
                move.w  d0,((CURRENT_ITEMLIST_SELECTION-$1000000)).w
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
                
                moveq   #$FFFFFFFF,d0
                bra.w   loc_14A0A
loc_149F2:
                
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d1
                mulu.w  #6,d1
                add.w   ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d1
                lea     ((GENERIC_LIST-$1000000)).w,a0
                move.b  (a0,d1.w),d0
                andi.w  #$FF,d0
loc_14A0A:
                
                movem.w d0-d1,-(sp)
                clr.w   d1
                bsr.s   sub_14A82
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
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
                jsr     (ClearWindowAndUpdateEndPointer).l
                move.w  itemNameAndPriceWindowSlot(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                move.w  inventoryWindowSlot(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                movem.w (sp)+,d0-d1
                unlk    a6
                rts

    ; End of function CreateShopInventoryScreen


; =============== S U B R O U T I N E =======================================


sub_14A82:
                
                lea     (SPRITE_08).l,a0
                cmpi.w  #7,d1
                bge.s   loc_14A9A
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                bra.s   loc_14AAC
loc_14A9A:
                
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d0
                lsl.w   #5,d0
                addi.w  #$9C,d0 
                move.w  d0,VDPSPRITE_OFFSET_X(a0)
                move.w  #$91,(a0) 
loc_14AAC:
                
                move.w  #$F09,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #$C7F0,VDPSPRITE_OFFSET_TILE(a0)
                addq.l  #8,a0
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                tst.w   ((CURRENT_ITEMLIST_PAGE-$1000000)).w
                beq.s   loc_14AE6
                cmpi.w  #7,d1
                blt.s   loc_14ADA
                move.w  #$98,VDPSPRITE_OFFSET_X(a0) 
                move.w  #$90,(a0) 
loc_14ADA:
                
                move.w  #$A,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #$D064,VDPSPRITE_OFFSET_TILE(a0)
loc_14AE6:
                
                addq.l  #8,a0
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d0
                addq.w  #1,d0
                mulu.w  #6,d0
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d0
                bge.s   loc_14B1E
                cmpi.w  #7,d1
                blt.s   loc_14B12
                move.w  #$158,VDPSPRITE_OFFSET_X(a0)
                move.w  #$A8,(a0) 
loc_14B12:
                
                move.w  #$10,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #$C064,VDPSPRITE_OFFSET_TILE(a0)
loc_14B1E:
                
                subq.w  #1,d1
                bne.s   loc_14B24
                moveq   #$14,d1
loc_14B24:
                
                bra.w   sub_101E6

    ; End of function sub_14A82


; =============== S U B R O U T I N E =======================================

; related to gold display

inventoryWindowTilesLoadingSpace = -240
goldWindowTilesEnd = -18
goldWindowSlot = -14
itemNameAndPriceWindowTilesEnd = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowTilesEnd = -6
inventoryWindowSlot = -2

sub_14B28:
                
                move.w  #$904,d0
                movea.l goldWindowTilesEnd(a6),a1
                bsr.w   sub_1018E       
                lea     aGold(pc), a0   
                movea.l goldWindowTilesEnd(a6),a1
                adda.w  #$14,a1
                moveq   #-18,d1
                moveq   #10,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                jsr     j_GetGold
                move.l  d1,d0
                movea.l goldWindowTilesEnd(a6),a1
                adda.w  #$26,a1 
                moveq   #7,d7
                jsr     WriteTilesFromNumber
                rts

    ; End of function sub_14B28

aGold:          dc.b 'GOLD',0
                dc.b 0

; =============== S U B R O U T I N E =======================================

inventoryWindowTilesLoadingSpace = -240
goldWindowTilesEnd = -18
goldWindowSlot = -14
itemNameAndPriceWindowTilesEnd = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowTilesEnd = -6
inventoryWindowSlot = -2

sub_14B68:
                
                move.w  #$A05,d0
                movea.l itemNameAndPriceWindowTilesEnd(a6),a1
                bsr.w   sub_1018E       
                bsr.w   GetSelectedItem 
                move.w  d0,d1
                move.w  d1,-(sp)
                jsr     j_FindItemName
                movea.l itemNameAndPriceWindowTilesEnd(a6),a1
                adda.w  #22,a1
                moveq   #-20,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d1
                jsr     j_GetItemDefAddress
                clr.l   d0
                move.w  ITEMDEF_OFFSET_PRICE(a0),d0
                movea.l itemNameAndPriceWindowTilesEnd(a6),a1
                adda.w  #$44,a1 
                moveq   #5,d7
                jsr     WriteTilesFromNumber
                rts

    ; End of function sub_14B68


; =============== S U B R O U T I N E =======================================

; copy item icon tiles into RAM based on index list at RAM:b0ae

inventoryWindowTilesLoadingSpace = -240
goldWindowTilesEnd = -18
goldWindowSlot = -14
itemNameAndPriceWindowTilesEnd = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowTilesEnd = -6
inventoryWindowSlot = -2

sub_14BB0:
                
                movea.l inventoryWindowTilesEnd(a6),a1
                lea     ShopInventoryWindowLayout(pc), a0
                move.w  #$144,d7
                jsr     (CopyBytes).w   
                bsr.w   *+4
                lea     (byte_FF6942).l,a0
                move.w  #$63F,d7
loc_14BCE:
                
                move.l  #$FFFFFFFF,(a0)+
                dbf     d7,loc_14BCE
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d0
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                add.w   d0,d0
                adda.w  d0,a1
                move.w  ((GENERIC_LIST_LENGTH-$1000000)).w,d1
                sub.w   d0,d1
                cmpi.w  #6,d1
                ble.s   loc_14BF8
                moveq   #6,d1
loc_14BF8:
                
                move.w  d1,((word_FFB134-$1000000)).w
                move.w  d1,d7
                subq.w  #1,d7
                lea     (FF6802_LOADING_SPACE).l,a0
                movea.l inventoryWindowTilesEnd(a6),a2
                adda.w  #$3C,a2 
loc_14C0E:
                
                clr.w   d0
                move.b  (a1)+,d0
                move.w  d7,-(sp)
                bsr.w   CopyIconPixels  
                move.l  a0,-(sp)
                move.w  d0,d1
                jsr     j_GetItemDefAddress
                clr.l   d0
                move.w  ITEMDEF_OFFSET_PRICE(a0),d0
                movea.l (sp)+,a0
                bsr.w   sub_14C56       
                move.w  #$C0FC,(a2)
                addq.l  #8,a2
                move.w  (sp)+,d7
                dbf     d7,loc_14C0E
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($B800).l,a1
                move.w  #$3C0,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                rts

    ; End of function sub_14BB0


; =============== S U B R O U T I N E =======================================

; copy shop price tag pixels to A0 in RAM


sub_14C56:
                
                movem.l a1-a2,-(sp)
                andi.l  #$FFFF,d0
                move.l  a0,-(sp)
                lea     ShopPriceTagTiles_Blank(pc), a1
                moveq   #$1F,d7
loc_14C68:
                
                move.l  (a1)+,(a0)+
                dbf     d7,loc_14C68
                movea.l (sp)+,a0
                adda.w  #$14,a0
                jsr     (WriteAsciiNumber).w
                lea     ((byte_FFDE85-$1000000)).w,a2
                moveq   #4,d7
loc_14C7E:
                
                clr.w   d0
                move.b  (a2)+,d0
                cmpi.w  #$20,d0 
                beq.s   loc_14CA2
                subi.w  #$30,d0 
                mulu.w  #$14,d0
                lea     ShopPriceTagTiles_Numbers(pc), a1
                adda.w  d0,a1
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                bra.s   loc_14CA6
loc_14CA2:
                
                adda.w  #$14,a0
loc_14CA6:
                
                dbf     d7,loc_14C7E
                addq.w  #8,a0
                movem.l (sp)+,a1-a2
                rts

    ; End of function sub_14C56


; =============== S U B R O U T I N E =======================================

; Copy item D1 icon pixels to A0 in RAM


CopyIconPixels:
                
                move.l  a1,-(sp)
                move.w  d0,-(sp)
                movea.l (p_Icons).l,a1
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                lsl.w   #6,d0
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    adda.l  d0,a1
                else
                    adda.w  d0,a1
                endif
                moveq   #$2F,d7 
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

    ; End of function CopyIconPixels


; =============== S U B R O U T I N E =======================================

; Get index of currently selected item in shop/caravan (from index list) -> D0


GetSelectedItem:
                
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d0
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                add.w   d0,d0           ; index effectively multiplied by 6 (i.e. number of items per page)
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d1
                add.w   d1,d0
                lea     ((GENERIC_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                andi.w  #$FF,d0
                rts

    ; End of function GetSelectedItem


; =============== S U B R O U T I N E =======================================

inventoryWindowTilesLoadingSpace = -240
goldWindowTilesEnd = -18
goldWindowSlot = -14
itemNameAndPriceWindowTilesEnd = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowTilesEnd = -6
inventoryWindowSlot = -2

sub_14D0C:
                
                bsr.w   *+4
                movea.l inventoryWindowTilesEnd(a6),a0
                movea.l a0,a1
                adda.w  #$A2,a0 
                adda.w  #$36,a1 
                move.w  #$6C,d7 
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayout_SpacerLine(pc), a0
                movea.l inventoryWindowTilesEnd(a6),a1
                adda.w  #$A2,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayout_SpacerLine(pc), a0
                movea.l inventoryWindowTilesEnd(a6),a1
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

inventoryWindowTilesLoadingSpace = -240
goldWindowTilesEnd = -18
goldWindowSlot = -14
itemNameAndPriceWindowTilesEnd = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowTilesEnd = -6
inventoryWindowSlot = -2

sub_14D6A:
                
                lea     ShopInventoryWindowLayout_SpacerLine(pc), a0
                movea.l inventoryWindowTilesEnd(a6),a1
                adda.w  #$36,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayout_SpacerLine(pc), a0
                movea.l inventoryWindowTilesEnd(a6),a1
                adda.w  #$6C,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     inventoryWindowTilesLoadingSpace(a6),a0
                movea.l inventoryWindowTilesEnd(a6),a1
                adda.w  #$A2,a1 
                move.w  #$6C,d7 
                jsr     (CopyBytes).w   
                bsr.w   sub_14DBE
                lea     inventoryWindowTilesLoadingSpace(a6),a0
                movea.l inventoryWindowTilesEnd(a6),a1
                adda.w  #$36,a1 
                move.w  #$D8,d7 
                jsr     (CopyBytes).w   

    ; End of function sub_14D6A


; =============== S U B R O U T I N E =======================================


sub_14DBE:
                
                bra.s   loc_14D4A

    ; End of function sub_14DBE


; =============== S U B R O U T I N E =======================================

inventoryWindowTilesLoadingSpace = -240
goldWindowTilesEnd = -18
goldWindowSlot = -14
itemNameAndPriceWindowTilesEnd = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowTilesEnd = -6
inventoryWindowSlot = -2

sub_14DC0:
                
                bsr.w   *+4
                movea.l inventoryWindowTilesEnd(a6),a0
                movea.l a0,a1
                adda.w  #$36,a0 
                adda.w  #$A2,a1 
                move.w  #$6C,d7 
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayout_SpacerLine(pc), a0
                movea.l inventoryWindowTilesEnd(a6),a1
                adda.w  #$36,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayout_SpacerLine(pc), a0
                movea.l inventoryWindowTilesEnd(a6),a1
                adda.w  #$6C,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                bra.w   loc_14D4A

    ; End of function sub_14DC0


; =============== S U B R O U T I N E =======================================

inventoryWindowTilesLoadingSpace = -240
goldWindowTilesEnd = -18
goldWindowSlot = -14
itemNameAndPriceWindowTilesEnd = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowTilesEnd = -6
inventoryWindowSlot = -2

sub_14E06:
                
                lea     ShopInventoryWindowLayout_SpacerLine(pc), a0
                movea.l inventoryWindowTilesEnd(a6),a1
                adda.w  #$A2,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     ShopInventoryWindowLayout_SpacerLine(pc), a0
                movea.l inventoryWindowTilesEnd(a6),a1
                adda.w  #$D8,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     inventoryWindowTilesLoadingSpace(a6),a0
                movea.l inventoryWindowTilesEnd(a6),a1
                adda.w  #$6C,a0 
                adda.w  #$36,a1 
                move.w  #$6C,d7 
                jsr     (CopyBytes).w   
                bsr.w   sub_14E5E
                lea     inventoryWindowTilesLoadingSpace(a6),a0
                movea.l inventoryWindowTilesEnd(a6),a1
                adda.w  #$36,a1 
                move.w  #$D8,d7 
                jsr     (CopyBytes).w   

    ; End of function sub_14E06


; =============== S U B R O U T I N E =======================================


sub_14E5E:
                
                bra.w   loc_14D4A

    ; End of function sub_14E5E


; =============== S U B R O U T I N E =======================================

inventoryWindowTilesLoadingSpace = -240
goldWindowTilesEnd = -18
goldWindowSlot = -14
itemNameAndPriceWindowTilesEnd = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowTilesEnd = -6
inventoryWindowSlot = -2

sub_14E62:
                
                movea.l inventoryWindowTilesEnd(a6),a0
                adda.w  #$36,a0 
                lea     inventoryWindowTilesLoadingSpace(a6),a1
                move.w  #$D8,d7 
                jsr     (CopyBytes).w   
                tst.b   ((word_FFAF9E-$1000000)).w
                bne.s   loc_14E82
                bsr.w   sub_14D0C
                bra.s   loc_14E86
loc_14E82:
                
                bsr.w   sub_14DC0
loc_14E86:
                
                bsr.w   sub_14BB0       
                movea.l inventoryWindowTilesEnd(a6),a0
                adda.w  #$36,a0 
                lea     inventoryWindowTilesLoadingSpace(a6),a1
                move.w  #$D8,d7 
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

inventoryWindowTilesLoadingSpace = -240
goldWindowTilesEnd = -18
goldWindowSlot = -14
itemNameAndPriceWindowTilesEnd = -12
itemNameAndPriceWindowSlot = -8
inventoryWindowTilesEnd = -6
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
                
                bsr.w   sub_14B68
                move.w  -8(a6),d0
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d1
                ror.w   #6,d1
                ori.w   #$106,d1
                moveq   #4,d2
                jsr     (MoveWindow).l  
                moveq   #$A,d1
                rts

    ; End of function sub_14EDE

ShopPriceTagTiles_Blank:
                incbin "data/graphics/tech/shoppricetagtiles-blank.bin"
ShopPriceTagTiles_Numbers:
                incbin "data/graphics/tech/shoppricetagtiles-numbers.bin"
ShopInventoryWindowLayout:
                
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
                vdpBaseTile MENU7
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENU17
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENU27
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENU37
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile 1518
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile 1528
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 3rd line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile MENU1
                vdpBaseTile MENU2
                vdpBaseTile MENU8
                vdpBaseTile SPACE
                vdpBaseTile MENU11
                vdpBaseTile MENU12
                vdpBaseTile MENU18
                vdpBaseTile SPACE
                vdpBaseTile MENU21
                vdpBaseTile MENU22
                vdpBaseTile MENU28
                vdpBaseTile SPACE
                vdpBaseTile MENU31
                vdpBaseTile MENU32
                vdpBaseTile MENU38
                vdpBaseTile SPACE
                vdpBaseTile MENU41
                vdpBaseTile MENU42
                vdpBaseTile 1519
                vdpBaseTile SPACE
                vdpBaseTile 1522
                vdpBaseTile 1523
                vdpBaseTile 1529
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 4th line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile MENU3
                vdpBaseTile MENU4
                vdpBaseTile MENU9
                vdpBaseTile SPACE
                vdpBaseTile MENU13
                vdpBaseTile MENU14
                vdpBaseTile MENU19
                vdpBaseTile SPACE
                vdpBaseTile MENU23
                vdpBaseTile MENU24
                vdpBaseTile MENU29
                vdpBaseTile SPACE
                vdpBaseTile MENU33
                vdpBaseTile MENU34
                vdpBaseTile MENU39
                vdpBaseTile SPACE
                vdpBaseTile 1514
                vdpBaseTile 1515
                vdpBaseTile 1520
                vdpBaseTile SPACE
                vdpBaseTile 1524
                vdpBaseTile 1525
                vdpBaseTile 1530
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 5th line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile MENU5
                vdpBaseTile MENU6
                vdpBaseTile MENU10
                vdpBaseTile SPACE
                vdpBaseTile MENU15
                vdpBaseTile MENU16
                vdpBaseTile MENU20
                vdpBaseTile SPACE
                vdpBaseTile MENU25
                vdpBaseTile MENU26
                vdpBaseTile MENU30
                vdpBaseTile SPACE
                vdpBaseTile MENU35
                vdpBaseTile MENU36
                vdpBaseTile MENU40
                vdpBaseTile SPACE
                vdpBaseTile 1516
                vdpBaseTile 1517
                vdpBaseTile 1521
                vdpBaseTile SPACE
                vdpBaseTile 1526
                vdpBaseTile 1527
                vdpBaseTile 1531
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
ShopInventoryWindowLayout_SpacerLine:
                
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
                
ShopInventoryItemHighlightTiles:
                incbin "data/graphics/tech/shopinventoryitemhighlighttiles.bin"

; =============== S U B R O U T I N E =======================================


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
                move.b  ((P1_INPUT-$1000000)).w,d0
                bra.s   loc_1528E

    ; End of function YesNoPrompt


; =============== S U B R O U T I N E =======================================

windowTilesEnd = -6
windowSlot = -2

YesNoChoiceBox:
                
                clr.w   d0
loc_1528E:
                
                movem.l d1-a1,-(sp)
                link    a6,#-6
                move.w  d0,-(sp)
                move.w  #$E03,d0
                move.w  #$2011,d1
                jsr     (CreateWindow).w
                move.w  d0,windowSlot(a6)
                move.l  a1,windowTilesEnd(a6)
                movea.l (p_MenuTiles_YesNo).l,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                clr.b   ((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bsr.w   CopyYesNoIconsToRam
                clr.w   d6
                bsr.w   sub_1542A
                bsr.w   sub_1544A
                move.w  windowSlot(a6),d0
                move.w  #$C11,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_152F0
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_152F0:
                
                move.w  ((word_FFB086-$1000000)).w,d0
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
                
                tst.b   ((P1_INPUT-$1000000)).w
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
                moveq   #$FFFFFFFF,d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15378
loc_1533C:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_15350
                moveq   #$FFFFFFFF,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bra.w   loc_153D6
loc_15350:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_15364
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_153D6
loc_15364:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_153C0
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_153D6
loc_15378:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_15422       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bsr.w   CopyYesNoIconsToRam
                move.w  windowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_153AC
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
loc_153AC:
                
                move.w  ((word_FFB086-$1000000)).w,d0
                beq.s   loc_153BE
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_153BE:
                
                moveq   #$13,d6
loc_153C0:
                
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
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
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_153F6
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_153F6:
                
                move.w  ((word_FFB086-$1000000)).w,d0
                beq.s   loc_15408
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_15408:
                
                jsr     (WaitForWindowMovementEnd).w
                move.w  windowSlot(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                unlk    a6
                movem.l (sp)+,d1-a1
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                ext.w   d0
                rts

    ; End of function YesNoChoiceBox


; =============== S U B R O U T I N E =======================================

; d0 = FFAFE7, related to DMA


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
                
                lea     (byte_FF8A44).l,a0
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

windowTilesEnd = -6
windowSlot = -2

CopyYesNoIconsToRam:
                
                movea.l windowTilesEnd(a6),a1
                lea     YesNoPromptMenuLayout(pc), a0
                move.w  #$54,d7 
                jsr     (CopyBytes).w   
                tst.b   ((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bne.s   loc_15486
                lea     s_Yes(pc), a0   
                bra.s   loc_1548A
loc_15486:
                
                lea     s_No(pc), a0    
loc_1548A:
                
                movea.l windowTilesEnd(a6),a1
                adda.w  #48,a1
                moveq   #-28,d1
                moveq   #3,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                rts

    ; End of function CopyYesNoIconsToRam

s_Yes:          dc.b 'Yes'
s_No:           dc.b 'No '
YesNoPromptMenuLayout:
                
; Syntax        vdpTile [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 1st line
                vdpTile MENU1|PALETTE3|PRIORITY
                vdpTile MENU2|PALETTE3|PRIORITY
                vdpTile MENU3|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile 0
                vdpTile MENU10|PALETTE3|PRIORITY
                vdpTile MENU11|PALETTE3|PRIORITY
                vdpTile MENU12|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile CORNER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|PALETTE3|PRIORITY
                
; 2nd line
                vdpTile MENU4|PALETTE3|PRIORITY
                vdpTile MENU5|PALETTE3|PRIORITY
                vdpTile MENU6|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile 0
                vdpTile MENU13|PALETTE3|PRIORITY
                vdpTile MENU14|PALETTE3|PRIORITY
                vdpTile MENU15|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile V_BORDER|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 3rd line
                vdpTile MENU7|PALETTE3|PRIORITY
                vdpTile MENU8|PALETTE3|PRIORITY
                vdpTile MENU9|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile 0
                vdpTile MENU16|PALETTE3|PRIORITY
                vdpTile MENU17|PALETTE3|PRIORITY
                vdpTile MENU18|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile CORNER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|FLIP|PALETTE3|PRIORITY

; =============== S U B R O U T I N E =======================================

; Close princess Elis's eyes when unconscious


ClosePortraitEyes:
                
                clr.b   ((byte_FFB082-$1000000)).w
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
                move.w  ((BLINK_TILE_NUMBER-$1000000)).w,d7
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
                move.w  ((MOUTH_TILE_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                rts

    ; End of function ClosePortraitEyes


; =============== S U B R O U T I N E =======================================


VInt_HandlePortraitBlinking:
                
                tst.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                beq.w   return_155C2
                tst.b   ((byte_FFB082-$1000000)).w
                beq.w   return_155C2
                lea     ((BLINK_COUNTER-$1000000)).w,a0
                subq.w  #1,(a0)
                cmpi.w  #3,(a0)
                bne.s   loc_1555E
                moveq   #1,d1
                lea     ((BLINK_DATA-$1000000)).w,a2
                move.w  ((BLINK_TILE_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
loc_1555E:
                
                tst.w   (a0)
                bne.s   loc_1557C
                clr.w   d1
                lea     ((BLINK_DATA-$1000000)).w,a2
                move.w  ((BLINK_TILE_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                moveq   #$78,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$1E,d7
                move.w  d7,(a0)
loc_1557C:
                
                lea     ((word_FFB07C-$1000000)).w,a0
                tst.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                bne.s   loc_1558E
                cmpi.w  #5,(a0)
                ble.s   loc_155A8
                bra.s   return_155C2
loc_1558E:
                
                subq.w  #1,(a0)
                cmpi.w  #5,(a0)
                bne.s   loc_155A4
                moveq   #1,d1
                lea     ((MOUTH_DATA-$1000000)).w,a2
                move.w  ((MOUTH_TILE_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
loc_155A4:
                
                tst.w   (a0)
                bne.s   return_155C2
loc_155A8:
                
                clr.w   d1
                lea     ((MOUTH_DATA-$1000000)).w,a2
                move.w  ((MOUTH_TILE_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                moveq   #5,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$A,d7
                move.w  d7,(a0)
return_155C2:
                
                rts

    ; End of function VInt_HandlePortraitBlinking


; =============== S U B R O U T I N E =======================================

; d1 = alternate/original, d7 = tile number


UpdatePortrait:
                
                bne.s   loc_155C8
                rts
loc_155C8:
                
                move.w  d1,-(sp)
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$101,d1
                jsr     (GetWindowTileAddress).w
                move.w  (sp)+,d1
                subq.w  #1,d7
loc_155DC:
                
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
                tst.w   d1
                bne.s   loc_155FA
                move.w  d6,d0
loc_155FA:
                
                or.w    ((word_FFB07E-$1000000)).w,d0
                tst.b   ((PORTRAIT_IS_FLIPPED-$1000000)).w
                beq.s   loc_1560E
                eori.w  #7,d6
                subq.l  #2,d6
                ori.w   #$800,d0
loc_1560E:
                
                add.w   d6,d6
                move.w  d0,(a1,d6.w)
                move.w  (sp)+,d7
                dbf     d7,loc_155DC
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                rts

    ; End of function UpdatePortrait


; =============== S U B R O U T I N E =======================================

; In: D0 = portrait index


LoadPortrait:
                
                movem.l d0-a3,-(sp)
                movea.l (p_pt_Portraits).l,a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                move.w  (a0)+,d0
                move.w  d0,((BLINK_TILE_NUMBER-$1000000)).w
                beq.s   loc_1564E
                subq.w  #1,d0
                lea     ((BLINK_DATA-$1000000)).w,a1
loc_15648:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_15648
loc_1564E:
                
                move.w  (a0)+,d0
                move.w  d0,((MOUTH_TILE_NUMBER-$1000000)).w
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
                jsr     (LoadCompressedData).w
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


; =============== S U B R O U T I N E =======================================


sub_156A8:
                
                movem.w d0,-(sp)
                bsr.s   sub_156CE
                move.l  #$F80B010B,d1
                jsr     (MoveWindowWithSfx).w
                move.w  (sp)+,d0
                rts

    ; End of function sub_156A8


; =============== S U B R O U T I N E =======================================


sub_156BC:
                
                move.w  d0,-(sp)
                bsr.s   sub_156CE
                move.l  #$10BF80B,d1
                jsr     (MoveWindowWithSfx).w
                move.w  (sp)+,d0
                rts

    ; End of function sub_156BC


; =============== S U B R O U T I N E =======================================


sub_156CE:
                
                movem.l d7-a1,-(sp)
                lea     MenuLayout_15706(pc), a0
                lea     ((WINDOW_TILE_LAYOUTS-$1000000)).w,a1
                move.w  #$30,d7 
                jsr     (CopyBytes).w   
                movem.l (sp)+,d7-a1
                jsr     j_GetCombatantName
                move.w  d1,d7
                lea     ((byte_FFB812-$1000000)).w,a1
                moveq   #-16,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                lea     ((WINDOW_TILE_LAYOUTS-$1000000)).w,a0
                move.w  #$803,d0
                move.w  #4,d2
                rts

    ; End of function sub_156CE

MenuLayout_15706:
                dc.w $C080
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C880
                dc.w $C090
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C890
                dc.w $D080
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D880
