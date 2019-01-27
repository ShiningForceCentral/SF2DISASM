
; ASM FILE data\maps\entries\map09\mapsetups\s2.asm :
; 0x56722..0x56856 : 
ms_map9_EntityEvents:
		msEntityEvent 11, RIGHT, sub_567E6-ms_map9_EntityEvents
		msEntityEvent 12, DOWN, sub_56842-ms_map9_EntityEvents
		msEntityEvent 128, UP, sub_56756-ms_map9_EntityEvents
		msEntityEvent 129, UP, sub_5675C-ms_map9_EntityEvents
		msEntityEvent 130, UP, sub_56762-ms_map9_EntityEvents
		msEntityEvent 131, UP, sub_56768-ms_map9_EntityEvents
		msEntityEvent 132, UP, sub_56776-ms_map9_EntityEvents
		msEntityEvent 133, DOWN, sub_56784-ms_map9_EntityEvents
		msEntityEvent 134, UP, sub_5678C-ms_map9_EntityEvents
		msEntityEvent 135, UP, sub_567C8-ms_map9_EntityEvents
		msEntityEvent 136, UP, sub_567D2-ms_map9_EntityEvents
		msEntityEvent 137, UP, sub_567D8-ms_map9_EntityEvents
		msDefaultEntityEvent 0, nullsub_114-ms_map9_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56756:
		 
		txt $553                ; "Hassan is a port town.{W2}{N}But, we've had no trading{N}recently.{W1}"
		rts

	; End of function sub_56756


; =============== S U B R O U T I N E =======================================

sub_5675C:
		 
		txt $554                ; "Our ancestors came here from{N}Rune by way of the sea.{W2}{N}They should've avoided such{N}an inconvenient place like{N}this.{W1}"
		rts

	; End of function sub_5675C


; =============== S U B R O U T I N E =======================================

sub_56762:
		 
		txt $565                ; "I think I'll take a nap{N}now.  Bye.{W1}"
		rts

	; End of function sub_56762


; =============== S U B R O U T I N E =======================================

sub_56768:
		move.b  #6,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_56768


; =============== S U B R O U T I N E =======================================

sub_56776:
		move.b  #$15,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_56776


; =============== S U B R O U T I N E =======================================

sub_56784:
		jsr     j_ChurchActions
		rts

	; End of function sub_56784


; =============== S U B R O U T I N E =======================================

sub_5678C:
		 
		chkFlg $2D5             ; set after telling Rohde that you're going to get the Caravan
		bne.s   byte_567C2      
		txt $555                ; "Dr. {NAME;11} lives in the{N}house over there.{W2}"
		move.w  #$86,d0 
		moveq   #3,d1
		jsr     sub_4781A
		moveq   #$28,d0 
		jsr     (Sleep).w       
		move.w  #$86,d0 
		move.b  ((byte_FFB651-$1000000)).w,d1
		addq.w  #2,d1
		andi.w  #3,d1
		jsr     sub_4781A
		txt $556                ; "He is eccentric.{N}He hates talking, but...{W2}{N}a historical topic may{N}interest him.{W1}"
		bra.s   return_567C6
byte_567C2:
		txt $55A                ; "Dr. {NAME;11}!  Hmmm,{N}are you a magician?{W1}"
return_567C6:
		rts

	; End of function sub_5678C


; =============== S U B R O U T I N E =======================================

sub_567C8:
		 
		txt $557                ; "How on earth did you come{N}to Hassan?{W2}"
		txt $558                ; "By raft?  Wow!{N}You killed the Kraken?!{W1}"
		rts

	; End of function sub_567C8


; =============== S U B R O U T I N E =======================================

sub_567D2:
		 
		txt $559                ; "The river is drying up{N}because of the drought.{W2}{N}To the west?{N}If you really want to go,{N}ask Dr. {NAME;11}....{W1}"
		rts

	; End of function sub_567D2


; =============== S U B R O U T I N E =======================================

sub_567D8:
		move.b  #7,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_567D8


; =============== S U B R O U T I N E =======================================

sub_567E6:
		 
		chkFlg $2D7             ; set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
		bne.s   byte_5682A      
		moveq   #$3D,d1 
		jsr     j_sub_9146
		cmpi.w  #$FFFF,d0
		bne.s   byte_56804      
		txt $55B                ; "Yes, I'm {NAME;11}.{N}I'm really busy now.{W2}{N}Time is dear to me.{N}Please don't bother me.{W1}"
		setFlg $31E             ; set after talking to Rohde in Hassan if you DON'T have the Achilles Sword?
		bra.s   loc_56828
byte_56804:
		chkFlg $31E             ; set after talking to Rohde in Hassan if you DON'T have the Achilles Sword?
		bne.s   loc_5681E
		txt $55B                ; "Yes, I'm {NAME;11}.{N}I'm really busy now.{W2}{N}Time is dear to me.{N}Please don't bother me.{W1}"
		jsr     j_HidePortraitWindow
		clsTxt
		moveq   #$28,d0 
		jsr     (Sleep).w       
loc_5681E:
		lea     cs_569BC(pc), a0
		trap    #6
		setFlg $2D7             ; set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
loc_56828:
		bra.s   return_56840
byte_5682A:
		chkFlg $2D5             ; set after telling Rohde that you're going to get the Caravan
		bne.s   return_56840
		move.w  #$B,d0
		jsr     sub_47832
		lea     cs_56AE6(pc), a0
		trap    #6
return_56840:
		rts

	; End of function sub_567E6


; =============== S U B R O U T I N E =======================================

sub_56842:
		 
		chkFlg $100             ; Temporary map setup flag 00
		bne.s   return_56852
		lea     cs_56B02(pc), a0
		trap    #6
		setFlg $100             ; Temporary map setup flag 00
return_56852:
		rts

	; End of function sub_56842


; =============== S U B R O U T I N E =======================================

nullsub_114:
		rts

	; End of function nullsub_114

