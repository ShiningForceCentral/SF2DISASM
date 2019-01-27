
; ASM FILE data\maps\entries\map38\mapsetups\s2.asm :
; 0x5DB76..0x5DCD0 : 
ms_map38_EntityEvents:
		msEntityEvent 128, UP, sub_5DBB6-ms_map38_EntityEvents
		msEntityEvent 129, UP, sub_5DBC0-ms_map38_EntityEvents
		msEntityEvent 130, UP, sub_5DBC6-ms_map38_EntityEvents
		msEntityEvent 131, UP, sub_5DBCC-ms_map38_EntityEvents
		msEntityEvent 132, UP, sub_5DBD2-ms_map38_EntityEvents
		msEntityEvent 133, UP, sub_5DBE0-ms_map38_EntityEvents
		msEntityEvent 134, UP, sub_5DBEA-ms_map38_EntityEvents
		msEntityEvent 135, UP, sub_5DBF8-ms_map38_EntityEvents
		msEntityEvent 136, UP, sub_5DC02-ms_map38_EntityEvents
		msEntityEvent 137, RIGHT, sub_5DC08-ms_map38_EntityEvents
		msEntityEvent 138, DOWN, sub_5DC56-ms_map38_EntityEvents
		msEntityEvent 139, UP, sub_5DCA4-ms_map38_EntityEvents
		msEntityEvent 140, UP, sub_5DCAC-ms_map38_EntityEvents
		msEntityEvent 141, UP, sub_5DCBA-ms_map38_EntityEvents
		msEntityEvent 26, UP, sub_5DCC8-ms_map38_EntityEvents
		msDefaultEntityEvent 0, nullsub_141-ms_map38_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5DBB6:
		 
		txt $859                ; "Welcome to Roft.{W2}"
		txt $85A                ; "Every peaceful person is{N}welcome!{W1}"
		rts

	; End of function sub_5DBB6


; =============== S U B R O U T I N E =======================================

sub_5DBC0:
		 
		txt $85B                ; "Mr. Petro and Mr. Paseran{N}came from the south.{W1}"
		rts

	; End of function sub_5DBC0


; =============== S U B R O U T I N E =======================================

sub_5DBC6:
		 
		txt $85C                ; "{NAME;26}, are you OK?{N}You were captured by the{N}devils!{W1}"
		rts

	; End of function sub_5DBC6


; =============== S U B R O U T I N E =======================================

sub_5DBCC:
		 
		txt $85D                ; "The devils kidnapped{N}Mr. Petro and stole the{N}Nazca Ship.{W1}"
		rts

	; End of function sub_5DBCC


; =============== S U B R O U T I N E =======================================

sub_5DBD2:
		 
		txt $85E                ; "Mr. Paseran came here{N}through the tunnel in the{N}south.{W2}"
		txt $85F                ; "We've been told that devils{N}live there.{W2}"
		txt $860                ; "And we have seen many{N}devils here since he came{N}to Roft.{W1}"
		rts

	; End of function sub_5DBD2


; =============== S U B R O U T I N E =======================================

sub_5DBE0:
		 
		txt $861                ; "Red Baron is a cruel killer.{W2}"
		txt $862                ; "He has smeared his armor with{N}the blood of his enemies.{W1}"
		rts

	; End of function sub_5DBE0


; =============== S U B R O U T I N E =======================================

sub_5DBEA:
		 
		txt $863                ; "Do you know of Mithril?{W2}"
		txt $864                ; "Mithril weapons are awfully{N}strong.{W2}"
		txt $865                ; "They may help you in your{N}battles.{W1}"
		rts

	; End of function sub_5DBEA


; =============== S U B R O U T I N E =======================================

sub_5DBF8:
		 
		txt $866                ; "We were able to find Mithril{N}on Grans before.{W2}"
		txt $867                ; "The Dwarven Blacksmith lives{N}in Grans Forest.{W1}"
		rts

	; End of function sub_5DBF8


; =============== S U B R O U T I N E =======================================

