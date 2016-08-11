
; SCRIPT SECTION maps\entries\map38\mapsetups\s2 :
; 
ms_map38_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_5DBB6-ms_map38_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5DBC0-ms_map38_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5DBC6-ms_map38_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5DBCC-ms_map38_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5DBD2-ms_map38_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5DBE0-ms_map38_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5DBEA-ms_map38_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5DBF8-ms_map38_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5DC02-ms_map38_EntityEvents
										dc.b $89
										dc.b 0
										dc.w sub_5DC08-ms_map38_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_5DC56-ms_map38_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_5DCA4-ms_map38_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_5DCAC-ms_map38_EntityEvents
										dc.b $8D
										dc.b 1
										dc.w sub_5DCBA-ms_map38_EntityEvents
										dc.b $1A
										dc.b 1
										dc.w sub_5DCC8-ms_map38_EntityEvents
										dc.w $FD00
										dc.w nullsub_141-ms_map38_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5DBB6:
										
										trap    #TRAP_TEXTBOX
										dc.w $859               ; "Welcome to Roft.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $85A               ; "Every peaceful person is{N}welcome!{W1}"
										rts

	; End of function sub_5DBB6


; =============== S U B R O U T I N E =======================================

sub_5DBC0:
										
										trap    #TRAP_TEXTBOX
										dc.w $85B               ; "Mr. Petro and Mr. Paseran{N}came from the south.{W1}"
										rts

	; End of function sub_5DBC0


; =============== S U B R O U T I N E =======================================

sub_5DBC6:
										
										trap    #TRAP_TEXTBOX
										dc.w $85C               ; "{NAME;26}, are you OK?{N}You were captured by the{N}devils!{W1}"
										rts

	; End of function sub_5DBC6


; =============== S U B R O U T I N E =======================================

sub_5DBCC:
										
										trap    #TRAP_TEXTBOX
										dc.w $85D               ; "The devils kidnapped{N}Mr. Petro and stole the{N}Nazca Ship.{W1}"
										rts

	; End of function sub_5DBCC


; =============== S U B R O U T I N E =======================================

sub_5DBD2:
										
										trap    #TRAP_TEXTBOX
										dc.w $85E               ; "Mr. Paseran came here{N}through the tunnel in the{N}south.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $85F               ; "We've been told that devils{N}live there.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $860               ; "And we have seen many{N}devils here since he came{N}to Roft.{W1}"
										rts

	; End of function sub_5DBD2


; =============== S U B R O U T I N E =======================================

sub_5DBE0:
										
										trap    #TRAP_TEXTBOX
										dc.w $861               ; "Red Baron is a cruel killer.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $862               ; "He has smeared his armor with{N}the blood of his enemies.{W1}"
										rts

	; End of function sub_5DBE0


; =============== S U B R O U T I N E =======================================

sub_5DBEA:
										
										trap    #TRAP_TEXTBOX
										dc.w $863               ; "Do you know of Mithril?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $864               ; "Mithril weapons are awfully{N}strong.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $865               ; "They may help you in your{N}battles.{W1}"
										rts

	; End of function sub_5DBEA


; =============== S U B R O U T I N E =======================================

sub_5DBF8:
										
										trap    #TRAP_TEXTBOX
										dc.w $866               ; "We were able to find Mithril{N}on Grans before.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $867               ; "The Dwarven Blacksmith lives{N}in Grans Forest.{W1}"
										rts

	; End of function sub_5DBF8


; =============== S U B R O U T I N E =======================================

sub_5DC02:
										
										trap    #TRAP_TEXTBOX
										dc.w $868               ; "Nobody but the Dwarven{N}Blacksmith can work with{N}Mithril.{W1}"
										rts

	; End of function sub_5DC02


; =============== S U B R O U T I N E =======================================

sub_5DC08:
										
										trap    #1
										dc.w $38E
										beq.s   return_5DC54
										trap    #1
										dc.w $102
										beq.s   loc_5DC34
										trap    #1
										dc.w $38F
										beq.s   loc_5DC32
										trap    #1
										dc.w $100
										bne.s   loc_5DC2E
										trap    #TRAP_TEXTBOX
										dc.w $871               ; "(Sob...sob...){N}He's gone....{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $872               ; "We never had a chance to fly{N}in the Nazca Ship!{W1}"
										trap    #2
										dc.w $100
										bra.s   loc_5DC32
loc_5DC2E:
										
										trap    #TRAP_TEXTBOX
										dc.w $871               ; "(Sob...sob...){N}He's gone....{W2}"
loc_5DC32:
										
										bra.s   return_5DC54
loc_5DC34:
										
										trap    #1
										dc.w $38F
										beq.s   return_5DC54
										trap    #1
										dc.w $100
										bne.s   loc_5DC50
										trap    #TRAP_TEXTBOX
										dc.w $875               ; "The Nazca Ship crashed?{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $876               ; "I hope Petro gets on the{N}Nazca Ship in the great{N}beyond.{W1}"
										trap    #2
										dc.w $100
										bra.w   return_5DC54
loc_5DC50:
										
										trap    #TRAP_TEXTBOX
										dc.w $875               ; "The Nazca Ship crashed?{W1}"
return_5DC54:
										
										rts

	; End of function sub_5DC08


; =============== S U B R O U T I N E =======================================

sub_5DC56:
										
										trap    #1
										dc.w $38E
										beq.s   return_5DCA2
										trap    #1
										dc.w $102
										beq.s   loc_5DC82
										trap    #1
										dc.w $38F
										beq.s   loc_5DC80
										trap    #1
										dc.w $101
										bne.s   loc_5DC7C
										trap    #TRAP_TEXTBOX
										dc.w $873               ; "The devils killed Petro.{N}They lied to us!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $874               ; "How cruel they are!{W1}"
										trap    #2
										dc.w $101
										bra.s   loc_5DC80
loc_5DC7C:
										
										trap    #TRAP_TEXTBOX
										dc.w $873               ; "The devils killed Petro.{N}They lied to us!{W2}"
loc_5DC80:
										
										bra.s   return_5DCA2
loc_5DC82:
										
										trap    #1
										dc.w $38F
										beq.s   return_5DCA2
										trap    #1
										dc.w $101
										bne.s   loc_5DC9E
										trap    #TRAP_TEXTBOX
										dc.w $877               ; "The devils lied, and then{N}killed Petro.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $878               ; "Please defeat the devils for{N}him!{W1}"
										trap    #2
										dc.w $101
										bra.w   return_5DCA2
loc_5DC9E:
										
										trap    #TRAP_TEXTBOX
										dc.w $877               ; "The devils lied, and then{N}killed Petro.{W2}"
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
										
										move.b  #$D,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_5DCAC


; =============== S U B R O U T I N E =======================================

sub_5DCBA:
										
										move.b  #$1C,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_5DCBA


; =============== S U B R O U T I N E =======================================

sub_5DCC8:
										
										trap    #TRAP_TEXTBOX
										dc.w $869               ; "Huh!  Huh!{W1}"
										rts

	; End of function sub_5DCC8


; =============== S U B R O U T I N E =======================================

nullsub_141:
										
										rts

	; End of function nullsub_141

