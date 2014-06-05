
; GAME SECTION 05 :
; Battle Engine, Special Sprites, Shop/Church/Blacksmith/Caravan engine

; FREE SPACE : 626 bytes.



; =============== S U B R O U T I N E =======================================

j_ShopActions:
										
										jmp     ShopActions(pc)

	; End of function j_ShopActions


; =============== S U B R O U T I N E =======================================

j_ChurchActions:
										
										jmp     ChurchActions(pc)

	; End of function j_ChurchActions


; =============== S U B R O U T I N E =======================================

j_ExecuteMainMenu:
										
										jmp     ExecuteMainMenu(pc)

	; End of function j_ExecuteMainMenu


; =============== S U B R O U T I N E =======================================

j_BlacksmithActions:
										
										jmp     BlacksmithActions(pc)

	; End of function j_BlacksmithActions


; =============== S U B R O U T I N E =======================================

; seems related to caravan

j_CaravanActions:
										
										jmp     CaravanActions(pc)

	; End of function j_CaravanActions


; =============== S U B R O U T I N E =======================================

j_LevelUpCutscene:
										
										jmp     FieldItem_LevelUp(pc)

	; End of function j_LevelUpCutscene


; =============== S U B R O U T I N E =======================================

j_ExecuteMapLoop:
										
										jmp     ExecuteMapLoop(pc)

	; End of function j_ExecuteMapLoop


; =============== S U B R O U T I N E =======================================

j_LoadUnitCursorTileData:
										
										jmp     LoadUnitCursorTileData(pc)

	; End of function j_LoadUnitCursorTileData


; =============== S U B R O U T I N E =======================================

sub_20020:
										
										jmp     sub_23554(pc)

	; End of function sub_20020


; =============== S U B R O U T I N E =======================================

sub_20024:
										
										jmp     sub_2364C(pc)

	; End of function sub_20024


; =============== S U B R O U T I N E =======================================

j_ControlUnitCursor:
										
										jmp     ControlUnitCursor(pc)

	; End of function j_ControlUnitCursor


; =============== S U B R O U T I N E =======================================

j_SetUnitCursorDestinationToNextBattleEntity:
										
										jmp     SetUnitCursorDestination(pc)

	; End of function j_SetUnitCursorDestinationToNextBattleEntity


; =============== S U B R O U T I N E =======================================

j_setCameraDestInTiles:
										
										jmp     setCameraDestInTiles(pc)

	; End of function j_setCameraDestInTiles


; =============== S U B R O U T I N E =======================================

j_ExecuteBattleLoop:
										
										jmp     ExecuteBattleLoop(pc)

	; End of function j_ExecuteBattleLoop


; =============== S U B R O U T I N E =======================================

j_ExecuteBattleLoop_Unused:
										
										jmp     ExecuteBattleLoop(pc)

	; End of function j_ExecuteBattleLoop_Unused


; =============== S U B R O U T I N E =======================================

j_GetEntityEventIdx:
										
										jmp     GetEntityEventIdx(pc)

	; End of function j_GetEntityEventIdx


; =============== S U B R O U T I N E =======================================

j_GetEntityIndex:
										
										jmp     getEntityNumberOfCombatant(pc)

	; End of function j_GetEntityIndex


; =============== S U B R O U T I N E =======================================

j_fadeOut_WaitForP2Input:
										
										jmp     waitForMusicResumeAndPlayerInput_4(pc)

	; End of function j_fadeOut_WaitForP2Input


; =============== S U B R O U T I N E =======================================

j_SetEntityPosition:
										
										jmp     SetEntityPosition(pc)

	; End of function j_SetEntityPosition


; =============== S U B R O U T I N E =======================================

sub_2004C:
										
										jmp     sub_23862(pc)

	; End of function sub_2004C


; =============== S U B R O U T I N E =======================================

sub_20050:
										
										jmp     sub_25CFA(pc)

	; End of function sub_20050


; =============== S U B R O U T I N E =======================================

sub_20054:
										
										jmp     sub_25C24(pc)

	; End of function sub_20054


; =============== S U B R O U T I N E =======================================

sub_20058:
										
										jmp     sub_25CB6(pc)

	; End of function sub_20058


; =============== S U B R O U T I N E =======================================

j_endGame:
										
										jmp     endGame(pc)     

	; End of function j_endGame


; =============== S U B R O U T I N E =======================================

j_SuspendGame:
										
										jmp     SuspendGame(pc)

	; End of function j_SuspendGame


; =============== S U B R O U T I N E =======================================

ShopActions:
										
										movem.l d0-a5,-(sp)
										link    a6,#-$16
										moveq   #0,d1
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_2007A
										jsr     j_initPortraitWindow
loc_2007A:
										
										trap    #5
										dc.w $9E
										trap    #5
										dc.w $FFFF
										jsr     j_hidePortraitWindow
loc_20088:
										
										moveq   #0,d0
										moveq   #0,d1
										moveq   #6,d2
										lea     (initStack).w,a0
										jsr     j_ExecuteMenu
										cmp.w   #$FFFF,d0
										beq.s   loc_200A2
										bra.w   loc_200C6
loc_200A2:
										
										moveq   #0,d1
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_200B0
										jsr     j_initPortraitWindow
loc_200B0:
										
										trap    #5
										dc.w $A1
										trap    #5
										dc.w $FFFF
										jsr     j_hidePortraitWindow
										unlk    a6
										movem.l (sp)+,d0-a5
										rts
loc_200C6:
										
										cmp.w   #0,d0
										bne.w   loc_202CA
loc_200CE:
										
										trap    #5
										dc.w $A2
										jsr     sub_207E6(pc)
										nop
										jsr     sub_1004C
										cmp.w   #$FFFF,d0
										beq.w   loc_207CC
										move.w  d0,-$C(a6)
										move.w  d0,d1
										jsr     j_GetItemDefAddress
										move.w  6(a0),-4(a6)
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										clr.l   ((RAM_Dialog_NumberToPrint-$1000000)).w
										move.w  -4(a6),((word_FFB778-$1000000)).w
										trap    #5
										dc.w $A3
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.s   loc_20120
loc_20118:
										
										trap    #5
										dc.w $A4
										bra.w   loc_202C2
