
; ASM FILE data\maps\entries\map13\mapsetups\s2.asm :
; 0x5801E..0x5814C : 
ms_map13_EntityEvents:
		msEntityEvent 9, UP, sub_58108-ms_map13_EntityEvents
		msEntityEvent 128, UP, sub_58056-ms_map13_EntityEvents
		msEntityEvent 129, UP, sub_58072-ms_map13_EntityEvents
		msEntityEvent 130, RIGHT, sub_58078-ms_map13_EntityEvents
		msEntityEvent 131, UP, sub_58090-ms_map13_EntityEvents
		msEntityEvent 132, UP, sub_5809E-ms_map13_EntityEvents
		msEntityEvent 133, DOWN, sub_580AC-ms_map13_EntityEvents
		msEntityEvent 134, DOWN, sub_580C6-ms_map13_EntityEvents
		msEntityEvent 135, UP, sub_580CE-ms_map13_EntityEvents
		msEntityEvent 136, UP, sub_580D4-ms_map13_EntityEvents
		msEntityEvent 137, DOWN, sub_580DA-ms_map13_EntityEvents
		msEntityEvent 138, DOWN, sub_58102-ms_map13_EntityEvents
		msEntityEvent 140, RIGHT, sub_5810E-ms_map13_EntityEvents
		msDefaultEntityEvent 0, nullsub_116-ms_map13_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_58056:
		 
		chkFlg $100             ; Temporary map setup flag 00
		bne.s   byte_58068      
		txt $58C                ; "How did you come to{N}Polca Village?{W2}"
		txt $58D                ; "Through the cave?{N}Nobody has come to this{N}village since...{W2}"
		setFlg $100             ; Temporary map setup flag 00
byte_58068:
		txt $58E                ; "Oh, you defeated that{N}hobgoblin?  Wow!{W2}"
		txt $58F                ; "Now we can use that tunnel{N}to travel between Polca and{N}the wilderness area!{W1}"
		rts

	; End of function sub_58056


; =============== S U B R O U T I N E =======================================

sub_58072:
		 
		txt $590                ; "Breathe deeply....{W2}{N}Wonderful air, huh?{W1}"
		rts

	; End of function sub_58072


; =============== S U B R O U T I N E =======================================

sub_58078:
		 
		chkFlg $2C7             ; set after you dislodge the turtle/fairy in Polca
		bne.s   byte_5808A      
		lea     cs_58512(pc), a0
		trap    #6
		setFlg $2C7             ; set after you dislodge the turtle/fairy in Polca
		bra.s   return_5808E
byte_5808A:
		txt $591                ; "In ancient times, there{N}were magic tunnels.{W2}{N}People traveled easily{N}through the tunnels.{W1}"
return_5808E:
		rts

	; End of function sub_58078


; =============== S U B R O U T I N E =======================================

sub_58090:
		move.b  #4,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_58090


; =============== S U B R O U T I N E =======================================

sub_5809E:
		move.b  #$13,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_5809E


; =============== S U B R O U T I N E =======================================

sub_580AC:
		 
		chkFlg $2C6             ; set after Oddler wanders down from the mountain
		bne.s   byte_580B8      
		txt $592                ; "To the east is the sacred{N}area of Volcanon.{W1}"
		bra.s   return_580C4
byte_580B8:
		txt $5B9                ; "He came down from the{N}mountain....{W2}"
		txt $5BA                ; "He's not from Polca, or{N}Bedoe....{W2}"
		txt $5BB                ; "Where did he come from?{W1}"
return_580C4:
		rts

	; End of function sub_580AC


; =============== S U B R O U T I N E =======================================

sub_580C6:
		jsr     j_ChurchActions
		rts

	; End of function sub_580C6


; =============== S U B R O U T I N E =======================================

sub_580CE:
		 
		txt $593                ; "Mt. Volcano is home to{N}beastmen.{W2}{N}We were a warlike tribe, but{N}we've almost forgotten how{N}to fight.{W1}"
		rts

	; End of function sub_580CE


; =============== S U B R O U T I N E =======================================

sub_580D4:
		 
		txt $594                ; "Young men these days are{N}lucky!  I wish I was young{N}again!{W1}"
		rts

	; End of function sub_580D4


; =============== S U B R O U T I N E =======================================

sub_580DA:
		 
		chkFlg $2C6             ; set after Oddler wanders down from the mountain
		bne.s   byte_580FC      
		chkFlg $101             ; Temporary map setup flag 01
		bne.s   byte_580F2      
		lea     cs_58116(pc), a0
		trap    #6
		setFlg $101             ; Temporary map setup flag 01
		bra.s   loc_580FA
byte_580F2:
		txt $597                ; "Whoa!  Mt. Volcano erupted!{W2}"
		txt $598                ; "It's an evil omen.{W1}"
loc_580FA:
		bra.s   return_58100
byte_580FC:
		txt $5B7                ; "Oh, this is serious!{N}I hope he survives the night.{W1}"
return_58100:
		rts

	; End of function sub_580DA


; =============== S U B R O U T I N E =======================================

sub_58102:
		 
		txt $599                ; "Clank!  Clank!{N}All of our weapons are made{N}by me!{W2}{N}But, who uses them in this{N}peaceful country?{W1}"
		rts

	; End of function sub_58102


; =============== S U B R O U T I N E =======================================

sub_58108:
		 
		txt $59A                ; "Hirsute?  'Cause I'm a{N}beastman.{W2}{N}I'm not hairy enough though.{N}I envy those hairy guys!{W1}"
		rts

	; End of function sub_58108


; =============== S U B R O U T I N E =======================================

sub_5810E:
		 
		txt $5B8                ; "Ah...stop...no!{N}I don't want...to see....{N}My...head...aches....{W1}"
		rts

	; End of function sub_5810E


; =============== S U B R O U T I N E =======================================

nullsub_116:
		rts

	; End of function nullsub_116

cs_58116:       textCursor $595
		nextSingleText $0,$89   ; "You're not aware, but{N}Volcanon has become{N}irritated...{W1}"
		csWait 30
		setQuake 32770
		setQuake 16386
		nextSingleText $0,$89   ; "...like that!  And, it's getting{N}worse.{N}What's wrong you ask?{W1}"
		csWait 60
		playSound SFX_BIG_DOOR_RUMBLE
		setQuake 5
		flashScreenWhite $46
		setQuake 0
		headshake $89
		nextText $0,$89         ; "Whoa!  Mt. Volcano erupted!{W2}"
		nextSingleText $0,$89   ; "It's an evil omen.{W1}"
		csc_end
