
; ASM FILE code\common\menus\writememberlisttext-menuenhancements.asm :
; 

; =============== S U B R O U T I N E =======================================

WriteMemberListText:
                
current_character_index = -16
window_tiles_address = -6
selected_member = -2
                
                link    a6,#-16
                move.w  d0,selected_member(a6)
                move.l  a1,window_tiles_address(a6)
                move.w  #WINDOW_MEMBERLIST_SIZE,d0
                bsr.w   CopyWindowTilesToRam
                movea.l window_tiles_address(a6),a1
                
                adda.w  #62,a1  ; 'NAME' offset
                moveq   #4,d7   ; 'NAME' length
                lea     aName(pc), a0
                bsr.w   WriteTilesFromAsciiWithRegularFont
                adda.w  #10,a1  ; header string offset
                moveq   #WINDOW_MEMBERLIST_HEADER_LENGTH,d7
                
                ; Determine header string
                move.b  ((CURRENT_MEMBERLIST_PAGE-$1000000)).w,d0
                bne.s   @HpMaxMpMax
                lea     aClassLvExp(pc), a0
                bra.s   @WriteHeaderString
                
@HpMaxMpMax:
                cmpi.b  #1,d0   ; 'HP/MAX  MP/MAX' page index
                bne.s   @Stats
                lea     aHpMaxMpMax(pc), a0
                bra.s   @WriteHeaderString
                
@Stats:
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_STATS,d0
                bne.s   @Default
                lea     aAttDefAgiMov(pc), a0
                bra.s   @WriteHeaderString
                
@Default:
                lea     aAttackDefense(pc), a0 ; default to "new attack and defense"
                
@WriteHeaderString:
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
                ; Create entry
                movea.l window_tiles_address(a6),a1
                adda.w  #WINDOW_MEMBERLIST_OFFSET_ENTRY_NAME,a1
                moveq   #WINDOW_MEMBERLIST_ENTRIES_COUNTER,d5
                move.w  ((DISPLAYED_MEMBERLIST_FIRST_ENTRY-$1000000)).w,d4
                
@CreateEntry_Loop:
                lea     ((GENERIC_LIST-$1000000)).w,a0
                clr.w   d0
                move.b  (a0,d4.w),d0
                move.w  d0,current_character_index(a6)
                
                move.l  a1,-(sp)        ; -> stash current character's name offset
                move.w  d0,d1
                jsr     IsInBattleParty
                beq.s   @DetermineNameColor
                move.w  #VDPTILE_SWORD_ICON|VDPTILE_PALETTE3|VDPTILE_PRIORITY,-2(a1) 
                                                        ; display sword icon to denote battle party members
@DetermineNameColor:
                move.l  a1,-(sp)
                move.w  current_character_index(a6),d0
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetCombatantName
                moveq   #-WINDOW_MEMBERLIST_OFFSET_NEXT_LINE,d1
                moveq   #ALLYNAME_MAX_LENGTH,d7
                tst.w   d2
                bne.s   @WriteEntry_Name
                bsr.w   WriteTilesFromAsciiWithOrangeFont
                bra.s   @WriteEntry_ClassLvExp
                
