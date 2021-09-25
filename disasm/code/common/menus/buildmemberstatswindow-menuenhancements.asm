
; ASM FILE code\common\menus\buildmemberstatswindow-menuenhancements.asm :
; 

; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     A1 = window tile adress

BuildMemberStatusWindow:
                
window_tile_address = -6
character_index     = -2
                
@OFFSET_FULLCLASSNAME: equ 88
                
                movem.l d2-d5/a2,-(sp)
                link    a6,#-6
                move.w  d0,character_index(a6)
                move.l  a1,window_tile_address(a6)
                
                ; Copy window layout
                movea.l (p_MemberStatusWindowLayout).l,a0
                
                
                if (FULL_CLASS_NAMES=0)
                move.w  #WINDOW_MEMBERSTATUS_VDPTILEORDER_BYTESIZE,d7
                jsr     (CopyBytes).w
                else
                move.w  #126,d7     ; window layout head bytesize
                jsr     (CopyBytes).w
                adda.w  d7,a0
                adda.w  d7,a1
                tst.b   d0
                bmi.s   @CopyWindowLayoutBody
                suba.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,a0
                
@CopyWindowLayoutBody:
                move.w  #336,d7     ; window layout body bytesize
                jsr     (CopyBytes).w
                adda.w  d7,a0
                adda.w  d7,a1
                tst.b   d0
                bmi.s   @CopyWindowLayoutTail
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,a0
                
@CopyWindowLayoutTail:
                move.w  #630,d7     ; window layout tail bytesize
                jsr     (CopyBytes).w
                endif
                
                
                ; Write character name
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NAME,a1
                move.w  character_index(a6),d0
                
                
                if (FULL_CLASS_NAMES=0)
                tst.b   d0
                bmi.s   @WriteMemberName            ; skip class name if enemy
                jsr     GetClassAndName                 ; write shortened class name (original behavior)
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                addq.w  #2,a1
                
@WriteMemberName:
                move.w  character_index(a6),d0
                jsr     GetCombatantName
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                else
                jsr     GetCombatantName
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  character_index(a6),d0
                tst.b   d0
                bmi.s   @AddStatusEffectTiles       ; skip class name if enemy
                movea.l window_tile_address(a6),a1
                adda.w  #@OFFSET_FULLCLASSNAME,a1
                jsr     GetClassAndFullName             ; write full class name on single line
                moveq   #0,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                endif
                
                
@AddStatusEffectTiles:
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_STATUSEFFECT_TILES,a1
                move.l  a1,d3                   ; D3 = current window tile address
                move.w  character_index(a6),d0
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
                move.w  character_index(a6),d0
                
                ; Current HP
                jsr     GetCurrentHP
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_CURRENT_HP,a1
                bsr.w   WriteThreeDigitsStatValue_MemberStats
                
                ; Max HP
                move.w  character_index(a6),d0
                jsr     GetMaxHP
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAX_HP,a1
                bsr.w   WriteThreeDigitsStatValue_MemberStats
                
                ; Current MP
                move.w  character_index(a6),d0
                jsr     GetCurrentMP
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_CURRENT_MP,a1
                bsr.w   WriteThreeDigitsStatValue_MemberStats
                
                ; Max MP
                move.w  character_index(a6),d0
                jsr     GetMaxMP
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAX_MP,a1
                bsr.w   WriteThreeDigitsStatValue_MemberStats
                
                ; LV
                move.w  character_index(a6),d0
                
                if (SHOW_ENEMY_LEVEL=0)
                tst.b   d0
                bmi.s   @EnemyLVandEXP
                endif
                
                jsr     GetCurrentLevel
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_LV,a1
                bsr.w   WriteTwoDigitsStatValue_MemberStats
                
                ; EXP
                move.w  character_index(a6),d0
                
                if (SHOW_ENEMY_LEVEL>=1)
                tst.b   d0
                bmi.s   @EnemyEXP
                endif
                
                jsr     GetCurrentEXP
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_EXP,a1
                bsr.w   WriteTwoDigitsStatValue_MemberStats
                
                bra.s   @ATT
                
