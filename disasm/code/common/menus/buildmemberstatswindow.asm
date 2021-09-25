
; ASM FILE code\common\menus\buildmemberstatswindow.asm :
; 0x11FF0..0x12606 : Build member stats window function

; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     A1 = window tile adress

windowTilesAddress = -6
member = -2

BuildMemberStatusWindow:
                
                module
                link    a6,#-6
                move.w  d0,member(a6)
                move.l  a1,windowTilesAddress(a6)
                
                ; Copy window layout
                movea.l (p_MemberStatusWindowLayout).l,a0
                move.w  #WINDOW_MEMBERSTATUS_VDPTILEORDER_BYTESIZE,d7
                jsr     (CopyBytes).w   
                
                ; Write character name
                move.w  member(a6),d0
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NAME,a1
                tst.b   d0
                blt.s   @WriteMemberName ; skip class name if enemy
                jsr     j_GetClass
                jsr     j_GetClassName
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                addq.w  #2,a1
@WriteMemberName:
                
                move.w  member(a6),d0
                jsr     j_GetCombatantName
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
@AddStatusEffectTiles:
                
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_STATUSEFFECT_TILES,a1
                lea     ((byte_FFB852-$1000000)).w,a0 ; unused (?)
                move.w  member(a6),d0
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
                beq.s   @WriteCurrentHP
                move.l  #VDPTILES_STATUSEFFECT_SLOW,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@WriteCurrentHP:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentHP
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteMaxHP
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_CURRENT_HP,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteMaxHP:
                
                move.w  member(a6),d0
                jsr     j_GetMaxHP
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteCurrentMP
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAX_HP,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteCurrentMP:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentMP
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteMaxMP
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_CURRENT_MP,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteMaxMP:
                
                move.w  member(a6),d0
                jsr     j_GetMaxMP
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteLVandEXP
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAX_MP,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteLVandEXP:
                
                move.w  member(a6),d0
                
                if (SHOW_ENEMY_LEVEL=0)
                tst.b   d0
                blt.s   @WriteEnemyLVandEXP
                endif
                
                jsr     j_GetCurrentLevel
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_LV,a1
                moveq   #LV_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
                move.w  member(a6),d0
                
                if (SHOW_ENEMY_LEVEL>=1)
                tst.b   d0
                blt.s   @WriteEnemyEXP
                endif
                
                jsr     j_GetCurrentEXP
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_EXP,a1
                moveq   #EXP_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
                bra.s   @WriteATT
@WriteEnemyLVandEXP:
                
                lea     aNA(pc), a0     
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ENEMY_LV,a1
                moveq   #WINDOW_MEMBERSTATUS_NA_STRING_LENGTH,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
@WriteEnemyEXP:
                
                lea     aNA(pc), a0     
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ENEMY_EXP,a1
                moveq   #WINDOW_MEMBERSTATUS_NA_STRING_LENGTH,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
@WriteATT:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentATT
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteDEF
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ATT,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteDEF:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentDEF
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteAGI
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_DEF,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteAGI:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentAGI
                andi.w  #DISPLAYED_AGI_VALUE_MASK,d1
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteMOV
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_AGI,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteMOV:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentMOV
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteSpells
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MOV,a1
                moveq   #MOV_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteSpells:
                
                move.w  #VDPTILE_ICONS_START|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d7
                move.w  member(a6),d0
                clr.w   d1
                jsr     j_GetSpellAndNumberOfSpells
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAGIC_START,a1
                move.l  a1,-(sp)
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d6
@WriteSpells_Loop:
                
                move.w  member(a6),d0
                move.w  #COMBATANT_SPELLSLOTS_COUNTER,d1
                sub.w   d6,d1
                jsr     j_GetSpellAndNumberOfSpells
                cmpi.b  #SPELL_NOTHING,d1
                beq.w   @Break          ; break out of loop if no spells learned
                
                if (SHOW_ALL_SPELLS_IN_MEMBER_SCREEN=0)
                movem.l d1/a0,-(sp)
                jsr     j_FindSpellDefAddress
                btst    #SPELLPROPS_BIT_AFFECTEDBYSILENCE,SPELLDEF_OFFSET_PROPS(a0)
                movem.l (sp)+,d1/a0
                beq.w   @NextSpell
                endif
                
                ; Copy icon tiles to window layout
                bsr.w   CopyMemberScreenIconsToVdpTileOrder
                
                ; Write spell name
                movem.w d0-d1/d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                jsr     j_FindSpellName
                addq.w  #4,a1           ; offset to spell name relative from start
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movem.l (sp)+,a0-a1
                movem.w (sp)+,d0-d1/d6-d7
                
                ; Copy spell level tiles to window layout
                movem.w d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                lea     SpellLevelTilesLayout1(pc), a0
                andi.w  #SPELLENTRY_MASK_LV,d1
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsr.w   #4,d1
                adda.w  d1,a0
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_SPELL_LV_TILES,a1
                moveq   #$C,d7          ; spell level VDP tiles bytes size
                jsr     (CopyBytes).w   
                movem.l (sp)+,a0-a1
                movem.w (sp)+,d6-d7
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_SPELL,a1
@NextSpell:
                
                dbf     d6,@WriteSpells_Loop
