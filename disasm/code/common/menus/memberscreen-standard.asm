
; ASM FILE code\common\menus\memberscreen-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; Create and display member screen.
; 
;   In: d0.w = member index

portraitIndex = -12
goldWindowSlot = -10
currentProwess = goldWindowSlot
kdWindowSlot = -8
portraitWindowSlot = -6
statusWindowSlot = -4
member = -2

BuildMemberScreen:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a2,-(sp)
                link    a6,#-12
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
            if (EXTENDED_STATUS=1)
                move.w  member(a6),d2
                tst.b   d2
                bpl.s   @CreateKdWindow
                
                move.w  #WINDOW_MEMBER_KD_ENEMY_SIZE,d0 ; create a shorter window for enemies
            endif
@CreateKdWindow:
                
                move.w  #WINDOW_MEMBER_KD_DEST,d1
                jsr     (CreateWindow).w ; kills/defeat, middle left
                move.w  d0,kdWindowSlot(a6)
            if (EXTENDED_STATUS=0)
                ; Skip the gold window if displaying resistance and prowess
                move.w  #WINDOW_MEMBER_GOLD_SIZE,d0
                move.w  #WINDOW_MEMBER_GOLD_DEST,d1
                jsr     (CreateWindow).w ; gold, bottom left
                move.w  d0,goldWindowSlot(a6)
            endif
                move.w  member(a6),d0
                bsr.w   GetCombatantPortrait
                move.w  d0,portraitIndex(a6)
                bsr.w   LoadMemberScreenWindowLayouts
                move.w  portraitIndex(a6),d0
                blt.s   @loc_1
            if (VANILLA_BUILD=1)
                bsr.w   GetAllyPortrait 
            endif
                bsr.w   LoadPortrait
                
@loc_1:         move.w  statusWindowSlot(a6),d0
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
            if (EXTENDED_STATUS=0)
                ; Skip the gold window if displaying resistance and prowess
                move.w  member(a6),d0
                tst.b   d0
                blt.s   @loc_3
                
                move.w  goldWindowSlot(a6),d0
                move.w  #WINDOW_MEMBER_GOLD_POSITION,d1
                jsr     (MoveWindowWithSfx).w
            endif
