
; ASM FILE code\common\menus\memberscreen.asm :
; 0x11C2A..0x12606 : Menu engine, part 4 : Member screen functions

; =============== S U B R O U T I N E =======================================

; Create and display member screen.
; 
;   In: d0.w = member index

portraitIndex = -12
goldWindowSlot = -10
kdWindowSlot = -8
portraitWindowSlot = -6
statusWindowSlot = -4
member = -2

BuildMemberScreen:
                
                module
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a2,-(sp)
                link    a6,#-16
                move.w  d0,member(a6)
                clr.b   ((PORTRAIT_IS_MIRRORED_TOGGLE-$1000000)).w
                clr.b   ((PORTRAIT_IS_ON_RIGHT_TOGGLE-$1000000)).w
                move.w  #WINDOW_MEMBERSTATUS_SIZE,d0
                move.w  #WINDOW_MEMBERSTATUS_DEST,d1
                jsr     (CreateWindow).w ; stats window, on the right
                move.w  d0,statusWindowSlot(a6)
                move.w  #WINDOW_MEMBER_PORTRAIT_SIZE,d0
                move.w  #WINDOW_MEMBER_PORTRAIT_DEST,d1
                jsr     (CreateWindow).w ; portrait, upper left
                move.w  d0,portraitWindowSlot(a6)
                addq.w  #1,d0
                move.w  d0,((PORTRAIT_WINDOW_INDEX-$1000000)).w
                move.w  #WINDOW_MEMBER_KD_SIZE,d0
                move.w  #WINDOW_MEMBER_KD_DEST,d1
                jsr     (CreateWindow).w ; kills/defeat, middle left
                move.w  d0,kdWindowSlot(a6)
                move.w  #WINDOW_MEMBER_GOLD_SIZE,d0
                move.w  #WINDOW_MEMBER_GOLD_DEST,d1
                jsr     (CreateWindow).w ; gold, bottom left
                move.w  d0,goldWindowSlot(a6)
                move.w  member(a6),d0
                bsr.w   GetCombatantPortrait
                move.w  d0,portraitIndex(a6)
                bsr.w   LoadMemberScreenWindowLayouts
                move.w  portraitIndex(a6),d0
                blt.s   @loc_1
                bsr.w   GetAllyPortrait 
                bsr.w   LoadPortrait    
@loc_1:
                
                move.w  statusWindowSlot(a6),d0
                move.w  #WINDOW_MEMBERSTATUS_POSITION,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  kdWindowSlot(a6),d0
                move.w  #WINDOW_MEMBER_KD_POSITION,d1
                jsr     (MoveWindowWithSfx).w
                move.w  portraitIndex(a6),d0
                blt.s   @loc_2
                move.w  portraitWindowSlot(a6),d0
                move.w  #WINDOW_MEMBER_PORTRAIT_POSITION,d1
                jsr     (MoveWindowWithSfx).w
@loc_2:
                
                move.w  member(a6),d0
                tst.b   d0
                blt.s   @loc_3
                move.w  goldWindowSlot(a6),d0
                move.w  #WINDOW_MEMBER_GOLD_POSITION,d1
                jsr     (MoveWindowWithSfx).w
@loc_3:
                
                jsr     (WaitForWindowMovementEnd).w
                move.w  #VDPTILE_PORTRAITTILE1|VDPTILE_PALETTE2|VDPTILE_PRIORITY,((PORTRAIT_VDPTILES-$1000000)).w
                move.w  #20,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_PerformPortraitBlinking
                move.b  #-1,((BLINK_CONTROL_TOGGLE-$1000000)).w
                lea     ((ENTITY_DATA-$1000000)).w,a0
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                bne.s   @loc_4
                clr.w   d0
                bra.s   @loc_6
@loc_4:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @loc_5
                clr.w   d0
                bra.s   @loc_6
@loc_5:
                
                jsr     j_GetEntityIndexForCombatant
@loc_6:
                
                move.l  a1,-(sp)
                move.w  d0,d1
                addi.w  #16,d1
                lea     ((byte_FFAFA0-$1000000)).w,a1
                adda.w  d1,a1
                move.b  (a1),d1
                move.w  d1,-(sp)
                move.b  #1,(a1)
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                adda.w  d0,a0
                move.w  #576,d0
                move.w  #1856,d1
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   @MapOnForeground
                add.w   ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d0
                add.w   ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d1
                bra.s   @loc_8
@MapOnForeground:
                
                add.w   ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d0
                add.w   ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d1
