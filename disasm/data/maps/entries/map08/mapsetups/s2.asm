
; ASM FILE data\maps\entries\map08\mapsetups\s2.asm :
; 0x56084..0x561AE : 
ms_map8_EntityEvents:
		dc.b $80
		dc.b 1
		dc.w sub_56090-ms_map8_EntityEvents
		dc.b $81
		dc.b 1
		dc.w sub_560AC-ms_map8_EntityEvents
		dc.w $FD00
		dc.w return_56144-ms_map8_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56090:
		trap    #CHECK_FLAG
		dc.w $100
		bne.s   loc_560A6
		trap    #SET_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
		trap    #TEXTBOX
		dc.w $529               ; "Our ancestors came from{N}Rune, a southern island,{N}long ago.{W2}"
		trap    #TEXTBOX
		dc.w $52A               ; "Since then, we've travelled{N}up here.{W2}"
		trap    #TEXTBOX
		dc.w $52B               ; "The mountains to the north{N}block our journey.{W2}"
loc_560A6:
		trap    #TEXTBOX
		dc.w $52C               ; "Are you going to{N}Mt. Volcano?{N}That's {NAME;7}'s hometown?{W1}"
		rts

	; End of function sub_56090


; =============== S U B R O U T I N E =======================================

sub_560AC:
		trap    #TEXTBOX
		dc.w $52D               ; "We won't hide from you{N}anymore.  Ribble has many{N}ancient ruins.{W1}"
		rts

	; End of function sub_560AC


; =============== S U B R O U T I N E =======================================

sub_560B2:
		trap    #TEXTBOX
		dc.w $52E               ; "Men are so selfish.{N}My husband has gone to the{N}east to work.  What about me?{W1}"
		rts

	; End of function sub_560B2


; =============== S U B R O U T I N E =======================================

j_j_ChurchActions:
		
		jmp     j_ChurchActions

	; End of function j_j_ChurchActions


; =============== S U B R O U T I N E =======================================

sub_560BE:
		trap    #TEXTBOX
		dc.w $52F               ; "Keseran is a historian.{N}But Mr. {NAME;11} is smarter{N}than him!{W2}"
		trap    #TEXTBOX
		dc.w $530               ; "I saw a strange hollow in a{N}tree.  Does something go{N}there?{W2}"
		trap    #TEXTBOX
		dc.w $531               ; "Is what you're looking for in{N}Ribble?{W1}"
		rts

	; End of function sub_560BE


; =============== S U B R O U T I N E =======================================

sub_560CC:
		trap    #CHECK_FLAG
		dc.w $2DB
		bne.s   loc_560DC
		trap    #TEXTBOX
		dc.w $532               ; "I can't find it!{W2}"
		trap    #TEXTBOX
		dc.w $533               ; "The hidden door to the{N}ancient ruins must be near{N}this tree!{W1}"
		bra.s   return_560E0
loc_560DC:
		trap    #TEXTBOX
		dc.w $545               ; "Wow, the ancient door!{N}I knew it was there!  I did!{W1}"
return_560E0:
		rts

	; End of function sub_560CC


; =============== S U B R O U T I N E =======================================

sub_560E2:
		move.b  #3,((CURRENT_SHOP_INDEX-$1000000)).w
		jmp     j_ShopActions

	; End of function sub_560E2


; =============== S U B R O U T I N E =======================================

sub_560EE:
		lea     cs_56172(pc), a0
		trap    #6
		rts

	; End of function sub_560EE


; =============== S U B R O U T I N E =======================================

sub_560F6:
		trap    #TEXTBOX
		dc.w $539               ; "Paseran and I are pupils{N}of Mr. {NAME;11} of Hassan.{W2}"
		trap    #TEXTBOX
		dc.w $53A               ; "The ancient ruins around here{N}are very interesting to us!{W2}"
		trap    #TEXTBOX
		dc.w $53B               ; "We're sure there are ruins{N}under Ribble, but we can't{N}find the door?{W2}"
		trap    #TEXTBOX
		dc.w $53C               ; "I'll find it before Paseran!{N}I think that tree has{N}something to do with it.{W1}"
		rts

	; End of function sub_560F6


; =============== S U B R O U T I N E =======================================

sub_56108:
		trap    #TEXTBOX
		dc.w $53D               ; "We recently came from Hassan.{N}Hassan is a port in the south.{W2}"
		trap    #TEXTBOX
		dc.w $53E               ; "It was once very prosperous,{N}but now it's desolate.{W1}"
		rts

	; End of function sub_56108


; =============== S U B R O U T I N E =======================================

sub_56112:
		trap    #TEXTBOX
		dc.w $53F               ; "My dad went to the cave in{N}the north.{W2}"
		trap    #TEXTBOX
		dc.w $540               ; "But, I'm not worried!{N}He's very strong.{W1}"
		rts

	; End of function sub_56112


; =============== S U B R O U T I N E =======================================

sub_5611C:
		trap    #TEXTBOX
		dc.w $541               ; "My dear husband never{N}returned from the cave.{W2}"
		trap    #TEXTBOX
		dc.w $542               ; "The cave was somehow{N}blocked.  How can I explain{N}this to my son?{W1}"
		rts

	; End of function sub_5611C


; =============== S U B R O U T I N E =======================================

sub_56126:
		move.b  #3,((CURRENT_SHOP_INDEX-$1000000)).w
		move.b  #$12,((CURRENT_SHOP_INDEX-$1000000)).w
		jmp     j_ShopActions

	; End of function sub_56126


; =============== S U B R O U T I N E =======================================

sub_56138:
		trap    #CHECK_FLAG
		dc.w 8
		bne.s   return_56144
		lea     cs_56146(pc), a0
		trap    #6
return_56144:
		rts

	; End of function sub_56138

cs_56146:       setActscript $8,$FF,eas_Init
		setActscript $8,$FF,eas_461AA
		faceEntity $8,$0
		textCursor $543
		nextSingleText $0,$8    ; "The people in this village{N}are cowards!{W2}{N}When do they ever go{N}adventuring?{N}I can't take it anymore!{W2}{N}Hey, would you mind if I{N}joined you?{W1}"
		join $8
		nextSingleText $0,$8    ; "Now, let's go!{W1}"
		addNewFollower $8
		csc_end
cs_56172:       textCursor $534
		nextSingleText $0,$87   ; "To Mt. Volcano?{W1}"
		setActscript $87,$0,eas_Jump
		setActscript $86,$FF,eas_Jump
		setFacing $86,0
		setFacing $87,2
		csWait 57
		setFacing $86,3
		nextText $0,$86         ; "Go east and then go north{N}along the river.  A cave is{N}there.{W2}"
		nextSingleText $0,$86   ; "But, I don't recommend you{N}enter such a terrible place!{W1}"
		setFacing $87,3
		nextText $0,$87         ; "We call it the Cave of{N}Darkness.  You can't see{N}anything inside.{W2}"
		nextSingleText $0,$87   ; "The cave is the only way to{N}get to Mt. Volcano.{W1}"
		csc_end