sub_5DC02:
		 
		txt $868                ; "Nobody but the Dwarven{N}Blacksmith can work with{N}Mithril.{W1}"
		rts

	; End of function sub_5DC02


; =============== S U B R O U T I N E =======================================

sub_5DC08:
		 
		chkFlg $38E             ; set after the initial scene on entering Roft (where the guy thinks you're Galam)
		beq.s   return_5DC54
		chkFlg $102             ; Temporary map setup flag 02
		beq.s   byte_5DC34      
		chkFlg $38F             ; set after the Petro death scene in Roft
		beq.s   loc_5DC32
		chkFlg $100             ; Temporary map setup flag 00
		bne.s   byte_5DC2E      
		txt $871                ; "(Sob...sob...){N}He's gone....{W2}"
		txt $872                ; "We never had a chance to fly{N}in the Nazca Ship!{W1}"
		setFlg $100             ; Temporary map setup flag 00
		bra.s   loc_5DC32
byte_5DC2E:
		txt $871                ; "(Sob...sob...){N}He's gone....{W2}"
loc_5DC32:
		bra.s   return_5DC54
byte_5DC34:
		chkFlg $38F             ; set after the Petro death scene in Roft
		beq.s   return_5DC54
		chkFlg $100             ; Temporary map setup flag 00
		bne.s   byte_5DC50      
		txt $875                ; "The Nazca Ship crashed?{W1}"
		txt $876                ; "I hope Petro gets on the{N}Nazca Ship in the great{N}beyond.{W1}"
		setFlg $100             ; Temporary map setup flag 00
		bra.w   return_5DC54
byte_5DC50:
		txt $875                ; "The Nazca Ship crashed?{W1}"
return_5DC54:
		rts

	; End of function sub_5DC08


; =============== S U B R O U T I N E =======================================

sub_5DC56:
		 
		chkFlg $38E             ; set after the initial scene on entering Roft (where the guy thinks you're Galam)
		beq.s   return_5DCA2
		chkFlg $102             ; Temporary map setup flag 02
		beq.s   byte_5DC82      
		chkFlg $38F             ; set after the Petro death scene in Roft
		beq.s   loc_5DC80
		chkFlg $101             ; Temporary map setup flag 01
		bne.s   byte_5DC7C      
		txt $873                ; "The devils killed Petro.{N}They lied to us!{W2}"
		txt $874                ; "How cruel they are!{W1}"
		setFlg $101             ; Temporary map setup flag 01
		bra.s   loc_5DC80
byte_5DC7C:
		txt $873                ; "The devils killed Petro.{N}They lied to us!{W2}"
loc_5DC80:
		bra.s   return_5DCA2
byte_5DC82:
		chkFlg $38F             ; set after the Petro death scene in Roft
		beq.s   return_5DCA2
		chkFlg $101             ; Temporary map setup flag 01
		bne.s   byte_5DC9E      
		txt $877                ; "The devils lied, and then{N}killed Petro.{W2}"
		txt $878                ; "Please defeat the devils for{N}him!{W1}"
		setFlg $101             ; Temporary map setup flag 01
		bra.w   return_5DCA2
byte_5DC9E:
		txt $877                ; "The devils lied, and then{N}killed Petro.{W2}"
return_5DCA2:
		rts

	; End of function sub_5DC56


; =============== S U B R O U T I N E =======================================

sub_5DCA4:
		jsr     j_ChurchActions
		rts

	; End of function sub_5DCA4


; =============== S U B R O U T I N E =======================================

sub_5DCAC:
		move.b  #$D,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_5DCAC


; =============== S U B R O U T I N E =======================================

sub_5DCBA:
		move.b  #$1C,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_5DCBA


; =============== S U B R O U T I N E =======================================

sub_5DCC8:
		 
		txt $869                ; "Huh!  Huh!{W1}"
		rts

	; End of function sub_5DCC8


; =============== S U B R O U T I N E =======================================

nullsub_141:
		rts

	; End of function nullsub_141