@loc_8:
                
                move.b  ENTITYDEF_OFFSET_LAYER(a0),d7
                move.w  d7,-(sp)
                move.w  ENTITYDEF_OFFSET_XDEST(a0),-(sp)
                move.w  ENTITYDEF_OFFSET_YDEST(a0),-(sp)
                move.w  ENTITYDEF_OFFSET_FACING(a0),-(sp)
                move.w  d0,(a0)
                move.w  d1,ENTITYDEF_OFFSET_Y(a0)
                move.w  d0,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d1,ENTITYDEF_OFFSET_YDEST(a0)
                move.b  #64,ENTITYDEF_OFFSET_LAYER(a0)
                andi.b  #$7F,ENTITYDEF_OFFSET_FLAGS_B(a0) 
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                bne.s   @loc_9
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                move.w  member(a6),d0
                jsr     j_GetAllyMapsprite
                clr.w   d0
                moveq   #DOWN,d1
                moveq   #-1,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
                bra.s   @waitForInput_Loop
@loc_9:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @waitForInput_Loop
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                clr.w   d0
                moveq   #DOWN,d1
                moveq   #-1,d2
                move.w  #MAPSPRITE_FLAME1,d3
                jsr     (UpdateEntityProperties).w
@waitForInput_Loop:
                
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d0
                andi.b  #INPUT_B|INPUT_C|INPUT_A,d0
                beq.s   @waitForInput_Loop
                
                move.w  (sp)+,ENTITYDEF_OFFSET_FACING(a0)
                move.w  (sp)+,d1
                move.w  (sp)+,d0
                move.w  d0,(a0)
                move.w  d1,ENTITYDEF_OFFSET_Y(a0)
                move.w  d0,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d1,ENTITYDEF_OFFSET_YDEST(a0)
                move.w  (sp)+,d7
                move.b  d7,ENTITYDEF_OFFSET_LAYER(a0)
                move.w  (sp)+,d0
                move.b  d0,(a1)
                movea.l (sp)+,a1
                clr.b   ((BLINK_CONTROL_TOGGLE-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_REMOVE
                dc.l VInt_PerformPortraitBlinking
                move.w  statusWindowSlot(a6),d0
                move.w  #$2001,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  kdWindowSlot(a6),d0
                move.w  #$F80B,d1
                jsr     (MoveWindowWithSfx).w
                move.w  portraitIndex(a6),d0
                blt.s   @loc_11
                move.w  portraitWindowSlot(a6),d0
                move.w  #$F8F6,d1
                jsr     (MoveWindowWithSfx).w
@loc_11:
                
                move.w  member(a6),d0
                tst.b   d0
                blt.s   @loc_12
                move.w  goldWindowSlot(a6),d0
                move.w  #$F81C,d1
                jsr     (MoveWindowWithSfx).w
@loc_12:
                
                clr.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                jsr     (WaitForVInt).w
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                bne.s   @loc_16
                clr.w   d0
                tst.b   ((PLAYER_TYPE-$1000000)).w
                bne.s   @loc_13
                jsr     j_GetAllyMapsprite
                bra.s   @loc_15
@loc_13:
                
                cmpi.b  #PLAYERTYPE_CARAVAN,((PLAYER_TYPE-$1000000)).w
                bne.s   @loc_14
                moveq   #MAPSPRITE_CARAVAN,d4
                bra.s   @loc_15
@loc_14:
                
                moveq   #MAPSPRITE_RAFT,d4
@loc_15:
                
                clr.w   d0
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_FACING(a0),d1
                moveq   #-1,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
                bra.s   @loc_17
@loc_16:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @loc_17
                clr.w   d0
                jsr     j_GetAllyMapsprite
                clr.w   d0
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_FACING(a0),d1
                moveq   #-1,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
@loc_17:
                
                jsr     (WaitForWindowMovementEnd).w
                move.w  goldWindowSlot(a6),d0
                jsr     (DeleteWindow).w
                move.w  kdWindowSlot(a6),d0
                jsr     (DeleteWindow).w
                move.w  portraitWindowSlot(a6),d0
                jsr     (DeleteWindow).w
                move.w  statusWindowSlot(a6),d0
                jsr     (DeleteWindow).w
                unlk    a6
                movem.l (sp)+,d0-a2
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function BuildMemberScreen

                modend

; =============== S U B R O U T I N E =======================================

; In: a1 = current cursor position in the layout
;     d0.l = VDP tile entries

windowLayoutStartAddress = -6
member = -2

WriteStatusEffectTiles:
                
                move.l  d0,(a1)
                subq.l  #4,a1
                cmpi.w  #VDPTILE_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)
                beq.s   @Return
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #$78,a1 
@Return:
                
                rts

    ; End of function WriteStatusEffectTiles


; =============== S U B R O U T I N E =======================================

portraitIndex = -12
goldWindowSlot = -10
kdWindowSlot = -8
portraitWindowSlot = -6
statusWindowSlot = -4
member = -2

LoadMemberScreenWindowLayouts:
                
                move.w  statusWindowSlot(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  member(a6),d0
                bsr.w   BuildMemberStatusWindow
                move.w  kdWindowSlot(a6),d0
                lea     layout_AllyKillDefeatWindow(pc), a0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #WINDOW_MEMBER_KD_LAYOUT_BYTESIZE,d7
                jsr     (CopyBytes).w   
                adda.w  #WINDOW_MEMBER_KD_TEXT_KILLS_OFFSET,a1
                move.w  member(a6),d0
                tst.b   d0
                blt.s   @CheckDebugMode ; character index is negative (an enemy), so do not display kills
                
                ; Write kills and defeats
                jsr     j_GetKills
                move.w  d1,d0
                ext.l   d0
                moveq   #WINDOW_MEMBER_KD_TEXT_KILLS_LENGTH,d7
                bsr.w   WriteTilesFromNumber
                adda.w  #WINDOW_MEMBER_KD_TEXT_DEFEATS_OFFSET,a1
                move.w  member(a6),d0
                jsr     j_GetDefeats
                move.w  d1,d0
                ext.l   d0
                moveq   #WINDOW_MEMBER_KD_TEXT_DEFEATS_LENGTH,d7
                bsr.w   WriteTilesFromNumber
@CheckDebugMode:
                
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   @CheckPortrait
                
                ; Write combatant index inside kills/defeat window in debug mode
                move.w  kdWindowSlot(a6),d0
                lea     layout_AllyKillDefeatWindow(pc), a0
                move.w  #$101,d1
                jsr     (GetWindowTileAddress).w
                move.w  member(a6),d0   ; get character index from stack
                lsr.w   #NIBBLE_SHIFT_COUNT,d0
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d0
                cmpi.w  #10,d0
                blt.s   @loc_2
                
                addi.w  #VDPTILE_NUMBER_7|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
                bra.s   @WriteIndexFirstDigit
@loc_2:
                
                addi.w  #VDPTILE_NUMBER_0|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
@WriteIndexFirstDigit:
                
                move.w  d0,(a1)+
                move.w  member(a6),d0
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d0
                cmpi.w  #10,d0
                blt.s   @loc_4
                
                addi.w  #VDPTILE_NUMBER_7|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
                bra.s   @WriteIndexSecondDigit
@loc_4:
                
                addi.w  #VDPTILE_NUMBER_0|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
@WriteIndexSecondDigit:
                
                move.w  d0,(a1)+
@CheckPortrait:
                
                move.w  portraitIndex(a6),d0
                blt.s   @Return         ; return if no portrait to display (and assume that it's an enemy, so skip drawing gold window as well)
                
                move.w  portraitWindowSlot(a6),d0
                lea     tiles_WindowBorder(pc), a0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #160,d7
                jsr     (CopyBytes).w   
                lea     layout_GoldWindow(pc), a0
                move.w  goldWindowSlot(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #64,d7
                jsr     (CopyBytes).w   
                adda.w  #$22,a1 
                jsr     j_GetGold
                move.l  d1,d0
                moveq   #6,d7
                bsr.w   WriteTilesFromNumber
@Return:
                
                rts

    ; End of function LoadMemberScreenWindowLayouts

aNA:            dc.b 'N/A',0

; =============== S U B R O U T I N E =======================================

; In: a1 = window tile adress, d0.w = combatant index

windowLayoutStartAddress = -6
member = -2

BuildMemberStatusWindow:
                
                module
                link    a6,#-6
                move.w  d0,member(a6)
                move.l  a1,windowLayoutStartAddress(a6)
                
                ; Copy window layout
                getPointer p_layout_MemberStatusWindow, a0
                move.w  #WINDOW_MEMBERSTATUS_LAYOUT_BYTESIZE,d7
                jsr     (CopyBytes).w   
                
                ; Write character name
                move.w  member(a6),d0
                movea.l windowLayoutStartAddress(a6),a1
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
                
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_STATUSEFFECT_TILES,a1
                lea     ((byte_FFB852-$1000000)).w,a0 ; unused (?)
                move.w  member(a6),d0
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
                beq.s   @WriteCurrentHP
                move.l  #VDPTILES_STATUSEFFECT_SLOW,d0
                bsr.w   WriteStatusEffectTiles
@WriteCurrentHP:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentHp
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteMaxHP
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_CURRENT_HP,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteMaxHP:
                
                move.w  member(a6),d0
                jsr     j_GetMaxHp
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteCurrentMP
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAX_HP,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteCurrentMP:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentMp
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteMaxMP
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_CURRENT_MP,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteMaxMP:
                
                move.w  member(a6),d0
                jsr     j_GetMaxMp
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteLVandEXP
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAX_MP,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteLVandEXP:
                
                move.w  member(a6),d0
                tst.b   d0
                blt.s   @WriteEnemyLVandEXP
                jsr     j_GetCurrentLevel
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_LV,a1
                moveq   #LV_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
                move.w  member(a6),d0
                jsr     j_GetCurrentExp
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_EXP,a1
                moveq   #EXP_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
                bra.s   @WriteATT
@WriteEnemyLVandEXP:
                
                lea     aNA(pc), a0     
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ENEMY_LV,a1
                moveq   #WINDOW_MEMBERSTATUS_NA_STRING_LENGTH,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                lea     aNA(pc), a0     
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ENEMY_EXP,a1
                moveq   #WINDOW_MEMBERSTATUS_NA_STRING_LENGTH,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
@WriteATT:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentAtt
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteDEF
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ATT,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteDEF:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentDef
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteAGI
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_DEF,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteAGI:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentAgi
                andi.w  #DISPLAYED_AGI_VALUE_MASK,d1
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteMOV
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_AGI,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteMOV:
                
                move.w  member(a6),d0
                jsr     j_GetCurrentMov
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d1
                bge.s   @WriteSpells
                movea.l windowLayoutStartAddress(a6),a1
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
                movea.l windowLayoutStartAddress(a6),a1
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
                movem.l d1/a0,-(sp)
                jsr     j_FindSpellDefAddress
                btst    #SPELLPROPS_BIT_AFFECTEDBYSILENCE,SPELLDEF_OFFSET_PROPS(a0)
                movem.l (sp)+,d1/a0
                beq.w   @NextSpell
                
                ; Write icon tiles
                bsr.w   WriteMemberScreenIcons
                
                ; Write spell name
                movem.w d0-d1/d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                jsr     j_FindSpellName
                addq.w  #4,a1           ; offset to spell name relative from start
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movem.l (sp)+,a0-a1
                movem.w (sp)+,d0-d1/d6-d7
                
                ; Write spell level indicator tiles
                movem.w d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                lea     layout_SpellLevelIndicator(pc), a0
                andi.w  #SPELLENTRY_MASK_LV,d1
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsr.w   #NIBBLE_SHIFT_COUNT,d1
                adda.w  d1,a0
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_SPELL_LV_TILES,a1
                moveq   #12,d7          ; spell level VDP tiles bytes size
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
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAGIC_NOTHING_STRING,a1
                moveq   #-42,d1
                moveq   #10,d7          ; string length
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
@WriteItems:
                
                move.w  member(a6),d0
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                tst.w   d2
                beq.w   @WriteItemNothingString
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ITEM_START,a1
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d6
@ItemNames_Loop:
                
                move.w  member(a6),d0
                move.w  #COMBATANT_ITEMSLOTS_COUNTER,d1
                sub.w   d6,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.b  #ITEM_NOTHING,d1
                beq.w   @WriteJewelString
                
                ; Write icon tiles to window layout
                bsr.w   WriteMemberScreenIcons
                
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
                movea.l windowLayoutStartAddress(a6),a1
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
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_STRING_START,a1
                moveq   #-42,d1
                moveq   #8,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
                
                ; Copy icon tiles to window layout
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_OF_LIGHT,a1
                move.w  #$92,d1 ; ?
                bsr.w   WriteMemberScreenIcons
                chkFlg  385             ; Set after Bowie obtains King Galam's jewel
                beq.s   @LoadSpellIcons
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_JEWEL_OF_EVIL,a1
                move.w  #$92,d1 ; ?
                bsr.w   WriteMemberScreenIcons
                
                ; Append 'S' character to 'JEWEL' string if we obtained both jewels
                movea.l windowLayoutStartAddress(a6),a1
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
                getPointer p_Icons, a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addIconOffset d1, a0
                move.w  #ICON_TILE_BYTESIZE,d7
                jsr     (CopyBytes).w
                ori.b   #BYTE_UPPER_NIBBLE_MASK,(a1)
                ori.b   #BYTE_LOWER_NIBBLE_MASK,$23(a1)
                ori.b   #BYTE_UPPER_NIBBLE_MASK,$9C(a1)
                ori.b   #BYTE_LOWER_NIBBLE_MASK,$BF(a1)
                movea.l (sp)+,a0
                adda.w  #ICON_TILE_BYTESIZE,a1
@NextSpellIcon:
                
                dbf     d6,@SpellIcons_Loop
@LoadItemIcons:
                
                moveq   #3,d6
@ItemIcons_Loop:
                
                moveq   #3,d1
                sub.w   d6,d1
                move.w  member(a6),d0
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.b  #ITEM_NOTHING,d1
                beq.w   @LoadJewelIcons
                move.l  a0,-(sp)
                move.w  d1,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                getPointer p_Icons, a0
                mulu.w  #ICON_TILE_BYTESIZE,d1
                addIconOffset d1, a0
                move.w  #ICON_TILE_BYTESIZE,d7
                jsr     (CopyBytes).w   
                move.w  (sp)+,d1
                btst    #ITEMENTRY_BIT_BROKEN,d1
                beq.s   @CleanIconCorners
                movem.l d2-d3/a0-a1,-(sp)
                getPointer p_Icons, a0
                lea     ICONS_OFFSET_CRACKS(a0),a0
                move.w  #ICON_PIXELS_BYTE_COUNTER,d2
@DrawCracks_Loop:
                
                move.b  (a0)+,d3
                beq.s   @NextCrack
                andi.w  #BYTE_UPPER_NIBBLE_MASK,d3
                beq.s   @Continue1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,(a1)
@Continue1:
                
                move.b  -1(a0),d3
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d3
                beq.s   @Continue2
                andi.b  #BYTE_UPPER_NIBBLE_MASK,(a1)
@Continue2:
                
                move.b  -1(a0),d3
                or.b    d3,(a1)
@NextCrack:
                
                addq.l  #1,a1
                dbf     d2,@DrawCracks_Loop
                movem.l (sp)+,d2-d3/a0-a1
@CleanIconCorners:
                
                ori.b   #BYTE_UPPER_NIBBLE_MASK,(a1)
                ori.b   #BYTE_LOWER_NIBBLE_MASK,$23(a1)
                ori.b   #BYTE_UPPER_NIBBLE_MASK,$9C(a1)
                ori.b   #BYTE_LOWER_NIBBLE_MASK,$BF(a1)
                movea.l (sp)+,a0
                adda.w  #ICON_TILE_BYTESIZE,a1
                dbf     d6,@ItemIcons_Loop
@LoadJewelIcons:
                
                move.w  #ICON_JEWEL_OF_LIGHT,d1
                getPointer p_Icons, a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addIconOffset d1, a0
                move.w  #ICON_TILE_BYTESIZE,d7
                jsr     (CopyBytes).w   
                ori.b   #BYTE_UPPER_NIBBLE_MASK,(a1)
                ori.b   #BYTE_LOWER_NIBBLE_MASK,$23(a1)
                ori.b   #BYTE_UPPER_NIBBLE_MASK,$9C(a1)
                ori.b   #BYTE_LOWER_NIBBLE_MASK,$BF(a1)
                adda.w  #ICON_TILE_BYTESIZE,a1
                move.w  #ICON_JEWEL_OF_EVIL,d1
                getPointer p_Icons, a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addIconOffset d1, a0
                move.w  #ICON_TILE_BYTESIZE,d7
                jsr     (CopyBytes).w   
                ori.b   #BYTE_UPPER_NIBBLE_MASK,(a1)
                ori.b   #BYTE_LOWER_NIBBLE_MASK,$23(a1)
                ori.b   #BYTE_UPPER_NIBBLE_MASK,$9C(a1)
                ori.b   #BYTE_LOWER_NIBBLE_MASK,$BF(a1)
                adda.w  #ICON_TILE_BYTESIZE,a1
                
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


WriteMemberScreenIcons:
                
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

    ; End of function WriteMemberScreenIcons

