
; ASM FILE code\common\menus\buildmemberslistwindow-standard.asm :
; 

; =============== S U B R O U T I N E =======================================

; In: a1 = window tiles address, d0.w = selected member index


;BuildMembersListWindow:
                
currentMember = -8
windowTilesAddress = -6
selectedMember = -2
                
headerStringOffset = 8
headerLength = 17
    if (SECOND_MEMBERS_LIST_PAGE=1)
headerLength = headerLength-1
    endif
    if (SECOND_MEMBERS_LIST_PAGE|(STANDARD_BUILD&EIGHT_CHARACTERS_MEMBER_NAMES)=1)
headerStringOffset = headerStringOffset+2
    endif
                
                link    a6,#-8
                move.w  d0,selectedMember(a6)
                move.l  a1,windowTilesAddress(a6)
                move.w  #WINDOW_MEMBERS_LIST_SIZE,d0
                bsr.w   alt_WriteWindowTiles
                movea.l windowTilesAddress(a6),a1
                
                adda.w  #62,a1  ; 'NAME' offset
                moveq   #4,d7   ; 'NAME' length
                lea     aName(pc), a0
                bsr.w   WriteTilesFromAsciiWithRegularFont
                adda.w  #headerStringOffset,a1
                moveq   #headerLength,d7
                
                ; Determine header string
                move.b  ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w,d0
            if (SECOND_MEMBERS_LIST_PAGE=1)
                bne.s   @CheckStatsPage
                lea     aClassLvExp(pc), a0
                bra.s   @WriteHeaderString
@CheckStatsPage:cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_HPMP,d0
                bne.s   @CheckStatsPage2
                lea     aHpMaxMpMax(pc), a0
                bra.s   @WriteHeaderString
@CheckStatsPage2:
                
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_STATS,d0
                bne.s   @Default
                lea     aAttDefAgiMov(pc), a0
            else
                bne.s   @CheckStatsPage
                lea     aClassLevExp(pc), a0
                bra.s   @WriteHeaderString
                
@CheckStatsPage:    
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_STATS,d0
                bne.s   @Default
                lea     aHpMpAtDfAgMv(pc), a0
            endif
                bra.s   @WriteHeaderString
@Default:       lea     aAttackDefense(pc), a0 ; default to "new attack and defense"
                
@WriteHeaderString:
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
                ; Create entry
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERS_LIST_OFFSET_ENTRY_NAME,a1
                moveq   #WINDOW_MEMBERS_LIST_ENTRIES_COUNTER,d5
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d4
                
@CreateEntry_Loop:
                lea     ((GENERIC_LIST-$1000000)).w,a0
                clr.w   d0
                move.b  (a0,d4.w),d0
                move.w  d0,currentMember(a6)
                
                move.l  a1,-(sp)        ; -> stash current character's name offset
                move.w  d0,d1
                jsr     IsInBattleParty
                beq.s   @DetermineNameColor
                move.w  #VDPTILE_SWORD_ICON|VDPTILE_PALETTE3|VDPTILE_PRIORITY,-2(a1) 
                                                        ; display sword icon to denote battle party members
@DetermineNameColor:
                move.l  a1,-(sp)
                move.w  currentMember(a6),d0
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetCombatantName
                moveq   #-WINDOW_MEMBERS_LIST_OFFSET_NEXT_LINE,d1
                moveq   #ALLYNAME_MAX_LENGTH,d7
                tst.w   d2
                bne.s   @WriteEntry_Name
                bsr.w   WriteTilesFromAsciiWithOrangeFont
                bra.s   @WriteEntry_ClassLvExp
                
@WriteEntry_Name:
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
@WriteEntry_ClassLvExp:
                movea.l (sp)+,a1
                lea     WINDOW_MEMBERS_LIST_OFFSET_ENTRY_START(a1),a1
                tst.b   ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.s   @WriteEntry_Stats
                move.l  a1,-(sp)
                
                ; Write class name
                move.w  currentMember(a6),d0
            if (FULL_CLASS_NAMES=1)
                jsr     GetClassAndFullName
                cmpi.w  #10,d7
                blt.s   @Continue
                lea     -WINDOW_MEMBERS_LIST_OFFSET_NEXT_LINE(a1),a1
            else
                jsr     GetClassAndName
            endif
@Continue:      moveq   #-WINDOW_MEMBERS_LIST_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l (sp)+,a1
                lea     WINDOW_MEMBERS_LIST_OFFSET_ENTRY_LEVEL(a1),a1
                
                ; Write LV
                move.w  currentMember(a6),d0
                jsr     GetCurrentLevel
                bsr.w   WriteLvOrExpValue
                addq.w  #4,a1
                
                ; Write EXP
                move.w  currentMember(a6),d0
                jsr     GetCurrentEXP
                bsr.w   WriteLvOrExpValue
                
