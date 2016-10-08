
; GAME SECTION 05 :
; Battle Engine, Special Sprites, Shop/Church/Blacksmith/Caravan engine, Battle Engine, Exploration Engine, Special Sprites

; FREE SPACE : 626 bytes.



; =============== S U B R O U T I N E =======================================

j_ShopActions:
										
										jmp     ShopMenuActions(pc)

	; End of function j_ShopActions


; =============== S U B R O U T I N E =======================================

j_ChurchActions:
										
										jmp     ChurchMenuActions(pc)

	; End of function j_ChurchActions


; =============== S U B R O U T I N E =======================================

j_MainMenuActions:
										
										jmp     MainMenuActions(pc)

	; End of function j_MainMenuActions


; =============== S U B R O U T I N E =======================================

j_BlacksmithActions:
										
										jmp     BlacksmithActions(pc)

	; End of function j_BlacksmithActions


; =============== S U B R O U T I N E =======================================

j_CaravanActions:
										
										jmp     CaravanMenuActions(pc)

	; End of function j_CaravanActions


; =============== S U B R O U T I N E =======================================

j_LevelUpCutscene:
										
										jmp     LevelUpCutscene(pc)

	; End of function j_LevelUpCutscene


; =============== S U B R O U T I N E =======================================

j_ExecuteExplorationLoop:
										
										jmp     ExecuteExplorationLoop(pc)

	; End of function j_ExecuteExplorationLoop


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
										
										jmp     SetUnitCursorDestinationToNextBattleEntity(pc)

	; End of function j_SetUnitCursorDestinationToNextBattleEntity


; =============== S U B R O U T I N E =======================================

j_SetCameraDestInTiles:
										
										jmp     SetCameraDestInTiles(pc)

	; End of function j_SetCameraDestInTiles


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
										
										jmp     GetEntityNumberOfCombatant(pc)

	; End of function j_GetEntityIndex


; =============== S U B R O U T I N E =======================================

j_FadeOut_WaitForP2Input:
										
										jmp     FadeOut_WaitForP1Input(pc)

	; End of function j_FadeOut_WaitForP2Input


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

j_EndGame:
										
										jmp     EndGame(pc)     

	; End of function j_EndGame


; =============== S U B R O U T I N E =======================================

j_SuspendGame:
										
										jmp     SuspendGame(pc)

	; End of function j_SuspendGame


; =============== S U B R O U T I N E =======================================

ShopMenuActions:
										
										movem.l d0-a5,-(sp)
										link    a6,#-$16
										moveq   #0,d1
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_2007A
										jsr     j_InitPortraitWindow
loc_2007A:
										
										trap    #TEXTBOX
										dc.w $9E                ; "What's up, boy!{N}We guarantee all items to{N}be in good condition!{D3}"
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_HidePortraitWindow
loc_20088:
										
										moveq   #0,d0
										moveq   #0,d1
										moveq   #6,d2
										lea     (InitStack).w,a0
										jsr     j_ExecuteMenu
										cmpi.w  #$FFFF,d0
										beq.s   loc_200A2
										bra.w   loc_200C6
loc_200A2:
										
										moveq   #0,d1
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_200B0
										jsr     j_InitPortraitWindow
loc_200B0:
										
										trap    #TEXTBOX
										dc.w $A1                ; "{CLEAR}Thank you!  Come again!{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_HidePortraitWindow
										unlk    a6
										movem.l (sp)+,d0-a5
										rts
loc_200C6:
										
										cmpi.w  #0,d0
										bne.w   loc_202CA
loc_200CE:
										
										trap    #TEXTBOX
										dc.w $A2                ; "What do you want to buy?"
										jsr     sub_207E6(pc)
										nop
										jsr     sub_1004C
										cmpi.w  #$FFFF,d0
										beq.w   loc_207CC
										move.w  d0,-$C(a6)
										move.w  d0,d1
										jsr     j_GetItemDefAddress
										move.w  6(a0),-4(a6)
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										clr.l   ((TEXT_NUMBER-$1000000)).w
										move.w  -4(a6),((word_FFB778-$1000000)).w
										trap    #TEXTBOX
										dc.w $A3                ; "The {ITEM} costs{N}{#} gold coins.{N}OK?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.s   loc_20120
loc_20118:
										
										trap    #TEXTBOX
										dc.w $A4                ; "{CLEAR}Oh...shucks!{W2}"
										bra.w   loc_202C2