@EnemyLVandEXP:
                if (SHOW_ENEMY_LEVEL=0)
                lea     aNA(pc), a0     
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ENEMY_LV,a1
                moveq   #WINDOW_MEMBERSTATUS_NA_STRING_LENGTH,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                endif
                
@EnemyEXP:
                lea     aNA(pc), a0     
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ENEMY_EXP,a1
                moveq   #WINDOW_MEMBERSTATUS_NA_STRING_LENGTH,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
@ATT:           ; ATT
                move.w  character_index(a6),d0
                jsr     GetCurrentATT
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ATT,a1
                bsr.w   WriteThreeDigitsStatValue_MemberStats
                
                ; DEF
                move.w  character_index(a6),d0
                jsr     GetCurrentDEF
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_DEF,a1
                bsr.w   WriteThreeDigitsStatValue_MemberStats
                
                ; AGI
                move.w  character_index(a6),d0
                jsr     GetCurrentAGI
                andi.w  #DISPLAYED_AGI_VALUE_MASK,d1
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_AGI,a1
                bsr.w   WriteThreeDigitsStatValue_MemberStats
                
                ; MOV
                move.w  character_index(a6),d0
                jsr     GetCurrentMOV
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MOV,a1
                bsr.w   WriteThreeDigitsStatValue_MemberStats
                
                ; Write MAGIC and ITEM sections
                ;   D3 = current icon VDP tile
                ;   D4 = current window tile address
                ;   D5 = current item or spell index
                ;   A2 = current loading space address
                move.w  #VDPTILE_ICONS_START|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d3
                lea     ((FF9004_LOADING_SPACE-$1000000)).w,a2
                
                move.l  window_tile_address(a6),d4
                addi.w  #WINDOW_MEMBERSTATUS_OFFSET_MAGIC_START,d4
                move.l  d4,-(sp)                    ; -> stash start of MAGIC section address
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d6
                
@WriteSpells_Loop:
                move.w  character_index(a6),d0
                move.w  #COMBATANT_SPELLSLOTS_COUNTER,d1
                sub.w   d6,d1
                jsr     GetSpellAndNumberOfSpells
                cmpi.b  #SPELL_NOTHING,d1
                beq.w   @WriteSpells_Break          ; break out of loop if no spells learned
                
                if (SHOW_ALL_SPELLS_IN_MEMBER_SCREEN=0)
                ; Do not display spell that is not affected by silence
                jsr     FindSpellDefAddress
                btst    #SPELLPROPS_BIT_AFFECTEDBYSILENCE,SPELLDEF_OFFSET_PROPS(a0)
                beq.w   @NextSpell      ; skip if spell is not affected by silence
                endif
                
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
                movea.l a2,a1
                move.w  #ICONTILES_BYTESIZE,d7
                jsr     (CopyBytes).w   
                bsr.w   CleanMemberStatsIconCorners
                
                adda.w  #ICONTILES_BYTESIZE,a2
                addi.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_SPELL,d4
                
@NextSpell:
                dbf     d6,@WriteSpells_Loop
                
@WriteSpells_Break:
                move.l  (sp)+,d5                    ; D5 <- pop start of MAGIC section address
                cmp.l   d5,d4           ; compare to current address to determine whether section is empty
                bne.w   @WriteItems
                
                ; Write 'Nothing' string under MAGIC section
                lea     aNothing_0(pc), a0
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAGIC_NOTHING_STRING,a1
                moveq   #10,d7          ; string length
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
@WriteItems:
                move.l  window_tile_address(a6),d4
                addi.w  #WINDOW_MEMBERSTATUS_OFFSET_ITEM_START,d4
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d6
                
@WriteItems_Loop:
                move.w  character_index(a6),d0
                move.w  #COMBATANT_ITEMSLOTS_COUNTER,d1
                sub.w   d6,d1
                jsr     GetItemAndNumberHeld
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
                