@WriteEntry_Stats:
            if (SECOND_MEMBERS_LIST_PAGE=1)
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_HPMP,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.s   @WriteEntry_Stats2
                move.w  currentMember(a6),d0              ; Write current HP
                jsr     GetCurrentHP
                bsr.w   WriteStatValue
                move.w  #VDPTILE_SLASH|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  currentMember(a6),d0              ; Write max HP
                jsr     GetMaxHP
                bsr.w   WriteStatValue
                addq.w  #4,a1
                move.w  currentMember(a6),d0              ; Write current MP
                jsr     GetCurrentMP
                bsr.w   WriteStatValue
                move.w  #VDPTILE_SLASH|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  currentMember(a6),d0              ; Write max MP
                jsr     GetMaxMP
                bsr.w   WriteStatValue
            endif
                
@WriteEntry_Stats2:
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_STATS,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.w   @WriteEntry_Unequippable
            if (SECOND_MEMBERS_LIST_PAGE=0)
                move.w  currentMember(a6),d0    ; Write current HP
                jsr     GetCurrentHP
                bsr.w   WriteStatValue
                addq.w  #2,a1
                move.w  currentMember(a6),d0    ; Write current MP
                jsr     GetCurrentMP
                bsr.w   WriteStatValue
            endif
                addq.w  #2,a1
                
                ; Write ATT
                move.w  currentMember(a6),d0
                jsr     GetCurrentATT
                bsr.w   WriteStatValue
                addq.w  #2,a1
                
                ; Write DEF
                move.w  currentMember(a6),d0
                jsr     GetCurrentDEF
                bsr.w   WriteStatValue
                addq.w  #2,a1
                
                ; Write AGI
                move.w  currentMember(a6),d0
                jsr     GetCurrentAGI
                bsr.w   WriteStatValue
                addq.w  #2,a1
                
                ; Write MOV
                move.w  currentMember(a6),d0
                jsr     GetCurrentMOV
                bsr.w   WriteStatValue
                
@WriteEntry_Unequippable:
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.w   @NextEntry
                
                move.w  currentMember(a6),d0
                move.w  ((SELECTED_ITEM_INDEX-$1000000)).w,d1
                jsr     IsWeaponOrRingEquippable
                bcs.s   @WriteEntry_NewAttAndDef
                
                lea     aUnequippable(pc), a0
                addq.w  #WINDOW_MEMBERS_LIST_OFFSET_ENTRY_UNEQUIPPABLE,a1
                moveq   #WINDOW_MEMBERS_LIST_ENTRY_UNEQUIPPABLE_LENGTH,d7
                moveq   #-WINDOW_MEMBERS_LIST_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                bra.s   @NextEntry
                
@WriteEntry_NewAttAndDef:
                jsr     GetEquipNewAttAndDef  ; Get new ATT and DEF -> D2, D3
            if (THREE_DIGITS_STATS=0)
                addq.w  #2,a1
            endif
                
                ; Write current -> new ATT
                move.w  currentMember(a6),d0
                jsr     GetCurrentATT
                bsr.w   WriteStatValue
                move.w  #VDPTILE_HORIZONTAL_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  d2,d0
                bsr.w   WriteStatValueD0
                addq.w  #WINDOW_MEMBERS_LIST_OFFSET_ENTRY_NEWDEFENSE,a1
                
                ; Write current -> new DEF
                move.w  currentMember(a6),d0
                jsr     GetCurrentDEF
                bsr.w   WriteStatValue
                move.w  #VDPTILE_HORIZONTAL_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  d3,d0
                bsr.w   WriteStatValueD0
                
@NextEntry:     movea.l (sp)+,a1        ; A1 <- pop current character's name offset
                adda.w  #WINDOW_MEMBERS_LIST_OFFSET_NEXT_ENTRY,a1
                addq.w  #1,d4
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d4
                dbeq    d5,@CreateEntry_Loop
                
                unlk    a6
                rts

    ; End of function WriteMembersListText

aName:          dc.b 'NAME'
            if (SECOND_MEMBERS_LIST_PAGE=1)
aClassLvExp:    dc.b 'CLASS     LV EXP'
aHpMaxMpMax:    dc.b ' HP/MAX   MP/MAX'
aAttDefAgiMov:  dc.b ' ATT DEF AGI MOV'
aAttackDefense: dc.b 'ATTACK   DEFENSE'
            else
aClassLevExp:   dc.b 'CLASS     LEV EXP'
aHpMpAtDfAgMv:  dc.b 'HP MP AT DF AG MV'
aAttackDefense: dc.b 'ATTACK   DEFENSE',0
            endif

                align
