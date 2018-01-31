
; ASM FILE data\maps\entries\map13\mapsetups\s2.asm :
; 0x5801E..0x5814C : 
ms_map13_EntityEvents:
		dc.b 9
		dc.b 1
		dc.w sub_58108-ms_map13_EntityEvents
		dc.b $80
		dc.b 1
		dc.w sub_58056-ms_map13_EntityEvents
		dc.b $81
		dc.b 1
		dc.w sub_58072-ms_map13_EntityEvents
		dc.b $82
		dc.b 0
		dc.w sub_58078-ms_map13_EntityEvents
		dc.b $83
		dc.b 1
		dc.w sub_58090-ms_map13_EntityEvents
		dc.b $84
		dc.b 1
		dc.w sub_5809E-ms_map13_EntityEvents
		dc.b $85
		dc.b 3
		dc.w sub_580AC-ms_map13_EntityEvents
		dc.b $86
		dc.b 3
		dc.w sub_580C6-ms_map13_EntityEvents
		dc.b $87
		dc.b 1
		dc.w sub_580CE-ms_map13_EntityEvents
		dc.b $88
		dc.b 1
		dc.w sub_580D4-ms_map13_EntityEvents
		dc.b $89
		dc.b 3
		dc.w sub_580DA-ms_map13_EntityEvents
		dc.b $8A
		dc.b 3
		dc.w sub_58102-ms_map13_EntityEvents
		dc.b $8C
		dc.b 0
		dc.w sub_5810E-ms_map13_EntityEvents
		dc.w $FD00
		dc.w nullsub_116-ms_map13_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_58056:
		trap    #CHECK_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
		bne.s   loc_58068
		trap    #TEXTBOX
		dc.w $58C               ; "How did you come to{N}Polca Village?{W2}"
		trap    #TEXTBOX
		dc.w $58D               ; "Through the cave?{N}Nobody has come to this{N}village since...{W2}"
		trap    #SET_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
loc_58068:
		trap    #TEXTBOX
		dc.w $58E               ; "Oh, you defeated that{N}hobgoblin?  Wow!{W2}"
		trap    #TEXTBOX
		dc.w $58F               ; "Now we can use that tunnel{N}to travel between Polca and{N}the wilderness area!{W1}"
		rts

	; End of function sub_58056


; =============== S U B R O U T I N E =======================================

sub_58072:
		trap    #TEXTBOX
		dc.w $590               ; "Breathe deeply....{W2}{N}Wonderful air, huh?{W1}"
		rts

	; End of function sub_58072


; =============== S U B R O U T I N E =======================================

sub_58078:
		trap    #CHECK_FLAG
		dc.w $2C7               ; set after you dislodge the turtle/fairy in Polca
		bne.s   loc_5808A
		lea     cs_58512(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2C7               ; set after you dislodge the turtle/fairy in Polca
		bra.s   return_5808E
loc_5808A:
		trap    #TEXTBOX
		dc.w $591               ; "In ancient times, there{N}were magic tunnels.{W2}{N}People traveled easily{N}through the tunnels.{W1}"
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
		trap    #CHECK_FLAG
		dc.w $2C6               ; set after Oddler wanders down from the mountain
		bne.s   loc_580B8
		trap    #TEXTBOX
		dc.w $592               ; "To the east is the sacred{N}area of Volcanon.{W1}"
		bra.s   return_580C4
loc_580B8:
		trap    #TEXTBOX
		dc.w $5B9               ; "He came down from the{N}mountain....{W2}"
		trap    #TEXTBOX
		dc.w $5BA               ; "He's not from Polca, or{N}Bedoe....{W2}"
		trap    #TEXTBOX
		dc.w $5BB               ; "Where did he come from?{W1}"
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
		trap    #TEXTBOX
		dc.w $593               ; "Mt. Volcano is home to{N}beastmen.{W2}{N}We were a warlike tribe, but{N}we've almost forgotten how{N}to fight.{W1}"
		rts

	; End of function sub_580CE


; =============== S U B R O U T I N E =======================================

sub_580D4:
		trap    #TEXTBOX
		dc.w $594               ; "Young men these days are{N}lucky!  I wish I was young{N}again!{W1}"
		rts

	; End of function sub_580D4


; =============== S U B R O U T I N E =======================================

sub_580DA:
		trap    #CHECK_FLAG
		dc.w $2C6               ; set after Oddler wanders down from the mountain
		bne.s   loc_580FC
		trap    #CHECK_FLAG
		dc.w $101
		bne.s   loc_580F2
		lea     cs_58116(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $101
		bra.s   loc_580FA
loc_580F2:
		trap    #TEXTBOX
		dc.w $597               ; "Whoa!  Mt. Volcano erupted!{W2}"
		trap    #TEXTBOX
		dc.w $598               ; "It's an evil omen.{W1}"
loc_580FA:
		bra.s   return_58100
loc_580FC:
		trap    #TEXTBOX
		dc.w $5B7               ; "Oh, this is serious!{N}I hope he survives the night.{W1}"
return_58100:
		rts

	; End of function sub_580DA


; =============== S U B R O U T I N E =======================================

sub_58102:
		trap    #TEXTBOX
		dc.w $599               ; "Clank!  Clank!{N}All of our weapons are made{N}by me!{W2}{N}But, who uses them in this{N}peaceful country?{W1}"
		rts

	; End of function sub_58102


; =============== S U B R O U T I N E =======================================

sub_58108:
		trap    #TEXTBOX
		dc.w $59A               ; "Hirsute?  'Cause I'm a{N}beastman.{W2}{N}I'm not hairy enough though.{N}I envy those hairy guys!{W1}"
		rts

	; End of function sub_58108


; =============== S U B R O U T I N E =======================================

sub_5810E:
		trap    #TEXTBOX
		dc.w $5B8               ; "Ah...stop...no!{N}I don't want...to see....{N}My...head...aches....{W1}"
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
