
; ASM FILE code\common\menus\buildmemberstatswindow-standard.asm :
; 

                module
                
@writeMemberStatValue: macro
                bsr.w   WriteStatValue
            endm

@writeMemberLvOrExpValue: macro
                bsr.w   WriteLvOrExpValue
            endm

; =============== S U B R O U T I N E =======================================

; In: a1 = window tile adress, d0.w = combatant index

BuildMemberStatusWindow:
                
windowTilesAddress = -6
member = -2

@OFFSET_FULLCLASSNAME: equ 88
                
                movem.l d2-d5/a2,-(sp)
                link    a6,#-6
                move.w  d0,member(a6)
                move.l  a1,windowTilesAddress(a6)
                
                ; Copy window layout
                getPointer p_MemberStatusWindowLayout, a0
                move.w  #WINDOW_MEMBERSTATUS_VDPTILEORDER_BYTESIZE,d7
                jsr     (CopyBytes).w
                
                ; Write character name
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NAME,a1
                move.w  member(a6),d0
                tst.b   d0
                bmi.s   @WriteMemberName            ; skip class name if enemy
                jsr     GetClassAndName                 ; write shortened class name (original behavior)
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                addq.w  #2,a1
@WriteMemberName:
                
                move.w  member(a6),d0
                jsr     GetCombatantName
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
@AddStatusEffectTiles:
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_STATUSEFFECT_TILES,a1
                move.l  a1,d3                   ; D3 = current window tile address
                move.w  member(a6),d0
                jsr     GetStatusEffects
                
                ; Curse
                move.w  d1,d2
                andi.w  #STATUSEFFECT_CURSE,d2
                beq.s   @Poison
                move.l  #VDPTILES_STATUSEFFECT_CURSE,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
                
@Poison:        ; Poison
                move.w  d1,d2
                andi.w  #STATUSEFFECT_POISON,d2
                beq.s   @Muddle
                move.l  #VDPTILES_STATUSEFFECT_POISON,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
                
@Muddle:        ; Muddle
                move.w  d1,d2
                andi.w  #STATUSEFFECT_MUDDLE,d2
                beq.s   @Silence
                move.l  #VDPTILES_STATUSEFFECT_MUDDLE,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
                
@Silence:       ; Silence
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SILENCE,d2
                beq.s   @Stun
                move.l  #VDPTILES_STATUSEFFECT_SILENCE,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
                
@Stun:          ; Stun
                move.w  d1,d2
                andi.w  #STATUSEFFECT_STUN,d2
                beq.s   @Sleep
                move.l  #VDPTILES_STATUSEFFECT_STUN,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
                
@Sleep:         ; Sleep
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLEEP,d2
                beq.s   @Attack
                move.l  #VDPTILES_STATUSEFFECT_SLEEP,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
                
@Attack:        ; Attack
                move.w  d1,d2
                andi.w  #STATUSEFFECT_ATTACK,d2
                beq.s   @Boost
                move.l  #VDPTILES_STATUSEFFECT_ATTACK,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
                
@Boost:         ; Boost
                move.w  d1,d2
                andi.w  #STATUSEFFECT_BOOST,d2
                beq.s   @Slow
                move.l  #VDPTILES_STATUSEFFECT_BOOST,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
                
@Slow:          ; Slow
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLOW,d2
                beq.s   @WriteStatValues
                move.l  #VDPTILES_STATUSEFFECT_SLOW,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
                
@WriteStatValues:
                move.w  member(a6),d0
                
                ; Current HP
                jsr     GetCurrentHP
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_CURRENT_HP,a1
                @writeMemberStatValue
                
                ; Max HP
                move.w  member(a6),d0
                jsr     GetMaxHP
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAX_HP,a1
                @writeMemberStatValue
                
                ; Current MP
                move.w  member(a6),d0
                jsr     GetCurrentMP
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_CURRENT_MP,a1
                @writeMemberStatValue
                
                ; Max MP
                move.w  member(a6),d0
                jsr     GetMaxMP
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAX_MP,a1
                @writeMemberStatValue
                
                ; LV
                move.w  member(a6),d0
                tst.b   d0
                bmi.s   @EnemyLv
                jsr     GetCurrentLevel
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_LV,a1
                @writeMemberLvOrExpValue
                
                ; EXP
                move.w  member(a6),d0
                jsr     GetCurrentEXP
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_EXP,a1
                @writeMemberLvOrExpValue
                bra.s   @ATT
; ---------------------------------------------------------------------------

WriteEnemyLvOrExp:
                lea     aNA(pc), a0     
                moveq   #WINDOW_MEMBERSTATUS_NA_STRING_LENGTH,d7
                bra.w   WriteTilesFromAsciiWithRegularFont
; ---------------------------------------------------------------------------

@EnemyLv:       
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ENEMY_LV,a1
                bsr.s   WriteEnemyLvOrExp
@EnemyExp:      movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ENEMY_EXP,a1
                bsr.s   WriteEnemyLvOrExp
                