loc_20120:
										
										jsr     j_GetGold
										move.l  d1,-8(a6)
										clr.l   d0
										move.w  -4(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_2013C
										trap    #TEXTBOX
										dc.w $A5                ; "You need more money to buy{N}it.{W2}"
										bra.w   loc_202C2
loc_2013C:
										
										trap    #TEXTBOX
										dc.w $A6                ; "Who gets it?{W2}"
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_UpdateForce
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										subq.b  #1,d7
loc_2015E:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_2015E
										trap    #TEXTBOX
										dc.w $FFFF
										move.w  -$C(a6),((word_FFB13A-$1000000)).w
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
										beq.s   loc_20118
										move.w  d0,-$A(a6)
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										cmpi.w  #4,d2
										bcs.s   loc_201AC
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $A8                ; "Oops!  {NAME}'s hands{N}are full!  To anybody else?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.s   loc_2013C
										bra.w   loc_20118
loc_201AC:
										
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmpi.w  #1,d2
										bne.s   loc_201E4
										move.w  -$C(a6),d1
										move.w  -$A(a6),d0
										jsr     j_IsWeaponOrRingEquippable
										bcs.s   loc_201E4
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $A7                ; "{NAME} can't be{N}equipped with it.  OK?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
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
										jsr     j_IsWeaponOrRingEquippable
										bcc.w   loc_202BE
										trap    #TEXTBOX
										dc.w $AD                ; "{CLEAR}Equip it now?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										bne.w   loc_202BE
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmpi.w  #1,d2
										bne.s   loc_2025E
										move.w  -$A(a6),d0
										jsr     j_GetEquippedWeapon
										cmpi.w  #$FFFF,d1
										beq.s   loc_2028A
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmpi.w  #2,d2
										bne.w   loc_2028A
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $B0                ; "{NAME} can't remove{N}the cursed equipment.{W2}"
										bra.s   loc_202BE
loc_2025E:
										
										move.w  -$A(a6),d0
										jsr     j_GetEquippedRing
										cmpi.w  #$FFFF,d1
										beq.s   loc_2028A
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmpi.w  #2,d2
										bne.w   loc_2028A
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $B0                ; "{NAME} can't remove{N}the cursed equipment.{W2}"
										bra.s   loc_202BE
loc_2028A:
										
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d2,d1
										subq.w  #1,d1
										jsr     j_EquipItem
										cmpi.w  #2,d2
										bne.s   loc_202B8
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM  ; cursed item
										jsr     WaitForMusicResumeAndPlayerInput_Shop(pc)
										nop
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $AF                ; "Gee, {NAME} gets{N}cursed.{W2}"
										bra.s   loc_202BC
loc_202B8:
										
										trap    #TEXTBOX
										dc.w $AE                ; "Ah, it suits you!{W2}"
loc_202BC:
										
										bra.s   loc_202C2
loc_202BE:
										
										trap    #TEXTBOX
										dc.w $A9                ; "{CLEAR}Here ya go!{N}Use it wisely!{W2}"
loc_202C2:
										
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_200CE
loc_202CA:
										
										cmpi.w  #1,d0
										bne.w   loc_20442
loc_202D2:
										
										trap    #TEXTBOX
										dc.w $B1                ; "Whose and which item do{N}you want to sell?{D3}"
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_UpdateForce
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										subq.b  #1,d7
loc_202F4:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_202F4
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #$7F,((word_FFB13A-$1000000)).w 
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
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
										andi.b  #ITEMTYPE_MASK_UNSELLABLE,d1
										cmpi.b  #0,d1
										beq.s   loc_20364
										trap    #TEXTBOX
										dc.w $B4                ; "{CLEAR}Sorry, I can't buy that....{W2}"
										bra.w   loc_2043A
loc_20364:
										
										move.l  -8(a6),((TEXT_NUMBER-$1000000)).w
										move.b  -$14(a6),d1
										andi.b  #ITEMTYPE_MASK_RARE,d1
										cmpi.b  #0,d1
										beq.s   loc_20384
										move.w  #1,-$16(a6)
										trap    #TEXTBOX
										dc.w $B7                ; "Wow, it's a rare bird.{N}I'll pay {#} gold coins{N}for it. OK?"
										bra.s   loc_20388
loc_20384:
										
										trap    #TEXTBOX
										dc.w $B2                ; "I'll pay {#} gold coins{N}for it, OK?"
loc_20388:
										
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.s   loc_2039C
										trap    #TEXTBOX
										dc.w $B3                ; "{CLEAR}Too bad.{W2}"
										bra.w   loc_2043A
loc_2039C:
										
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmpi.w  #1,d2
										bne.s   loc_203DC
										move.w  -$A(a6),d0
										jsr     j_GetEquippedWeapon
										cmpi.w  #$FFFF,d1
										beq.w   loc_2040C
										cmp.w   -$E(a6),d2
										bne.w   loc_2040C
										move.w  -$C(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_2040C
										trap    #TEXTBOX
										dc.w $B8                ; "OK, pass it to me...{D1}{N}{D1}Hey, it's cursed, isn't it?{W2}{N}I'm not such an easy mark!{W2}"
										bra.w   loc_2043A
loc_203DC:
										
										move.w  -$A(a6),d0
										jsr     j_GetEquippedRing
										cmpi.w  #$FFFF,d1
										beq.w   loc_2040C
										cmp.w   -$E(a6),d2
										bne.w   loc_2040C
										move.w  -$C(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_2040C
										trap    #TEXTBOX
										dc.w $B8                ; "OK, pass it to me...{D1}{N}{D1}Hey, it's cursed, isn't it?{W2}{N}I'm not such an easy mark!{W2}"
										bra.w   loc_2043A
loc_2040C:
										
										move.l  -8(a6),d1
										jsr     j_IncreaseGold
										move.w  -$A(a6),d0
										move.w  -$E(a6),d1
										jsr     j_DropItemBySlot
										cmpi.w  #0,-$16(a6)
										beq.s   loc_20436
										move.w  -$C(a6),d1
										jsr     j_AddItemToDeals
loc_20436:
										
										trap    #TEXTBOX
										dc.w $B5                ; "{CLEAR}Yeah, I got it.{W2}"
loc_2043A:
										
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_202D2
loc_20442:
										
										cmpi.w  #2,d0
										bne.w   loc_205B4
loc_2044A:
										
										trap    #TEXTBOX
										dc.w $BA                ; "Whose and which item{N}should I repair?{D1}"
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_UpdateForce
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										subq.b  #1,d7
loc_2046C:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_2046C
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #$7F,((word_FFB13A-$1000000)).w 
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
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
										trap    #TEXTBOX
										dc.w $BC                ; "It's not damaged.{W2}"
										bra.w   loc_205AC
loc_204DC:
										
										clr.l   ((TEXT_NUMBER-$1000000)).w
										move.w  -4(a6),((word_FFB778-$1000000)).w
										trap    #TEXTBOX
										dc.w $BB                ; "{CLEAR}Will you pay {#} gold{N}coins to repair it?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.s   loc_204FE
										trap    #TEXTBOX
										dc.w $B3                ; "{CLEAR}Too bad.{W2}"
										bra.w   loc_205AC
loc_204FE:
										
										jsr     j_GetGold
										move.l  d1,-8(a6)
										clr.l   d0
										move.w  -4(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_2051A
										trap    #TEXTBOX
										dc.w $BD                ; "You don't have enough{N}money...{W2}"
										bra.w   loc_205AC
loc_2051A:
										
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmpi.w  #1,d2
										bne.s   loc_2055A
										move.w  -$A(a6),d0
										jsr     j_GetEquippedWeapon
										cmpi.w  #$FFFF,d1
										beq.w   loc_2058A
										cmp.w   -$E(a6),d2
										bne.w   loc_2058A
										move.w  -$C(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_2058A
										trap    #TEXTBOX
										dc.w $BE                ; "Sorry, I don't repair cursed{N}items.{N}Let sleeping devils lie.{W2}"
										bra.w   loc_205AC
loc_2055A:
										
										move.w  -$A(a6),d0
										jsr     j_GetEquippedRing
										cmpi.w  #$FFFF,d1
										beq.w   loc_2058A
										cmp.w   -$E(a6),d2
										bne.w   loc_2058A
										move.w  -$C(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_2058A
										trap    #TEXTBOX
										dc.w $BE                ; "Sorry, I don't repair cursed{N}items.{N}Let sleeping devils lie.{W2}"
										bra.w   loc_205AC
loc_2058A:
										
										moveq   #0,d1
										move.w  -4(a6),d1
										jsr     j_DecreaseGold
										move.w  -$A(a6),d0
										move.w  -$E(a6),d1
										jsr     j_RepairItemBySlot
										trap    #TEXTBOX
										dc.w $BF                ; "{CLEAR}OK, one moment please!{W2}"
										trap    #TEXTBOX
										dc.w $C0                ; "{CLEAR}Here you go!{N}Beautiful, huh?{W2}"
loc_205AC:
										
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_2044A
loc_205B4:
										
										jsr     DetermineDealsItemsNotInCurrentShop(pc)
										nop
										tst.w   ((word_FFB12E-$1000000)).w
										bne.s   loc_205C8
										trap    #TEXTBOX
										dc.w $AC                ; "I'm very sorry!{N}I'm out of stock!{W2}"
										bra.w   loc_207CC
loc_205C8:
										
										trap    #TEXTBOX
										dc.w $AB                ; "You must be surprised!{D1}{N}What would you like?"
										jsr     sub_1004C
										cmpi.w  #$FFFF,d0
										beq.w   loc_207CC
										move.w  d0,-$C(a6)
										move.w  d0,d1
										jsr     j_GetItemDefAddress
										move.w  6(a0),-4(a6)
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										clr.l   ((TEXT_NUMBER-$1000000)).w
										move.w  -4(a6),((word_FFB778-$1000000)).w
										trap    #TEXTBOX
										dc.w $A3                ; "The {ITEM} costs{N}{#} gold coins.{N}OK?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.s   loc_20614
loc_2060C:
										
										trap    #TEXTBOX
										dc.w $A4                ; "{CLEAR}Oh...shucks!{W2}"
										bra.w   loc_207C4
loc_20614:
										
										jsr     j_GetGold
										move.l  d1,-8(a6)
										clr.l   d0
										move.w  -4(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_20630
										trap    #TEXTBOX
										dc.w $A5                ; "You need more money to buy{N}it.{W2}"
										bra.w   loc_207C4
loc_20630:
										
										trap    #TEXTBOX
										dc.w $A6                ; "Who gets it?{W2}"
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_UpdateForce
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										subq.b  #1,d7
loc_20652:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_20652
										trap    #TEXTBOX
										dc.w $FFFF
										move.w  -$C(a6),((word_FFB13A-$1000000)).w
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
										beq.s   loc_2060C
										move.w  d0,-$A(a6)
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										cmpi.w  #4,d2
										bcs.s   loc_206A0
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $A8                ; "Oops!  {NAME}'s hands{N}are full!  To anybody else?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.s   loc_20630
										bra.w   loc_2060C
loc_206A0:
										
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmpi.w  #1,d2
										bne.s   loc_206D8
										move.w  -$C(a6),d1
										move.w  -$A(a6),d0
										jsr     j_IsWeaponOrRingEquippable
										bcs.s   loc_206D8
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $A7                ; "{NAME} can't be{N}equipped with it.  OK?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
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
										jsr     j_IsWeaponOrRingEquippable
										bcc.w   loc_207C0
										trap    #TEXTBOX
										dc.w $AD                ; "{CLEAR}Equip it now?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										bne.w   loc_207C0
										move.w  -$C(a6),d1
										jsr     j_GetItemType
										cmpi.w  #1,d2
										bne.s   loc_2075C
										move.w  -$A(a6),d0
										jsr     j_GetEquippedWeapon
										cmpi.w  #$FFFF,d1
										beq.s   loc_20788
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmpi.w  #2,d2
										bne.w   loc_20788
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $B0                ; "{NAME} can't remove{N}the cursed equipment.{W2}"
										bra.s   loc_207C0
loc_2075C:
										
										move.w  -$A(a6),d0
										jsr     j_GetEquippedRing
										cmpi.w  #$FFFF,d1
										beq.s   loc_20788
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmpi.w  #2,d2
										bne.w   loc_20788
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $B0                ; "{NAME} can't remove{N}the cursed equipment.{W2}"
										bra.s   loc_207C0
loc_20788:
										
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d2,d1
										subq.w  #1,d1
										jsr     j_EquipItem
										cmpi.w  #2,d2
										bne.s   loc_207BA
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										jsr     WaitForMusicResumeAndPlayerInput_Shop(pc)
										nop
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $AF                ; "Gee, {NAME} gets{N}cursed.{W2}"
										trap    #TEXTBOX
										dc.w $FFFF
										bra.s   loc_207BE
loc_207BA:
										
										trap    #TEXTBOX
										dc.w $AE                ; "Ah, it suits you!{W2}"
loc_207BE:
										
										bra.s   loc_207C4
loc_207C0:
										
										trap    #TEXTBOX
										dc.w $A9                ; "{CLEAR}Here ya go!{N}Use it wisely!{W2}"
loc_207C4:
										
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_205B4
loc_207CC:
										
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_20088

	; End of function ShopMenuActions


; =============== S U B R O U T I N E =======================================

WaitForMusicResumeAndPlayerInput_Shop:
										
										move.w  d0,-(sp)
										move.w  #$FB,d0 
										jsr     (PlayMusicAfterCurrentOne).w
										jsr     (WaitForPlayerInput).w
										move.w  (sp)+,d0
										rts

	; End of function WaitForMusicResumeAndPlayerInput_Shop


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
										lea     ShopItems(pc), a0
										clr.w   d7
										move.b  (CURRENT_SHOP_INDEX).l,d7
										subq.b  #1,d7
										bcs.w   loc_20872
										clr.w   d0
loc_2086A:
										
										move.b  (a0)+,d0
										adda.w  d0,a0
										dbf     d7,loc_2086A
loc_20872:
										
										movem.l (sp)+,d0/d7
										rts

	; End of function GetCurrentShopDefAddress

ShopItems:          incbin "data/items/shopitems.bin"

; =============== S U B R O U T I N E =======================================

ChurchMenuActions:
										
										movem.l d0-a5,-(sp)
										link    a6,#-$24
										moveq   #0,d1
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_20A18
										jsr     j_InitPortraitWindow
loc_20A18:
										
										trap    #TEXTBOX
										dc.w $6E                ; "Welcome!{W2}{N}Your desire will be fulfilled!{W2}"
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_HidePortraitWindow
loc_20A26:
										
										moveq   #0,d0
										moveq   #0,d1
										moveq   #5,d2
										lea     (InitStack).w,a0
										jsr     j_ExecuteMenu
										cmpi.w  #$FFFF,d0
										beq.s   loc_20A40
										bra.w   loc_20A64
loc_20A40:
										
										moveq   #0,d1
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_20A4E
										jsr     j_InitPortraitWindow
loc_20A4E:
										
										trap    #TEXTBOX
										dc.w $71                ; "{CLEAR}Be careful.  The light{N}is always on your side.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_HidePortraitWindow
										unlk    a6
										movem.l (sp)+,d0-a5
										rts
loc_20A64:
										
										cmpi.w  #0,d0
										bne.w   loc_20B58
										trap    #TEXTBOX
										dc.w $76                ; "Let me investigate all{N}of you.{W2}"
										bsr.w   Church_GetCurrentForceMemberInfo
										clr.w   -$E(a6)
loc_20A78:
										
										clr.w   d0
										move.b  (a0)+,d0
										move.w  d0,-$C(a6)
										jsr     j_GetCurrentHP
										tst.w   d1
										bhi.w   loc_20B42
										addi.w  #1,-$E(a6)
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $81                ; "Gosh!  {NAME} is{N}exhausted!{W2}"
										jsr     j_GetCurrentLevel
										mulu.w  #$A,d1
										move.l  d1,-8(a6)
										jsr     j_GetClass      
										move.w  #0,d2
										bsr.w   sub_210D0
										cmpi.w  #0,-$24(a6)
										beq.w   loc_20AC8
										addi.l  #$C8,-8(a6) 
loc_20AC8:
										
										move.l  -8(a6),((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $82                ; "But I can recall the soul.{W2}{N}It will cost {#} gold{N}coins.  OK?"
										jsr     sub_10050
										jsr     j_YesNoChoiceBox
										jsr     sub_10058
										cmpi.w  #0,d0
										beq.w   loc_20AF4
										trap    #TEXTBOX
										dc.w $7C                ; "You don't need my help?{W2}"
										bra.w   loc_20B42
loc_20AF4:
										
										jsr     j_GetGold
										move.l  d1,-4(a6)
										move.l  -8(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_20B0C
										trap    #TEXTBOX
										dc.w $7D                ; "You can't afford it?!{N}What a pity....{W2}"
										bra.s   loc_20B42
loc_20B0C:
										
										moveq   #0,d1
										move.l  -8(a6),d1
										jsr     j_DecreaseGold
										move.w  -$C(a6),d0
										move.w  #$C8,d1 
										jsr     j_IncreaseCurrentHP
										trap    #SOUND_COMMAND
										dc.w MUSIC_REVIVE
										jsr     WaitForMusicResumeAndPlayerInput(pc)
										nop
										move.w  -$C(a6),d0
										bsr.w   sub_2124A
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $83                ; "{NAME} is revived!{W2}"
loc_20B42:
										
										dbf     d7,loc_20A78
										cmpi.w  #0,-$E(a6)
										bne.w   loc_21028
										trap    #TEXTBOX
										dc.w $80                ; "Nobody is dead.{W2}"
										bra.w   loc_21028
loc_20B58:
										
										cmpi.w  #1,d0
										bne.w   loc_20D3A
										trap    #TEXTBOX
										dc.w $76                ; "Let me investigate all{N}of you.{W2}"
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
										andi.w  #2,d3
										beq.w   loc_20C24
										addi.w  #1,-$10(a6)
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $79                ; "Gosh!  {NAME} is{N}poisoned!{W2}"
										move.l  #$A,-8(a6)
										move.l  -8(a6),((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $7B                ; "But I can treat you.{N}It will cost {#} gold{N}coins.  OK?"
										jsr     sub_10050
										jsr     j_YesNoChoiceBox
										jsr     sub_10058
										cmpi.w  #0,d0
										beq.w   loc_20BDA
										trap    #TEXTBOX
										dc.w $7C                ; "You don't need my help?{W2}"
										bra.w   loc_20C24
loc_20BDA:
										
										jsr     j_GetGold
										move.l  d1,-4(a6)
										move.l  -8(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_20BF4
										trap    #TEXTBOX
										dc.w $7D                ; "You can't afford it?!{N}What a pity....{W2}"
										clr.w   d7
										bra.s   loc_20C24
loc_20BF4:
										
										moveq   #0,d1
										move.l  -8(a6),d1
										jsr     j_DecreaseGold
										move.w  -$C(a6),d0
										move.w  d2,d1
										andi.w  #$FFFD,d1
										jsr     j_SetStatus
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURE
										jsr     WaitForMusicResumeAndPlayerInput(pc)
										nop
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $7E                ; "{NAME} is no longer{N}poisoned.{W2}"
loc_20C24:
										
										movem.l (sp)+,a0
										dbf     d7,loc_20B74
										cmpi.w  #0,-$10(a6)
										bne.w   loc_20C3A
										trap    #TEXTBOX
										dc.w $77                ; "Nobody is poisoned.{W2}"
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
										andi.w  #4,d2
										beq.w   loc_20D20
										addi.w  #1,-$12(a6)
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $7A                ; "Gosh!  {NAME} is{N}cursed!{W2}"
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d2,-$14(a6)
										move.w  -$14(a6),d6
										subq.b  #1,d6
										clr.l   d3
loc_20C86:
										
										move.w  d6,d1
										jsr     j_GetItemAndNumberOfItems
										jsr     j_IsItemCursed
										bcc.w   loc_20CA8
										jsr     j_GetItemDefAddress
										clr.l   d4
										move.w  6(a0),d4
										lsr.w   #2,d4
										add.l   d4,d3
loc_20CA8:
										
										dbf     d6,loc_20C86
										move.l  d3,-8(a6)
										move.l  -8(a6),((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $7B                ; "But I can treat you.{N}It will cost {#} gold{N}coins.  OK?"
										jsr     sub_10050
										jsr     j_YesNoChoiceBox
										jsr     sub_10058
										cmpi.w  #0,d0
										beq.w   loc_20CDC
										trap    #TEXTBOX
										dc.w $7C                ; "You don't need my help?{W2}"
										bra.w   loc_20D20
loc_20CDC:
										
										jsr     j_GetGold
										move.l  d1,-4(a6)
										move.l  -8(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_20CF6
										trap    #TEXTBOX
										dc.w $7D                ; "You can't afford it?!{N}What a pity....{W2}"
										clr.w   d7
										bra.s   loc_20D20
loc_20CF6:
										
										moveq   #0,d1
										move.l  -8(a6),d1
										jsr     j_DecreaseGold
										move.w  -$C(a6),d0
										jsr     j_UnequipAllItemsIfNotCursed
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURE
										jsr     WaitForMusicResumeAndPlayerInput(pc)
										nop
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $7F                ; "{NAME} is no longer{N}cursed.{W2}"
loc_20D20:
										
										movem.l (sp)+,a0
										dbf     d7,loc_20C42
										cmpi.w  #0,-$12(a6)
										bne.w   loc_21028
										trap    #TEXTBOX
										dc.w $78                ; "Nobody is cursed.{W2}"
										bra.w   loc_21028
loc_20D3A:
										
										cmpi.w  #2,d0
										bne.w   loc_20FCC
										trap    #TEXTBOX
										dc.w $76                ; "Let me investigate all{N}of you.{W2}"
										bsr.w   sub_21072
										cmpi.w  #0,-$16(a6)
										bne.w   loc_20D5C
										trap    #TEXTBOX
										dc.w $87                ; "{CLEAR}Well, nobody can be{N}promoted now.{W2}"
										bra.w   loc_21028
loc_20D5C:
										
										trap    #TEXTBOX
										dc.w $88                ; "{CLEAR}Who do you want to{N}promote?{W2}"
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10040
										cmpi.w  #$FFFF,d0
										bne.w   loc_20D80
										trap    #TEXTBOX
										dc.w $89                ; "Oh, I'm wrong.{W2}"
										bra.w   loc_21028
loc_20D80:
										
										move.w  d0,-$C(a6)
										jsr     j_GetClass      
										move.w  d1,-$1A(a6)
										move.w  #0,d2
										bsr.w   sub_210D0
										cmpi.w  #0,-$24(a6)
										beq.w   loc_20DAE
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $8E                ; "Hmmm...{D1} {NAME} had{N}better remain the current{N}class.{W2}"
										bra.w   loc_20FC8
loc_20DAE:
										
										jsr     j_GetCurrentLevel
										cmpi.w  #$14,d1
										bcc.w   loc_20DCA
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $8A                ; "Hmmm...{NAME} needs{N}more experience!{W2}"
										bra.w   loc_20FC8
loc_20DCA:
										
										clr.w   -$1C(a6)
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $8B                ; "{NAME} wants to be{N}promoted to the a fighting{N}class, right?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.w   loc_20DEE
										trap    #TEXTBOX
										dc.w $89                ; "Oh, I'm wrong.{W2}"
										bra.w   loc_20FC8
loc_20DEE:
										
										move.w  -$1A(a6),d1
										move.w  #2,d2
										bsr.w   sub_210D0
										cmpi.w  #0,-$24(a6)
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
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d6
										subq.w  #1,d6
loc_20E2A:
										
										move.b  (a0)+,d0
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmpi.w  #0,d2
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
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -$1E(a6),((TEXT_NAME_INDEX_3-$1000000)).w
										move.w  -$1C(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $8F                ; "{NAME} can be promoted{N}to {CLASS} with the{N}{ITEM}.{W2}"
										trap    #TEXTBOX
										dc.w $93                ; "OK?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.w   loc_20EB6
										trap    #TEXTBOX
										dc.w $90                ; "Then"
										bra.w   loc_20EEA
loc_20EB6:
										
										cmpi.w  #CLASSIDX_SORC,-$1C(a6)
										bne.w   loc_20ED8
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $91                ; "{NAME} loses all spells{N}that were learned.{N}OK?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
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
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -$1C(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $92                ; "{NAME} can be promoted{N}to {CLASS}.{N}OK?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										bne.w   loc_20FC8
loc_20F30:
										
										move.w  -$1A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -$C(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										move.w  -$1C(a6),((TEXT_NAME_INDEX_3-$1000000)).w
										trap    #TEXTBOX
										dc.w $8C                ; "Now, let me conduct the{N}rite.{D1}  The light blesses...{N}{D1}{CLASS} {NAME}...{W2}{N}with a class of {CLASS}!{W2}"
										move.w  -$C(a6),d0
										move.w  -$1C(a6),d1
										jsr     j_SetClass
										jsr     j_Promote
										cmpi.w  #CLASSIDX_SORC,-$1C(a6)
										bne.s   loc_20F66
										bsr.w   ReplaceSpellsWithSORCDefaults
loc_20F66:
										
										cmpi.w  #CLASSIDX_MMNK,-$1C(a6)
										beq.s   loc_20F7A       
										cmpi.w  #CLASSIDX_NINJ,-$1C(a6)
										beq.s   loc_20F7A       
										bra.w   loc_20F90
loc_20F7A:
										
										move.w  -$C(a6),d0      ; new class uses a different type of weapon, so unequip weapon
										jsr     j_GetEquippedWeapon
										cmpi.w  #$FFFF,d1
										beq.s   loc_20F90
										jsr     j_UnequipWeapon
loc_20F90:
										
										trap    #SOUND_COMMAND
										dc.w MUSIC_PROMOTION
										jsr     WaitForMusicResumeAndPlayerInput(pc)
										nop
										move.w  -$C(a6),d0
										bsr.w   sub_2124A
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -$1C(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $8D                ; "{NAME} was successfully{N}promoted to {CLASS}.{W2}"
										move.w  -$C(a6),d0
										move.b  #1,d1
										jsr     j_SetLevel
										clr.w   d1
										jsr     j_SetCurrentEXP
loc_20FC8:
										
										bra.w   loc_20D5C
loc_20FCC:
										
										trap    #TEXTBOX
										dc.w $72                ; "May I record your adventure{N}now?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.w   loc_20FE6
										trap    #TEXTBOX
										dc.w $7C                ; "You don't need my help?{W2}"
										bra.w   loc_21028
loc_20FE6:
										
										move.b  ((CURRENT_MAP-$1000000)).w,((EGRESS_MAP_INDEX-$1000000)).w
										move.w  ((SAVE_SLOT_BEING_USED-$1000000)).w,d0
										trap    #SET_FLAG
										dc.w $18F               ; set after first battle's cutscene OR first save? Checked at witch screens
										jsr     (SaveGame).w
										trap    #SOUND_COMMAND
										dc.w MUSIC_SAVE         ; save jingle
										jsr     WaitForMusicResumeAndPlayerInput(pc)
										nop
										trap    #TEXTBOX
										dc.w $73                ; "{CLEAR}The light allows you to{N}resume your adventure!{W1}"
										trap    #TEXTBOX
										dc.w $74                ; "{CLEAR}Will you continue your{N}adventure?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.w   loc_20A40
										trap    #TEXTBOX
										dc.w $75                ; "{CLEAR}Then, take a rest before{N}you continue.{W1}"
										jsr     (FadeOutToBlack).w
										jmp     (WitchSuspend).w
										bra.w   *+4
loc_21028:
										
										trap    #TEXTBOX
										dc.w $FFFF
										trap    #TEXTBOX
										dc.w $70                ; "{CLEAR}Do you have another desire?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										bne.w   loc_20A40
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_20A26

	; End of function ChurchMenuActions

Promotions:         incbin "data/allies/promotions.bin"

; =============== S U B R O U T I N E =======================================

sub_21072:
										
										movem.l d7-a1,-(sp)
										jsr     j_UpdateForce
										clr.w   -$16(a6)
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										subq.b  #1,d7
loc_21094:
										
										clr.w   d0
										move.b  (a0),d0
										jsr     j_GetClass      
										move.w  #0,d2
										bsr.w   sub_210D0
										cmpi.w  #0,-$24(a6)
										bne.w   loc_210C4
										jsr     j_GetCurrentLevel
										cmpi.w  #$14,d1
										bcs.w   loc_210C4
										addi.w  #1,-$16(a6)
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
										lea     Promotions(pc), a0
										move.w  d2,d6
										subq.w  #1,d6
										bcs.w   loc_21126
										clr.w   d0
loc_2111E:
										
										move.b  (a0)+,d0
										adda.w  d0,a0
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
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,-$A(a6)
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
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
										andi.w  #1,d3
										beq.w   loc_21220
										addi.w  #1,-$18(a6)
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $84                ; "Gosh!  {NAME} is{N}paralyzed.{W2}"
										move.l  #$14,-8(a6)
										move.l  -8(a6),((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $7B                ; "But I can treat you.{N}It will cost {#} gold{N}coins.  OK?"
										jsr     sub_10050
										jsr     j_YesNoChoiceBox
										jsr     sub_10058
										cmpi.w  #0,d0
										beq.w   loc_211D6
										trap    #TEXTBOX
										dc.w $7C                ; "You don't need my help?{W2}"
										bra.w   loc_21220
loc_211D6:
										
										jsr     j_GetGold
										move.l  d1,-4(a6)
										move.l  -8(a6),d0
										cmp.l   d0,d1
										bcc.s   loc_211F0
										trap    #TEXTBOX
										dc.w $7D                ; "You can't afford it?!{N}What a pity....{W2}"
										clr.w   d7
										bra.s   loc_21220
loc_211F0:
										
										moveq   #0,d1
										move.l  -8(a6),d1
										jsr     j_DecreaseGold
										move.w  -$C(a6),d0
										move.w  d2,d1
										andi.w  #$FFFE,d1
										jsr     j_SetStatus
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURE
										jsr     WaitForMusicResumeAndPlayerInput(pc)
										nop
										move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $85                ; "{NAME} is no longer{N}paralyzed.{W2}"
loc_21220:
										
										movem.l (sp)+,a0
										dbf     d7,loc_21170
										cmpi.w  #0,-$18(a6)
										bne.w   return_21236
										trap    #TEXTBOX
										dc.w $86                ; "Nobody is paralyzed.{W2}"
return_21236:
										
										rts

	; End of function ChurchCure


; =============== S U B R O U T I N E =======================================

WaitForMusicResumeAndPlayerInput:
										
										move.w  d0,-(sp)
										move.w  #$FB,d0 
										jsr     (PlayMusicAfterCurrentOne).w
										jsr     (WaitForPlayerInput).w
										move.w  (sp)+,d0
										rts

	; End of function WaitForMusicResumeAndPlayerInput


; =============== S U B R O U T I N E =======================================

sub_2124A:
										
										cmpi.b  #$1E,d0
										bhi.s   return_2127C
										movem.l d0-d4/a0,-(sp)
										move.w  d0,d1
										jsr     j_GetCharacterSpriteIdx
										move.w  d4,d3
										tst.b   d1
										beq.w   loc_2126C
										bsr.w   GetEntityNumberOfCombatant
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

MainMenuActions:
										
										movem.l d0-a5,-(sp)
										link    a6,#-$20
loc_21286:
										
										moveq   #0,d0
										moveq   #0,d1
										moveq   #0,d2
										lea     (InitStack).w,a0
										jsr     j_ExecuteMenu
										cmpi.w  #$FFFF,d0
										beq.s   loc_212A0
										bra.w   loc_212A8
loc_212A0:
										
										unlk    a6
										movem.l (sp)+,d0-a5
										rts
loc_212A8:
										
										cmpi.w  #0,d0
										bne.w   loc_212D8
										bsr.w   sub_219EC       
										trap    #TEXTBOX
										dc.w $FFFF
loc_212B8:
										
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10040
										cmpi.w  #$FFFF,d0
										beq.w   loc_212D4
										jsr     j_MemberStatsScreen
										bra.s   loc_212B8
loc_212D4:
										
										bra.w   loc_219E8
loc_212D8:
										
										cmpi.w  #1,d0
										bne.w   loc_2147C
loc_212E0:
										
										bsr.w   sub_219EC       
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10048
										cmpi.w  #$FFFF,d0
										beq.w   loc_21478
										move.w  d0,-4(a6)
										move.w  d1,-$1A(a6)
										move.w  d1,-$1C(a6)
										andi.w  #$3F,-$1C(a6) 
										clr.l   -$20(a6)
										lsr.l   #6,d1
										addq.l  #1,d1
										move.l  d1,-$20(a6)
										cmpi.w  #2,-$1C(a6)
										beq.w   loc_213A8
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -$1C(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										move.l  -$20(a6),((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $F3                ; "{NAME} cast{N}{SPELL} level {#}!"
										trap    #SOUND_COMMAND
										dc.w SFX_SPELL_CAST
										trap    #TEXTBOX
										dc.w $FFFF
										cmpi.w  #$A,-$1C(a6)
										beq.w   loc_21354
loc_21348:
										
										trap    #TEXTBOX
										dc.w $138               ; "But nothing happened."
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_21478
loc_21354:
										
										clr.w   d0
										move.b  ((CURRENT_MAP-$1000000)).w,d0
										cmpi.w  #$42,d0 
										blt.s   loc_21348
										cmpi.w  #$4E,d0 
										bgt.s   loc_21348
loc_21366:
										
										move.b  -$1A(a6),d1
										jsr     j_GetSpellDefAddress
										move.b  1(a0),d1
										move.w  -4(a6),d0
										jsr     j_DecreaseCurrentMP
										jsr     j_ExecuteFlashScreenScript
										move.b  ((EGRESS_MAP_INDEX-$1000000)).w,d0
										jsr     (GetEgressPositionForMap).w
										lea     ((MAP_EVENT_TYPE-$1000000)).w,a0
										move.w  #1,(a0)+
										move.b  #0,(a0)+
										move.b  d0,(a0)+
										move.b  d1,(a0)+
										move.b  d2,(a0)+
										move.b  d3,(a0)+
										clr.b   ((PLAYER_TYPE-$1000000)).w
										bra.w   loc_212A0
loc_213A8:
										
										trap    #TEXTBOX
										dc.w $6C                ; "Use magic on whom?{D1}"
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  #0,((byte_FFB13C-$1000000)).w
										move.w  #$7F,((word_FFB13A-$1000000)).w 
										jsr     sub_10044
										move.w  d0,-6(a6)
										cmpi.w  #$FFFF,d0
										beq.w   loc_212E0
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -$1C(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										move.l  -$20(a6),((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX        ; {NAME} cast{N}{SPELL} level {#}!
										dc.w $F3                ; "{NAME} cast{N}{SPELL} level {#}!"
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  -$1A(a6),d1
										jsr     j_GetSpellDefAddress
										move.b  1(a0),d1
										move.w  -4(a6),d0
										jsr     j_DecreaseCurrentMP
										move.w  -6(a6),d0
										jsr     j_GetStatus
										moveq   #0,d2
										cmpi.l  #1,-$20(a6)
										beq.w   loc_2144E
										cmpi.l  #2,-$20(a6)
										beq.w   loc_2143C
										bclr    #2,d1
										beq.s   loc_2143C
										move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $12F               ; "{NAME} is no longer{N}cursed."
										moveq   #$FFFFFFFF,d2
										jsr     j_UnequipAllItemsIfNotCursed
loc_2143C:
										
										bclr    #0,d1
										beq.s   loc_2144E
										move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $12E               ; "{NAME} is no longer{N}stunned."
										moveq   #$FFFFFFFF,d2
loc_2144E:
										
										bclr    #1,d1
										beq.s   loc_21460
										move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $12D               ; "{NAME} is no longer{N}poisoned."
										moveq   #$FFFFFFFF,d2
loc_21460:
										
										tst.w   d2
										bne.s   loc_21468
										trap    #TEXTBOX
										dc.w $1A6               ; "But nothing happened.{D1}"
loc_21468:
										
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_SetStatus
										jsr     j_ApplyStatusAndItemsOnStats
loc_21478:
										
										bra.w   loc_219E8
loc_2147C:
										
										cmpi.w  #2,d0
										bne.w   loc_219DC
loc_21484:
										
										moveq   #0,d0
										moveq   #0,d1
										moveq   #3,d2
										lea     (InitStack).w,a0
										jsr     j_ExecuteMenu
										cmpi.w  #$FFFF,d0
										beq.w   loc_21286
										cmpi.w  #0,d0
										bne.w   loc_21596
loc_214A4:
										
										bsr.w   sub_219EC       
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #$7F,((word_FFB13A-$1000000)).w 
										jsr     sub_10044
										move.w  d0,-4(a6)
										move.w  d1,-$C(a6)
										move.w  d2,-8(a6)
										cmpi.w  #$FFFF,d0
										beq.w   loc_2158E
										cmpi.w  #4,d2
										bne.w   loc_2150E
										clr.w   d0
										move.b  ((CURRENT_MAP-$1000000)).w,d0
										cmpi.w  #$42,d0 
										blt.w   loc_2150E
										cmpi.w  #$4E,d0 
										bgt.w   loc_2150E
										move.w  -4(a6),d0
										move.w  -$C(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -8(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $49                ; "{NAME} used the{N}{ITEM}.{W2}"
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
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -8(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $49                ; "{NAME} used the{N}{ITEM}.{W2}"
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $1A6               ; "But nothing happened.{D1}"
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_2158E
loc_21558:
										
										move.w  -8(a6),d1
										move.w  #$32,d1 
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10040
										cmpi.w  #$FFFF,d0
										beq.w   loc_214A4
										move.w  -8(a6),d1
										bsr.w   UseFieldItem    
										move.w  -4(a6),d0
										move.w  -$C(a6),d1
										jsr     j_RemoveItemBySlot
loc_2158E:
										
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_219D8
loc_21596:
										
										cmpi.w  #1,d0
										bne.w   loc_21856
loc_2159E:
										
										bsr.w   sub_219EC       
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #$7F,((word_FFB13A-$1000000)).w 
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
										bne.w   loc_215C0
										bra.w   loc_2184E
loc_215C0:
										
										move.w  d0,-4(a6)
										move.w  d1,-$C(a6)
										move.w  d2,-8(a6)
										move.w  -8(a6),d1
										jsr     j_GetItemType
										cmpi.w  #1,d2
										bne.s   loc_21618
										move.w  -4(a6),d0
										jsr     j_GetEquippedWeapon
										cmpi.w  #$FFFF,d1
										beq.w   loc_21662
										cmp.w   -$C(a6),d2
										bne.w   loc_21662
										move.w  -8(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_21662
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										trap    #TEXTBOX
										dc.w $37                ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
										bsr.w   WaitForMusicResumeAndPlayerInput
										bra.s   loc_2159E
loc_21618:
										
										cmpi.w  #0,d2
										beq.w   loc_21662
										move.w  -4(a6),d0
										jsr     j_GetEquippedRing
										cmpi.w  #$FFFF,d1
										beq.w   loc_21662
										cmp.w   -$C(a6),d2
										bne.w   loc_21662
										move.w  -8(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_21662
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										trap    #TEXTBOX
										dc.w $37                ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
										bsr.w   WaitForMusicResumeAndPlayerInput
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_2159E
loc_21662:
										
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $36                ; "Pass the {ITEM}{N}to whom?{D1}"
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  #2,((byte_FFB13C-$1000000)).w
										move.w  -8(a6),((word_FFB13A-$1000000)).w
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
										bne.w   loc_2168E
										bra.w   loc_2159E
loc_2168E:
										
										move.w  d0,-6(a6)
										move.w  d1,-$E(a6)
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmpi.w  #4,d2
										beq.w   loc_216F8
										move.w  -4(a6),d0
										move.w  -$C(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -6(a6),d0
										move.w  -8(a6),d1
										andi.b  #ITEM_MASK_IDX,d1
										jsr     j_AddItem
										move.w  -4(a6),d0
										move.w  -6(a6),d1
										cmp.w   d0,d1
										bne.s   loc_216E4
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -8(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $4A                ; "{NAME} changed hands{N}to hold the {ITEM}.{W2}"
										bra.s   loc_216F4
loc_216E4:
										
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -6(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $41                ; "The {ITEM} now{N}belongs to {NAME}.{W2}"
loc_216F4:
										
										bra.w   loc_2184E
loc_216F8:
										
										move.w  -6(a6),d0
										move.w  -$E(a6),d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d1,-$A(a6)
										jsr     j_GetItemType
										cmpi.w  #1,d2
										bne.s   loc_21758
										move.w  -6(a6),d0
										jsr     j_GetEquippedWeapon
										cmpi.w  #$FFFF,d1
										beq.w   loc_2179E
										cmp.w   -$E(a6),d2
										bne.w   loc_2179E
										move.w  -$A(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_2179E
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										trap    #TEXTBOX
										dc.w $37                ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
										bsr.w   WaitForMusicResumeAndPlayerInput
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_21662
loc_21758:
										
										cmpi.w  #0,d2
										beq.w   loc_2179E
										move.w  -6(a6),d0
										jsr     j_GetEquippedRing
										cmpi.w  #$FFFF,d1
										beq.w   loc_2179E
										cmp.w   -$E(a6),d2
										bne.w   loc_2179E
										move.w  -$A(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_2179E
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										trap    #TEXTBOX
										dc.w $37                ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
										bsr.w   WaitForMusicResumeAndPlayerInput
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
										andi.b  #ITEM_MASK_IDX,d1
										jsr     j_AddItem
										move.w  -6(a6),d2
										cmp.w   -4(a6),d2
										bne.w   loc_217FE
										move.w  -$E(a6),d3
										cmp.w   -$C(a6),d3
										bcs.w   loc_217FE
										subi.w  #1,-$E(a6)
loc_217FE:
										
										move.w  -6(a6),d0
										move.w  -$E(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -8(a6),d1
										andi.b  #ITEM_MASK_IDX,d1
										jsr     j_AddItem
loc_2181A:
										
										move.w  -4(a6),d0
										move.w  -6(a6),d1
										cmp.w   d0,d1
										bne.s   loc_21838
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -8(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $4A                ; "{NAME} changed hands{N}to hold the {ITEM}.{W2}"
										bra.s   loc_2184E
loc_21838:
										
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -6(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										move.w  -$A(a6),((TEXT_NAME_INDEX_3-$1000000)).w
										trap    #TEXTBOX
										dc.w $42                ; "The {ITEM} was{N}exchanged for {NAME}'s{N}{ITEM}.{W2}"
loc_2184E:
										
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_219D8
loc_21856:
										
										cmpi.w  #2,d0
										bne.w   loc_21898
										bsr.w   sub_219EC       
										move.b  #3,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
										beq.w   loc_21880
										bra.w   loc_21894
loc_21880:
										
										bra.w   loc_21894
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -8(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $46                ; "{NAME} is already{N}equipped with the{N}{ITEM}.{W2}"
loc_21894:
										
										bra.w   loc_219D8
loc_21898:
										
										bsr.w   sub_219EC       
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
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
										andi.b  #$10,d1
										cmpi.b  #0,d1
										beq.s   loc_218F2
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $3E                ; "{LEADER}!  You can't{N}discard the {ITEM}!{W2}"
										bra.w   loc_219D0
loc_218F2:
										
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $45                ; "The {ITEM} will be{N}discarded.  OK?"
										jsr     j_YesNoChoiceBox
										trap    #TEXTBOX
										dc.w $FFFF
										cmpi.w  #0,d0
										beq.w   loc_21910
										bra.s   loc_21898
loc_21910:
										
										move.w  -8(a6),d1
										jsr     j_GetItemType
										cmpi.w  #1,d2
										bne.s   loc_21962
										move.w  -4(a6),d0
										jsr     j_GetEquippedWeapon
										cmpi.w  #$FFFF,d1
										beq.w   loc_219A0
										cmp.w   -$C(a6),d2
										bne.w   loc_219A0
										move.w  -8(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_219A0
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										trap    #TEXTBOX
										dc.w $37                ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
										bsr.w   WaitForMusicResumeAndPlayerInput
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_219D0
loc_21962:
										
										cmpi.w  #0,d2
										beq.w   loc_219A0
										move.w  -4(a6),d0
										jsr     j_GetEquippedRing
										cmpi.w  #$FFFF,d1
										beq.w   loc_219A0
										cmp.w   -$C(a6),d2
										bne.w   loc_219A0
										move.w  -8(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_219A0
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $37                ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
										bra.w   loc_219D0
loc_219A0:
										
										move.w  -4(a6),d0
										move.w  -$C(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $43                ; "The {ITEM} is discarded.{W2}"
										move.b  -$14(a6),d1
										andi.b  #8,d1
										cmpi.b  #0,d1
										beq.s   loc_219D0
										move.w  -8(a6),d1
										jsr     j_AddItemToDeals
loc_219D0:
										
										trap    #TEXTBOX
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

	; End of function MainMenuActions


; =============== S U B R O U T I N E =======================================

; copy available targets list ?

sub_219EC:
										
										movem.l d7-a1,-(sp)
										jsr     j_UpdateForce
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,((word_FFB12E-$1000000)).w
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										subq.w  #1,d7
loc_21A0A:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_21A0A
										movem.l (sp)+,d7-a1
										rts

	; End of function sub_219EC

byte_21A16:         dc.b 0
										dc.b 2
										dc.b 0
										dc.b 2
										dc.b 0
										dc.b $A

; =============== S U B R O U T I N E =======================================

sub_21A1C:
										
										movem.l d7-a0,-(sp)
										lea     byte_21A16(pc), a0
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
										jsr     j_InitPortraitWindow
loc_21A50:
										
										trap    #TEXTBOX
										dc.w $C2                ; "Welcome to the Dwarf{N}Craftsman!{D3}"
										jsr     j_HidePortraitWindow
										clr.w   -$12(a6)
										clr.w   -$E(a6)
										clr.w   -$10(a6)
										clr.w   -$14(a6)
										bsr.w   sub_21A92
										moveq   #0,d1
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_21A7C
										jsr     j_InitPortraitWindow
loc_21A7C:
										
										trap    #TEXTBOX
										dc.w $C6                ; "{CLEAR}Thank you very much!{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_HidePortraitWindow
										unlk    a6
										movem.l (sp)+,d0-a5
										rts

	; End of function BlacksmithActions


; =============== S U B R O U T I N E =======================================

sub_21A92:
										
										jsr     j_UpdateForce
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,((word_FFB12E-$1000000)).w
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										subq.b  #1,d7
loc_21AAC:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_21AAC
										bsr.w   sub_21E48
										cmpi.w  #1,-$14(a6)
										bne.w   loc_21AE8
										move.w  #4,d7
										subq.w  #1,d7
										lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a0
loc_21ACA:
										
										move.w  (a0)+,-$A(a6)
										cmpi.w  #0,-$A(a6)
										beq.s   loc_21AE4
										move.w  d7,-$16(a6)
										addi.w  #1,-$16(a6)
										bsr.w   sub_21B42
loc_21AE4:
										
										dbf     d7,loc_21ACA
loc_21AE8:
										
										cmpi.w  #0,-$12(a6)
										beq.w   loc_21B0E
										move.w  -$12(a6),d0
										add.w   -$E(a6),d0
										sub.w   -$10(a6),d0
										cmpi.w  #4,d0
										beq.w   return_21B40
										trap    #TEXTBOX
										dc.w $C4                ; "{CLEAR}Anything else?"
										bra.w   loc_21B3C
loc_21B0E:
										
										cmpi.w  #0,-$E(a6)
										beq.w   loc_21B38
										trap    #TEXTBOX
										dc.w $CE                ; "Oops...{N}I needs some more time.{W1}"
										move.w  -$12(a6),d0
										add.w   -$E(a6),d0
										sub.w   -$10(a6),d0
										cmpi.w  #4,d0
										beq.w   return_21B40
										trap    #TEXTBOX
										dc.w $C4                ; "{CLEAR}Anything else?"
										bra.w   loc_21B3C
loc_21B38:
										
										trap    #TEXTBOX
										dc.w $C3                ; "We can create a great and{N}special weapon for you if you{N}have some special material.{W1}"
loc_21B3C:
										
										bsr.w   loc_21CDA
return_21B40:
										
										rts

	; End of function sub_21A92


; =============== S U B R O U T I N E =======================================

sub_21B42:
										
										movem.l d0-a1,-(sp)
										move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $CF                ; "{CLEAR}I've been waiting!{N}This {ITEM} is for{N}you.  Isn't it great?!{W1}"
										trap    #TEXTBOX
										dc.w $A6                ; "Who gets it?{W2}"
										trap    #TEXTBOX
										dc.w $FFFF
loc_21B58:
										
										trap    #TEXTBOX
										dc.w $FFFF
										move.w  -$A(a6),((word_FFB13A-$1000000)).w
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
										bne.s   loc_21B7C
										trap    #TEXTBOX
										dc.w $C5                ; "{CLEAR}What a pity!{W2}"
										bra.w   loc_21CD4
loc_21B7C:
										
										move.w  d0,-6(a6)
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										cmpi.w  #4,d2
										bcs.s   loc_21BAC
										move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $D0                ; "{NAME}'s hands are are{N}full.  May I pass it to{N}somebody else?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.s   loc_21B58
										trap    #TEXTBOX
										dc.w $C5                ; "{CLEAR}What a pity!{W2}"
										bra.w   loc_21CD4
loc_21BAC:
										
										move.w  -$A(a6),d1
										jsr     j_GetItemType
										cmpi.w  #0,d2
										beq.s   loc_21BE4
										move.w  -$A(a6),d1
										move.w  -6(a6),d0
										jsr     j_IsWeaponOrRingEquippable
										bcs.s   loc_21BE4
										move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $A7                ; "{NAME} can't be{N}equipped with it.  OK?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										bne.w   loc_21B58
loc_21BE4:
										
										move.w  -6(a6),d0
										move.w  -$A(a6),d1
										jsr     j_AddItem
										move.w  #4,d6
										sub.w   -$16(a6),d6
										lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a1
										lsl.w   #1,d6
										adda.w  d6,a1
										move.w  (a1),d2
										move.w  #0,(a1)
										addi.w  #1,-$10(a6)
										move.w  -$A(a6),d1
										move.w  -6(a6),d0
										jsr     j_IsWeaponOrRingEquippable
										bcc.w   loc_21CD0
										trap    #TEXTBOX
										dc.w $AD                ; "{CLEAR}Equip it now?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										bne.w   loc_21CD0
										move.w  -$A(a6),d1
										jsr     j_GetItemType
										cmpi.w  #1,d2
										bne.s   loc_21C6E
										move.w  -6(a6),d0
										jsr     j_GetEquippedWeapon
										cmpi.w  #$FFFF,d1
										beq.s   loc_21C9A
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmpi.w  #2,d2
										bne.w   loc_21C9A
										move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $B0                ; "{NAME} can't remove{N}the cursed equipment.{W2}"
										bra.s   loc_21CD0
loc_21C6E:
										
										move.w  -6(a6),d0
										jsr     j_GetEquippedRing
										cmpi.w  #$FFFF,d1
										beq.s   loc_21C9A
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmpi.w  #2,d2
										bne.w   loc_21C9A
										move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $B0                ; "{NAME} can't remove{N}the cursed equipment.{W2}"
										bra.s   loc_21CD0
loc_21C9A:
										
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										move.w  d2,d1
										subq.w  #1,d1
										jsr     j_EquipItem
										cmpi.w  #2,d2
										bne.s   loc_21CC8
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										bsr.w   WaitForMusicResumeAndPlayerInput_Blacksmith
										move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $AF                ; "Gee, {NAME} gets{N}cursed.{W2}"
										bra.w   loc_21CD4
loc_21CC8:
										
										trap    #TEXTBOX
										dc.w $AE                ; "Ah, it suits you!{W2}"
										bra.w   loc_21CD4
loc_21CD0:
										
										trap    #TEXTBOX
										dc.w $D1                ; "{CLEAR}Here you go!{N}It's a great weapon!{W2}"
loc_21CD4:
										
										movem.l (sp)+,d0-a1
										rts
loc_21CDA:
										
										movem.l d0-d2,-(sp)
loc_21CDE:
										
										trap    #TEXTBOX
										dc.w $C7                ; "What kind of material do you{N}have?{D1}"
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  #1,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
										beq.w   loc_21E30
										move.w  d0,-6(a6)
										move.w  d1,-$C(a6)
										move.w  d2,-$A(a6)
										cmpi.w  #$7B,d2 
										beq.w   loc_21D1A
										trap    #TEXTBOX
										dc.w $C8                ; "Sorry, I've never worked{N}with that before....{W1}"
										bra.s   loc_21CDE
loc_21D1A:
										
										trap    #TEXTBOX
										dc.w $C9                ; "{CLEAR}Whose weapon should I{N}make?{D1}"
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  #0,((byte_FFB13C-$1000000)).w
										move.w  #ITEMIDX_NOTHING,((word_FFB13A-$1000000)).w
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
										beq.s   loc_21CDE
										move.w  d0,-8(a6)
										jsr     j_GetClass      
										move.w  d1,-$18(a6)
										cmpi.w  #$C,d1
										bcc.w   loc_21D5C
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $D3                ; "{NAME} has to be promoted{N}first.{W1}"
										bra.s   loc_21D1A
loc_21D5C:
										
										bsr.w   sub_21E8E
										cmpi.w  #0,d0
										beq.w   loc_21D74
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $D4                ; "Sorry, I can't create a{N}weapon for {NAME}.{W1}"
										bra.s   loc_21D1A
loc_21D74:
										
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.l  #$1388,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $CA                ; "For {NAME}!  It will cost{N}{#} gold coins.  OK?"
										jsr     sub_10050
										jsr     j_YesNoChoiceBox
										jsr     sub_10058
										cmpi.w  #0,d0
										beq.s   loc_21DA6
										trap    #TEXTBOX
										dc.w $C5                ; "{CLEAR}What a pity!{W2}"
										bra.w   loc_21D1A
loc_21DA6:
										
										jsr     j_GetGold
										move.l  d1,-4(a6)
										cmpi.l  #$1388,d1
										bcc.w   loc_21DC2
										trap    #TEXTBOX
										dc.w $CB                ; "You have to bring more{N}money.{W2}"
										bra.w   loc_21E30
loc_21DC2:
										
										move.l  #$1388,d1
										jsr     j_DecreaseGold
										addi.w  #1,-$E(a6)
										move.w  -6(a6),d0
										move.w  -$C(a6),d1
										jsr     j_DropItemBySlot
										bsr.w   PickMithrilWeapon
										move.w  #$50,d1 
										jsr     j_ClearFlag
										trap    #TEXTBOX
										dc.w $CC                ; "{CLEAR}Great!{W2}"
										trap    #TEXTBOX
										dc.w $CD                ; "Please stop by shortly.{N}I'll surprise you!{W1}"
										move.w  -$E(a6),d0
										move.w  -$12(a6),d1
										move.w  -$10(a6),d2
										add.w   d1,d0
										sub.w   d2,d0
										cmpi.w  #4,d0
										bne.s   loc_21E16
										trap    #TEXTBOX
										dc.w $D2                ; "Sorry, that's all for today.{W1}"
										bra.w   loc_21E30
loc_21E16:
										
										trap    #TEXTBOX
										dc.w $C4                ; "{CLEAR}Anything else?"
										jsr     j_YesNoChoiceBox
										cmpi.w  #0,d0
										beq.w   loc_21CDE
										trap    #TEXTBOX
										dc.w $C5                ; "{CLEAR}What a pity!{W2}"
										trap    #TEXTBOX
										dc.w $FFFF
loc_21E30:
										
										movem.l (sp)+,d0-d2
										rts

	; End of function sub_21B42


; =============== S U B R O U T I N E =======================================

WaitForMusicResumeAndPlayerInput_Blacksmith:
										
										move.w  d0,-(sp)
										move.w  #$FB,d0 
										jsr     (PlayMusicAfterCurrentOne).w
										jsr     (WaitForPlayerInput).w
										move.w  (sp)+,d0
										rts

	; End of function WaitForMusicResumeAndPlayerInput_Blacksmith


; =============== S U B R O U T I N E =======================================

sub_21E48:
										
										move.w  #$50,d1 
										jsr     j_CheckFlag
										beq.w   loc_21E5C
										move.w  #1,-$14(a6)
loc_21E5C:
										
										move.w  #4,d7
										subq.w  #1,d7
										lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a0
loc_21E66:
										
										move.w  (a0)+,d1
										cmpi.w  #0,d1
										beq.w   loc_21E88
										cmpi.w  #1,-$14(a6)
										bne.s   loc_21E82
										addi.w  #1,-$12(a6)
										bra.w   loc_21E88
loc_21E82:
										
										addi.w  #1,-$E(a6)
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
										lea     MithrilWeaponClassLists(pc), a0
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
										addi.w  #1,d0
										dbf     d7,loc_21EE4
										clr.w   d0
										move.w  #2,d6
										jsr     (UpdateRandomSeed).w
										cmpi.w  #0,d7
										bne.w   loc_21F16
										move.w  #2,d0
loc_21F16:
										
										lsl.w   #3,d0
										lea     MithrilWeaponLists(pc), a0
										adda.w  d0,a0
										move.w  #3,d5
loc_21F22:
										
										clr.w   d0
										clr.w   d1
										move.b  (a0)+,d0
										move.b  (a0)+,d1
										move.w  d0,d6
										jsr     (UpdateRandomSeed).w
										cmpi.w  #0,d7
										beq.w   loc_21F3C
										dbf     d5,loc_21F22
loc_21F3C:
										
										lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a0
										move.w  #3,d7
loc_21F44:
										
										cmpi.w  #0,(a0)
										bne.w   loc_21F52
										move.w  d1,(a0)
										bra.w   loc_21F5C
loc_21F52:
										
										move.w  #2,d0
										adda.w  d0,a0
										dbf     d7,loc_21F44
loc_21F5C:
										
										movem.l (sp)+,d0-a0
										rts

	; End of function PickMithrilWeapon

MithrilWeaponClassLists:
										incbin "data/allies/classes/mithrilweaponclasses.bin"
MithrilWeaponLists: incbin "data/items/mithrilweapons.bin"

; =============== S U B R O U T I N E =======================================

CaravanMenuActions:
										
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
										lea     (InitStack).w,a0
										jsr     j_ExecuteMenu
										cmpi.w  #$FFFF,d0
										beq.w   loc_22014
										add.w   d0,d0
										move.w  rjt_CaravanActions(pc,d0.w),d0
										jsr     rjt_CaravanActions(pc,d0.w)
										bra.s   loc_21FE8
rjt_CaravanActions:
										
										dc.w sub_22028-rjt_CaravanActions
										dc.w CaravanDepotActions-rjt_CaravanActions
										dc.w ItemMenuActions-rjt_CaravanActions
										dc.w sub_22102-rjt_CaravanActions
loc_22014:
										
										moveq   #0,d0
										moveq   #0,d1
										move.w  #$A,d1
										bsr.w   sub_228A8       
										unlk    a6
										movem.l (sp)+,d0-a5
										rts

	; End of function CaravanMenuActions


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
										cmpi.w  #$FFFF,d0
										beq.w   loc_220E8
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   loc_22070
										move.w  -2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $13                ; "{NAME} is dead.{N}Are you sure?"
										jsr     j_YesNoChoiceBox
										tst.w   d0
										bne.w   loc_220FE
loc_22070:
										
										moveq   #1,d1
										bsr.w   sub_228D8
										cmpi.w  #$C,((word_FFB12E-$1000000)).w
										bcc.s   loc_22098
										move.w  -2(a6),d0
										jsr     j_JoinBattleParty
										move.w  -2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  #$15,d1
										bsr.w   sub_228A8       
										bra.s   loc_220E6
loc_22098:
										
										move.w  #$17,d1
										bsr.w   sub_228A8       
										jsr     sub_10040
										cmpi.w  #$FFFF,d0
										beq.s   loc_220DE
										tst.w   d0
										beq.s   loc_220D4
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										jsr     j_LeaveBattleParty
										move.w  -2(a6),d0
										jsr     j_JoinBattleParty
										move.w  -2(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										move.w  #$11,d1
										bsr.w   sub_228A8       
										bra.s   loc_220DC
loc_220D4:
										
										move.w  #$14,d1
										bsr.w   sub_228A8       
loc_220DC:
										
										bra.s   loc_220E6
loc_220DE:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
										dc.w $FFFF
loc_220E6:
										
										bra.s   loc_220F2
loc_220E8:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
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
										cmpi.w  #$FFFF,d0
										beq.s   loc_22144
										tst.w   d0
										beq.s   loc_2213A
										jsr     j_LeaveBattleParty
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  #$16,d1
										bsr.w   sub_228A8       
										bra.s   loc_22142
loc_2213A:
										
										move.w  #$14,d1
										bsr.w   sub_228A8       
loc_22142:
										
										bra.s   loc_2214E
loc_22144:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
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

CaravanDepotActions:
										
										moveq   #0,d1
										bra.w   loc_2215C
loc_2215A:
										
										moveq   #$FFFFFFFF,d1
loc_2215C:
										
										moveq   #0,d0
										moveq   #8,d2
										lea     (InitStack).w,a0
										jsr     j_ExecuteMenu
										cmpi.w  #$FFFF,d0
										beq.w   return_22186
										add.w   d0,d0
										move.w  rjt_CaravanItemActions(pc,d0.w),d0
										jsr     rjt_CaravanItemActions(pc,d0.w)
										bra.s   loc_2215A

	; End of function CaravanDepotActions

rjt_CaravanItemActions:
										dc.w Caravan_DescribeItem-rjt_CaravanItemActions
										dc.w sub_222FA-rjt_CaravanItemActions
										dc.w sub_22384-rjt_CaravanItemActions
										dc.w sub_22498-rjt_CaravanItemActions

; START OF FUNCTION CHUNK FOR CaravanDepotActions

return_22186:
										
										rts

; END OF FUNCTION CHUNK FOR CaravanDepotActions


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
										cmpi.w  #$FFFF,d0
										beq.w   loc_222E0
										trap    #CHECK_FLAG
										dc.w $46                ; Astral is a follower
										bne.s   loc_221BE
										moveq   #$B,d0
										bra.s   loc_221C0
loc_221BE:
										
										moveq   #$1F,d0
loc_221C0:
										
										moveq   #0,d1
										jsr     j_InitPortraitWindow
										move.w  -4(a6),d1
										bsr.w   DisplaySpecialCaravanDescription
										bne.w   loc_222A8
										move.w  -4(a6),d1
										jsr     j_GetItemType
										tst.w   d2
										bne.s   loc_221E8
										trap    #TEXTBOX
										dc.w $5C                ; "It's a tool.{W2}"
										bra.s   loc_221F8
loc_221E8:
										
										cmpi.w  #1,d2
										bne.s   loc_221F4
										trap    #TEXTBOX
										dc.w $5A                ; "It's a weapon.{W2}"
										bra.s   loc_221F8
loc_221F4:
										
										trap    #TEXTBOX
										dc.w $5B                ; "It's a ring.{W2}"
loc_221F8:
										
										move.w  -4(a6),d1
										jsr     j_GetItemDefAddress
										cmpi.b  #SPELLIDX_NOTHING,ITEMDEF_OFFSET_SPELL(a0)
										beq.s   loc_22210
										trap    #TEXTBOX
										dc.w $5D                ; "It has a special effect when{N}used in battle.{W2}"
										bra.s   loc_22214
loc_22210:
										
										trap    #TEXTBOX
										dc.w $5E                ; "It has no effect in battle.{W2}"
loc_22214:
										
										move.w  -4(a6),d1
										jsr     j_GetItemType
										tst.w   d2
										beq.w   loc_222A8
										cmpi.w  #ITEMIDX_POWER_RING,d1
										beq.w   loc_222A4
										cmpi.w  #ITEMIDX_PROTECT_RING,d1
										beq.w   loc_222A4
										cmpi.w  #ITEMIDX_QUICK_RING,d1
										beq.w   loc_222A4
										cmpi.w  #ITEMIDX_RUNNING_RING,d1
										beq.w   loc_222A4
										move.w  -4(a6),d1
										move.w  d1,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $60                ; "The {ITEM} is for{N}"
										jsr     j_UpdateForce
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										subq.w  #1,d7
										bcs.w   loc_222A8
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										clr.w   d6
loc_22266:
										
										move.b  (a0)+,d0
										jsr     j_IsWeaponOrRingEquippable
										bcc.s   loc_2228E
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
																						; argument (char idx) for trap #5 using a {NAME} command
										trap    #TEXTBOX
										dc.w $62                ; "{DICT}{NAME},"
										addq.w  #1,d6
										cmpi.w  #1,d6
										bne.s   loc_22284
										trap    #TEXTBOX
										dc.w $63                ; "{N}"
loc_22284:
										
										cmpi.w  #4,d6
										bne.s   loc_2228E
										trap    #TEXTBOX
										dc.w $63                ; "{N}"
loc_2228E:
										
										dbf     d7,loc_22266
										tst.w   d6
										bne.s   loc_2229C
										trap    #TEXTBOX
										dc.w $61                ; "nobody so far.{W2}"
										bra.s   loc_222A0
loc_2229C:
										
										trap    #TEXTBOX
										dc.w $64                ; "to equip.{W2}"
loc_222A0:
										
										bra.w   loc_222A8
loc_222A4:
										
										trap    #TEXTBOX
										dc.w $5F                ; "Everybody can equip it.{W2}"
loc_222A8:
										
										move.w  -4(a6),d1
										jsr     j_GetItemDefAddress
										btst    #ITEMTYPE_BIT_UNSELLABLE,ITEMDEF_OFFSET_TYPE(a0)
										beq.s   loc_222C0
										trap    #TEXTBOX
										dc.w $66                ; "You can't sell it at a shop.{W2}"
										bra.s   loc_222D4
loc_222C0:
										
										clr.l   d1
										move.w  ITEMDEF_OFFSET_PRICE(a0),d1
										mulu.w  #ITEM_SELLPRICE_MULTIPLIER,d1
										lsr.l   #ITEM_SELLPRICE_BITSHIFTRIGHT,d1
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $65                ; "It brings {#} gold coins{N}at a shop.{W2}"
loc_222D4:
										
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_HidePortraitWindow
										bra.s   loc_222EA
loc_222E0:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
										dc.w $FFFF
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
										cmpi.w  #$40,((word_FFB12E-$1000000)).w 
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
										cmpi.w  #$FFFF,d0
										beq.s   loc_2236A
										bsr.w   sub_2294C       
										bcs.w   loc_22380
										move.w  -4(a6),d1
										jsr     j_AddItemToCaravan
										move.w  -6(a6),d1
										jsr     j_DropItemBySlot
										move.w  -2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -4(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										move.w  #$57,d1 
										bsr.w   sub_228A8       
										bra.s   loc_22374
loc_2236A:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
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
										cmpi.w  #$FFFF,d2
										beq.w   loc_2247E
										moveq   #0,d1
										bsr.w   sub_228D8
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  #$54,d1 
										bsr.w   sub_228A8       
										move.b  #2,((byte_FFB13C-$1000000)).w
										move.w  -4(a6),((word_FFB13A-$1000000)).w
										jsr     sub_10044
										move.w  d0,-8(a6)
										move.w  d1,-$C(a6)
										move.w  d2,-$A(a6)
										cmpi.w  #$FFFF,d0
										beq.w   loc_2247C
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmpi.w  #4,d2
										beq.s   loc_22422
										move.w  -4(a6),d1
										jsr     j_AddItem
										move.w  -6(a6),d1
										jsr     j_RemoveItemFromCaravan
										move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -4(a6),((TEXT_NAME_INDEX_2-$1000000)).w
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
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -8(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										move.w  -$A(a6),((TEXT_NAME_INDEX_3-$1000000)).w
										move.w  #$29,d1 
										bsr.w   sub_228A8       
loc_2247C:
										
										bra.s   loc_22488
loc_2247E:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
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
										cmpi.w  #$FFFF,-4(a6)
										beq.s   loc_2251E
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $2C                ; "The {ITEM} will be{N}discarded.  Are you sure?"
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
										
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  #$2A,d1 
										bsr.w   sub_228A8       
										bra.s   loc_2251C
loc_22518:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
loc_2251C:
										
										bra.s   loc_22528
loc_2251E:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
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

ItemMenuActions:
										
										moveq   #0,d1
										bra.w   loc_22540
loc_2253E:
										
										moveq   #$FFFFFFFF,d1
loc_22540:
										
										moveq   #0,d0
										moveq   #3,d2
										lea     (InitStack).w,a0
										jsr     j_ExecuteMenu
										cmpi.w  #$FFFF,d0
										beq.w   return_2256A
										add.w   d0,d0
										move.w  rjt_ItemActions(pc,d0.w),d0
										jsr     rjt_ItemActions(pc,d0.w)
										bra.s   loc_2253E

	; End of function ItemMenuActions

rjt_ItemActions:    dc.w sub_2256C-rjt_ItemActions
										dc.w sub_22610-rjt_ItemActions
										dc.w sub_22776-rjt_ItemActions
										dc.w sub_227B0-rjt_ItemActions

; START OF FUNCTION CHUNK FOR ItemMenuActions

return_2256A:
										
										rts

; END OF FUNCTION CHUNK FOR ItemMenuActions


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
										cmpi.w  #$FFFF,d0
										beq.s   loc_225FA
										move.w  -4(a6),d1
										jsr     sub_229CA
										tst.w   d2
										bne.s   loc_225EA
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  #$19,d1
										bsr.w   sub_228A8       
										move.b  #0,((byte_FFB13C-$1000000)).w
										jsr     sub_10040
										cmpi.w  #$FFFF,d0
										beq.s   loc_225E4
										move.w  -4(a6),d1
										bsr.w   UseFieldItem    
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										jsr     j_RemoveItemBySlot
										bra.s   loc_225E8
loc_225E4:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
loc_225E8:
										
										bra.s   loc_225F8
loc_225EA:
										
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  #$1A,d1
										bsr.w   sub_228A8       
loc_225F8:
										
										bra.s   loc_22604
loc_225FA:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
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
										cmpi.w  #$FFFF,d0
										beq.w   loc_22760
										bsr.w   sub_2294C       
										bcs.w   loc_2276A
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  #$1D,d1
										bsr.w   sub_228A8       
										move.b  #2,((byte_FFB13C-$1000000)).w
										move.w  -4(a6),((word_FFB13A-$1000000)).w
										jsr     sub_10044
										move.w  d0,-8(a6)
										move.w  d1,-$C(a6)
										move.w  d2,-$A(a6)
										cmpi.w  #$FFFF,d0
										beq.w   loc_2275A
										cmp.w   -2(a6),d0
										bne.s   loc_226B6
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -4(a6),d1
										jsr     j_AddItem
										move.w  -2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -4(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										move.w  #$30,d1 
										bsr.w   sub_228A8       
										bra.w   loc_22758
loc_226B6:
										
										moveq   #0,d1
										jsr     j_GetItemAndNumberOfItems
										cmpi.w  #4,d2
										beq.s   loc_226F6
										move.w  -8(a6),d0
										move.w  -4(a6),d1
										jsr     j_AddItem
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -8(a6),((TEXT_NAME_INDEX_2-$1000000)).w
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
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  -8(a6),((TEXT_NAME_INDEX_2-$1000000)).w
										move.w  -$A(a6),((TEXT_NAME_INDEX_3-$1000000)).w
										move.w  #$29,d1 
										bsr.w   sub_228A8       
loc_22758:
										
										bra.s   loc_2275E
loc_2275A:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
loc_2275E:
										
										bra.s   loc_2276A
loc_22760:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
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
										cmpi.w  #$FFFF,d0
										bne.s   loc_227A6
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
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
										cmpi.w  #$FFFF,-2(a6)
										beq.s   loc_2284E
										bsr.w   sub_2294C       
										bcs.w   loc_22858
										move.w  -4(a6),d1
										jsr     sub_2299E
										bcs.w   loc_22858
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $2C                ; "The {ITEM} will be{N}discarded.  Are you sure?"
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
										
										move.w  -4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  #$2A,d1 
										bsr.w   sub_228A8       
										bra.s   loc_2284C
loc_22844:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
										dc.w $FFFF
loc_2284C:
										
										bra.s   loc_22858
loc_2284E:
										
										trap    #TEXTBOX
										dc.w 4                  ; "Did you change your mind?{W2}"
										trap    #TEXTBOX
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
										andi.w  #ITEM_MASK_IDX,d1
										lea     SpecialCaravanDescriptions(pc), a0
loc_22870:
										
										cmpi.w  #$FFFF,(a0)
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
										
										adda.w  #4,a0
										bra.s   loc_22870
loc_2289C:
										
										movem.l (sp)+,d0-d1/a0
										rts

	; End of function DisplaySpecialCaravanDescription

SpecialCaravanDescriptions:
										incbin "data/items/specialcaravandescriptions.bin"

; =============== S U B R O U T I N E =======================================

; textbox?

sub_228A8:
										
										movem.l d0-d1,-(sp)
										move.l  d1,-(sp)
										trap    #CHECK_FLAG
										dc.w $46                ; Astral is a follower
										bne.s   loc_228B8       
										moveq   #$B,d0          ; ROHDE portrait idx
										bra.s   loc_228BA
loc_228B8:
										
										moveq   #$1F,d0         ; Astral portrait idx
loc_228BA:
										
										moveq   #0,d1
										jsr     j_InitPortraitWindow
										move.l  (sp)+,d0
										jsr     (DisplayText).w 
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     j_HidePortraitWindow
										movem.l (sp)+,d0-d1
										rts

	; End of function sub_228A8


; =============== S U B R O U T I N E =======================================

sub_228D8:
										
										movem.l d7-a1,-(sp)
										jsr     j_UpdateForce
										tst.w   d1
										bne.s   loc_228F0
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										bra.s   loc_22908
loc_228F0:
										
										cmpi.w  #1,d1
										bne.s   loc_22900
										lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a0
										move.w  ((NUMBER_OF_BATTLE_PARTY_MEMBERS-$1000000)).w,d7
										bra.s   loc_22908
loc_22900:
										
										lea     ((RESERVE_MEMBERS-$1000000)).w,a0
										move.w  ((NUMBER_OF_OTHER_PARTY_MEMBERS-$1000000)).w,d7
loc_22908:
										
										lea     ((byte_FFB0AE-$1000000)).w,a1
										move.w  d7,((word_FFB12E-$1000000)).w
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
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
										jsr     j_IsItemCursed
										bcc.w   loc_22986
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										move.w  #$3C,d0 
										jsr     (Sleep).w       
										move.w  d1,((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  #$1E,d1
										bsr.w   sub_228A8       
										bsr.w   PlayPreviousMusicAfterCurrentOne
										ori     #1,ccr
loc_22986:
										
										bra.s   loc_2298A
loc_22988:
										
										tst.b   d0
loc_2298A:
										
										movem.l (sp)+,d1
										rts

	; End of function sub_2294C


; =============== S U B R O U T I N E =======================================

PlayPreviousMusicAfterCurrentOne:
										
										move.w  d0,-(sp)
										move.w  #$FB,d0 
										jsr     (PlayMusicAfterCurrentOne).w
										move.w  (sp)+,d0
										rts

	; End of function PlayPreviousMusicAfterCurrentOne


; =============== S U B R O U T I N E =======================================

sub_2299E:
										
										movem.l d1/a0,-(sp)
										jsr     j_GetItemDefAddress
										btst    #4,8(a0)
										beq.s   loc_229C2
										move.w  d1,((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  #$25,d1 
										bsr.w   sub_228A8       
										ori     #1,ccr
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
										lea     UsableOutsideBattleItems(pc), a0
										nop
loc_229D2:
										
										cmp.b   (a0)+,d1
										beq.w   return_229E0
										cmpi.b  #$FF,(a0)
										bne.s   loc_229D2
										moveq   #$FFFFFFFF,d2
return_229E0:
										
										rts

	; End of function sub_229CA

UsableOutsideBattleItems:
										incbin "data/items/usableoutsidebattleitems.bin"

; =============== S U B R O U T I N E =======================================

; check specific item index + code offset to run when used in field

UseFieldItem:
										
										movem.l d0-d1/d6-d7,-(sp)
										andi.w  #ITEM_MASK_IDX,d1
										movem.l d1/a0,-(sp)
										lea     rjt_FieldItemEffects(pc), a0
loc_229FC:
										
										cmpi.w  #CODE_TERMINATOR_WORD,(a0)
										beq.w   loc_22A1A
										cmp.w   (a0)+,d1
										bne.w   loc_22A14
										move.w  (a0)+,d1
										jsr     rjt_FieldItemEffects(pc,d1.w)
										bra.w   loc_22A1A
loc_22A14:
										
										adda.w  #2,a0
										bra.s   loc_229FC
loc_22A1A:
										
										movem.l (sp)+,d1/a0
										bra.w   loc_22A48
rjt_FieldItemEffects:
										
										dc.w 3
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
										dc.w LevelUpCutscene-rjt_FieldItemEffects
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
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $95                ; "{NAME} is no longer{N}poisoned.{W2}"
										bra.s   loc_22A68
loc_22A64:
										
										trap    #TEXTBOX
										dc.w $94                ; "It has no use.{W2}"
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
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $95                ; "{NAME} is no longer{N}poisoned.{W2}"
										moveq   #$FFFFFFFF,d2
loc_22A88:
										
										bclr    #0,d1
										beq.s   loc_22A98
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $9C                ; "{NAME} is no longer{N}paralyzed.{W2}"
										moveq   #$FFFFFFFF,d2
loc_22A98:
										
										tst.w   d2
										bne.s   loc_22AA0
										trap    #TEXTBOX
										dc.w $94                ; "It has no use.{W2}"
loc_22AA0:
										
										jsr     j_SetStatus
										jsr     j_ApplyStatusAndItemsOnStats
										rts

	; End of function FieldItem_CurePoisonAndParalysis


; =============== S U B R O U T I N E =======================================

FieldItem_IncreaseATK:
										
										moveq   #3,d6
										jsr     (UpdateRandomSeed).w
										addq.w  #2,d7
										clr.l   d1
										move.w  d7,d1
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $96                ; "{NAME}'s attack{N}power is boosted by {#}.{W2}"
										jsr     j_IncreaseBaseATK
										move.w  d7,d1
										jsr     j_IncreaseCurrentATK
										rts

	; End of function FieldItem_IncreaseATK


; =============== S U B R O U T I N E =======================================

FieldItem_IncreaseDEF:
										
										moveq   #3,d6
										jsr     (UpdateRandomSeed).w
										addq.w  #2,d7
										clr.l   d1
										move.w  d7,d1
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $97                ; "{NAME}'s defensive{N}power is boosted by {#}.{W2}"
										jsr     j_IncreaseBaseDEF
										move.w  d7,d1
										jsr     j_IncreaseCurrentDEF
										rts

	; End of function FieldItem_IncreaseDEF


; =============== S U B R O U T I N E =======================================

FieldItem_IncreaseAGI:
										
										moveq   #3,d6
										jsr     (UpdateRandomSeed).w
										addq.w  #2,d7
										clr.l   d1
										move.w  d7,d1
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $98                ; "{NAME}'s agility{N}is boosted by {#}.{W2}"
										jsr     j_IncreaseAGI
										move.w  d7,d1
										jsr     j_IncreaseCurrentAGI
										rts

	; End of function FieldItem_IncreaseAGI


; =============== S U B R O U T I N E =======================================

FieldItem_IncreaseMOV:
										
										jsr     j_GetBaseMOV
										clr.w   d7
										cmpi.b  #9,d1
										beq.w   loc_22B42
										moveq   #1,d7
										cmpi.b  #8,d1
										beq.w   loc_22B42
										moveq   #2,d7
loc_22B42:
										
										clr.l   d1
										move.w  d7,d1
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $99                ; "{NAME}'s movement{N}range enlarged by {#}.{W2}"
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
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $9A                ; "{NAME}'s max. HP{N}are raised by {#}.{W2}"
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
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $9B                ; "{NAME}'s max. MP{N}are raised by {#}.{W2}"
										jsr     j_IncreaseMP
										move.w  d7,d1
										jsr     j_IncreaseCurrentMP
										bra.s   return_22BC0
loc_22BBC:
										
										trap    #TEXTBOX
										dc.w $94                ; "It has no use.{W2}"
return_22BC0:
										
										rts

	; End of function FieldItem_IncreaseMP


; =============== S U B R O U T I N E =======================================

LevelUpCutscene:
										
										moveq   #0,d1
										jsr     j_SetCurrentEXP
										jsr     j_LevelUp
										lea     ((byte_FFAF82-$1000000)).w,a5
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										clr.l   d1
										move.b  (a5)+,d1
										cmpi.b  #$FF,d1
										bne.s   loc_22BEA
										trap    #TEXTBOX
										dc.w $94                ; "It has no use.{W2}"
										bra.w   loc_22C5A
loc_22BEA:
										
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $F4                ; "{NAME} became{N}level {#}!"
										move.b  (a5)+,d1
										beq.s   loc_22BFE
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $10A               ; "{D1}HP increased by {#}!"
loc_22BFE:
										
										move.b  (a5)+,d1
										beq.s   loc_22C0A
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $10B               ; "{D1}MP increased by {#}!"
loc_22C0A:
										
										move.b  (a5)+,d1
										beq.s   loc_22C16
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $10C               ; "{D1}Attack increased by {#}!"
loc_22C16:
										
										move.b  (a5)+,d1
										beq.s   loc_22C22
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $10D               ; "{D1}Defense increased by {#}!"
loc_22C22:
										
										move.b  (a5)+,d1
										beq.s   loc_22C2E
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $10E               ; "{D1}Agility increased by {#}!"
loc_22C2E:
										
										move.b  (a5)+,d1
										cmpi.b  #$FF,d1
										beq.w   loc_22C5A
										move.l  d1,d2
										andi.w  #$3F,d2 
										lsr.w   #6,d1
										bne.s   loc_22C4C
										move.w  d2,((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $10F               ; "{D1}{NAME} learned the new{N}magic spell {SPELL}!"
										bra.s   loc_22C5A
loc_22C4C:
										
										addq.w  #1,d1
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										move.w  d2,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $110               ; "{D1}{SPELL} increased to{N}level {#}!"
loc_22C5A:
										
										trap    #TEXTBOX
										dc.w $DC3               ; "{W1}"
										rts

	; End of function LevelUpCutscene


; =============== S U B R O U T I N E =======================================

; get first entity's X, Y and facing

sub_22C60:
										
										move.w  (ENTITY_DATA_STRUCT_X_AND_START).l,d1
										move.w  (ENTITY_DATA_STRUCT_Y).l,d2
										move.b  (ENTITY_DATA_STRUCT_FACING).l,d3
										ext.l   d1
										divu.w  #$180,d1
										ext.l   d2
										divu.w  #$180,d2
										andi.w  #3,d3
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
										ori.w   #$C000,(a1)+
										bra.s   loc_22C9E
loc_22C9A:
										
										andi.w  #$3FFF,(a1)+
loc_22C9E:
										
										dbf     d6,loc_22C90
										movem.l (sp)+,d6/a0-a1
										lea     $30(a0),a0
										lea     $80(a1),a1
										dbf     d7,loc_22C8C
										movem.l (sp)+,d6-a1
										movem.l d0/a0,-(sp)
										lea     (PALLETE_2_BIS).l,a0
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
										move.w  ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d7
										lsl.w   #6,d7
										add.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d7
										add.w   d7,d7
										lea     (RAM_START).l,a1
										adda.w  d7,a1
										move.w  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d6
										sub.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d6
										ext.l   d6
										divs.w  #$180,d6
										move.w  ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d7
										sub.w   ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d7
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
										
										andi.w  #$3FFF,(a1)+
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
										
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
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
										lea     ((ENTITY_UNIT_CURSOR-$1000000)).w,a0
										move.w  #$6F00,d0
										move.w  d0,(a0)
										move.w  d0,ENTITYDEF_OFFSET_XDEST(a0)
										move.b  #$FF,((BATTLE_CURRENT_ENTITY-$1000000)).w
										movem.l (sp)+,d0/a0
										rts

	; End of function HideUnitCursor


; =============== S U B R O U T I N E =======================================

ControlUnitCursor:
										
										bsr.w   LoadUnitCursorTileData
										clr.w   d2
										clr.w   d3
										move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d2
										move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d3
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										moveq   #$30,d0 
										jsr     sub_44024
										lsl.w   #5,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										adda.w  d0,a0
										move.w  d2,(a0)
										move.w  d3,2(a0)
										move.w  d2,$C(a0)
										move.w  d3,$E(a0)
										move.b  #$FF,((byte_FFDE9D-$1000000)).w
										move.b  #$30,((BATTLE_CURRENT_ENTITY-$1000000)).w 
loc_22DD2:
										
										jsr     (WaitForVInt).w 
										move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d0
										andi.w  #$70,d0 
										beq.s   loc_22DD2
										move.w  $C(a0),d2
										move.w  $E(a0),d3
										ext.l   d2
										ext.l   d3
										divs.w  #$180,d2
										divs.w  #$180,d3
										move.b  d2,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
										move.b  d3,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
										moveq   #$30,d0 
										jsr     j_SetEntityMovescriptToIdle
										move.w  #$6F00,(a0)
										move.w  #$6F00,$C(a0)
										clr.b   ((byte_FFDE9D-$1000000)).w
										move.b  #$FF,((BATTLE_CURRENT_ENTITY-$1000000)).w
										rts

	; End of function ControlUnitCursor


; =============== S U B R O U T I N E =======================================

; Out: D2 = chosen X
;      D3 = chosen Y
;      D4 = copied P1 input state bitfield

ControlBattleUnit:
										
										movem.l d0-d1/a0-a1,-(sp)
										link    a6,#-2
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a1
										bsr.w   GetEntityCombatantNumber
										move.w  d0,-2(a6)
										lsl.w   #ENTITYDEF_SIZE_BITS,d0
										adda.w  d0,a1
										move.b  $12(a1),d0
										move.w  d0,-(sp)
										move.b  $11(a1),d0
										lsl.b   #4,d0
										move.b  d0,$11(a1)
										jsr     (WaitForVInt).w 
										move.b  #$21,$12(a1) 
										bsr.w   sub_234C8
										move.w  -2(a6),d0
										jsr     j_SetControlledEntityActScript
										addi.w  #$10,d0
										lea     ((byte_FFAFA0-$1000000)).w,a0
										move.b  #1,(a0,d0.w)
loc_22E68:
										
										bsr.w   UpdateControlledUnitPos
										jsr     (WaitForVInt).w 
										move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d4
										andi.w  #$70,d4 
										beq.s   loc_22E68
										clr.b   (a0,d0.w)
										move.b  $11(a1),d0
										lsr.b   #4,d0
										move.b  d0,$11(a1)
										move.w  (sp)+,d0
										move.b  d0,$12(a1)
										bsr.w   sub_234C8
										move.b  #$FF,((BATTLE_CURRENT_ENTITY-$1000000)).w
										move.w  ENTITYDEF_OFFSET_XDEST(a1),d2
										ext.l   d2
										divs.w  #$180,d2
										move.w  ENTITYDEF_OFFSET_YDEST(a1),d3
										ext.l   d3
										divs.w  #$180,d3
										move.b  d2,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
										move.b  d3,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
										move.w  -2(a6),d0
										jsr     j_SetEntityMovescriptToIdle
										move.b  #$FF,((BATTLE_CURRENT_ENTITY-$1000000)).w
										unlk    a6
										movem.l (sp)+,d0-d1/a0-a1
										rts

	; End of function ControlBattleUnit


; =============== S U B R O U T I N E =======================================

UpdateControlledUnitPos:
										
										movem.w d0-d3,-(sp)
										move.w  (a1),d2
										addi.w  #$C0,d2 
										ext.l   d2
										divs.w  #$180,d2
										move.w  2(a1),d3
										addi.w  #$C0,d3 
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

GetEntityCombatantNumber:
										
										bsr.w   GetEntityNumberOfCombatant
										rts

	; End of function GetEntityCombatantNumber


; =============== S U B R O U T I N E =======================================

;     Convert combatant number to entity number.
;     In: D0 = combatant number
;     Out: D0 = entity number

GetEntityNumberOfCombatant:
										
										move.l  a0,-(sp)
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
										tst.b   d0              ; test if d0 represents an enemy index ?
										bpl.s   loc_22F3E
										subi.b  #$60,d0 
loc_22F3E:
										
										andi.w  #$FF,d0
										move.b  (a0,d0.w),d0
										movea.l (sp)+,a0
										rts

	; End of function GetEntityNumberOfCombatant


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
										cmpi.w  #$20,d0 
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
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a1
										bsr.s   GetEntityCombatantNumber
										move.w  d0,-2(a6)
										move.b  d0,((BATTLE_CURRENT_ENTITY-$1000000)).w
										lsl.w   #5,d0
										adda.w  d0,a1
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
										addi.w  #$10,d0
										lea     ((byte_FFAFA0-$1000000)).w,a0
										move.b  #1,(a0,d0.w)
										movea.l (sp)+,a0
loc_22FE8:
										
										move.b  (a0)+,d0
										cmpi.b  #$FF,d0
										beq.w   loc_2308E
										andi.w  #3,d0
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
										andi.b  #$F0,$1C(a1)
										move.b  -1(a0),d0
										cmp.b   -2(a0),d0
										beq.s   loc_2306A
										move.w  d4,4(a1)
										move.w  d5,6(a1)
										ori.b   #3,$1C(a1)
loc_2306A:
										
										cmp.b   (a0),d0
										beq.s   loc_23074
										ori.b   #$C,$1C(a1)
loc_23074:
										
										move.w  ((MOVE_SOUND-$1000000)).w,d0
										trap    #SOUND_COMMAND
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
										move.b  #$FF,((BATTLE_CURRENT_ENTITY-$1000000)).w
										move.w  (a1),d2
										ext.l   d2
										divs.w  #$180,d2
										move.w  2(a1),d3
										ext.l   d3
										divs.w  #$180,d3
										move.b  d2,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
										move.b  d3,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
										move.w  -2(a6),d0
										addi.w  #$10,d0
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
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										bne.s   loc_230F2
										moveq   #$FFFFFFFF,d0
										bra.w   loc_2321E
loc_230F2:
										
										jsr     (WaitForVInt).w 
										move.w  d0,d6
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
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
										
										bsr.w   GetEntityNumberOfCombatant
										move.w  d4,d1
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).w    
										move.w  (sp)+,d0
										bsr.w   sub_2322C
										move.b  #1,((FIGHTER_IS_TARGETTING-$1000000)).w
										jsr     (WaitForCameraToCatchUp).w
										jsr     j_CreateFighterMiniStatusWindow
										movem.l (sp)+,d1-a0
loc_23186:
										
										jsr     (WaitForVInt).w 
										cmpi.w  #1,d7
										beq.s   loc_231E0
										btst    #INPUT_A_UP_BIT,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_231A4
										subq.w  #1,d1
										bge.s   loc_231A0
										move.w  d7,d1
										subq.w  #1,d1
loc_231A0:
										
										bra.w   loc_23102
loc_231A4:
										
										btst    #INPUT_A_LEFT_BIT,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_231B8
										subq.w  #1,d1
										bge.s   loc_231B4
										move.w  d7,d1
										subq.w  #1,d1
loc_231B4:
										
										bra.w   loc_23102
loc_231B8:
										
										btst    #INPUT_A_DOWN_BIT,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_231CC
										addq.w  #1,d1
										cmp.w   d7,d1
										blt.s   loc_231C8
										clr.w   d1
loc_231C8:
										
										bra.w   loc_23102
loc_231CC:
										
										btst    #INPUT_A_RIGHT_BIT,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_231E0
										addq.w  #1,d1
										cmp.w   d7,d1
										blt.s   loc_231DC
										clr.w   d1
loc_231DC:
										
										bra.w   loc_23102
loc_231E0:
										
										btst    #INPUT_A_B_BIT,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_231F6
										jsr     j_HideFighterMiniStatusWindow
										move.w  #$FFFF,d0
										bra.w   loc_2321E
loc_231F6:
										
										btst    #INPUT_A_C_BIT,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_23208
										clr.w   d0
										move.b  (a0,d1.w),d0
										bra.w   loc_2321E
loc_23208:
										
										btst    #INPUT_A_A_BIT,((CURRENT_PLAYER_INPUT-$1000000)).w
										beq.s   loc_2321A
										clr.w   d0
										move.b  (a0,d1.w),d0
										bra.w   loc_2321E
loc_2321A:
										
										bra.w   loc_23186
loc_2321E:
										
										trap    #SOUND_COMMAND
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
										bsr.w   GetEntityNumberOfCombatant
										move.b  d0,((BATTLE_CURRENT_ENTITY-$1000000)).w
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
										move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d4
										move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d5
										move.b  d2,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
										move.b  d3,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										mulu.w  #$180,d4
										mulu.w  #$180,d5
										moveq   #$30,d0 
										jsr     sub_4402C
										lsl.w   #5,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										adda.w  d0,a0
										move.w  d4,(a0)
										move.w  d5,2(a0)
										move.w  d2,$C(a0)
										move.w  d3,$E(a0)
										bsr.w   sub_23414
										bsr.w   WaitForUnitCursor
										move.b  #$FF,((BATTLE_CURRENT_ENTITY-$1000000)).w
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

SetUnitCursorDestinationToNextBattleEntity:
										
										jsr     (WaitForVInt).w 
										bsr.w   LoadUnitCursorTileData
										clr.w   d4
										clr.w   d5
										move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d4
										move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d5
										move.b  d2,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
										move.b  d3,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										mulu.w  #$180,d4
										mulu.w  #$180,d5
										moveq   #ENTITYIDX_UNITCURSOR,d0
										jsr     j_SetUnitCursorActscript
										jsr     (WaitForVInt).w 
										lsl.w   #5,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										adda.w  d0,a0
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
										addi.w  #$10,d0
										addi.w  #$10,d1
										cmpi.w  #$50,d0 
										bge.s   loc_2334A
										move.w  #$50,d0 
loc_2334A:
										
										cmpi.w  #$70,d0 
										ble.s   loc_23354
										move.w  #$70,d0 
loc_23354:
										
										cmpi.w  #$50,d1 
										bge.s   loc_2335E
										move.w  #$50,d1 
loc_2335E:
										
										cmpi.w  #$70,d1 
										ble.s   loc_23368
										move.w  #$70,d1 
loc_23368:
										
										tst.b   ((SPECIAL_TURBO_CHEAT-$1000000)).w
										beq.s   loc_23376
										move.w  #$80,d0 
										move.w  #$80,d1 
loc_23376:
										
										tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
										bne.s   loc_23388
										move.w  d0,d7
										mulu.w  ((MAP_AREA_LAYER1_PARALLAX_X-$1000000)).w,d7
										lsr.w   #8,d7
										move.w  d7,((word_FFA820-$1000000)).w
loc_23388:
										
										tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
										bne.s   loc_2339A
										move.w  d1,d7
										mulu.w  ((MAP_AREA_LAYER1_PARALLAX_Y-$1000000)).w,d7
										lsr.w   #8,d7
										move.w  d7,((word_FFA822-$1000000)).w
loc_2339A:
										
										tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
										bne.s   loc_233AC
										move.w  d0,d7
										mulu.w  ((MAP_AREA_LAYER2_PARALLAX_X-$1000000)).w,d7
										lsr.w   #8,d7
										move.w  d7,((word_FFA824-$1000000)).w
loc_233AC:
										
										tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
										bne.s   loc_233BE
										move.w  d1,d7
										mulu.w  ((MAP_AREA_LAYER2_PARALLAX_Y-$1000000)).w,d7
										lsr.w   #8,d7
										move.w  d7,((word_FFA826-$1000000)).w
loc_233BE:
										
										move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
										move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
										move.w  d0,d2
										move.w  d1,d3
										subi.w  #$780,d0
										subi.w  #$780,d1
										addi.w  #$780,d2
										addi.w  #$600,d3
										cmp.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
										bge.s   loc_233E4
										move.w  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
loc_233E4:
										
										cmp.w   ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d2
										ble.s   loc_233F2
										move.w  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d0
										subi.w  #$F00,d0
loc_233F2:
										
										cmp.w   ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d1
										bge.s   loc_233FC
										move.w  ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d1
loc_233FC:
										
										cmp.w   ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d3
										ble.s   loc_2340A
										move.w  ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d1
										subi.w  #$D80,d1
loc_2340A:
										
										move.w  d0,d2
										move.w  d1,d3
										jsr     (SetCameraDest).w
										rts

	; End of function SetUnitCursorDestinationToNextBattleEntity


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

SetEntityBlinkingFlag:
										
										movem.l d0/a0,-(sp)
										bsr.w   GetEntityNumberOfCombatant
										lsl.w   #5,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										bset    #7,$1D(a0,d0.w)
										movem.l (sp)+,d0/a0
										rts

	; End of function SetEntityBlinkingFlag


; =============== S U B R O U T I N E =======================================

ClearEntityBlinkingFlag:
										
										movem.l d0/a0,-(sp)
										bsr.w   GetEntityNumberOfCombatant
										lsl.w   #5,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										bclr    #7,$1D(a0,d0.w)
										movem.l (sp)+,d0/a0
										rts

	; End of function ClearEntityBlinkingFlag


; =============== S U B R O U T I N E =======================================

SetCameraDestInTiles:
										
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										movem.w d2-d3,-(sp)
										movem.w (sp)+,d0-d1
										jsr     (SetCameraDest).w
										rts

	; End of function SetCameraDestInTiles


; =============== S U B R O U T I N E =======================================

LoadUnitCursorTileData:
										
										movem.l d0-a1,-(sp)
										jsr     (WaitForVInt).w 
										lea     UnitCursorTiles(pc), a0
										lea     ($D000).l,a1
										move.w  #$800,d0
										jsr     (DmaTilesViaFF8804bis).w
										jsr     (Set_FFDE94_bit3).w
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
										cmpi.b  #$F0,d1
										bcc.s   loc_23538
										move.b  $12(a1),d1
										cmpi.b  #$20,d1 
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
										lea     (pt_MapSprites).l,a0
										movea.l (a0,d1.w),a0
										lea     (FF6802_LOADING_SPACE).l,a1
										jsr     (LoadSpriteData).w
										movea.l a1,a0
										move.w  (sp)+,d1
										move.w  d1,d0
										lsl.w   #3,d1
										add.w   d0,d1
										lsl.w   #6,d1
										lea     ($7000).w,a1
										adda.w  d1,a1
										move.w  #$120,d0
										moveq   #2,d1
										jsr     (sub_119E).w    
										jsr     (Set_FFDE94_bit3).w
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
										lea     word_2358C(pc), a0
										clr.w   d2
										move.b  ((word_FFAF8E-$1000000)).w,d2
										andi.w  #$F,d2
										lsl.w   #6,d2
										adda.w  d2,a0
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

word_2358C:         dc.w $74
										dc.w $F10
										dc.w $4680
										dc.w $7C
										dc.w 1
										dc.w $F0A
										dc.w $4680
										dc.w 1
										dc.w 1
										dc.w $F0B
										dc.w $4680
										dc.w 1
										dc.w 1
										dc.w $F0C
										dc.w $4680
										dc.w 1
										dc.w 1
										dc.w $F0D
										dc.w $4680
										dc.w 1
										dc.w 1
										dc.w $F0E
										dc.w $4680
										dc.w 1
										dc.w 1
										dc.w $F0F
										dc.w $4680
										dc.w 1
										dc.w 1
										dc.w $F10
										dc.w $4680
										dc.w 1
										dc.w $56
										dc.w $F09
										dc.w $4690
										dc.w $7C
										dc.w $74
										dc.w $F0A
										dc.w $46A0
										dc.w $64
										dc.w $92
										dc.w $F0B
										dc.w $5690
										dc.w $7C
										dc.w $74
										dc.w $F10
										dc.w $4EA0
										dc.w $94
										dc.w 1
										dc.w $F0D
										dc.w $4680
										dc.w 1
										dc.w 1
										dc.w $F0E
										dc.w $4680
										dc.w 1
										dc.w 1
										dc.w $F0F
										dc.w $4680
										dc.w 1
										dc.w 1
										dc.w $F10
										dc.w $4680
										dc.w 1
										dc.w $3E
										dc.w $F09
										dc.w $4690
										dc.w $7C
										dc.w $74
										dc.w $F0A
										dc.w $46A0
										dc.w $4C
										dc.w $AA
										dc.w $F0B
										dc.w $5690
										dc.w $7C
										dc.w $74
										dc.w $F0C
										dc.w $4EA0
										dc.w $AC
										dc.w $56
										dc.w $F0D
										dc.w $46B0
										dc.w $5F
										dc.w $56
										dc.w $F0E
										dc.w $4EB0
										dc.w $99
										dc.w $92
										dc.w $F0F
										dc.w $56B0
										dc.w $5F
										dc.w $92
										dc.w $F10
										dc.w $5EB0
										dc.w $99

; =============== S U B R O U T I N E =======================================

sub_2364C:
										
										move.l  #$10F10,(byte_FFDCC0).l
										rts

	; End of function sub_2364C

UnitCursorTiles:    incbin "graphics/technical/unitcursortiles.bin"

; =============== S U B R O U T I N E =======================================

FadeOut_WaitForP1Input:
										
										move.w  d0,-(sp)
										move.w  #$FB,d0 
										jsr     (PlayMusicAfterCurrentOne).w
										jsr     (WaitForPlayerInput).w
										move.w  (sp)+,d0
										rts

	; End of function FadeOut_WaitForP1Input


; =============== S U B R O U T I N E =======================================

; In: D0 = entity idx
;     D1 = x pos
;     D2 = y pos

SetEntityPosition:
										
										movem.l d0/a0,-(sp)
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										lsl.w   #5,d0
										adda.w  d0,a0
										move.w  d1,(a0)
										move.w  d2,ENTITYDEF_OFFSET_Y(a0)
										move.w  d1,ENTITYDEF_OFFSET_XDEST(a0)
										move.w  d2,ENTITYDEF_OFFSET_YDEST(a0)
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
										
										move.b  ((BATTLE_CURRENT_ENTITY-$1000000)).w,d0
										ext.w   d0
										bpl.s   loc_237A4
										rts
loc_237A4:
										
										movem.l d3-a0,-(sp)
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										lsl.w   #5,d0
										adda.w  d0,a0
										move.w  (a0,d0.w),d1    ; get X
										move.w  2(a0,d0.w),d2   ; Y
										move.b  $10(a0,d0.w),d3 ; facing
										move.b  $11(a0,d0.w),d4 ; size ?
										andi.w  #3,d3
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
										lea     (RAM_START).l,a1
										move.w  (a1,d7.w),d7
										andi.w  #$3C00,d7
										cmpi.w  #$2800,d7
										beq.s   loc_237C8       ; continue offsetting position if encounter a "desk/counter" block flag
										clr.w   d0
										moveq   #$2F,d7 
loc_237FE:
										
										cmp.b   ((BATTLE_CURRENT_ENTITY-$1000000)).w,d0
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
										cmpi.w  #$180,d5
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
										
										cmpi.b  #$FF,(a0)
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
										
										move.b  ((BATTLE_CURRENT_ENTITY-$1000000)).w,d0
										ext.w   d0
										bpl.s   loc_2386C
										rts
loc_2386C:
										
										clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										lsl.w   #5,d0
										adda.w  d0,a0
										move.w  (a0,d0.w),d2
										move.w  ENTITYDEF_OFFSET_Y(a0,d0.w),d1
										move.b  $10(a0,d0.w),d3
										move.w  d2,d0
										andi.w  #3,d3
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
										lea     (RAM_START).l,a0
										move.w  (a0,d3.w),d3
										andi.w  #$3C00,d3
										cmpi.w  #$1800,d3
										bne.s   loc_238E8
										jsr     (OpenChest).w
										trap    #TEXTBOX
										dc.w $193               ; "{NAME} opened the chest.{W2}{CLEAR}"
										move.w  d2,d0
										andi.w  #$7F,d0 
										cmpi.b  #$7F,d0 
										bne.w   loc_239C8
										trap    #TEXTBOX
										dc.w $198               ; "But, it was empty.{W1}"
										bra.w   loc_23994
loc_238E8:
										
										cmpi.w  #$2C00,d3
										bne.s   loc_2390C
										jsr     (OpenVaseOrBarrel).w
										trap    #TEXTBOX
										dc.w $194               ; "{NAME} investigated{N}the vase.{W2}{CLEAR}"
										move.w  d2,d0
										andi.w  #$7F,d0 
										cmpi.b  #$7F,d0 
										bne.w   loc_239C8
										trap    #TEXTBOX
										dc.w $199               ; "It was dark inside.{W1}"
										bra.w   loc_23994
loc_2390C:
										
										cmpi.w  #$3000,d3
										bne.s   loc_23930
										jsr     (OpenVaseOrBarrel).w
										trap    #TEXTBOX
										dc.w $195               ; "{NAME} looked in{N}the barrel.{W2}{CLEAR}"
										move.w  d2,d0
										andi.w  #$7F,d0 
										cmpi.b  #$7F,d0 
										bne.w   loc_239C8
										trap    #TEXTBOX
										dc.w $19A               ; "It was empty.{W1}"
										bra.w   loc_23994
loc_23930:
										
										cmpi.w  #$3400,d3
										bne.s   loc_23954
										jsr     (OpenVaseOrBarrel).w
										trap    #TEXTBOX
										dc.w $1AB               ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
										move.w  d2,d0
										andi.w  #$7F,d0 
										cmpi.b  #$7F,d0 
										bne.w   loc_239C8
										trap    #TEXTBOX
										dc.w $19C               ; "Nothing was there.{W1}"
										bra.w   loc_23994
loc_23954:
										
										cmpi.w  #$1C00,d3
										bne.s   loc_23978
										jsr     (OpenVaseOrBarrel).w
										trap    #TEXTBOX
										dc.w $1A7               ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
										move.w  d2,d0
										andi.w  #$7F,d0 
										cmpi.b  #$7F,d0 
										bne.w   loc_239C8
										trap    #TEXTBOX
										dc.w $19C               ; "Nothing was there.{W1}"
										bra.w   loc_23994
loc_23978:
										
										jsr     j_RunMapSetupFunction
										bne.w   loc_23994
										tst.w   d6
										beq.s   loc_2398C
										clr.w   d0
										bra.w   return_2399A
loc_2398C:
										
										trap    #TEXTBOX
										dc.w $1A7               ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
										trap    #TEXTBOX
										dc.w $19C               ; "Nothing was there.{W1}"
loc_23994:
										
										trap    #TEXTBOX
										dc.w $FFFF
										moveq   #$FFFFFFFF,d0
return_2399A:
										
										rts

	; End of function sub_23862


; =============== S U B R O U T I N E =======================================

; get amount of gold (D2 - 0x80) as an offset from the gold table (see constants)

GetChestGoldAmount:
										
										subi.w  #$80,d2 
										andi.w  #ITEM_MASK_IDX,d2
										add.w   d2,d2
										move.w  ChestGoldAmounts(pc,d2.w),d1
										ext.l   d1
										rts

	; End of function GetChestGoldAmount

ChestGoldAmounts:   incbin "maps/global/chestgoldamounts.bin"

; START OF FUNCTION CHUNK FOR sub_23862

loc_239C8:
										
										clr.w   d0
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										cmpi.w  #$80,d2 
										blt.s   loc_239EE
										bsr.s   GetChestGoldAmount
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										jsr     j_IncreaseGold
										trap    #SOUND_COMMAND
										dc.w MUSIC_ITEM
										trap    #TEXTBOX
										dc.w $19E               ; "{NAME} found {#} gold{N}coins."
										bsr.w   FadeOut_WaitForP1Input
										bra.s   loc_23994
loc_239EE:
										
										move.w  d2,((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $19D               ; "{NAME} found{N}{ITEM}.{W2}{CLEAR}"
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmpi.w  #4,d2
										bge.s   loc_23A1E
										move.w  ((TEXT_NAME_INDEX_2-$1000000)).w,d1
										jsr     j_AddItem
										trap    #SOUND_COMMAND
										dc.w MUSIC_ITEM
										trap    #TEXTBOX
										dc.w $19F               ; "{NAME} recieved{N}{ITEM}."
										bsr.w   FadeOut_WaitForP1Input
										bra.w   loc_23994
loc_23A1E:
										
										jsr     j_UpdateForce
										lea     ((byte_FFB653-$1000000)).w,a0
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										subq.w  #2,d7
										bmi.w   loc_23A66
loc_23A32:
										
										clr.w   d0
										move.b  (a0)+,d0
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmpi.w  #4,d2
										bge.s   loc_23A62
										move.w  ((TEXT_NAME_INDEX_2-$1000000)).w,d1
										jsr     j_AddItem
										move.w  d0,((TEXT_NAME_INDEX_3-$1000000)).w
										trap    #SOUND_COMMAND
										dc.w MUSIC_ITEM
										trap    #TEXTBOX
										dc.w $1A0               ; "{NAME} passed the{N}{ITEM} to {NAME}."
										bsr.w   FadeOut_WaitForP1Input
										bra.w   loc_23994
loc_23A62:
										
										dbf     d7,loc_23A32
loc_23A66:
										
										move.w  ((TEXT_NAME_INDEX_2-$1000000)).w,d3
										clr.w   d0
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $1A1               ; "But, everyone's hands are{N}full.{W1}"
										move.w  d4,d0
										move.w  d5,d1
										jsr     (CloseChest).w
										jsr     (CloseVaseOrBarrel).w
										bra.w   loc_23994

; END OF FUNCTION CHUNK FOR sub_23862


; =============== S U B R O U T I N E =======================================

; In: D0 = map idx
;     D1 = battle idx

ExecuteBattleLoop:
										
										clr.b   ((PLAYER_TYPE-$1000000)).w
										trap    #SET_FLAG
										dc.w $18F               ; set after first battle's cutscene OR first save? Checked at witch screens
										trap    #CHECK_FLAG
										dc.w $58                ; checks if a game has been saved for copying purposes? (or if saved from battle?)
										beq.s   loc_23AB2
										move.l  ((SECONDS_COUNTER_FROM_SRAM-$1000000)).w,((SECONDS_COUNTER-$1000000)).w
										trap    #CLEAR_FLAG
										dc.w $58                ; checks if a game has been saved for copying purposes? (or if saved from battle?)
										jsr     j_ClearEnemyMoveInfo
										clr.b   ((BATTLE_CURRENT_ENTITY-$1000000)).w
										bsr.w   LoadBattle      
										bra.w   loc_23B40       
										bra.w   loc_23B0A       
loc_23AB2:
										
										clr.l   ((SECONDS_COUNTER-$1000000)).w
										movem.w d0-d1,-(sp)
										move.b  d0,((CURRENT_MAP-$1000000)).w
										move.b  d1,((CURRENT_BATTLE-$1000000)).w
										bsr.w   SetBattleVIntFuncs
										jsr     j_ExecuteBattleCutscene_Intro
										movem.w (sp)+,d0-d1
										move.b  d0,((CURRENT_MAP-$1000000)).w
										move.b  d1,((CURRENT_BATTLE-$1000000)).w
										moveq   #$5A,d1 
loc_23ADA:
										
										jsr     j_ClearFlag
										addq.w  #1,d1
										cmpi.w  #$69,d1 
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
										tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
										beq.s   loc_23B1E
										bsr.w   PrintAllActivatedDefCons
loc_23B1E:
										
										jsr     j_GetListOfSpawningEnemies
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										beq.s   loc_23B3C
										subq.w  #1,d7
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
loc_23B30:
										
										clr.w   d0
										move.b  (a0)+,d0
										bsr.w   SpawnEnemy
										dbf     d7,loc_23B30
loc_23B3C:
										
										bsr.w   CreateRandomizedTurnOrder
loc_23B40:
										
										clr.w   d0              ; start of individual turn execution
										move.b  ((BATTLE_CURRENT_TURN_OFFSET-$1000000)).w,d0
										lea     ((BATTLE_TURN_ORDER-$1000000)).w,a0
										move.b  (a0,d0.w),d0
										cmpi.b  #$FF,d0
										beq.s   loc_23B0A       
										bsr.w   sub_23EB0       
										tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
										beq.s   loc_23B6A
										cmpi.b  #$71,((P1_INPUT-$1000000)).w
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
										move.b  ((BATTLE_CURRENT_TURN_OFFSET-$1000000)).w,d0
										lea     ((BATTLE_TURN_ORDER-$1000000)).w,a0
										move.b  (a0,d0.w),d0
										bsr.w   HandleAfterTurnEffects
										jsr     HandleKilledCombatants(pc)
										nop
										bsr.w   GetRemainingFighters
										tst.w   d2
										beq.w   loc_23D44
										tst.w   d3
										beq.w   loc_23CBA
										addq.b  #2,((BATTLE_CURRENT_TURN_OFFSET-$1000000)).w
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
										
										cmpi.b  #CHAR_IDX_PETER,d0
										beq.w   loc_23C1E
										cmpi.b  #CHAR_IDX_LEMON,d0
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
										andi.w  #STATUSEFFECT_LASTING_EFFECTS_MASK,d1
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
										cmpi.b  #BATTLEIDX_FAIRY_WOODS,((CURRENT_BATTLE-$1000000)).w
										bne.s   loc_23CCC
										jsr     sub_100A0
loc_23CCC:
										
										move.b  ((CURRENT_MAP-$1000000)).w,((byte_FFA84D-$1000000)).w
										jsr     (UpdateForceAndGetFirstForceMemberIndex).w
										jsr     j_GetXPos
										add.b   ((byte_FFF706-$1000000)).w,d1
										move.b  d1,((byte_FFA84E-$1000000)).w
										jsr     j_GetYPos
										add.b   ((byte_FFF707-$1000000)).w,d1
										move.b  d1,((byte_FFA84F-$1000000)).w
										bsr.w   GetEntityNumberOfCombatant
										lsl.w   #5,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										move.b  $10(a0,d0.w),((byte_FFA850-$1000000)).w
										move.b  #0,((byte_FFA84C-$1000000)).w
										jsr     j_ExecuteAfterBattleCutscene
										clr.w   d1
										move.b  ((CURRENT_BATTLE-$1000000)).w,d1
										addi.w  #$190,d1
										jsr     j_ClearFlag
										addi.w  #$64,d1 
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
										clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #SOUND_COMMAND
										dc.w MUSIC_SAD_THEME_2  ; sad theme 2
										trap    #TEXTBOX
										dc.w $16B               ; "{LEADER} is exhausted.{W1}"
										trap    #TEXTBOX
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
										cmpi.b  #4,((CURRENT_BATTLE-$1000000)).w
										bne.s   return_23D96
										trap    #CLEAR_FLAG     ; HARDCODED battle 4 behaviour : you can lose this battle
										dc.w $194               ; Battle 4 unlocked
										trap    #SET_FLAG
										dc.w $1F8               ; Battle 4 completed
										jsr     sub_1AC04C
										moveq   #$11,d0
										clr.w   d4
return_23D96:
										
										rts

; END OF FUNCTION CHUNK FOR ExecuteBattleLoop


; =============== S U B R O U T I N E =======================================

sub_23D98:
										
										move.w  -2(a6),d0
										move.w  ((word_FFB634-$1000000)).w,d1
										jsr     j_RemoveItemBySlot
										bsr.w   sub_23E38
										move.w  -2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  ((word_FFB630-$1000000)).w,((TEXT_NAME_INDEX_2-$1000000)).w
										andi.w  #ITEM_MASK_IDX,((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $113               ; "{NAME} used{N}{ITEM}!"
										bra.w   loc_23DFA
loc_23DC4:
										
										move.w  -2(a6),d0
										move.w  ((word_FFB630-$1000000)).w,d1
										jsr     j_GetSpellCost
										jsr     j_DecreaseCurrentMP
										bsr.w   sub_23E38
										move.w  -2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  ((word_FFB630-$1000000)).w,((TEXT_NAME_INDEX_2-$1000000)).w
										andi.w  #SPELL_MASK_IDX,((TEXT_NAME_INDEX_2-$1000000)).w
										move.l  #1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $112               ; "{NAME} cast{N}{SPELL} level {#}!"
loc_23DFA:
										
										trap    #SOUND_COMMAND
										dc.w SFX_SPELL_CAST
										jsr     j_ExecuteFlashScreenScript
										trap    #TEXTBOX
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
										move.b  ((CURRENT_BATTLE-$1000000)).w,d1
										addi.w  #$1F4,d1
										jsr     j_CheckFlag
										beq.s   return_23E36
										subi.w  #$64,d1 
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

; HARDCODED battle->map relationship ?

GetEgressPositionForBattle:
										
										clr.b   d7
										move.b  ((CURRENT_BATTLE-$1000000)).w,d7
										cmpi.b  #$26,d7 
										bne.s   loc_23E60
										trap    #CLEAR_FLAG
										dc.w $1B6               ; Battle 38 unlocked
loc_23E60:
										
										cmpi.b  #$27,d7 
										bne.s   loc_23E6A
										trap    #CLEAR_FLAG
										dc.w $1B7               ; Battle 39 unlocked
loc_23E6A:
										
										cmpi.b  #$10,d7
										bne.s   loc_23E76
										moveq   #$D,d0
										bra.w   loc_23EAA
loc_23E76:
										
										cmpi.b  #$11,d7
										bne.s   loc_23E82
										moveq   #9,d0
										bra.w   loc_23EAA
loc_23E82:
										
										cmpi.b  #$D,d7
										bne.s   loc_23E8E
										moveq   #$A,d0
										bra.w   loc_23EAA
loc_23E8E:
										
										cmpi.b  #$1F,d7
										bne.s   loc_23E9A
										moveq   #$24,d0 
										bra.w   loc_23EAA
loc_23E9A:
										
										cmpi.b  #$20,d7 
										bne.s   loc_23EA6
										moveq   #2,d0
										bra.w   loc_23EAA
loc_23EA6:
										
										move.b  ((EGRESS_MAP_INDEX-$1000000)).w,d0
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
										andi.w  #$FF,d0
										move.w  d0,-2(a6)
loc_23EC4:
										
										bsr.w   ClearDeadCombatantsListLength
										cmpi.b  #BATTLEIDX_TAROS,((CURRENT_BATTLE-$1000000)).w
										bne.s   loc_23EDA
										tst.w   -2(a6)
										bne.s   loc_23EDA
										trap    #CLEAR_FLAG
										dc.w $70                ; cleared, set, and checked in ASM x09EC4..x09F27 (CheckForTaros ASM)
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
										bsr.w   GetEntityNumberOfCombatant
										move.b  d0,((BATTLE_CURRENT_ENTITY-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   SetUnitCursorDestinationToNextCombatant
										move.w  -2(a6),d0
										jsr     j_GetStatus
										andi.w  #COM_STATUS_MASK_MUDDLE,d1
										bne.w   loc_23F58       
										jsr     j_GetCharacterWord34
										andi.w  #4,d1
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
										
										jsr     j_sub_DEFC      ; AI controlled unit (enemy, auto-control cheat, MUDDLEd force member)
loc_23F5E:
										
										bsr.w   WaitForUnitCursor
																						; player controlled unit (normal force member, enemy with control opponent cheat)
										jsr     (WaitForCameraToCatchUp).w
										clr.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
										move.w  -2(a6),d0
										move.w  d0,((MOVING_BATTLE_ENTITY_IDX-$1000000)).w
										jsr     j_CreateFighterMiniStatusWindow
										jsr     j_CreateLandEffectWindow
										move.w  -2(a6),d0
										jsr     j_GenerateTargetRangeLists
										bsr.w   CreateMoveableRangeForUnit
										bsr.w   HideUnitCursor
										move.w  -2(a6),d0
										jsr     j_GetStatus
										andi.w  #COM_STATUS_MASK_SLEEP,d1
										bne.w   loc_2420E
										jsr     j_GetStatus
										andi.w  #CHAR_STATUS_MASK_STUN,d1
										bne.w   loc_2420E
										move.w  -2(a6),d0
										jsr     j_GetStatus
										andi.w  #COM_STATUS_MASK_MUDDLE,d1
										bne.w   loc_24036
										jsr     j_GetCharacterWord34
										andi.w  #4,d1
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
										cmpi.w  #$FFFF,d0
										bne.w   loc_2403A
										jsr     (WaitForCameraToCatchUp).w
										move.w  -2(a6),d0
										clr.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
										jsr     j_HideLandEffectWindow
										jsr     j_HideFighterMiniStatusWindow
										move.w  -2(a6),d0
										bsr.w   SetEntityBlinkingFlag
										move.w  -2(a6),d0
										bsr.w   GetEntityNumberOfCombatant
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
										
										cmpi.w  #ACTION_SPELL,((BATTLESCENE_ACTION_TYPE-$1000000)).w
										bne.s   loc_24052
										move.w  ((word_FFB630-$1000000)).w,d0
										andi.w  #SPELL_MASK_IDX,d0
										cmpi.w  #SPELLIDX_EGRESS,d0
										beq.w   loc_23DC4
loc_24052:
										
										cmpi.w  #ACTION_ITEM,((BATTLESCENE_ACTION_TYPE-$1000000)).w
										bne.s   loc_2406A
										move.w  ((word_FFB630-$1000000)).w,d0
										andi.w  #ITEM_MASK_IDX,d0
										cmpi.w  #ITEMIDX_ANGEL_WING,d0
										beq.w   sub_23D98
loc_2406A:
										
										cmpi.w  #3,((BATTLESCENE_ACTION_TYPE-$1000000)).w
										beq.w   loc_2420E
										cmpi.w  #$80,((BATTLESCENE_ACTION_TYPE-$1000000)).w 
										bne.w   loc_24090
										clr.w   ((BATTLESCENE_ACTION_TYPE-$1000000)).w
										move.w  ((word_FFB630-$1000000)).w,d0
										move.w  -2(a6),((word_FFB630-$1000000)).w
										move.w  d0,-2(a6)
loc_24090:
										
										move.w  -2(a6),d0
										jsr     j_GetClass      
										cmpi.w  #$1C,d1
										bne.s   loc_240E6
										tst.w   ((BATTLESCENE_ACTION_TYPE-$1000000)).w
										bne.s   loc_240E6
										moveq   #4,d6
										jsr     (UpdateRandomSeed).w
										tst.w   d7
										bne.s   loc_240E6
										move.w  ((word_FFB630-$1000000)).w,((word_FFB632-$1000000)).w
										move.w  #1,((BATTLESCENE_ACTION_TYPE-$1000000)).w
										jsr     j_GetCurrentLevel
										clr.w   d0
										cmpi.w  #$20,d1 
										blt.s   loc_240CC
										addq.w  #1,d0
loc_240CC:
										
										cmpi.w  #$28,d1 
										blt.s   loc_240D4
										addq.w  #1,d0
loc_240D4:
										
										cmpi.w  #$32,d1 
										blt.s   loc_240DC
										addq.w  #1,d0
loc_240DC:
										
										lsl.w   #6,d0
										ori.w   #$29,d0 
										move.w  d0,((word_FFB630-$1000000)).w
loc_240E6:
										
										cmpi.b  #$2C,((CURRENT_BATTLE-$1000000)).w 
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
										cmpi.w  #$C,d1          ; HARDCODED music choices
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
										cmpi.b  #$57,d1 
										bne.s   loc_24144
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
																						; boss
loc_24144:
										
										cmpi.b  #$58,d1 
										bne.s   loc_24150
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_24150:
										
										cmpi.b  #$5B,d1 
										bne.s   loc_2415C
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_2415C:
										
										cmpi.b  #$5C,d1 
										bne.s   loc_24168
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_24168:
										
										cmpi.b  #$5E,d1 
										bne.s   loc_24174
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_24174:
										
										cmpi.b  #$5F,d1 
										bne.s   loc_24180
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_24180:
										
										cmpi.b  #$60,d1 
										bne.s   loc_2418C
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_2418C:
										
										cmpi.b  #$61,d1 
										bne.s   loc_24198
										move.b  #MUSIC_BOSS_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
loc_24198:
										
										cmpi.b  #$62,d1 
										bne.s   loc_241A4
										move.b  #MUSIC_ZEON_ATTACK,((SKIRMISH_MUSIC_INDEX-$1000000)).w
																						; zeon
loc_241A4:
										
										clr.w   d0
										move.b  ((SKIRMISH_FIRST_ENEMY-$1000000)).w,d0
										cmpi.b  #$FF,d0
										bne.s   loc_241B4
										move.w  #$FFFF,d0
loc_241B4:
										
										clr.w   d1
										move.b  ((SKIRMISH_FIRST_ALLY-$1000000)).w,d1
										cmpi.b  #$FF,d1
										bne.s   loc_241C4
										move.w  #$FFFF,d1
loc_241C4:
										
										movem.l a6,-(sp)
										jsr     j_BigBattleSceneFunction
										move.b  #$FF,((WINDOW_HIDING_FORBIDDEN-$1000000)).w
										jsr     j_ExecuteBattlesceneScript
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
										move.b  #$FF,((BATTLE_CURRENT_ENTITY-$1000000)).w
										movem.l (sp)+,a6
										bra.s   loc_2423E
loc_2420E:
										
										jsr     (WaitForCameraToCatchUp).w
										jsr     (WaitForVInt).w 
										clr.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   GetEntityNumberOfCombatant
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
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										jsr     j_GetStatus
										move.w  d1,d2
										andi.w  #1,d1
										beq.s   loc_24294
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										andi.w  #$FFFE,d2
										move.w  #2,d6
										jsr     (UpdateRandomSeed).w
										tst.w   d7
										bne.s   loc_24288
										trap    #TEXTBOX
										dc.w $166               ; "{CLEAR}{NAME} is no longer stunned.{D3}"
										clr.w   d1
										bra.s   loc_2428C
loc_24288:
										
										trap    #TEXTBOX
										dc.w $135               ; "{NAME} is stunned.{D3}"
loc_2428C:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_24294:
										
										jsr     j_GetStatus
										move.w  d1,d2
										andi.w  #$C0,d1 
										beq.s   loc_242CE
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										andi.w  #$FF3F,d2
										move.w  d1,d6
										jsr     (UpdateRandomSeed).w
										andi.w  #$C0,d7 
										bne.s   loc_242BE
										trap    #TEXTBOX
										dc.w $162               ; "{CLEAR}{NAME} has awakened.{D3}"
										clr.w   d1
										bra.s   loc_242C6
loc_242BE:
										
										trap    #TEXTBOX
										dc.w $132               ; "{NAME} is sleeping.{D3}"
										subi.w  #$40,d1 
loc_242C6:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_242CE:
										
										jsr     j_GetStatus
										move.w  d1,d2
										andi.w  #$30,d1 
										beq.s   loc_24308
										andi.w  #$FFCF,d2
										move.w  d1,d6
										jsr     (UpdateRandomSeed).w
										andi.w  #$30,d7 
										bne.s   loc_242FC
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $163               ; "{CLEAR}{NAME} is fine.{D3}"
										clr.w   d1
										andi.w  #$FFF7,d2
										bra.s   loc_24300
loc_242FC:
										
										subi.w  #$10,d1
loc_24300:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_24308:
										
										jsr     j_GetStatus
										move.w  d1,d2
										andi.w  #$300,d1
										beq.s   loc_24344
										andi.w  #$FCFF,d2
										move.w  d1,d6
										jsr     (UpdateRandomSeed).w
										andi.w  #$300,d7
										bne.s   loc_24338
										move.w  #6,((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  d0,((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $15F               ; "{CLEAR}{SPELL} expired.{N}{NAME} is no longer{N}silenced.{D3}"
										clr.w   d1
										bra.s   loc_2433C
loc_24338:
										
										subi.w  #$100,d1
loc_2433C:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_24344:
										
										jsr     j_GetStatus
										move.w  d1,d2
										andi.w  #$C00,d1
										beq.s   loc_2436E
										andi.w  #$F3FF,d2
										subi.w  #$400,d1
										bne.s   loc_24366
										move.w  #4,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $15D               ; "{CLEAR}{SPELL} expired.{N}Agility and defense{N}return to normal.{D3}"
loc_24366:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_2436E:
										
										jsr     j_GetStatus
										move.w  d1,d2
										andi.w  #$C000,d1
										beq.s   loc_24398
										andi.w  #$3FFF,d2
										subi.w  #$4000,d1
										bne.s   loc_24390
										move.w  #5,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $15E               ; "{CLEAR}{SPELL} expired.{N}Attack returns to normal.{D3}"
loc_24390:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_24398:
										
										jsr     j_GetStatus
										move.w  d1,d2
										andi.w  #$3000,d1
										beq.s   loc_243C2
										andi.w  #$CFFF,d2
										subi.w  #$1000,d1
										bne.s   loc_243BA
										move.w  #3,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $15C               ; "{CLEAR}{SPELL} expired.{N}Agility and defense{N}return to normal.{D3}"
loc_243BA:
										
										or.w    d2,d1
										jsr     j_SetStatus
loc_243C2:
										
										jsr     j_GetEquippedWeapon
										cmpi.w  #$61,d1 
										bne.s   loc_243F0
										jsr     j_GetCurrentHP
										move.w  d1,d2
										moveq   #2,d1
										jsr     j_IncreaseCurrentHP
										sub.w   d2,d1
										ble.s   loc_243F0
										ext.l   d1
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $164               ; "{CLEAR}{NAME} recovered{N}{#} hit points.{D3}"
loc_243F0:
										
										jsr     j_GetEquippedWeapon
										cmpi.w  #$64,d1 
										bne.s   loc_2441E
										jsr     j_GetCurrentMP
										move.w  d1,d2
										moveq   #2,d1
										jsr     j_IncreaseCurrentMP
										sub.w   d2,d1
										ble.s   loc_2441E
										ext.l   d1
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $165               ; "{CLEAR}{NAME} recovered{N}{#} magic points.{D3}"
loc_2441E:
										
										jsr     j_GetEquippedRing
										cmpi.w  #ITEMIDX_LIFE_RING,d1
										bne.s   loc_2444C
										jsr     j_GetCurrentHP
										move.w  d1,d2
										moveq   #ITEMDEF_LIFE_RING_RECOVERY,d1
										jsr     j_IncreaseCurrentHP
										sub.w   d2,d1
										ble.s   loc_2444C
										ext.l   d1
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $164               ; "{CLEAR}{NAME} recovered{N}{#} hit points.{D3}"
loc_2444C:
										
										jsr     j_GetStatus
										andi.w  #2,d1
										beq.s   loc_2447C
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										moveq   #2,d1
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $133               ; "{CLEAR}{NAME} gets damaged{N}by {#} because of the poison.{D3}"
										jsr     j_DecreaseCurrentHP
										tst.w   d1
										bne.s   loc_2447C
										trap    #TEXTBOX
										dc.w $134               ; "{NAME} is exhausted.{D3}"
										addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
										move.b  d0,((DEAD_COMBATANTS_LIST-$1000000)).w
loc_2447C:
										
										jsr     j_ApplyStatusAndItemsOnStats
										trap    #TEXTBOX
										dc.w $FFFF
loc_24486:
										
										unlk    a6
										rts

	; End of function HandleAfterTurnEffects


; =============== S U B R O U T I N E =======================================

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
										bsr.w   GetEntityNumberOfCombatant
										move.b  d0,((BATTLE_CURRENT_ENTITY-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   SetUnitCursorDestinationToNextCombatant
										bsr.w   WaitForUnitCursor
										jsr     (WaitForCameraToCatchUp).w
										bsr.w   HideUnitCursor
loc_244D2:
										
										moveq   #$B,d7
loc_244D4:
										
										move.w  -2(a6),d0
										bsr.w   GetEntityNumberOfCombatant
										move.w  d7,d1
										addq.w  #3,d1
										andi.w  #3,d1
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).l    
										moveq   #3,d0
										jsr     (Sleep).w       
										dbf     d7,loc_244D4
										trap    #SOUND_COMMAND
										dc.w SFX_LANDSTALKER_SWITCH
										move.w  -2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $18D               ; "{CLEAR}{NAME} appeared!{D3}"
										trap    #TEXTBOX
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
										jsr     GetEntityNumberOfCombatant
										move.w  d6,d1
										andi.w  #3,d1
										clr.w   d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).l    
										cmpi.b  #GFX_MAX_SPRITES_TO_LOAD,((NUM_SPRITES_TO_LOAD-$1000000)).w
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
										trap    #SOUND_COMMAND
										dc.w SFX_BATTLEFIELD_DEATH
										moveq   #2,d6
loc_2457A:
										
										lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
										move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
										subq.w  #1,d7
loc_24584:
										
										clr.w   d0
										move.b  (a0)+,d0
										jsr     GetEntityNumberOfCombatant
										cmpi.b  #$2F,d0 
										bne.s   loc_245A4
										move.l  #$60006000,((byte_FFAEE2-$1000000)).w
										move.l  #$60006000,((byte_FFAEEE-$1000000)).w
loc_245A4:
										
										move.w  #3,d1
										sub.w   d6,d1
										clr.w   d2
										move.w  #$3F,d3 
										jsr     (sub_6052).l    
										cmpi.b  #7,((NUM_SPRITES_TO_LOAD-$1000000)).w
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
										jsr     GetEntityNumberOfCombatant
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
										bsr.w   GetEntityNumberOfCombatant
										move.b  d0,((BATTLE_CURRENT_ENTITY-$1000000)).w
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
										lea     (BATTLE_ENTITY_MOVE_STRING).l,a0
										bsr.w   MoveBattleEntityByMoveString
										move.w  #$FFFF,((BATTLESCENE_ACTION_TYPE-$1000000)).w
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
										trap    #SOUND_COMMAND
										dc.w SFX_REFUSAL
										beq.w   loc_2466C
loc_24718:
										
										addq.w  #1,d0
										cmpi.w  #COM_ALLIES_NUM,d0
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
										cmpi.w  #$FFFF,d2
										bne.s   loc_2476C       ; if d2 != FFFF, then there is an item ?
										moveq   #1,d2
										bra.s   loc_2476E
loc_2476C:
										
										moveq   #2,d2
loc_2476E:
										
										move.w  -2(a6),d0
										jsr     j_sub_C404
										tst.w   ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
										bne.s   loc_24782
										moveq   #3,d0
										bra.s   loc_24784
loc_24782:
										
										clr.w   d0
loc_24784:
										
										bsr.w   HideUnitCursor
										move.w  (sp)+,d1
										lea     (InitStack).w,a0
										jsr     j_ExecuteMenu
										cmpi.w  #$FFFF,d0
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
										jsr     j_sub_C404
										bsr.w   CreateMoveableRangeForUnit
										tst.w   ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
										bne.w   loc_247F0
										trap    #TEXTBOX
										dc.w $1B3               ; "No opponent there.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24746
loc_247F0:
										
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   sub_230E2
										cmpi.w  #$FFFF,d0
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
										clr.w   ((BATTLESCENE_ACTION_TYPE-$1000000)).w
										clr.w   d0
										bra.w   loc_25188
loc_2483C:
										
										cmpi.w  #1,d0
										bne.w   loc_24982
										move.w  -2(a6),d0
										clr.w   d1
										jsr     j_GetSpellAndNumberOfSpells
										tst.w   d2
										bne.w   loc_24864
										trap    #TEXTBOX
										dc.w $1B4               ; "Learned no new magic spell.{W1}"
										trap    #TEXTBOX
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
										cmpi.w  #$FFFF,d0
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
										jsr     j_GetSpellCost
										sub.w   d1,d3
										bge.w   loc_248E6
										trap    #TEXTBOX
										dc.w $1B5               ; "More MP needed.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bra.s   loc_24866
loc_248E6:
										
										move.w  d4,d1
										move.w  -2(a6),d0
										jsr     j_CreateSpellRangeGrid
										bsr.w   CreateMoveableRangeForUnit
										tst.w   ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
										bne.w   loc_2490C
										trap    #TEXTBOX
										dc.w $1B3               ; "No opponent there.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24866
loc_2490C:
										
										move.w  ((word_FFB630-$1000000)).w,d1
										jsr     j_GetSpellDefAddress
										move.b  6(a0),((word_FFAF8E-$1000000)).w
										bsr.w   sub_230E2
										cmpi.w  #$FFFF,d0
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
										move.w  #1,((BATTLESCENE_ACTION_TYPE-$1000000)).w
										clr.w   d0
										bra.w   loc_25188

	; End of function sub_24662


; =============== S U B R O U T I N E =======================================

;     createSpellRangeGridMaster???

sub_24966:
										
										movem.l d0-a6,-(sp)
										move.w  ((MOVING_BATTLE_ENTITY_IDX-$1000000)).w,d0
										move.w  ((word_FFB18C-$1000000)).w,d1
										jsr     j_CreateSpellRangeGrid
										bsr.w   CreateMoveableRangeForUnit
										movem.l (sp)+,d0-a6
										rts

	; End of function sub_24966


; START OF FUNCTION CHUNK FOR sub_24662

loc_24982:
										
										cmpi.w  #2,d0
										bne.w   loc_25072
										move.w  -2(a6),d0
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										tst.w   d2
										bne.w   loc_249A8
										trap    #TEXTBOX
										dc.w $1B6               ; "You have no item.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_24746
loc_249A8:
										
										clr.w   d1
loc_249AA:
										
										moveq   #3,d2
										clr.w   d0
										lea     (InitStack).w,a0
										jsr     j_ExecuteMenu
										cmpi.w  #$FFFF,d0
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
										cmpi.w  #$FFFF,d0
										bne.w   loc_24A24
										bsr.w   ClearFadingBlockRange
										bra.s   loc_249AA
loc_24A24:
										
										move.w  d0,((word_FFB630-$1000000)).w
										move.w  d1,((word_FFB634-$1000000)).w
										move.w  d0,d1
										move.w  -2(a6),d0
										jsr     j_IsItemUsableWeaponInBattle
										bcs.w   loc_24A4A
										trap    #TEXTBOX
										dc.w $1B7               ; "It has no effect.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24746
loc_24A4A:
										
										move.w  ((word_FFB630-$1000000)).w,d1
										move.w  -2(a6),d0
										jsr     j_CreateItemRangeGrid
										bsr.w   CreateMoveableRangeForUnit
										tst.w   ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
										bne.w   loc_24A72
										trap    #TEXTBOX
										dc.w $1B7               ; "It has no effect.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_249CE
loc_24A72:
										
										move.w  ((word_FFB630-$1000000)).w,d1
										jsr     j_GetItemDefAddress
										clr.w   d1
										move.b  ITEMDEF_OFFSET_SPELL(a0),d1
										jsr     j_GetSpellDefAddress
										move.b  SPELLDEF_OFFSET_RADIUS(a0),((word_FFAF8E-$1000000)).w
										bsr.w   sub_230E2
										cmpi.w  #$FFFF,d0
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
										bra.w   loc_249CE
loc_24AC8:
										
										move.w  d0,((word_FFB632-$1000000)).w
										move.w  d0,-4(a6)
										move.w  #ACTION_ITEM,((BATTLESCENE_ACTION_TYPE-$1000000)).w
										clr.w   d0
										bra.w   loc_25188
loc_24ADC:
										
										movem.l d0-a6,-(sp)
										move.w  ((MOVING_BATTLE_ENTITY_IDX-$1000000)).w,d0
										move.w  ((word_FFB18C-$1000000)).w,d1
										jsr     j_IsItemUsableWeaponInBattle
										bcc.s   loc_24AFC
										jsr     j_CreateItemRangeGrid
										bsr.w   CreateMoveableRangeForUnit
										bra.s   loc_24B00
loc_24AFC:
										
										bsr.w   ClearFadingBlockRange
loc_24B00:
										
										movem.l (sp)+,d0-a6
										rts
loc_24B06:
										
										cmpi.w  #2,d0
										bne.w   loc_24D64
										move.w  -2(a6),d0
										jsr     j_GetEquippableWeapons
										move.w  d1,d2
										jsr     j_GetEquippableRings
										add.w   d2,d1
										bne.w   loc_24B34
										trap    #TEXTBOX
										dc.w $1BC               ; "You have nothing to equip.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_249AA
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
										
										lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
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
										
										lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
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
										cmpi.w  #4,d3
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
										
										cmpi.w  #4,d2
										beq.w   loc_24CC4
										move.w  d2,d1
										jsr     j_UnequipItemIfNotCursed
										cmpi.w  #2,d2
										bne.w   loc_24CC4
										cmp.w   d4,d1
										beq.w   return_24CF4
										jsr     sub_10064
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										trap    #TEXTBOX
										dc.w $2B                ; "Gosh!  The curse prohibits{N}you from exchanging{N}equipment!{W2}"
										bra.w   loc_24CE6
loc_24CC4:
										
										move.w  d4,d1
										jsr     j_EquipItem
										cmpi.w  #2,d2
										bne.w   return_24CF4
										jsr     sub_10064
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $22                ; "Gosh!  {NAME} is{N}cursed!{W2}"
loc_24CE6:
										
										bsr.w   FadeOut_WaitForP1Input
										trap    #TEXTBOX
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
										lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
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
										cmpi.w  #4,d1
										bge.s   loc_24D42
										jsr     j_EquipItem
loc_24D42:
										
										jsr     sub_10060
										jsr     j_sub_C404
										bsr.w   CreateMoveableRangeForUnit
										move.w  ((MOVING_BATTLE_ENTITY_IDX-$1000000)).w,d0
										move.w  (sp)+,d1
										jsr     j_SetStatus
										movem.l (sp)+,d0-a6
										rts

	; End of function sub_24C4E


; START OF FUNCTION CHUNK FOR sub_24662

loc_24D64:
										
										cmpi.w  #1,d0
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
										jsr     j_sub_C4E8
										bsr.w   CreateMoveableRangeForUnit
										tst.w   ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
										bne.w   loc_24DCC
										trap    #TEXTBOX
										dc.w $1B3               ; "No opponent there.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bsr.w   ClearFadingBlockRange
										bra.w   loc_249AA
loc_24DCC:
										
										bsr.w   HideUnitCursor
										jsr     (WaitForVInt).w 
										clr.w   d0
										lea     (InitStack).w,a0
										jsr     sub_10004
										cmpi.w  #$FFFF,d0
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
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										trap    #TEXTBOX
										dc.w $1B9               ; "The equipment is cursed.{W1}"
										bsr.w   FadeOut_WaitForP1Input
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bra.s   loc_24DCC
loc_24E26:
										
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  -2(a6),d0
										bsr.w   sub_230E2
										cmpi.w  #$FFFF,d0
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
										cmpi.w  #4,d2
										beq.w   loc_24E8E
										move.w  ((word_FFB630-$1000000)).w,d1
										andi.w  #7,d1
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
										lea     (InitStack).w,a0
										jsr     sub_10004
										cmpi.w  #$FFFF,d0
										bne.w   loc_24EDE
										bra.w   loc_24E26
loc_24EDE:
										
										move.w  d0,((word_FFB632-$1000000)).w
										move.w  d1,((BATTLESCENE_ACTION_TYPE-$1000000)).w
										btst    #7,d0
										beq.w   loc_24F16
										move.w  d0,d1
										jsr     j_GetItemDefAddress
										btst    #6,8(a0)
										beq.w   loc_24F16
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										trap    #TEXTBOX
										dc.w $1B9               ; "The equipment is cursed.{W1}"
										bsr.w   FadeOut_WaitForP1Input
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24E8E
loc_24F16:
										
										move.w  ((word_FFB630-$1000000)).w,d1
										andi.w  #3,d1
										move.w  -2(a6),d0
										jsr     j_RemoveItemBySlot
										move.w  ((word_FFB634-$1000000)).w,d1
										move.w  d1,-(sp)
										move.w  ((BATTLESCENE_ACTION_TYPE-$1000000)).w,d1
										andi.w  #3,d1
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
										
										move.w  #3,((BATTLESCENE_ACTION_TYPE-$1000000)).w
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
										lea     (InitStack).w,a0
										jsr     sub_10004
										cmpi.w  #$FFFF,d0
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
										trap    #SOUND_COMMAND
										dc.w MUSIC_CURSED_ITEM
										trap    #TEXTBOX
										dc.w $1B9               ; "The equipment is cursed.{W1}"
										bsr.w   FadeOut_WaitForP1Input
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24F6E
loc_24FFA:
										
										move.w  ((word_FFB634-$1000000)).w,d1
										jsr     j_GetItemDefAddress
										btst    #4,8(a0)
										beq.w   loc_25022
										move.w  -2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $1BB               ; "Are you sure?"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24F6E
loc_25022:
										
										move.w  ((word_FFB634-$1000000)).w,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $2C                ; "The {ITEM} will be{N}discarded.  Are you sure?"
										jsr     j_YesNoChoiceBox
										trap    #TEXTBOX
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
loc_25066:
										
										trap    #TEXTBOX
										dc.w $2A                ; "Discarded the {ITEM}.{W2}"
										trap    #TEXTBOX
										dc.w $FFFF
										bra.w   loc_24746
loc_25072:
										
										cmpi.w  #$FFFF,((byte_FFB180-$1000000)).w
										bne.w   loc_25088
										move.w  #3,((BATTLESCENE_ACTION_TYPE-$1000000)).w
										clr.w   d0
										bra.w   loc_25188
loc_25088:
										
										move.w  -2(a6),d0
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										bsr.w   GetEntityPositionAfterApplyingFacing
										bsr.w   sub_256E6
										cmpi.w  #$FFFF,d3
										beq.s   loc_250B0
										move.w  d3,((TEXT_NAME_INDEX_1-$1000000)).w
										trap    #TEXTBOX
										dc.w $1A2               ; "{NAME} is distributing{N}items from the open chest.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d1
										bra.w   loc_24746
loc_250B0:
										
										jsr     (OpenChest).w
										trap    #TEXTBOX
										dc.w $193               ; "{NAME} opened the chest.{W2}{CLEAR}"
										move.w  ((byte_FFB180-$1000000)).w,d1
										andi.w  #ITEM_MASK_IDX,d1
										cmpi.w  #$7F,d1 
										beq.w   loc_25178
										move.w  -2(a6),d0
										bsr.w   GetEntityPositionAfterApplyingFacing
										move.w  d1,d2
										move.w  d0,d1
										jsr     sub_1AC054
										cmpi.w  #$FFFF,d0
										beq.w   loc_250FC
										move.w  #$80,((BATTLESCENE_ACTION_TYPE-$1000000)).w 
										move.w  d0,((word_FFB630-$1000000)).w
										move.w  d0,-4(a6)
										trap    #SOUND_COMMAND
										dc.w MUSIC_CORRUPTED_SAVE
										bsr.w   SpawnEnemySkipCamera
										bra.w   loc_25188
loc_250FC:
										
										move.w  ((byte_FFB180-$1000000)).w,d2
										cmpi.w  #$80,d2 
										blt.s   loc_25124
										bsr.w   GetChestGoldAmount
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										jsr     j_IncreaseGold
										trap    #SOUND_COMMAND
										dc.w MUSIC_ITEM
										trap    #TEXTBOX
										dc.w $19E               ; "{NAME} found {#} gold{N}coins."
										bsr.w   FadeOut_WaitForP1Input
										bra.w   loc_2517C
loc_25124:
										
										move.w  ((byte_FFB180-$1000000)).w,d1
										move.w  d1,((TEXT_NAME_INDEX_2-$1000000)).w
										move.w  -2(a6),d0
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										jsr     j_AddItem
										tst.w   d2
										bne.w   loc_2515A
										move.w  -2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  d1,((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #SOUND_COMMAND
										dc.w MUSIC_ITEM
										trap    #TEXTBOX
										dc.w $19F               ; "{NAME} recieved{N}{ITEM}."
										bsr.w   FadeOut_WaitForP1Input
										bra.w   loc_2517C
loc_2515A:
										
										trap    #TEXTBOX
										dc.w $19D               ; "{NAME} found{N}{ITEM}.{W2}{CLEAR}"
										trap    #TEXTBOX
										dc.w $1A3               ; "{NAME} hands are full.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										move.w  -2(a6),d0
										bsr.w   GetEntityPositionAfterApplyingFacing
										jsr     (CloseChest).w
										clr.w   d1
										bra.w   loc_24746
loc_25178:
										
										trap    #TEXTBOX
										dc.w $198               ; "But, it was empty.{W1}"
loc_2517C:
										
										trap    #TEXTBOX
										dc.w $FFFF
										move.w  #3,((BATTLESCENE_ACTION_TYPE-$1000000)).w
										clr.w   d0
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
										clr.w   ((MOVE_SOUND-$1000000)).w
										bsr.w   ControlUnitCursor
										btst    #INPUT_A_B_BIT,((P1_INPUT-$1000000)).w
										beq.s   BattlefieldMenuActions
										move.w  -2(a6),d0
										rts

	; End of function sub_2519E


; =============== S U B R O U T I N E =======================================

BattlefieldMenuActions:
										
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
										btst    #6,((P1_INPUT-$1000000)).w
										beq.s   loc_251F4
										jsr     j_MemberStatsScreen
										bra.s   loc_2521C
loc_251F4:
										
										cmp.w   -2(a6),d0
										bne.s   loc_251FC
										rts
loc_251FC:
										
										move.w  d0,((MOVING_BATTLE_ENTITY_IDX-$1000000)).w
										jsr     j_CreateFighterMiniStatusWindow
										jsr     j_CreateLandEffectWindow
										jsr     (WaitForPlayerInput).w
										jsr     j_HideLandEffectWindow
										jsr     j_HideFighterMiniStatusWindow
loc_2521C:
										
										cmp.w   -2(a6),d0
										bne.w   sub_2519E
										rts
loc_25226:
										
										addq.w  #1,d0
										cmpi.w  #$1E,d0
										bne.s   loc_25232
										move.w  #$80,d0 
loc_25232:
										
										dbf     d7,loc_251BC
loc_25236:
										
										lea     (InitStack).w,a0
										moveq   #0,d0
										moveq   #0,d1
										moveq   #4,d2
										jsr     j_ExecuteMenu
										cmpi.w  #$FFFF,d0
										beq.w   sub_2519E
										tst.w   d0
										bne.w   loc_25286
										jsr     j_UpdateForce
										move.w  ((NUMBER_OF_BATTLE_PARTY_MEMBERS-$1000000)).w,d7
										beq.s   loc_25236
										move.w  ((NUMBER_OF_BATTLE_PARTY_MEMBERS-$1000000)).w,d7
										move.w  d7,((word_FFB12E-$1000000)).w
										lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a0
										lea     ((byte_FFB0AE-$1000000)).w,a1
										jsr     (CopyBytes).w   
loc_25274:
										
										jsr     sub_10040
										tst.b   d0
										bmi.s   loc_25236
										jsr     j_MemberStatsScreen
										bra.s   loc_25274
loc_25286:
										
										cmpi.w  #1,d0
										bne.w   loc_25296
										jsr     sub_10034
										bra.s   loc_25236
loc_25296:
										
										cmpi.w  #2,d0
										bne.w   loc_252A6
										jsr     sub_10080
										bra.s   loc_25236
loc_252A6:
										
										tst.b   ((CURRENT_BATTLE-$1000000)).w
										beq.s   loc_25236
										trap    #TEXTBOX
										dc.w 0                  ; "The game will be suspended.{N}OK?"
										jsr     j_YesNoChoiceBox
										trap    #TEXTBOX
										dc.w $FFFF
										tst.w   d0
										bmi.w   loc_25236
										move.l  ((SECONDS_COUNTER-$1000000)).w,((SECONDS_COUNTER_FROM_SRAM-$1000000)).w
										trap    #SET_FLAG
										dc.w $58                ; checks if a game has been saved for copying purposes? (or if saved from battle?)
										move.w  ((SAVE_SLOT_BEING_USED-$1000000)).w,d0
										jsr     (SaveGame).l
										tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
										beq.w   loc_252E6
										btst    #INPUT_A_START_BIT,((P1_INPUT-$1000000)).w
										bne.w   loc_252F2
loc_252E6:
										
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_FADE_OUT
										jsr     (FadeOutToBlack).w
										jmp     (WitchSuspend).w
loc_252F2:
										
										trap    #CLEAR_FLAG
										dc.w $58                ; checks if a game has been saved for copying purposes? (or if saved from battle?)
										bra.w   loc_25236

	; End of function BattlefieldMenuActions


; =============== S U B R O U T I N E =======================================

sub_252FA:
										
										movem.l d0-a6,-(sp)
										move.w  -2(a6),d0
										jsr     j_GenerateTargetRangeLists
										bsr.w   CreateMoveableRangeForUnit
										move.w  -2(a6),d0
										move.w  -2(a6),d0
										bsr.w   UpdateMoveSound
										lea     (BATTLE_ENTITY_MOVE_STRING).l,a0
										jsr     MoveBattleEntityByMoveString
										move.w  -2(a6),d0
										move.w  d2,d1
										jsr     j_SetXPos
										move.w  d3,d1
										jsr     j_SetYPos
										bsr.w   ClearFadingBlockRange
										move.w  -2(a6),d0
										bsr.w   SetEntityBlinkingFlag
										move.w  ((BATTLESCENE_ACTION_TYPE-$1000000)).w,d0
										cmpi.w  #3,d0
										beq.w   loc_25480
										tst.w   d0
										bne.w   loc_2537E
										move.w  -2(a6),d0
										jsr     j_sub_C404
										jsr     (WaitForCameraToCatchUp).w
										bsr.w   CreateMoveableRangeForUnit
										clr.b   ((word_FFAF8E-$1000000)).w
										move.w  ((word_FFB630-$1000000)).w,d0
										move.w  d0,-4(a6)
										bsr.w   sub_2548E
										clr.w   d0
										bra.w   loc_2547A
loc_2537E:
										
										cmpi.w  #1,d0
										bne.w   loc_253BE
										move.w  ((word_FFB630-$1000000)).w,d1
										move.w  -2(a6),d0
										jsr     j_CreateSpellRangeGrid
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
										
										cmpi.w  #2,d0
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
										
										cmpi.w  #4,d0
										bne.w   loc_2544A
										move.w  ((word_FFB630-$1000000)).w,d1
										move.w  -2(a6),d0
										jsr     j_CreateSpellRangeGrid
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
										
										cmpi.w  #6,d0
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
										
										bsr.w   GetEntityNumberOfCombatant
										move.w  d4,d1
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).l    
										move.w  -4(a6),d0
										bsr.w   sub_2322C
										bsr.w   WaitForUnitCursor
										jsr     (WaitForCameraToCatchUp).w
										move.b  #1,((FIGHTER_IS_TARGETTING-$1000000)).w
										jsr     j_CreateFighterMiniStatusWindow
										moveq   #$F,d0
										jsr     (Sleep).w       
										trap    #SOUND_COMMAND
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
										
										lea     ((BATTLE_TURN_ORDER-$1000000)).w,a0
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
										lea     ((BATTLE_TURN_ORDER-$1000000)).w,a0
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
										clr.b   ((BATTLE_CURRENT_TURN_OFFSET-$1000000)).w
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
										andi.w  #CHAR_STATCAP_AGI_CURRENT,d1
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
										cmpi.w  #$80,d3 
										blt.s   return_2560E
										move.w  d3,d1
										andi.w  #CHAR_STATCAP_AGI_CURRENT,d1
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
										move.b  ((CURRENT_MAP-$1000000)).w,d1
										bsr.w   sub_258EA
										move.b  #$FF,((BATTLE_CURRENT_ENTITY-$1000000)).w
										jsr     (LoadMapTilesets).w
										bsr.w   WaitForFadeToFinish
										trap    #VINT_FUNCTIONS
										dc.w VINTS_CLEAR
										jsr     (WaitForVInt).w 
										jsr     j_MoveEntitiesToBattlePositions
										move.w  (sp)+,d0
										bsr.w   GetEntityNumberOfCombatant
										move.b  d0,((BATTLE_CURRENT_ENTITY-$1000000)).w
										bpl.s   loc_25646
										clr.w   d0
loc_25646:
										
										andi.w  #$3F,d0 
										lsl.w   #5,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										adda.w  d0,a0
										move.w  (a0)+,d0
										ext.l   d0
										divs.w  #$180,d0
										move.b  d0,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
										move.w  (a0)+,d0
										ext.l   d0
										divs.w  #$180,d0
										move.b  d0,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
										moveq   #$3F,d0 
										jsr     (InitSprites).w 
										move.w  #$FFFF,d0
										jsr     (LoadMap).w     
										jsr     (WaitForVInt).w 
										jsr     (LoadMapEntitySprites).w
										bsr.w   SetBattleVIntFuncs
										jsr     j_LoadBattleTerrainData
										jsr     (LoadBattleMusic).w
										jsr     (FadeInFromBlack).w
										cmpi.b  #BATTLEIDX_FAIRY_WOODS,((CURRENT_BATTLE-$1000000)).w
																						; if battle 44, then special battle !
										bne.s   return_256A0
										jsr     j_SpecialBattle
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
										bsr.w   GetEntityCombatantNumber
										lsl.w   #ENTITYDEF_SIZE_BITS,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
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
										cmpi.w  #$1E,d0
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
										trap    #TEXTBOX
										dc.w $FFFF
										rts

	; End of function PrintAllActivatedDefCons


; =============== S U B R O U T I N E =======================================

; if flag D1 is set, display def-con textbox

PrintActivatedDefCon:
										
										move.w  d1,-(sp)
										jsr     j_CheckFlag
										beq.s   loc_2578A
										subi.w  #$5A,d1 
										ext.l   d1
										move.l  d1,((TEXT_NUMBER-$1000000)).w
										trap    #TEXTBOX
										dc.w $1CF               ; "DEF-CON No. {#} has been{N}implemented.{D3}"
loc_2578A:
										
										move.w  (sp)+,d1
										addq.w  #1,d1
										rts

	; End of function PrintActivatedDefCon


; =============== S U B R O U T I N E =======================================

UpdateMoveSound:
										
										cmpi.b  #CODE_NOTHING_BYTE,((CURRENT_BATTLE-$1000000)).w
										bne.s   loc_2579E
										clr.w   ((MOVE_SOUND-$1000000)).w
										bra.s   loc_257A4
loc_2579E:
										
										move.w  #SFX_WALKING,((MOVE_SOUND-$1000000)).w
loc_257A4:
										
										movem.w d0-d7,-(sp)
										jsr     j_GetEquippedRing
										cmpi.w  #ITEMIDX_CHIRRUP_SANDALS,d1
										bne.s   loc_257BA
										move.w  #SFX_BLOAB,((MOVE_SOUND-$1000000)).w
loc_257BA:
										
										movem.w (sp)+,d0-d7
										rts

	; End of function UpdateMoveSound


; =============== S U B R O U T I N E =======================================

ExecuteExplorationLoop:
										
										clr.w   ((MAP_EVENT_TYPE-$1000000)).w
										subi.w  #$4E20,((word_FFB196-$1000000)).w
										bge.s   loc_257D0
										clr.w   ((word_FFB196-$1000000)).w
loc_257D0:
										
										jsr     HealAliveCharsAndImmortals
										jsr     sub_258EA(pc)
										nop
										move.b  #$FF,((BATTLE_CURRENT_ENTITY-$1000000)).w
										move.w  d0,-(sp)
										cmpi.b  #$FF,d0         ; map idx is FF, not provided
										beq.s   loc_25828
										move.b  d0,((CURRENT_MAP-$1000000)).w
										move.b  #$FF,((CURRENT_BATTLE-$1000000)).w
										movem.w d1-d3,-(sp)
										clr.w   d1
										move.b  ((CURRENT_MAP-$1000000)).w,d1
										jsr     (LoadMapTilesets).w
										movem.w (sp)+,d1-d3
										bsr.w   WaitForFadeToFinish
										trap    #VINT_FUNCTIONS
										dc.w VINTS_CLEAR
										jsr     j_GetMapSetupEntities
										jsr     j_InitMapEntities
										jsr     (LoadMapEntitySprites).w
										bsr.w   loc_2588A
										trap    #SET_FLAG
										dc.w $50                ; set @ loc_257D0 (battle won?)
										bra.s   loc_25836
loc_25828:
										
										bsr.w   WaitForFadeToFinish
										bsr.w   sub_258A8
										jsr     sub_440AC
loc_25836:
										
										jsr     (sub_4EC6).w
										move.w  (sp)+,d1
										move.w  #$FFFF,d0
										move.b  #0,((BATTLE_CURRENT_ENTITY-$1000000)).w
										jsr     (LoadMap).w     
										bsr.w   SetBattleVIntFuncs
										jsr     j_RunMapSetupInitFunction
										move.l  (dword_FFD084).l,d0
										cmp.l   (dword_FFD004).l,d0
										beq.s   loc_2586A       
										jsr     (LoadBattleMusic).w
										jsr     (FadeInFromBlack).w
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

	; End of function ExecuteExplorationLoop


; =============== S U B R O U T I N E =======================================

sub_258A8:
										
										movem.l d0-d3/a0,-(sp)
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
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
										jsr     j_GetCharacterSpriteIdx
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
										clr.w   ((byte_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										trap    #VINT_FUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l VInt_3930          
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
										
										move.w  ((MAP_EVENT_TYPE-$1000000)).w,d0
										bne.s   loc_25930       
										move.b  #0,((BATTLE_CURRENT_ENTITY-$1000000)).w
										clr.w   d0
										jsr     j_SetControlledEntityActScript
loc_25930:
										
										clr.w   d0              ; SECONDARY MAP LOOP - wait for map event
										clr.w   d1
										move.w  ((MAP_EVENT_TYPE-$1000000)).w,d0
										beq.s   loc_2593C
										rts
loc_2593C:
										
										move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
										andi.w  #$60,d1 
										beq.s   loc_25948
										rts
loc_25948:
										
										bra.s   loc_25930       

	; End of function WaitForEvent


; =============== S U B R O U T I N E =======================================

; deal with "system" event (RAM:a84a)

sub_2594A:
										
										clr.w   ((MAP_EVENT_TYPE-$1000000)).w
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
										trap    #SOUND_COMMAND
										dc.w SFX_BATTLEFIELD_DEATH
																						; big door slam ?
										rts
loc_25978:
										
										tst.b   ((byte_FFA84C-$1000000)).w
										bne.w   loc_259CC
										movem.w d0,-(sp)
										move.w  ((word_FFB1A8-$1000000)).w,d0
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_GET_D0_PARAMETER
										clr.w   ((word_FFB1A8-$1000000)).w
										movem.w (sp)+,d0
										clr.w   d0
										jsr     j_MakeEntityIdle
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
										jsr     j_MakeEntityIdle
										move.b  ((byte_FFA84D-$1000000)).w,d0
										cmpi.b  #$47,d0 
										bne.s   loc_259E8       ; HARDCODED check if map is pacalon, switch if water not restored
										trap    #CHECK_FLAG
										dc.w $212               ; Battle 30 completed
										beq.s   loc_259E8
										move.w  #$4E,d0 
loc_259E8:
										
										move.b  d0,((CURRENT_MAP-$1000000)).w
										moveq   #$FFFFFFFF,d0
										jsr     (sub_25B0).w
										move.b  ((byte_FFA84E-$1000000)).w,d0
										blt.s   loc_25A04
										mulu.w  #$180,d0
										move.w  d0,((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w
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
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
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
										jsr     j_RunMapSetupZoneEvent
										rts

; END OF FUNCTION CHUNK FOR sub_2594A


; =============== S U B R O U T I N E =======================================

; init vint contextual functions

SetBattleVIntFuncs:
										
										jsr     (InitWindowProperties).w
										trap    #VINT_FUNCTIONS
										dc.w VINTS_CLEAR
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_4744
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_UpdateEntities
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_AdjustCameraToPlayer
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_3930          
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_UpdateSprites
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_UpdateWindows
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_UpdateAnimatingTiles
										rts

	; End of function SetBattleVIntFuncs


; =============== S U B R O U T I N E =======================================

sub_25AD6:
										
										move.b  ((P1_INPUT-$1000000)).w,d7
										clr.w   d0
										jsr     j_MakeEntityIdle
										clr.w   d0
										jsr     j_WaitForEntityToStopMoving
										jsr     (WaitForCameraToCatchUp).l
										btst    #6,d7
										bne.w   loc_25BCC
										btst    #5,d7
										bne.w   loc_25B02
										rts
loc_25B02:
										
										tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
										beq.s   loc_25B40
										btst    #INPUT_A_B_BIT,((P2_INPUT-$1000000)).w
										beq.s   loc_25B22
										move.w  #$258,d0
										jsr     j_DebugFlagSetter
										jsr     j_ChurchActions
										rts
loc_25B22:
										
										btst    #INPUT_A_C_BIT,((P2_INPUT-$1000000)).w
										bne.w   loc_25BF4
										btst    #INPUT_A_A_BIT,((P2_INPUT-$1000000)).w
										beq.s   loc_25B40
										jsr     (FadeOutToBlack).w
										jsr     j_DebugModeSelectAction
										rts
loc_25B40:
										
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										cmpi.b  #$3E,$33(a0) 
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
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_FADE_OUT
										bsr.w   sub_25A6C
										trap    #SOUND_COMMAND
										dc.w MUSIC_HEADQUARTERS ; headquarters
										trap    #VINT_FUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l VInt_UpdateEntities
										trap    #VINT_FUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l VInt_AdjustCameraToPlayer
										jsr     j_CaravanActions
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l VInt_AdjustCameraToPlayer
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l VInt_UpdateEntities
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_FADE_OUT
										bsr.w   sub_25A74
										trap    #SOUND_COMMAND
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
										
										trap    #VINT_FUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l VInt_UpdateEntities
										trap    #VINT_FUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l VInt_AdjustCameraToPlayer
										jsr     j_MainMenuActions
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l VInt_AdjustCameraToPlayer
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l VInt_UpdateEntities
return_25BF2:
										
										rts
loc_25BF4:
										
										jsr     j_ExecuteDebugMapScript
										rts

	; End of function sub_25AD6

pt_SpecialSprites:  dc.l SpecialSprites_Taros
										dc.l SpecialSprites_Kraken
										dc.l SpecialSprites_NazcaShip
										dc.l SpecialSprites_EvilSpirit
										dc.l SpecialSprites_Zeon
										dc.l SpecialSprites_Zeon
										dc.l SpecialSprites_Kraken
										dc.l SpecialSprites_Kraken
										dc.l SpecialSprites_Kraken
										dc.l SpecialSprites_Kraken

; =============== S U B R O U T I N E =======================================

sub_25C24:
										
										movem.l d0-a1,-(sp)
										move.b  #$FF,d0
										sub.b   d1,d0
										andi.w  #$FF,d0
										move.w  d0,d1
										lsl.w   #2,d0
										movea.l pt_SpecialSprites(pc,d0.w),a0
										lea     (PALETTE_4_BIS).l,a1
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
										jsr     (LoadTileData).w
										movea.l (sp)+,a0
										lea     ($AF00).l,a1
										move.w  #$480,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										bra.w   loc_25CB0

	; End of function sub_25C6C


; =============== S U B R O U T I N E =======================================

sub_25C8E:
										
										lea     ((byte_FF4A00+$300)).l,a1
										move.l  a1,-(sp)
										jsr     (LoadTileData).w
										movea.l (sp)+,a0
										lea     ($A3C0).l,a1
										move.w  #$A20,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										bra.w   *+4
loc_25CB0:
										
										movem.l (sp)+,d0-a1
										rts

	; End of function sub_25C8E


; =============== S U B R O U T I N E =======================================

sub_25CB6:
										
										movem.l d0-d2/a0-a1,-(sp)
										lea     (SpecialSprites_EvilSpirit+$20)(pc), a0
										tst.w   d0
										beq.s   loc_25CD2
										cmpi.b  #1,d0
										bne.s   loc_25CCE
										lea     SpecialSprites_EvilSpiritAlt(pc), a0
										bra.s   loc_25CD2
loc_25CCE:
										
										lea     (SpecialSprites_Zeon+$20)(pc), a0
loc_25CD2:
										
										lea     (FF6802_LOADING_SPACE).l,a1
										move.l  a1,-(sp)
										jsr     (LoadTileData).w
										movea.l (sp)+,a0
										lea     ($AF00).l,a1
										move.w  #$480,d0
										moveq   #2,d1
										jsr     (sub_119E).w    
										jsr     (Set_FFDE94_bit3).w
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
										
										cmpi.b  #$F0,$13(a0)
										bcs.w   loc_25DF0
										move.b  #$FF,d6
										sub.b   $13(a0),d6
										andi.w  #$F,d6
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
										cmpi.b  #$F,d2
										ble.s   loc_25D56
										lea     byte_2784C(pc), a2
										bra.s   loc_25D5A
loc_25D56:
										
										lea     byte_2786C(pc), a2
loc_25D5A:
										
										btst    #4,$1D(a0)
										beq.s   loc_25D64
										addq.b  #2,d2
loc_25D64:
										
										btst    #0,((byte_FFDEA0-$1000000)).w
										beq.s   loc_25D7A
										addq.b  #1,d2
										cmpi.b  #$1E,d2
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
										lea     byte_2788C(pc), a0
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

SpecialSprites_Taros:
										incbin "graphics/specialsprites/taros.bin"
SpecialSprites_Kraken:
										incbin "graphics/specialsprites/kraken.bin"
SpecialSprites_NazcaShip:
										incbin "graphics/specialsprites/nazcaship.bin"
SpecialSprites_EvilSpirit:
										incbin "graphics/specialsprites/evilspirit.bin"
SpecialSprites_EvilSpiritAlt:
										incbin "graphics/specialsprites/evilspiritalt.bin"
SpecialSprites_Zeon:incbin "graphics/specialsprites/zeon.bin"
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
byte_2786C:         dc.b 0
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
byte_2788C:         dc.b 0
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
										dc.b   0
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
										jsr     (LoadTileData).w
										movea.l (sp)+,a0
										lea     ($8000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										jsr     (sub_119E).w    
										jsr     (SetFFDE94b3andWait).w
										movea.l (p_plt_SuspendString).l,a0
										lea     (PALLETE_2_BIS).l,a1
										moveq   #$20,d7 
										jsr     (CopyBytes).w   
										move.b  #1,((FADING_SETTING-$1000000)).w
										clr.w   ((byte_FFDFAA-$1000000)).w
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
										jsr     (sub_119E).w    
										jsr     (SetFFDE94b3andWait).w
										rts

	; End of function SuspendGame


; =============== S U B R O U T I N E =======================================

; need to verify

EndGame:
										bset    #7,(SAVE_FLAGS).l
										jsr     (DisableDisplayAndVInt).w
										movea.l (p_WitchEndTiles).l,a0
										lea     (FF6802_LOADING_SPACE).l,a1
										move.l  a1,-(sp)
										jsr     (LoadTileData).w
										movea.l (sp)+,a0
										lea     ($2000).w,a1
										move.w  #$2000,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										movea.l (p_WitchEndLayout).l,a0
										lea     (byte_FFE000).l,a1
										move.w  #$800,d7
										jsr     (CopyBytes).w   
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										lea     (byte_FFC000).l,a0
										move.l  #$21382139,$21E(a0)
										move.l  #$21422143,$25E(a0)
										lea     ($C000).l,a1
										move.w  #$380,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										movea.l (p_plt_WitchEnd).l,a0
										lea     (PALETTE_1_BIS).l,a1
										moveq   #$20,d7 
										jsr     (CopyBytes).w   
										lea     $20(a1),a1
										jsr     (CopyBytes).w   
										jsr     (EnableDisplayAndInterrupts).w
										move.w  #$3C,d0 
										jsr     (Sleep).w       
										jsr     (FadeInFromWhite).w
										move.w  #$1E,((BLINK_COUNTER-$1000000)).w
										move.b  #$FF,((byte_FFB082-$1000000)).w
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_WitchEndBlink
										move.w  #$46,((CURRENT_SPEAK_SOUND-$1000000)).w 
										trap    #TEXTBOX
										dc.w $EF                ; "{NAME;0}, I thank you.{N}You enabled me to return{N}to my original form.{D2}{D2}{N}Someday we'll meet again.{N}I'll never forget you....{D2}{D2}{D2}"
										trap    #TEXTBOX
										dc.w $FFFF
										move.w  #$5A,d0 
										jsr     (Sleep).w       
										move.b  #2,((FADING_SETTING-$1000000)).w
										clr.w   ((byte_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #1,((FADING_PALETTE_FLAGS-$1000000)).w
										moveq   #$3C,d0 
										jsr     (Sleep).w       
										clr.b   ((byte_FFB082-$1000000)).w
										trap    #VINT_FUNCTIONS
										dc.w VINTS_REMOVE
										dc.l VInt_WitchEndBlink
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_VscrollThing
										moveq   #$1E,d0
										jsr     (Sleep).w       
										move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
										clr.w   ((byte_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #2,((FADING_PALETTE_FLAGS-$1000000)).w
										moveq   #$3C,d0 
										jsr     (Sleep).w       
										trap    #VINT_FUNCTIONS
										dc.w VINTS_REMOVE
										dc.l VInt_VscrollThing
										jsr     (DisableDisplayAndVInt).w
										lea     (byte_FFC000).l,a0
										clr.l   $21E(a0)
										clr.l   $25E(a0)
										lea     ($C000).l,a1
										move.w  #$380,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										movea.l (p_JewelEndScreenTiles).l,a0
										lea     (FF6802_LOADING_SPACE).l,a1
										move.l  a1,-(sp)
										jsr     (LoadTileData).w
										movea.l (sp)+,a0
										lea     (loc_2000).w,a1
										move.w  #$2000,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										movea.l (p_JewelEndScreenLayout).l,a0
										lea     (byte_FFE000).l,a1
										move.w  #$800,d7
										jsr     (CopyBytes).w   
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										movea.l (p_plt_JewelsEndScreen).l,a0
										lea     (PALETTE_1_BIS).l,a1
										moveq   #$40,d7 
										jsr     (CopyBytes).w   
										jsr     (EnableDisplayAndInterrupts).w
										move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
										clr.w   ((byte_FFDFAA-$1000000)).w
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
										move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
										clr.w   ((byte_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #2,((FADING_PALETTE_FLAGS-$1000000)).w
										move.w  #$12C,d0
										jsr     (Sleep).w       
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_FADE_OUT
										move.w  #$2A30,d0       ; wait for 3 minutes
										jsr     (Sleep).w       
										trap    #TEXTBOX
										dc.w $1D1               ; "And more...{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  #3,((FADING_COUNTER_MAX-$1000000)).w
										jsr     (FadeOutToBlack).w
										lea     (PALETTE_1_BIS).l,a0
										moveq   #$1F,d7
loc_27C2C:
										
										clr.l   (a0)+
										dbf     d7,loc_27C2C
										jsr     j_ClearEntities
										trap    #SET_FLAG
										dc.w $190               ; Battle 0 unlocked
										move.w  #$3F,d0 
										jsr     (GetNextBattleOnMap).w
										move.w  d7,d1
										bsr.w   ExecuteBattleLoop
										jsr     (FadeOutToWhite).w
										trap    #VINT_FUNCTIONS
										dc.w VINTS_CLEAR
										jsr     (DisableDisplayAndVInt).w
										move    #$2700,sr
										movea.l (InitStack).w,sp
										movea.l (p_Start).w,a0  
										jmp     (a0)            ; reset

	; End of function EndGame


; =============== S U B R O U T I N E =======================================

sub_27C64:
										
										move.w  d0,-(sp)
										movea.l (p_JewelEndScreenLayout).l,a0
										lea     $700(a0),a0
										mulu.w  #$1E,d0
										adda.w  d0,a0
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

VInt_VscrollThing:
										
										subq.w  #1,(word_FFD500).l
										jsr     (StoreVdpCommandsbis).w
										jsr     (Set_FFDE94_bit3).w
										rts

	; End of function VInt_VscrollThing


; =============== S U B R O U T I N E =======================================

VInt_WitchEndBlink:
										
										link    a6,#-2
										tst.b   ((byte_FFB082-$1000000)).w
										beq.w   loc_27D6A
										clr.w   -2(a6)
										lea     ((BLINK_COUNTER-$1000000)).w,a2
										subq.w  #1,(a2)
										cmpi.w  #3,(a2)
										bne.s   loc_27CDC
										movea.l (p_WitchEndLayout).l,a0
										lea     $700(a0),a0
										lea     (byte_FFE0DC).l,a1
										move.w  #$403,d1
										jsr     (sub_7D28).w
										addq.w  #1,-2(a6)
loc_27CDC:
										
										tst.w   (a2)
										bne.s   loc_27D08
										movea.l (p_WitchEndLayout).l,a0
										lea     $720(a0),a0
										lea     (byte_FFE0DC).l,a1
										move.w  #$403,d1
										jsr     (sub_7D28).w
										addq.w  #1,-2(a6)
										moveq   #$78,d6 
										jsr     (UpdateRandomSeed).w
										addi.w  #$1E,d7
										move.w  d7,(a2)
loc_27D08:
										
										lea     ((word_FFB07C-$1000000)).w,a2
										tst.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
										bne.s   loc_27D1A
										cmpi.w  #5,(a2)
										ble.s   loc_27D42
										bra.s   loc_27D6A
loc_27D1A:
										
										subq.w  #1,(a2)
										cmpi.w  #5,(a2)
										bne.s   loc_27D3E
										movea.l (p_WitchEndLayout).l,a0
										lea     $718(a0),a0
										lea     (byte_FFE19C).l,a1
										move.w  #$401,d1
										jsr     (sub_7D28).w
										addq.w  #1,-2(a6)
loc_27D3E:
										
										tst.w   (a2)
										bne.s   loc_27D6A
loc_27D42:
										
										movea.l (p_WitchEndLayout).l,a0
										lea     $738(a0),a0
										lea     (byte_FFE19C).l,a1
										move.w  #$401,d1
										jsr     (sub_7D28).w
										addq.w  #1,-2(a6)
										moveq   #5,d6
										jsr     (UpdateRandomSeed).w
										addi.w  #$A,d7
										move.w  d7,(a2)
loc_27D6A:
										
										tst.w   -2(a6)
										beq.s   loc_27D8A
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$200,d0
										moveq   #2,d1
										jsr     (sub_119E).w    
										jsr     (Set_FFDE94_bit3).w
loc_27D8A:
										
										unlk    a6
										rts

	; End of function VInt_WitchEndBlink

										align $8000