@WriteEntry_Name:
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
@WriteEntry_ClassLvExp:
                movea.l (sp)+,a1
                lea     WINDOW_MEMBERLIST_OFFSET_ENTRY_START(a1),a1
                tst.b   ((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.s   @WriteEntry_HpMaxMpMax
                move.l  a1,-(sp)
                
                ; Write class name
                move.w  current_character_index(a6),d0
                
                if (FULL_CLASS_NAMES=0)
                jsr     GetClassAndName
                else
                jsr     GetClassAndFullName
                cmpi.w  #10,d7
                blt.s   @Continue
                lea     -WINDOW_MEMBERLIST_OFFSET_NEXT_LINE(a1),a1
                
@Continue:
                endif
                
                moveq   #-WINDOW_MEMBERLIST_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l (sp)+,a1
                lea     WINDOW_MEMBERLIST_OFFSET_ENTRY_LEVEL(a1),a1
                
                ; Write LV
                move.w  current_character_index(a6),d0
                jsr     GetCurrentLevel
                bsr.w   WriteTwoDigitsStatValue
                addq.w  #4,a1
                
                ; Write EXP
                move.w  current_character_index(a6),d0
                jsr     GetCurrentEXP
                bsr.w   WriteTwoDigitsStatValue
                
@WriteEntry_HpMaxMpMax:
                cmpi.b  #1,((CURRENT_MEMBERLIST_PAGE-$1000000)).w   ; 'HP/MAX MP/MAX' page index
                bne.s   @WriteEntry_Stats
                
                if (THREE_DIGITS_STATS=0)
                addq.w  #2,a1
                endif
                
                ; Write current HP
                move.w  current_character_index(a6),d0
                jsr     GetCurrentHP
                bsr.w   WriteThreeDigitsStatValue_MemberList
                move.w  #VDPTILE_SLASH|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                
                ; Write max HP
                move.w  current_character_index(a6),d0
                jsr     GetMaxHP
                bsr.w   WriteThreeDigitsStatValue_MemberList
                addq.w  #4,a1
                
                ; Write current MP
                move.w  current_character_index(a6),d0
                jsr     GetCurrentMP
                bsr.w   WriteThreeDigitsStatValue_MemberList
                move.w  #VDPTILE_SLASH|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                
                ; Write max MP
                move.w  current_character_index(a6),d0
                jsr     GetMaxMP
                bsr.w   WriteThreeDigitsStatValue_MemberList
                
@WriteEntry_Stats:
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_STATS,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.w   @WriteEntry_Unequippable
                addq.w  #2,a1
                
                ; Write ATT
                move.w  current_character_index(a6),d0
                jsr     GetCurrentATT
                bsr.w   WriteThreeDigitsStatValue_MemberList
                addq.w  #2,a1
                
                ; Write DEF
                move.w  current_character_index(a6),d0
                jsr     GetCurrentDEF
                bsr.w   WriteThreeDigitsStatValue_MemberList
                addq.w  #2,a1
                
                ; Write AGI
                move.w  current_character_index(a6),d0
                jsr     GetCurrentAGI
                bsr.w   WriteThreeDigitsStatValue_MemberList
                addq.w  #2,a1
                
                ; Write MOV
                move.w  current_character_index(a6),d0
                jsr     GetCurrentMOV
                bsr.w   WriteThreeDigitsStatValue_MemberList
                
@WriteEntry_Unequippable:
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.w   @NextEntry
                
                move.w  current_character_index(a6),d0
                move.w  ((SELECTED_ITEM_INDEX-$1000000)).w,d1
                jsr     IsWeaponOrRingEquippable
                bcs.s   @WriteEntry_NewATTandDEF
                
                lea     aUnequippable(pc), a0
                addq.w  #WINDOW_MEMBERLIST_OFFSET_ENTRY_UNEQUIPPABLE,a1
                moveq   #WINDOW_MEMBERLIST_ENTRY_UNEQUIPPABLE_LENGTH,d7
                moveq   #-WINDOW_MEMBERLIST_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                bra.s   @NextEntry
                
@WriteEntry_NewATTandDEF:
                jsr     GetEquipNewATTandDEF  ; Get new ATT and DEF -> D2, D3
                
                if (THREE_DIGITS_STATS=0)
                addq.w  #2,a1
                endif
                
                ; Write current -> new ATT
                move.w  current_character_index(a6),d0
                jsr     GetCurrentATT
                bsr.w   WriteThreeDigitsStatValue_MemberList
                move.w  #VDPTILE_HORIZONTAL_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  d2,d0
                bsr.w   WriteThreeDigitsStatValue
                addq.w  #WINDOW_MEMBERLIST_OFFSET_ENTRY_NEWDEFENSE,a1
                
                ; Write current -> new DEF
                move.w  current_character_index(a6),d0
                jsr     GetCurrentDEF
                bsr.w   WriteThreeDigitsStatValue_MemberList
                move.w  #VDPTILE_HORIZONTAL_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  d3,d0
                bsr.w   WriteThreeDigitsStatValue
                
@NextEntry:
                movea.l (sp)+,a1        ; A1 <- pop current character's name offset
                adda.w  #WINDOW_MEMBERLIST_OFFSET_NEXT_ENTRY,a1
                addq.w  #1,d4
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d4
                dbeq    d5,@CreateEntry_Loop
                
                unlk    a6
                rts

    ; End of function WriteMemberListText

aName:          dc.b 'NAME'
aClassLvExp:    dc.b 'CLASS     LV EXP'
aHpMaxMpMax:    dc.b ' HP/MAX   MP/MAX'
aAttDefAgiMov:  dc.b ' ATT DEF AGI MOV'
aAttackDefense: dc.b 'ATTACK   DEFENSE'

                wordAlign