@loc_3:
            if (EXTENDED_STATUS=1)
                ; DMA element icon tiles
                lea     tiles_ElementIcons(pc),a0
                lea     (MEMBER_SCREEN_ELEMENT_ICONS_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                lea     (MEMBER_SCREEN_ELEMENT_ICONS_LOADING_SPACE).l,a0
                moveq   #32,d2
                movea.w d2,a1
                move.w  #128,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
            endif
                jsr     (WaitForWindowMovementEnd).w
                move.w  #VDPTILE_PORTRAITTILE1|VDPTILE_PALETTE2|VDPTILE_PRIORITY,((PORTRAIT_VDPTILES-$1000000)).w
                move.w  #20,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_PerformPortraitBlinking
                st      ((BLINK_CONTROL_TOGGLE-$1000000)).w
                lea     ((ENTITY_DATA-$1000000)).w,a0
                checkSavedByte #NOT_CURRENTLY_IN_BAttLE, CURRENT_BAttLE
                bne.s   @loc_4
                
                clr.w   d0
                bra.s   @loc_6
                
@loc_4:         move.w  member(a6),d0
                jsr     GetCurrentHp
                tst.w   d1
                bne.s   @loc_5
                
                clr.w   d0
                bra.s   @loc_6
                
                ; Move mapsprite to inside the K/D window
@loc_5:         jsr     GetEntityIndexForCombatant
@loc_6:         move.l  a1,-(sp)
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
                
@loc_8:         move.b  ENTITYDEF_OFFSET_LAYER(a0),d7
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
                checkSavedByte #NOT_CURRENTLY_IN_BAttLE, CURRENT_BAttLE
                bne.s   @loc_9
                
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                move.w  member(a6),d0
                jsr     GetAllyMapsprite
                clr.w   d0
                moveq   #DOWN,d1
                moveq   #-1,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
                bra.s   @WaitForInput_Loop
                
@loc_9:         move.w  member(a6),d0
                jsr     GetCurrentHp
                tst.w   d1
                bne.s   @WaitForInput_Loop
                
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                clr.w   d0
                moveq   #DOWN,d1
                moveq   #-1,d2
                move.w  #MAPSPRITE_FLAME1,d3
                jsr     (UpdateEntityProperties).w
@WaitForInput_Loop:
                
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d0
                andi.b  #INPUT_B|INPUT_C|INPUT_A,d0
                beq.s   @WaitForInput_Loop
                
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
            if (EXTENDED_STATUS=0)
                ; Skip the gold window if displaying resistance and prowess
                move.w  member(a6),d0
                tst.b   d0
                blt.s   @loc_12
                
                move.w  goldWindowSlot(a6),d0
                move.w  #$F81C,d1
                jsr     (MoveWindowWithSfx).w
            endif
@loc_12:        clr.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                jsr     (WaitForVInt).w
                checkSavedByte #NOT_CURRENTLY_IN_BAttLE, CURRENT_BAttLE
                bne.s   @loc_16
                
                clr.w   d0
                checkSavedByte #PLAYERTYPE_BOWIE, PLAYER_TYPE
                bne.s   @loc_13
                
                jsr     GetAllyMapsprite
                bra.s   @loc_15
                
@loc_13:        checkSavedByte #PLAYERTYPE_CARAVAN, PLAYER_TYPE
                bne.s   @Raft
                
                move.w   #MAPSPRITE_CARAVAN,d4
                bra.s   @loc_15
                
@Raft:          move.w   #MAPSPRITE_RAFT,d4
@loc_15:        clr.w   d0
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_FACING(a0),d1
                moveq   #-1,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
                bra.s   @loc_17
                
@loc_16:        move.w  member(a6),d0
                jsr     GetCurrentHp
                tst.w   d1
                bne.s   @loc_17
                
                clr.w   d0
                jsr     GetAllyMapsprite
                clr.w   d0
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_FACING(a0),d1
                moveq   #-1,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
@loc_17:        jsr     (WaitForWindowMovementEnd).w
            if (EXTENDED_STATUS=0)
                ; Skip the gold window if displaying resistance and prowess
                move.w  goldWindowSlot(a6),d0
                jsr     (DeleteWindow).w
            endif
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


; =============== S U B R O U T I N E =======================================

; In: a1 = current cursor position in the layout

windowLayoutStartAddress = -6
member = -2

WriteStatusEffectTiles:
                
                move.l  d0,(a1)
                subq.l  #4,a1
                cmpi.w  #VDPTILE_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)
                beq.s   @Return
                
            if (THREE_DIGITS_STATS|FULL_CLASS_NAMES=1)
                addi.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d3
                movea.l d3,a1
            else
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #$78,a1
            endif
@Return:        rts

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
            if (EXTENDED_STATUS=1)
                move.w  member(a6),d0
                tst.b   d0
                bpl.s   @CopyKdWindowLayout
                
                move.w  #WINDOW_MEMBER_KD_LAYOUT_ENEMY_BYTESIZE,d7 ; 
            endif
@CopyKdWindowLayout:
                
                jsr     (CopyBytes).w   
            if (ALTERNATE_JEWEL_ICONS_DISPLAY=1)
                ; Display small jewel icons next to Bowie's mapsprite
                tst.w   member(a6)
                bne.s   @SkipJewels         ; skip if anyone other than Bowie
                move.l  a1,-(sp)
                adda.w  #26,a1              ; offset into window layout
                chkFlg  384                 ; Set after Bowie obtains the jewel of light
                beq.s   @CheckJewelOfEvil
                move.w  #VDPTILE_JEWEL_OF_LIGHT|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)
@CheckJewelOfEvil:
                
                chkFlg  385                 ; Set after Bowie obtains the jewel of evil
                beq.s   @SkipJewelOfEvil
                
                adda.w  #2,a1
                move.w  #VDPTILE_JEWEL_OF_EVIL|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)
@SkipJewelOfEvil:
                
                movea.l (sp)+,a1
            endif
@SkipJewels:    
            if (EXTENDED_STATUS=1)
                bsr.w   WriteProwessIndicatorsAndChances
                addq.w  #2,a1 ; advance one position
                move.w  member(a6),d0
                tst.b   d0
                bpl.s   @WriteKd
                
                ; Cut the window short for enemies
                move.w  kdWindowSlot(a6),d0
                lea     layout_AllyKillDefeatWindowTailForEnemy(pc), a0
                move.w  #$C,d1
                jsr     (GetWindowTileAddress).w ; Get pointer to tile at coordinates d1.w in layout for window d0.w -> a1
                move.w  #WINDOW_MEMBER_KD_LAYOUT_TAIL_BYTESIZE,d7
                jsr     (CopyBytes).w
                bra.s   @CheckDebugMode
            else
                move.w  member(a6),d0
                tst.b   d0
                bmi.s   @CheckDebugMode ; do not display kills or defeats for enemies
            endif
                ; Write kills and defeats
@WriteKd:       adda.w  #WINDOW_MEMBER_KD_TEXT_KILLS_OFFSET,a1
                jsr     GetKills
                move.w  d1,d0
                ext.l   d0
                moveq   #WINDOW_MEMBER_KD_TEXT_KILLS_LENGTH,d7
                bsr.w   WriteTilesFromNumber
                adda.w  #WINDOW_MEMBER_KD_TEXT_DEFEATS_OFFSET,a1
                move.w  member(a6),d0
                jsr     GetDefeats
                move.w  d1,d0
                ext.l   d0
                moveq   #WINDOW_MEMBER_KD_TEXT_DEFEATS_LENGTH,d7
                bsr.w   WriteTilesFromNumber
@CheckDebugMode:
                
                ; Check debug mode toggle
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   @CheckPortrait
                
                ; Write combatant index inside kills/defeat window in debug mode
                move.w  kdWindowSlot(a6),d0
                lea     layout_AllyKillDefeatWindow(pc), a0
                move.w  #$101,d1        ; tile coordinates 1,1
                jsr     (GetWindowTileAddress).w
                move.w  member(a6),d0   ; get character index from stack
                lsr.w   #NIBBLE_SHIFT_COUNT,d0
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d0
                cmpi.w  #10,d0
                blt.s   @loc_2
                
                addi.w  #$C037,d0 ; VDPTILE_NUMBER_7|VDPTILE_PALETTE3|VDPTILE_PRIORITY
                bra.s   @WriteIndexFirstDigit
                
@loc_2:         addi.w  #$C030,d0 ; VDPTILE_NUMBER_0|VDPTILE_PALETTE3|VDPTILE_PRIORITY
@WriteIndexFirstDigit:
                
                move.w  d0,(a1)+
                move.w  member(a6),d0
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d0
                cmpi.w  #10,d0
                blt.s   @loc_4
                
                addi.w  #$C037,d0 ; VDPTILE_NUMBER_7|VDPTILE_PALETTE3|VDPTILE_PRIORITY
                bra.s   @WriteIndexSecondDigit
                
@loc_4:         addi.w  #$C030,d0 ; VDPTILE_NUMBER_0|VDPTILE_PALETTE3|VDPTILE_PRIORITY
@WriteIndexSecondDigit:
                
                move.w  d0,(a1)+
@CheckPortrait: move.w  portraitIndex(a6),d0
                blt.s   @Return         ; return if no portrait to display (and assume that it's an enemy, so skip drawing gold window as well)
                
                move.w  portraitWindowSlot(a6),d0
                lea     tiles_WindowBorder(pc), a0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #160,d7
                jsr     (CopyBytes).w
                
            if (EXTENDED_STATUS=0)
                ; Skip the gold window if displaying resistance and prowess
                lea     layout_GoldWindow(pc), a0
                move.w  goldWindowSlot(a6),d0
                clr.w   d1              ; tile coordinates 0,0
                jsr     (GetWindowTileAddress).w
                move.w  #64,d7
                jsr     (CopyBytes).w   
                adda.w  #34,a1 
                jsr     GetGold
                move.l  d1,d0
                moveq   #6,d7
                bsr.w   WriteTilesFromNumber
            endif
@Return:        rts

    ; End of function LoadMemberScreenWindowLayouts


; =============== S U B R O U T I N E =======================================


WriteProwessIndicatorsAndChances:
                
                ; Write CRT indicator and chance
                adda.w  #WINDOW_MEMBER_KD_OFFSET_TO_CRITICAL_INDICATOR,a1
                move.w  member(a6),d0
                jsr     GetCurrentProwess
                move.w  d1,currentProwess(a6)
                
                ; Is 150% or more damage critical?
                andi.w  #PROWESS_MASK_CRITICAL,d1
                add.w   d1,d1
                lea     table_CriticalHitDefinitions,a0
                move.b  1(a0,d1.w),d1 ; check if damage factor = 1
                subq.w  #1,d1
                bne.s   @WriteAilmentTiles
                
                ; Write enhanced damage CRT indicator
                move.w  #VDPTILE_PLUS_SIGN|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)
@WriteAilmentTiles:
                
                addq.w  #2,a1 ; advance one tile
                move.w  currentProwess(a6),d1
                andi.w  #PROWESS_MASK_CRITICAL,d1
                cmpi.w  #PROWESS_INFLICT_AILMENTS_START,d1
                blo.s   @WriteCriticalChance
                
                ; Write ailment CRT indicator
                subi.w  #PROWESS_INFLICT_AILMENTS_START,d1
                add.w   d1,d1
                add.w   d1,d1
                move.l  table_CriticalAilmentIndicators(pc,d1.w),(a1)
@WriteCriticalChance:
                
                ; Write CRT chance
                adda.w  #WINDOW_MEMBER_KD_OFFSET_TO_CRITICAL_CHANCE,a1 ; offset from current position to CRT chance denominator
                moveq   #2,d7 ; write two digits
                move.w  currentProwess(a6),d1
                andi.w  #PROWESS_MASK_CRITICAL,d1
                add.w   d1,d1
                move.b  (a0,d1.w),d1 ; get chance denominator
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber

                ; Write DBL chance
                adda.w  #WINDOW_MEMBER_KD_OFFSET_TO_DOUBLE_CHANCE,a1 ; offset from current position to DBL chance denominator
                moveq   #2,d7 ; write two digits
                move.w  currentProwess(a6),d1
                lsr.b   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d1
                andi.w  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d1
                move.b  table_DoubleAndCounterChanceDenominators(pc,d1.w),d1
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
                
                ; Write CTR chance
                adda.w  #WINDOW_MEMBER_KD_OFFSET_TO_COUNTER_CHANCE,a1 ; offset from current position to DBL chance denominator
                moveq   #2,d7 ; write two digits
                move.w  currentProwess(a6),d1
                lsr.b   #PROWESS_LOWER_COUNTER_SHIFT_COUNT,d1
                andi.w  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d1
                move.b  table_DoubleAndCounterChanceDenominators(pc,d1.w),d1
                move.w  d1,d0
                ext.l   d0
                bra.w   WriteTilesFromNumber

    ; End of function WriteProwessIndicatorsAndChances

aNA:            dc.b 'N/A',0
                
table_CriticalAilmentIndicators:
                dc.l VDPTILES_STATUSEFFECT_POISON
                dc.l VDPTILES_STATUSEFFECT_SLEEP
                dc.l VDPTILES_STATUSEFFECT_STUN
                dc.l VDPTILES_STATUSEFFECT_MUDDLE
                dc.l VDPTILES_STATUSEFFECT_SLOW
                dc.l VDPTILES_STATUSEFFECT_CURSE
                dc.l VDPTILES_STATUSEFFECT_SILENCE
                
table_DoubleAndCounterChanceDenominators:
                dc.b 32, 16, 8, 4
                
                align
                
; =============== S U B R O U T I N E =======================================

; In: a1 = window tile adress, d0.w = combatant index

BuildMemberStatusWindow:
                
currentResistance = -10 ; used if EXTENDED_STATUS=1
promotionClassType = -8 ; 
windowTilesAddress = -6
member = -2
                
                module
                
@writeMemberStatValue: macro
            if (FULL_CLASS_NAMES=1)
                bsr.s   WriteMemberStatValue
            else
                bsr.w   WriteStatValue
            endif
        endm

@writeMemberLvOrExpValue: macro
            if (FULL_CLASS_NAMES=1)
                bsr.s   WriteMemberLvOrExpValue
            else
                bsr.w   WriteLvOrExpValue
            endif
        endm
                
                movem.l d2-d5/a2,-(sp)
                link    a6,#-10
                move.w  d0,member(a6)
                move.l  a1,windowTilesAddress(a6)
                
                ; Copy window layout
                getPointer p_layout_MemberStatusWindow, a0
            if (FULL_CLASS_NAMES=1)
                move.w  #WINDOW_MEMBERSTATUS_LAYOUT_HEAD_BYTESIZE,d7 ; window layout head bytesize
                jsr     (CopyBytes).w
                adda.w  d7,a0
                adda.w  d7,a1
                tst.b   d0
                bmi.s   @CopyLayoutBody
                suba.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,a0
@CopyLayoutBody:move.w  #WINDOW_MEMBERSTATUS_LAYOUT_BODY_BYTESIZE,d7 ; window layout body bytesize
                jsr     (CopyBytes).w
                adda.w  d7,a0
                adda.w  d7,a1
                tst.b   d0
                bmi.s   @CopyLayoutTail
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,a0
@CopyLayoutTail:move.w  #WINDOW_MEMBERSTATUS_LAYOUT_TAIL_BYTESIZE,d7 ; window layout tail bytesize
                jsr     (CopyBytes).w
            else
                move.w  #WINDOW_MEMBERSTATUS_LAYOUT_BYTESIZE,d7
                jsr     (CopyBytes).w
            endif
                
                ; Write character name
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NAME,a1
                move.w  member(a6),d0
            if (FULL_CLASS_NAMES=1)
                jsr     GetCombatantName
                moveq   #-WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  member(a6),d0
                tst.b   d0
                bmi.s   @AddStatusEffectTiles       ; skip class name if enemy
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_FULLCLASSNAME,a1   ; full class name offset
                jsr     GetClassAndFullName             ; write full class name on single line
                moveq   #0,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
            else
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
            endif
                
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
                bsr.w   WriteStatusEffectTiles
                
@Poison:        ; Poison
                move.w  d1,d2
                andi.w  #STATUSEFFECT_POISON,d2
                beq.s   @Muddle
                move.l  #VDPTILES_STATUSEFFECT_POISON,d0
                bsr.w   WriteStatusEffectTiles
                
@Muddle:        ; Muddle
                move.w  d1,d2
                andi.w  #STATUSEFFECT_MUDDLE,d2
                beq.s   @Silence
                move.l  #VDPTILES_STATUSEFFECT_MUDDLE,d0
                bsr.w   WriteStatusEffectTiles
                
@Silence:       ; Silence
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SILENCE,d2
                beq.s   @Stun
                move.l  #VDPTILES_STATUSEFFECT_SILENCE,d0
                bsr.w   WriteStatusEffectTiles
                
@Stun:          ; Stun
                move.w  d1,d2
                andi.w  #STATUSEFFECT_STUN,d2
                beq.s   @Sleep
                move.l  #VDPTILES_STATUSEFFECT_STUN,d0
                bsr.w   WriteStatusEffectTiles
                
@Sleep:         ; Sleep
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLEEP,d2
                beq.s   @Attack
                move.l  #VDPTILES_STATUSEFFECT_SLEEP,d0
                bsr.w   WriteStatusEffectTiles
                
@Attack:        ; Attack
                move.w  d1,d2
                andi.w  #STATUSEFFECT_AttACK,d2
                beq.s   @Boost
                move.l  #VDPTILES_STATUSEFFECT_AttACK,d0
                bsr.w   WriteStatusEffectTiles
                
@Boost:         ; Boost
                move.w  d1,d2
                andi.w  #STATUSEFFECT_BOOST,d2
                beq.s   @Slow
                move.l  #VDPTILES_STATUSEFFECT_BOOST,d0
                bsr.w   WriteStatusEffectTiles
                
@Slow:          ; Slow
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLOW,d2
                beq.s   @WriteStatValues
                move.l  #VDPTILES_STATUSEFFECT_SLOW,d0
                bsr.w   WriteStatusEffectTiles
                
@WriteStatValues:
            if (EXTENDED_STATUS=1)
                ; Write Promotion indicator
                move.w  member(a6),d0
                jsr     GetClassType
                move.b  d1,promotionClassType(a6)
                beq.s   @WriteHp
                
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_PROMOTION_INDICATOR,a1
                tst.b   d0
                bmi.s   @WritePromotionIndicator
                
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,a1 ; write stat on next line if ally
@WritePromotionIndicator:
                
                move.w  #VDPTILE_PLUS_SIGN|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)
            endif
                ; Current HP
@WriteHp:       move.w  member(a6),d0
                jsr     GetCurrentHp
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_CURRENT_HP,a1
                @writeMemberStatValue
                
                ; Max HP
                move.w  member(a6),d0
                jsr     GetMaxHp
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAX_HP,a1
                @writeMemberStatValue
                
                ; Current MP
                move.w  member(a6),d0
                jsr     GetCurrentMp
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_CURRENT_MP,a1
                @writeMemberStatValue
                
                ; Max MP
                move.w  member(a6),d0
                jsr     GetMaxMp
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MAX_MP,a1
                @writeMemberStatValue
                
                ; LV
                move.w  member(a6),d0
            if (SHOW_ENEMY_LEVEL=0)
                tst.b   d0
              if (EXTENDED_STATUS=1)
                ; Skip writing the level value for enemies and overwrite the EXP field with spaces
                bmi.s   @EraseExpFieldForEnemy
              else
                ; Write "N/A" as the level value
                bmi.s   @EnemyLv
              endif
            endif
                jsr     GetCurrentLevel
            if (EXTENDED_STATUS=1)
                ; Subtract 20 levels from displayed value for enemies if they possess the enhanced spell power property
                tst.b   d0
                bpl.s   @WriteLv
                
                tst.b   promotionClassType(a6)
                beq.s   @WriteLv
                
                subi.w  #CHAR_CLASS_EXTRALEVEL,d1
            endif
@WriteLv:       movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_LV,a1
                @writeMemberLvOrExpValue
                
                ; Exp
                move.w  member(a6),d0
            if (SHOW_ENEMY_LEVEL=1)
                tst.b   d0
              if (EXTENDED_STATUS=1)
                ; Skip writing the experience value for enemies and overwrite the EXP field with spaces
                bmi.s   @EraseExpFieldForEnemy
              else
                ; Write "N/A" as the experience value
                bmi.s   @EnemyExp
              endif
            endif
                jsr     GetCurrentExp
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_EXP,a1
                @writeMemberLvOrExpValue
                bra.s   @Att
; ---------------------------------------------------------------------------

WriteMemberLvOrExpValue:     
            if (FULL_CLASS_NAMES=1)
                pea     WriteLvOrExpValue(pc)
                bra.s   @CheckAlly
            endif
                
WriteMemberStatValue:     
            if (FULL_CLASS_NAMES=1)
                pea     WriteStatValue(pc)
@CheckAlly:     tst.b   d0
                bmi.s   @WriteValue
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,a1 ; write stat on next line if ally
@WriteValue:    rts
            endif
                
WriteEnemyLvOrExp:
                lea     aNA(pc), a0     
                moveq   #WINDOW_MEMBERSTATUS_NA_STRING_LENGTH,d7
                bra.w   WriteTilesFromAsciiWithRegularFont
                
; ---------------------------------------------------------------------------

@EraseExpFieldForEnemy:
                
            if (EXTENDED_STATUS=1)
                ; Copy tiles from the next line over the EXP field to hide it for enemies
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_EXP_FIELD,a1
                movea.l a1,a0
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,a0
                move.w  #WINDOW_MEMBERSTATUS_LAYOUT_EXP_FIELD_BYTESIZE,d7
                jsr     (CopyBytes).w
            else
              if (SHOW_ENEMY_LEVEL=0)
@EnemyLv:       movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ENEMY_LV,a1
                bsr.s   WriteEnemyLvOrExp
              endif
@EnemyExp:      movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ENEMY_EXP,a1
                bsr.s   WriteEnemyLvOrExp
            endif
                
@Att:           ; Att
                move.w  member(a6),d0
                jsr     GetCurrentAtt
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ATT,a1
                @writeMemberStatValue
                
                ; Def
                move.w  member(a6),d0
                jsr     GetCurrentDef
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_DEF,a1
                @writeMemberStatValue
                
                ; Agi
                move.w  member(a6),d0
                jsr     GetCurrentAgi
                andi.w  #DISPLAYED_Agi_VALUE_MASK,d1
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_AGI,a1
                @writeMemberStatValue
                
                ; Mov
                move.w  member(a6),d0
                jsr     GetCurrentMov
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MOV,a1
                @writeMemberStatValue
                
            if (EXTENDED_STATUS=1)
                bsr.w   WriteResistanceIndicatorsAndMovetypeName
            endif
                
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
            if (SHOW_ALL_SPELLS_IN_MEMBER_SCREEN=0)
                ; Do not display spell that is not affected by silence
                jsr     FindSpellDefAddress
                btst    #SPELLPROPS_BIT_AFFECTEDBYSILENCE,SPELLDef_OFFSET_PROPS(a0)
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
                lea     layout_SpellLevelIndicator(pc), a0
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
                mulu.w  #ICON_TILE_BYTESIZE,d1
                addIconOffset d1, a0
                movea.l a2,a1
                move.w  #ICON_TILE_BYTESIZE,d7
                jsr     (CopyBytes).w   
                bsr.w   CleanMemberStatsIconCorners
                adda.w  #ICON_TILE_BYTESIZE,a2
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
                mulu.w  #ICON_TILE_BYTESIZE,d1
                addIconOffset d1, a0
                movea.l a2,a1
                move.w  #ICON_TILE_BYTESIZE,d7
                jsr     (CopyBytes).w   
                
                ; Draw cracks over icon if item is broken
                move.w  d5,d1
                btst    #ITEMENTRY_BIT_BROKEN,d1
                beq.s   @CleanIconCorners
                
                getPointer p_Icons, a0
            if (EXPANDED_ITEMS_AND_SPELLS=1)
                adda.l  #ICONS_OFFSET_CRACKS,a0
            else
                lea     ICONS_OFFSET_CRACKS(a0),a0
            endif
                move.w  #ICON_PIXELS_BYTE_COUNTER,d0
                
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
                adda.w  #ICON_TILE_BYTESIZE,a2
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
            if (ALTERNATE_JEWEL_ICONS_DISPLAY=0)
                tst.w   member(a6)
                bne.s   @DmaIcons       ; skip if anyone other than Bowie
                chkFlg  384             ; Set after Bowie obtains the jewel of light/evil... whichever it is
                beq.s   @DmaIcons       ; skip if we haven't obtained Jewel of Light
                bsr.s   WriteJewelIcons
            endif
                
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

WriteResistanceIndicatorsAndMovetypeName:
                
                ; Write resistance indicators
                move.w  member(a6),d0
                jsr     GetCurrentResistance
                
                ; Wind
                move.w  d1,currentResistance(a6)
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_WIND,a1
                moveq   #SPELLELEMENT_WIND,d2
                bsr.s   WriteResistanceIndicatorTiles
                
                ; Lightning
                move.w  currentResistance(a6),d1
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_LIGHTNING,a1
                moveq   #SPELLELEMENT_LIGHTNING,d2
                bsr.s   WriteResistanceIndicatorTiles
                
                ; Ice
                move.w  currentResistance(a6),d1
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_ICE,a1
                moveq   #SPELLELEMENT_ICE,d2
                bsr.s   WriteResistanceIndicatorTiles
                
                ; Fire
                move.w  currentResistance(a6),d1
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_FIRE,a1
                moveq   #SPELLELEMENT_FIRE,d2
                bsr.s   WriteResistanceIndicatorTiles
                
                ; Status
                move.w  currentResistance(a6),d1
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_STATUS,a1
                moveq   #SPELLELEMENT_STATUS,d2
                bsr.s   WriteResistanceIndicatorTiles
                
                ; Hidden
                move.w  currentResistance(a6),d1
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_HIDDEN,a1
                moveq   #SPELLELEMENT_UNUSED2,d2
                bsr.s   WriteResistanceIndicatorTiles
                
                ; Write move type name
                move.w  member(a6),d0
                jsr     GetMoveType
                subq.w  #1,d1
                bmi.s   @Return
                
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_MOVETYPE_NAME,a1
                tst.b   d0
                bmi.s   @WriteMoveType
                
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,a1 ; write stat on next line if ally
@WriteMoveType: lea     table_MoveTypeNames(pc),a0
                jsr     FindName
                moveq   #-42,d1
                bra.w   WriteTilesFromAsciiWithRegularFont

    ; End of function WriteResistanceIndicatorsAndMovetypeName


; =============== S U B R O U T I N E =======================================

WriteResistanceIndicatorTiles:
                ror.w   d2,d1
                andi.w  #RESISTANCEENTRY_LOWERMASK_SETTING,d1
                bne.s   @CheckStatus
                
                subq.w  #2,a1 ; move cursor back one position if regular resistance level to mask the icon with a space tile
@CheckStatus:   addq.w  #1,d1
                
                ; Is a status infliction element?
                cmpi.w  #SPELLELEMENT_UNUSED2,d2
                blo.s   @AdjustCursor
                
                andi.w  #%11,d1 ; if a status element, setting #4 becomes #0
@AdjustCursor:  move.w  member(a6),d0
                tst.b   d0
                bmi.s   @WriteIndicatorTiles
                
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,a1 ; write stat on next line if ally
@WriteIndicatorTiles:
                
                lea     table_ResistanceIndicators(pc),a0
                jsr     FindName
                moveq   #-42,d1
                bra.w   WriteTilesFromAsciiWithRegularFont

    ; End of function WriteResistanceIndicatorTiles
                
                
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
@Return:        rts

    ; End of function CopyMemberScreenIconsToVdpTileOrder

                modend

; =============== S U B R O U T I N E =======================================

WriteJewelIcons:
            if (ALTERNATE_JEWEL_ICONS_DISPLAY=0)
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
                adda.w  #ICON_TILE_BYTESIZE,a2
                
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
            endif

    ; End of function WriteJewelIcons


; =============== S U B R O U T I N E =======================================

LoadJewelIconPixels:
            if (ALTERNATE_JEWEL_ICONS_DISPLAY=0)
                getPointer p_Icons, a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addIconOffset d1, a0
                movea.l a2,a1
                move.w  #ICON_TILE_BYTESIZE,d7
                jsr     (CopyBytes).w
            endif
                
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

            if (EXTENDED_STATUS=1)
table_ResistanceIndicators:
                defineName "*" ; immunity
                defineName " " ; no resistance
                defineName "+" ; minor resistance
                defineName "++" ; major resistance
                defineName "-" ; weakness
                
table_MoveTypeNames:
                className " "                       ; regular
                className "Centaur"                 ; centaur
                className "Nimble"                  ; stealth
                className "Tank", 13, "Archer"      ; brass gunner
                className "Flying"                  ; flying
                className "Aerial"                  ; hovering
                className "Aquatic"                 ; aquatic
                className "Archer"                  ; archer
                className "Centaur", 13, "Archer"   ; centaur archer
                className "Nimble", 13, "Archer"    ; stealth archer
                className "Mage"                    ; mage
                className "Healer"                  ; healer
                
                align
                
tiles_ElementIcons: incbin "data\graphics\tech\elementtiles-standard.bin"
            endif
