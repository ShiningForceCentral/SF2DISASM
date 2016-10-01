
; SCRIPT SECTION maps\entries\map09\mapsetups\s2 :
; 
ms_map9_EntityEvents:
										dc.b $B
										dc.b 0
										dc.w sub_567E6-ms_map9_EntityEvents
										dc.b $C
										dc.b 3
										dc.w sub_56842-ms_map9_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_56756-ms_map9_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5675C-ms_map9_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_56762-ms_map9_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_56768-ms_map9_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_56776-ms_map9_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_56784-ms_map9_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5678C-ms_map9_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_567C8-ms_map9_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_567D2-ms_map9_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_567D8-ms_map9_EntityEvents
										dc.w $FD00
										dc.w nullsub_114-ms_map9_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56756:
										
										trap    #TRAP_TEXTBOX
										dc.w $553               ; "Hassan is a port town.{W2}{N}But, we've had no trading{N}recently.{W1}"
										rts

	; End of function sub_56756


; =============== S U B R O U T I N E =======================================

sub_5675C:
										
										trap    #TRAP_TEXTBOX
										dc.w $554               ; "Our ancestors came here from{N}Rune by way of the sea.{W2}{N}They should've avoided such{N}an inconvenient place like{N}this.{W1}"
										rts

	; End of function sub_5675C


; =============== S U B R O U T I N E =======================================

sub_56762:
										
										trap    #TRAP_TEXTBOX
										dc.w $565               ; "I think I'll take a nap{N}now.  Bye.{W1}"
										rts

	; End of function sub_56762


; =============== S U B R O U T I N E =======================================

sub_56768:
										
										move.b  #6,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_56768


; =============== S U B R O U T I N E =======================================

sub_56776:
										
										move.b  #$15,((RAM_CurrentShopIdx-$1000000)).w
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
										
										trap    #TRAP_CHECKFLAG
										dc.w $2D5               ; set after telling Rohde that you're going to get the Caravan
										bne.s   loc_567C2
										trap    #TRAP_TEXTBOX
										dc.w $555               ; "Dr. {NAME;11} lives in the{N}house over there.{W2}"
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
										trap    #TRAP_TEXTBOX
										dc.w $556               ; "He is eccentric.{N}He hates talking, but...{W2}{N}a historical topic may{N}interest him.{W1}"
										bra.s   return_567C6
loc_567C2:
										
										trap    #TRAP_TEXTBOX
										dc.w $55A               ; "Dr. {NAME;11}!  Hmmm,{N}are you a magician?{W1}"
return_567C6:
										
										rts

	; End of function sub_5678C


; =============== S U B R O U T I N E =======================================

sub_567C8:
										
										trap    #TRAP_TEXTBOX
										dc.w $557               ; "How on earth did you come{N}to Hassan?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $558               ; "By raft?  Wow!{N}You killed the Kraken?!{W1}"
										rts

	; End of function sub_567C8


; =============== S U B R O U T I N E =======================================

sub_567D2:
										
										trap    #TRAP_TEXTBOX
										dc.w $559               ; "The river is drying up{N}because of the drought.{W2}{N}To the west?{N}If you really want to go,{N}ask Dr. {NAME;11}....{W1}"
										rts

	; End of function sub_567D2


; =============== S U B R O U T I N E =======================================

sub_567D8:
										
										move.b  #7,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_567D8


; =============== S U B R O U T I N E =======================================

sub_567E6:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2D7               ; set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
										bne.s   loc_5682A
										moveq   #$3D,d1 
										jsr     j_sub_9146
										cmpi.w  #$FFFF,d0
										bne.s   loc_56804
										trap    #TRAP_TEXTBOX
										dc.w $55B               ; "Yes, I'm {NAME;11}.{N}I'm really busy now.{W2}{N}Time is dear to me.{N}Please don't bother me.{W1}"
										trap    #TRAP_SETFLAG
										dc.w $31E               ; set after talking to Rohde in Hassan if you DON'T have the Achilles Sword?
										bra.s   loc_56828
loc_56804:
										
										trap    #TRAP_CHECKFLAG
										dc.w $31E               ; set after talking to Rohde in Hassan if you DON'T have the Achilles Sword?
										bne.s   loc_5681E
										trap    #TRAP_TEXTBOX
										dc.w $55B               ; "Yes, I'm {NAME;11}.{N}I'm really busy now.{W2}{N}Time is dear to me.{N}Please don't bother me.{W1}"
										jsr     j_HidePortraitWindow
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										moveq   #$28,d0 
										jsr     (Sleep).w       
loc_5681E:
										
										lea     cs_569BC(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $2D7               ; set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
loc_56828:
										
										bra.s   return_56840
loc_5682A:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2D5               ; set after telling Rohde that you're going to get the Caravan
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
										
										trap    #TRAP_CHECKFLAG
										dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
										bne.s   return_56852
										lea     cs_56B02(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
return_56852:
										
										rts

	; End of function sub_56842


; =============== S U B R O U T I N E =======================================

nullsub_114:
										
										rts

	; End of function nullsub_114

