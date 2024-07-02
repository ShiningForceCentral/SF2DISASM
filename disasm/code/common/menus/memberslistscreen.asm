
; ASM FILE code\common\menus\memberslistscreen.asm :
; 0x12FE6..0x147FA : Members list screen functions

; =============== S U B R O U T I N E =======================================


ExecuteMembersListScreenOnMainSummaryPage:
                
                clr.b   ((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                clr.b   ((CURRENT_MEMBERS_LIST_SUMMARY_PAGE-$1000000)).w
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.s   @Continue
                clr.b   ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
@Continue:
                
                bra.w   ExecuteMembersListScreen

    ; End of function ExecuteMembersListScreenOnMainSummaryPage


; =============== S U B R O U T I N E =======================================


ExecuteMembersListScreenOnItemSummaryPage:
                
                move.b  #WINDOW_MEMBERSUMMARY_PAGE_ITEM,((CURRENT_MEMBERS_LIST_SUMMARY_PAGE-$1000000)).w
                move.w  ((SELECTED_ITEM_INDEX-$1000000)).w,d1
                jsr     j_GetEquipmentType
                tst.w   d2
                beq.s   @NotEquippable
                move.b  #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bra.s   @Continue
@NotEquippable:
                
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.s   @Continue
                clr.b   ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
@Continue:
                
                bra.w   ExecuteMembersListScreen

    ; End of function ExecuteMembersListScreenOnItemSummaryPage


; =============== S U B R O U T I N E =======================================


ExecuteMembersListScreenOnMagicSummaryPage:
                
                clr.b   ((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                move.b  #WINDOW_MEMBERSUMMARY_PAGE_MAGIC,((CURRENT_MEMBERS_LIST_SUMMARY_PAGE-$1000000)).w
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.s   ExecuteMembersListScreen
                clr.b   ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w

    ; End of function ExecuteMembersListScreenOnMagicSummaryPage


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

ExecuteMembersListScreen:
                
                ; Determine initial selected member
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                add.w   ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d0
                blt.s   @Continue
                
                clr.w   ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w
                clr.w   ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w
@Continue:
                
                link    a6,#-16
                bsr.w   GetSelectedMember
                move.w  d0,selectedMember(a6)
                bsr.w   LoadMembersListScreenPortrait
                
                ; Create members list window
                move.w  #WINDOW_MEMBERS_LIST_SIZE,d0
                move.w  #WINDOW_MEMBERS_LIST_DEST,d1
                jsr     (CreateWindow).l
                move.w  d0,membersListWindow(a6)
                
                ; Create portrait window
                move.w  #$80A,d0
                move.w  #$F8F6,d1
                jsr     (CreateWindow).l
                move.w  d0,portraitWindow(a6)
                
                ; Create summary window
                move.w  #WINDOW_MEMBERSUMMARY_SIZE,d0
                move.w  #WINDOW_MEMBERSUMMARY_DEST,d1
                jsr     (CreateWindow).l
                move.w  d0,memberSummaryWindow(a6)
                
                bsr.w   BuildMembersListScreenWindows
                move.w  membersListWindow(a6),d0
                move.w  #$20E,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  portraitWindow(a6),d0
                move.w  #$201,d1
                jsr     (MoveWindowWithSfx).l
                move.w  memberSummaryWindow(a6),d0
                move.w  #$A01,d1
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForVInt).w
                lea     tiles_TextHighlight(pc), a0 ; red box sprite
                lea     ($B800).l,a1
                move.w  #$A0,d0 
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                jsr     (WaitForWindowMovementEnd).l
                moveq   #20,d1
@Start:
                
                move.w  d1,-(sp)
                move.w  ((SELECTED_ITEM_INDEX-$1000000)).w,d1
                jsr     j_GetEquipmentType
                tst.w   d2              ; is selected item equippable?
                beq.s   @loc_3
                
                moveq   #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,d2 ; start on equip preview page if selected item is equippable
                bra.s   @Right
@loc_3:
                
                moveq   #WINDOW_MEMBERS_LIST_PAGE_STATS,d2
@Right:
                
                ; Check inputs
                move.w  (sp)+,d1
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @Left
                
                move.b  ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w,d0
                addq.b  #1,d0
                sndCom  SFX_MENU_SELECTION
                cmp.b   d2,d0
                ble.s   @loc_5
                
                clr.b   d0
@loc_5:
                
                move.b  d0,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bsr.w   UpdateMembersListScreenWindows
@Left:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @Up
                move.b  ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w,d0
                subq.b  #1,d0
                sndCom  SFX_MENU_SELECTION
                bge.s   @loc_7
                
                move.b  d2,d0
@loc_7:
                
                move.b  d0,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bsr.w   UpdateMembersListScreenWindows
@Up:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @Down
                move.w  ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                subq.w  #1,d0
                blt.s   @loc_9
                
                clr.w   d1
                bsr.w   LoadMembersListHighlightSprites
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w
                bsr.w   UpdateMembersListScreenWindows
                bra.s   @Down
@loc_9:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                subq.w  #1,d0
                blt.s   @Down
                
                clr.w   d1
                bsr.w   LoadMembersListHighlightSprites
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w
                move.b  #1,((WINDOW_LAYOUT_SHIFT_DIRECTION-$1000000)).w
                bsr.w   ShiftMembersListLayout
@Down:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_13
                
                move.w  ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                addq.w  #1,d0
                cmpi.w  #4,d0
                bgt.s   @loc_12
                
                move.w  d0,d2
                add.w   ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d2
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d2
                bge.s   @loc_11
                
                clr.w   d1
                bsr.w   LoadMembersListHighlightSprites
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w
                bsr.w   UpdateMembersListScreenWindows
@loc_11:
                
                bra.s   @loc_13
@loc_12:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                addq.w  #1,d0
                move.w  d0,d2
                add.w   ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d2
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d2
                bge.s   @loc_13
                
                clr.w   d1
                bsr.w   LoadMembersListHighlightSprites
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w
                clr.b   ((WINDOW_LAYOUT_SHIFT_DIRECTION-$1000000)).w
                bsr.w   ShiftMembersListLayout
@loc_13:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   @CancelSelection
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   @ConfirmSelection
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   @ConfirmSelection
@CancelAction:
                
                bsr.w   LoadMembersListHighlightSprites
                jsr     (WaitForVInt).w
                bra.w   @Start
@ConfirmSelection:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                add.w   ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                lea     ((GENERIC_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                bsr.w   ValidateMembersListScreenConfirmationInput
                beq.s   @PerformAction
                sndCom  SFX_REFUSAL
                moveq   #10,d1
                bra.s   @CancelAction
@PerformAction:
                
                bsr.w   PerformItemSubmenuActions
                cmpi.w  #-1,d1
                bne.s   @Goto_Exit
                
                ; Cancel out of performing action
                bsr.w   UpdateMembersListScreenWindows
                moveq   #20,d1
                bra.s   @CancelAction
@Goto_Exit:
                
                bra.w   @Exit
@CancelSelection:
                
                moveq   #-1,d0
@Exit:
                
                movem.w d0-d2,-(sp)
                clr.w   d1
                bsr.w   LoadMembersListHighlightSprites
                move.w  membersListWindow(a6),d0
                move.w  #$220,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  portraitWindow(a6),d0
                move.w  #$F8F6,d1
                jsr     (MoveWindowWithSfx).l
                move.w  memberSummaryWindow(a6),d0
                move.w  #$20F3,d1
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                move.w  membersListWindow(a6),d0
                jsr     (DeleteWindow).l
                move.w  portraitWindow(a6),d0
                jsr     (DeleteWindow).l
                move.w  memberSummaryWindow(a6),d0
                jsr     (DeleteWindow).l
                movem.w (sp)+,d0-d2
                unlk    a6
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function ExecuteMembersListScreen


; =============== S U B R O U T I N E =======================================

; Out: CCR zero-bit set if confirmation input is valid


ValidateMembersListScreenConfirmationInput:
                
                tst.b   ((CURRENT_MEMBERS_LIST_SUMMARY_PAGE-$1000000)).w
                bne.s   @IsItemPage
                
                clr.w   d1
                rts
@IsItemPage:
                
                cmpi.b  #WINDOW_MEMBERSUMMARY_PAGE_ITEM,((CURRENT_MEMBERS_LIST_SUMMARY_PAGE-$1000000)).w
                bne.w   @Magic
                
                ; If item page, check submenu action
                btst    #0,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                beq.s   @Return3        
                
                cmpi.b  #ITEM_SUBMENU_ACTION_GIVE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                bne.s   @EquipAction
                
                ; Submenu action : Give
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                tst.w   d2
                bne.s   @loc_2
                
                moveq   #-1,d1          ; no items
                bra.s   @Return1
@loc_2:
                
                clr.w   d1
@Return1:
                
                rts
                bra.s   @Return3        ; unreachable code
@EquipAction:
                
                clr.w   d1
                jsr     j_GetEquippableWeapons
                move.w  d1,d2
                jsr     j_GetEquippableRings
                add.w   d1,d2
                bne.s   @loc_5
                
                moveq   #-1,d1
                bra.s   @Return2
@loc_5:
                
                clr.w   d1
@Return2:
                
                rts
@Return3:
                
                rts                     ; unreachable code
@Magic:
                
                clr.w   d1
                jsr     j_GetSpellAndNumberOfSpells
                tst.w   d2
                bne.s   @loc_9
                
                moveq   #-1,d1
                bra.s   @Return4
@loc_9:
                
                clr.w   d1
@Return4:
                
                rts

    ; End of function ValidateMembersListScreenConfirmationInput


; =============== S U B R O U T I N E =======================================


PerformItemSubmenuActions:
                
                module
                tst.b   ((CURRENT_MEMBERS_LIST_SUMMARY_PAGE-$1000000)).w
                beq.w   @Return
                
                cmpi.b  #WINDOW_MEMBERSUMMARY_PAGE_ITEM,((CURRENT_MEMBERS_LIST_SUMMARY_PAGE-$1000000)).w
                bne.w   @MagicPage
                
                ; Items member summary page
                tst.b   ((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                beq.w   @Return
                
                cmpi.b  #ITEM_SUBMENU_ACTION_GIVE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                bne.s   @CheckDrop
                
                moveq   #10,d1
                bsr.w   LoadMembersListHighlightSprites
                bsr.w   LoadMemberSummaryIcons
                bra.w   @Return
@CheckDrop:
                
                cmpi.b  #ITEM_SUBMENU_ACTION_DROP,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                bne.s   @Equip
                
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                bne.s   @Goto_Return
                
                moveq   #10,d1
                bsr.w   LoadMembersListHighlightSprites
                bsr.w   LoadMemberSummaryIcons
@Goto_Return:
                
                bra.w   @Return
@Equip:
                
                moveq   #10,d1
                bsr.w   LoadMembersListHighlightSprites
                bsr.w   PerformEquipItemSubmenuAction
@Return:
                
                rts
@MagicPage:
                
                moveq   #10,d1
                bsr.w   LoadMembersListHighlightSprites
                bsr.w   ExecuteExplorationMagicMenu
                rts

    ; End of function PerformItemSubmenuActions

                modend

; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

LoadMembersListScreenPortrait:
                
                move.w  selectedMember(a6),d0
                bsr.w   GetCombatantPortrait
                bra.w   LoadPortrait    

    ; End of function LoadMembersListScreenPortrait


; =============== S U B R O U T I N E =======================================

; Load VDP sprite data for the red box used to highlight text in the
; members list window.
; 
; In: d1.w = blinking frame timer


LoadMembersListHighlightSprites:
                
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                beq.s   @loc_1
                
                moveq   #1,d1           ; hide windows
@loc_1:
                
                move.w  d0,-(sp)
                lea     (SPRITE_BATTLE_CURSOR).l,a0
                lea     sprite_MembersListHighlight(pc), a1
                cmpi.w  #7,d1           ; blink on/off
                bge.s   @loc_2
                
                move.w  #256,d0         ; intermittently add this value to the sprites y position to accomplish the blink effect
                bra.s   @loc_3
@loc_2:
                
                clr.w   d0
@loc_3:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d2
                lsl.w   #NIBBLE_SHIFT_COUNT,d2
                add.w   d2,d0
                moveq   #WINDOW_MEMBERS_LIST_HIGHLIGHTSPRITES_COUNTER,d7
@LoadSprites_Loop:
                
                move.w  (a1)+,(a0)
                add.w   d0,(a0)
                move.w  (a1)+,d2
                move.w  d2,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_TILE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_X(a0)
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a0
                dbf     d7,@LoadSprites_Loop
                
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                tst.w   ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w
                beq.s   @loc_5
                
                cmpi.w  #7,d1           ; blink on/off
                blt.s   @loc_5
                
                move.w  #151,VDPSPRITE_OFFSET_X(a0)
                move.w  #260,(a0)
@loc_5:
                
                move.w  #WINDOW_MEMBERS_LIST_SPRITELINK_DOWNARROW,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #VDPTILE_V_ARROW|VDPTILE_FLIP|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a0
                
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                addq.w  #5,d0
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d0
                bge.s   @loc_6
                
                cmpi.w  #7,d1           ; blink on/off
                blt.s   @loc_6
                move.w  #151,VDPSPRITE_OFFSET_X(a0)
                move.w  #333,(a0)
@loc_6:
                
                move.w  #WINDOW_MEMBERS_LIST_SPRITELINK_UPARROW,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #VDPTILE_V_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
                subq.w  #1,d1
                bne.s   @loc_7
                moveq   #20,d1
@loc_7:
                
                move.w  (sp)+,d0
                bsr.w   LinkHighlightSprites
                rts

    ; End of function LoadMembersListHighlightSprites

sprite_MembersListHighlight:
                
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
                
                vdpSprite 260, V2|H4|9, 1472|PALETTE3|PRIORITY, 156
            if (STANDARD_BUILD&EIGHT_CHARACTERS_MEMBER_NAMES=1)
                vdpSprite 260, V2|H1|10, 1474|PALETTE3|PRIORITY, 188
                vdpSprite 260, V2|H4|11, 1472|MIRROR|PALETTE3|PRIORITY, 196
            else
                vdpSprite 260, V2|H4|10, 1472|MIRROR|PALETTE3|PRIORITY, 188
            endif

; =============== S U B R O U T I N E =======================================

;     Get index of currently selected force member (in menus).
;     Out: D0 = selected index (capped to 255)


GetSelectedMember:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                add.w   ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                lea     ((GENERIC_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                andi.w  #BYTE_MASK,d0
                rts

    ; End of function GetSelectedMember


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

UpdateMembersListScreenWindows:
                
                bsr.w   BuildMembersListScreenWindows
                move.w  membersListWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                move.w  memberSummaryWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                bsr.w   LoadMembersListScreenPortrait
                moveq   #$A,d1
                rts

    ; End of function UpdateMembersListScreenWindows


; =============== S U B R O U T I N E =======================================

; unused


CopyWords:
                
                move.w  (a0)+,(a1)+
                dbf     d7,CopyWords    
                rts

    ; End of function CopyWords


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

ShiftMembersListLayout:
                
                move.w  d0,-(sp)
                move.w  membersListWindow(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                movea.l a1,a0
                tst.b   ((WINDOW_LAYOUT_SHIFT_DIRECTION-$1000000)).w
                beq.s   @ShiftUp
                
                ; Shift down
                adda.w  #116,a0
                adda.w  #174,a1
                move.w  #522,d7
                jsr     (CopyBytes).w   
                lea     layout_MembersListWindowSpacer(pc), a0
                suba.w  #56,a1
                move.w  #54,d7
                jsr     (CopyBytes).w   
                bra.s   @Continue
@ShiftUp:
                
                adda.w  #232,a0
                adda.w  #174,a1
                move.w  #464,d7
                jsr     (CopyBytes).w   
                lea     layout_MembersListWindowSpacer(pc), a0
                suba.w  #56,a1
                move.w  #54,d7
                jsr     (CopyBytes).w   
                lea     layout_MembersListWindowSpacer(pc), a0
                adda.w  #522,a1
                move.w  #54,d7
                jsr     (CopyBytes).w   
@Continue:
                
                move.w  membersListWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                jsr     (WaitForVInt).w
                bsr.w   BuildMembersListScreenWindows
                move.w  membersListWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                move.w  memberSummaryWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                move.w  (sp)+,d0
                bsr.w   LoadMembersListScreenPortrait
                moveq   #10,d1
                rts

    ; End of function ShiftMembersListLayout


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

BuildMembersListScreenWindows:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                add.w   ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                lea     ((GENERIC_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                andi.w  #ALLY_MASK_INDEX,d0
                move.w  d0,selectedMember(a6)
                
                ; Build members list window
                move.w  membersListWindow(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  selectedMember(a6),d0
                bsr.w   BuildMembersListWindow
                
                ; Build member summary window
                move.w  memberSummaryWindow(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  selectedMember(a6),d0
                bsr.w   BuildMemberSummaryWindow
                
                ; Load portrait window border tiles
                move.w  portraitWindow(a6),d0
                lea     tiles_WindowBorder(pc), a0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  #160,d7
                jsr     (CopyBytes).w   
                rts

    ; End of function BuildMembersListScreenWindows


; =============== S U B R O U T I N E =======================================

; In: a1 = window tiles address, d0.w = selected member index

currentMember = -16
windowLayoutStartAddress = -6
selectedMember = -2

BuildMembersListWindow:
                
            if (STANDARD_BUILD=1)
                include "code\common\menus\buildmemberslistwindow-standard.asm"
            else
                link    a6,#-16
                move.w  d0,selectedMember(a6)
                move.l  a1,windowLayoutStartAddress(a6)
                move.w  #WINDOW_MEMBERS_LIST_SIZE,d0
                bsr.w   alt_WriteWindowTiles
                movea.l windowLayoutStartAddress(a6),a1
                move.w  #$FFC6,d1
                suba.w  d1,a1
                addq.w  #4,a1
                moveq   #WINDOW_MEMBERS_LIST_HEADER_LENGTH,d7
                
                ; Determine header string
                move.b  ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w,d0
                bne.s   @Stats
                lea     aNameClassLevExp(pc), a0
                bra.s   @WriteHeaderString
@Stats:
                
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_STATS,d0
                bne.s   @Default        
                lea     aNameHpMpAtDfAgMv(pc), a0
                bra.s   @WriteHeaderString
@Default:
                
                lea     aNameAttackDefense(pc), a0 ; default to "new attack and defense"
@WriteHeaderString:
                
                bsr.w   WriteTilesFromAsciiWithRegularFont
                
                ; Create entry
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERS_LIST_OFFSET_ENTRY_NAME,a1
                moveq   #WINDOW_MEMBERS_LIST_ENTRIES_COUNTER,d5
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d4
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
                jsr     j_GetCurrentHp
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
                lea     WINDOW_MEMBERS_LIST_OFFSET_ENTRY_START(a1),a1
                tst.b   ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.s   @WriteEntry_Stats
                move.l  a1,-(sp)
                
                ; Write class name
                move.w  currentMember(a6),d0
                jsr     j_GetClass
                jsr     j_GetClassName
                moveq   #-58,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l (sp)+,a1
                lea     WINDOW_MEMBERS_LIST_OFFSET_ENTRY_LEVEL(a1),a1
                
                ; Write LV
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentLevel
                moveq   #LV_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
                addq.l  #WINDOW_MEMBERS_LIST_OFFSET_ENTRY_EXP,a1
                
                ; Write EXP
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentExp
                moveq   #EXP_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteEntry_Stats:
                
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_STATS,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.w   @WriteEntry_Unequippable
                
                ; Write HP
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentHp
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
                
                ; Write MP
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentMp
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
                
                ; Write ATT
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentAtt
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
                
                ; Write DEF
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentDef
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
                
                ; Write AGI
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentAgi
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
                
                ; Write MOV
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentMov
                moveq   #MOV_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #2,a1
@WriteEntry_Unequippable:
                
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.w   @NextEntry      
                
                move.w  currentMember(a6),d0
                move.w  ((SELECTED_ITEM_INDEX-$1000000)).w,d1
                jsr     j_IsWeaponOrRingEquippable
                bcs.s   @WriteEntry_NewATTandDEF
                
                lea     aUnequippable(pc), a0
                addq.l  #WINDOW_MEMBERS_LIST_OFFSET_ENTRY_UNEQUIPPABLE,a1
                moveq   #WINDOW_MEMBERS_LIST_ENTRY_UNEQUIPPABLE_LENGTH,d7
                moveq   #-58,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                bra.s   @NextEntry      
@WriteEntry_NewATTandDEF:
                
                jsr     j_GetEquipNewAttAndDef
                addq.l  #2,a1
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentAtt
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                move.w  #VDPTILE_HORIZONTAL_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  d2,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                addq.l  #WINDOW_MEMBERS_LIST_OFFSET_ENTRY_NEWDEFENSE,a1
                move.w  currentMember(a6),d0
                jsr     j_GetCurrentDef
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
                adda.w  #WINDOW_MEMBERS_LIST_OFFSET_NEXT_ENTRY,a1
                addq.w  #1,d4
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d4
                dbeq    d5,@CreateEntry_Loop
                
                unlk    a6
                rts
            endif

    ; End of function BuildMembersListWindow


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

UpdateMemberSummaryWindow:
                
                move.w  memberSummaryWindow(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  selectedMember(a6),d0

    ; End of function UpdateMemberSummaryWindow


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
                beq.s   @CheckSummaryPage
                move.l  #VDPTILES_STATUSEFFECT_SLOW,d0
                bsr.w   WriteStatusEffectTiles
@CheckSummaryPage:
                
            if (STANDARD_BUILD&(THREE_DIGITS_STATS|FULL_CLASS_NAMES)=1)
                move.l  (sp)+,d3
            endif
                move.b  ((CURRENT_MEMBERS_LIST_SUMMARY_PAGE-$1000000)).w,d0
                bne.s   @Items
                bsr.w   BuildMemberSummaryWindowOnMainPage
                bra.s   @Done
@Items:
                
                cmpi.b  #WINDOW_MEMBERSUMMARY_PAGE_ITEM,d0
                bne.s   @Magic
                bsr.w   BuildMemberSummaryWindowOnItemPage
                bra.s   @Done
@Magic:
                
                cmpi.b  #WINDOW_MEMBERSUMMARY_PAGE_MAGIC,d0
                bne.s   @Default
                bsr.w   BuildMemberSummaryWindowOnMagicPage
                bra.s   @Done
@Default:
                
                bsr.w   BuildMemberSummaryWindowOnEquipPage ; default to equip page
@Done:
                
                unlk    a6
                rts

    ; End of function BuildMemberSummaryWindow


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

BuildMemberSummaryWindowOnMainPage:
                
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MAIN_PAGE_OFFSET_MAGICITEM_STRING,a1
                lea     aMagicItem(pc), a0
                moveq   #-42,d1
                moveq   #14,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MAIN_PAGE_OFFSET_MAGICLIST_START,a1
                bsr.w   WriteMemberMagicList
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MAIN_PAGE_OFFSET_ITEMSLIST_START,a1
                bsr.w   WriteMemberItemsList
                rts

    ; End of function BuildMemberSummaryWindowOnMainPage


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

BuildMemberSummaryWindowOnItemPage:
                
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_ITEM_PAGE_OFFSET_ITEM_STRING,a1
                lea     aItem_3(pc), a0 
                moveq   #-42,d1
                moveq   #8,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_ITEM_PAGE_OFFSET_ITEMSLIST_START,a1
                bsr.w   WriteMemberItemsList
                bsr.w   WriteItemIconsCross
                rts

    ; End of function BuildMemberSummaryWindowOnItemPage


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

BuildMemberSummaryWindowOnMagicPage:
                
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MAGIC_PAGE_OFFSET_MAGIC_STRING,a1
                lea     aMagic_2(pc), a0
                moveq   #-42,d1
                moveq   #7,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_MAGIC_PAGE_OFFSET_MAGICLIST_START,a1
                bsr.w   WriteMemberMagicList
                bsr.w   WriteMagicIconsCross
                rts

    ; End of function BuildMemberSummaryWindowOnMagicPage


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -6
combatant = -2

BuildMemberSummaryWindowOnEquipPage:
                
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_EQUIPMENT_STRING,a1
                lea     aEquipment(pc), a0
                moveq   #-42,d1
                moveq   #10,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  d5,d1
                cmpi.w  #ICON_UNARMED,d1
                beq.s   @WriteNothingString
                jsr     j_FindItemName
                bra.s   @Continue
@WriteNothingString:
                
                lea     aNothing_2(pc), a0
                moveq   #10,d7
@Continue:
                
                moveq   #-42,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_ATT_STRING,a1
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
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_DEF_STRING,a1
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
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_AGI_STRING,a1
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
                adda.w  #WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_MOV_STRING,a1
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

    ; End of function BuildMemberSummaryWindowOnEquipPage


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
                move.l  #$C5E0C5E1,$DC(a1) ; longword-packed VDP tile entries
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
layout_MembersListWindowSpacer:
                
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


LoadMemberSummaryIcons:
                
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
                moveq   #30,d6
                
@CheckLeft:
                
                ; Check inputs
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckRight
                moveq   #1,d1
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_2-$1000000)).w
                beq.s   @CheckRight
                sndCom  SFX_MENU_SELECTION
                bra.w   @DmaIcons
@CheckRight:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckUp
                moveq   #2,d1
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_3-$1000000)).w
                beq.s   @CheckUp
                sndCom  SFX_MENU_SELECTION
                bra.w   @DmaIcons
@CheckUp:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckDown
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   @DmaIcons
@CheckDown:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckB
                moveq   #3,d1
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_4-$1000000)).w
                beq.s   @CheckB
                sndCom  SFX_MENU_SELECTION
                bra.w   @DmaIcons
@CheckB:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckC
                move.b  #-1,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bra.w   @loc_11
@CheckC:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckA
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   @loc_11
@CheckA:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_9
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   @loc_11
@DmaIcons:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   DmaMembersListIcon
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                moveq   #29,d6
@loc_9:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaMembersListIcon
                moveq   #20,d1
                bsr.w   LoadMemberSummaryHighlightSprites
                subq.w  #1,d6
                bne.s   @loc_10
                moveq   #30,d6
@loc_10:
                
                jsr     (WaitForVInt).w
                bra.w   @CheckLeft
@loc_11:
                
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   @loc_12
                sndCom  SFX_VALIDATION
                moveq   #-1,d1
                bra.s   @Done
@loc_12:
                
                move.w  d1,d2
                add.w   d2,d2
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d2.w),d2
@Done:
                
                movem.l (sp)+,d0/d3-a1
                rts

    ; End of function LoadMemberSummaryIcons


; =============== S U B R O U T I N E =======================================

; In: d0.w = current diamond-menu choice


DmaMembersListIcon:
                
                moveq   #$7F,d7         ; unused icon index mask (?)
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

; Call ExecuteEquipMenu and equip new items accordingly.


PerformEquipItemSubmenuAction:
                
                movem.l d0/d3-a2,-(sp)
@Weapon:
                
                jsr     j_GetEquippableWeapons
                tst.w   d1
                beq.w   @Ring           ; branch if no equippable weapon
                movea.l a0,a2           ; a0, a2 = pointer to equippable items list
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a1
                move.w  (a0),(a1)+
                move.w  4(a0),(a1)+
                move.w  8(a0),(a1)+
                move.w  12(a0),(a1)+
                move.w  d1,d3           ; d3.w = equippable weapons count
                jsr     j_GetEquippedWeapon
                bsr.w   ExecuteEquipMenu
                tst.w   d1
                bpl.s   @EquipWeapon    ; branch based on returned diamond menu choice
                
                moveq   #WINDOW_MEMBERSUMMARY_PAGE_ITEM,d7
                bsr.w   BuildEquipMenuWindow
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
                bsr.w   ExecuteEquipMenu
                tst.w   d1
                bpl.s   @EquipRing      ; branch based on returned diamond menu choice
                
                jsr     j_GetEquippableWeapons
                tst.w   d1
                bne.s   @Goto_Weapon
                
                moveq   #WINDOW_MEMBERSUMMARY_PAGE_ITEM,d7
                bsr.w   BuildEquipMenuWindow
                jsr     (WaitForWindowMovementEnd).w
                moveq   #-1,d1
                bra.w   @Done
@Goto_Weapon:
                
                bra.w   @Weapon
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

    ; End of function PerformEquipItemSubmenuAction


; =============== S U B R O U T I N E =======================================

; In: D1 = old equipped item index
;     D2 = old equipped item slot
;     D3 = equippable items count

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

ExecuteEquipMenu:
                
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
                bsr.w   BuildEquipMenuWindow
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
                bsr.w   UpdateMemberSummaryWindow
                move.w  memberSummaryWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                moveq   #$1D,d6
loc_14366:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaMembersListIcon       
                moveq   #$14,d1
                bsr.w   LoadMemberSummaryHighlightSprites
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
                move.b  #WINDOW_MEMBERSUMMARY_PAGE_ITEM,((CURRENT_MEMBERS_LIST_SUMMARY_PAGE-$1000000)).w
                rts

    ; End of function ExecuteEquipMenu


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

BuildEquipMenuWindow:
                
                movem.w d0-d7,-(sp)
                move.w  memberSummaryWindow(a6),d0
                move.w  #$2001,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.b  d7,((CURRENT_MEMBERS_LIST_SUMMARY_PAGE-$1000000)).w
                clr.w   d5
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d5
                lsl.w   #1,d5
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d5.w),d5
                bsr.w   UpdateMemberSummaryWindow
                move.w  memberSummaryWindow(a6),d0
                move.w  #$A01,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                movem.w (sp)+,d0-d7
                rts

    ; End of function BuildEquipMenuWindow


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

CloseMembersListWindow:
                
                movem.w d0-d2/d7,-(sp)
                move.w  membersListWindow(a6),d0
                move.w  #$21C,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.w (sp)+,d0-d2/d7
                rts

    ; End of function CloseMembersListWindow


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

OpenMembersListWindow:
                
                movem.w d0-d2/d7,-(sp)
                move.w  membersListWindow(a6),d0
                move.w  #$20E,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.w (sp)+,d0-d2/d7
                rts

    ; End of function OpenMembersListWindow


; =============== S U B R O U T I N E =======================================


ExecuteExplorationMagicMenu:
                
                module
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
@loc_1:
                
                jsr     (WaitForVInt).w
                moveq   #30,d6
                
@CheckLeft:
                
                ; Check inputs
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckRight
                moveq   #1,d1
                cmpi.w  #SPELL_NOTHING,((DISPLAYED_ICON_2-$1000000)).w
                beq.s   @CheckRight
                sndCom  SFX_MENU_SELECTION
                bra.w   @DmaIcons
@CheckRight:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckUp
                moveq   #2,d1
                cmpi.w  #SPELL_NOTHING,((DISPLAYED_ICON_3-$1000000)).w
                beq.s   @CheckUp
                sndCom  SFX_MENU_SELECTION
                bra.w   @DmaIcons
@CheckUp:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckDown
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   @DmaIcons
@CheckDown:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckB
                moveq   #3,d1
                cmpi.w  #SPELL_NOTHING,((DISPLAYED_ICON_4-$1000000)).w
                beq.s   @CheckB
                sndCom  SFX_MENU_SELECTION
                bra.w   @DmaIcons
@CheckB:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckC
                move.b  #-1,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bra.w   byte_145A8
@CheckC:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckA
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   byte_145A8
@CheckA:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_10
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   byte_145A8
@DmaIcons:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   DmaMembersListIcon
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                moveq   #29,d6
@loc_10:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaMembersListIcon
                moveq   #20,d1
                bsr.w   LoadMemberSummaryHighlightSprites
                subq.w  #1,d6
                bne.s   @loc_11
                moveq   #30,d6
@loc_11:
                
                jsr     (WaitForVInt).w
                bra.w   @CheckLeft
byte_145A8:
                
                sndCom  SFX_VALIDATION
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   @loc_13
                moveq   #-1,d1
                movem.l (sp)+,d0/d3-a1
                rts
@loc_13:
                
                move.w  d1,d2
                add.w   d2,d2
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d2.w),d2
                move.w  d2,-(sp)
                moveq   #30,d6
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaMembersListIcon
                move.w  (sp)+,d2
                move.w  d2,d4
                lsr.w   #SPELLENTRY_OFFSET_LV,d4
                move.w  d4,d3
                moveq   #19,d1
                bsr.w   LoadMemberSummaryHighlightSprites
                jsr     (WaitForVInt).w
                moveq   #20,d1
@loc_14:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_15
                tst.w   d3
                ble.s   @loc_15
                subq.w  #1,d3
                sndCom  SFX_MENU_SELECTION
                bra.w   @loc_19
@loc_15:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_16
                cmp.w   d4,d3
                bge.s   @loc_16
                addq.w  #1,d3
                sndCom  SFX_MENU_SELECTION
                bra.w   @loc_19
@loc_16:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_17
                move.b  #-1,d3
                bra.w   @loc_22
@loc_17:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_18
                bra.w   @loc_22
@loc_18:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_20
                bra.w   @loc_22
@loc_19:
                
                bsr.w   WriteSpellLevel 
                moveq   #19,d1
@loc_20:
                
                bsr.w   LoadMemberSummaryHighlightSprites
                subq.w  #1,d1
                bne.s   @loc_21
                moveq   #20,d1
@loc_21:
                
                jsr     (WaitForVInt).w
                bra.s   @loc_14
@loc_22:
                
                moveq   #19,d1
                bsr.w   LoadMemberSummaryHighlightSprites
                tst.b   d3
                bpl.s   @loc_23
                sndCom  SFX_VALIDATION
                move.w  d4,d3
                bsr.w   WriteSpellLevel 
                bra.w   @loc_1
@loc_23:
                
                move.w  d2,d1
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                lsl.w   #6,d3
                or.w    d3,d1
                movem.l (sp)+,d0/d3-a1  ;     fixSelectionRectCorners
                                        ;     Remove white pixels from corners of spell/item selection rect.
                                        ;     In: A1 = end of selection rect section in RAM
                rts

    ; End of function ExecuteExplorationMagicMenu

                modend

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

; Load VDP sprite data for the red box used to highlight text in the
; members list screen summary (i.e., top-right) window.
; 
; In: d1.w = blinking frame timer


LoadMemberSummaryHighlightSprites:
                
                movem.w d0/d2,-(sp)
                lea     (SPRITE_BATTLE_CURSOR).l,a0
                lea     sprite_MemberSummaryHighlightSprites(pc), a1
                move.w  ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                lsl.w   #NIBBLE_SHIFT_COUNT,d0
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                beq.s   @Continue1
                
                moveq   #1,d1
                move.w  #256,d0         ; position sprites off-screen while windows are hidden
@Continue1:
                
                moveq   #WINDOW_MEMBERS_LIST_HIGHLIGHTSPRITES_COUNTER,d7
@Loop1:
                
                move.w  (a1)+,(a0)
                add.w   d0,(a0)
                move.w  (a1)+,d2
                move.w  d2,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_TILE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_X(a0)
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a0
                dbf     d7,@Loop1
                
                ; Check blinking frame timer
                cmpi.w  #7,d1
                bge.s   @Continue2
                
                move.w  #256,d0         ; position sprites off-screen at regular intervals
                bra.s   @AdjustY
@Continue2:
                
                clr.w   d0
@AdjustY:
            if (STANDARD_BUILD&EXTENDED_SPELL_NAMES=1)
                cmpi.b  #WINDOW_MEMBERSUMMARY_PAGE_MAGIC,((CURRENT_MEMBERS_LIST_SUMMARY_PAGE-$1000000)).w
                bne.s   @Items
                lea     spr_MagicListTextHighlight(pc), a1
            endif
@Items:
                
                clr.w   d2
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d2
                lsl.w   #NIBBLE_SHIFT_COUNT,d2
                add.w   d2,d0
                moveq   #WINDOW_MEMBERSUMMARY_HIGHLIGHTSPRITES_COUNTER,d7
@Loop2:
                
                move.w  (a1)+,(a0)
                add.w   d0,(a0)
                move.w  (a1)+,d2
                move.w  d2,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_TILE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_X(a0)
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a0
                dbf     d7,@Loop2
                
                bsr.w   LinkHighlightSprites
                movem.w (sp)+,d0/d2
                rts

    ; End of function LoadMemberSummaryHighlightSprites

sprite_MemberSummaryHighlightSprites:
                
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

; In: d3.w  = selected spell level

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

WriteSpellLevel:
                
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

    ; End of function WriteSpellLevel


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
                jsr     CloseMembersListWindow(pc)
                sndCom  MUSIC_CURSED_ITEM
                txt     43              ; "Gosh!  The curse prohibits{N}you from exchanging{N}equipment!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput_0
                clsTxt
                jsr     OpenMembersListWindow(pc)
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
                jsr     CloseMembersListWindow(pc)
                sndCom  MUSIC_CURSED_ITEM
                txt     34              ; "Gosh!  {NAME} is{N}cursed!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput_0
                clsTxt
                jsr     OpenMembersListWindow(pc)
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

