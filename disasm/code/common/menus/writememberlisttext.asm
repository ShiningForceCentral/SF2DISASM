
; ASM FILE code\common\menus\writememberlisttext.asm :
; 0x135A6..0x137AC : Write member list text function

; =============== S U B R O U T I N E =======================================

currentMember = -16
windowTilesAddress = -6
selectedMember = -2

WriteMemberListText:
                
                link    a6,#-16
                move.w  d0,selectedMember(a6)
                move.l  a1,windowTilesAddress(a6)
                move.w  #WINDOW_MEMBERLIST_SIZE,d0
                bsr.w   CopyWindowTilesToRam
                movea.l windowTilesAddress(a6),a1
                move.w  #$FFC6,d1
                suba.w  d1,a1
                addq.w  #4,a1
                moveq   #WINDOW_MEMBERLIST_HEADER_LENGTH,d7
                
                ; Determine header string
                move.b  ((CURRENT_MEMBERLIST_PAGE-$1000000)).w,d0
                bne.s   @Stats
                lea     aNameClassLevExp(pc), a0
                bra.s   @WriteHeaderString
@Stats:
                
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_STATS,d0
                bne.s   @Default        
                lea     aNameHpMpAtDfAgMv(pc), a0
                bra.s   @WriteHeaderString
@Default:
                
                lea     aNameAttackDefense(pc), a0 ; default to "new attack and defense"
@WriteHeaderString:
                
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
                ; Create entry
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MEMBERLIST_OFFSET_ENTRY_NAME,a1
                moveq   #WINDOW_MEMBERLIST_ENTRIES_COUNTER,d5
                move.w  ((DISPLAYED_MEMBERLIST_FIRST_ENTRY-$1000000)).w,d4
@CreateEntry_Loop:
                
                lea     ((GENERIC_LIST-$1000000)).w,a0
                clr.w   d0
                move.b  (a0,d4.w),d0
                move.w  d0,currentMember(a6)
                
                move.l  a1,-(sp)        ; -> push current character's name offset
                move.w  d0,d1
                jsr     j_IsInBattleParty
                beq.s   @DetermineNameColor
                move.w  #VDPTILE_SWORD_ICON|VDPTILE_PALETTE3|VDPTILE_PRIORITY,-2(a1) 
                                                        ; display sword icon to denote battle party members
@DetermineNameColor:
                
                move.l  a1,-(sp)
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentHP
                move.w  d1,d2
                jsr     j_GetCombatantName
                moveq   #-58,d1
                moveq   #ALLYNAME_MAX_LENGTH,d7
                tst.w   d2
                bne.s   @WriteEntry_Name
                bsr.w   WriteTilesFromAsciiWithOrangeFont
                bra.s   @WriteEntry_ClassLevExp
@WriteEntry_Name:
                
                bsr.w   WriteTilesFromAsciiWithRegularFont
@WriteEntry_ClassLevExp:
                
                movea.l (sp)+,a1
                lea     WINDOW_MEMBERLIST_OFFSET_ENTRY_START(a1),a1
                tst.b   ((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.s   @WriteEntry_Stats
                move.l  a1,-(sp)
                
                ; Write class name
                move.w  currentMember(a6),d0
                
                if (FULL_CLASS_NAMES=0)
                jsr     j_GetClass
                jsr     j_GetClassName
                else
                jsr     GetClassAndFullName
                endif
                
                moveq   #-58,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l (sp)+,a1
                lea     WINDOW_MEMBERLIST_OFFSET_ENTRY_LEVEL(a1),a1
                
                ; Write LV
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentLevel
                moveq   #LV_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
                addq.l  #WINDOW_MEMBERLIST_OFFSET_ENTRY_EXP,a1
                
                ; Write EXP
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentEXP
                moveq   #EXP_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteEntry_Stats:
                
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_STATS,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.w   @WriteEntry_Unequippable
                
                ; Write HP
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentHP
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
                
                ; Write MP
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentMP
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
                
                ; Write ATT
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentATT
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
                
                ; Write DEF
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentDEF
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
                
                ; Write AGI
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentAGI
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
                
                ; Write MOV
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentMOV
                moveq   #MOV_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
@WriteEntry_Unequippable:
                
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.w   @NextEntry      
                
                move.w  currentMember(a6),d0
                move.w  ((SELECTED_ITEM_INDEX-$1000000)).w,d1
                jsr     j_IsWeaponOrRingEquippable
                bcs.s   @WriteEntry_NewATTandDEF
                
                lea     aUnequippable(pc), a0
                addq.l  #WINDOW_MEMBERLIST_OFFSET_ENTRY_UNEQUIPPABLE,a1
                moveq   #WINDOW_MEMBERLIST_ENTRY_UNEQUIPPABLE_LENGTH,d7
                moveq   #-58,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                bra.s   @NextEntry      
@WriteEntry_NewATTandDEF:
                
                jsr     j_GetEquipNewATTandDEF
                addq.l  #2,a1
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentATT
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                move.w  #VDPTILE_HORIZONTAL_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  d2,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                addq.l  #WINDOW_MEMBERLIST_OFFSET_ENTRY_NEWDEFENSE,a1
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentDEF
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                move.w  #VDPTILE_HORIZONTAL_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  d3,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                addq.l  #2,a1
@NextEntry:
                
                movea.l (sp)+,a1        ; A1 <- pull current character's name offset
                adda.w  #WINDOW_MEMBERLIST_OFFSET_NEXT_ENTRY,a1
                addq.w  #1,d4
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d4
                dbeq    d5,@CreateEntry_Loop
                
                unlk    a6
                rts

    ; End of function WriteMemberListText