loc_20120:
										
										jsr     j_GetGold
										move.l  d1,-8(a6)
										clr.l   d0
										move.w  -4(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_2013C
										trap    #5
										dc.w $A5
										bra.w   loc_202C2
loc_2013C:
										
										trap    #5
										dc.w $A6
										trap    #5
										dc.w $FFFF
										jsr     j_UpdateForce
										move.w  ((RAM_CharIdxListSize-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.b  #1,d7
loc_2015E:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_2015E
										trap    #5
										dc.w $FFFF
										move.w  -$C(a6),((word_FFB13A-$1000000)).w
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										beq.s   loc_20118
										move.w  d0,-$A(a6)
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										cmp.w   #4,d2
										bcs.s   loc_201AC
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $A8
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.s   loc_2013C
										bra.w   loc_20118
loc_201AC:
										
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmp.w   #1,d2
										bne.s   loc_201E4
										move.w  -$C(a6),d1
										move.w  -$A(a6),d0
										jsr     j_isWeaponOrRingEquippable
										bcs.s   loc_201E4
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $A7
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										bne.w   loc_2013C
loc_201E4:
										
										moveq   #0,d1
										move.w  -4(a6),d1
										jsr     j_DecreaseGold
										move.w  -$A(a6),d0
										move.w  -$C(a6),d1
										jsr     j_AddItem
										move.w  -$C(a6),d1
										move.w  -$A(a6),d0
										jsr     j_isWeaponOrRingEquippable
										bcc.w   loc_202BE
										trap    #5
										dc.w $AD
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										bne.w   loc_202BE
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmp.w   #1,d2
										bne.s   loc_2025E
										move.w  -$A(a6),d0
										jsr     j_GetEquippedWeapon
										cmp.w   #$FFFF,d1
										beq.s   loc_2028A
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmp.w   #2,d2
										bne.w   loc_2028A
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $B0
										bra.s   loc_202BE
loc_2025E:
										
										move.w  -$A(a6),d0
										jsr     j_GetEquippedRing
										cmp.w   #$FFFF,d1
										beq.s   loc_2028A
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmp.w   #2,d2
										bne.w   loc_2028A
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $B0
										bra.s   loc_202BE
loc_2028A:
										
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d2,d1
										subq.w  #1,d1
										jsr     j_EquipItem
										cmp.w   #2,d2
										bne.s   loc_202B8
										trap    #0
										dc.w MUSIC_CURSED_ITEM  ; cursed item
										jsr     waitForMusicResumeAndPlayerInput_1(pc)
										nop
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $AF
										bra.s   loc_202BC
loc_202B8:
										
										trap    #5
										dc.w $AE
loc_202BC:
										
										bra.s   loc_202C2
loc_202BE:
										
										trap    #5
										dc.w $A9
loc_202C2:
										
										trap    #5
										dc.w $FFFF
										bra.w   loc_200CE
loc_202CA:
										
										cmp.w   #1,d0
										bne.w   loc_20442
loc_202D2:
										
										trap    #5
										dc.w $B1
										trap    #5
										dc.w $FFFF
										jsr     j_UpdateForce
										move.w  ((RAM_CharIdxListSize-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.b  #1,d7
loc_202F4:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_202F4
										trap    #5
										dc.w $FFFF
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #$7F,((word_FFB13A-$1000000)).w 
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										beq.w   loc_207CC
										clr.w   -$16(a6)
										move.w  d0,-$A(a6)
										move.w  d1,-$E(a6)
										move.w  d2,-$C(a6)
										move.w  -$C(a6),d1
										jsr     j_GetItemDefAddress
										move.w  ITEMDEF_OFFSET_PRICE(a0),-4(a6)
										move.l  ITEMDEF_OFFSET_TYPE(a0),-$14(a6)
										clr.l   d0
										move.w  -4(a6),d0
										mulu.w  #3,d0
										lsr.l   #2,d0
										move.l  d0,-8(a6)
										move.b  -$14(a6),d1
										and.b   #ITEMTYPE_MASK_UNSELLABLE,d1
										cmp.b   #0,d1
										beq.s   loc_20364
										trap    #TRAP_TEXTBOX
										dc.w $B4
										bra.w   loc_2043A
loc_20364:
										
										move.l  -8(a6),((RAM_Dialog_NumberToPrint-$1000000)).w
										move.b  -$14(a6),d1
										and.b   #ITEMTYPE_MASK_RARE,d1
										cmp.b   #0,d1
										beq.s   loc_20384
										move.w  #1,-$16(a6)
										trap    #5
										dc.w $B7
										bra.s   loc_20388
loc_20384:
										
										trap    #5
										dc.w $B2
loc_20388:
										
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.s   loc_2039C
										trap    #5
										dc.w $B3
										bra.w   loc_2043A
loc_2039C:
										
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmp.w   #1,d2
										bne.s   loc_203DC
										move.w  -$A(a6),d0
										jsr     j_GetEquippedWeapon
										cmp.w   #$FFFF,d1
										beq.w   loc_2040C
										cmp.w   -$E(a6),d2
										bne.w   loc_2040C
										move.w  -$C(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_2040C
										trap    #5
										dc.w $B8
										bra.w   loc_2043A
loc_203DC:
										
										move.w  -$A(a6),d0
										jsr     j_GetEquippedRing
										cmp.w   #$FFFF,d1
										beq.w   loc_2040C
										cmp.w   -$E(a6),d2
										bne.w   loc_2040C
										move.w  -$C(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_2040C
										trap    #5
										dc.w $B8
										bra.w   loc_2043A
loc_2040C:
										
										move.l  -8(a6),d1
										jsr     j_IncreaseGold
										move.w  -$A(a6),d0
										move.w  -$E(a6),d1
										jsr     j_DropItemBySlot
										cmp.w   #0,-$16(a6)
										beq.s   loc_20436
										move.w  -$C(a6),d1
										jsr     j_AddItemToDeals
loc_20436:
										
										trap    #5
										dc.w $B5
loc_2043A:
										
										trap    #5
										dc.w $FFFF
										bra.w   loc_202D2
loc_20442:
										
										cmp.w   #2,d0
										bne.w   loc_205B4
loc_2044A:
										
										trap    #5
										dc.w $BA
										trap    #5
										dc.w $FFFF
										jsr     j_UpdateForce
										move.w  ((RAM_CharIdxListSize-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.b  #1,d7
loc_2046C:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_2046C
										trap    #5
										dc.w $FFFF
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #$7F,((word_FFB13A-$1000000)).w 
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										beq.w   loc_207CC
										move.w  d0,-$A(a6)
										move.w  d1,-$E(a6)
										move.w  d2,-$C(a6)
										move.w  -$C(a6),d1
										jsr     j_GetItemDefAddress
										move.w  6(a0),-4(a6)
										move.w  -4(a6),d0
										lsr.w   #2,d0
										move.w  d0,-4(a6)
										move.w  -$A(a6),d0
										jsr     j_GetCharEntryAddress
										move.w  -$E(a6),d1
										add.w   d1,d1
										lea     $20(a0,d1.w),a0
										move.w  (a0),d2
										btst    #$F,d2
										bne.w   loc_204DC
										trap    #5
										dc.w $BC
										bra.w   loc_205AC
loc_204DC:
										
										clr.l   ((RAM_Dialog_NumberToPrint-$1000000)).w
										move.w  -4(a6),((word_FFB778-$1000000)).w
										trap    #5
										dc.w $BB
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.s   loc_204FE
										trap    #5
										dc.w $B3
										bra.w   loc_205AC
loc_204FE:
										
										jsr     j_GetGold
										move.l  d1,-8(a6)
										clr.l   d0
										move.w  -4(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_2051A
										trap    #5
										dc.w $BD
										bra.w   loc_205AC
loc_2051A:
										
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmp.w   #1,d2
										bne.s   loc_2055A
										move.w  -$A(a6),d0
										jsr     j_GetEquippedWeapon
										cmp.w   #$FFFF,d1
										beq.w   loc_2058A
										cmp.w   -$E(a6),d2
										bne.w   loc_2058A
										move.w  -$C(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_2058A
										trap    #5
										dc.w $BE
										bra.w   loc_205AC
loc_2055A:
										
										move.w  -$A(a6),d0
										jsr     j_GetEquippedRing
										cmp.w   #$FFFF,d1
										beq.w   loc_2058A
										cmp.w   -$E(a6),d2
										bne.w   loc_2058A
										move.w  -$C(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_2058A
										trap    #5
										dc.w $BE
										bra.w   loc_205AC
loc_2058A:
										
										moveq   #0,d1
										move.w  -4(a6),d1
										jsr     j_DecreaseGold
										move.w  -$A(a6),d0
										move.w  -$E(a6),d1
										jsr     j_RepairItemBySlot
										trap    #5
										dc.w $BF
										trap    #5
										dc.w $C0
loc_205AC:
										
										trap    #5
										dc.w $FFFF
										bra.w   loc_2044A
loc_205B4:
										
										jsr     DetermineDealsItemsNotInCurrentShop(pc)
										nop
										tst.w   ((word_FFB12E-$1000000)).w
										bne.s   loc_205C8
										trap    #TRAP_TEXTBOX
										dc.w $AC
										bra.w   loc_207CC
loc_205C8:
										
										trap    #5
										dc.w $AB
										jsr     sub_1004C
										cmp.w   #$FFFF,d0
										beq.w   loc_207CC
										move.w  d0,-$C(a6)
										move.w  d0,d1
										jsr     j_GetItemDefAddress
										move.w  6(a0),-4(a6)
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										clr.l   ((RAM_Dialog_NumberToPrint-$1000000)).w
										move.w  -4(a6),((word_FFB778-$1000000)).w
										trap    #5
										dc.w $A3
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.s   loc_20614
loc_2060C:
										
										trap    #5
										dc.w $A4
										bra.w   loc_207C4
loc_20614:
										
										jsr     j_GetGold
										move.l  d1,-8(a6)
										clr.l   d0
										move.w  -4(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_20630
										trap    #5
										dc.w $A5
										bra.w   loc_207C4
loc_20630:
										
										trap    #5
										dc.w $A6
										trap    #5
										dc.w $FFFF
										jsr     j_UpdateForce
										move.w  ((RAM_CharIdxListSize-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.b  #1,d7
loc_20652:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_20652
										trap    #5
										dc.w $FFFF
										move.w  -$C(a6),((word_FFB13A-$1000000)).w
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										beq.s   loc_2060C
										move.w  d0,-$A(a6)
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										cmp.w   #4,d2
										bcs.s   loc_206A0
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $A8
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.s   loc_20630
										bra.w   loc_2060C
loc_206A0:
										
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmp.w   #1,d2
										bne.s   loc_206D8
										move.w  -$C(a6),d1
										move.w  -$A(a6),d0
										jsr     j_isWeaponOrRingEquippable
										bcs.s   loc_206D8
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $A7
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										bne.w   loc_20630
loc_206D8:
										
										moveq   #0,d1
										move.w  -4(a6),d1
										jsr     j_DecreaseGold
										move.w  -$A(a6),d0
										move.w  -$C(a6),d1
										jsr     j_AddItem
										move.w  -$C(a6),d1
										jsr     j_RemoveItemFromDeals
										move.w  -$C(a6),d1
										move.w  -$A(a6),d0
										jsr     j_isWeaponOrRingEquippable
										bcc.w   loc_207C0
										trap    #5
										dc.w $AD
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										bne.w   loc_207C0
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmp.w   #1,d2
										bne.s   loc_2075C
										move.w  -$A(a6),d0
										jsr     j_GetEquippedWeapon
										cmp.w   #$FFFF,d1
										beq.s   loc_20788
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmp.w   #2,d2
										bne.w   loc_20788
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $B0
										bra.s   loc_207C0
loc_2075C:
										
										move.w  -$A(a6),d0
										jsr     j_GetEquippedRing
										cmp.w   #$FFFF,d1
										beq.s   loc_20788
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmp.w   #2,d2
										bne.w   loc_20788
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $B0
										bra.s   loc_207C0
loc_20788:
										
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d2,d1
										subq.w  #1,d1
										jsr     j_EquipItem
										cmp.w   #2,d2
										bne.s   loc_207BA
										trap    #0
										dc.w MUSIC_CURSED_ITEM
										jsr     waitForMusicResumeAndPlayerInput_1(pc)
										nop
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $AF
										trap    #5
										dc.w $FFFF
										bra.s   loc_207BE
loc_207BA:
										
										trap    #5
										dc.w $AE
loc_207BE:
										
										bra.s   loc_207C4
loc_207C0:
										
										trap    #5
										dc.w $A9
loc_207C4:
										
										trap    #5
										dc.w $FFFF
										bra.w   loc_205B4
loc_207CC:
										
										trap    #5
										dc.w $FFFF
										bra.w   loc_20088

	; End of function ShopActions


; =============== S U B R O U T I N E =======================================

waitForMusicResumeAndPlayerInput_1:
										
										move.w  d0,-(sp)
										move.w  #$FB,d0 
										jsr     (playMusicAfterCurrentOne).w
										jsr     (WaitForPlayerInput).w
										move.w  (sp)+,d0
										rts

	; End of function waitForMusicResumeAndPlayerInput_1


; =============== S U B R O U T I N E =======================================

sub_207E6:
										
										lea     ((byte_FFB0AE-$1000000)).w,a1
										bsr.s   GetCurrentShopDefAddress
										clr.w   d7
										move.b  (a0)+,d7
										move.w  d7,((word_FFB12E-$1000000)).w
										subq.b  #1,d7
loc_207F6:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_207F6
										rts

	; End of function sub_207E6


; =============== S U B R O U T I N E =======================================

DetermineDealsItemsNotInCurrentShop:
										
										movem.l d1-d2/d7-a0,-(sp)
										lea     ((byte_FFB0AE-$1000000)).w,a0
										clr.w   ((word_FFB12E-$1000000)).w
										clr.w   d1
										moveq   #ITEM_MAX_IDX,d7
loc_2080E:
										
										jsr     j_GetDealsItemAmount
										tst.b   d2
										beq.w   loc_20828
										bsr.w   DoesCurrentShopContainItem
										beq.w   loc_20828
										move.b  d1,(a0)+
										addq.w  #1,((word_FFB12E-$1000000)).w
loc_20828:
										
										addq.w  #1,d1
										dbf     d7,loc_2080E
										movem.l (sp)+,d1-d2/d7-a0
										rts

	; End of function DetermineDealsItemsNotInCurrentShop


; =============== S U B R O U T I N E =======================================

; In: D1 = item idx
; Out: Z = 0 = yes, 1 = no

DoesCurrentShopContainItem:
										
										movem.l d7-a0,-(sp)
										bsr.w   GetCurrentShopDefAddress
										clr.w   d7
										move.b  (a0)+,d7
										subq.b  #1,d7
loc_20842:
										
										cmp.b   (a0)+,d1
										beq.w   loc_2084C
										dbf     d7,loc_20842
loc_2084C:
										
										movem.l (sp)+,d7-a0
										rts

	; End of function DoesCurrentShopContainItem


; =============== S U B R O U T I N E =======================================

GetCurrentShopDefAddress:
										
										movem.l d0/d7,-(sp)
										lea     tbl_ShopItems(pc), a0
										clr.w   d7
										move.b  (RAM_CurrentShopIdx).l,d7
										subq.b  #1,d7
										bcs.w   loc_20872
										clr.w   d0
loc_2086A:
										
										move.b  (a0)+,d0
										add.w   d0,a0
										dbf     d7,loc_2086A
loc_20872:
										
										movem.l (sp)+,d0/d7
										rts

	; End of function GetCurrentShopDefAddress

tbl_ShopItems:      dc.b   5                ; related to shop index
										dc.b $39 
										dc.b $48 
										dc.b $21 
										dc.b $55 
										dc.b $67 
										dc.b   7
										dc.b $39 
										dc.b $48 
										dc.b $49 
										dc.b $21 
										dc.b $55 
										dc.b $56 
										dc.b $67 
										dc.b   9
										dc.b $39 
										dc.b $3A 
										dc.b $49 
										dc.b $4A 
										dc.b $21 
										dc.b $22 
										dc.b $55 
										dc.b $56 
										dc.b $67 
										dc.b  $B
										dc.b $39 
										dc.b $3A 
										dc.b $49 
										dc.b $4A 
										dc.b $21 
										dc.b $22 
										dc.b $55 
										dc.b $56 
										dc.b $67 
										dc.b $68 
										dc.b $2D 
										dc.b  $B
										dc.b $3A 
										dc.b $3B 
										dc.b $49 
										dc.b $4A 
										dc.b $21 
										dc.b $22 
										dc.b $56 
										dc.b $57 
										dc.b $67 
										dc.b $68 
										dc.b $2D 
										dc.b  $C
										dc.b $3A 
										dc.b $3B 
										dc.b $4A 
										dc.b $4B 
										dc.b $22 
										dc.b $23 
										dc.b $56 
										dc.b $57 
										dc.b $68 
										dc.b $69 
										dc.b $2D 
										dc.b $2E 
										dc.b  $C
										dc.b $3B 
										dc.b $3C 
										dc.b $4A 
										dc.b $4B 
										dc.b $23 
										dc.b $24 
										dc.b $58 
										dc.b $59 
										dc.b $69 
										dc.b $6A 
										dc.b $2E 
										dc.b $2F 
										dc.b   6
										dc.b $3E 
										dc.b $25 
										dc.b $4C 
										dc.b $30 
										dc.b $5A 
										dc.b $1A
										dc.b  $A
										dc.b $3E 
										dc.b $3F 
										dc.b $4D 
										dc.b $26 
										dc.b $30 
										dc.b $31 
										dc.b $5A 
										dc.b $5B 
										dc.b $1A
										dc.b $1B
										dc.b  $A
										dc.b $3E 
										dc.b $3F 
										dc.b $4D 
										dc.b $4E 
										dc.b $26 
										dc.b $30 
										dc.b $31 
										dc.b $5B 
										dc.b $5C 
										dc.b $1B
										dc.b  $A
										dc.b $3F 
										dc.b $40 
										dc.b $4D 
										dc.b $4E 
										dc.b $26 
										dc.b $31 
										dc.b $32 
										dc.b $5B 
										dc.b $5C 
										dc.b $1B
										dc.b  $C
										dc.b $3F 
										dc.b $40 
										dc.b $4E 
										dc.b $4F 
										dc.b $26 
										dc.b $27 
										dc.b $31 
										dc.b $32 
										dc.b $5B 
										dc.b $5C 
										dc.b $1B
										dc.b $1C
										dc.b  $C
										dc.b $3F 
										dc.b $40 
										dc.b $4E 
										dc.b $4F 
										dc.b $26 
										dc.b $27 
										dc.b $31 
										dc.b $32 
										dc.b $5B 
										dc.b $5C 
										dc.b $1C
										dc.b $1D
										dc.b  $C
										dc.b $3F 
										dc.b $40 
										dc.b $4E 
										dc.b $4F 
										dc.b $26 
										dc.b $27 
										dc.b $31 
										dc.b $32 
										dc.b $5B 
										dc.b $5C 
										dc.b $1C
										dc.b $1D
										dc.b  $C
										dc.b $3F 
										dc.b $40 
										dc.b $4E 
										dc.b $4F 
										dc.b $26 
										dc.b $27 
										dc.b $31 
										dc.b $32 
										dc.b $5B 
										dc.b $5C 
										dc.b $1C
										dc.b $1D
										dc.b   4
										dc.b   0
										dc.b   1
										dc.b   3
										dc.b   4
										dc.b   4
										dc.b   0
										dc.b   1
										dc.b   3
										dc.b   4
										dc.b   4
										dc.b   0
										dc.b   1
										dc.b   3
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b   6
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   5
										dc.b   4
										dc.b $80 
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   3
										dc.b   4
										dc.b   5
										dc.b   6
										dc.b   7
										dc.b   8
										dc.b   9
										dc.b  $A
										dc.b  $B
										dc.b  $C
										dc.b  $D
										dc.b  $E
										dc.b  $F
										dc.b $10
										dc.b $11
										dc.b $12
										dc.b $13
										dc.b $14
										dc.b $15
										dc.b $16
										dc.b $17
										dc.b $18
										dc.b $19
										dc.b $1A
										dc.b $1B
										dc.b $1C
										dc.b $1D
										dc.b $1E
										dc.b $1F
										dc.b $20
										dc.b $21 
										dc.b $22 
										dc.b $23 
										dc.b $24 
										dc.b $25 
										dc.b $26 
										dc.b $27 
										dc.b $28 
										dc.b $29 
										dc.b $2A 
										dc.b $2B 
										dc.b $2C 
										dc.b $2D 
										dc.b $2E 
										dc.b $2F 
										dc.b $30 
										dc.b $31 
										dc.b $32 
										dc.b $33 
										dc.b $34 
										dc.b $35 
										dc.b $36 
										dc.b $37 
										dc.b $38 
										dc.b $39 
										dc.b $3A 
										dc.b $3B 
										dc.b $3C 
										dc.b $3D 
										dc.b $3E 
										dc.b $3F 
										dc.b $40 
										dc.b $41 
										dc.b $42 
										dc.b $43 
										dc.b $44 
										dc.b $45 
										dc.b $46 
										dc.b $47 
										dc.b $48 
										dc.b $49 
										dc.b $4A 
										dc.b $4B 
										dc.b $4C 
										dc.b $4D 
										dc.b $4E 
										dc.b $4F 
										dc.b $50 
										dc.b $51 
										dc.b $52 
										dc.b $53 
										dc.b $54 
										dc.b $55 
										dc.b $56 
										dc.b $57 
										dc.b $58 
										dc.b $59 
										dc.b $5A 
										dc.b $5B 
										dc.b $5C 
										dc.b $5D 
										dc.b $5E 
										dc.b $5F 
										dc.b $60 
										dc.b $61 
										dc.b $62 
										dc.b $63 
										dc.b $64 
										dc.b $65 
										dc.b $66 
										dc.b $67 
										dc.b $68 
										dc.b $69 
										dc.b $6A 
										dc.b $6B 
										dc.b $6C 
										dc.b $6D 
										dc.b $6E 
										dc.b $6F 
										dc.b $70 
										dc.b $71 
										dc.b $72 
										dc.b $73 
										dc.b $74 
										dc.b $75 
										dc.b $76 
										dc.b $77 
										dc.b $78 
										dc.b $79 
										dc.b $7A 
										dc.b $7B 
										dc.b $7C 
										dc.b $7D 
										dc.b $7E 
										dc.b $7F 

; =============== S U B R O U T I N E =======================================

ChurchActions:
										
										movem.l d0-a5,-(sp)
										link    a6,#-$24
										moveq   #0,d1
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_20A18
										jsr     j_initPortraitWindow
loc_20A18:
										
										trap    #TRAP_TEXTBOX
										dc.w $6E                ; Welcome!{W2}{N}Your desire will be fulfilled!{W2}
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_END
										jsr     j_hidePortraitWindow
loc_20A26:
										
										moveq   #0,d0
										moveq   #0,d1
										moveq   #5,d2
										lea     (initStack).w,a0
										jsr     j_ExecuteMenu
										cmp.w   #$FFFF,d0
										beq.s   loc_20A40
										bra.w   loc_20A64
loc_20A40:
										
										moveq   #0,d1
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_20A4E
										jsr     j_initPortraitWindow
loc_20A4E:
										
										trap    #5
										dc.w $71
										trap    #5
										dc.w $FFFF
										jsr     j_hidePortraitWindow
										unlk    a6
										movem.l (sp)+,d0-a5
										rts
loc_20A64:
										
										cmp.w   #0,d0
										bne.w   loc_20B58
										trap    #5
										dc.w $76
										bsr.w   Church_GetCurrentForceMemberInfo
										clr.w   -$E(a6)
loc_20A78:
										
										clr.w   d0
										move.b  (a0)+,d0
										move.w  d0,-$C(a6)
										jsr     j_GetCurrentHP
										tst.w   d1
										bhi.w   loc_20B42
										add.w   #1,-$E(a6)
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $81
										jsr     j_GetCurrentLevel
										mulu.w  #$A,d1
										move.l  d1,-8(a6)
										jsr     j_GetClass      
										move.w  #0,d2
										bsr.w   sub_210D0
										cmp.w   #0,-$24(a6)
										beq.w   loc_20AC8
										add.l   #$C8,-8(a6) 
loc_20AC8:
										
										move.l  -8(a6),((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $82
										jsr     sub_10050
										jsr     j_YesNoChoiceBox
										jsr     sub_10058
										cmp.w   #0,d0
										beq.w   loc_20AF4
										trap    #5
										dc.w $7C
										bra.w   loc_20B42
loc_20AF4:
										
										jsr     j_GetGold
										move.l  d1,-4(a6)
										move.l  -8(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_20B0C
										trap    #5
										dc.w $7D
										bra.s   loc_20B42
loc_20B0C:
										
										moveq   #0,d1
										move.l  -8(a6),d1
										jsr     j_DecreaseGold
										move.w  -$C(a6),d0
										move.w  #$C8,d1 
										jsr     j_IncreaseCurrentHP
										trap    #0
										dc.w MUSIC_REVIVE
										jsr     waitForMusicResumeAndPlayerInput_2(pc)
										nop
										move.w  -$C(a6),d0
										bsr.w   sub_2124A
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $83
loc_20B42:
										
										dbf     d7,loc_20A78
										cmp.w   #0,-$E(a6)
										bne.w   loc_21028
										trap    #5
										dc.w $80
										bra.w   loc_21028
loc_20B58:
										
										cmp.w   #1,d0
										bne.w   loc_20D3A
										trap    #5
										dc.w $76
										bsr.w   Church_GetCurrentForceMemberInfo
										clr.w   -$10(a6)
										clr.w   -$12(a6)
										clr.w   -$18(a6)
loc_20B74:
										
										clr.w   d0
										move.b  (a0)+,d0
										movem.l a0,-(sp)
										move.w  d0,-$C(a6)
										jsr     j_GetCharEntryAddress
										lea     $2C(a0),a0
										move.w  (a0),d2
										move.w  d2,d3
										and.w   #2,d3
										beq.w   loc_20C24
										add.w   #1,-$10(a6)
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $79
										move.l  #$A,-8(a6)
										move.l  -8(a6),((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $7B
										jsr     sub_10050
										jsr     j_YesNoChoiceBox
										jsr     sub_10058
										cmp.w   #0,d0
										beq.w   loc_20BDA
										trap    #5
										dc.w $7C
										bra.w   loc_20C24
loc_20BDA:
										
										jsr     j_GetGold
										move.l  d1,-4(a6)
										move.l  -8(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_20BF4
										trap    #5
										dc.w $7D
										clr.w   d7
										bra.s   loc_20C24
loc_20BF4:
										
										moveq   #0,d1
										move.l  -8(a6),d1
										jsr     j_DecreaseGold
										move.w  -$C(a6),d0
										move.w  d2,d1
										and.w   #$FFFD,d1
										jsr     j_SetStatus
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_CURE
										jsr     waitForMusicResumeAndPlayerInput_2(pc)
										nop
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $7E
loc_20C24:
										
										movem.l (sp)+,a0
										dbf     d7,loc_20B74
										cmp.w   #0,-$10(a6)
										bne.w   loc_20C3A
										trap    #TRAP_TEXTBOX
										dc.w $77
loc_20C3A:
										
										bsr.w   ChurchCure
										bsr.w   Church_GetCurrentForceMemberInfo
loc_20C42:
										
										clr.w   d0
										move.b  (a0)+,d0
										movem.l a0,-(sp)
										move.w  d0,-$C(a6)
										jsr     j_GetCharEntryAddress
										lea     $2C(a0),a0
										move.w  (a0),d2
										and.w   #4,d2
										beq.w   loc_20D20
										add.w   #1,-$12(a6)
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $7A
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d2,-$14(a6)
										move.w  -$14(a6),d6
										subq.b  #1,d6
										clr.l   d3
loc_20C86:
										
										move.w  d6,d1
										jsr     j_GetItemAndNumberOfItems
										jsr     j_isItemCursed
										bcc.w   loc_20CA8
										jsr     j_GetItemDefAddress
										clr.l   d4
										move.w  6(a0),d4
										lsr.w   #2,d4
										add.l   d4,d3
loc_20CA8:
										
										dbf     d6,loc_20C86
										move.l  d3,-8(a6)
										move.l  -8(a6),((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $7B
										jsr     sub_10050
										jsr     j_YesNoChoiceBox
										jsr     sub_10058
										cmp.w   #0,d0
										beq.w   loc_20CDC
										trap    #5
										dc.w $7C
										bra.w   loc_20D20
loc_20CDC:
										
										jsr     j_GetGold
										move.l  d1,-4(a6)
										move.l  -8(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_20CF6
										trap    #5
										dc.w $7D
										clr.w   d7
										bra.s   loc_20D20
loc_20CF6:
										
										moveq   #0,d1
										move.l  -8(a6),d1
										jsr     j_DecreaseGold
										move.w  -$C(a6),d0
										jsr     j_UnequipAllItemsIfNotCursed
										trap    #0
										dc.w MUSIC_CURE
										jsr     waitForMusicResumeAndPlayerInput_2(pc)
										nop
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $7F
loc_20D20:
										
										movem.l (sp)+,a0
										dbf     d7,loc_20C42
										cmp.w   #0,-$12(a6)
										bne.w   loc_21028
										trap    #5
										dc.w $78
										bra.w   loc_21028
loc_20D3A:
										
										cmp.w   #2,d0
										bne.w   loc_20FCC
										trap    #5
										dc.w $76
										bsr.w   sub_21072
										cmp.w   #0,-$16(a6)
										bne.w   loc_20D5C
										trap    #5
										dc.w $87
										bra.w   loc_21028
loc_20D5C:
										
										trap    #5
										dc.w $88
										trap    #5
										dc.w $FFFF
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10040
										cmp.w   #$FFFF,d0
										bne.w   loc_20D80
										trap    #5
										dc.w $89
										bra.w   loc_21028
loc_20D80:
										
										move.w  d0,-$C(a6)
										jsr     j_GetClass      
										move.w  d1,-$1A(a6)
										move.w  #0,d2
										bsr.w   sub_210D0
										cmp.w   #0,-$24(a6)
										beq.w   loc_20DAE
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $8E
										bra.w   loc_20FC8
loc_20DAE:
										
										jsr     j_GetCurrentLevel
										cmp.w   #$14,d1
										bcc.w   loc_20DCA
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $8A
										bra.w   loc_20FC8
loc_20DCA:
										
										clr.w   -$1C(a6)
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $8B
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.w   loc_20DEE
										trap    #5
										dc.w $89
										bra.w   loc_20FC8
loc_20DEE:
										
										move.w  -$1A(a6),d1
										move.w  #2,d2
										bsr.w   sub_210D0
										cmp.w   #0,-$24(a6)
										bne.w   loc_20EEA
										clr.w   -$1E(a6)
										move.w  -$20(a6),d7
										subq.b  #1,d7
										move.w  #4,d2
										bsr.w   FindPromotionSection
										addq.w  #1,a0
loc_20E18:
										
										move.b  (a0)+,-$1E(a6)
										dbf     d7,loc_20E18
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d6
										subq.w  #1,d6
loc_20E2A:
										
										move.b  (a0)+,d0
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmp.w   #0,d2
										beq.w   loc_20E56
										move.w  d2,d7
										subq.w  #1,d7
loc_20E40:
										
										move.w  d7,d1
										jsr     j_GetItemAndNumberOfItems
										move.b  d1,d2
										cmp.b   -$1E(a6),d2
										beq.w   loc_20E5E
										dbf     d7,loc_20E40
loc_20E56:
										
										dbf     d6,loc_20E2A
										bra.w   loc_20EEA
loc_20E5E:
										
										move.w  d0,-$12(a6)
										move.w  d7,-$14(a6)
										move.w  d1,-$1E(a6)
										move.w  #3,d2
										bsr.w   FindPromotionSection
										addq.w  #1,a0
										move.w  -$20(a6),d7
										subq.w  #1,d7
										clr.w   d0
loc_20E7C:
										
										move.b  (a0)+,d0
										dbf     d7,loc_20E7C
										move.w  d0,-$1C(a6)
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -$1E(a6),((RAM_Dialogue_NameIdx3-$1000000)).w
										move.w  -$1C(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #5
										dc.w $8F
										trap    #5
										dc.w $93
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.w   loc_20EB6
										trap    #TRAP_TEXTBOX
										dc.w $90
										bra.w   loc_20EEA
loc_20EB6:
										
										cmp.w   #CLASSIDX_SORC,-$1C(a6)
										bne.w   loc_20ED8
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $91
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										bne.w   loc_20FC8
loc_20ED8:
										
										move.w  -$12(a6),d0
										move.w  -$14(a6),d1
										jsr     j_RemoveItemBySlot
										bra.w   loc_20F30
loc_20EEA:
										
										move.w  #0,d2
										move.w  -$1A(a6),d1
										bsr.w   sub_210D0
										move.w  -$20(a6),d7
										subq.w  #1,d7
										move.w  #1,d2
										bsr.w   FindPromotionSection
										addq.w  #1,a0
										clr.w   d0
loc_20F08:
										
										move.b  (a0)+,d0
										dbf     d7,loc_20F08
										move.w  d0,-$1C(a6)
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -$1C(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $92
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										bne.w   loc_20FC8
loc_20F30:
										
										move.w  -$1A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -$C(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  -$1C(a6),((RAM_Dialogue_NameIdx3-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $8C
										move.w  -$C(a6),d0
										move.w  -$1C(a6),d1
										jsr     j_SetClass
										jsr     j_Promote
										cmp.w   #CLASSIDX_SORC,-$1C(a6)
										bne.s   loc_20F66
										bsr.w   ReplaceSpellsWithSORCDefaults
loc_20F66:
										
										cmp.w   #CLASSIDX_MMNK,-$1C(a6)
										beq.s   loc_20F7A       
										cmp.w   #CLASSIDX_NINJ,-$1C(a6)
										beq.s   loc_20F7A       
										bra.w   loc_20F90
loc_20F7A:
										
										move.w  -$C(a6),d0      ; new class uses a different type of weapon, so unequip weapon
										jsr     j_GetEquippedWeapon
										cmp.w   #$FFFF,d1
										beq.s   loc_20F90
										jsr     j_UnequipWeapon
loc_20F90:
										
										trap    #0
										dc.w MUSIC_PROMOTION
										jsr     waitForMusicResumeAndPlayerInput_2(pc)
										nop
										move.w  -$C(a6),d0
										bsr.w   sub_2124A
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -$1C(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #5
										dc.w $8D
										move.w  -$C(a6),d0
										move.b  #1,d1
										jsr     j_SetLevel
										clr.w   d1
										jsr     j_SetCurrentEXP
loc_20FC8:
										
										bra.w   loc_20D5C
loc_20FCC:
										
										trap    #5
										dc.w $72
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.w   loc_20FE6
										trap    #5
										dc.w $7C
										bra.w   loc_21028
loc_20FE6:
										
										move.b  ((RAM_CurrentMapIdx-$1000000)).w,((RAM_EgressMapIdx-$1000000)).w
										move.w  ((SAVE_SLOT_BEING_USED-$1000000)).w,d0
										trap    #2
										dc.w $18F
										jsr     (SaveGame).w
										trap    #0
										dc.w MUSIC_SAVE         ; save jingle
										jsr     waitForMusicResumeAndPlayerInput_2(pc)
										nop
										trap    #5
										dc.w $73                ; {CLEAR}The light allows you to{N}resume your adventure!{W1}
										trap    #5
										dc.w $74                ; {CLEAR}Will you continue your{N}adventure?
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.w   loc_20A40
										trap    #5
										dc.w $75                ; {CLEAR}Then, take a rest before{N}you continue.{W1}
										jsr     (fadeOutToBlack).w
										jmp     (sub_7034).w    
										bra.w   *+4
loc_21028:
										
										trap    #5
										dc.w $FFFF
										trap    #5
										dc.w $70
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										bne.w   loc_20A40
										trap    #5
										dc.w $FFFF
										bra.w   loc_20A26

	; End of function ChurchActions

promotion_data:     incbin "chardata/promotions.bin"

; =============== S U B R O U T I N E =======================================

sub_21072:
										
										movem.l d7-a1,-(sp)
										jsr     j_UpdateForce
										clr.w   -$16(a6)
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										move.w  ((RAM_CharIdxListSize-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										subq.b  #1,d7
loc_21094:
										
										clr.w   d0
										move.b  (a0),d0
										jsr     j_GetClass      
										move.w  #0,d2
										bsr.w   sub_210D0
										cmp.w   #0,-$24(a6)
										bne.w   loc_210C4
										jsr     j_GetCurrentLevel
										cmp.w   #$14,d1
										bcs.w   loc_210C4
										add.w   #1,-$16(a6)
loc_210C4:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_21094
										movem.l (sp)+,d7-a1
										rts

	; End of function sub_21072


; =============== S U B R O U T I N E =======================================

sub_210D0:
										
										movem.l d7-a0,-(sp)
										clr.w   -$22(a6)
										clr.w   -$20(a6)
										clr.w   -$24(a6)
										bsr.w   FindPromotionSection
										clr.w   d7
										move.b  (a0)+,d7
										move.w  d7,-$22(a6)
										move.w  d7,-$20(a6)
										subq.b  #1,d7
loc_210F2:
										
										cmp.b   (a0)+,d1
										beq.w   loc_21102
										dbf     d7,loc_210F2
										move.w  #1,-$24(a6)
loc_21102:
										
										sub.w   d7,-$20(a6)
										movem.l (sp)+,d7-a0
										rts

	; End of function sub_210D0


; =============== S U B R O U T I N E =======================================

; In: D2 = section type (regpre, regpost, specpre, specpost, specitem)
; Out: A0 = address

FindPromotionSection:
										
										movem.l d0/d6,-(sp)
										lea     promotion_data(pc), a0
										move.w  d2,d6
										subq.w  #1,d6
										bcs.w   loc_21126
										clr.w   d0
loc_2111E:
										
										move.b  (a0)+,d0
										add.w   d0,a0
										dbf     d6,loc_2111E
loc_21126:
										
										movem.l (sp)+,d0/d6
										rts

	; End of function FindPromotionSection


; =============== S U B R O U T I N E =======================================

; In: A6 = church actions stack

ReplaceSpellsWithSORCDefaults:
										
										move.w  -$C(a6),d0
										jsr     j_GetCharEntryAddress
										lea     CHAR_OFFSET_SPELL_0(a0),a0
										move.w  #CHAR_SPELLSLOTS_COUNTER,d7
loc_2113E:
										
										move.b  #SPELLIDX_NOTHING,(a0)+
										dbf     d7,loc_2113E
										move.w  -$C(a6),d0
										move.w  #SPELLIDX_DAO,d1
										jsr     j_LearnSpell
										rts

	; End of function ReplaceSpellsWithSORCDefaults


; =============== S U B R O U T I N E =======================================

Church_GetCurrentForceMemberInfo:
										
										jsr     j_UpdateForce
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										move.w  ((RAM_CharIdxListSize-$1000000)).w,-$A(a6)
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.b  #1,d7
										rts

	; End of function Church_GetCurrentForceMemberInfo


; =============== S U B R O U T I N E =======================================

ChurchCure:
										
										bsr.s   Church_GetCurrentForceMemberInfo
loc_21170:
										
										clr.w   d0
										move.b  (a0)+,d0
										movem.l a0,-(sp)
										move.w  d0,-$C(a6)
										jsr     j_GetCharEntryAddress
										lea     CHAR_OFFSET_STATUS(a0),a0
										move.w  (a0),d2
										move.w  d2,d3
										and.w   #1,d3
										beq.w   loc_21220
										add.w   #1,-$18(a6)
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $84
										move.l  #$14,-8(a6)
										move.l  -8(a6),((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $7B
										jsr     sub_10050
										jsr     j_YesNoChoiceBox
										jsr     sub_10058
										cmp.w   #0,d0
										beq.w   loc_211D6
										trap    #TRAP_TEXTBOX
										dc.w $7C
										bra.w   loc_21220
loc_211D6:
										
										jsr     j_GetGold
										move.l  d1,-4(a6)
										move.l  -8(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_211F0
										trap    #TRAP_TEXTBOX
										dc.w $7D
										clr.w   d7
										bra.s   loc_21220
loc_211F0:
										
										moveq   #0,d1
										move.l  -8(a6),d1
										jsr     j_DecreaseGold
										move.w  -$C(a6),d0
										move.w  d2,d1
										and.w   #$FFFE,d1
										jsr     j_SetStatus
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_CURE
										jsr     waitForMusicResumeAndPlayerInput_2(pc)
										nop
										move.w  -$C(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $85
loc_21220:
										
										movem.l (sp)+,a0
										dbf     d7,loc_21170
										cmp.w   #0,-$18(a6)
										bne.w   return_21236
										trap    #TRAP_TEXTBOX
										dc.w $86
return_21236:
										
										rts

	; End of function ChurchCure


; =============== S U B R O U T I N E =======================================

waitForMusicResumeAndPlayerInput_2:
										
										move.w  d0,-(sp)
										move.w  #$FB,d0 
										jsr     (playMusicAfterCurrentOne).w
										jsr     (WaitForPlayerInput).w
										move.w  (sp)+,d0
										rts

	; End of function waitForMusicResumeAndPlayerInput_2


; =============== S U B R O U T I N E =======================================

sub_2124A:
										
										cmp.b   #$1E,d0
										bhi.s   return_2127C
										movem.l d0-d4/a0,-(sp)
										move.w  d0,d1
										jsr     j_getCharacterSpriteIdx
										move.w  d4,d3
										tst.b   d1
										beq.w   loc_2126C
										bsr.w   getEntityNumberOfCombatant
										tst.b   d0
										ble.s   loc_21278
loc_2126C:
										
										clr.w   d1
										move.b  ((ENTITY_DATA_STRUCT_FACING-$1000000)).w,d1
										moveq   #$FFFFFFFF,d2
										jsr     (sub_6052).w    
loc_21278:
										
										movem.l (sp)+,d0-d4/a0
return_2127C:
										
										rts

	; End of function sub_2124A


; =============== S U B R O U T I N E =======================================

ExecuteMainMenu:
										
										movem.l d0-a5,-(sp)
										link    a6,#-$20
loc_21286:
										
										moveq   #0,d0
										moveq   #0,d1
										moveq   #0,d2
										lea     (initStack).w,a0
										jsr     j_ExecuteMenu
										cmp.w   #$FFFF,d0
										beq.s   loc_212A0
										bra.w   loc_212A8
loc_212A0:
										
										unlk    a6
										movem.l (sp)+,d0-a5
										rts
loc_212A8:
										
										cmp.w   #0,d0
										bne.w   loc_212D8
										bsr.w   sub_219EC       
										trap    #5
										dc.w $FFFF
loc_212B8:
										
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10040
										cmp.w   #$FFFF,d0
										beq.w   loc_212D4
										jsr     j_memberStatsScreen
										bra.s   loc_212B8
loc_212D4:
										
										bra.w   loc_219E8
loc_212D8:
										
										cmp.w   #1,d0
										bne.w   loc_2147C
loc_212E0:
										
										bsr.w   sub_219EC       
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10048
										cmp.w   #$FFFF,d0
										beq.w   loc_21478
										move.w  d0,-4(a6)
										move.w  d1,-$1A(a6)
										move.w  d1,-$1C(a6)
										and.w   #$3F,-$1C(a6) 
										clr.l   -$20(a6)
										lsr.l   #6,d1
										addq.l  #1,d1
										move.l  d1,-$20(a6)
										cmp.w   #2,-$1C(a6)
										beq.w   loc_213A8
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -$1C(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										move.l  -$20(a6),((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $F3                ; {NAME} cast{N}{SPELL} level {#}!
										trap    #0
										dc.w SFX_SPELL_CAST
										trap    #5
										dc.w $FFFF
										cmp.w   #$A,-$1C(a6)
										beq.w   loc_21354
loc_21348:
										
										trap    #5
										dc.w $138               ; But nothing happened.
										trap    #5
										dc.w $FFFF
										bra.w   loc_21478
loc_21354:
										
										clr.w   d0
										move.b  ((RAM_CurrentMapIdx-$1000000)).w,d0
										cmp.w   #$42,d0 
										blt.s   loc_21348
										cmp.w   #$4E,d0 
										bgt.s   loc_21348
loc_21366:
										
										move.b  -$1A(a6),d1
										jsr     j_GetSpellDefAddress
										move.b  1(a0),d1
										move.w  -4(a6),d0
										jsr     j_DecreaseCurrentMP
										jsr     j_executeFlashScreenScript
										move.b  ((RAM_EgressMapIdx-$1000000)).w,d0
										jsr     (GetEgressPositionForMap).w
										lea     ((RAM_MapEventType-$1000000)).w,a0
										move.w  #1,(a0)+
										move.b  #0,(a0)+
										move.b  d0,(a0)+
										move.b  d1,(a0)+
										move.b  d2,(a0)+
										move.b  d3,(a0)+
										clr.b   ((PLAYER_TYPE-$1000000)).w
										bra.w   loc_212A0
loc_213A8:
										
										trap    #5
										dc.w $6C                ; Use magic on whom?{D1}
										trap    #5
										dc.w $FFFF
										move.b  #0,((byte_FFB13C-$1000000)).w
										move.w  #$7F,((word_FFB13A-$1000000)).w 
										jsr     sub_10044
										move.w  d0,-6(a6)
										cmp.w   #$FFFF,d0
										beq.w   loc_212E0
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -$1C(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										move.l  -$20(a6),((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5              ; {NAME} cast{N}{SPELL} level {#}!
										dc.w $F3
										trap    #5
										dc.w $FFFF
										move.b  -$1A(a6),d1
										jsr     j_GetSpellDefAddress
										move.b  1(a0),d1
										move.w  -4(a6),d0
										jsr     j_DecreaseCurrentMP
										move.w  -6(a6),d0
										jsr     j_GetStatus
										moveq   #0,d2
										cmp.l   #1,-$20(a6)
										beq.w   loc_2144E
										cmp.l   #2,-$20(a6)
										beq.w   loc_2143C
										bclr    #2,d1
										beq.s   loc_2143C
										move.w  -6(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $12F               ; {NAME} is no longer{N}cursed.
										moveq   #$FFFFFFFF,d2
										jsr     j_UnequipAllItemsIfNotCursed
loc_2143C:
										
										bclr    #0,d1
										beq.s   loc_2144E
										move.w  -6(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $12E               ; {NAME} is no longer{N}stunned.
										moveq   #$FFFFFFFF,d2
loc_2144E:
										
										bclr    #1,d1
										beq.s   loc_21460
										move.w  -6(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $12D               ; {NAME} is no longer{N}poisoned.
										moveq   #$FFFFFFFF,d2
loc_21460:
										
										tst.w   d2
										bne.s   loc_21468
										trap    #5
										bclr    d0,-(a6)
loc_21468:
										
										trap    #5
										dc.w $FFFF
										jsr     j_SetStatus
										jsr     j_ApplyStatusAndItemsOnStats
loc_21478:
										
										bra.w   loc_219E8
loc_2147C:
										
										cmp.w   #2,d0
										bne.w   loc_219DC
loc_21484:
										
										moveq   #0,d0
										moveq   #0,d1
										moveq   #3,d2
										lea     (initStack).w,a0
										jsr     j_ExecuteMenu
										cmp.w   #$FFFF,d0
										beq.w   loc_21286
										cmp.w   #0,d0
										bne.w   loc_21596
loc_214A4:
										
										bsr.w   sub_219EC       
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #$7F,((word_FFB13A-$1000000)).w 
										jsr     sub_10044
										move.w  d0,-4(a6)
										move.w  d1,-$C(a6)
										move.w  d2,-8(a6)
										cmp.w   #$FFFF,d0
										beq.w   loc_2158E
										cmp.w   #4,d2
										bne.w   loc_2150E
										clr.w   d0
										move.b  ((RAM_CurrentMapIdx-$1000000)).w,d0
										cmp.w   #$42,d0 
										blt.w   loc_2150E
										cmp.w   #$4E,d0 
										bgt.w   loc_2150E
										move.w  -4(a6),d0
										move.w  -$C(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -8(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #5
										dc.w $49                ; {NAME} used the{N}{ITEM}.{W2}
										bra.w   loc_21366
loc_2150E:
										
										move.w  -8(a6),d1
										jsr     sub_229CA
										tst.w   d2
										beq.w   loc_21558
										bsr.w   sub_22C60       
										move.w  -8(a6),d4
										move.w  -$C(a6),d5
										jsr     sub_44088
										tst.w   d6
										bne.w   loc_212A0
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -8(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #5
										dc.w $49                ; {NAME} used the{N}{ITEM}.{W2}
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $1A6
										trap    #5
										dc.w $FFFF
										bra.w   loc_2158E
loc_21558:
										
										move.w  -8(a6),d1
										move.w  #$32,d1 
										trap    #5
										dc.w $FFFF
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10040
										cmp.w   #$FFFF,d0
										beq.w   loc_214A4
										move.w  -8(a6),d1
										bsr.w   UseFieldItem    
										move.w  -4(a6),d0
										move.w  -$C(a6),d1
										jsr     j_RemoveItemBySlot
loc_2158E:
										
										trap    #5
										dc.w $FFFF
										bra.w   loc_219D8
loc_21596:
										
										cmp.w   #1,d0
										bne.w   loc_21856
loc_2159E:
										
										bsr.w   sub_219EC       
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #$7F,((word_FFB13A-$1000000)).w 
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										bne.w   loc_215C0
										bra.w   loc_2184E
loc_215C0:
										
										move.w  d0,-4(a6)
										move.w  d1,-$C(a6)
										move.w  d2,-8(a6)
										move.w  -8(a6),d1
										jsr     j_GetItemType
										cmp.w   #1,d2
										bne.s   loc_21618
										move.w  -4(a6),d0
										jsr     j_GetEquippedWeapon
										cmp.w   #$FFFF,d1
										beq.w   loc_21662
										cmp.w   -$C(a6),d2
										bne.w   loc_21662
										move.w  -8(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_21662
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #0
										dc.w MUSIC_CURSED_ITEM
										trap    #5
										dc.w $37                ; {LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}
										bsr.w   waitForMusicResumeAndPlayerInput_2
										bra.s   loc_2159E
loc_21618:
										
										cmp.w   #0,d2
										beq.w   loc_21662
										move.w  -4(a6),d0
										jsr     j_GetEquippedRing
										cmp.w   #$FFFF,d1
										beq.w   loc_21662
										cmp.w   -$C(a6),d2
										bne.w   loc_21662
										move.w  -8(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_21662
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #0
										dc.w MUSIC_CURSED_ITEM
										trap    #5
										dc.w $37                ; {LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}
										bsr.w   waitForMusicResumeAndPlayerInput_2
										trap    #5
										dc.w $FFFF
										bra.w   loc_2159E
loc_21662:
										
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $36                ; Pass the {ITEM}{N}to whom?{D1}
										trap    #5
										dc.w $FFFF
										move.b  #2,((byte_FFB13C-$1000000)).w
										move.w  -8(a6),((word_FFB13A-$1000000)).w
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										bne.w   loc_2168E
										bra.w   loc_2159E
loc_2168E:
										
										move.w  d0,-6(a6)
										move.w  d1,-$E(a6)
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmp.w   #4,d2
										beq.w   loc_216F8
										move.w  -4(a6),d0
										move.w  -$C(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -6(a6),d0
										move.w  -8(a6),d1
										and.b   #ITEM_MASK_IDX,d1
										jsr     j_AddItem
										move.w  -4(a6),d0
										move.w  -6(a6),d1
										cmp.w   d0,d1
										bne.s   loc_216E4
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -8(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #5
										dc.w $4A                ; {NAME} changed hands{N}to hold the {ITEM}.{W2}
										bra.s   loc_216F4
loc_216E4:
										
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -6(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #5
										dc.w $41                ; The {ITEM} now{N}belongs to {NAME}.{W2}
loc_216F4:
										
										bra.w   loc_2184E
loc_216F8:
										
										move.w  -6(a6),d0
										move.w  -$E(a6),d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,-$A(a6)
										jsr     j_GetItemType
										cmp.w   #1,d2
										bne.s   loc_21758
										move.w  -6(a6),d0
										jsr     j_GetEquippedWeapon
										cmp.w   #$FFFF,d1
										beq.w   loc_2179E
										cmp.w   -$E(a6),d2
										bne.w   loc_2179E
										move.w  -$A(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_2179E
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #0
										dc.w MUSIC_CURSED_ITEM
										trap    #5
										dc.w $37                ; {LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}
										bsr.w   waitForMusicResumeAndPlayerInput_2
										trap    #5
										dc.w $FFFF
										bra.w   loc_21662
loc_21758:
										
										cmp.w   #0,d2
										beq.w   loc_2179E
										move.w  -6(a6),d0
										jsr     j_GetEquippedRing
										cmp.w   #$FFFF,d1
										beq.w   loc_2179E
										cmp.w   -$E(a6),d2
										bne.w   loc_2179E
										move.w  -$A(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_2179E
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #0
										dc.w MUSIC_CURSED_ITEM
										trap    #5
										dc.w $37                ; {LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}
										bsr.w   waitForMusicResumeAndPlayerInput_2
										bra.w   loc_21662
loc_2179E:
										
										move.w  -4(a6),d0
										move.w  -$C(a6),d1
										jsr     j_UnequipItemIfNotCursed
										move.w  -6(a6),d2
										cmp.w   -4(a6),d2
										bne.w   loc_217C4
										move.w  -$E(a6),d3
										cmp.w   -$C(a6),d3
										beq.w   loc_2181A
loc_217C4:
										
										move.w  -4(a6),d0
										move.w  -$C(a6),d1
										jsr     j_DropItemBySlot
										move.w  -$A(a6),d1
										and.b   #ITEM_MASK_IDX,d1
										jsr     j_AddItem
										move.w  -6(a6),d2
										cmp.w   -4(a6),d2
										bne.w   loc_217FE
										move.w  -$E(a6),d3
										cmp.w   -$C(a6),d3
										bcs.w   loc_217FE
										sub.w   #1,-$E(a6)
loc_217FE:
										
										move.w  -6(a6),d0
										move.w  -$E(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -8(a6),d1
										and.b   #ITEM_MASK_IDX,d1
										jsr     j_AddItem
loc_2181A:
										
										move.w  -4(a6),d0
										move.w  -6(a6),d1
										cmp.w   d0,d1
										bne.s   loc_21838
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -8(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #5
										dc.w $4A                ; {NAME} changed hands{N}to hold the {ITEM}.{W2}
										bra.s   loc_2184E
loc_21838:
										
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -6(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  -$A(a6),((RAM_Dialogue_NameIdx3-$1000000)).w
										trap    #5
										dc.w $42                ; The {ITEM} was{N}exchanged for {NAME}'s{N}{ITEM}.{W2}
loc_2184E:
										
										trap    #5
										dc.w $FFFF
										bra.w   loc_219D8
loc_21856:
										
										cmp.w   #2,d0
										bne.w   loc_21898
										bsr.w   sub_219EC       
										move.b  #3,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										beq.w   loc_21880
										bra.w   loc_21894
loc_21880:
										
										bra.w   loc_21894
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -8(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #5
										dc.w $46                ; {NAME} is already{N}equipped with the{N}{ITEM}.{W2}
loc_21894:
										
										bra.w   loc_219D8
loc_21898:
										
										bsr.w   sub_219EC       
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										bne.w   loc_218BA
										bra.w   loc_219D0
loc_218BA:
										
										move.w  d0,-4(a6)
										move.w  d1,-$C(a6)
										move.w  d2,-8(a6)
										move.w  -8(a6),d1
										jsr     j_GetItemDefAddress
										move.l  8(a0),-$14(a6)
										move.b  -$14(a6),d1
										and.b   #$10,d1
										cmp.b   #0,d1
										beq.s   loc_218F2
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $3E                ; {LEADER}!  You can't{N}discard the {ITEM}!{W2}
										bra.w   loc_219D0
loc_218F2:
										
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $45                ; The {ITEM} will be{N}discarded.  OK?
										jsr     j_YesNoChoiceBox
										trap    #5
										dc.w $FFFF
										cmp.w   #0,d0
										beq.w   loc_21910
										bra.s   loc_21898
loc_21910:
										
										move.w  -8(a6),d1
										jsr     j_GetItemType
										cmp.w   #1,d2
										bne.s   loc_21962
										move.w  -4(a6),d0
										jsr     j_GetEquippedWeapon
										cmp.w   #$FFFF,d1
										beq.w   loc_219A0
										cmp.w   -$C(a6),d2
										bne.w   loc_219A0
										move.w  -8(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_219A0
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #0
										dc.w MUSIC_CURSED_ITEM
										trap    #5
										dc.w $37                ; {LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}
										bsr.w   waitForMusicResumeAndPlayerInput_2
										trap    #5
										dc.w $FFFF
										bra.w   loc_219D0
loc_21962:
										
										cmp.w   #0,d2
										beq.w   loc_219A0
										move.w  -4(a6),d0
										jsr     j_GetEquippedRing
										cmp.w   #$FFFF,d1
										beq.w   loc_219A0
										cmp.w   -$C(a6),d2
										bne.w   loc_219A0
										move.w  -8(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_219A0
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $37                ; {LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}
										bra.w   loc_219D0
loc_219A0:
										
										move.w  -4(a6),d0
										move.w  -$C(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $43                ; The {ITEM} is discarded.{W2}
										move.b  -$14(a6),d1
										and.b   #8,d1
										cmp.b   #0,d1
										beq.s   loc_219D0
										move.w  -8(a6),d1
										jsr     j_AddItemToDeals
loc_219D0:
										
										trap    #5
										dc.w $FFFF
										bra.w   *+4
loc_219D8:
										
										bra.w   loc_21484
loc_219DC:
										
										clr.w   d6
										jsr     sub_2004C
										bra.w   loc_212A0
loc_219E8:
										
										bra.w   loc_21286

	; End of function ExecuteMainMenu


; =============== S U B R O U T I N E =======================================

; copy available targets list ?

sub_219EC:
										
										movem.l d7-a1,-(sp)
										jsr     j_UpdateForce
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((RAM_CharIdxListSize-$1000000)).w,((word_FFB12E-$1000000)).w
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.w  #1,d7
loc_21A0A:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_21A0A
										movem.l (sp)+,d7-a1
										rts

	; End of function sub_219EC

off_21A16:          dc.l j_ShopActions+2
										dc.b   0
										dc.b  $A

; =============== S U B R O U T I N E =======================================

sub_21A1C:
										
										movem.l d7-a0,-(sp)
										lea     off_21A16(pc), a0
										clr.w   d7
										move.w  (a0)+,d7
										subq.w  #1,d7
loc_21A2A:
										
										cmp.w   (a0)+,d1
										beq.w   loc_21A34
										dbf     d7,loc_21A2A
loc_21A34:
										
										movem.l (sp)+,d7-a0
										rts

	; End of function sub_21A1C


; =============== S U B R O U T I N E =======================================

BlacksmithActions:
										
										movem.l d0-a5,-(sp)
										link    a6,#-$18
										moveq   #0,d1
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_21A50
										jsr     j_initPortraitWindow
loc_21A50:
										
										trap    #5
										dc.w $C2
										jsr     j_hidePortraitWindow
										clr.w   -$12(a6)
										clr.w   -$E(a6)
										clr.w   -$10(a6)
										clr.w   -$14(a6)
										bsr.w   sub_21A92
										moveq   #0,d1
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_21A7C
										jsr     j_initPortraitWindow
loc_21A7C:
										
										trap    #5
										dc.w $C6
										trap    #5
										dc.w $FFFF
										jsr     j_hidePortraitWindow
										unlk    a6
										movem.l (sp)+,d0-a5
										rts

	; End of function BlacksmithActions


; =============== S U B R O U T I N E =======================================

sub_21A92:
										
										jsr     j_UpdateForce
										move.w  ((RAM_CharIdxListSize-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.b  #1,d7
loc_21AAC:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_21AAC
										bsr.w   sub_21E48
										cmp.w   #1,-$14(a6)
										bne.w   loc_21AE8
										move.w  #4,d7
										subq.w  #1,d7
										lea     ((byte_FFF7A8-$1000000)).w,a0
loc_21ACA:
										
										move.w  (a0)+,-$A(a6)
										cmp.w   #0,-$A(a6)
										beq.s   loc_21AE4
										move.w  d7,-$16(a6)
										add.w   #1,-$16(a6)
										bsr.w   sub_21B42
loc_21AE4:
										
										dbf     d7,loc_21ACA
loc_21AE8:
										
										cmp.w   #0,-$12(a6)
										beq.w   loc_21B0E
										move.w  -$12(a6),d0
										add.w   -$E(a6),d0
										sub.w   -$10(a6),d0
										cmp.w   #4,d0
										beq.w   return_21B40
										trap    #5
										dc.w $C4
										bra.w   loc_21B3C
loc_21B0E:
										
										cmp.w   #0,-$E(a6)
										beq.w   loc_21B38
										trap    #5
										dc.w $CE
										move.w  -$12(a6),d0
										add.w   -$E(a6),d0
										sub.w   -$10(a6),d0
										cmp.w   #4,d0
										beq.w   return_21B40
										trap    #5
										dc.w $C4
										bra.w   loc_21B3C
loc_21B38:
										
										trap    #5
										dc.w $C3
loc_21B3C:
										
										bsr.w   loc_21CDA
return_21B40:
										
										rts

	; End of function sub_21A92


; =============== S U B R O U T I N E =======================================

sub_21B42:
										
										movem.l d0-a1,-(sp)
										move.w  -$A(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $CF
										trap    #5
										dc.w $A6
										trap    #5
										dc.w $FFFF
loc_21B58:
										
										trap    #5
										dc.w $FFFF
										move.w  -$A(a6),((word_FFB13A-$1000000)).w
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										bne.s   loc_21B7C
										trap    #5
										dc.w $C5
										bra.w   loc_21CD4
loc_21B7C:
										
										move.w  d0,-6(a6)
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										cmp.w   #4,d2
										bcs.s   loc_21BAC
										move.w  -6(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $D0
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.s   loc_21B58
										trap    #5
										dc.w $C5
										bra.w   loc_21CD4
loc_21BAC:
										
										move.w  -$A(a6),d1
										jsr     j_GetItemType
										cmp.w   #0,d2
										beq.s   loc_21BE4
										move.w  -$A(a6),d1
										move.w  -6(a6),d0
										jsr     j_isWeaponOrRingEquippable
										bcs.s   loc_21BE4
										move.w  -6(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $A7
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										bne.w   loc_21B58
loc_21BE4:
										
										move.w  -6(a6),d0
										move.w  -$A(a6),d1
										jsr     j_AddItem
										move.w  #4,d6
										sub.w   -$16(a6),d6
										lea     ((byte_FFF7A8-$1000000)).w,a1
										lsl.w   #1,d6
										add.w   d6,a1
										move.w  (a1),d2
										move.w  #0,(a1)
										add.w   #1,-$10(a6)
										move.w  -$A(a6),d1
										move.w  -6(a6),d0
										jsr     j_isWeaponOrRingEquippable
										bcc.w   loc_21CD0
										trap    #5
										dc.w $AD
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										bne.w   loc_21CD0
										move.w  -$A(a6),d1
										jsr     j_GetItemType
										cmp.w   #1,d2
										bne.s   loc_21C6E
										move.w  -6(a6),d0
										jsr     j_GetEquippedWeapon
										cmp.w   #$FFFF,d1
										beq.s   loc_21C9A
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmp.w   #2,d2
										bne.w   loc_21C9A
										move.w  -6(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $B0
										bra.s   loc_21CD0
loc_21C6E:
										
										move.w  -6(a6),d0
										jsr     j_GetEquippedRing
										cmp.w   #$FFFF,d1
										beq.s   loc_21C9A
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmp.w   #2,d2
										bne.w   loc_21C9A
										move.w  -6(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $B0
										bra.s   loc_21CD0
loc_21C9A:
										
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d2,d1
										subq.w  #1,d1
										jsr     j_EquipItem
										cmp.w   #2,d2
										bne.s   loc_21CC8
										trap    #0
										dc.w MUSIC_CURSED_ITEM
										bsr.w   waitForMusicResumeAndPlayerInput_3
										move.w  -6(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $AF
										bra.w   loc_21CD4
loc_21CC8:
										
										trap    #5
										dc.w $AE
										bra.w   loc_21CD4
loc_21CD0:
										
										trap    #5
										dc.w $D1
loc_21CD4:
										
										movem.l (sp)+,d0-a1
										rts
loc_21CDA:
										
										movem.l d0-d2,-(sp)
loc_21CDE:
										
										trap    #5
										dc.w $C7
										trap    #5
										dc.w $FFFF
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										beq.w   loc_21E30
										move.w  d0,-6(a6)
										move.w  d1,-$C(a6)
										move.w  d2,-$A(a6)
										cmp.w   #$7B,d2 
										beq.w   loc_21D1A
										trap    #5
										dc.w $C8
										bra.s   loc_21CDE
loc_21D1A:
										
										trap    #5
										dc.w $C9
										trap    #5
										dc.w $FFFF
										move.b  #0,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										beq.s   loc_21CDE
										move.w  d0,-8(a6)
										jsr     j_GetClass      
										move.w  d1,-$18(a6)
										cmp.w   #$C,d1
										bcc.w   loc_21D5C
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $D3
										bra.s   loc_21D1A
loc_21D5C:
										
										bsr.w   sub_21E8E
										cmp.w   #0,d0
										beq.w   loc_21D74
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $D4
										bra.s   loc_21D1A
loc_21D74:
										
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.l  #$1388,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $CA
										jsr     sub_10050
										jsr     j_YesNoChoiceBox
										jsr     sub_10058
										cmp.w   #0,d0
										beq.s   loc_21DA6
										trap    #5
										dc.w $C5
										bra.w   loc_21D1A
loc_21DA6:
										
										jsr     j_GetGold
										move.l  d1,-4(a6)
										cmp.l   #$1388,d1
										bcc.w   loc_21DC2
										trap    #5
										dc.w $CB
										bra.w   loc_21E30
loc_21DC2:
										
										move.l  #$1388,d1
										jsr     j_DecreaseGold
										add.w   #1,-$E(a6)
										move.w  -6(a6),d0
										move.w  -$C(a6),d1
										jsr     j_DropItemBySlot
										bsr.w   PickMithrilWeapon
										move.w  #$50,d1 
										jsr     j_ClearFlag
										trap    #5
										dc.w $CC
										trap    #5
										dc.w $CD
										move.w  -$E(a6),d0
										move.w  -$12(a6),d1
										move.w  -$10(a6),d2
										add.w   d1,d0
										sub.w   d2,d0
										cmp.w   #4,d0
										bne.s   loc_21E16
										trap    #5
										dc.w $D2
										bra.w   loc_21E30
loc_21E16:
										
										trap    #5
										dc.w $C4
										jsr     j_YesNoChoiceBox
										cmp.w   #0,d0
										beq.w   loc_21CDE
										trap    #5
										dc.w $C5
										trap    #5
										dc.w $FFFF
loc_21E30:
										
										movem.l (sp)+,d0-d2
										rts

	; End of function sub_21B42


; =============== S U B R O U T I N E =======================================

waitForMusicResumeAndPlayerInput_3:
										
										move.w  d0,-(sp)
										move.w  #$FB,d0 
										jsr     (playMusicAfterCurrentOne).w
										jsr     (WaitForPlayerInput).w
										move.w  (sp)+,d0
										rts

	; End of function waitForMusicResumeAndPlayerInput_3


; =============== S U B R O U T I N E =======================================

sub_21E48:
										
										move.w  #$50,d1 
										jsr     j_CheckFlag
										beq.w   loc_21E5C
										move.w  #1,-$14(a6)
loc_21E5C:
										
										move.w  #4,d7
										subq.w  #1,d7
										lea     ((byte_FFF7A8-$1000000)).w,a0
loc_21E66:
										
										move.w  (a0)+,d1
										cmp.w   #0,d1
										beq.w   loc_21E88
										cmp.w   #1,-$14(a6)
										bne.s   loc_21E82
										add.w   #1,-$12(a6)
										bra.w   loc_21E88
loc_21E82:
										
										add.w   #1,-$E(a6)
loc_21E88:
										
										dbf     d7,loc_21E66
										rts

	; End of function sub_21E48


; =============== S U B R O U T I N E =======================================

sub_21E8E:
										
										movem.l d1-d2/d7-a0,-(sp)
										clr.w   d0
										lea     word_21EB6(pc), a0
										move.w  (a0)+,d7
										subq.w  #1,d7
loc_21E9C:
										
										move.w  (a0)+,d1
										move.w  -$18(a6),d2
										cmp.w   d1,d2
										beq.w   loc_21EB0
										dbf     d7,loc_21E9C
										move.w  #1,d0
loc_21EB0:
										
										movem.l (sp)+,d1-d2/d7-a0
										rts

	; End of function sub_21E8E

word_21EB6:         dc.w $F
										dc.w $C
										dc.w $D
										dc.w $E
										dc.w $F
										dc.w $10
										dc.w $11
										dc.w $12
										dc.w $13
										dc.w $14
										dc.w $15
										dc.w $16
										dc.w $17
										dc.w $19
										dc.w $1B
										dc.w $1F

; =============== S U B R O U T I N E =======================================

PickMithrilWeapon:
										
										movem.l d0-a0,-(sp)
										clr.w   d0
										lea     tbl_MithrilWeaponClassLists(pc), a0
										move.w  #7,d7
loc_21EE4:
										
										move.w  (a0)+,d6
										subq.w  #1,d6
loc_21EE8:
										
										move.w  (a0)+,d1
										move.w  -$18(a6),d2
										cmp.w   d1,d2
										beq.w   loc_21F16
										dbf     d6,loc_21EE8
										add.w   #1,d0
										dbf     d7,loc_21EE4
										clr.w   d0
										move.w  #2,d6
										jsr     (UpdateRandomSeed).w
										cmp.w   #0,d7
										bne.w   loc_21F16
										move.w  #2,d0
loc_21F16:
										
										lsl.w   #3,d0
										lea     tbl_MithrilWeaponLists(pc), a0
										add.w   d0,a0
										move.w  #3,d5
loc_21F22:
										
										clr.w   d0
										clr.w   d1
										move.b  (a0)+,d0
										move.b  (a0)+,d1
										move.w  d0,d6
										jsr     (UpdateRandomSeed).w
										cmp.w   #0,d7
										beq.w   loc_21F3C
										dbf     d5,loc_21F22
loc_21F3C:
										
										lea     ((byte_FFF7A8-$1000000)).w,a0
										move.w  #3,d7
loc_21F44:
										
										cmp.w   #0,(a0)
										bne.w   loc_21F52
										move.w  d1,(a0)
										bra.w   loc_21F5C
loc_21F52:
										
										move.w  #2,d0
										add.w   d0,a0
										dbf     d7,loc_21F44
loc_21F5C:
										
										movem.l (sp)+,d0-a0
										rts

	; End of function PickMithrilWeapon

tbl_MithrilWeaponClassLists:
										incbin "chardata/mithrilweaponclasses.bin"
tbl_MithrilWeaponLists:
										incbin "chardata/mithrilweapons.bin"

; =============== S U B R O U T I N E =======================================

; seems related to caravan

CaravanActions:
										
										movem.l d0-a5,-(sp)
										link    a6,#-$C
										move.w  #2,d1
										bsr.w   sub_228A8       
										moveq   #0,d1
										bra.w   loc_21FEA
loc_21FE8:
										
										moveq   #$FFFFFFFF,d1
loc_21FEA:
										
										moveq   #0,d0
										moveq   #7,d2
										lea     (initStack).w,a0
										jsr     j_ExecuteMenu
										cmp.w   #$FFFF,d0
										beq.w   loc_22014
										add.w   d0,d0
										move.w  rjt_2200C(pc,d0.w),d0
										jsr     rjt_2200C(pc,d0.w)
										bra.s   loc_21FE8
rjt_2200C:
										
										dc.w sub_22028-rjt_2200C
										dc.w sub_22154-rjt_2200C
										dc.w sub_22538-rjt_2200C
										dc.w sub_22102-rjt_2200C
loc_22014:
										
										moveq   #0,d0
										moveq   #0,d1
										move.w  #$A,d1
										bsr.w   sub_228A8       
										unlk    a6
										movem.l (sp)+,d0-a5
										rts

	; End of function CaravanActions


; =============== S U B R O U T I N E =======================================

sub_22028:
										
										moveq   #2,d1
										bsr.w   sub_228D8
										tst.w   ((word_FFB12E-$1000000)).w
										beq.w   loc_220F4
										move.w  #$F,d1
										bsr.w   sub_228A8       
										jsr     sub_10040
										move.w  d0,-2(a6)
										cmp.w   #$FFFF,d0
										beq.w   loc_220E8
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   loc_22070
										move.w  -2(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $13
										jsr     j_YesNoChoiceBox
										tst.w   d0
										bne.w   loc_220FE
loc_22070:
										
										moveq   #1,d1
										bsr.w   sub_228D8
										cmp.w   #$C,((word_FFB12E-$1000000)).w
										bcc.s   loc_22098
										move.w  -2(a6),d0
										jsr     j_JoinBattleParty
										move.w  -2(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$15,d1
										bsr.w   sub_228A8       
										bra.s   loc_220E6
loc_22098:
										
										move.w  #$17,d1
										bsr.w   sub_228A8       
										jsr     sub_10040
										cmp.w   #$FFFF,d0
										beq.s   loc_220DE
										tst.w   d0
										beq.s   loc_220D4
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										jsr     j_LeaveBattleParty
										move.w  -2(a6),d0
										jsr     j_JoinBattleParty
										move.w  -2(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  #$11,d1
										bsr.w   sub_228A8       
										bra.s   loc_220DC
loc_220D4:
										
										move.w  #$14,d1
										bsr.w   sub_228A8       
loc_220DC:
										
										bra.s   loc_220E6
loc_220DE:
										
										trap    #5
										dc.w 4
										trap    #5
										dc.w $FFFF
loc_220E6:
										
										bra.s   loc_220F2
loc_220E8:
										
										trap    #5
										dc.w 4
										trap    #5
										dc.w $FFFF
										rts

	; End of function sub_22028


; START OF FUNCTION CHUNK FOR sub_22028

loc_220F2:
										
										bra.s   loc_220FE
loc_220F4:
										
										move.w  #$12,d1
										bsr.w   sub_228A8       
										rts
loc_220FE:
										
										bra.w   sub_22028

; END OF FUNCTION CHUNK FOR sub_22028


; =============== S U B R O U T I N E =======================================

sub_22102:
										
										moveq   #1,d1
										bsr.w   sub_228D8
										tst.w   ((word_FFB12E-$1000000)).w
										beq.s   return_22150
										move.w  #$10,d1
										bsr.w   sub_228A8       
										jsr     sub_10040
										cmp.w   #$FFFF,d0
										beq.s   loc_22144
										tst.w   d0
										beq.s   loc_2213A
										jsr     j_LeaveBattleParty
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$16,d1
										bsr.w   sub_228A8       
										bra.s   loc_22142
loc_2213A:
										
										move.w  #$14,d1
										bsr.w   sub_228A8       
loc_22142:
										
										bra.s   loc_2214E
loc_22144:
										
										trap    #5
										dc.w 4
										trap    #5
										dc.w $FFFF
										rts

	; End of function sub_22102


; START OF FUNCTION CHUNK FOR sub_22102

loc_2214E:
										
										bra.s   loc_22152
return_22150:
										
										rts
loc_22152:
										
										bra.s   sub_22102

; END OF FUNCTION CHUNK FOR sub_22102


; =============== S U B R O U T I N E =======================================

sub_22154:
										
										moveq   #0,d1
										bra.w   loc_2215C
loc_2215A:
										
										moveq   #$FFFFFFFF,d1
loc_2215C:
										
										moveq   #0,d0
										moveq   #8,d2
										lea     (initStack).w,a0
										jsr     j_ExecuteMenu
										cmp.w   #$FFFF,d0
										beq.w   return_22186
										add.w   d0,d0
										move.w  rjt_2217E(pc,d0.w),d0
										jsr     rjt_2217E(pc,d0.w)
										bra.s   loc_2215A

	; End of function sub_22154

rjt_2217E:          dc.w Caravan_DescribeItem-rjt_2217E
										dc.w sub_222FA-rjt_2217E
										dc.w sub_22384-rjt_2217E
										dc.w sub_22498-rjt_2217E

; START OF FUNCTION CHUNK FOR sub_22154

return_22186:
										
										rts

; END OF FUNCTION CHUNK FOR sub_22154


; =============== S U B R O U T I N E =======================================

Caravan_DescribeItem:
										
										bsr.w   sub_22926       
										tst.w   ((word_FFB12E-$1000000)).w
										beq.w   loc_222EC
										move.w  #$59,d1 
										bsr.w   sub_228A8       
										jsr     sub_1004C
										move.w  d0,d2
										move.w  d1,-6(a6)
										move.w  d2,-4(a6)
										cmp.w   #$FFFF,d0
										beq.w   loc_222E0
										trap    #1
										dc.w $46
										bne.s   loc_221BE
										moveq   #$B,d0
										bra.s   loc_221C0
loc_221BE:
										
										moveq   #$1F,d0
loc_221C0:
										
										moveq   #0,d1
										jsr     j_initPortraitWindow
										move.w  -4(a6),d1
										bsr.w   DisplaySpecialCaravanDescription
										bne.w   loc_222A8
										move.w  -4(a6),d1
										jsr     j_GetItemType
										tst.w   d2
										bne.s   loc_221E8
										trap    #5
										dc.w $5C
										bra.s   loc_221F8
loc_221E8:
										
										cmp.w   #1,d2
										bne.s   loc_221F4
										trap    #5
										dc.w $5A
										bra.s   loc_221F8
loc_221F4:
										
										trap    #5
										dc.w $5B
loc_221F8:
										
										move.w  -4(a6),d1
										jsr     j_GetItemDefAddress
										cmp.b   #SPELLIDX_NOTHING,ITEMDEF_OFFSET_SPELL(a0)
										beq.s   loc_22210
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CARAVANDESC_ITEMHASEFFECT
										bra.s   loc_22214
loc_22210:
										
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CARAVANDESC_ITEMHASNOEFFECT
loc_22214:
										
										move.w  -4(a6),d1
										jsr     j_GetItemType
										tst.w   d2
										beq.w   loc_222A8
										cmp.w   #ITEMIDX_POWER_RING,d1
										beq.w   loc_222A4
										cmp.w   #ITEMIDX_PROTECT_RING,d1
										beq.w   loc_222A4
										cmp.w   #ITEMIDX_QUICK_RING,d1
										beq.w   loc_222A4
										cmp.w   #ITEMIDX_RUNNING_RING,d1
										beq.w   loc_222A4
										move.w  -4(a6),d1
										move.w  d1,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CARAVANDESC_ITEMISFOR
										jsr     j_UpdateForce
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.w  #1,d7
										bcs.w   loc_222A8
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										clr.w   d6
loc_22266:
										
										move.b  (a0)+,d0
										jsr     j_isWeaponOrRingEquippable
										bcc.s   loc_2228E
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
																						; argument (char idx) for trap #5 using a {NAME} command
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CARAVANDESC_ITEMFORNAME
										addq.w  #1,d6
										cmp.w   #1,d6
										bne.s   loc_22284
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CARAVANDESC_NEWLINE
loc_22284:
										
										cmp.w   #4,d6
										bne.s   loc_2228E
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CARAVANDESC_NEWLINE
loc_2228E:
										
										dbf     d7,loc_22266
										tst.w   d6
										bne.s   loc_2229C
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CARAVANDESC_ITEMFORNOBODY
										bra.s   loc_222A0
loc_2229C:
										
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CARAVANDESC_TOEQUIP
loc_222A0:
										
										bra.w   loc_222A8
loc_222A4:
										
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CARAVANDESC_EVERYBODY
loc_222A8:
										
										move.w  -4(a6),d1
										jsr     j_GetItemDefAddress
										btst    #ITEMTYPE_BIT_UNSELLABLE,ITEMDEF_OFFSET_TYPE(a0)
										beq.s   loc_222C0
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CARAVANDESC_UNSELLABLE
										bra.s   loc_222D4
loc_222C0:
										
										clr.l   d1
										move.w  ITEMDEF_OFFSET_PRICE(a0),d1
										mulu.w  #ITEM_SELLPRICE_MULTIPLIER,d1
										lsr.l   #ITEM_SELLPRICE_BITSHIFTRIGHT,d1
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CARAVANDESC_SELLPRICE
loc_222D4:
										
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_END
										jsr     j_hidePortraitWindow
										bra.s   loc_222EA
loc_222E0:
										
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_CHANGEYOURMIND
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_END
										rts

	; End of function Caravan_DescribeItem


; START OF FUNCTION CHUNK FOR Caravan_DescribeItem

loc_222EA:
										
										bra.s   loc_222F6
loc_222EC:
										
										move.w  #$52,d1 
										bsr.w   sub_228A8       
										rts
loc_222F6:
										
										bra.w   Caravan_DescribeItem

; END OF FUNCTION CHUNK FOR Caravan_DescribeItem


; =============== S U B R O U T I N E =======================================

sub_222FA:
										
										bsr.w   sub_22926       
										cmp.w   #$40,((word_FFB12E-$1000000)).w 
										bcc.s   loc_22376
										moveq   #0,d1
										bsr.w   sub_228D8
										move.w  #$53,d1 
										bsr.w   sub_228A8       
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										move.w  d0,-2(a6)
										move.w  d1,-6(a6)
										move.w  d2,-4(a6)
										cmp.w   #$FFFF,d0
										beq.s   loc_2236A
										bsr.w   sub_2294C       
										bcs.w   loc_22380
										move.w  -4(a6),d1
										jsr     j_AddItemToCaravan
										move.w  -6(a6),d1
										jsr     j_DropItemBySlot
										move.w  -2(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -4(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  #$57,d1 
										bsr.w   sub_228A8       
										bra.s   loc_22374
loc_2236A:
										
										trap    #5
										dc.w 4
										trap    #5
										dc.w $FFFF
										rts
loc_22374:
										
										bra.s   loc_22380
loc_22376:
										
										move.w  #$51,d1 
										bsr.w   sub_228A8       
										rts

	; End of function sub_222FA


; START OF FUNCTION CHUNK FOR sub_222FA

loc_22380:
										
										bra.w   sub_222FA

; END OF FUNCTION CHUNK FOR sub_222FA


; =============== S U B R O U T I N E =======================================

sub_22384:
										
										bsr.w   sub_22926       
										tst.w   ((word_FFB12E-$1000000)).w
										beq.w   loc_2248A
										move.w  #$56,d1 
										bsr.w   sub_228A8       
										jsr     sub_1004C
										move.w  d0,d2
										move.w  d1,-6(a6)
										move.w  d2,-4(a6)
										cmp.w   #$FFFF,d2
										beq.w   loc_2247E
										moveq   #0,d1
										bsr.w   sub_228D8
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$54,d1 
										bsr.w   sub_228A8       
										move.b  #2,((byte_FFB13C-$1000000)).w
										move.w  -4(a6),((word_FFB13A-$1000000)).w
										jsr     sub_10044
										move.w  d0,-8(a6)
										move.w  d1,-$C(a6)
										move.w  d2,-$A(a6)
										cmp.w   #$FFFF,d0
										beq.w   loc_2247C
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmp.w   #4,d2
										beq.s   loc_22422
										move.w  -4(a6),d1
										jsr     j_AddItem
										move.w  -6(a6),d1
										jsr     j_RemoveItemFromCaravan
										move.w  -8(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -4(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  #$58,d1 
										bsr.w   sub_228A8       
										bra.s   loc_2247C
loc_22422:
										
										move.w  -8(a6),d1
										move.w  -$C(a6),d1
										bsr.w   sub_2294C       
										bcs.w   loc_22494
										move.w  -8(a6),d0
										move.w  -$C(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -6(a6),d1
										jsr     j_RemoveItemFromCaravan
										move.w  -8(a6),d0
										move.w  -4(a6),d1
										jsr     j_AddItem
										move.w  -$A(a6),d1
										jsr     j_AddItemToCaravan
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -8(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  -$A(a6),((RAM_Dialogue_NameIdx3-$1000000)).w
										move.w  #$29,d1 
										bsr.w   sub_228A8       
loc_2247C:
										
										bra.s   loc_22488
loc_2247E:
										
										trap    #5
										dc.w 4
										trap    #5
										dc.w $FFFF
										rts

	; End of function sub_22384


; START OF FUNCTION CHUNK FOR sub_22384

loc_22488:
										
										bra.s   loc_22494
loc_2248A:
										
										move.w  #$52,d1 
										bsr.w   sub_228A8       
										rts
loc_22494:
										
										bra.w   sub_22384

; END OF FUNCTION CHUNK FOR sub_22384


; =============== S U B R O U T I N E =======================================

sub_22498:
										
										bsr.w   sub_22926       
										tst.w   ((word_FFB12E-$1000000)).w
										beq.w   loc_2252A
										move.w  #$55,d1 
										bsr.w   sub_228A8       
										jsr     sub_1004C
										move.w  d0,d2
										move.w  d1,-6(a6)
										move.w  d2,-4(a6)
										move.w  -4(a6),d1
										jsr     sub_2299E
										bcs.w   loc_22534
										cmp.w   #$FFFF,-4(a6)
										beq.s   loc_2251E
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $2C
										jsr     j_YesNoChoiceBox
										tst.w   d0
										bne.s   loc_22518
										move.w  -6(a6),d1
										jsr     j_RemoveItemFromCaravan
										move.w  -4(a6),d1
										jsr     j_GetItemDefAddress
										btst    #3,8(a0)
										beq.s   loc_22508
										jsr     j_AddItemToDeals
loc_22508:
										
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$2A,d1 
										bsr.w   sub_228A8       
										bra.s   loc_2251C
loc_22518:
										
										trap    #5
										dc.w 4
loc_2251C:
										
										bra.s   loc_22528
loc_2251E:
										
										trap    #5
										dc.w 4
										trap    #5
										dc.w $FFFF
										rts

	; End of function sub_22498


; START OF FUNCTION CHUNK FOR sub_22498

loc_22528:
										
										bra.s   loc_22534
loc_2252A:
										
										move.w  #$52,d1 
										bsr.w   sub_228A8       
										rts
loc_22534:
										
										bra.w   sub_22498

; END OF FUNCTION CHUNK FOR sub_22498


; =============== S U B R O U T I N E =======================================

sub_22538:
										
										moveq   #0,d1
										bra.w   loc_22540
loc_2253E:
										
										moveq   #$FFFFFFFF,d1
loc_22540:
										
										moveq   #0,d0
										moveq   #3,d2
										lea     (initStack).w,a0
										jsr     j_ExecuteMenu
										cmp.w   #$FFFF,d0
										beq.w   return_2256A
										add.w   d0,d0
										move.w  rjt_22562(pc,d0.w),d0
										jsr     rjt_22562(pc,d0.w)
										bra.s   loc_2253E

	; End of function sub_22538

rjt_22562:          dc.w sub_2256C-rjt_22562
										dc.w sub_22610-rjt_22562
										dc.w sub_22776-rjt_22562
										dc.w sub_227B0-rjt_22562

; START OF FUNCTION CHUNK FOR sub_22538

return_2256A:
										
										rts

; END OF FUNCTION CHUNK FOR sub_22538


; =============== S U B R O U T I N E =======================================

sub_2256C:
										
										move.w  #$18,d1
										bsr.w   sub_228A8       
loc_22574:
										
										moveq   #0,d1
										bsr.w   sub_228D8
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										move.w  d0,-2(a6)
										move.w  d1,-6(a6)
										move.w  d2,-4(a6)
										cmp.w   #$FFFF,d0
										beq.s   loc_225FA
										move.w  -4(a6),d1
										jsr     sub_229CA
										tst.w   d2
										bne.s   loc_225EA
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$19,d1
										bsr.w   sub_228A8       
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10040
										cmp.w   #$FFFF,d0
										beq.s   loc_225E4
										move.w  -4(a6),d1
										bsr.w   UseFieldItem    
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										jsr     j_RemoveItemBySlot
										bra.s   loc_225E8
loc_225E4:
										
										trap    #5
										dc.w 4
loc_225E8:
										
										bra.s   loc_225F8
loc_225EA:
										
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$1A,d1
										bsr.w   sub_228A8       
loc_225F8:
										
										bra.s   loc_22604
loc_225FA:
										
										trap    #5
										dc.w 4
										trap    #5
										dc.w $FFFF
										rts

	; End of function sub_2256C


; START OF FUNCTION CHUNK FOR sub_2256C

loc_22604:
										
										move.w  #$1B,d1
										bsr.w   sub_228A8       
										bra.w   loc_22574

; END OF FUNCTION CHUNK FOR sub_2256C


; =============== S U B R O U T I N E =======================================

sub_22610:
										
										move.w  #$1C,d1
										bsr.w   sub_228A8       
loc_22618:
										
										moveq   #0,d1
										bsr.w   sub_228D8
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										move.w  d0,-2(a6)
										move.w  d1,-6(a6)
										move.w  d2,-4(a6)
										cmp.w   #$FFFF,d0
										beq.w   loc_22760
										bsr.w   sub_2294C       
										bcs.w   loc_2276A
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$1D,d1
										bsr.w   sub_228A8       
										move.b  #2,((byte_FFB13C-$1000000)).w
										move.w  -4(a6),((word_FFB13A-$1000000)).w
										jsr     sub_10044
										move.w  d0,-8(a6)
										move.w  d1,-$C(a6)
										move.w  d2,-$A(a6)
										cmp.w   #$FFFF,d0
										beq.w   loc_2275A
										cmp.w   -2(a6),d0
										bne.s   loc_226B6
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -4(a6),d1
										jsr     j_AddItem
										move.w  -2(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -4(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  #$30,d1 
										bsr.w   sub_228A8       
										bra.w   loc_22758
loc_226B6:
										
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										cmp.w   #4,d2
										beq.s   loc_226F6
										move.w  -8(a6),d0
										move.w  -4(a6),d1
										jsr     j_AddItem
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -8(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  #$28,d1 
										bsr.w   sub_228A8       
										bra.s   loc_22758
loc_226F6:
										
										move.w  -8(a6),d1
										move.w  -$C(a6),d1
										bsr.w   sub_2294C       
										bcs.w   loc_2276A
										move.w  -8(a6),d0
										move.w  -$C(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -8(a6),d0
										move.w  -4(a6),d1
										jsr     j_AddItem
										move.w  -2(a6),d0
										move.w  -$A(a6),d1
										jsr     j_AddItem
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  -8(a6),((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  -$A(a6),((RAM_Dialogue_NameIdx3-$1000000)).w
										move.w  #$29,d1 
										bsr.w   sub_228A8       
loc_22758:
										
										bra.s   loc_2275E
loc_2275A:
										
										trap    #5
										dc.w 4
loc_2275E:
										
										bra.s   loc_2276A
loc_22760:
										
										trap    #5
										dc.w 4
										trap    #5
										dc.w $FFFF
										rts

	; End of function sub_22610


; START OF FUNCTION CHUNK FOR sub_22610

loc_2276A:
										
										move.w  #$20,d1 
										bsr.w   sub_228A8       
										bra.w   loc_22618

; END OF FUNCTION CHUNK FOR sub_22610


; =============== S U B R O U T I N E =======================================

sub_22776:
										
										move.w  #$21,d1 
										bsr.w   sub_228A8       
loc_2277E:
										
										moveq   #0,d1
										bsr.w   sub_228D8
										move.b  #3,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										bne.s   loc_227A6
										trap    #5
										dc.w 4
										trap    #5
										dc.w $FFFF
										rts

	; End of function sub_22776


; START OF FUNCTION CHUNK FOR sub_22776

loc_227A6:
										
										move.w  #$23,d1 
										bsr.w   sub_228A8       
										bra.s   loc_2277E

; END OF FUNCTION CHUNK FOR sub_22776


; =============== S U B R O U T I N E =======================================

sub_227B0:
										
										move.w  #$24,d1 
										bsr.w   sub_228A8       
loc_227B8:
										
										moveq   #0,d1
										bsr.w   sub_228D8
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										move.w  d0,-2(a6)
										move.w  d1,-6(a6)
										move.w  d2,-4(a6)
										cmp.w   #$FFFF,-2(a6)
										beq.s   loc_2284E
										bsr.w   sub_2294C       
										bcs.w   loc_22858
										move.w  -4(a6),d1
										jsr     sub_2299E
										bcs.w   loc_22858
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $2C
										jsr     j_YesNoChoiceBox
										tst.w   d0
										bne.s   loc_22844
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										jsr     j_DropItemBySlot
										move.w  -4(a6),d1
										jsr     j_GetItemDefAddress
										btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
										beq.s   loc_22834
										jsr     j_AddItemToDeals
loc_22834:
										
										move.w  -4(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$2A,d1 
										bsr.w   sub_228A8       
										bra.s   loc_2284C
loc_22844:
										
										trap    #5
										dc.w 4
										trap    #5
										dc.w $FFFF
loc_2284C:
										
										bra.s   loc_22858
loc_2284E:
										
										trap    #5
										dc.w 4
										trap    #5
										dc.w $FFFF
										rts

	; End of function sub_227B0


; START OF FUNCTION CHUNK FOR sub_227B0

loc_22858:
										
										move.w  #$26,d1 
										bsr.w   sub_228A8       
										bra.w   loc_227B8

; END OF FUNCTION CHUNK FOR sub_227B0


; =============== S U B R O U T I N E =======================================

; only used for chirrup sandals

DisplaySpecialCaravanDescription:
										
										movem.l d0-d1/a0,-(sp)
										and.w   #ITEM_MASK_IDX,d1
										lea     tbl_SpecialCaravanDescriptions(pc), a0
loc_22870:
										
										cmp.w   #$FFFF,(a0)
										beq.w   loc_2289C
										cmp.b   (a0),d1
										bne.s   loc_22896
										move.b  1(a0),d1
										subq.w  #1,d1
										move.w  2(a0),d0
loc_22886:
										
										jsr     (DisplayText).w 
										addq.w  #1,d0
										dbf     d1,loc_22886
										moveq   #$FFFFFFFF,d0
										bra.w   loc_2289C
loc_22896:
										
										add.w   #4,a0
										bra.s   loc_22870
loc_2289C:
										
										movem.l (sp)+,d0-d1/a0
										rts

	; End of function DisplaySpecialCaravanDescription

tbl_SpecialCaravanDescriptions:
										dc.b $7E 
										dc.b   2
										dc.b   0
										dc.b $67 
										dc.b $FF
										dc.b $FF

; =============== S U B R O U T I N E =======================================

; textbox?

sub_228A8:
										
										movem.l d0-d1,-(sp)
										move.l  d1,-(sp)
										trap    #TRAP_CHECKFLAG
										dc.w FLAGIDX_FOLLOWERS_ASTRAL
																						; check if followed by Astral
										bne.s   loc_228B8       
										moveq   #$B,d0          ; ROHDE portrait idx
										bra.s   loc_228BA
loc_228B8:
										
										moveq   #$1F,d0         ; Astral portrait idx
loc_228BA:
										
										moveq   #0,d1
										jsr     j_initPortraitWindow
										move.l  (sp)+,d0
										jsr     (DisplayText).w 
										trap    #TRAP_TEXTBOX
										dc.w TEXTIDX_END
										jsr     j_hidePortraitWindow
										movem.l (sp)+,d0-d1
										rts

	; End of function sub_228A8


; =============== S U B R O U T I N E =======================================

sub_228D8:
										
										movem.l d7-a1,-(sp)
										jsr     j_UpdateForce
										tst.w   d1
										bne.s   loc_228F0
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										bra.s   loc_22908
loc_228F0:
										
										cmp.w   #1,d1
										bne.s   loc_22900
										lea     ((RAM_Force_CurrentList-$1000000)).w,a0
										move.w  ((NUMBER_OF_BATTLE_PARTY_MEMBERS-$1000000)).w,d7
										bra.s   loc_22908
loc_22900:
										
										lea     ((RAM_Force_ReservesList-$1000000)).w,a0
										move.w  ((NUMBER_OF_OTHER_PARTY_MEMBERS-$1000000)).w,d7
loc_22908:
										
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  d7,((word_FFB12E-$1000000)).w
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.w  #1,d7
										bcs.w   loc_22920
loc_2291A:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_2291A
loc_22920:
										
										movem.l (sp)+,d7-a1
										rts

	; End of function sub_228D8


; =============== S U B R O U T I N E =======================================

; copy item idxes of caravan items to index list

sub_22926:
										
										movem.l d7-a1,-(sp)
										move.w  ((NUM_ITEMS_IN_CARAVAN-$1000000)).w,d7
										move.w  d7,((word_FFB12E-$1000000)).w
										subq.w  #1,d7
										bcs.w   loc_22946
										lea     ((CARAVAN_ITEMS-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
loc_22940:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_22940
loc_22946:
										
										movem.l (sp)+,d7-a1
										rts

	; End of function sub_22926


; =============== S U B R O U T I N E =======================================

; get whether character D0's item at slot D1 is cursed -> carry

sub_2294C:
										
										movem.l d1,-(sp)
										jsr     j_GetItemAndNumberOfItems
										bclr    #7,d1
										beq.s   loc_22988
										jsr     j_isItemCursed
										bcc.w   loc_22986
										trap    #0
										dc.w MUSIC_CURSED_ITEM
										move.w  #$3C,d0 
										jsr     (Sleep).w       
										move.w  d1,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$1E,d1
										bsr.w   sub_228A8       
										bsr.w   playPreviousMusicAfterCurrentOne
										or      #1,ccr
loc_22986:
										
										bra.s   loc_2298A
loc_22988:
										
										tst.b   d0
loc_2298A:
										
										movem.l (sp)+,d1
										rts

	; End of function sub_2294C


; =============== S U B R O U T I N E =======================================

playPreviousMusicAfterCurrentOne:
										
										move.w  d0,-(sp)
										move.w  #$FB,d0 
										jsr     (playMusicAfterCurrentOne).w
										move.w  (sp)+,d0
										rts

	; End of function playPreviousMusicAfterCurrentOne


; =============== S U B R O U T I N E =======================================

sub_2299E:
										
										movem.l d1/a0,-(sp)
										jsr     j_GetItemDefAddress
										btst    #4,8(a0)
										beq.s   loc_229C2
										move.w  d1,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$25,d1 
										bsr.w   sub_228A8       
										or      #1,ccr
										bra.s   loc_229C4
loc_229C2:
										
										tst.b   d0
loc_229C4:
										
										movem.l (sp)+,d1/a0
										rts

	; End of function sub_2299E


; =============== S U B R O U T I N E =======================================

sub_229CA:
										
										moveq   #0,d2
										lea     unk_229E2(pc), a0
										nop
loc_229D2:
										
										cmp.b   (a0)+,d1
										beq.w   return_229E0
										cmp.b   #$FF,(a0)
										bne.s   loc_229D2
										moveq   #$FFFFFFFF,d2
return_229E0:
										
										rts

	; End of function sub_229CA

unk_229E2:          dc.b   3
										dc.b   5
										dc.b   9
										dc.b  $A
										dc.b  $B
										dc.b  $C
										dc.b  $D
										dc.b  $E
										dc.b  $F
										dc.b $FF

; =============== S U B R O U T I N E =======================================

; check specific item index + code offset to run when used in field

UseFieldItem:
										
										movem.l d0-d1/d6-d7,-(sp)
										and.w   #ITEM_MASK_IDX,d1
										movem.l d1/a0,-(sp)
										lea     rjt_FieldItemEffects(pc), a0
loc_229FC:
										
										cmp.w   #CODE_TERMINATOR_WORD,(a0)
										beq.w   loc_22A1A
										cmp.w   (a0)+,d1
										bne.w   loc_22A14
										move.w  (a0)+,d1
										jsr     rjt_FieldItemEffects(pc,d1.w)
										bra.w   loc_22A1A
loc_22A14:
										
										add.w   #2,a0
										bra.s   loc_229FC
loc_22A1A:
										
										movem.l (sp)+,d1/a0
										bra.w   loc_22A48
rjt_FieldItemEffects:
										
										dc.w 3                  ; it works quite unusually, I have to look into it
										dc.w FieldItem_CurePoison-rjt_FieldItemEffects
										dc.w 5
										dc.w FieldItem_CurePoisonAndParalysis-rjt_FieldItemEffects
										dc.w 9
										dc.w FieldItem_IncreaseATK-rjt_FieldItemEffects
										dc.w $A
										dc.w FieldItem_IncreaseDEF-rjt_FieldItemEffects
										dc.w $B
										dc.w FieldItem_IncreaseAGI-rjt_FieldItemEffects
										dc.w $C
										dc.w FieldItem_IncreaseMOV-rjt_FieldItemEffects
										dc.w $D
										dc.w FieldItem_IncreaseHP-rjt_FieldItemEffects
										dc.w $E
										dc.w FieldItem_IncreaseMP-rjt_FieldItemEffects
										dc.w $F
										dc.w FieldItem_LevelUp-rjt_FieldItemEffects
										dc.w $FFFF
loc_22A48:
										
										movem.l (sp)+,d0-d1/d6-d7
										rts

	; End of function UseFieldItem


; =============== S U B R O U T I N E =======================================

FieldItem_CurePoison:
										
										jsr     j_GetStatus
										bclr    #CHAR_STATUS_BIT_POISON,d1
										beq.s   loc_22A64
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $95
										bra.s   loc_22A68
loc_22A64:
										
										trap    #TRAP_TEXTBOX
										dc.w $94
loc_22A68:
										
										jsr     j_SetStatus
										rts

	; End of function FieldItem_CurePoison


; =============== S U B R O U T I N E =======================================

FieldItem_CurePoisonAndParalysis:
										
										jsr     j_GetStatus
										moveq   #0,d2
										bclr    #1,d1
										beq.s   loc_22A88
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $95
										moveq   #$FFFFFFFF,d2
loc_22A88:
										
										bclr    #0,d1
										beq.s   loc_22A98
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $9C
										moveq   #$FFFFFFFF,d2
loc_22A98:
										
										tst.w   d2
										bne.s   loc_22AA0
										trap    #TRAP_TEXTBOX
										dc.w $94
loc_22AA0:
										
										jsr     j_SetStatus
										jsr     j_ApplyStatusAndItemsOnStats
										rts

	; End of function FieldItem_CurePoisonAndParalysis


; =============== S U B R O U T I N E =======================================

; boost attack ?

FieldItem_IncreaseATK:
										
										moveq   #3,d6
										jsr     (UpdateRandomSeed).w
										addq.w  #2,d7
										clr.l   d1
										move.w  d7,d1
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $96
										jsr     j_IncreaseBaseATK
										move.w  d7,d1
										jsr     j_IncreaseCurrentATK
										rts

	; End of function FieldItem_IncreaseATK


; =============== S U B R O U T I N E =======================================

; boost def ?

FieldItem_IncreaseDEF:
										
										moveq   #3,d6
										jsr     (UpdateRandomSeed).w
										addq.w  #2,d7
										clr.l   d1
										move.w  d7,d1
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $97
										jsr     j_IncreaseBaseDEF
										move.w  d7,d1
										jsr     j_IncreaseCurrentDEF
										rts

	; End of function FieldItem_IncreaseDEF


; =============== S U B R O U T I N E =======================================

; boost agi ?

FieldItem_IncreaseAGI:
										
										moveq   #3,d6
										jsr     (UpdateRandomSeed).w
										addq.w  #2,d7
										clr.l   d1
										move.w  d7,d1
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $98
										jsr     j_IncreaseAGI
										move.w  d7,d1
										jsr     j_IncreaseCurrentAGI
										rts

	; End of function FieldItem_IncreaseAGI


; =============== S U B R O U T I N E =======================================

; boost mov ?

FieldItem_IncreaseMOV:
										
										jsr     j_GetBaseMOV
										clr.w   d7
										cmp.b   #9,d1
										beq.w   loc_22B42
										moveq   #1,d7
										cmp.b   #8,d1
										beq.w   loc_22B42
										moveq   #2,d7
loc_22B42:
										
										clr.l   d1
										move.w  d7,d1
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $99
										jsr     j_IncreaseBaseMOV
										move.w  d7,d1
										jsr     j_IncreaseCurrentMOV
										rts

	; End of function FieldItem_IncreaseMOV


; =============== S U B R O U T I N E =======================================

FieldItem_IncreaseHP:
										
										moveq   #3,d6
										jsr     (UpdateRandomSeed).w
										addq.w  #2,d7
										clr.l   d1
										move.w  d7,d1
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $9A
										jsr     j_IncreaseMaxHP
										move.w  d7,d1
										jsr     j_IncreaseCurrentHP
										rts

	; End of function FieldItem_IncreaseHP


; =============== S U B R O U T I N E =======================================

FieldItem_IncreaseMP:
										
										jsr     j_GetMaxMP
										tst.w   d1
										beq.s   loc_22BBC
										moveq   #3,d6
										jsr     (UpdateRandomSeed).w
										addq.w  #2,d7
										clr.l   d1
										move.w  d7,d1
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $9B
										jsr     j_IncreaseMP
										move.w  d7,d1
										jsr     j_IncreaseCurrentMP
										bra.s   return_22BC0
loc_22BBC:
										
										trap    #5
										dc.w $94
return_22BC0:
										
										rts

	; End of function FieldItem_IncreaseMP


; =============== S U B R O U T I N E =======================================

FieldItem_LevelUp:
										
										moveq   #0,d1
										jsr     j_SetCurrentEXP
										jsr     j_LevelUp
										lea     ((byte_FFAF82-$1000000)).w,a5
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										clr.l   d1
										move.b  (a5)+,d1
										cmp.b   #$FF,d1
										bne.s   loc_22BEA
										trap    #5
										dc.w $94
										bra.w   loc_22C5A
loc_22BEA:
										
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $F4
										move.b  (a5)+,d1
										beq.s   loc_22BFE
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $10A
loc_22BFE:
										
										move.b  (a5)+,d1
										beq.s   loc_22C0A
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $10B
loc_22C0A:
										
										move.b  (a5)+,d1
										beq.s   loc_22C16
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $10C
loc_22C16:
										
										move.b  (a5)+,d1
										beq.s   loc_22C22
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $10D
loc_22C22:
										
										move.b  (a5)+,d1
										beq.s   loc_22C2E
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $10E
loc_22C2E:
										
										move.b  (a5)+,d1
										cmp.b   #$FF,d1
										beq.w   loc_22C5A
										move.l  d1,d2
										and.w   #$3F,d2 
										lsr.w   #6,d1
										bne.s   loc_22C4C
										move.w  d2,((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #5
										dc.w $10F
										bra.s   loc_22C5A
loc_22C4C:
										
										addq.w  #1,d1
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										move.w  d2,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $110
loc_22C5A:
										
										trap    #5
										dc.w $DC3
										rts

	; End of function FieldItem_LevelUp


; =============== S U B R O U T I N E =======================================

; get first entity's X, Y and facing

sub_22C60:
										
										move.w  (RAM_Entity_StructOffset_XAndStart).l,d1
										move.w  (ENTITY_DATA_STRUCT_Y).l,d2
										move.b  (ENTITY_DATA_STRUCT_FACING).l,d3
										ext.l   d1
										divu.w  #$180,d1
										ext.l   d2
										divu.w  #$180,d2
										and.w   #3,d3
										rts

	; End of function sub_22C60


; =============== S U B R O U T I N E =======================================

;     Update some map stuff ???

CreateMoveableRangeForUnit:
										
										movem.l d6-a1,-(sp)
										bsr.w   GetBattleMapProperties
loc_22C8C:
										
										movem.l d6/a0-a1,-(sp)
loc_22C90:
										
										tst.b   (a0)+
										bpl.s   loc_22C9A
										or.w    #$C000,(a1)+
										bra.s   loc_22C9E
loc_22C9A:
										
										and.w   #$3FFF,(a1)+
loc_22C9E:
										
										dbf     d6,loc_22C90
										movem.l (sp)+,d6/a0-a1
										lea     $30(a0),a0
										lea     $80(a1),a1
										dbf     d7,loc_22C8C
										movem.l (sp)+,d6-a1
										movem.l d0/a0,-(sp)
										lea     (Palette2bis).l,a0
										moveq   #7,d0
loc_22CC2:
										
										move.l  -$20(a0),(a0)+
										dbf     d0,loc_22CC2
										movem.l (sp)+,d0/a0
										move.b  #2,((FADING_PALETTE_FLAGS-$1000000)).w
										move.b  #5,((FADING_SETTING-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  #1,((FADING_COUNTER-$1000000)).w
										bra.w   loc_22D56
GetBattleMapProperties:
										
										lea     ((byte_FF4A00+$300)).l,a0
																						;     Get battle map dimensions, address of movable bool grid, address of map tiles starting at top-left of battle map.
																						;     Out: A0 = address of movable bool grid
																						;          A1 = address of map tile at top-left battle map X/Y
																						;          D6 = width of battle map
																						;          D7 = height of battle map
										move.w  ((word_FFA830-$1000000)).w,d7
										lsl.w   #6,d7
										add.w   ((word_FFA82E-$1000000)).w,d7
										add.w   d7,d7
										lea     (RAM_Start).l,a1
										add.w   d7,a1
										move.w  ((word_FFA832-$1000000)).w,d6
										sub.w   ((word_FFA82E-$1000000)).w,d6
										ext.l   d6
										divs.w  #$180,d6
										move.w  ((word_FFA834-$1000000)).w,d7
										sub.w   ((word_FFA830-$1000000)).w,d7
										ext.l   d7
										divs.w  #$180,d7
										rts

	; End of function CreateMoveableRangeForUnit


; =============== S U B R O U T I N E =======================================

ClearFadingBlockRange:
										
										movem.l d6-a1,-(sp)
										bsr.s   GetBattleMapProperties
loc_22D26:
										
										movem.l d6/a1,-(sp)
loc_22D2A:
										
										and.w   #$3FFF,(a1)+
										dbf     d6,loc_22D2A
										movem.l (sp)+,d6/a1
										lea     $80(a1),a1
										dbf     d7,loc_22D26
										movem.l (sp)+,d6-a1
										move.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										clr.b   ((FADING_SETTING-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  #1,((FADING_COUNTER-$1000000)).w
loc_22D56:
										
										tst.b   ((byte_FFAF46-$1000000)).w
										beq.s   loc_22D6A
										bset    #0,((byte_FFA82D-$1000000)).w
										move.b  #$FF,((byte_FFA8FF-$1000000)).w
										bra.s   return_22D70
loc_22D6A:
										
										bset    #1,((byte_FFA82D-$1000000)).w
return_22D70:
										
										rts

	; End of function ClearFadingBlockRange


; =============== S U B R O U T I N E =======================================

HideUnitCursor:
										
										movem.l d0/a0,-(sp)
										lea     ((RAM_Entity_UnitCursor-$1000000)).w,a0
										move.w  #$6F00,d0
										move.w  d0,(a0)
										move.w  d0,ENTITYDEF_OFFSET_XDEST(a0)
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										movem.l (sp)+,d0/a0
										rts

	; End of function HideUnitCursor


; =============== S U B R O U T I N E =======================================

ControlUnitCursor:
										
										bsr.w   LoadUnitCursorTileData
										clr.w   d2
										clr.w   d3
										move.b  ((RAM_Battle_CurrentMovingEntityChosenX-$1000000)).w,d2
										move.b  ((RAM_Battle_CurrentMovingEntityChosenY-$1000000)).w,d3
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										moveq   #$30,d0 
										jsr     sub_44024
										lsl.w   #5,d0
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										add.w   d0,a0
										move.w  d2,(a0)
										move.w  d3,2(a0)
										move.w  d2,$C(a0)
										move.w  d3,$E(a0)
										move.b  #$FF,((byte_FFDE9D-$1000000)).w
										move.b  #$30,((RAM_Battle_CurrentMovingEntity-$1000000)).w 
loc_22DD2:
										
										jsr     (WaitForVInt).w 
										move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d0
										and.w   #$70,d0 
										beq.s   loc_22DD2
										move.w  $C(a0),d2
										move.w  $E(a0),d3
										ext.l   d2
										ext.l   d3
										divs.w  #$180,d2
										divs.w  #$180,d3
										move.b  d2,((RAM_Battle_CurrentMovingEntityChosenX-$1000000)).w
										move.b  d3,((RAM_Battle_CurrentMovingEntityChosenY-$1000000)).w
										moveq   #$30,d0 
										jsr     j_SetEntityMovescriptToIdle
										move.w  #$6F00,(a0)
										move.w  #$6F00,$C(a0)
										clr.b   ((byte_FFDE9D-$1000000)).w
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										rts

	; End of function ControlUnitCursor


; =============== S U B R O U T I N E =======================================

; Out: D2 = chosen X
;      D3 = chosen Y
;      D4 = copied P1 input state bitfield

ControlBattleUnit:
										
										movem.l d0-d1/a0-a1,-(sp)
										link    a6,#-2
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a1
										bsr.w   getEntityCombatantNumber
										move.w  d0,-2(a6)
										lsl.w   #ENTITYDEF_SIZE_BITS,d0
										add.w   d0,a1
										move.b  $12(a1),d0
										move.w  d0,-(sp)
										move.b  $11(a1),d0
										lsl.b   #4,d0
										move.b  d0,$11(a1)
										jsr     (WaitForVInt).w 
										move.b  #$21,$12(a1) 
										bsr.w   sub_234C8
										move.w  -2(a6),d0
										jsr     j_setControlledEntityActScript
										add.w   #$10,d0
										lea     ((byte_FFAFA0-$1000000)).w,a0
										move.b  #1,(a0,d0.w)
loc_22E68:
										
										bsr.w   UpdateControlledUnitPos
										jsr     (WaitForVInt).w 
										move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d4
										and.w   #$70,d4 
										beq.s   loc_22E68
										clr.b   (a0,d0.w)
										move.b  $11(a1),d0
										lsr.b   #4,d0
										move.b  d0,$11(a1)
										move.w  (sp)+,d0
										move.b  d0,$12(a1)
										bsr.w   sub_234C8
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										move.w  ENTITYDEF_OFFSET_XDEST(a1),d2
										ext.l   d2
										divs.w  #$180,d2
										move.w  ENTITYDEF_OFFSET_YDEST(a1),d3
										ext.l   d3
										divs.w  #$180,d3
										move.b  d2,((RAM_Battle_CurrentMovingEntityChosenX-$1000000)).w
										move.b  d3,((RAM_Battle_CurrentMovingEntityChosenY-$1000000)).w
										move.w  -2(a6),d0
										jsr     j_SetEntityMovescriptToIdle
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										unlk    a6
										movem.l (sp)+,d0-d1/a0-a1
										rts

	; End of function ControlBattleUnit


; =============== S U B R O U T I N E =======================================

UpdateControlledUnitPos:
										
										movem.w d0-d3,-(sp)
										move.w  (a1),d2
										add.w   #$C0,d2 
										ext.l   d2
										divs.w  #$180,d2
										move.w  2(a1),d3
										add.w   #$C0,d3 
										ext.l   d3
										divs.w  #$180,d3
										move.w  ((MOVING_BATTLE_ENTITY_IDX-$1000000)).w,d0
										jsr     j_GetXPos
										move.w  d1,-(sp)
										jsr     j_GetYPos
										move.w  d1,-(sp)
										move.w  d2,d1
										jsr     j_SetXPos
										move.w  d3,d1
										jsr     j_SetYPos
										jsr     sub_10070
										move.w  (sp)+,d1
										jsr     j_SetYPos
										move.w  (sp)+,d1
										jsr     j_SetXPos
										movem.w (sp)+,d0-d3
										rts

	; End of function UpdateControlledUnitPos


; =============== S U B R O U T I N E =======================================

getEntityCombatantNumber:
										
										bsr.w   getEntityNumberOfCombatant
										rts

	; End of function getEntityCombatantNumber


; =============== S U B R O U T I N E =======================================

;     Convert combatant number to entity number.
;     In: D0 = combatant number
;     Out: D0 = entity number

getEntityNumberOfCombatant:
										
										move.l  a0,-(sp)
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
										tst.b   d0              ; test if d0 represents an enemy index ?
										bpl.s   loc_22F3E
										sub.b   #$60,d0 
loc_22F3E:
										
										and.w   #$FF,d0
										move.b  (a0,d0.w),d0
										movea.l (sp)+,a0
										rts

	; End of function getEntityNumberOfCombatant


; =============== S U B R O U T I N E =======================================

; In: D0 = entity idx
; Out: D0 = entity event idx

GetEntityEventIdx:
										
										movem.l d1/d7-a0,-(sp)
										moveq   #$40,d7 
										move.w  d0,d1
										clr.w   d0
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
loc_22F58:
										
										cmp.b   (a0)+,d1
										beq.w   loc_22F70
										addq.w  #1,d0
										cmp.w   #$20,d0 
										bne.s   loc_22F6A
										move.w  #$80,d0 
loc_22F6A:
										
										dbf     d7,loc_22F58
										clr.w   d0
loc_22F70:
										
										movem.l (sp)+,d1/d7-a0
										rts

	; End of function GetEntityEventIdx

word_22F76:         dc.w $180
										dc.w 0
										dc.w 0
										dc.w $FE80
										dc.w $FE80
										dc.w 0
										dc.w 0
										dc.w $180

; =============== S U B R O U T I N E =======================================

MoveBattleEntityByMoveString:
										
										movem.l d1/a0,-(sp)
										link    a6,#-2
										move.b  -1(a0),d1
										movem.l d1/a0,-(sp)
										move.b  #$FF,-1(a0)
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a1
										bsr.s   getEntityCombatantNumber
										move.w  d0,-2(a6)
										move.b  d0,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										lsl.w   #5,d0
										add.w   d0,a1
										move.b  $12(a1),d0
										move.w  d0,-(sp)
										move.b  $11(a1),d0
										lsl.b   #4,d0
										move.b  d0,$11(a1)
										jsr     (WaitForVInt).w 
										move.b  #$21,$12(a1) 
										bsr.w   sub_234C8
										move.w  -2(a6),d0
										jsr     sub_44030
										move.l  a0,-(sp)
										add.w   #$10,d0
										lea     ((byte_FFAFA0-$1000000)).w,a0
										move.b  #1,(a0,d0.w)
										movea.l (sp)+,a0
loc_22FE8:
										
										move.b  (a0)+,d0
										cmp.b   #$FF,d0
										beq.w   loc_2308E
										and.w   #3,d0
										lsl.w   #2,d0
										move.l  a0,-(sp)
										lea     word_22F76(pc), a0
										move.w  (a0,d0.w),d1
										add.w   d1,$C(a1)
										move.w  2(a0,d0.w),d1
										add.w   d1,$E(a1)
										movea.l (sp)+,a0
										clr.w   d4
										clr.w   d5
										move.b  $1A(a1),d4
										move.b  $1B(a1),d5
										move.w  $C(a1),d0
										cmp.w   (a1),d0
										bne.s   loc_23026
										clr.w   d4
loc_23026:
										
										sub.w   (a1),d0
										bpl.s   loc_2302E
										neg.w   d0
										neg.w   d4
loc_2302E:
										
										move.w  $E(a1),d1
										cmp.w   2(a1),d1
										bne.s   loc_2303A
										clr.w   d5
loc_2303A:
										
										sub.w   2(a1),d1
										bpl.s   loc_23044
										neg.w   d1
										neg.w   d5
loc_23044:
										
										move.w  d0,8(a1)
										move.w  d1,$A(a1)
										and.b   #$F0,$1C(a1)
										move.b  -1(a0),d0
										cmp.b   -2(a0),d0
										beq.s   loc_2306A
										move.w  d4,4(a1)
										move.w  d5,6(a1)
										or.b    #3,$1C(a1)
loc_2306A:
										
										cmp.b   (a0),d0
										beq.s   loc_23074
										or.b    #$C,$1C(a1)
loc_23074:
										
										move.w  ((RAM_MoveSound-$1000000)).w,d0
										trap    #0
										dc.w SOUND_COMMAND_GET_D0_PARAMETER
										bsr.w   UpdateControlledUnitPos
										move.w  -2(a6),d0
										jsr     j_WaitForEntityToStopMoving
										bra.w   loc_22FE8
loc_2308E:
										
										move.b  $11(a1),d0
										lsr.b   #4,d0
										move.b  d0,$11(a1)
										move.w  (sp)+,d0
										move.b  d0,$12(a1)
										bsr.w   sub_234C8
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										move.w  (a1),d2
										ext.l   d2
										divs.w  #$180,d2
										move.w  2(a1),d3
										ext.l   d3
										divs.w  #$180,d3
										move.b  d2,((RAM_Battle_CurrentMovingEntityChosenX-$1000000)).w
										move.b  d3,((RAM_Battle_CurrentMovingEntityChosenY-$1000000)).w
										move.w  -2(a6),d0
										add.w   #$10,d0
										lea     ((byte_FFAFA0-$1000000)).w,a0
										clr.b   (a0,d0.w)
										movem.l (sp)+,d1/a0
										move.b  d1,-1(a0)
										unlk    a6
										movem.l (sp)+,d1/a1
										rts

	; End of function MoveBattleEntityByMoveString


; =============== S U B R O U T I N E =======================================

sub_230E2:
										
										movem.l d1-a0,-(sp)
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										bne.s   loc_230F2
										moveq   #$FFFFFFFF,d0
										bra.w   loc_2321E
loc_230F2:
										
										jsr     (WaitForVInt).w 
										move.w  d0,d6
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										clr.w   d1
										bra.w   loc_23110
loc_23102:
										
										jsr     (WaitForVInt).w 
										jsr     (WaitForCameraToCatchUp).w
										jsr     j_HideFighterMiniStatusWindow
loc_23110:
										
										clr.w   d0
										move.b  (a0,d1.w),d0
										movem.l d1-a0,-(sp)
										move.w  d0,-(sp)
										clr.w   d0
										move.b  (a0,d1.w),d0
										jsr     j_GetXPos
										move.w  d1,d2
										jsr     j_GetYPos
										move.w  d1,d3
										move.w  d6,d0
										jsr     j_GetXPos
										sub.w   d1,d2
										blt.s   loc_23142
										moveq   #0,d4
										bra.s   loc_23146
loc_23142:
										
										moveq   #2,d4
										neg.w   d2
loc_23146:
										
										jsr     j_GetYPos
										sub.w   d1,d3
										blt.s   loc_23154
										moveq   #3,d5
										bra.s   loc_23158
loc_23154:
										
										moveq   #1,d5
										neg.w   d3
loc_23158:
										
										cmp.w   d2,d3
										blt.s   loc_2315E
										move.w  d5,d4
loc_2315E:
										
										bsr.w   getEntityNumberOfCombatant
										move.w  d4,d1
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).w    
										move.w  (sp)+,d0
										bsr.w   sub_2322C
										move.b  #1,((FIGHTER_IS_TARGETTING-$1000000)).w
										jsr     (WaitForCameraToCatchUp).w
										jsr     CreateFighterMiniStatusWindow
										movem.l (sp)+,d1-a0
loc_23186:
										
										jsr     (WaitForVInt).w 
										cmp.w   #1,d7
										beq.s   loc_231E0
										btst    #0,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_231A4
										subq.w  #1,d1
										bge.s   loc_231A0
										move.w  d7,d1
										subq.w  #1,d1
loc_231A0:
										
										bra.w   loc_23102
loc_231A4:
										
										btst    #2,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_231B8
										subq.w  #1,d1
										bge.s   loc_231B4
										move.w  d7,d1
										subq.w  #1,d1
loc_231B4:
										
										bra.w   loc_23102
loc_231B8:
										
										btst    #1,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_231CC
										addq.w  #1,d1
										cmp.w   d7,d1
										blt.s   loc_231C8
										clr.w   d1
loc_231C8:
										
										bra.w   loc_23102
loc_231CC:
										
										btst    #3,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_231E0
										addq.w  #1,d1
										cmp.w   d7,d1
										blt.s   loc_231DC
										clr.w   d1
loc_231DC:
										
										bra.w   loc_23102
loc_231E0:
										
										btst    #4,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_231F6
										jsr     j_HideFighterMiniStatusWindow
										move.w  #$FFFF,d0
										bra.w   loc_2321E
loc_231F6:
										
										btst    #5,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_23208
										clr.w   d0
										move.b  (a0,d1.w),d0
										bra.w   loc_2321E
loc_23208:
										
										btst    #6,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_2321A
										clr.w   d0
										move.b  (a0,d1.w),d0
										bra.w   loc_2321E
loc_2321A:
										
										bra.w   loc_23186
loc_2321E:
										
										trap    #0
										dc.w SFX_VALIDATION
										bsr.w   HideUnitCursor
										movem.l (sp)+,d1-a0
										rts

	; End of function sub_230E2


; =============== S U B R O U T I N E =======================================

sub_2322C:
										
										movem.l d0-a0,-(sp)
										jsr     j_GetXPos
										move.w  d1,d2
										jsr     j_GetYPos
										move.w  d1,d3
										bsr.w   getEntityNumberOfCombatant
										move.b  d0,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										jsr     (WaitForVInt).w 
										bsr.w   sub_23256
										movem.l (sp)+,d0-a0
										rts

	; End of function sub_2322C


; =============== S U B R O U T I N E =======================================

sub_23256:
										
										bsr.w   LoadUnitCursorTileData
										clr.w   d4
										clr.w   d5
										move.b  ((RAM_Battle_CurrentMovingEntityChosenX-$1000000)).w,d4
										move.b  ((RAM_Battle_CurrentMovingEntityChosenY-$1000000)).w,d5
										move.b  d2,((RAM_Battle_CurrentMovingEntityChosenX-$1000000)).w
										move.b  d3,((RAM_Battle_CurrentMovingEntityChosenY-$1000000)).w
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										mulu.w  #$180,d4
										mulu.w  #$180,d5
										moveq   #$30,d0 
										jsr     sub_4402C
										lsl.w   #5,d0
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										add.w   d0,a0
										move.w  d4,(a0)
										move.w  d5,2(a0)
										move.w  d2,$C(a0)
										move.w  d3,$E(a0)
										bsr.w   sub_23414
										bsr.w   WaitForUnitCursor
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										rts

	; End of function sub_23256


; =============== S U B R O U T I N E =======================================

; In: D0 = entity idx
; Out: D2 = entity X
;      D3 = entity Y

SetUnitCursorDestinationToNextCombatant:
										
										jsr     j_GetXPos
										move.w  d1,d2
										jsr     j_GetYPos
										move.w  d1,d3

	; End of function SetUnitCursorDestinationToNextCombatant


; =============== S U B R O U T I N E =======================================

SetUnitCursorDestination:
										
										jsr     (WaitForVInt).w 
										bsr.w   LoadUnitCursorTileData
										clr.w   d4
										clr.w   d5
										move.b  ((RAM_Battle_CurrentMovingEntityChosenX-$1000000)).w,d4
										move.b  ((RAM_Battle_CurrentMovingEntityChosenY-$1000000)).w,d5
										move.b  d2,((RAM_Battle_CurrentMovingEntityChosenX-$1000000)).w
										move.b  d3,((RAM_Battle_CurrentMovingEntityChosenY-$1000000)).w
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										mulu.w  #$180,d4
										mulu.w  #$180,d5
										moveq   #ENTITYIDX_UNITCURSOR,d0
										jsr     j_setUnitCursorActscript
										jsr     (WaitForVInt).w 
										lsl.w   #5,d0
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										add.w   d0,a0
										move.w  d4,(a0)
										move.w  d5,ENTITYDEF_OFFSET_Y(a0)
										move.w  d2,ENTITYDEF_OFFSET_XDEST(a0)
										move.w  d3,ENTITYDEF_OFFSET_YDEST(a0)
										move.b  #$40,ENTITYDEF_OFFSET_XSPEED(a0) 
										move.b  #$40,ENTITYDEF_OFFSET_YSPEED(a0) 
										tst.b   ((SPECIAL_TURBO_CHEAT-$1000000)).w
										beq.s   loc_23328
										move.b  #$60,ENTITYDEF_OFFSET_XSPEED(a0) 
										move.b  #$60,ENTITYDEF_OFFSET_YSPEED(a0) 
loc_23328:
										
										bsr.w   sub_23414
										move.w  8(a0),d0
										move.w  $A(a0),d1
										lsr.w   #7,d0
										lsr.w   #7,d1
										add.w   #$10,d0
										add.w   #$10,d1
										cmp.w   #$50,d0 
										bge.s   loc_2334A
										move.w  #$50,d0 
loc_2334A:
										
										cmp.w   #$70,d0 
										ble.s   loc_23354
										move.w  #$70,d0 
loc_23354:
										
										cmp.w   #$50,d1 
										bge.s   loc_2335E
										move.w  #$50,d1 
loc_2335E:
										
										cmp.w   #$70,d1 
										ble.s   loc_23368
										move.w  #$70,d1 
loc_23368:
										
										tst.b   ((SPECIAL_TURBO_CHEAT-$1000000)).w
										beq.s   loc_23376
										move.w  #$80,d0 
										move.w  #$80,d1 
loc_23376:
										
										tst.b   ((RAM_Map_ForegroundAutoscrollX-$1000000)).w
										bne.s   loc_23388
										move.w  d0,d7
										mulu.w  ((word_FFA83E-$1000000)).w,d7
										lsr.w   #8,d7
										move.w  d7,((word_FFA820-$1000000)).w
loc_23388:
										
										tst.b   ((RAM_Map_ForegroundAutoscrollY-$1000000)).w
										bne.s   loc_2339A
										move.w  d1,d7
										mulu.w  ((word_FFA840-$1000000)).w,d7
										lsr.w   #8,d7
										move.w  d7,((word_FFA822-$1000000)).w
loc_2339A:
										
										tst.b   ((RAM_Map_BackgroundAutoscrollX-$1000000)).w
										bne.s   loc_233AC
										move.w  d0,d7
										mulu.w  ((word_FFA842-$1000000)).w,d7
										lsr.w   #8,d7
										move.w  d7,((word_FFA824-$1000000)).w
loc_233AC:
										
										tst.b   ((RAM_Map_BackgroundAutoscrollY-$1000000)).w
										bne.s   loc_233BE
										move.w  d1,d7
										mulu.w  ((word_FFA844-$1000000)).w,d7
										lsr.w   #8,d7
										move.w  d7,((word_FFA826-$1000000)).w
loc_233BE:
										
										move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
										move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
										move.w  d0,d2
										move.w  d1,d3
										sub.w   #$780,d0
										sub.w   #$780,d1
										add.w   #$780,d2
										add.w   #$600,d3
										cmp.w   ((word_FFA82E-$1000000)).w,d0
										bge.s   loc_233E4
										move.w  ((word_FFA82E-$1000000)).w,d0
loc_233E4:
										
										cmp.w   ((word_FFA832-$1000000)).w,d2
										ble.s   loc_233F2
										move.w  ((word_FFA832-$1000000)).w,d0
										sub.w   #$F00,d0
loc_233F2:
										
										cmp.w   ((word_FFA830-$1000000)).w,d1
										bge.s   loc_233FC
										move.w  ((word_FFA830-$1000000)).w,d1
loc_233FC:
										
										cmp.w   ((word_FFA834-$1000000)).w,d3
										ble.s   loc_2340A
										move.w  ((word_FFA834-$1000000)).w,d1
										sub.w   #$D80,d1
loc_2340A:
										
										move.w  d0,d2
										move.w  d1,d3
										jsr     (setCameraDest).w
										rts

	; End of function SetUnitCursorDestination


; =============== S U B R O U T I N E =======================================

sub_23414:
										
										clr.w   d4
										clr.w   d5
										move.b  $1A(a0),d4
										move.b  $1B(a0),d5
										move.w  $C(a0),d0
										cmp.w   (a0),d0
										bne.s   loc_2342A
										clr.w   d4
loc_2342A:
										
										sub.w   (a0),d0
										bpl.s   loc_23432
										neg.w   d0
										neg.w   d4
loc_23432:
										
										move.w  $E(a0),d1
										cmp.w   2(a0),d1
										bne.s   loc_2343E
										clr.w   d5
loc_2343E:
										
										sub.w   2(a0),d1
										bpl.s   loc_23448
										neg.w   d1
										neg.w   d5
loc_23448:
										
										move.w  d0,8(a0)
										move.w  d1,$A(a0)
										move.w  d4,4(a0)
										move.w  d5,6(a0)
										rts

	; End of function sub_23414


; =============== S U B R O U T I N E =======================================

; is it vertical speed ?

SetEntityBlinkingFlag:
										
										movem.l d0/a0,-(sp)
										bsr.w   getEntityNumberOfCombatant
										lsl.w   #5,d0
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										bset    #7,$1D(a0,d0.w)
										movem.l (sp)+,d0/a0
										rts

	; End of function SetEntityBlinkingFlag


; =============== S U B R O U T I N E =======================================

; is it vertical speed ?

ClearEntityBlinkingFlag:
										
										movem.l d0/a0,-(sp)
										bsr.w   getEntityNumberOfCombatant
										lsl.w   #5,d0
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										bclr    #7,$1D(a0,d0.w)
										movem.l (sp)+,d0/a0
										rts

	; End of function ClearEntityBlinkingFlag


; =============== S U B R O U T I N E =======================================

setCameraDestInTiles:
										
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										movem.w d2-d3,-(sp)
										movem.w (sp)+,d0-d1
										jsr     (setCameraDest).w
										rts

	; End of function setCameraDestInTiles


; =============== S U B R O U T I N E =======================================

LoadUnitCursorTileData:
										
										movem.l d0-a1,-(sp)
										jsr     (WaitForVInt).w 
										lea     UnitCursorTiles(pc), a0
										lea     ($D000).l,a1
										move.w  #$800,d0
										jsr     (DmaTilesViaFF8804bis).w
										jsr     (set_FFDE94_bit3).w
										movem.l (sp)+,d0-a1
										rts

	; End of function LoadUnitCursorTileData


; =============== S U B R O U T I N E =======================================

sub_234C8:
										
										movem.l d0-d2/a0-a1,-(sp)
										move.b  ENTITYDEF_OFFSET_FACING(a1),d6
										ext.w   d6
										move.b  byte_2353E(pc,d6.w),d6
										bne.s   loc_234DA
										addq.w  #2,d6
loc_234DA:
										
										clr.w   d1
										move.b  ENTITYDEF_OFFSET_MAPSPRITE(a1),d1
										cmp.b   #$F0,d1
										bcc.s   loc_23538
										move.b  $12(a1),d1
										cmp.b   #$20,d1 
										beq.s   loc_23538
										move.w  d1,-(sp)
										clr.w   d1
										move.b  ENTITYDEF_OFFSET_MAPSPRITE(a1),d1
										move.w  d1,d0
										add.w   d1,d1
										add.w   d0,d1
										add.w   d6,d1
										subq.w  #1,d1
										lsl.w   #2,d1
										lea     (pt_EntitySprites).l,a0
										movea.l (a0,d1.w),a0
										lea     (FF6802_LOADING_SPACE).l,a1
										jsr     (loadSpriteData).w
										movea.l a1,a0
										move.w  (sp)+,d1
										move.w  d1,d0
										lsl.w   #3,d1
										add.w   d0,d1
										lsl.w   #6,d1
										lea     ($7000).w,a1
										add.w   d1,a1
										move.w  #$120,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgainbis).w
										jsr     (set_FFDE94_bit3).w
loc_23538:
										
										movem.l (sp)+,d0-d2/a0-a1
										rts

	; End of function sub_234C8

byte_2353E:         dc.b 0
										dc.b 1
										dc.b 2
										dc.b 3
										dc.b 0
										dc.b 2
										dc.b 2
										dc.b 0

; =============== S U B R O U T I N E =======================================

WaitForUnitCursor:
										
										move.l  d0,-(sp)
										moveq   #ENTITYIDX_UNITCURSOR,d0
										jsr     j_WaitForEntityToStopMoving
										move.l  (sp)+,d0
										rts

	; End of function WaitForUnitCursor


; =============== S U B R O U T I N E =======================================

sub_23554:
										
										movem.l d0-d2/d7-a1,-(sp)
										lea     dword_2358C(pc), a0
										clr.w   d2
										move.b  ((word_FFAF8E-$1000000)).w,d2
										and.w   #$F,d2
										lsl.w   #6,d2
										add.w   d2,a0
										lea     (byte_FFDCC0).l,a1
										moveq   #7,d7
loc_23572:
										
										move.w  (a0)+,d2
										add.w   d1,d2
										move.w  d2,(a1)+
										move.w  (a0)+,(a1)+
										move.w  (a0)+,(a1)+
										move.w  (a0)+,d2
										add.w   d0,d2
										move.w  d2,(a1)+
										dbf     d7,loc_23572
										movem.l (sp)+,d0-d2/d7-a1
										rts

	; End of function sub_23554

dword_2358C:        dc.l $740F10
										dc.l $4680007C
										dc.l unk_10F0A
										dc.l $46800001
										dc.l unk_10F0B
										dc.l $46800001
										dc.l unk_10F0C
										dc.l $46800001
										dc.l unk_10F0D
										dc.l $46800001
										dc.l unk_10F0E
										dc.l $46800001
										dc.l unk_10F0F
										dc.l $46800001
										dc.l unk_10F10
										dc.l $46800001
										dc.l $560F09
										dc.l $4690007C
										dc.l $740F0A
										dc.l $46A00064
										dc.l $920F0B
										dc.l $5690007C
										dc.l $740F10
										dc.l $4EA00094
										dc.l unk_10F0D
										dc.l $46800001
										dc.l unk_10F0E
										dc.l $46800001
										dc.l unk_10F0F
										dc.l $46800001
										dc.l unk_10F10
										dc.l $46800001
										dc.l $3E0F09
										dc.l $4690007C
										dc.l $740F0A
										dc.l $46A0004C
										dc.l $AA0F0B
										dc.l $5690007C
										dc.l $740F0C
										dc.l $4EA000AC
										dc.l $560F0D
										dc.l $46B0005F
										dc.l $560F0E
										dc.l $4EB00099
										dc.l $920F0F
										dc.l $56B0005F
										dc.l $920F10
										dc.l $5EB00099

; =============== S U B R O U T I N E =======================================

sub_2364C:
										
										move.l  #$10F10,(byte_FFDCC0).l
										rts

	; End of function sub_2364C

UnitCursorTiles:    dc.b $CF
										dc.b $7F 
										dc.b $F0 
										dc.b   0
										dc.b   2
										dc.b $50 
										dc.b $10
										dc.b $7E 
										dc.b   1
										dc.b   9
										dc.b   8
										dc.b   1
										dc.b $24 
										dc.b   0
										dc.b   1
										dc.b   1
										dc.b   0
										dc.b $20
										dc.b   0
										dc.b   0
										dc.b $41 
										dc.b $10
										dc.b   4
										dc.b $17
										dc.b $41 
										dc.b $94 
										dc.b $1B
										dc.b $40 
										dc.b $C0 
										dc.b $19
										dc.b $FF
										dc.b $3F 
										dc.b $E0 
										dc.b $80 
										dc.b $10
										dc.b $40 
										dc.b $68 
										dc.b   0
										dc.b   0
										dc.b   2
										dc.b $13
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b $83 
										dc.b $28 
										dc.b $36 
										dc.b $80 
										dc.b $E0 
										dc.b $10
										dc.b $82 
										dc.b   0
										dc.b $40 
										dc.b $18
										dc.b $80 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b $84 
										dc.b $10
										dc.b   0
										dc.b $20
										dc.b $CA 
										dc.b  $D
										dc.b $A1 
										dc.b $30 
										dc.b $1E
										dc.b $F3 
										dc.b $FF
										dc.b $FF
										dc.b $11
										dc.b $30 
										dc.b   9
										dc.b   0
										dc.b   8
										dc.b $48 
										dc.b   0
										dc.b   0
										dc.b $20
										dc.b   8
										dc.b $32 
										dc.b   0
										dc.b   0
										dc.b   8
										dc.b $22 
										dc.b   0
										dc.b $41 
										dc.b $74 
										dc.b $19
										dc.b $45 
										dc.b $F8 
										dc.b   8
										dc.b $26 
										dc.b   0
										dc.b   9
										dc.b  $C
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   1
										dc.b $21 
										dc.b $80 
										dc.b   1
										dc.b   4
										dc.b $20
										dc.b   0
										dc.b $7F 
										dc.b $FF
										dc.b $FF
										dc.b $FD 
										dc.b $C8 
										dc.b $60 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   8
										dc.b   1
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   2
										dc.b $43 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b $40 
										dc.b $18
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b $48 
										dc.b $60 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   9
										dc.b  $E
										dc.b   0
										dc.b   2
										dc.b $3D 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b $50 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   8
										dc.b $F4 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   1
										dc.b $40 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b $23 
										dc.b $D0 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   5
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   5
										dc.b   8
										dc.b $3D 
										dc.b $20
										dc.b $BC 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   4
										dc.b $40 
										dc.b   0
										dc.b   1
										dc.b $FF
										dc.b $E9 
										dc.b $FE 
										dc.b $2F 
										dc.b $E0 
										dc.b $DA 
										dc.b   0
										dc.b $40 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b $40 
										dc.b   8
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   9
										dc.b $BF 
										dc.b   0
										dc.b   0
										dc.b $50 
										dc.b $23 
										dc.b   0
										dc.b   5
										dc.b $20
										dc.b   4
										dc.b $90 
										dc.b   0
										dc.b $40 
										dc.b $22 
										dc.b $FC 
										dc.b   0
										dc.b   0
										dc.b   8
										dc.b $20
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   2
										dc.b   0
										dc.b $40 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b $50 
										dc.b   8
										dc.b   0
										dc.b   0
										dc.b   3
										dc.b $FC 
										dc.b   1
										dc.b $20
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   8
										dc.b   1
										dc.b   0
										dc.b $40 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   8
										dc.b $FF
										dc.b   8
										dc.b $10
										dc.b $C0 
										dc.b   0
										dc.b $10
										dc.b   1
										dc.b $80 
										dc.b $FF

; =============== S U B R O U T I N E =======================================

waitForMusicResumeAndPlayerInput_4:
										
										move.w  d0,-(sp)
										move.w  #$FB,d0 
										jsr     (playMusicAfterCurrentOne).w
										jsr     (WaitForPlayerInput).w
										move.w  (sp)+,d0
										rts

	; End of function waitForMusicResumeAndPlayerInput_4


; =============== S U B R O U T I N E =======================================

; In: D0 = entity idx
;     D1 = x pos
;     D2 = y pos

SetEntityPosition:
										
										movem.l d0/a0,-(sp)
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										lsl.w   #5,d0
										add.w   d0,a0
										move.w  d1,(a0)
										move.w  d2,2(a0)
										move.w  d1,$C(a0)
										move.w  d2,$E(a0)
										movem.l (sp)+,d0/a0
										rts

	; End of function SetEntityPosition

tbl_PixelOffsets_X: dc.w $180
tbl_PixelOffsets_Y: dc.w 0
										dc.w 0
										dc.w $FE80
										dc.w $FE80
										dc.w 0
										dc.w 0
										dc.w $180

; =============== S U B R O U T I N E =======================================

; Out: D0 = activated entity idx
;      D1 = activated entity's facing
;      D2 = player entity's facing

GetActivatedEntity:
										
										move.b  ((RAM_Battle_CurrentMovingEntity-$1000000)).w,d0
										ext.w   d0
										bpl.s   loc_237A4
										rts
loc_237A4:
										
										movem.l d3-a0,-(sp)
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										lsl.w   #5,d0
										add.w   d0,a0
										move.w  (a0,d0.w),d1    ; get X
										move.w  2(a0,d0.w),d2   ; Y
										move.b  $10(a0,d0.w),d3 ; facing
										move.b  $11(a0,d0.w),d4 ; size ?
										and.w   #3,d3
										move.w  d3,d5
										lsl.w   #2,d5
loc_237C8:
										
										add.w   tbl_PixelOffsets_X(pc,d5.w),d1
										add.w   tbl_PixelOffsets_Y(pc,d5.w),d2
										move.w  d1,d6
										move.w  d2,d7
										ext.l   d6
										ext.l   d7
										divs.w  #$180,d6
										divs.w  #$180,d7
										lsl.w   #6,d7
										add.w   d6,d7
										add.w   d7,d7
										lea     (RAM_Start).l,a1
										move.w  (a1,d7.w),d7
										and.w   #$3C00,d7
										cmp.w   #$2800,d7
										beq.s   loc_237C8       ; continue offsetting position if encounter a "desk/counter" block flag
										clr.w   d0
										moveq   #$2F,d7 
loc_237FE:
										
										cmp.b   ((RAM_Battle_CurrentMovingEntity-$1000000)).w,d0
										beq.w   loc_2382A       ; skip this entity because it's the player!
										bsr.w   CheckIfEntityIsFollower
										bne.w   loc_2382A       ; skip this entity because it's a follower!
										move.w  (a0),d5
										move.w  2(a0),d6
										sub.w   d1,d5
										bge.s   loc_2381A
										neg.w   d5
loc_2381A:
										
										sub.w   d2,d6
										bge.s   loc_23820
										neg.w   d6
loc_23820:
										
										add.w   d6,d5
										cmp.w   #$180,d5
										bcs.w   loc_2383A       ; distance is less than 1 block
loc_2382A:
										
										addq.w  #1,d0
										lea     $20(a0),a0
										dbf     d7,loc_237FE
										moveq   #$FFFFFFFF,d0
										bra.w   loc_23840
loc_2383A:
										
										move.w  d3,d2
										move.b  $10(a0),d1
loc_23840:
										
										movem.l (sp)+,d3-a0
										rts

	; End of function GetActivatedEntity


; =============== S U B R O U T I N E =======================================

; In: D0 = entity idx
; Out: Z = entity is NOT follower

CheckIfEntityIsFollower:
										
										movem.l d0/a0,-(sp)
										lea     ((FOLLOWERS_LIST-$1000000)).w,a0
loc_2384E:
										
										cmp.b   #$FF,(a0)
										beq.w   loc_2385C
										cmp.b   (a0)+,d0
										bne.s   loc_2384E
										moveq   #1,d0
loc_2385C:
										
										movem.l (sp)+,d0/a0
										rts

	; End of function CheckIfEntityIsFollower


; =============== S U B R O U T I N E =======================================

sub_23862:
										
										move.b  ((RAM_Battle_CurrentMovingEntity-$1000000)).w,d0
										ext.w   d0
										bpl.s   loc_2386C
										rts
loc_2386C:
										
										clr.w   ((RAM_Dialogue_NameIdx1-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										lsl.w   #5,d0
										add.w   d0,a0
										move.w  (a0,d0.w),d2
										move.w  ENTITYDEF_OFFSET_Y(a0,d0.w),d1
										move.b  $10(a0,d0.w),d3
										move.w  d2,d0
										and.w   #3,d3
										move.w  d3,d5
										lsl.w   #2,d5
										lea     tbl_PixelOffsets_X(pc), a0
										add.w   (a0,d5.w),d0
										add.w   2(a0,d5.w),d1
										ext.l   d0
										ext.l   d1
										divs.w  #$180,d0
										divs.w  #$180,d1
										move.w  d0,d4
										move.w  d1,d5
										move.w  d1,d3
										lsl.w   #6,d3
										add.w   d0,d3
										add.w   d3,d3
										lea     (RAM_Start).l,a0
										move.w  (a0,d3.w),d3
										and.w   #$3C00,d3
										cmp.w   #$1800,d3
										bne.s   loc_238E8
										jsr     (OpenChest).w
										trap    #5
										dc.w $193
										move.w  d2,d0
										and.w   #$7F,d0 
										cmp.b   #$7F,d0 
										bne.w   loc_239C8
										trap    #5
										dc.w $198
										bra.w   loc_23994
loc_238E8:
										
										cmp.w   #$2C00,d3
										bne.s   loc_2390C
										jsr     (OpenVaseOrBarrel).w
										trap    #5
										dc.w $194
										move.w  d2,d0
										and.w   #$7F,d0 
										cmp.b   #$7F,d0 
										bne.w   loc_239C8
										trap    #5
										dc.w $199
										bra.w   loc_23994
loc_2390C:
										
										cmp.w   #$3000,d3
										bne.s   loc_23930
										jsr     (OpenVaseOrBarrel).w
										trap    #5
										dc.w $195
										move.w  d2,d0
										and.w   #$7F,d0 
										cmp.b   #$7F,d0 
										bne.w   loc_239C8
										trap    #5
										dc.w $19A
										bra.w   loc_23994
loc_23930:
										
										cmp.w   #$3400,d3
										bne.s   loc_23954
										jsr     (OpenVaseOrBarrel).w
										trap    #5
										dc.w $1AB
										move.w  d2,d0
										and.w   #$7F,d0 
										cmp.b   #$7F,d0 
										bne.w   loc_239C8
										trap    #5
										dc.w $19C
										bra.w   loc_23994
loc_23954:
										
										cmp.w   #$1C00,d3
										bne.s   loc_23978
										jsr     (OpenVaseOrBarrel).w
										trap    #5
										dc.w $1A7
										move.w  d2,d0
										and.w   #$7F,d0 
										cmp.b   #$7F,d0 
										bne.w   loc_239C8
										trap    #5
										dc.w $19C
										bra.w   loc_23994
loc_23978:
										
										jsr     sub_440B4
										bne.w   loc_23994
										tst.w   d6
										beq.s   loc_2398C
										clr.w   d0
										bra.w   return_2399A
loc_2398C:
										
										trap    #5
										dc.w $1A7
										trap    #5
										dc.w $19C
loc_23994:
										
										trap    #5
										dc.w $FFFF
										moveq   #$FFFFFFFF,d0
return_2399A:
										
										rts

	; End of function sub_23862


; =============== S U B R O U T I N E =======================================

; get amount of gold (D2 - 0x80) as an offset from the gold table (see constants)

GetChestGoldAmount:
										
										sub.w   #$80,d2 
										and.w   #ITEM_MASK_IDX,d2
										add.w   d2,d2
										move.w  ChestGoldAmounts(pc,d2.w),d1
										ext.l   d1
										rts

	; End of function GetChestGoldAmount

ChestGoldAmounts:   dc.w 10
										dc.w 20
										dc.w 30
										dc.w 40
										dc.w 50
										dc.w 60
										dc.w 70
										dc.w 80
										dc.w 90
										dc.w 100
										dc.w 110
										dc.w 120
										dc.w 130

; START OF FUNCTION CHUNK FOR sub_23862

loc_239C8:
										
										clr.w   d0
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										cmp.w   #$80,d2 
										blt.s   loc_239EE
										bsr.s   GetChestGoldAmount
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										jsr     j_IncreaseGold
										trap    #0

; END OF FUNCTION CHUNK FOR sub_23862

										dc.w MUSIC_ITEM
										trap    #5
										dc.w $19E
										bsr.w   waitForMusicResumeAndPlayerInput_4
										bra.s   loc_23994

; START OF FUNCTION CHUNK FOR sub_23862

loc_239EE:
										
										move.w  d2,((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #5

; END OF FUNCTION CHUNK FOR sub_23862

										dc.w $19D
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmp.w   #4,d2
										bge.s   loc_23A1E
										move.w  ((RAM_Dialogue_NameIdx2-$1000000)).w,d1
										jsr     j_AddItem
										trap    #0
										dc.w MUSIC_ITEM
										trap    #5
										dc.w $19F
										bsr.w   waitForMusicResumeAndPlayerInput_4
										bra.w   loc_23994
loc_23A1E:          jsr     j_UpdateForce
										lea     ((byte_FFB653-$1000000)).w,a0
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.w  #2,d7
										bmi.w   loc_23A66
loc_23A32:          clr.w   d0
										move.b  (a0)+,d0
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmp.w   #4,d2
										bge.s   loc_23A62
										move.w  ((RAM_Dialogue_NameIdx2-$1000000)).w,d1
										jsr     j_AddItem
										move.w  d0,((RAM_Dialogue_NameIdx3-$1000000)).w
										trap    #0
										dc.w MUSIC_ITEM
										trap    #5
										dc.w $1A0
										bsr.w   waitForMusicResumeAndPlayerInput_4
										bra.w   loc_23994
loc_23A62:          dbf     d7,loc_23A32
loc_23A66:          move.w  ((RAM_Dialogue_NameIdx2-$1000000)).w,d3
										clr.w   d0
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										bclr    d0,-(a1)
										move.w  d4,d0
										move.w  d5,d1
										jsr     (CloseChest).w
										jsr     (CloseVaseOrBarrel).w
										bra.w   loc_23994

; =============== S U B R O U T I N E =======================================

; In: D0 = map idx
;     D1 = battle idx

ExecuteBattleLoop:
										
										clr.b   ((PLAYER_TYPE-$1000000)).w
										trap    #TRAP_SETFLAG
										dc.w $18F
										trap    #TRAP_CHECKFLAG
										dc.w $58
										beq.s   loc_23AB2
										move.l  ((SECONDS_COUNTER_FROM_SRAM-$1000000)).w,((SECONDS_COUNTER-$1000000)).w
										trap    #TRAP_CLEARFLAG
										dc.w $58                ; clear "game begun" flag ?
										jsr     j_ClearEnemyMoveInfo
										clr.b   ((RAM_Battle_CurrentMovingEntity-$1000000)).w
										bsr.w   LoadBattle      
										bra.w   loc_23B40       
										bra.w   loc_23B0A       
loc_23AB2:
										
										clr.l   ((SECONDS_COUNTER-$1000000)).w
										movem.w d0-d1,-(sp)
										move.b  d0,((RAM_CurrentMapIdx-$1000000)).w
										move.b  d1,((RAM_CurrentBattleIdx-$1000000)).w
										bsr.w   SetBattleVIntFuncs
										jsr     j_ExecuteBattleCutscene_Intro
										movem.w (sp)+,d0-d1
										move.b  d0,((RAM_CurrentMapIdx-$1000000)).w
										move.b  d1,((RAM_CurrentBattleIdx-$1000000)).w
										moveq   #$5A,d1 
loc_23ADA:
										
										jsr     j_ClearFlag
										addq.w  #1,d1
										cmp.w   #$69,d1 
										ble.s   loc_23ADA
										bsr.w   HealAliveCharsAndImmortals
										jsr     j_InitAllForceBattlePositions
										jsr     j_InitAllEnemyBattlePositions
										jsr     j_ClearEnemyMoveInfo
										clr.w   d0
										bsr.w   LoadBattle      
										jsr     j_ExecuteBattleCutscene_Start
loc_23B0A:
										
										bsr.w   UpdateAllEnemyAI; start of battle loop
										jsr     j_ExecuteBattleCutscene_Region
										tst.b   ((RAM_DebugModeActivated-$1000000)).w
										beq.s   loc_23B1E
										bsr.w   PrintAllActivatedDefCons
loc_23B1E:
										
										jsr     j_GetListOfSpawningEnemies
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										beq.s   loc_23B3C
										subq.w  #1,d7
										lea     ((RAM_CharIdxList-$1000000)).w,a0
loc_23B30:
										
										clr.w   d0
										move.b  (a0)+,d0
										bsr.w   SpawnEnemy
										dbf     d7,loc_23B30
loc_23B3C:
										
										bsr.w   CreateRandomizedTurnOrder
loc_23B40:
										
										clr.w   d0              ; start of individual turn execution
										move.b  ((RAM_Battle_CurrentTurnOffset-$1000000)).w,d0
										lea     ((RAM_Battle_TurnOrder-$1000000)).w,a0
										move.b  (a0,d0.w),d0
										cmp.b   #$FF,d0
										beq.s   loc_23B0A       
										bsr.w   sub_23EB0       
										tst.b   ((RAM_DebugModeActivated-$1000000)).w
										beq.s   loc_23B6A
										cmp.b   #$71,((RAM_Input_Player1_StateA-$1000000)).w
										bne.s   loc_23B6A
										bsr.w   loc_23BB4       
loc_23B6A:
										
										jsr     j_ExecuteBattleCutscene_Defeated
										jsr     HandleKilledCombatants(pc)
										nop
										bsr.w   GetRemainingFighters
										tst.w   d2
										beq.w   loc_23D44
										tst.w   d3
										beq.w   loc_23CBA
										clr.w   d0
										move.b  ((RAM_Battle_CurrentTurnOffset-$1000000)).w,d0
										lea     ((RAM_Battle_TurnOrder-$1000000)).w,a0
										move.b  (a0,d0.w),d0
										bsr.w   HandleAfterTurnEffects
										jsr     HandleKilledCombatants(pc)
										nop
										bsr.w   GetRemainingFighters
										tst.w   d2
										beq.w   loc_23D44
										tst.w   d3
										beq.w   loc_23CBA
										addq.b  #2,((RAM_Battle_CurrentTurnOffset-$1000000)).w
										bra.s   loc_23B40       
loc_23BB4:
										
										moveq   #COM_ENEMIES_COUNTER,d7
																						; kill all enemies
										move.w  #COM_ENEMY_START,d0
										lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
										clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
loc_23BC2:
										
										jsr     j_GetXPos       ; init whole force for battle (restore stats, apply effects/items)
										tst.b   d1
										bmi.w   loc_23BF4
										jsr     j_GetYPos
										tst.b   d1
										bmi.w   loc_23BF4
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.w   loc_23BF4
										move.b  d0,(a0)+
										addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
										moveq   #0,d1
										jsr     j_SetCurrentHP
loc_23BF4:
										
										addq.w  #1,d0
										dbf     d7,loc_23BC2    
										rts

	; End of function ExecuteBattleLoop


; =============== S U B R O U T I N E =======================================

HealAliveCharsAndImmortals:
										
										movem.l d0-d7,-(sp)
										clr.w   d0
										moveq   #CHAR_MAX_IDX,d7
loc_23C04:
										
										cmp.b   #CHAR_IDX_PETER,d0
										beq.w   loc_23C1E
										cmp.b   #CHAR_IDX_LEMON,d0
										beq.w   loc_23C1E
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.s   loc_23C4C
loc_23C1E:
										
										jsr     j_GetMaxHP
										jsr     j_SetCurrentHP
										jsr     j_GetMaxMP
										jsr     j_SetCurrentMP
										jsr     j_GetStatus
										and.w   #STATUSEFFECT_LASTING_EFFECTS_MASK,d1
										jsr     j_SetStatus
										jsr     j_ApplyStatusAndItemsOnStats
loc_23C4C:
										
										addq.w  #1,d0
										dbf     d7,loc_23C04
										movem.l (sp)+,d0-d7
										rts

	; End of function HealAliveCharsAndImmortals


; =============== S U B R O U T I N E =======================================

; number of force members living, number of enemies living -> D2, D3

GetRemainingFighters:
										
										clr.w   d2
										clr.w   d3
										clr.w   d0
										move.w  #COM_ALLIES_COUNTER,d7
loc_23C62:
										
										jsr     j_GetXPos
										tst.b   d1
										bmi.w   loc_23C7C
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.w   loc_23C7C
										addq.w  #1,d2
loc_23C7C:
										
										addq.w  #1,d0
										dbf     d7,loc_23C62
										move.w  #COM_ENEMY_START,d0
										move.w  #COM_ENEMIES_COUNTER,d7
loc_23C8A:
										
										jsr     j_GetXPos
										tst.b   d1
										bmi.w   loc_23CA4
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.w   loc_23CA4
										addq.w  #1,d3
loc_23CA4:
										
										addq.w  #1,d0
										dbf     d7,loc_23C8A
										clr.w   d0
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   return_23CB8
										clr.w   d2
return_23CB8:
										
										rts

	; End of function GetRemainingFighters


; START OF FUNCTION CHUNK FOR ExecuteBattleLoop

loc_23CBA:
										
										bsr.w   HealAliveCharsAndImmortals
										cmp.b   #BATTLEIDX_FAIRY_WOODS,((RAM_CurrentBattleIdx-$1000000)).w
										bne.s   loc_23CCC
										jsr     sub_100A0
loc_23CCC:
										
										move.b  ((RAM_CurrentMapIdx-$1000000)).w,((byte_FFA84D-$1000000)).w
										jsr     (UpdateForceAndGetFirstForceMemberIndex).w
										jsr     j_GetXPos
										add.b   ((byte_FFF706-$1000000)).w,d1
										move.b  d1,((byte_FFA84E-$1000000)).w
										jsr     j_GetYPos
										add.b   ((byte_FFF707-$1000000)).w,d1
										move.b  d1,((byte_FFA84F-$1000000)).w
										bsr.w   getEntityNumberOfCombatant
										lsl.w   #5,d0
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										move.b  $10(a0,d0.w),((byte_FFA850-$1000000)).w
										move.b  #0,((byte_FFA84C-$1000000)).w
										jsr     sub_4404C
										clr.w   d1
										move.b  ((RAM_CurrentBattleIdx-$1000000)).w,d1
										add.w   #$190,d1
										jsr     j_ClearFlag
										add.w   #$64,d1 
										jsr     j_SetFlag
										clr.w   d0
										clr.w   d1
										clr.w   d2
										clr.w   d3
										move.b  ((byte_FFA84D-$1000000)).w,d0
										move.b  ((byte_FFA84E-$1000000)).w,d1
										move.b  ((byte_FFA84F-$1000000)).w,d2
										move.b  ((byte_FFA850-$1000000)).w,d3
										moveq   #1,d4
										rts
loc_23D44:
										
										bsr.w   sub_23E1A
										clr.w   ((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #0

; END OF FUNCTION CHUNK FOR ExecuteBattleLoop

										dc.w MUSIC_SAD_THEME_2  ; sad theme 2
										trap    #TRAP_TEXTBOX
										dc.w $16B               ; {LEADER} is exhausted.{W1}
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										clr.w   d0
										jsr     j_GetMaxHP
										jsr     j_SetCurrentHP
										jsr     j_GetGold
										lsr.l   #1,d1
										jsr     j_SetGold
										jsr     GetEgressPositionForBattle(pc)
										nop
										moveq   #$FFFFFFFF,d4
										cmp.b   #4,((RAM_CurrentBattleIdx-$1000000)).w
										bne.s   return_23D96
										trap    #TRAP_CLEARFLAG
										dc.w $194
										trap    #TRAP_SETFLAG
										dc.w $1F8
										jsr     sub_1AC04C
										moveq   #$11,d0
										clr.w   d4
return_23D96:       rts

; =============== S U B R O U T I N E =======================================

sub_23D98:
										
										move.w  -2(a6),d0
										move.w  ((word_FFB634-$1000000)).w,d1
										jsr     j_RemoveItemBySlot
										bsr.w   sub_23E38
										move.w  -2(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  ((word_FFB630-$1000000)).w,((RAM_Dialogue_NameIdx2-$1000000)).w
										and.w   #ITEM_MASK_IDX,((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $113               ; {NAME} used{N}{ITEM}!
										bra.w   loc_23DFA
loc_23DC4:
										
										move.w  -2(a6),d0
										move.w  ((word_FFB630-$1000000)).w,d1
										jsr     j_getSpellCost
										jsr     j_DecreaseCurrentMP
										bsr.w   sub_23E38
										move.w  -2(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  ((word_FFB630-$1000000)).w,((RAM_Dialogue_NameIdx2-$1000000)).w
										and.w   #SPELL_MASK_IDX,((RAM_Dialogue_NameIdx2-$1000000)).w
										move.l  #1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $112               ; {NAME} cast{N}{SPELL} level {#}!
loc_23DFA:
										
										trap    #0
										dc.w SFX_SPELL_CAST
										jsr     j_executeFlashScreenScript
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										bsr.w   sub_23E1A
										unlk    a6
										movem.l (sp)+,d0
										bsr.w   GetEgressPositionForBattle
										clr.w   d4
										rts

	; End of function sub_23D98


; =============== S U B R O U T I N E =======================================

sub_23E1A:
										
										clr.w   d1
										move.b  ((RAM_CurrentBattleIdx-$1000000)).w,d1
										add.w   #$1F4,d1
										jsr     j_CheckFlag
										beq.s   return_23E36
										sub.w   #$64,d1 
										jsr     j_ClearFlag
return_23E36:
										
										rts

	; End of function sub_23E1A


; =============== S U B R O U T I N E =======================================

sub_23E38:
										
										jsr     j_HideLandEffectWindow
										jsr     j_HideFighterMiniStatusWindow
										clr.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
										jsr     j_HideFighterMiniStatusWindow
										rts

	; End of function sub_23E38


; =============== S U B R O U T I N E =======================================

GetEgressPositionForBattle:
										
										clr.b   d7
										move.b  ((RAM_CurrentBattleIdx-$1000000)).w,d7
										cmp.b   #$26,d7 
										bne.s   loc_23E60
										trap    #TRAP_CLEARFLAG
										dc.w $1B6
loc_23E60:
										
										cmp.b   #$27,d7 
										bne.s   loc_23E6A
										trap    #TRAP_CLEARFLAG
										dc.w $1B7
loc_23E6A:
										
										cmp.b   #$10,d7
										bne.s   loc_23E76
										moveq   #$D,d0
										bra.w   loc_23EAA
loc_23E76:
										
										cmp.b   #$11,d7
										bne.s   loc_23E82
										moveq   #9,d0
										bra.w   loc_23EAA
loc_23E82:
										
										cmp.b   #$D,d7
										bne.s   loc_23E8E
										moveq   #$A,d0
										bra.w   loc_23EAA
loc_23E8E:
										
										cmp.b   #$1F,d7
										bne.s   loc_23E9A
										moveq   #$24,d0 
										bra.w   loc_23EAA
loc_23E9A:
										
										cmp.b   #$20,d7 
										bne.s   loc_23EA6
										moveq   #2,d0
										bra.w   loc_23EAA
loc_23EA6:
										
										move.b  ((RAM_EgressMapIdx-$1000000)).w,d0
loc_23EAA:
										
										jsr     (GetEgressPositionForMap).w
										rts

	; End of function GetEgressPositionForBattle


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant idx

sub_23EB0:
										
										jsr     (sub_4ED8).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										link    a6,#-$10
										and.w   #$FF,d0
										move.w  d0,-2(a6)
loc_23EC4:
										
										bsr.w   ClearDeadCombatantsListLength
										cmp.b   #BATTLEIDX_TAROS,((RAM_CurrentBattleIdx-$1000000)).w
										bne.s   loc_23EDA
										tst.w   -2(a6)
										bne.s   loc_23EDA
										trap    #TRAP_CLEARFLAG
										dc.w $70
loc_23EDA:
										
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.w   loc_2423E
										move.w  -2(a6),d0
										jsr     j_GetXPos
										move.w  d1,((word_FFB08E-$1000000)).w
										move.w  d1,((word_FFB094-$1000000)).w
										jsr     j_GetYPos
										move.w  d1,((word_FFB090-$1000000)).w
										move.w  d1,((word_FFB092-$1000000)).w
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   getEntityNumberOfCombatant
										move.b  d0,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   SetUnitCursorDestinationToNextCombatant
										move.w  -2(a6),d0
										jsr     j_GetStatus
										and.w   #COM_STATUS_MASK_MUDDLE,d1
										bne.w   loc_23F58       
										jsr     j_GetCharacterWord34
										and.w   #4,d1
										bne.w   loc_23F58       
										tst.b   d0
										bpl.s   loc_23F4C       ; check if current combatant is char or monster
										tst.b   ((CONTROL_OPPONENT_CHEAT-$1000000)).w
										beq.w   loc_23F58       
										bra.s   loc_23F54
loc_23F4C:
										
										tst.b   ((AUTO_BATTLE_CHEAT-$1000000)).w
										bne.w   loc_23F58       
loc_23F54:
										
										bra.w   loc_23F5E       
loc_23F58:
										
										jsr     sub_82A0        ; AI controlled unit (enemy, auto-control cheat, MUDDLEd force member)
loc_23F5E:
										
										bsr.w   WaitForUnitCursor
																						; player controlled unit (normal force member, enemy with control opponent cheat)
										jsr     (WaitForCameraToCatchUp).w
										clr.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
										move.w  -2(a6),d0
										move.w  d0,((MOVING_BATTLE_ENTITY_IDX-$1000000)).w
										jsr     CreateFighterMiniStatusWindow
										jsr     CreateLandEffectWindow
										move.w  -2(a6),d0
										jsr     j_GenerateTargetRangeLists
										bsr.w   CreateMoveableRangeForUnit
										bsr.w   HideUnitCursor
										move.w  -2(a6),d0
										jsr     j_GetStatus
										and.w   #COM_STATUS_MASK_SLEEP,d1
										bne.w   loc_2420E
										jsr     j_GetStatus
										and.w   #CHAR_STATUS_MASK_STUN,d1
										bne.w   loc_2420E
										move.w  -2(a6),d0
										jsr     j_GetStatus
										and.w   #COM_STATUS_MASK_MUDDLE,d1
										bne.w   loc_24036
										jsr     j_GetCharacterWord34
										and.w   #4,d1
										bne.w   loc_24036
										tst.b   d0
										bpl.s   loc_23FDE
										tst.b   ((CONTROL_OPPONENT_CHEAT-$1000000)).w
										beq.w   loc_24036
										bra.s   loc_23FE6
loc_23FDE:
										
										tst.b   ((AUTO_BATTLE_CHEAT-$1000000)).w
										bne.w   loc_24036
loc_23FE6:
										
										bsr.w   sub_24662
										cmp.w   #$FFFF,d0
										bne.w   loc_2403A
										jsr     (WaitForCameraToCatchUp).w
										move.w  -2(a6),d0
										clr.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
										jsr     j_HideLandEffectWindow
										jsr     j_HideFighterMiniStatusWindow
										move.w  -2(a6),d0
										bsr.w   SetEntityBlinkingFlag
										move.w  -2(a6),d0
										bsr.w   getEntityNumberOfCombatant
										moveq   #3,d1
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).l    
										bsr.w   sub_2519E
										move.w  -2(a6),d0
										bsr.w   ClearEntityBlinkingFlag
										bra.w   loc_23EC4
loc_24036:
										
										bsr.w   sub_252FA
loc_2403A:
										
										cmp.w   #ACTION_SPELL,((RAM_BattleScene_ActionType-$1000000)).w
										bne.s   loc_24052
										move.w  ((word_FFB630-$1000000)).w,d0
										and.w   #SPELL_MASK_IDX,d0
										cmp.w   #SPELLIDX_EGRESS,d0
										beq.w   loc_23DC4
loc_24052:
										
										cmp.w   #ACTION_ITEM,((RAM_BattleScene_ActionType-$1000000)).w
										bne.s   loc_2406A
										move.w  ((word_FFB630-$1000000)).w,d0
										and.w   #ITEM_MASK_IDX,d0
										cmp.w   #ITEMIDX_ANGEL_WING,d0
										beq.w   sub_23D98
loc_2406A:
										
										cmp.w   #3,((RAM_BattleScene_ActionType-$1000000)).w
										beq.w   loc_2420E
										cmp.w   #$80,((RAM_BattleScene_ActionType-$1000000)).w 
										bne.w   loc_24090
										clr.w   ((RAM_BattleScene_ActionType-$1000000)).w
										move.w  ((word_FFB630-$1000000)).w,d0
										move.w  -2(a6),((word_FFB630-$1000000)).w
										move.w  d0,-2(a6)
loc_24090:
										
										move.w  -2(a6),d0
										jsr     j_GetClass      
										cmp.w   #$1C,d1
										bne.s   loc_240E6
										tst.w   ((RAM_BattleScene_ActionType-$1000000)).w
										bne.s   loc_240E6
										moveq   #4,d6
										jsr     (UpdateRandomSeed).w
										tst.w   d7
										bne.s   loc_240E6
										move.w  ((word_FFB630-$1000000)).w,((word_FFB632-$1000000)).w
										move.w  #1,((RAM_BattleScene_ActionType-$1000000)).w
										jsr     j_GetCurrentLevel
										clr.w   d0
										cmp.w   #$20,d1 
										blt.s   loc_240CC
										addq.w  #1,d0
loc_240CC:
										
										cmp.w   #$28,d1 
										blt.s   loc_240D4
										addq.w  #1,d0
loc_240D4:
										
										cmp.w   #$32,d1 
										blt.s   loc_240DC
										addq.w  #1,d0
loc_240DC:
										
										lsl.w   #6,d0
										or.w    #$29,d0 
										move.w  d0,((word_FFB630-$1000000)).w
loc_240E6:
										
										cmp.b   #$2C,((RAM_CurrentBattleIdx-$1000000)).w 
										bne.s   loc_240F4
										jsr     sub_100A0
loc_240F4:
										
										jsr     (WaitForVInt).w 
										jsr     (WaitForVInt).w 
										move.w  -2(a6),d0
										jsr     j_WriteSkirmishScript
										move.w  -2(a6),d0
										tst.b   d0
										blt.s   loc_2412C       
										jsr     j_GetClass      
										cmp.w   #$C,d1
										bge.s   loc_24122
										move.b  #MUSIC_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
										bra.s   loc_24128
loc_24122:
										
										move.b  #MUSIC_PROMOTED_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_24128:
										
										bra.w   loc_241A4
loc_2412C:
										
										move.b  #5,((SKIRMISH_MUSIC_INDEX-$1000000)).w
																						; enemy
										jsr     j_GetEnemyID
										cmp.b   #$57,d1 
										bne.s   loc_24144
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
																						; boss
loc_24144:
										
										cmp.b   #$58,d1 
										bne.s   loc_24150
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_24150:
										
										cmp.b   #$5B,d1 
										bne.s   loc_2415C
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_2415C:
										
										cmp.b   #$5C,d1 
										bne.s   loc_24168
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_24168:
										
										cmp.b   #$5E,d1 
										bne.s   loc_24174
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_24174:
										
										cmp.b   #$5F,d1 
										bne.s   loc_24180
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_24180:
										
										cmp.b   #$60,d1 
										bne.s   loc_2418C
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_2418C:
										
										cmp.b   #$61,d1 
										bne.s   loc_24198
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_24198:
										
										cmp.b   #$62,d1 
										bne.s   loc_241A4
										move.b  #MUSIC_ZEON_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
																						; zeon
loc_241A4:
										
										clr.w   d0
										move.b  ((SKIRMISH_FIRST_ENEMY-$1000000)).w,d0
										cmp.b   #$FF,d0
										bne.s   loc_241B4
										move.w  #$FFFF,d0
loc_241B4:
										
										clr.w   d1
										move.b  ((SKIRMISH_FIRST_ALLY-$1000000)).w,d1
										cmp.b   #$FF,d1
										bne.s   loc_241C4
										move.w  #$FFFF,d1
loc_241C4:
										
										movem.l a6,-(sp)
										jsr     j_bigBattleSceneFunction
										move.b  #$FF,((WINDOW_HIDING_FORBIDDEN-$1000000)).w
										jsr     j_executeBattlesceneScript
										jsr     sub_1800C
										jsr     sub_44050
										movem.l (sp)+,a6
										movem.l a6,-(sp)
										clr.w   d0
										move.w  -4(a6),d0
										jsr     LoadBattle(pc)  
										nop
										jsr     (WaitForVInt).w 
										clr.b   ((WINDOW_HIDING_FORBIDDEN-$1000000)).w
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										movem.l (sp)+,a6
										bra.s   loc_2423E
loc_2420E:
										
										jsr     (WaitForCameraToCatchUp).w
										jsr     (WaitForVInt).w 
										clr.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   getEntityNumberOfCombatant
										moveq   #3,d1
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).l    
										move.w  -2(a6),d0
										jsr     j_HideLandEffectWindow
										jsr     j_HideFighterMiniStatusWindow
loc_2423E:
										
										unlk    a6
										rts

	; End of function sub_23EB0


; =============== S U B R O U T I N E =======================================

; handle after-turn effects (status effects, HP/MP regen/degen, etc)

HandleAfterTurnEffects:
										
										bsr.w   ClearDeadCombatantsListLength
										link    a6,#-$10
										move.w  d0,-2(a6)
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.w   loc_24486       ; skip all this if character died
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										jsr     j_GetStatus
										move.w  d1,d2
										and.w   #1,d1
										beq.s   loc_24294
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										and.w   #$FFFE,d2
										move.w  #2,d6
										jsr     (UpdateRandomSeed).w
										tst.w   d7
										bne.s   loc_24288
										trap    #5
										dc.w $166
										clr.w   d1
										bra.s   loc_2428C
loc_24288:
										
										trap    #5
										dc.w $135
loc_2428C:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_24294:
										
										jsr     j_GetStatus
										move.w  d1,d2
										and.w   #$C0,d1 
										beq.s   loc_242CE
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										and.w   #$FF3F,d2
										move.w  d1,d6
										jsr     (UpdateRandomSeed).w
										and.w   #$C0,d7 
										bne.s   loc_242BE
										trap    #5
										dc.w $162
										clr.w   d1
										bra.s   loc_242C6
loc_242BE:
										
										trap    #5
										dc.w $132
										sub.w   #$40,d1 
loc_242C6:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_242CE:
										
										jsr     j_GetStatus
										move.w  d1,d2
										and.w   #$30,d1 
										beq.s   loc_24308
										and.w   #$FFCF,d2
										move.w  d1,d6
										jsr     (UpdateRandomSeed).w
										and.w   #$30,d7 
										bne.s   loc_242FC
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $163
										clr.w   d1
										and.w   #$FFF7,d2
										bra.s   loc_24300
loc_242FC:
										
										sub.w   #$10,d1
loc_24300:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_24308:
										
										jsr     j_GetStatus
										move.w  d1,d2
										and.w   #$300,d1
										beq.s   loc_24344
										and.w   #$FCFF,d2
										move.w  d1,d6
										jsr     (UpdateRandomSeed).w
										and.w   #$300,d7
										bne.s   loc_24338
										move.w  #6,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  d0,((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #5
										dc.w $15F
										clr.w   d1
										bra.s   loc_2433C
loc_24338:
										
										sub.w   #$100,d1
loc_2433C:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_24344:
										
										jsr     j_GetStatus
										move.w  d1,d2
										and.w   #$C00,d1
										beq.s   loc_2436E
										and.w   #$F3FF,d2
										sub.w   #$400,d1
										bne.s   loc_24366
										move.w  #4,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $15D
loc_24366:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_2436E:
										
										jsr     j_GetStatus
										move.w  d1,d2
										and.w   #$C000,d1
										beq.s   loc_24398
										and.w   #$3FFF,d2
										sub.w   #$4000,d1
										bne.s   loc_24390
										move.w  #5,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $15E
loc_24390:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_24398:
										
										jsr     j_GetStatus
										move.w  d1,d2
										and.w   #$3000,d1
										beq.s   loc_243C2
										and.w   #$CFFF,d2
										sub.w   #$1000,d1
										bne.s   loc_243BA
										move.w  #3,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $15C
loc_243BA:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_243C2:
										
										jsr     j_GetEquippedWeapon
										cmp.w   #$61,d1 
										bne.s   loc_243F0
										jsr     j_GetCurrentHP
										move.w  d1,d2
										moveq   #2,d1
										jsr     j_IncreaseCurrentHP
										sub.w   d2,d1
										ble.s   loc_243F0
										ext.l   d1
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $164
loc_243F0:
										
										jsr     j_GetEquippedWeapon
										cmp.w   #$64,d1 
										bne.s   loc_2441E
										jsr     j_GetCurrentMP
										move.w  d1,d2
										moveq   #2,d1
										jsr     j_IncreaseCurrentMP
										sub.w   d2,d1
										ble.s   loc_2441E
										ext.l   d1
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										bchg    d0,-(a5)
loc_2441E:
										
										jsr     j_GetEquippedRing
										cmp.w   #ITEMIDX_LIFE_RING,d1
										bne.s   loc_2444C
										jsr     j_GetCurrentHP
										move.w  d1,d2
										moveq   #ITEMDEF_LIFE_RING_RECOVERY,d1
										jsr     j_IncreaseCurrentHP
										sub.w   d2,d1
										ble.s   loc_2444C
										ext.l   d1
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $164
loc_2444C:
										
										jsr     j_GetStatus
										and.w   #2,d1
										beq.s   loc_2447C
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										moveq   #2,d1
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $133
										jsr     j_DecreaseCurrentHP
										tst.w   d1
										bne.s   loc_2447C
										trap    #5
										dc.w $134
										addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
										move.b  d0,((DEAD_COMBATANTS_LIST-$1000000)).w
loc_2447C:
										
										jsr     j_ApplyStatusAndItemsOnStats
										trap    #5
										dc.w $FFFF
loc_24486:
										
										unlk    a6
										rts

	; End of function HandleAfterTurnEffects


; =============== S U B R O U T I N E =======================================

; ?

SpawnEnemySkipCamera:
										
										moveq   #1,d1
										bra.w   loc_24492
SpawnEnemy:
										
										clr.w   d1
loc_24492:
										
										movem.l d7-a0,-(sp)
										link    a6,#-$10
										move.w  d1,-(sp)
										move.w  d0,-2(a6)
										move.w  -2(a6),d0
										jsr     sub_440B8
										move.w  (sp)+,d1
										bne.s   loc_244D2
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   getEntityNumberOfCombatant
										move.b  d0,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   SetUnitCursorDestinationToNextCombatant
										bsr.w   WaitForUnitCursor
										jsr     (WaitForCameraToCatchUp).w
										bsr.w   HideUnitCursor
loc_244D2:
										
										moveq   #$B,d7
loc_244D4:
										
										move.w  -2(a6),d0
										bsr.w   getEntityNumberOfCombatant
										move.w  d7,d1
										addq.w  #3,d1
										and.w   #3,d1
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).l    
										moveq   #3,d0
										jsr     (Sleep).w       
										dbf     d7,loc_244D4
										trap    #0
										dc.w SFX_LANDSTALKER_SWITCH
										move.w  -2(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $18D               ; {CLEAR}{NAME} appeared!{D3}
										trap    #5
										dc.w $FFFF
										unlk    a6
										movem.l (sp)+,d7-a0
										rts

	; End of function SpawnEnemySkipCamera


; =============== S U B R O U T I N E =======================================

ClearDeadCombatantsListLength:
										
										clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
										rts

	; End of function ClearDeadCombatantsListLength


; =============== S U B R O U T I N E =======================================

HandleKilledCombatants:
										
										tst.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
										beq.w   return_24640
										movem.l d0-a2/a6,-(sp)
										moveq   #ANIM_SPRITE_DEATH_NUM_SPINS,d6
loc_24526:
										
										lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
																						; loop point for sprite death spin animation
										lea     ((word_FFA920-$1000000)).w,a1
										move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
										subq.w  #1,d7
loc_24534:
										
										clr.w   d0
										move.b  (a0)+,d0
										jsr     getEntityNumberOfCombatant
										move.w  d6,d1
										and.w   #3,d1
										clr.w   d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).l    
										cmp.b   #GFX_MAX_SPRITES_TO_LOAD,((NUM_SPRITES_TO_LOAD-$1000000)).w
										blt.s   loc_2455E
										jsr     (WaitForVInt).w 
										clr.b   ((NUM_SPRITES_TO_LOAD-$1000000)).w
loc_2455E:
										
										lsl.w   #5,d0
										move.b  #$FF,(a1,d0.w)
										dbf     d7,loc_24534
										moveq   #ANIM_SPRITE_DEATH_SPIN_DELAY,d0
										jsr     (Sleep).w       
										dbf     d6,loc_24526    
										trap    #TRAP_SOUNDCOM
										dc.w SFX_BATTLEFIELD_DEATH
										moveq   #2,d6
loc_2457A:
										
										lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
										move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
										subq.w  #1,d7
loc_24584:
										
										clr.w   d0
										move.b  (a0)+,d0
										jsr     getEntityNumberOfCombatant
										cmp.b   #$2F,d0 
										bne.s   loc_245A4
										move.l  #$60006000,((byte_FFAEE2-$1000000)).w
										move.l  #$60006000,((byte_FFAEEE-$1000000)).w
loc_245A4:
										
										move.w  #3,d1
										sub.w   d6,d1
										clr.w   d2
										move.w  #$3F,d3 
										jsr     (sub_6052).l    
										cmp.b   #7,((NUM_SPRITES_TO_LOAD-$1000000)).w
										blt.s   loc_245C6
										jsr     (WaitForVInt).w 
										clr.b   ((NUM_SPRITES_TO_LOAD-$1000000)).w
loc_245C6:
										
										dbf     d7,loc_24584
										moveq   #8,d0
										jsr     (Sleep).w       
										dbf     d6,loc_2457A
										lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
										move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
										subq.w  #1,d7
loc_245DE:
										
										moveq   #1,d1
										clr.w   d0
										move.b  (a0)+,d0
										blt.s   loc_245EE
										jsr     j_IncreaseDefeats
										bra.s   loc_24602
loc_245EE:
										
										movem.l d0,-(sp)
										clr.w   d0
										move.b  ((SKIRMISH_FIRST_ALLY-$1000000)).w,d0
										jsr     j_IncreaseKills
										movem.l (sp)+,d0
loc_24602:
										
										moveq   #$FFFFFFFF,d1
										jsr     j_SetXPos
										jsr     j_SetYPos
										clr.w   d1
										jsr     j_SetStatus
										jsr     j_ApplyStatusAndItemsOnStats
										jsr     getEntityNumberOfCombatant
										move.w  #$7000,d1
										move.w  #$7000,d2
										jsr     SetEntityPosition
										dbf     d7,loc_245DE
										moveq   #$A,d0
										jsr     (Sleep).w       
										movem.l (sp)+,d0-a2/a6
return_24640:
										
										rts

	; End of function HandleKilledCombatants


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant idx

UpdateTargetListForCombatant:
										
										movem.w d0,-(sp)
										move.w  -2(a6),d0
										tst.b   d0
										movem.w (sp)+,d0
										blt.s   loc_2465A
										jsr     j_UpdateTargetListMonsters
										bra.s   return_24660
loc_2465A:
										
										jsr     j_UpdateTargetListCharacters
return_24660:
										
										rts

	; End of function UpdateTargetListForCombatant


; =============== S U B R O U T I N E =======================================

sub_24662:
										
										movem.l d1-a6,-(sp)
										move.w  -2(a6),((MOVING_BATTLE_ENTITY_IDX-$1000000)).w
loc_2466C:
										
										move.w  -2(a6),d0
										bsr.w   ClearEntityBlinkingFlag
										bsr.w   getEntityNumberOfCombatant
										move.b  d0,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   UpdateMoveSound
										bsr.w   ControlBattleUnit
										jsr     (WaitForCameraToCatchUp).w
										btst    #INPUT_A_B_BIT,d4
										beq.w   loc_246EC
										movem.w d2-d3,-(sp)
										move.w  ((word_FFB08E-$1000000)).w,d3
										move.w  ((word_FFB090-$1000000)).w,d4
										lea     ((MOVE_COST_LIST-$1000000)).w,a5
										moveq   #1,d0
										bsr.s   UpdateTargetListForCombatant
										moveq   #$1E,d0
										lea     ((byte_FF4000+$400)).l,a2
										lea     ((byte_FF4A00+$300)).l,a3
										lea     (TERRAIN_DATA).l,a4
										jsr     j_MakeRangeLists
										clr.w   d0
										jsr     UpdateTargetListForCombatant(pc)
										movem.w (sp)+,d0-d1
										jsr     MakeBattleEntityCancelMoveString
										move.w  -2(a6),d0
										lea     (RAM_Battle_BattleEntityMoveString).l,a0
										bsr.w   MoveBattleEntityByMoveString
										move.w  #$FFFF,((RAM_BattleScene_ActionType-$1000000)).w
										moveq   #$FFFFFFFF,d0
										bra.w   loc_25188
loc_246EC:
										
										clr.w   d0
										moveq   #COM_ALL_COUNTER,d7
loc_246F0:
										
										cmp.w   -2(a6),d0       ; check if chosen position is inhabited already (for debug mode B-button trick)
										beq.w   loc_24718
										jsr     j_GetXPos
										cmp.w   d1,d2
										bne.w   loc_24718
										jsr     j_GetYPos
										cmp.w   d1,d3
										bne.w   loc_24718
										trap    #TRAP_SOUNDCOM
										dc.w SFX_REFUSAL
										beq.w   loc_2466C
loc_24718:
										
										addq.w  #1,d0
										cmp.w   #COM_ALLIES_NUM,d0
										bne.s   loc_24724
										move.w  #COM_ENEMY_START,d0
loc_24724:
										
										dbf     d7,loc_246F0    
										move.w  -2(a6),d0
										bsr.w   SetEntityBlinkingFlag
										move.w  -2(a6),d0
										move.w  d2,d1
										jsr     j_SetXPos
										move.w  d3,d1
										jsr     j_SetYPos
										clr.w   d1
loc_24746:
										
										move.w  d1,-(sp)
										jsr     ClearFadingBlockRange
										jsr     (WaitForVInt).w 
										move.w  -2(a6),d0
										bsr.w   GetEntityPositionAfterApplyingFacing
										jsr     (CheckIfChestOpened).w
										move.w  d2,((byte_FFB180-$1000000)).w
										cmp.w   #$FFFF,d2
										bne.s   loc_2476C       ; if d2 != FFFF, then there is an item ?
										moveq   #1,d2
										bra.s   loc_2476E
loc_2476C:
										
										moveq   #2,d2
loc_2476E:
										
										move.w  -2(a6),d0
										jsr     sub_8210
										tst.w   ((RAM_CharIdxListSize-$1000000)).w
										bne.s   loc_24782
										moveq   #3,d0
										bra.s   loc_24784
loc_24782:
										
										clr.w   d0
loc_24784:
										
										bsr.w   HideUnitCursor
										move.w  (sp)+,d1
										lea     (initStack).w,a0
										jsr     j_ExecuteMenu
										cmp.w   #$FFFF,d0
										bne.w   loc_247C6
										move.w  -2(a6),d0
										move.w  ((word_FFB08E-$1000000)).w,d1
										jsr     j_SetXPos
										move.w  ((word_FFB090-$1000000)).w,d1
										jsr     j_SetYPos
										move.w  -2(a6),d0
										jsr     j_GenerateTargetRangeLists
										bsr.w   CreateMoveableRangeForUnit
										bra.w   loc_2466C
loc_247C6:
										
										tst.w   d0
										bne.w   loc_2483C
										move.w  -2(a6),d0
										jsr     sub_8210
										bsr.w   CreateMoveableRangeForUnit
										tst.w   ((RAM_CharIdxListSize-$1000000)).w
										bne.w   loc_247F0
										trap    #5
										dc.w $1B3               ; No opponent there.{W1}
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24746
loc_247F0:
										
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   sub_230E2
										cmp.w   #$FFFF,d0
										bne.w   loc_2482A
										move.w  -2(a6),d0
										jsr     j_GetXPos
										move.w  d1,d2
										jsr     j_GetYPos
										move.w  d1,d3
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   sub_2322C
										moveq   #$FFFFFFFF,d1
										bra.w   loc_24746
loc_2482A:
										
										move.w  d0,((word_FFB630-$1000000)).w
										move.w  d0,-4(a6)
										clr.w   ((RAM_BattleScene_ActionType-$1000000)).w
										clr.w   d0
										bra.w   loc_25188
loc_2483C:
										
										cmp.w   #1,d0
										bne.w   loc_24982
										move.w  -2(a6),d0
										clr.w   d1
										jsr     j_GetSpellAndNumberOfSpells
										tst.w   d2
										bne.w   loc_24864
										trap    #5
										dc.w $1B4               ; Learned no new magic spell.{W1}
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24746
loc_24864:
										
										clr.w   d1
loc_24866:
										
										move.w  -2(a6),d0
										bsr.w   HideUnitCursor
										move.w  d1,-(sp)
										lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
										moveq   #0,d1
										jsr     j_GetSpellAndNumberOfSpells
										move.w  d1,(a0)+
										moveq   #1,d1
										jsr     j_GetSpellAndNumberOfSpells
										move.w  d1,(a0)+
										moveq   #2,d1
										jsr     j_GetSpellAndNumberOfSpells
										move.w  d1,(a0)+
										moveq   #3,d1
										jsr     j_GetSpellAndNumberOfSpells
										move.w  d1,(a0)+
										move.w  (sp)+,d1
										clr.w   d0
										lea     sub_24966(pc), a0
										nop
										jsr     sub_10010
										cmp.w   #$FFFF,d0
										bne.w   loc_248BA
										moveq   #$FFFFFFFF,d1
										bra.w   loc_24746
loc_248BA:
										
										move.w  d0,((word_FFB630-$1000000)).w
										move.w  d0,d4
										move.w  -2(a6),d0
										jsr     j_GetCurrentMP
										move.w  d1,d3
										move.w  d4,d1
										jsr     j_getSpellCost
										sub.w   d1,d3
										bge.w   loc_248E6
										trap    #5
										dc.w $1B5               ; More MP needed.{W1}
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.s   loc_24866
loc_248E6:
										
										move.w  d4,d1
										move.w  -2(a6),d0
										jsr     j_createSpellRangeGrid
										bsr.w   CreateMoveableRangeForUnit
										tst.w   ((RAM_CharIdxListSize-$1000000)).w
										bne.w   loc_2490C
										trap    #5
										dc.w $1B3
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24866
loc_2490C:
										
										move.w  ((word_FFB630-$1000000)).w,d1
										jsr     j_GetSpellDefAddress
										move.b  6(a0),((word_FFAF8E-$1000000)).w
										bsr.w   sub_230E2
										cmp.w   #$FFFF,d0
										bne.w   loc_24952
										move.w  -2(a6),d0
										jsr     j_GetXPos
										move.w  d1,((word_FFB094-$1000000)).w
										jsr     j_GetYPos
										move.w  d1,((word_FFB092-$1000000)).w
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   sub_2322C
										moveq   #$FFFFFFFF,d1
										bra.w   loc_24866
loc_24952:
										
										move.w  d0,((word_FFB632-$1000000)).w
										move.w  d0,-4(a6)
										move.w  #1,((RAM_BattleScene_ActionType-$1000000)).w
										clr.w   d0
										bra.w   loc_25188

	; End of function sub_24662


; =============== S U B R O U T I N E =======================================

;     createSpellRangeGridMaster???

sub_24966:
										
										movem.l d0-a6,-(sp)
										move.w  ((MOVING_BATTLE_ENTITY_IDX-$1000000)).w,d0
										move.w  ((word_FFB18C-$1000000)).w,d1
										jsr     j_createSpellRangeGrid
										bsr.w   CreateMoveableRangeForUnit
										movem.l (sp)+,d0-a6
										rts

	; End of function sub_24966


; START OF FUNCTION CHUNK FOR sub_24662

loc_24982:
										
										cmp.w   #2,d0
										bne.w   loc_25072
										move.w  -2(a6),d0
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										tst.w   d2
										bne.w   loc_249A8
										trap    #5

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w $1B6
										trap    #5
										dc.w $FFFF
										bra.w   loc_24746

; START OF FUNCTION CHUNK FOR sub_24662

loc_249A8:
										
										clr.w   d1
loc_249AA:
										
										moveq   #3,d2
										clr.w   d0
										lea     (initStack).w,a0
										jsr     j_ExecuteMenu
										cmp.w   #$FFFF,d0
										bne.w   loc_249C6
										moveq   #$FFFFFFFF,d1
										bra.w   loc_24746
loc_249C6:
										
										tst.w   d0
										bne.w   loc_24B06
										clr.w   d1
loc_249CE:
										
										move.w  -2(a6),d0
										bsr.w   HideUnitCursor
										move.w  d1,-(sp)
										lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #1,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #2,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #3,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										move.w  (sp)+,d1
										clr.w   d0
										clr.w   d1
										lea     loc_24ADC(pc), a0
										nop
										jsr     sub_10004
										cmp.w   #$FFFF,d0
										bne.w   loc_24A24
										bsr.w   ClearFadingBlockRange
										bra.s   loc_249AA
loc_24A24:
										
										move.w  d0,((word_FFB630-$1000000)).w
										move.w  d1,((word_FFB634-$1000000)).w
										move.w  d0,d1
										move.w  -2(a6),d0
										jsr     j_isItemUsableWeaponInBattle
										bcs.w   loc_24A4A
										trap    #5

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w $1B7
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24746

; START OF FUNCTION CHUNK FOR sub_24662

loc_24A4A:
										
										move.w  ((word_FFB630-$1000000)).w,d1
										move.w  -2(a6),d0
										jsr     j_CreateItemRangeGrid
										bsr.w   CreateMoveableRangeForUnit
										tst.w   ((RAM_CharIdxListSize-$1000000)).w
										bne.w   loc_24A72
										trap    #5

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w $1B7
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_249CE

; START OF FUNCTION CHUNK FOR sub_24662

loc_24A72:
										
										move.w  ((word_FFB630-$1000000)).w,d1
										jsr     j_GetItemDefAddress
										clr.w   d1
										move.b  ITEMDEF_OFFSET_SPELL(a0),d1
										jsr     j_GetSpellDefAddress
										move.b  SPELLDEF_OFFSET_RADIUS(a0),((word_FFAF8E-$1000000)).w
										bsr.w   sub_230E2
										cmp.w   #$FFFF,d0
										bne.w   loc_24AC8
										move.w  -2(a6),d0
										jsr     j_GetXPos
										move.w  d1,((word_FFB094-$1000000)).w
										jsr     j_GetYPos
										move.w  d1,((word_FFB092-$1000000)).w
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   sub_2322C
										moveq   #$FFFFFFFF,d1
										bra.w   loc_24746

; END OF FUNCTION CHUNK FOR sub_24662

										bra.w   loc_249CE

; START OF FUNCTION CHUNK FOR sub_24662

loc_24AC8:
										
										move.w  d0,((word_FFB632-$1000000)).w
										move.w  d0,-4(a6)
										move.w  #ACTION_ITEM,((RAM_BattleScene_ActionType-$1000000)).w
										clr.w   d0
										bra.w   loc_25188

; END OF FUNCTION CHUNK FOR sub_24662

loc_24ADC:          movem.l d0-a6,-(sp)
										move.w  ((MOVING_BATTLE_ENTITY_IDX-$1000000)).w,d0
										move.w  ((word_FFB18C-$1000000)).w,d1
										jsr     j_isItemUsableWeaponInBattle
										bcc.s   loc_24AFC
										jsr     j_CreateItemRangeGrid
										bsr.w   CreateMoveableRangeForUnit
										bra.s   loc_24B00
loc_24AFC:          bsr.w   ClearFadingBlockRange
loc_24B00:          movem.l (sp)+,d0-a6
										rts

; START OF FUNCTION CHUNK FOR sub_24662

loc_24B06:
										
										cmp.w   #2,d0
										bne.w   loc_24D64
										move.w  -2(a6),d0
										jsr     j_GetEquippableWeapons
										move.w  d1,d2
										jsr     j_GetEquippableRings
										add.w   d2,d1
										bne.w   loc_24B34
										trap    #5

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w $1BC
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_249AA

; START OF FUNCTION CHUNK FOR sub_24662

loc_24B34:
										
										bsr.w   HideUnitCursor
										jsr     sub_1005C
										clr.w   d6
loc_24B40:
										
										move.w  -2(a6),d0
										jsr     j_GetEquippableWeapons
										tst.w   d1
										beq.w   loc_24BBE
										movea.l a0,a2
										lea     ((DISPLAYED_ICON_1-$1000000)).w,a1
										move.w  (a0),(a1)+
										move.w  4(a0),(a1)+
										move.w  8(a0),(a1)+
										move.w  $C(a0),(a1)+
										move.w  d1,d3
										jsr     j_GetEquippedWeapon
										move.w  d2,-(sp)
										bsr.w   sub_24C4E
										jsr     j_GetEquippedWeapon
										move.w  d2,d1
										jsr     j_UnequipItemBySlot
										move.w  (sp)+,d2
										move.w  d1,-(sp)
										move.w  d2,d1
										jsr     j_EquipItem
										move.w  (sp)+,d1
										move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
										ext.w   d1
										bpl.s   loc_24BA0
										moveq   #1,d7
										move.w  #$FFFF,d6
										bra.w   loc_24C44
loc_24BA0:
										
										lea     ((RAM_EquippableItemList-$1000000)).w,a2
										lsl.w   #2,d1
										move.w  (a2,d1.w),d2
										move.w  2(a2,d1.w),d1
										move.w  d2,d5
										move.w  d1,d4
										jsr     j_GetEquippedWeapon
										bsr.w   loc_24C94
										clr.w   d6
loc_24BBE:
										
										jsr     j_GetEquippableRings
										tst.w   d1
										beq.w   loc_24C44
										movea.l a0,a2
										lea     ((DISPLAYED_ICON_1-$1000000)).w,a1
										move.w  (a0),(a1)+
										move.w  4(a0),(a1)+
										move.w  8(a0),(a1)+
										move.w  $C(a0),(a1)+
										move.w  d1,d3
										jsr     j_GetEquippedRing
										move.w  d2,-(sp)
										bsr.w   sub_24C4E
										jsr     j_GetEquippedRing
										move.w  d2,d1
										jsr     j_UnequipItemBySlot
										move.w  (sp)+,d2
										move.w  d1,-(sp)
										move.w  d2,d1
										jsr     j_EquipItem
										move.w  (sp)+,d1
										move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
										ext.w   d1
										bpl.s   loc_24C26
										jsr     j_GetEquippableWeapons
										tst.w   d1
										bne.s   loc_24C22
										moveq   #1,d7
										moveq   #$FFFFFFFF,d6
										bra.w   loc_24C44
loc_24C22:
										
										bra.w   loc_24B40
loc_24C26:
										
										lea     ((RAM_EquippableItemList-$1000000)).w,a2
										lsl.w   #2,d1
										move.w  (a2,d1.w),d2
										move.w  2(a2,d1.w),d1
										move.w  d2,d5
										move.w  d1,d4
										jsr     j_GetEquippedRing
										bsr.w   loc_24C94
										clr.w   d1
loc_24C44:
										
										jsr     sub_10064
										bra.w   loc_24746

; END OF FUNCTION CHUNK FOR sub_24662


; =============== S U B R O U T I N E =======================================

sub_24C4E:
										
										move.w  d0,-(sp)
										tst.w   d1
										bpl.s   loc_24C68
										cmp.w   #4,d3
										bne.s   loc_24C64
										clr.w   d1
										jsr     j_EquipItem
										bra.s   loc_24C66
loc_24C64:
										
										moveq   #3,d1
loc_24C66:
										
										bra.s   loc_24C7C
loc_24C68:
										
										move.l  a0,-(sp)
										moveq   #3,d7
										moveq   #$FFFFFFFF,d1
loc_24C6E:
										
										addq.w  #1,d1
										addq.l  #2,a0
										move.w  (a0)+,d4
										cmp.w   d2,d4
										dbeq    d7,loc_24C6E
										movea.l (sp)+,a0
loc_24C7C:
										
										move.b  d1,d0
										lea     loc_24CF6(pc), a0
										nop
										move.w  d6,d1
										move.w  d1,-(sp)
										jsr     sub_10004
										move.w  (sp)+,d1
										move.w  (sp)+,d0
										rts
loc_24C94:
										
										cmp.w   #4,d2
										beq.w   loc_24CC4
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmp.w   #2,d2
										bne.w   loc_24CC4
										cmp.w   d4,d1
										beq.w   return_24CF4
										jsr     sub_10064
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_CURSED_ITEM
										trap    #TRAP_TEXTBOX
										dc.w $2B                ; Gosh!  The curse prohibits{N}you from exchanging{N}equipment!{W2}
										bra.w   loc_24CE6
loc_24CC4:
										
										move.w  d4,d1
										jsr     j_EquipItem
										cmp.w   #2,d2
										bne.w   return_24CF4
										jsr     sub_10064
										trap    #0
										dc.w MUSIC_CURSED_ITEM
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $22                ; Gosh!  {NAME} is{N}cursed!{W2}
loc_24CE6:
										
										bsr.w   waitForMusicResumeAndPlayerInput_4
										trap    #5
										dc.w $FFFF
										jsr     sub_1005C
return_24CF4:
										
										rts
loc_24CF6:
										
										movem.l d0-a6,-(sp)
										move.w  ((MOVING_BATTLE_ENTITY_IDX-$1000000)).w,d0
										jsr     j_GetStatus
										move.w  d1,-(sp)
										clr.w   d2
										move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d2
										lsl.w   #2,d2
										lea     ((RAM_EquippableItemList-$1000000)).w,a2
										move.w  (a2,d2.w),d5
										move.w  2(a2,d2.w),d6
										move.w  (a2),d1
										jsr     j_GetItemType
										tst.w   d2
										blt.s   loc_24D2E
										jsr     j_UnequipWeapon
										bra.s   loc_24D34
loc_24D2E:
										
										jsr     j_UnequipRing
loc_24D34:
										
										move.w  d6,d1
										cmp.w   #4,d1
										bge.s   loc_24D42
										jsr     j_EquipItem
loc_24D42:
										
										jsr     sub_10060
										jsr     sub_8210
										bsr.w   CreateMoveableRangeForUnit
										move.w  ((MOVING_BATTLE_ENTITY_IDX-$1000000)).w,d0
										move.w  (sp)+,d1
										jsr     j_SetStatus
										movem.l (sp)+,d0-a6
										rts

	; End of function sub_24C4E


; START OF FUNCTION CHUNK FOR sub_24662

loc_24D64:
										
										cmp.w   #1,d0
										bne.w   loc_24F6E
loc_24D6C:
										
										move.w  -2(a6),d0
										bsr.w   HideUnitCursor
										move.w  d1,-(sp)
										lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #1,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #2,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #3,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										move.w  (sp)+,d1
										move.w  -2(a6),d0
										jsr     sub_821C
										bsr.w   CreateMoveableRangeForUnit
										tst.w   ((RAM_CharIdxListSize-$1000000)).w
										bne.w   loc_24DCC
										trap    #5

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w $1B3               ; No opponent there.{W1}
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bsr.w   ClearFadingBlockRange
										bra.w   loc_249AA

; START OF FUNCTION CHUNK FOR sub_24662

loc_24DCC:
										
										bsr.w   HideUnitCursor
										jsr     (WaitForVInt).w 
										clr.w   d0
										lea     (initStack).w,a0
										jsr     sub_10004
										cmp.w   #$FFFF,d0
										bne.w   loc_24DF0
										bsr.w   ClearFadingBlockRange
										bra.w   loc_249AA
loc_24DF0:
										
										move.w  d0,((word_FFB634-$1000000)).w
										move.w  d1,((word_FFB630-$1000000)).w
										btst    #7,d0
										beq.w   loc_24E26
										move.w  d0,d1
										jsr     j_GetItemDefAddress
										btst    #6,8(a0)
										beq.w   loc_24E26
										trap    #0

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w MUSIC_CURSED_ITEM
										trap    #5
										dc.w $1B9               ; The equipment is cursed.{W1}
										bsr.w   waitForMusicResumeAndPlayerInput_4
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.s   loc_24DCC

; START OF FUNCTION CHUNK FOR sub_24662

loc_24E26:
										
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   sub_230E2
										cmp.w   #$FFFF,d0
										bne.w   loc_24E4C
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   sub_2322C
										moveq   #$FFFFFFFF,d1
										bra.w   loc_24D6C
loc_24E4C:
										
										move.w  d0,-4(a6)
										jsr     j_HideFighterMiniStatusWindow
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmp.w   #4,d2
										beq.w   loc_24E8E
										move.w  ((word_FFB630-$1000000)).w,d1
										and.w   #7,d1
										move.w  -2(a6),d0
										jsr     j_RemoveItemBySlot
										move.w  -4(a6),d0
										move.w  ((word_FFB634-$1000000)).w,d1
										bclr    #7,d1
										jsr     j_AddItem
										bra.w   loc_24F62
loc_24E8E:
										
										move.w  -4(a6),d0
										bsr.w   HideUnitCursor
										move.w  d1,-(sp)
										lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #1,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #2,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #3,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										move.w  (sp)+,d1
										clr.w   d0
										lea     (initStack).w,a0
										jsr     sub_10004
										cmp.w   #$FFFF,d0
										bne.w   loc_24EDE
										bra.w   loc_24E26
loc_24EDE:
										
										move.w  d0,((word_FFB632-$1000000)).w
										move.w  d1,((RAM_BattleScene_ActionType-$1000000)).w
										btst    #7,d0
										beq.w   loc_24F16
										move.w  d0,d1
										jsr     j_GetItemDefAddress
										btst    #6,8(a0)
										beq.w   loc_24F16
										trap    #0

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w MUSIC_CURSED_ITEM
										trap    #5
										dc.w $1B9               ; The equipment is cursed.{W1}
										bsr.w   waitForMusicResumeAndPlayerInput_4
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24E8E

; START OF FUNCTION CHUNK FOR sub_24662

loc_24F16:
										
										move.w  ((word_FFB630-$1000000)).w,d1
										and.w   #3,d1
										move.w  -2(a6),d0
										jsr     j_RemoveItemBySlot
										move.w  ((word_FFB634-$1000000)).w,d1
										move.w  d1,-(sp)
										move.w  ((RAM_BattleScene_ActionType-$1000000)).w,d1
										and.w   #3,d1
										move.w  -4(a6),d0
										jsr     j_RemoveItemBySlot
										move.w  ((word_FFB632-$1000000)).w,d1
										bclr    #7,d1
										move.w  -2(a6),d0
										jsr     j_AddItem
										move.w  (sp)+,d1
										bclr    #7,d1
										move.w  -4(a6),d0
										jsr     j_AddItem
loc_24F62:
										
										move.w  #3,((RAM_BattleScene_ActionType-$1000000)).w
										clr.w   d0
										bra.w   loc_25188
loc_24F6E:
										
										move.w  -2(a6),d0
										bsr.w   HideUnitCursor
										move.w  d1,-(sp)
										lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #1,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #2,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										moveq   #3,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,(a0)+
										move.w  (sp)+,d1
										clr.w   d0
										clr.w   d1
										lea     (initStack).w,a0
										jsr     sub_10004
										cmp.w   #$FFFF,d0
										bne.w   loc_24FC2
										moveq   #$FFFFFFFF,d1
										bra.w   loc_249AA
loc_24FC2:
										
										move.w  d0,((word_FFB634-$1000000)).w
										move.w  d1,((word_FFB630-$1000000)).w
										btst    #7,d0
										beq.w   loc_24FFA
										move.w  d0,d1
										jsr     j_GetItemDefAddress
										btst    #6,8(a0)
										beq.w   loc_24FFA
										trap    #0

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w MUSIC_CURSED_ITEM
										trap    #5
										dc.w $1B9               ; The equipment is cursed.{W1}
										bsr.w   waitForMusicResumeAndPlayerInput_4
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24F6E

; START OF FUNCTION CHUNK FOR sub_24662

loc_24FFA:
										
										move.w  ((word_FFB634-$1000000)).w,d1
										jsr     j_GetItemDefAddress
										btst    #4,8(a0)
										beq.w   loc_25022
										move.w  -2(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w $1BB
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24F6E

; START OF FUNCTION CHUNK FOR sub_24662

loc_25022:
										
										move.w  ((word_FFB634-$1000000)).w,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w $2C
										jsr     j_YesNoChoiceBox
										trap    #5
										dc.w $FFFF
										tst.w   d0
										bne.w   loc_24746
										move.w  ((word_FFB630-$1000000)).w,d1
										move.w  -2(a6),d0
										jsr     j_RemoveItemBySlot
										move.w  ((word_FFB634-$1000000)).w,d1
										jsr     j_GetItemDefAddress
										btst    #3,8(a0)
										beq.s   loc_25066
										move.w  ((word_FFB634-$1000000)).w,d0
										jsr     j_AddItemToDeals
loc_25066:          trap    #5
										dc.w $2A
										trap    #5
										dc.w $FFFF
										bra.w   loc_24746

; START OF FUNCTION CHUNK FOR sub_24662

loc_25072:
										
										cmp.w   #$FFFF,((byte_FFB180-$1000000)).w
										bne.w   loc_25088
										move.w  #3,((RAM_BattleScene_ActionType-$1000000)).w
										clr.w   d0
										bra.w   loc_25188
loc_25088:
										
										move.w  -2(a6),d0
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										bsr.w   GetEntityPositionAfterApplyingFacing
										bsr.w   sub_256E6
										cmp.w   #$FFFF,d3
										beq.s   loc_250B0
										move.w  d3,((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w $1A2
										trap    #5
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24746

; START OF FUNCTION CHUNK FOR sub_24662

loc_250B0:
										
										jsr     (OpenChest).w
										trap    #5

; END OF FUNCTION CHUNK FOR sub_24662

										dc.w $193
										move.w  ((byte_FFB180-$1000000)).w,d1
										and.w   #ITEM_MASK_IDX,d1
										cmp.w   #$7F,d1 
										beq.w   loc_25178
										move.w  -2(a6),d0
										bsr.w   GetEntityPositionAfterApplyingFacing
										move.w  d1,d2
										move.w  d0,d1
										jsr     sub_1AC054
										cmp.w   #$FFFF,d0
										beq.w   loc_250FC
										move.w  #$80,((RAM_BattleScene_ActionType-$1000000)).w 
										move.w  d0,((word_FFB630-$1000000)).w
										move.w  d0,-4(a6)
										trap    #0
										dc.w MUSIC_CORRUPTED_SAVE
										bsr.w   SpawnEnemySkipCamera
										bra.w   loc_25188
loc_250FC:          move.w  ((byte_FFB180-$1000000)).w,d2
										cmp.w   #$80,d2 
										blt.s   loc_25124
										bsr.w   GetChestGoldAmount
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										jsr     j_IncreaseGold
										trap    #0
										dc.w MUSIC_ITEM
										trap    #5
										dc.w $19E
										bsr.w   waitForMusicResumeAndPlayerInput_4
										bra.w   loc_2517C
loc_25124:          move.w  ((byte_FFB180-$1000000)).w,d1
										move.w  d1,((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  -2(a6),d0
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										jsr     j_AddItem
										tst.w   d2
										bne.w   loc_2515A
										move.w  -2(a6),((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  d1,((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #0
										dc.w MUSIC_ITEM
										trap    #5
										dc.w $19F
										bsr.w   waitForMusicResumeAndPlayerInput_4
										bra.w   loc_2517C
loc_2515A:          trap    #5
										dc.w $19D
										trap    #5
										dc.w $1A3
										trap    #5
										dc.w $FFFF
										move.w  -2(a6),d0
										bsr.w   GetEntityPositionAfterApplyingFacing
										jsr     (CloseChest).w
										clr.w   d1
										bra.w   loc_24746
loc_25178:          trap    #TRAP_TEXTBOX
										dc.w $198
loc_2517C:          trap    #TRAP_TEXTBOX
										dc.w $FFFF
										move.w  #3,((RAM_BattleScene_ActionType-$1000000)).w
										clr.w   d0

; START OF FUNCTION CHUNK FOR sub_24662

loc_25188:
										
										move.w  d0,-(sp)
										move.w  -2(a6),d0
										bsr.w   ClearEntityBlinkingFlag
										move.w  (sp)+,d0
										bsr.w   ClearFadingBlockRange
										movem.l (sp)+,d1-a6
										rts

; END OF FUNCTION CHUNK FOR sub_24662


; =============== S U B R O U T I N E =======================================

sub_2519E:
										
										clr.b   ((word_FFAF8E-$1000000)).w
										clr.w   ((RAM_MoveSound-$1000000)).w
										bsr.w   ControlUnitCursor
										btst    #4,((RAM_Input_Player1_StateA-$1000000)).w
										beq.s   loc_251B8
										move.w  -2(a6),d0
										rts

	; End of function sub_2519E


; START OF FUNCTION CHUNK FOR sub_2519E

loc_251B8:
										
										moveq   #$3D,d7 
										clr.w   d0
loc_251BC:
										
										jsr     j_GetCurrentHP
										tst.w   d1
										ble.w   loc_25226
										jsr     j_GetXPos
										cmp.w   d1,d2
										bne.w   loc_25226
										jsr     j_GetYPos
										cmp.w   d1,d3
										bne.w   loc_25226
										jsr     (WaitForCameraToCatchUp).w
										btst    #6,((RAM_Input_Player1_StateA-$1000000)).w
										beq.s   loc_251F4
										jsr     j_memberStatsScreen
										bra.s   loc_2521C
loc_251F4:
										
										cmp.w   -2(a6),d0
										bne.s   loc_251FC
										rts
loc_251FC:
										
										move.w  d0,((MOVING_BATTLE_ENTITY_IDX-$1000000)).w
										jsr     CreateFighterMiniStatusWindow
										jsr     CreateLandEffectWindow
										jsr     (WaitForPlayerInput).w
										jsr     j_HideLandEffectWindow
										jsr     j_HideFighterMiniStatusWindow
loc_2521C:
										
										cmp.w   -2(a6),d0
										bne.w   sub_2519E
										rts
loc_25226:
										
										addq.w  #1,d0
										cmp.w   #$1E,d0
										bne.s   loc_25232
										move.w  #$80,d0 
loc_25232:
										
										dbf     d7,loc_251BC
loc_25236:
										
										lea     (initStack).w,a0
										moveq   #0,d0
										moveq   #0,d1
										moveq   #4,d2
										jsr     j_ExecuteMenu
										cmp.w   #$FFFF,d0
										beq.w   sub_2519E
										tst.w   d0
										bne.w   loc_25286
										jsr     j_UpdateForce
										move.w  ((NUMBER_OF_BATTLE_PARTY_MEMBERS-$1000000)).w,d7
										beq.s   loc_25236
										move.w  ((NUMBER_OF_BATTLE_PARTY_MEMBERS-$1000000)).w,d7
										move.w  d7,((word_FFB12E-$1000000)).w
										lea     ((RAM_Force_CurrentList-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										jsr     (copyBytes).w   
loc_25274:
										
										jsr     sub_10040
										tst.b   d0
										bmi.s   loc_25236
										jsr     j_memberStatsScreen
										bra.s   loc_25274
loc_25286:
										
										cmp.w   #1,d0
										bne.w   loc_25296
										jsr     sub_10034
										bra.s   loc_25236
loc_25296:
										
										cmp.w   #2,d0
										bne.w   loc_252A6
										jsr     sub_10080
										bra.s   loc_25236
loc_252A6:
										
										tst.b   ((RAM_CurrentBattleIdx-$1000000)).w
										beq.s   loc_25236
										trap    #5

; END OF FUNCTION CHUNK FOR sub_2519E

										dc.w 0
										jsr     j_YesNoChoiceBox
										trap    #5
										dc.w $FFFF
										tst.w   d0
										bmi.w   loc_25236
										move.l  ((SECONDS_COUNTER-$1000000)).w,((SECONDS_COUNTER_FROM_SRAM-$1000000)).w
										trap    #2
										dc.w $58                ; set when game is saved from a battle
										move.w  ((SAVE_SLOT_BEING_USED-$1000000)).w,d0
										jsr     (SaveGame).l
										tst.b   ((RAM_DebugModeActivated-$1000000)).w
										beq.w   loc_252E6
										btst    #7,((RAM_Input_Player1_StateA-$1000000)).w
										bne.w   loc_252F2
loc_252E6:          trap    #0
										dc.w SOUND_COMMAND_FADE_OUT
										jsr     (fadeOutToBlack).w
										jmp     (sub_7034).w    
loc_252F2:          trap    #3
										dc.w $58
										bra.w   loc_25236

; =============== S U B R O U T I N E =======================================

sub_252FA:
										
										movem.l d0-a6,-(sp)
										move.w  -2(a6),d0
										jsr     j_GenerateTargetRangeLists
										bsr.w   CreateMoveableRangeForUnit
										move.w  -2(a6),d0
										move.w  -2(a6),d0
										bsr.w   UpdateMoveSound
										lea     (RAM_Battle_BattleEntityMoveString).l,a0
										jsr     MoveBattleEntityByMoveString
										move.w  -2(a6),d0
										move.w  d2,d1
										jsr     j_SetXPos
										move.w  d3,d1
										jsr     j_SetYPos
										bsr.w   ClearFadingBlockRange
										move.w  -2(a6),d0
										bsr.w   SetEntityBlinkingFlag
										move.w  ((RAM_BattleScene_ActionType-$1000000)).w,d0
										cmp.w   #3,d0
										beq.w   loc_25480
										tst.w   d0
										bne.w   loc_2537E
										move.w  -2(a6),d0
										jsr     sub_8210
										jsr     (WaitForCameraToCatchUp).w
										bsr.w   CreateMoveableRangeForUnit
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  ((word_FFB630-$1000000)).w,d0
										move.w  d0,-4(a6)
										bsr.w   sub_2548E
										clr.w   d0
										bra.w   loc_2547A
loc_2537E:
										
										cmp.w   #1,d0
										bne.w   loc_253BE
										move.w  ((word_FFB630-$1000000)).w,d1
										move.w  -2(a6),d0
										jsr     j_createSpellRangeGrid
										jsr     (WaitForCameraToCatchUp).w
										bsr.w   CreateMoveableRangeForUnit
										move.w  ((word_FFB630-$1000000)).w,d1
										jsr     j_GetSpellDefAddress
										move.b  6(a0),((word_FFAF8E-$1000000)).w
										move.w  ((word_FFB632-$1000000)).w,d0
										move.w  d0,-4(a6)
										bsr.w   sub_2548E
										clr.w   d0
										bra.w   loc_2547A
loc_253BE:
										
										cmp.w   #2,d0
										bne.w   loc_2540A
										move.w  ((word_FFB630-$1000000)).w,d1
										move.w  -2(a6),d0
										jsr     j_CreateItemRangeGrid
										jsr     (WaitForCameraToCatchUp).w
										bsr.w   CreateMoveableRangeForUnit
										move.w  ((word_FFB630-$1000000)).w,d1
										jsr     j_GetItemDefAddress
										clr.w   d1
										move.b  9(a0),d1
										jsr     j_GetSpellDefAddress
										move.b  6(a0),((word_FFAF8E-$1000000)).w
										move.w  ((word_FFB632-$1000000)).w,d0
										move.w  d0,-4(a6)
										bsr.w   sub_2548E
										clr.w   d0
										bra.w   loc_2547A
loc_2540A:
										
										cmp.w   #4,d0
										bne.w   loc_2544A
										move.w  ((word_FFB630-$1000000)).w,d1
										move.w  -2(a6),d0
										jsr     j_createSpellRangeGrid
										jsr     (WaitForCameraToCatchUp).w
										bsr.w   CreateMoveableRangeForUnit
										move.w  ((word_FFB630-$1000000)).w,d1
										jsr     j_GetSpellDefAddress
										move.b  6(a0),((word_FFAF8E-$1000000)).w
										move.w  ((word_FFB632-$1000000)).w,d0
										move.w  d0,-4(a6)
										bsr.w   sub_2548E
										clr.w   d0
										bra.w   loc_2547A
loc_2544A:
										
										cmp.w   #6,d0
										bne.w   loc_2547A
										move.w  -2(a6),d0
										jsr     sub_1AC05C
										jsr     (WaitForCameraToCatchUp).w
										bsr.w   CreateMoveableRangeForUnit
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  ((word_FFB630-$1000000)).w,d0
										move.w  d0,-4(a6)
										bsr.w   sub_2548E
										clr.w   d0
										bra.w   *+4
loc_2547A:
										
										jsr     ClearFadingBlockRange
loc_25480:
										
										move.w  -2(a6),d0
										bsr.w   ClearEntityBlinkingFlag
										movem.l (sp)+,d0-a6
										rts

	; End of function sub_252FA


; =============== S U B R O U T I N E =======================================

sub_2548E:
										
										move.w  d0,-4(a6)
										move.w  -4(a6),d0
										jsr     j_GetXPos
										move.w  d1,d2
										jsr     j_GetYPos
										move.w  d1,d3
										move.w  -2(a6),d0
										jsr     j_GetXPos
										sub.w   d1,d2
										blt.s   loc_254B8
										moveq   #0,d4
										bra.s   loc_254BC
loc_254B8:
										
										moveq   #2,d4
										neg.w   d2
loc_254BC:
										
										jsr     j_GetYPos
										sub.w   d1,d3
										blt.s   loc_254CA
										moveq   #3,d5
										bra.s   loc_254CE
loc_254CA:
										
										moveq   #1,d5
										neg.w   d3
loc_254CE:
										
										cmp.w   d2,d3
										blt.s   loc_254D4
										move.w  d5,d4
loc_254D4:
										
										bsr.w   getEntityNumberOfCombatant
										move.w  d4,d1
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).l    
										move.w  -4(a6),d0
										bsr.w   sub_2322C
										bsr.w   WaitForUnitCursor
										jsr     (WaitForCameraToCatchUp).w
										move.b  #1,((FIGHTER_IS_TARGETTING-$1000000)).w
										jsr     CreateFighterMiniStatusWindow
										moveq   #$F,d0
										jsr     (Sleep).w       
										trap    #0
										dc.w SFX_VALIDATION
										rts

	; End of function sub_2548E


; =============== S U B R O U T I N E =======================================

UpdateAllEnemyAI:
										
										move.w  #$80,d0 
										moveq   #$1F,d7
loc_25512:
										
										move.w  d7,-(sp)
										bsr.w   UpdateEnemyAI
										move.w  (sp)+,d7
										addq.w  #1,d0
										dbf     d7,loc_25512

	; End of function UpdateAllEnemyAI


; =============== S U B R O U T I N E =======================================

UpdateEnemyAI:
										
										jsr     j_GetXPos
										tst.b   d1
										bmi.w   return_25542
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.w   return_25542
										tst.b   d0
										bpl.s   return_25542
										jsr     j_UpdateTriggeredRegionsAndAI
return_25542:
										
										rts

	; End of function UpdateEnemyAI


; =============== S U B R O U T I N E =======================================

CreateRandomizedTurnOrder:
										
										lea     ((RAM_Battle_TurnOrder-$1000000)).w,a0
										move.l  a0,-(sp)
										moveq   #$3F,d7 
loc_2554C:
										
										move.w  #$FFFF,(a0)+
										dbf     d7,loc_2554C
										movea.l (sp)+,a0
										clr.w   d0
										moveq   #$1D,d7
loc_2555A:
										
										move.w  d7,-(sp)
										bsr.w   AddRandomizedAGIToTurnOrder
										move.w  (sp)+,d7
										addq.w  #1,d0
										dbf     d7,loc_2555A
										move.w  #$80,d0 
										moveq   #$1D,d7
loc_2556E:
										
										move.w  d7,-(sp)
										bsr.w   AddRandomizedAGIToTurnOrder
										move.w  (sp)+,d7
										addq.w  #1,d0
										dbf     d7,loc_2556E
										moveq   #$3D,d6 
loc_2557E:
										
										moveq   #$3E,d7 
										lea     ((RAM_Battle_TurnOrder-$1000000)).w,a0
loc_25584:
										
										move.w  (a0),d0
										move.w  2(a0),d1
										cmp.b   d0,d1
										ble.s   loc_25594
										move.w  d1,(a0)
										move.w  d0,2(a0)
loc_25594:
										
										addq.l  #2,a0
										dbf     d7,loc_25584
										dbf     d6,loc_2557E
										clr.b   ((RAM_Battle_CurrentTurnOffset-$1000000)).w
										rts

	; End of function CreateRandomizedTurnOrder


; =============== S U B R O U T I N E =======================================

; In: A0 = turn order in RAM
;     D0 = char idx    

AddRandomizedAGIToTurnOrder:
										
										jsr     j_GetXPos
										tst.b   d1
										bmi.w   return_2560E
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.w   return_2560E
										jsr     j_GetCurrentAGI
										move.w  d1,d3
										and.w   #CHAR_STATCAP_AGI_CURRENT,d1
										move.w  d1,d6
										lsr.w   #3,d6
										jsr     (UpdateRandomSeed).w
										add.w   d7,d1
										jsr     (UpdateRandomSeed).w
										sub.w   d7,d1
										moveq   #3,d6
										jsr     (UpdateRandomSeed).w
										subq.w  #1,d7
										add.w   d7,d1
										move.b  d0,(a0)+
										move.b  d1,(a0)+
										cmp.w   #$80,d3 
										blt.s   return_2560E
										move.w  d3,d1
										and.w   #CHAR_STATCAP_AGI_CURRENT,d1
										mulu.w  #5,d1
										divu.w  #6,d1
										move.w  d1,d6
										lsr.w   #3,d6
										jsr     (UpdateRandomSeed).w
										add.w   d7,d1
										jsr     (UpdateRandomSeed).w
										sub.w   d7,d1
										move.b  d0,(a0)+
										move.b  d1,(a0)+
return_2560E:
										
										rts

	; End of function AddRandomizedAGIToTurnOrder


; =============== S U B R O U T I N E =======================================

; load all battle properties

LoadBattle:
										
										move.w  d0,-(sp)
										clr.w   d1
										move.b  ((RAM_CurrentMapIdx-$1000000)).w,d1
										bsr.w   sub_258EA
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										jsr     (LoadMapTilesets).w
										bsr.w   WaitForFadeToFinish
										trap    #9
										dc.w 0
										jsr     (WaitForVInt).w 
										jsr     j_MoveEntitiesToBattlePositions
										move.w  (sp)+,d0
										bsr.w   getEntityNumberOfCombatant
										move.b  d0,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										bpl.s   loc_25646
										clr.w   d0
loc_25646:
										
										and.w   #$3F,d0 
										lsl.w   #5,d0
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										add.w   d0,a0
										move.w  (a0)+,d0
										ext.l   d0
										divs.w  #$180,d0
										move.b  d0,((RAM_Battle_CurrentMovingEntityChosenX-$1000000)).w
										move.w  (a0)+,d0
										ext.l   d0
										divs.w  #$180,d0
										move.b  d0,((RAM_Battle_CurrentMovingEntityChosenY-$1000000)).w
										moveq   #$3F,d0 
										jsr     (InitSprites).w 
										move.w  #$FFFF,d0
										jsr     (LoadMap).w     
										jsr     (WaitForVInt).w 
										jsr     (LoadMapEntitySprites).w
										bsr.w   SetBattleVIntFuncs
										jsr     j_LoadBattleTerrainData
										jsr     (LoadBattleMapMusic).w
										jsr     (fadeInFromBlack).w
										cmp.b   #BATTLEIDX_FAIRY_WOODS,((RAM_CurrentBattleIdx-$1000000)).w
																						; if battle 44, then special battle !
										bne.s   return_256A0
										jsr     j_specialBattle
return_256A0:
										
										rts

	; End of function LoadBattle

tbl_RelativeTileMoveX:
										dc.w 1
tbl_RelativeTileMoveY:
										dc.w 0
										dc.w 0
										dc.w $FFFF
										dc.w $FFFF
										dc.w 0
										dc.w 0
										dc.w 1

; =============== S U B R O U T I N E =======================================

; In: D0 = combatant idx
; Out: D0 = new X
;      D1 = new Y

GetEntityPositionAfterApplyingFacing:
										
										movem.l d2-d3/a0,-(sp)
										jsr     j_GetXPos
										move.w  d1,d2
										jsr     j_GetYPos
										bsr.w   getEntityCombatantNumber
										lsl.w   #ENTITYDEF_SIZE_BITS,d0
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										clr.w   d3
										move.b  ENTITYDEF_OFFSET_FACING(a0,d0.w),d3
										move.w  d2,d0
										lsl.w   #2,d3
										add.w   tbl_RelativeTileMoveX(pc,d3.w),d0
										add.w   tbl_RelativeTileMoveY(pc,d3.w),d1
										movem.l (sp)+,d2-d3/a0
										rts

	; End of function GetEntityPositionAfterApplyingFacing


; =============== S U B R O U T I N E =======================================

sub_256E6:
										
										movem.l d0-d2/d7,-(sp)
										move.w  d0,d2
										move.w  d1,d3
										clr.w   d0
										move.w  #$3D,d7 
loc_256F4:
										
										jsr     j_GetXPos
										cmp.w   d1,d2
										bne.w   loc_25712
										jsr     j_GetYPos
										cmp.w   d1,d3
										bne.w   loc_25712
										move.w  d0,d3
										bra.w   loc_25724
loc_25712:
										
										addq.w  #1,d0
										cmp.w   #$1E,d0
										bne.s   loc_2571E
										move.w  #$80,d0 
loc_2571E:
										
										dbf     d7,loc_256F4
										moveq   #$FFFFFFFF,d3
loc_25724:
										
										movem.l (sp)+,d0-d2/d7
										rts

	; End of function sub_256E6


; =============== S U B R O U T I N E =======================================

PrintAllActivatedDefCons:
										
										moveq   #$5A,d1 
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										bsr.w   PrintActivatedDefCon
										trap    #5
										dc.w $FFFF
										rts

	; End of function PrintAllActivatedDefCons


; =============== S U B R O U T I N E =======================================

; if flag D1 is set, display def-con textbox

PrintActivatedDefCon:
										
										move.w  d1,-(sp)
										jsr     j_CheckFlag
										beq.s   loc_2578A
										sub.w   #$5A,d1 
										ext.l   d1
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #5
										dc.w $1CF               ; DEF-CON No. {#} has been{N}implemented.{D3}
loc_2578A:
										
										move.w  (sp)+,d1
										addq.w  #1,d1
										rts

	; End of function PrintActivatedDefCon


; =============== S U B R O U T I N E =======================================

UpdateMoveSound:
										
										cmp.b   #CODE_NOTHING_BYTE,((RAM_CurrentBattleIdx-$1000000)).w
										bne.s   loc_2579E
										clr.w   ((RAM_MoveSound-$1000000)).w
										bra.s   loc_257A4
loc_2579E:
										
										move.w  #SFX_WALKING,((RAM_MoveSound-$1000000)).w
loc_257A4:
										
										movem.w d0-d7,-(sp)
										jsr     j_GetEquippedRing
										cmp.w   #ITEMIDX_CHIRRUP_SANDALS,d1
										bne.s   loc_257BA
										move.w  #SFX_BLOAB,((RAM_MoveSound-$1000000)).w
loc_257BA:
										
										movem.w (sp)+,d0-d7
										rts

	; End of function UpdateMoveSound


; =============== S U B R O U T I N E =======================================

ExecuteMapLoop:
										
										clr.w   ((RAM_MapEventType-$1000000)).w
										sub.w   #$4E20,((word_FFB196-$1000000)).w
										bge.s   loc_257D0
										clr.w   ((word_FFB196-$1000000)).w
loc_257D0:
										
										jsr     HealAliveCharsAndImmortals
										jsr     sub_258EA(pc)
										nop
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										move.w  d0,-(sp)
										cmp.b   #$FF,d0         ; map idx is FF, not provided
										beq.s   loc_25828
										move.b  d0,((RAM_CurrentMapIdx-$1000000)).w
										move.b  #$FF,((RAM_CurrentBattleIdx-$1000000)).w
										movem.w d1-d3,-(sp)
										clr.w   d1
										move.b  ((RAM_CurrentMapIdx-$1000000)).w,d1
										jsr     (LoadMapTilesets).w
										movem.w (sp)+,d1-d3
										bsr.w   WaitForFadeToFinish
										trap    #9
										dc.w 0
										jsr     j_getMapSetupEntities
										jsr     sub_44004
										jsr     (LoadMapEntitySprites).w
										bsr.w   loc_2588A
										trap    #2
										dc.w $50
										bra.s   loc_25836
loc_25828:
										
										bsr.w   WaitForFadeToFinish
										bsr.w   sub_258A8
										jsr     sub_440AC
loc_25836:
										
										jsr     (sub_4EC6).w
										move.w  (sp)+,d1
										move.w  #$FFFF,d0
										move.b  #0,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										jsr     (LoadMap).w     
										bsr.w   SetBattleVIntFuncs
										jsr     sub_440A8
										move.l  (dword_FFD084).l,d0
										cmp.l   (dword_FFD004).l,d0
										beq.s   loc_2586A       
										jsr     (LoadBattleMapMusic).w
										jsr     (fadeInFromBlack).w
loc_2586A:
										
										clr.w   d0              ; MAIN MAP LOOP
										bsr.w   UpdateMoveSound
										bsr.w   WaitForEvent
										tst.w   d0
										beq.s   loc_2587E
										bsr.w   sub_2594A       
										bra.s   loc_2586A       
loc_2587E:
										
										tst.w   d1
										beq.s   loc_25888
										bsr.w   sub_25AD6
										bra.s   loc_2586A       
loc_25888:
										
										bra.s   loc_2586A       
loc_2588A:
										
										movem.w d1/d7,-(sp)
										move.w  #$100,d1
										move.w  #$7F,d7 
loc_25896:
										
										jsr     j_ClearFlag
										addq.w  #1,d1
										dbf     d7,loc_25896
										movem.w (sp)+,d1/d7
										rts

	; End of function ExecuteMapLoop


; =============== S U B R O U T I N E =======================================

sub_258A8:
										
										movem.l d0-d3/a0,-(sp)
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										tst.b   d1
										blt.s   loc_258BE
										mulu.w  #$180,d1
										move.w  d1,(a0)
										move.w  d1,$C(a0)
loc_258BE:
										
										tst.b   d2
										blt.s   loc_258CE
										mulu.w  #$180,d2
										move.w  d2,2(a0)
										move.w  d2,$E(a0)
loc_258CE:
										
										move.b  d3,$10(a0)
										clr.w   d0
										jsr     j_getCharacterSpriteIdx
										move.w  d3,d1
										moveq   #$FFFFFFFF,d2
										move.w  d4,d3
										jsr     (sub_6052).w    
										movem.l (sp)+,d0-d3/a0
										rts

	; End of function sub_258A8


; =============== S U B R O U T I N E =======================================

sub_258EA:
										
										move.b  #2,((FADING_SETTING-$1000000)).w
										clr.w   ((word_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										trap    #9
										dc.w 3
										dc.l vintFunc_3930
										rts

	; End of function sub_258EA


; =============== S U B R O U T I N E =======================================

WaitForFadeToFinish:
										
										tst.b   ((FADING_SETTING-$1000000)).w
										beq.s   return_2591A
										jsr     (WaitForVInt).w 
										bra.s   WaitForFadeToFinish
return_2591A:
										
										rts

	; End of function WaitForFadeToFinish


; =============== S U B R O U T I N E =======================================

WaitForEvent:
										
										move.w  ((RAM_MapEventType-$1000000)).w,d0
										bne.s   loc_25930       
										move.b  #0,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										clr.w   d0
										jsr     j_setControlledEntityActScript
loc_25930:
										
										clr.w   d0              ; SECONDARY MAP LOOP - wait for map event
										clr.w   d1
										move.w  ((RAM_MapEventType-$1000000)).w,d0
										beq.s   loc_2593C
										rts
loc_2593C:
										
										move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
										and.w   #$60,d1 
										beq.s   loc_25948
										rts
loc_25948:
										
										bra.s   loc_25930       

	; End of function WaitForEvent


; =============== S U B R O U T I N E =======================================

; deal with "system" event (RAM:a84a)

sub_2594A:
										
										clr.w   ((RAM_MapEventType-$1000000)).w
										subq.w  #1,d0
										beq.w   loc_25978
										subq.w  #1,d0
										beq.w   loc_25A4C
										subq.w  #1,d0
										beq.w   loc_25A54
										subq.w  #1,d0
										beq.w   loc_25A5C
										subq.w  #1,d0
										beq.w   loc_25A64
										subq.w  #1,d0
										beq.w   loc_25A7C
										trap    #0
										dc.w SFX_BATTLEFIELD_DEATH
																						; big door slam ?
										rts
loc_25978:
										
										tst.b   ((byte_FFA84C-$1000000)).w
										bne.w   loc_259CC
										movem.w d0,-(sp)
										move.w  ((word_FFB1A8-$1000000)).w,d0
										trap    #0
										dc.w SOUND_COMMAND_GET_D0_PARAMETER
										clr.w   ((word_FFB1A8-$1000000)).w
										movem.w (sp)+,d0
										clr.w   d0
										jsr     j_makeEntityIdle
										movem.l (sp)+,d0
										clr.w   d0
										clr.w   d1
										clr.w   d2
										clr.w   d3
										clr.w   d4
										move.b  ((byte_FFA84D-$1000000)).w,d0
										bsr.w   sub_25A2A
										move.b  ((byte_FFA84E-$1000000)).w,d5
										blt.s   loc_259BA
										move.b  d5,d1
loc_259BA:
										
										move.b  ((byte_FFA84F-$1000000)).w,d5
										blt.s   loc_259C2
										move.b  d5,d2
loc_259C2:
										
										move.b  ((byte_FFA850-$1000000)).w,d3
										move.b  ((byte_FFA84C-$1000000)).w,d4
										rts
loc_259CC:
										
										clr.w   d0
										jsr     j_makeEntityIdle
										move.b  ((byte_FFA84D-$1000000)).w,d0
										cmp.b   #$47,d0 
										bne.s   loc_259E8       ; check if map is pacalon, switch if water not restored (HARDCODE)
										trap    #1
										dc.w $212
										beq.s   loc_259E8
										move.w  #$4E,d0 
loc_259E8:
										
										move.b  d0,((RAM_CurrentMapIdx-$1000000)).w
										moveq   #$FFFFFFFF,d0
										jsr     (sub_25B0).w
										move.b  ((byte_FFA84E-$1000000)).w,d0
										blt.s   loc_25A04
										mulu.w  #$180,d0
										move.w  d0,((RAM_Entity_StructOffset_XAndStart-$1000000)).w
										move.w  d0,((ENTITY_DATA_STRUCT_X_DEST-$1000000)).w
loc_25A04:
										
										clr.w   d0
										move.b  ((byte_FFA84F-$1000000)).w,d0
										blt.s   loc_25A18
										mulu.w  #$180,d0
										move.w  d0,((ENTITY_DATA_STRUCT_Y-$1000000)).w
										move.w  d0,((ENTITY_DATA_STRUCT_Y_DEST-$1000000)).w
loc_25A18:
										
										clr.w   d1
										clr.w   d2
										clr.w   d3
										bsr.w   sub_25A2A
										jsr     sub_440AC
										rts

	; End of function sub_2594A


; =============== S U B R O U T I N E =======================================

sub_25A2A:
										
										move.l  a0,-(sp)
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										move.w  (a0),d1
										ext.l   d1
										divs.w  #$180,d1
										move.w  2(a0),d2
										ext.l   d2
										divs.w  #$180,d2
										clr.w   d3
										move.b  $10(a0),d3
										movea.l (sp)+,a0
										rts
loc_25A4C:
										
										jsr     sub_44098       
										rts
loc_25A54:
										
										jsr     sub_44090
										rts
loc_25A5C:
										
										jsr     sub_4409C
										rts
loc_25A64:
										
										jsr     sub_44094
										rts

	; End of function sub_25A2A


; =============== S U B R O U T I N E =======================================

sub_25A6C:
										
										jsr     sub_440A0
										rts

	; End of function sub_25A6C


; =============== S U B R O U T I N E =======================================

sub_25A74:
										
										jsr     sub_440A4
										rts

	; End of function sub_25A74


; START OF FUNCTION CHUNK FOR sub_2594A

loc_25A7C:
										
										clr.w   d0
										jsr     sub_4401C       
										move.w  ((byte_FFA84C-$1000000)).w,d1
										move.w  ((byte_FFA84E-$1000000)).w,d2
										jsr     sub_44080
										rts

; END OF FUNCTION CHUNK FOR sub_2594A


; =============== S U B R O U T I N E =======================================

; init vint contextual functions

SetBattleVIntFuncs:
										
										jsr     (InitWindowProperties).w
										trap    #TRAP_VINTFUNCTIONS
										dc.w 0
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_4744
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_UpdateEntities
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_AdjustCameraToPlayer
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l vintFunc_3930
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_UpdateSprites
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_UpdateWindows
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_UpdateAnimatingTiles
										rts

	; End of function SetBattleVIntFuncs


; =============== S U B R O U T I N E =======================================

sub_25AD6:
										
										move.b  ((RAM_Input_Player1_StateA-$1000000)).w,d7
										clr.w   d0
										jsr     j_makeEntityIdle
										clr.w   d0
										jsr     j_WaitForEntityToStopMoving
										jsr     (WaitForCameraToCatchUp).l
										btst    #6,d7
										bne.w   loc_25BCC
										btst    #5,d7
										bne.w   loc_25B02
										rts
loc_25B02:
										
										tst.b   ((RAM_DebugModeActivated-$1000000)).w
										beq.s   loc_25B40
										btst    #4,((RAM_Input_Player2_StateA-$1000000)).w
										beq.s   loc_25B22
										move.w  #$258,d0
										jsr     j_DebugFlagSetter
										jsr     j_ChurchActions
										rts
loc_25B22:
										
										btst    #5,((RAM_Input_Player2_StateA-$1000000)).w
										bne.w   loc_25BF4
										btst    #6,((RAM_Input_Player2_StateA-$1000000)).w
										beq.s   loc_25B40
										jsr     (fadeOutToBlack).w
										jsr     j_DebugModeSelectAction
										rts
loc_25B40:
										
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										cmp.b   #$3E,$33(a0) 
										bne.s   loc_25BAA
										move.w  $C(a0),d0
										sub.w   $2C(a0),d0
										bge.s   loc_25B58
										neg.w   d0
loc_25B58:
										
										move.w  $E(a0),d1
										sub.w   $2E(a0),d1
										bge.s   loc_25B64
										neg.w   d1
loc_25B64:
										
										add.w   d1,d0
										bne.s   loc_25BAA
										trap    #0
										dc.w SOUND_COMMAND_FADE_OUT
										bsr.w   sub_25A6C
										trap    #0
										dc.w MUSIC_HEADQUARTERS ; headquarters
										trap    #9
										dc.w 3
										dc.l VInt_UpdateEntities
										trap    #9
										dc.w 3
										dc.l VInt_AdjustCameraToPlayer
										jsr     j_CaravanActions
										trap    #9
										dc.w 4
										dc.l VInt_AdjustCameraToPlayer
										trap    #9
										dc.w 4
										dc.l VInt_UpdateEntities
										trap    #0
										dc.w SOUND_COMMAND_FADE_OUT
										bsr.w   sub_25A74
										trap    #0
										dc.w SOUND_COMMAND_PLAY_PREVIOUS_MUSIC
										bra.w   return_25BF2
loc_25BAA:
										
										bsr.w   GetActivatedEntity
										tst.w   d0
										blt.s   loc_25BC0
										bsr.w   GetEntityEventIdx
										jsr     j_ExecuteEntityEvent
										bra.w   return_25BF2
loc_25BC0:
										
										moveq   #1,d6
										jsr     sub_23862
										bne.w   return_25BF2
loc_25BCC:
										
										trap    #9
										dc.w 3
										dc.l VInt_UpdateEntities
										trap    #9
										dc.w 3
										dc.l VInt_AdjustCameraToPlayer
										jsr     j_ExecuteMainMenu
										trap    #9
										dc.w 4
										dc.l VInt_AdjustCameraToPlayer
										trap    #9
										dc.w 4
										dc.l VInt_UpdateEntities
return_25BF2:
										
										rts
loc_25BF4:
										
										jsr     sub_44034
										rts

	; End of function sub_25AD6

pt_specialSprites:  dc.l specialSprites_Taros
										dc.l specialSprites_Kraken
										dc.l specialSprites_NazcaShip
										dc.l specialSprites_EvilSpirit
										dc.l specialSprites_Zeon
										dc.l specialSprites_Zeon
										dc.l specialSprites_Kraken
										dc.l specialSprites_Kraken
										dc.l specialSprites_Kraken
										dc.l specialSprites_Kraken

; =============== S U B R O U T I N E =======================================

sub_25C24:
										
										movem.l d0-a1,-(sp)
										move.b  #$FF,d0
										sub.b   d1,d0
										and.w   #$FF,d0
										move.w  d0,d1
										lsl.w   #2,d0
										movea.l pt_specialSprites(pc,d0.w),a0
										lea     (PALETTE_4).l,a1
										move.l  (a0)+,(a1)+
										move.l  (a0)+,(a1)+
										move.l  (a0)+,(a1)+
										move.l  (a0)+,(a1)+
										move.l  (a0)+,(a1)+
										move.l  (a0)+,(a1)+
										move.l  (a0)+,(a1)+
										move.l  (a0)+,(a1)+
										add.w   d1,d1
										move.w  rjt_25C5A(pc,d1.w),d1
										jmp     rjt_25C5A(pc,d1.w)

	; End of function sub_25C24

rjt_25C5A:          dc.w sub_25C6C-rjt_25C5A
										dc.w sub_25C6C-rjt_25C5A
										dc.w sub_25C8E-rjt_25C5A
										dc.w sub_25C6C-rjt_25C5A
										dc.w sub_25C6C-rjt_25C5A
										dc.w sub_25C6C-rjt_25C5A
										dc.w sub_25C6C-rjt_25C5A
										dc.w sub_25C6C-rjt_25C5A
										dc.w sub_25C6C-rjt_25C5A

; =============== S U B R O U T I N E =======================================

sub_25C6C:
										
										lea     (FF8002_LOADING_SPACE).l,a1
										move.l  a1,-(sp)
										jsr     (loadTileData).w
										movea.l (sp)+,a0
										lea     ($AF00).l,a1
										move.w  #$480,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgain).w
										bra.w   loc_25CB0

	; End of function sub_25C6C


; =============== S U B R O U T I N E =======================================

sub_25C8E:
										
										lea     ((byte_FF4A00+$300)).l,a1
										move.l  a1,-(sp)
										jsr     (loadTileData).w
										movea.l (sp)+,a0
										lea     ($A3C0).l,a1
										move.w  #$A20,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgain).w
										bra.w   *+4
loc_25CB0:
										
										movem.l (sp)+,d0-a1
										rts

	; End of function sub_25C8E


; =============== S U B R O U T I N E =======================================

sub_25CB6:
										
										movem.l d0-d2/a0-a1,-(sp)
										lea     (specialSprites_EvilSpirit+$20)(pc), a0
										tst.w   d0
										beq.s   loc_25CD2
										cmp.b   #1,d0
										bne.s   loc_25CCE
										lea     specialSprites_EvilSpiritAlt(pc), a0
										bra.s   loc_25CD2
loc_25CCE:
										
										lea     (specialSprites_Zeon+$20)(pc), a0
loc_25CD2:
										
										lea     (FF6802_LOADING_SPACE).l,a1
										move.l  a1,-(sp)
										jsr     (loadTileData).w
										movea.l (sp)+,a0
										lea     ($AF00).l,a1
										move.w  #$480,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgainbis).w
										jsr     (set_FFDE94_bit3).w
										movem.l (sp)+,d0-d2/a0-a1
										rts

	; End of function sub_25CB6


; =============== S U B R O U T I N E =======================================

sub_25CFA:
										
										movem.l d0-d2/d7-a2,-(sp)
										move.b  ((WINDOW_IS_PRESENT-$1000000)).w,d7
										cmp.b   d5,d7
										bge.s   loc_25D0C
										move.w  #$8000,d5
										bra.s   loc_25D0E
loc_25D0C:
										
										clr.w   d5
loc_25D0E:
										
										cmp.b   #$F0,$13(a0)
										bcs.w   loc_25DF0
										move.b  #$FF,d6
										sub.b   $13(a0),d6
										and.w   #$F,d6
										add.w   d6,d6
										move.w  rjt_25D2E(pc,d6.w),d6
										jmp     rjt_25D2E(pc,d6.w)

	; End of function sub_25CFA

rjt_25D2E:          dc.w sub_25D40-rjt_25D2E
										dc.w sub_25D40-rjt_25D2E
										dc.w sub_25D98-rjt_25D2E
										dc.w sub_25D40-rjt_25D2E
										dc.w sub_25D40-rjt_25D2E
										dc.w sub_25D40-rjt_25D2E
										dc.w sub_25D40-rjt_25D2E
										dc.w sub_25D40-rjt_25D2E
										dc.w sub_25D40-rjt_25D2E

; =============== S U B R O U T I N E =======================================

sub_25D40:
										
										lea     (byte_FFDE60).l,a1
										move.b  $1E(a0),d2
										cmp.b   #$F,d2
										ble.s   loc_25D56
										lea     byte_2784C(pc), a2
										bra.s   loc_25D5A
loc_25D56:
										
										lea     unk_2786C(pc), a2
loc_25D5A:
										
										btst    #4,$1D(a0)
										beq.s   loc_25D64
										addq.b  #2,d2
loc_25D64:
										
										btst    #0,((byte_FFDEA0-$1000000)).w
										beq.s   loc_25D7A
										addq.b  #1,d2
										cmp.b   #$1E,d2
										ble.s   loc_25D76
										clr.w   d2
loc_25D76:
										
										move.b  d2,$1E(a0)
loc_25D7A:
										
										movea.l a2,a0
										moveq   #3,d7
loc_25D7E:
										
										move.w  (a0)+,d2
										add.w   d1,d2
										move.w  d2,(a1)+
										move.w  (a0)+,(a1)+
										move.w  (a0)+,(a1)
										or.w    d5,(a1)+
										move.w  (a0)+,d2
										add.w   d0,d2
										move.w  d2,(a1)+
										dbf     d7,loc_25D7E
										bra.w   loc_25DF0

	; End of function sub_25D40


; =============== S U B R O U T I N E =======================================

sub_25D98:
										
										clr.w   d6
										move.b  $11(a0),d6
										lea     (byte_FFDDF0).l,a1
										lea     unk_2788C(pc), a0
										movem.l d0-d1,-(sp)
										sub.w   d6,d1
										moveq   #8,d7
loc_25DB0:
										
										move.w  (a0)+,d2
										add.w   d1,d2
										move.w  d2,(a1)+
										move.w  (a0)+,(a1)+
										move.w  (a0)+,(a1)+
										move.w  (a0)+,d2
										add.w   d0,d2
										move.w  d2,(a1)+
										dbf     d7,loc_25DB0
										movem.l (sp)+,d0-d1
										sub.w   d6,d0
										btst    #0,((byte_FFDEA0-$1000000)).w
										bne.s   loc_25DD6
										move.w  #$180,d0
loc_25DD6:
										
										moveq   #8,d7
loc_25DD8:
										
										move.w  (a0)+,d2
										add.w   d1,d2
										move.w  d2,(a1)+
										move.w  (a0)+,(a1)+
										move.w  (a0)+,(a1)+
										move.w  (a0)+,d2
										add.w   d0,d2
										move.w  d2,(a1)+
										dbf     d7,loc_25DD8
										bra.w   *+4
loc_25DF0:
										
										movem.l (sp)+,d0-d2/d7-a2
										rts

	; End of function sub_25D98

specialSprites_Taros:
										incbin "sprites/specialsprites/taros.bin"
specialSprites_Kraken:
										incbin "sprites/specialsprites/kraken.bin"
specialSprites_NazcaShip:
										incbin "sprites/specialsprites/nazcaship.bin"
specialSprites_EvilSpirit:
										incbin "sprites/specialsprites/evilspirit.bin"
specialSprites_EvilSpiritAlt:
										incbin "sprites/specialsprites/evilspiritalt.bin"
specialSprites_Zeon:incbin "sprites/specialsprites/zeon.bin"
byte_2784C:         dc.b 0
										dc.b $5C 
										dc.b  $A
										dc.b $3D 
										dc.b $65
										dc.b $78 
										dc.b   0
										dc.b $74 
										dc.b   0
										dc.b $74 
										dc.b  $A
										dc.b $3E 
										dc.b $65 
										dc.b $81 
										dc.b   0
										dc.b $74 
										dc.b   0
										dc.b $5C 
										dc.b  $A
										dc.b $3F 
										dc.b $65 
										dc.b $8A 
										dc.b   0
										dc.b $8C 
										dc.b   0
										dc.b $74 
										dc.b  $A
										dc.b   0
										dc.b $65 
										dc.b $93 
										dc.b   0
										dc.b $8C 
unk_2786C:          dc.b   0
										dc.b $5C 
										dc.b  $A
										dc.b $3D 
										dc.b $65 
										dc.b $9C 
										dc.b   0
										dc.b $74 
										dc.b   0
										dc.b $74 
										dc.b  $A
										dc.b $3E 
										dc.b $65 
										dc.b $A5 
										dc.b   0
										dc.b $74 
										dc.b   0
										dc.b $5C 
										dc.b  $A
										dc.b $3F 
										dc.b $65 
										dc.b $AE 
										dc.b   0
										dc.b $8C 
										dc.b   0
										dc.b $74 
										dc.b  $A
										dc.b   0
										dc.b $65 
										dc.b $B7 
										dc.b   0
										dc.b $8C 
unk_2788C:          dc.b   0
										dc.b $60 
										dc.b  $A
										dc.b $38 
										dc.b $65 
										dc.b $1E
										dc.b   0
										dc.b $68 
										dc.b   0
										dc.b $78 
										dc.b  $A
										dc.b $39 
										dc.b $65 
										dc.b $27 
										dc.b   0
										dc.b $68 
										dc.b   0
										dc.b $90 
										dc.b  $A
										dc.b $3A 
										dc.b $65 
										dc.b $30 
										dc.b   0
										dc.b $68 
										dc.b   0
										dc.b $60 
										dc.b  $A
										dc.b $3B 
										dc.b $65 
										dc.b $39 
										dc.b   0
										dc.b $80 
										dc.b   0
										dc.b $78 
										dc.b  $A
										dc.b $3C 
										dc.b $65 
										dc.b $42 
										dc.b   0
										dc.b $80 
										dc.b   0
										dc.b $90 
										dc.b  $A
										dc.b $3D 
										dc.b $65 
										dc.b $4B 
										dc.b   0
										dc.b $80 
										dc.b   0
										dc.b $90 
										dc.b  $A
										dc.b $3E 
										dc.b $65 
										dc.b $54 
										dc.b   0
										dc.b $98 
										dc.b   0
										dc.b $78 
										dc.b  $A
										dc.b $3F 
										dc.b $65 
										dc.b $5D 
										dc.b   0
										dc.b $98 
										dc.b   0
										dc.b $90 
										dc.b  $A
										dc.b   0
										dc.b $65 
										dc.b $66 
										dc.b   0
										dc.b $98 
										dc.b   0
										dc.b $60 
										dc.b  $A
										dc.b $38 
										dc.b $65 
										dc.b $6F 
										dc.b   0
										dc.b $68 
										dc.b   0
										dc.b $78 
										dc.b  $A
										dc.b $39 
										dc.b $65 
										dc.b $78 
										dc.b   0
										dc.b $68 
										dc.b   0
										dc.b $90 
										dc.b  $A
										dc.b $3A 
										dc.b $65 
										dc.b $81 
										dc.b   0
										dc.b $68 
										dc.b   0
										dc.b $60 
										dc.b  $A
										dc.b $3B 
										dc.b $65 
										dc.b $8A 
										dc.b   0
										dc.b $80 
										dc.b   0
										dc.b $78 
										dc.b  $A
										dc.b $3C 
										dc.b $65 
										dc.b $93 
										dc.b   0
										dc.b $80 
										dc.b   0
										dc.b $90 
										dc.b  $A
										dc.b $3D 
										dc.b $65 
										dc.b $9C 
										dc.b   0
										dc.b $80 
										dc.b   0
										dc.b $90 
										dc.b  $A
										dc.b $3E 
										dc.b $65 
										dc.b $A5 
										dc.b 0
										dc.b $98 
										dc.b   0
										dc.b $78 
										dc.b  $A
										dc.b $3F 
										dc.b $65 
										dc.b $AE 
										dc.b   0
										dc.b $98 
										dc.b   0
										dc.b $90 
										dc.b  $A
										dc.b   0
										dc.b $65 
										dc.b $B7 
										dc.b   0
										dc.b $98 

; =============== S U B R O U T I N E =======================================

SuspendGame:
										
										moveq   #$3C,d0 
										jsr     (Sleep).w       
										movea.l (p_SuspendStringTiles).l,a0
										lea     (FF6802_LOADING_SPACE).l,a1
										move.l  a1,-(sp)
										jsr     (loadTileData).w
										movea.l (sp)+,a0
										lea     ($8000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgainbis).w
										jsr     (setFFDE94b3andWait).w
										movea.l (p_plt_SuspendString).l,a0
										lea     (Palette2bis).l,a1
										moveq   #$20,d7 
										jsr     (copyBytes).w   
										move.b  #1,((FADING_SETTING-$1000000)).w
										clr.w   ((word_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #2,((FADING_PALETTE_FLAGS-$1000000)).w
										moveq   #3,d0
										jsr     (Sleep).w       
										lea     (byte_FFC000).l,a0
										move.l  #$24002401,$5EC(a0)
										move.l  #$24022403,$5F0(a0)
										move.l  #$24042405,$5F4(a0)
										move.l  #$24062000,$5F8(a0)
										move.l  #$24072408,$62C(a0)
										move.l  #$2409240A,$630(a0)
										move.l  #$240B240C,$634(a0)
										move.l  #$240D2000,$638(a0)
										lea     ($C000).l,a1
										move.w  #$380,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgainbis).w
										jsr     (setFFDE94b3andWait).w
										rts

	; End of function SuspendGame


; =============== S U B R O U T I N E =======================================

; need to verify

endGame:
										bset    #7,(SAVE_FLAGS).l
										jsr     (disableDisplayAndVInt).w
										movea.l (p_witchEndTiles).l,a0
										lea     (FF6802_LOADING_SPACE).l,a1
										move.l  a1,-(sp)
										jsr     (loadTileData).w
										movea.l (sp)+,a0
										lea     ($2000).w,a1
										move.w  #$2000,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgain).w
										movea.l (p_witchEndLayout).l,a0
										lea     (byte_FFE000).l,a1
										move.w  #$800,d7
										jsr     (copyBytes).w   
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgain).w
										lea     (byte_FFC000).l,a0
										move.l  #$21382139,$21E(a0)
										move.l  #$21422143,$25E(a0)
										lea     ($C000).l,a1
										move.w  #$380,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgain).w
										movea.l (p_plt_WitchEnd).l,a0
										lea     (FFD080_Palette1bis).l,a1
										moveq   #$20,d7 
										jsr     (copyBytes).w   
										lea     $20(a1),a1
										jsr     (copyBytes).w   
										jsr     (enableDisplayAndInterrupts).w
										move.w  #$3C,d0 
										jsr     (Sleep).w       
										jsr     (fadeInFromWhite).w
										move.w  #$1E,((BLINK_COUNTER-$1000000)).w
										move.b  #$FF,((byte_FFB082-$1000000)).w
										trap    #9
										dc.w 1
										dc.l sub_27CA4
										move.w  #$46,((CURRENT_SPEAK_SOUND-$1000000)).w 
										trap    #5
										dc.w $EF
										trap    #5
										dc.w $FFFF
										move.w  #$5A,d0 
										jsr     (Sleep).w       
										move.b  #2,((FADING_SETTING-$1000000)).w
										clr.w   ((word_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #1,((FADING_PALETTE_FLAGS-$1000000)).w
										moveq   #$3C,d0 
										jsr     (Sleep).w       
										clr.b   ((byte_FFB082-$1000000)).w
										trap    #9
										dc.w 2
										dc.l sub_27CA4
										trap    #9
										dc.w 1
										dc.l vintFunc_vscrollThing
										moveq   #$1E,d0
										jsr     (Sleep).w       
										move.b  #2,((FADING_SETTING-$1000000)).w
										clr.w   ((word_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #2,((FADING_PALETTE_FLAGS-$1000000)).w
										moveq   #$3C,d0 
										jsr     (Sleep).w       
										trap    #9
										dc.w 2
										dc.l vintFunc_vscrollThing
										jsr     (disableDisplayAndVInt).w
										lea     (byte_FFC000).l,a0
										clr.l   $21E(a0)
										clr.l   $25E(a0)
										lea     ($C000).l,a1
										move.w  #$380,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgain).w
										movea.l (p_JewelEndScreenTiles).l,a0
										lea     (FF6802_LOADING_SPACE).l,a1
										move.l  a1,-(sp)
										jsr     (loadTileData).w
										movea.l (sp)+,a0
										lea     (loc_2000).w,a1
										move.w  #$2000,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgain).w
										movea.l (p_JewelEndScreenLayout).l,a0
										lea     (byte_FFE000).l,a1
										move.w  #$800,d7
										jsr     (copyBytes).w   
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgain).w
										movea.l (p_plt_JewelsEndScreen).l,a0
										lea     (FFD080_Palette1bis).l,a1
										moveq   #$40,d7 
										jsr     (copyBytes).w   
										jsr     (enableDisplayAndInterrupts).w
										move.b  #1,((FADING_SETTING-$1000000)).w
										clr.w   ((word_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #1,((FADING_PALETTE_FLAGS-$1000000)).w
										moveq   #$78,d0 
										jsr     (Sleep).w       
										move.w  #0,d0
										jsr     sub_27C64(pc)
										nop
										jsr     sub_27C64(pc)
										nop
										jsr     sub_27C64(pc)
										nop
										jsr     sub_27C64(pc)
										nop
										jsr     sub_27C64(pc)
										nop
										jsr     sub_27C64(pc)
										nop
										jsr     sub_27C64(pc)
										nop
										moveq   #$78,d0 
										jsr     (Sleep).w       
										move.b  #1,((FADING_SETTING-$1000000)).w
										clr.w   ((word_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #2,((FADING_PALETTE_FLAGS-$1000000)).w
										move.w  #$12C,d0
										jsr     (Sleep).w       
										trap    #0
										dc.w SOUND_COMMAND_FADE_OUT
										move.w  #$2A30,d0       ; wait for 3 minutes
										jsr     (Sleep).w       
										trap    #5
										dc.w $1D1
										trap    #5
										dc.w $FFFF
										move.b  #3,((FADING_COUNTER_MAX-$1000000)).w
										jsr     (fadeOutToBlack).w
										lea     (FFD080_Palette1bis).l,a0
										moveq   #$1F,d7
loc_27C2C:
										
										clr.l   (a0)+
										dbf     d7,loc_27C2C
										jsr     j_ClearEntities
										trap    #2
										bclr    d0,(a0)
										move.w  #$3F,d0 
										jsr     (GetNextBattleOnMap).w
										move.w  d7,d1
										bsr.w   ExecuteBattleLoop
										jsr     (fadeOutToWhite).w
										trap    #9
										dc.w 0
										jsr     (disableDisplayAndVInt).w
										move    #$2700,sr
										movea.l (initStack).w,sp
										movea.l (off_4).w,a0    
										jmp     (a0)            ; reset

	; End of function endGame


; =============== S U B R O U T I N E =======================================

sub_27C64:
										
										move.w  d0,-(sp)
										movea.l (p_JewelEndScreenLayout).l,a0
										lea     $700(a0),a0
										mulu.w  #$1E,d0
										add.w   d0,a0
										lea     (byte_FFE31C).l,a1
										move.w  #$503,d1
										jsr     (sub_7D28).w
										jsr     (sub_7D0C).w
										moveq   #4,d0
										jsr     (Sleep).w       
										move.w  (sp)+,d0
										addq.w  #1,d0
										rts

	; End of function sub_27C64


; =============== S U B R O U T I N E =======================================

vintFunc_vscrollThing:
										
										subq.w  #1,(FFD500_MaybeRelatedToVscroll).l
										jsr     (storeVdpCommandsbis).w
										jsr     (set_FFDE94_bit3).w
										rts

	; End of function vintFunc_vscrollThing


; =============== S U B R O U T I N E =======================================

sub_27CA4:
										
										link    a6,#-2
										tst.b   ((byte_FFB082-$1000000)).w
										beq.w   loc_27D6A
										clr.w   -2(a6)
										lea     ((BLINK_COUNTER-$1000000)).w,a2
										subq.w  #1,(a2)
										cmp.w   #3,(a2)
										bne.s   loc_27CDC
										movea.l (p_witchEndLayout).l,a0
										lea     $700(a0),a0
										lea     (byte_FFE0DC).l,a1
										move.w  #$403,d1
										jsr     (sub_7D28).w
										addq.w  #1,-2(a6)
loc_27CDC:
										
										tst.w   (a2)
										bne.s   loc_27D08
										movea.l (p_witchEndLayout).l,a0
										lea     $720(a0),a0
										lea     (byte_FFE0DC).l,a1
										move.w  #$403,d1
										jsr     (sub_7D28).w
										addq.w  #1,-2(a6)
										moveq   #$78,d6 
										jsr     (UpdateRandomSeed).w
										add.w   #$1E,d7
										move.w  d7,(a2)
loc_27D08:
										
										lea     ((word_FFB07C-$1000000)).w,a2
										tst.b   ((TYPEWRITING-$1000000)).w
										bne.s   loc_27D1A
										cmp.w   #5,(a2)
										ble.s   loc_27D42
										bra.s   loc_27D6A
loc_27D1A:
										
										subq.w  #1,(a2)
										cmp.w   #5,(a2)
										bne.s   loc_27D3E
										movea.l (p_witchEndLayout).l,a0
										lea     $718(a0),a0
										lea     (byte_FFE19C).l,a1
										move.w  #$401,d1
										jsr     (sub_7D28).w
										addq.w  #1,-2(a6)
loc_27D3E:
										
										tst.w   (a2)
										bne.s   loc_27D6A
loc_27D42:
										
										movea.l (p_witchEndLayout).l,a0
										lea     $738(a0),a0
										lea     (byte_FFE19C).l,a1
										move.w  #$401,d1
										jsr     (sub_7D28).w
										addq.w  #1,-2(a6)
										moveq   #5,d6
										jsr     (UpdateRandomSeed).w
										add.w   #$A,d7
										move.w  d7,(a2)
loc_27D6A:
										
										tst.w   -2(a6)
										beq.s   loc_27D8A
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$200,d0
										moveq   #2,d1
										jsr     (bwahDMAstuffAgainbis).w
										jsr     (set_FFDE94_bit3).w
loc_27D8A:
										
										unlk    a6
										rts

	; End of function sub_27CA4

										align $8000