@Break:
                
                movea.l (sp)+,a0
                cmpa.l  a0,a1
                bne.w   @WriteItems
                
                ; Write 'Nothing' string under MAGIC section
                move.w  d7,-(sp)
                lea     aNothing_0(pc), a0
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAGIC_NOTHING_STRING,a1
                moveq   #-42,d1
                moveq   #10,d7          ; string length
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
@WriteItems:
                
                move.w  member(a6),d0
                clr.w   d1
                jsr     j_GetItemAndNumberHeld
                tst.w   d2
                beq.w   @WriteItemNothingString
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ITEM_START,a1
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d6
@ItemNames_Loop:
                
                move.w  member(a6),d0
                move.w  #COMBATANT_ITEMSLOTS_COUNTER,d1
                sub.w   d6,d1
                jsr     j_GetItemAndNumberHeld
                cmpi.b  #ITEM_NOTHING,d1
                beq.w   @WriteJewelString
                
                ; Copy icon tiles to window layout
                bsr.w   CopyMemberScreenIconsToVdpTileOrder
                
                ; Write item name
                movem.w d0-d1/d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                jsr     j_FindItemName
                addq.w  #4,a1           ; offset to item name relative from start
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movem.l (sp)+,a0-a1
                movem.w (sp)+,d0-d1/d6-d7
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.w   @NextItem
                
                ; Write 'Equipped' string
                movem.w d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                lea     aEquipped_0(pc), a0
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_EQUIPPED_STRING,a1
                moveq   #-42,d1
                moveq   #10,d7          ; string length
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movem.l (sp)+,a0-a1
                movem.w (sp)+,d6-d7
@NextItem:
                
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_ITEM,a1
                dbf     d6,@ItemNames_Loop
                bra.w   @WriteJewelString
aNothing_0:
                
                dc.b '\Nothing',0
aEquipped_0:
                
                dc.b '\Equipped',0
aNothing_1:
                
                dc.b '\Nothing',0
aJewel:
                
                dc.b 'JEWEL',0
@WriteItemNothingString:
                
                move.w  d7,-(sp)
                lea     aNothing_1(pc), a0
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ITEM_NOTHING_STRING,a1
                moveq   #-42,d1
                moveq   #10,d7          ; string length
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
@WriteJewelString:
                
                move.w  member(a6),d0
                bne.s   @LoadSpellIcons ; skip if anyone other than Bowie
                chkFlg  384             ; Set after Bowie obtains the jewel of light/evil... whichever it is
                beq.s   @LoadSpellIcons
                move.w  d7,-(sp)
                lea     aJewel(pc), a0  
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_STRING_START,a1
                moveq   #-42,d1
                moveq   #8,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
                
                ; Copy icon tiles to window layout
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_OF_LIGHT,a1
                move.w  #$92,d1 ; ?
                bsr.w   CopyMemberScreenIconsToVdpTileOrder
                chkFlg  385             ; Set after Bowie obtains King Galam's jewel
                beq.s   @LoadSpellIcons
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_OF_EVIL,a1
                move.w  #$92,d1 ; ?
                bsr.w   CopyMemberScreenIconsToVdpTileOrder
                
                ; Append 'S' character to 'JEWEL' string if we obtained both jewels
                movea.l windowTilesAddress(a6),a1
                move.w  #VDPTILE_UPPERCASE_S|VDPTILE_PALETTE3|VDPTILE_PRIORITY,WINDOW_MEMBERSTATUS_OFFSET_JEWEL_STRING_END(a1)
@LoadSpellIcons:
                
                lea     (FF9004_LOADING_SPACE).l,a1
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d6
@SpellIcons_Loop:
                
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d1
                sub.w   d6,d1
                move.w  member(a6),d0
                jsr     j_GetSpellAndNumberOfSpells
                cmpi.b  #SPELL_NOTHING,d1
                beq.w   @LoadItemIcons
                movem.l d1/a0,-(sp)
                jsr     j_FindSpellDefAddress
                btst    #SPELLPROPS_BIT_AFFECTEDBYSILENCE,SPELLDEF_OFFSET_PROPS(a0)
                movem.l (sp)+,d1/a0
                beq.s   @NextSpellIcon
                move.l  a0,-(sp)
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                addi.w  #ICON_SPELLS_START,d1
                movea.l (p_Icons).l,a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    adda.l  d1,a0
                else
                    adda.w  d1,a0
                endif
                move.w  #ICONTILES_BYTESIZE,d7
                jsr     (CopyBytes).w   
                ori.b   #$F0,(a1)
                ori.b   #$F,$23(a1)
                ori.b   #$F0,$9C(a1)
                ori.b   #$F,$BF(a1)
                movea.l (sp)+,a0
                adda.w  #ICONTILES_BYTESIZE,a1