@ATT:           ; ATT
                move.w  member(a6),d0
                jsr     GetCurrentATT
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ATT,a1
                @writeMemberStatValue
                
                ; DEF
                move.w  member(a6),d0
                jsr     GetCurrentDEF
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_DEF,a1
                @writeMemberStatValue
                
                ; AGI
                move.w  member(a6),d0
                jsr     GetCurrentAGI
                andi.w  #DISPLAYED_AGI_VALUE_MASK,d1
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_AGI,a1
                @writeMemberStatValue
                
                ; MOV
                move.w  member(a6),d0
                jsr     GetCurrentMOV
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MOV,a1
                @writeMemberStatValue
                
                ; Write MAGIC and ITEM sections
                ;   D3 = current icon VDP tile
                ;   D4 = current window tile address
                ;   D5 = current item or spell index
                ;   A2 = current loading space address
                move.w  #VDPTILE_ICONS_START|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d3
                lea     ((FF9004_LOADING_SPACE-$1000000)).w,a2
                
                move.l  windowTilesAddress(a6),d4
                addi.w  #WINDOW_MEMBERSTATUS_OFFSET_MAGIC_START,d4
                move.l  d4,-(sp)                    ; -> stash start of MAGIC section address
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d6
                
@WriteSpells_Loop:
                move.w  member(a6),d0
                move.w  #COMBATANT_SPELLSLOTS_COUNTER,d1
                sub.w   d6,d1
                jsr     GetSpellAndNumberOfSpells
                cmpi.b  #SPELL_NOTHING,d1
                beq.w   @WriteSpells_Break          ; break out of loop if no spells learned
                
                ; Do not display spell that is not affected by silence
                jsr     FindSpellDefAddress
                btst    #SPELLPROPS_BIT_AFFECTEDBYSILENCE,SPELLDEF_OFFSET_PROPS(a0)
                beq.w   @NextSpell      ; skip if spell is not affected by silence
                
                ; Copy icon tiles to window layout
                movea.l d4,a1
                bsr.w   CopyMemberScreenIconsToVdpTileOrder
                
                ; Write spell name
                move.w  d1,d5           ; backup spell index -> D5
                jsr     FindSpellName
                movea.l d4,a1
                addq.w  #4,a1           ; offset to spell name relative from start
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
                ; Copy spell level tiles to window layout
                lea     SpellLevelTilesLayout1(pc), a0
                move.w  d5,d1
                andi.w  #SPELLENTRY_MASK_LV,d1
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsr.w   #4,d1
                adda.w  d1,a0
                movea.l d4,a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_SPELL_LV_TILES,a1
                moveq   #12,d7          ; spell level VDP tiles bytes size
                jsr     (CopyBytes).w   
                
                ; Load icon pixel data to temp space
                move.w  d5,d1
                andi.l  #SPELLENTRY_MASK_INDEX,d1
                addi.w  #ICON_SPELLS_START,d1
                getPointer p_Icons, a0
                mulu.w  #ICONTILES_BYTESIZE,d1
                addIconOffset d1, a0
                movea.l a2,a1
                move.w  #ICONTILES_BYTESIZE,d7
                jsr     (CopyBytes).w   
                bsr.w   CleanMemberStatsIconCorners
                adda.w  #ICONTILES_BYTESIZE,a2
                addi.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_SPELL,d4
@NextSpell:     dbf     d6,@WriteSpells_Loop
                
@WriteSpells_Break:
                move.l  (sp)+,d5                    ; D5 <- pop start of MAGIC section address
                cmp.l   d5,d4           ; compare to current address to determine whether section is empty
                bne.w   @WriteItems
                
                ; Write 'Nothing' string under MAGIC section
                lea     aNothing_0(pc), a0
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAGIC_NOTHING_STRING,a1
                moveq   #10,d7          ; string length
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
@WriteItems:    move.l  windowTilesAddress(a6),d4
                addi.w  #WINDOW_MEMBERSTATUS_OFFSET_ITEM_START,d4
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d6
                
@WriteItems_Loop:
                move.w  member(a6),d0
                move.w  #COMBATANT_ITEMSLOTS_COUNTER,d1
                sub.w   d6,d1
                jsr     GetItemBySlotAndHeldItemsNumber
                cmpi.b  #ITEM_NOTHING,d1
                beq.w   @WriteItems_Break
                
                ; Copy icon tiles to window layout
                movea.l d4,a1
                bsr.w   CopyMemberScreenIconsToVdpTileOrder
                
                ; Write item name
                move.w  d1,d5           ; backup item index -> D5
                jsr     FindItemName
                movea.l d4,a1
                addq.w  #4,a1           ; offset to item name relative from start
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  d5,d1
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.w   @LoadItemIcon
                
                ; Write 'Equipped' string
                lea     aEquipped_0(pc), a0
                movea.l d4,a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_EQUIPPED_STRING,a1
                moveq   #10,d7          ; string length
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
@LoadItemIcon:  ; Load icon pixel data to temp space
                move.w  d5,d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                getPointer p_Icons, a0
                mulu.w  #ICONTILES_BYTESIZE,d1
                addIconOffset d1, a0
                movea.l a2,a1
                move.w  #ICONTILES_BYTESIZE,d7
                jsr     (CopyBytes).w   
                
                ; Draw cracks over icon if item is broken
                move.w  d5,d1
                btst    #ITEMENTRY_BIT_BROKEN,d1
                beq.s   @CleanIconCorners
                
                getPointer p_Icons, a0
                lea     ICONTILES_OFFSET_CRACKS(a0),a0
                move.w  #ICONTILES_CRACKS_PIXELS_COUNTER,d0
                