@LoadItemIcon:
                ; Load icon pixel data to temp space
                move.w  d5,d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                movea.l (p_Icons).l,a0
                mulu.w  #ICONTILES_BYTESIZE,d1
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    adda.l  d1,a0
                else
                    adda.w  d1,a0
                endif
                movea.l a2,a1
                move.w  #ICONTILES_BYTESIZE,d7
                jsr     (CopyBytes).w   
                
                ; Draw cracks over icon if item is broken
                move.w  d5,d1
                btst    #ITEMENTRY_BIT_BROKEN,d1
                beq.s   @CleanIconCorners
                
                movea.l (p_Icons).l,a0
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    adda.l  #ICONTILES_OFFSET_CRACKS,a0
                else
                    lea     ICONTILES_OFFSET_CRACKS(a0),a0
                endif
                move.w  #ICONTILES_CRACKS_PIXELS_COUNTER,d0
                
@DrawCracks_Loop:
                move.b  (a0)+,d1
                beq.s   @NextCrack
                andi.w  #$F0,d1
                beq.s   @Continue1
                andi.b  #$F,(a1)
                
@Continue1:
                move.b  -1(a0),d1
                andi.w  #$F,d1
                beq.s   @Continue2
                andi.b  #$F0,(a1)
                
@Continue2:
                move.b  -1(a0),d1
                or.b    d1,(a1)
                
@NextCrack:
                addq.l  #1,a1
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
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ITEM_NOTHING_STRING,a1
                moveq   #10,d7          ; string length
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
@WriteJewels:
                if (ALTERNATE_JEWEL_ICONS_DISPLAY=0)
                tst.w   character_index(a6)
                bne.w   @DmaIcons       ; skip if anyone other than Bowie
                chkFlg  $180            ; Set after Bowie obtains the jewel of light/evil... whichever it is
                beq.w   @DmaIcons       ; skip if we haven't obtained Jewel of Light
                
                lea     aJewel(pc), a0  
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_STRING_START,a1
                moveq   #8,d7           ; string length
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
                ; Copy icon tiles to window layout
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_OF_LIGHT,a1
                bsr.w   CopyMemberScreenIconsToVdpTileOrder
                
                ; Load Jewel of Light icon pixel data to temp space
                move.w  #ICON_JEWEL_OF_LIGHT,d1
                movea.l (p_Icons).l,a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addJewelIconOffset
                movea.l a2,a1
                move.w  #ICONTILES_BYTESIZE,d7
                jsr     (CopyBytes).w   
                bsr.w   CleanMemberStatsIconCorners
                adda.w  #ICONTILES_BYTESIZE,a2
                
                chkFlg  $181            ; Set after Bowie obtains King Galam's jewel
                beq.s   @DmaIcons       ; skip if we haven't obtained Jewel of Evil
                
                ; Copy icon tiles to window layout
                movea.l window_tile_address(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_OF_EVIL,a1
                bsr.s   CopyMemberScreenIconsToVdpTileOrder
                
                ; Append 'S' character to 'JEWEL' string if we obtained both jewels
                movea.l window_tile_address(a6),a1
                move.w  #VDPTILE_UPPERCASE_S|VDPTILE_PALETTE3|VDPTILE_PRIORITY,WINDOW_MEMBERSTATUS_OFFSET_JEWEL_STRING_END(a1)
                
                ; Load Jewel of Evil icon pixel data to temp space
                move.w  #ICON_JEWEL_OF_EVIL,d1
                movea.l (p_Icons).l,a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addJewelIconOffset
                movea.l a2,a1
                move.w  #ICONTILES_BYTESIZE,d7
                jsr     (CopyBytes).w   
                bsr.s   CleanMemberStatsIconCorners
                endif
                
@DmaIcons:
                ; DMA icons pixel data
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

CleanMemberStatsIconCorners:
                ori.b   #$F0,(a1)
                ori.b   #$F,$23(a1)
                ori.b   #$F0,$9C(a1)
                ori.b   #$F,$BF(a1)
                rts

    ; End of function CleanMemberStatsIconCorners

aNothing_0:     dc.b '\Nothing',0
aEquipped_0:    dc.b '\Equipped',0
aNothing_1:     dc.b '\Nothing',0
aJewel:         dc.b 'JEWEL',0