@NextSpellIcon:
                
                dbf     d6,@SpellIcons_Loop
@LoadItemIcons:
                
                moveq   #3,d6
@ItemIcons_Loop:
                
                moveq   #3,d1
                sub.w   d6,d1
                move.w  member(a6),d0
                jsr     j_GetItemAndNumberHeld
                cmpi.b  #ITEM_NOTHING,d1
                beq.w   @LoadJewelIcons
                move.l  a0,-(sp)
                move.w  d1,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                movea.l (p_Icons).l,a0
                mulu.w  #ICONTILES_BYTESIZE,d1
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    adda.l  d1,a0
                else
                    adda.w  d1,a0
                endif
                move.w  #ICONTILES_BYTESIZE,d7
                jsr     (CopyBytes).w   
                move.w  (sp)+,d1
                btst    #ITEMENTRY_BIT_BROKEN,d1
                beq.s   @CleanIconCorners
                movem.l d2-d3/a0-a1,-(sp)
                movea.l (p_Icons).l,a0
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    adda.l  #ICONTILES_OFFSET_CRACKS,a0
                else
                    lea     ICONTILES_OFFSET_CRACKS(a0),a0
                endif
                move.w  #ICONTILES_CRACKS_PIXELS_COUNTER,d2
@DrawCracks_Loop:
                
                move.b  (a0)+,d3
                beq.s   @NextCrack
                andi.w  #$F0,d3 
                beq.s   @Continue1
                andi.b  #$F,(a1)
@Continue1:
                
                move.b  -1(a0),d3
                andi.w  #$F,d3
                beq.s   @Continue2
                andi.b  #$F0,(a1)
@Continue2:
                
                move.b  -1(a0),d3
                or.b    d3,(a1)
@NextCrack:
                
                addq.l  #1,a1
                dbf     d2,@DrawCracks_Loop
                movem.l (sp)+,d2-d3/a0-a1
@CleanIconCorners:
                
                ori.b   #$F0,(a1)
                ori.b   #$F,$23(a1)
                ori.b   #$F0,$9C(a1)
                ori.b   #$F,$BF(a1)
                movea.l (sp)+,a0
                adda.w  #ICONTILES_BYTESIZE,a1
                dbf     d6,@ItemIcons_Loop
@LoadJewelIcons:
                
                move.w  #ICON_JEWEL_OF_LIGHT,d1
                movea.l (p_Icons).l,a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addJewelIconOffset
                move.w  #ICONTILES_BYTESIZE,d7
                jsr     (CopyBytes).w   
                ori.b   #$F0,(a1)
                ori.b   #$F,$23(a1)
                ori.b   #$F0,$9C(a1)
                ori.b   #$F,$BF(a1)
                adda.w  #ICONTILES_BYTESIZE,a1
                move.w  #ICON_JEWEL_OF_EVIL,d1
                movea.l (p_Icons).l,a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addJewelIconOffset
                move.w  #ICONTILES_BYTESIZE,d7
                jsr     (CopyBytes).w   
                ori.b   #$F0,(a1)
                ori.b   #$F,$23(a1)
                ori.b   #$F0,$9C(a1)
                ori.b   #$F,$BF(a1)
                adda.w  #ICONTILES_BYTESIZE,a1
                
                ; DMA icons pixel data
                lea     (FF9004_LOADING_SPACE).l,a0
                lea     ($DA00).l,a1
                move.w  #$300,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                unlk    a6
                rts

    ; End of function BuildMemberStatusWindow

                modend
                dc.w $FFFF              ; useless padding bytes

; =============== S U B R O U T I N E =======================================


CopyMemberScreenIconsToVdpTileOrder:
                
                move.w  d7,(a1)
                addq.w  #1,d7
                move.w  d7,2(a1)
                addq.w  #1,d7
                move.w  d7,$2A(a1)
                addq.w  #1,d7
                move.w  d7,$2C(a1)
                addq.w  #1,d7
                move.w  d7,$54(a1)
                addq.w  #1,d7
                move.w  d7,$56(a1)
                addq.w  #1,d7
                rts

    ; End of function CopyMemberScreenIconsToVdpTileOrder

