
; ASM FILE data\maps\entries\map08\mapsetups\s2.asm :
; 0x56084..0x561AE : 
ms_map8_EntityEvents:
		msEntityEvent 128, UP, sub_56090-ms_map8_EntityEvents
		msEntityEvent 129, UP, sub_560AC-ms_map8_EntityEvents
		msDefaultEntityEvent 0, return_56144-ms_map8_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56090:
		 
		chkFlg $100             ; Temporary map setup flag 00
		bne.s   byte_560A6      
		setFlg $100             ; Temporary map setup flag 00
		txt $529                ; "Our ancestors came from{N}Rune, a southern island,{N}long ago.{W2}"
		txt $52A                ; "Since then, we've travelled{N}up here.{W2}"
		txt $52B                ; "The mountains to the north{N}block our journey.{W2}"
byte_560A6:
		txt $52C                ; "Are you going to{N}Mt. Volcano?{N}That's {NAME;7}'s hometown?{W1}"
		rts

	; End of function sub_56090


; =============== S U B R O U T I N E =======================================

sub_560AC:
		 
		txt $52D                ; "We won't hide from you{N}anymore.  Ribble has many{N}ancient ruins.{W1}"
		rts

	; End of function sub_560AC


; =============== S U B R O U T I N E =======================================

sub_560B2:
		 
		txt $52E                ; "Men are so selfish.{N}My husband has gone to the{N}east to work.  What about me?{W1}"
		rts

	; End of function sub_560B2


; =============== S U B R O U T I N E =======================================

j_j_ChurchActions:
		
		jmp     j_ChurchActions

	; End of function j_j_ChurchActions


; =============== S U B R O U T I N E =======================================

sub_560BE:
		 
		txt $52F                ; "Keseran is a historian.{N}But Mr. {NAME;11} is smarter{N}than him!{W2}"
		txt $530                ; "I saw a strange hollow in a{N}tree.  Does something go{N}there?{W2}"
		txt $531                ; "Is what you're looking for in{N}Ribble?{W1}"
		rts

	; End of function sub_560BE


; =============== S U B R O U T I N E =======================================

sub_560CC:
		 
		chkFlg $2DB             ; set after you open the tree in Ribble with the wooden plank
		bne.s   byte_560DC      
		txt $532                ; "I can't find it!{W2}"
		txt $533                ; "The hidden door to the{N}ancient ruins must be near{N}this tree!{W1}"
		bra.s   return_560E0
byte_560DC:
		txt $545                ; "Wow, the ancient door!{N}I knew it was there!  I did!{W1}"
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
		 
		txt $539                ; "Paseran and I are pupils{N}of Mr. {NAME;11} of Hassan.{W2}"
		txt $53A                ; "The ancient ruins around here{N}are very interesting to us!{W2}"
		txt $53B                ; "We're sure there are ruins{N}under Ribble, but we can't{N}find the door?{W2}"
		txt $53C                ; "I'll find it before Paseran!{N}I think that tree has{N}something to do with it.{W1}"
		rts

	; End of function sub_560F6


; =============== S U B R O U T I N E =======================================

sub_56108:
		 
		txt $53D                ; "We recently came from Hassan.{N}Hassan is a port in the south.{W2}"
		txt $53E                ; "It was once very prosperous,{N}but now it's desolate.{W1}"
		rts

	; End of function sub_56108


; =============== S U B R O U T I N E =======================================

sub_56112:
		 
		txt $53F                ; "My dad went to the cave in{N}the north.{W2}"
		txt $540                ; "But, I'm not worried!{N}He's very strong.{W1}"
		rts

	; End of function sub_56112


; =============== S U B R O U T I N E =======================================

sub_5611C:
		 
		txt $541                ; "My dear husband never{N}returned from the cave.{W2}"
		txt $542                ; "The cave was somehow{N}blocked.  How can I explain{N}this to my son?{W1}"
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
		 
		chkFlg $8               ; May joined
		bne.s   return_56144
		lea     cs_56146(pc), a0
		trap    #6
return_56144:
		rts

	; End of function sub_56138

cs_56146:       setActscriptWait $8,eas_Init
		setActscriptWait $8,eas_461AA
		faceEntity $8,$0
		textCursor $543
		nextSingleText $0,$8    ; "The people in this village{N}are cowards!{W2}{N}When do they ever go{N}adventuring?{N}I can't take it anymore!{W2}{N}Hey, would you mind if I{N}joined you?{W1}"
		join $8
		nextSingleText $0,$8    ; "Now, let's go!{W1}"
		addNewFollower $8
		csc_end
cs_56172:       textCursor $534
		nextSingleText $0,$87   ; "To Mt. Volcano?{W1}"
		setActscript $87,eas_Jump
		setActscriptWait $86,eas_Jump
		setFacing $86,RIGHT
		setFacing $87,LEFT
		csWait 57
		setFacing $86,DOWN
		nextText $0,$86         ; "Go east and then go north{N}along the river.  A cave is{N}there.{W2}"
		nextSingleText $0,$86   ; "But, I don't recommend you{N}enter such a terrible place!{W1}"
		setFacing $87,DOWN
		nextText $0,$87         ; "We call it the Cave of{N}Darkness.  You can't see{N}anything inside.{W2}"
		nextSingleText $0,$87   ; "The cave is the only way to{N}get to Mt. Volcano.{W1}"
		csc_end
