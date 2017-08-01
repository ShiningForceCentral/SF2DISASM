
; ASM FILE code\common\menus\shop\shopactions.asm :
; 0x20064..0x20A02 : Shop functions

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

ShopItems:      incbin "data/stats/items/shopitems.bin"