@DrawCracks_Loop:
                move.b  (a0)+,d1
                beq.s   @NextCrack
                andi.w  #$F0,d1
                beq.s   @Continue1
                andi.b  #$F,(a1)
@Continue1:     move.b  -1(a0),d1
                andi.w  #$F,d1
                beq.s   @Continue2
                andi.b  #$F0,(a1)
@Continue2:     move.b  -1(a0),d1
                or.b    d1,(a1)
@NextCrack:     addq.l  #1,a1
                dbf     d0,@DrawCracks_Loop
                
                movea.l a2,a1
                
@CleanIconCorners:
                bsr.w   CleanMemberStatsIconCorners
                adda.w  #ICONTILES_BYTESIZE,a2
                addi.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_ITEM,d4
                dbf     d6,@WriteItems_Loop
                
@WriteItems_Break:
                cmpi.w  #COMBATANT_ITEMSLOTS_COUNTER,d6
                bne.s   @WriteJewels
                
                ; Write 'Nothing' string under ITEM section
                lea     aNothing_1(pc), a0
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ITEM_NOTHING_STRING,a1
                moveq   #10,d7          ; string length
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
@WriteJewels:
                tst.w   member(a6)
                bne.s   @DmaIcons       ; skip if anyone other than Bowie
                chkFlg  384             ; Set after Bowie obtains the jewel of light/evil... whichever it is
                beq.s   @DmaIcons       ; skip if we haven't obtained Jewel of Light
                bsr.s   WriteJewelIcons
                
@DmaIcons:      ; DMA icons pixel data
                lea     (FF9004_LOADING_SPACE).l,a0
                lea     ($DA00).l,a1
                move.w  #$300,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                
                unlk    a6
                movem.l (sp)+,d2-d5/a2
                rts

    ; End of function BuildMemberStatsWindow


; =============== S U B R O U T I N E =======================================

CopyMemberScreenIconsToVdpTileOrder:
                move.w  d3,(a1)
                addq.w  #1,d3
                move.w  d3,2(a1)
                addq.w  #1,d3
                move.w  d3,$2A(a1)
                addq.w  #1,d3
                move.w  d3,$2C(a1)
                addq.w  #1,d3
                move.w  d3,$54(a1)
                addq.w  #1,d3
                move.w  d3,$56(a1)
                addq.w  #1,d3
                rts

    ; End of function CopyMemberScreenIconsToVdpTileOrder


; =============== S U B R O U T I N E =======================================

WriteJewelIcons:
                lea     aJewel(pc), a0  
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_STRING_START,a1
                moveq   #8,d7           ; string length
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
                ; Copy icon tiles to window layout
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_OF_LIGHT,a1
                bsr.s   CopyMemberScreenIconsToVdpTileOrder
                
                ; Load Jewel of Light icon pixel data to temp space
                move.w  #ICON_JEWEL_OF_LIGHT,d1
                bsr.s   LoadJewelIconPixels
                adda.w  #ICONTILES_BYTESIZE,a2
                
                chkFlg  385             ; Set after Bowie obtains King Galam's jewel
                beq.s   @Return         ; skip if we haven't obtained Jewel of Evil
                
                ; Copy icon tiles to window layout
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_OF_EVIL,a1
                bsr.s   CopyMemberScreenIconsToVdpTileOrder
                
                ; Append 'S' character to 'JEWEL' string if we obtained both jewels
                movea.l windowTilesAddress(a6),a1
                move.w  #VDPTILE_UPPERCASE_S|VDPTILE_PALETTE3|VDPTILE_PRIORITY,WINDOW_MEMBERSTATUS_OFFSET_JEWEL_STRING_END(a1)
                
                ; Load Jewel of Evil icon pixel data to temp space
                move.w  #ICON_JEWEL_OF_EVIL,d1

    ; End of function WriteJewelIcons


; =============== S U B R O U T I N E =======================================

LoadJewelIconPixels:
                getPointer p_Icons, a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addIconOffset d1, a0
                movea.l a2,a1
                move.w  #ICONTILES_BYTESIZE,d7
                jsr     (CopyBytes).w
                
CleanMemberStatsIconCorners:
                ori.b   #$F0,(a1)
                ori.b   #$F,$23(a1)
                ori.b   #$F0,$9C(a1)
                ori.b   #$F,$BF(a1)
@Return:        rts

    ; End of function CleanMemberStatsIconCorners

aNothing_0:     dc.b '\Nothing',0
aEquipped_0:    dc.b '\Equipped',0
aNothing_1:     dc.b '\Nothing',0
aJewel:         dc.b 'JEWEL',0

                modend
